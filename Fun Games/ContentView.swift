//
//  ContentView.swift
//  Fun Games
//
//  Created by Kushagra sharma on 02/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var options = ["Rock🪨       ", "   Paper📑  ", " Scissors✂️"].shuffled()
    
    @State private var appAnswer = Int.random(in: 0...2)
    @State private var result = false
    @State private var player = 0
    @State private var opponent = 0
    @State private var chance = 10
    @State private var title = ""
    @State private var ShowingScore = false
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: .cyan, location: 0.4),
                
                    .init(color: .yellow, location:0.5)
                
            
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
           
            
            VStack (spacing:30){
                Spacer()
                Spacer()
                Text("Rock-Paper-Scissors")
                    .italic()
                    .bold()
                    .font(.system(size: 33))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                
                VStack(spacing:35){
               
                    Text("Select one option")
                    .fontDesign(.rounded)
                    .fontWeight(.heavy)
                    
                        .font(.system(size: 25))
                    
                    
                        ForEach(0..<3){number in
                            Button(options[number]) {
                                Tapped(number)
                                
                            }
                    .background(.black)
                    .font(.system(size: 40))
                    .fontWeight(.black)
                    .bold()
                    .clipShape(Capsule())
                    .foregroundColor(.mint)
                    .shadow(radius:20)
                    }
                Spacer()
                }
                .frame(maxWidth:.infinity)
                .padding(.vertical,30)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                
                Text("Your Score = \(player)")
                    .fontWeight(.black)
                    .foregroundColor(Color.black)
                    .padding()
                    .buttonBorderShape(.capsule)
                    .clipShape(.capsule)
                    .bold()
                    .background(.blue)
                    .font(.system(size: 15))
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
                
                Text("Opponent Score = \(opponent)")
                    .fontWeight(.black)
                    .foregroundColor(Color.black)
                    .padding()
                    .buttonBorderShape(.capsule)
                    .clipShape(.capsule)
                    .bold()
                    .background(.red)
                    .font(.system(size: 15))
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
                Spacer()
                Spacer()
                    
            }
            
            .padding()
            .alert(title, isPresented: $ShowingScore){
                Button("Continue", action: nextQuestion)
            }
          
            .alert(title,isPresented: $result){
                Button("Reset", action: Reset)
                
            }message: {
                Text("Your Score \(player)/10")
            }
        }
    }
        
        func Tapped (_ number:Int){
            
            if (options[number] == "Rock🪨       " && options[appAnswer] == " Scissors✂️"){
                player = player + 1
                chance = chance - 1
                title = """
           You Won!!🔥
           Opponent -> \(options[appAnswer])
        """
            }else if(options[number] == " Scissors✂️" && options[appAnswer] == "   Paper📑  "){
                player = player + 1
                chance = chance - 1
                title = """
           You Won!!🔥
           Opponent ->\(options[appAnswer])
        """
            }else if(options[number] == "   Paper📑  " && options[appAnswer] == "Rock🪨       "){
                player = player + 1
                chance = chance - 1
                title = """
           You Won!!🔥
           Opponent ->\(options[appAnswer])
        """
            }else if(options[number] == options[appAnswer]){
                player = player
                chance = chance - 1
                title = """
           Draw-- 🤝🏻
           Opponent ->\(options[appAnswer])
        """
            }else{
                player = player
                opponent = opponent + 1;
                chance = chance - 1;
                title = """
           You Lose..🤦🏻‍♂️
           Opponent ->\(options[appAnswer])
        """
            }
            if chance == 0 {
                
                if player>opponent {
                    title = """
           Bang! You won😎😎!!
           Opponent ->\(options[appAnswer])
        """
                    
                } else if player == opponent {
                    title = """
           It's a Draw🤷🏼‍♂️🤷🏼‍♂️
           Opponent ->\(options[appAnswer])
        """
                }else {
                    title = """
           You Lost, Better luck next time🥲🥲
           Opponent ->\(options[appAnswer])
        """
                }
                result = true
            } else{
                ShowingScore = true
            }
            
            
            
        }
        func nextQuestion(){
            options.shuffle()
            appAnswer = Int.random(in: 0...2)
        }
        func Reset(){
            player = 0
            opponent = 0
            chance = 10
            
        }
        
}


#Preview {
    ContentView()
}
