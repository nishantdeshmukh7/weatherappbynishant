import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HourlyForecastView()
                .tabItem {
                    Label("Hourly", systemImage: "clock")
                }
            CityView()
                .tabItem {
                    Label("City", systemImage: "house")
                }
        }
    }
}

struct CityView: View {
    var body: some View {
        
        ZStack {
            Background(topColor: .black, bottomColor: .white)
            VStack {
                CityTextView(cityName: "Mumbai")
                
                MainWeatherStatus(imageName: "cloud.sun.fill", temperature: 76)
                
                    
                
                VStack {
                    HStack {
                        WeatherDayView(DayOfWeek: "19 MAR", imageName: "cloud.rain.fill", temperature: 74)
                        WeatherDayView(DayOfWeek: "20 MAR", imageName: "cloud.rain.fill", temperature: 75)
                        WeatherDayView(DayOfWeek: "21 MAR", imageName: "cloud.sun.rain.fill", temperature: 77)
                        WeatherDayView(DayOfWeek: "22 MAR", imageName: "cloud.rain.fill", temperature: 73)
                        WeatherDayView(DayOfWeek: "23 MAR", imageName: "cloud.rain.fill", temperature: 74)
                    }
                    
                    HStack {
                        WeatherDayView(DayOfWeek: "24 MAR", imageName: "cloud.sun.rain.fill", temperature: 76)
                        WeatherDayView(DayOfWeek: "25 MAR", imageName: "cloud.sun.rain.fill", temperature: 74)
                        WeatherDayView(DayOfWeek: "26 MAR", imageName: "cloud.rain.fill", temperature: 72)
                        WeatherDayView(DayOfWeek: "27", imageName: "cloud.rain.fill", temperature: 75)
                        WeatherDayView(DayOfWeek: "28", imageName: "cloud.rain.fill", temperature: 75)
                    }
                }
                .padding()
                
                Spacer()
                
             
        }
    }
}

struct WeatherDayView: View {
    var DayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(DayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct Background: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomLeading)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatus: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

    
}

struct WeatherData: Identifiable {
    let id = UUID()
    let time: Date
    let temperature: Double
    let condition: String
}

struct HourlyWeatherRow: View {
    let data: WeatherData

    var body: some View {
        HStack {
            Text(formatDate(date: data.time))
            Text("\(Int(data.temperature))°")
            Text(data.condition)
        }
    }

    private func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: date)
    }
}

struct HourlyForecastView: View {
    @State private var mockData: [WeatherData] = []

    var body: some View {
        List(mockData) { data in
            HourlyWeatherRow(data: data)
        }
        .onAppear(perform: loadMockData)
    }

    private func loadMockData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.mockData = [
                WeatherData(time: Calendar.current.date(byAdding: .minute, value: 30, to: Date())!, temperature: 72.0, condition: "Partly Cloudy"),
                WeatherData(time: Calendar.current.date(byAdding: .hour, value: 1, to: Date())!, temperature: 74.0, condition: "Sunny"),
                WeatherData(time: Calendar.current.date(byAdding: .hour, value: 2, to: Date())!, temperature: 70.0, condition: "Cloudy"),
                
                WeatherData(time: Calendar.current.date(byAdding: .hour, value: 3, to: Date())!, temperature: 70.0, condition: "Partly Cloudy"),
                WeatherData(time: Calendar.current.date(byAdding: .hour, value: 4, to: Date())!, temperature: 70.0, condition: "Sunny"),
                WeatherData(time: Calendar.current.date(byAdding: .hour, value: 5, to: Date())!, temperature: 70.0, condition: "Partly Cloudy"),
                WeatherData(time: Calendar.current.date(byAdding: .hour, value: 6, to: Date())!, temperature: 70.0, condition: "Cloudy"),
                WeatherData(time: Calendar.current.date(byAdding: .hour, value: 7, to: Date())!, temperature: 70.0, condition: "Sunny"),
                WeatherData(time: Calendar.current.date(byAdding: .hour, value: 8, to: Date())!, temperature: 70.0, condition: "Cloudy"),
                WeatherData(time: Calendar.current.date(byAdding: .hour, value: 9, to: Date())!, temperature: 70.0, condition: "Cloudy"),
                WeatherData(time: Calendar.current.date(byAdding: .hour, value: 10, to: Date())!, temperature: 70.0, condition: "Partly Cloudy"),
                WeatherData(time: Calendar.current.date(byAdding: .hour, value: 11, to: Date())!, temperature: 70.0, condition: "Cloudy"),
                WeatherData(time: Calendar.current.date(byAdding: .hour, value: 12, to: Date())!, temperature: 70.0, condition: "Sunny"),
                WeatherData(time: Calendar.current.date(byAdding: .hour, value: 13, to: Date())!, temperature: 70.0, condition: "Sunny"),
                WeatherData(time: Calendar.current.date(byAdding: .hour, value: 14, to: Date())!, temperature: 70.0, condition: "Partly Cloudy"),
                WeatherData(time: Calendar.current.date(byAdding: .hour, value: 15, to: Date())!, temperature: 70.0, condition: "Cloudy"),
                WeatherData(time: Calendar.current.date(byAdding: .hour, value: 16, to: Date())!, temperature: 70.0, condition: "Cloudy"),
                WeatherData(time: Calendar.current.date(byAdding: .hour, value: 17, to: Date())!, temperature: 70.0, condition: "Cloudy"),
                WeatherData(time: Calendar.current.date(byAdding: .hour, value: 18, to: Date())!, temperature: 70.0, condition: "Cloudy"),
                WeatherData(time: Calendar.current.date(byAdding: .hour, value: 19, to: Date())!, temperature: 70.0, condition: "Cloudy"),
                WeatherData(time: Calendar.current.date(byAdding: .hour, value: 20, to: Date())!, temperature: 70.0, condition: "Cloudy"),
                WeatherData(time: Calendar.current.date(byAdding: .hour, value: 21, to: Date())!, temperature: 70.0, condition: "Cloudy"),
                WeatherData(time: Calendar.current.date(byAdding: .hour, value: 22, to: Date())!, temperature: 70.0, condition: "Sunny"),
                WeatherData(time: Calendar.current.date(byAdding: .hour, value: 23, to: Date())!, temperature: 70.0, condition: "Cloudy"),
                
            ]
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
