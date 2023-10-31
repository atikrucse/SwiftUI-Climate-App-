//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Atik  on 23/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Cupatino, CA")
                MainWeatherStausView(weatherImage: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                     temp: 96)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayName: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temp: 76)
                    
                    WeatherDayView(dayName: "WED",
                                   imageName: "sun.max.fill",
                                   temp: 96)
                    
                    WeatherDayView(dayName: "THU",
                                   imageName: "wind",
                                   temp: 55)
                    
                    WeatherDayView(dayName: "FRI",
                                   imageName: "wind.snow",
                                   temp: 36)
                    
                    WeatherDayView(dayName: "SAT",
                                   imageName: "snowflake",
                                   temp: 26)
                }
                
                Spacer()
                
                Button(
                    action: {
                        isNight.toggle()
                    }, label: {
                        WeatherButton(title: "Change Day Time",
                                      backgroundColor: .white,
                                      foregroundColor: .blue)
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayName: String
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack {
            Text(dayName)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(.white )
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
//        LinearGradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")],
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStausView: View {
    var weatherImage: String
    var temp: Int
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: weatherImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct WeatherButton: View {
    
    var title: String
    var backgroundColor: Color
    var foregroundColor: Color
    
    var body: some View {
        Text(title)
                .frame(width: 280, height: 50)
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(10 )
    }
}
