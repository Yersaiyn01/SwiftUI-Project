import SwiftUI

struct ContentView: View {
    
    @State private var Isknights = false
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: Isknights ? .black :.blue,
                           bottomColor: Isknights ? .gray : Color("Lighgreen"))
            VStack {
                MyloveView( CityName : "Kyzylorda")

                MainViewWeather(ImageName: Isknights ? "moon.fill" :"cloud.snow", temperature: Isknights ? -30 : -20)
                
                    HStack(spacing: 25){
                        WeatherDayView(dayOfWeek: "TUE", imageName: Isknights ? "moon.fill" :"cloud.snow.fill", temperature:Isknights ? -37 : -25)
                        
                        WeatherDayView(dayOfWeek: "THU", imageName:Isknights ? "moon.dust.fill" : "cloud.rain.fill",
                            temperature:Isknights ? -10: 1)
                        
                        WeatherDayView(dayOfWeek: "FRI", imageName:Isknights ? "sparkles" : "sun.max.fill", temperature: Isknights ? -1 : 10)
                        
                        WeatherDayView(dayOfWeek: "SAT", imageName:Isknights ? "cloud.drizzle.fill" : "cloud.snow.fill", temperature: Isknights ? -15 : -10)
                        
                        WeatherDayView(dayOfWeek: "MON", imageName:Isknights ? "moon.haze" : "cloud.snow.fill", temperature:
                                        Isknights ? -5:-19)
                        
                        WeatherDayView(dayOfWeek: "SUN", imageName:Isknights ? "cloud.heavyrain.fill" : "cloud.snow.fill", temperature: Isknights ? -10: -19)
                    }
                Spacer()
                
                Button {
                    Isknights.toggle()
                } label:{
                    ButtomColor(title: "Mode",
                                TextColor: .blue,
                                BackgroundColor: .black )
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack{
            Text(dayOfWeek)
            .font(.system(size: 16, weight: .medium, design: .default))
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
struct BackgroundView: View{
    var topColor: Color
    var bottomColor: Color
    var body: some View{
            LinearGradient(
                gradient:Gradient(colors:[topColor, bottomColor]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
    }
}

struct MyloveView: View{
    var CityName: String
    var body : some View{
        Text(CityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}
struct MainViewWeather: View{
    var ImageName: String
    var temperature: Int
    var body : some View{
        VStack(spacing: 8) {
            Image(systemName: ImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)

            Text("\(temperature)")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom , 40)
    }
}
