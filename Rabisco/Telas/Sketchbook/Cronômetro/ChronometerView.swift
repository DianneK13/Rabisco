//
//  ChronometerView.swift
//  Rabisco
//
//  Created by Maria Clara Rodrigues de Almeida on 25/05/26.
//

import SwiftUI

struct ChronometerView: View {
    
    @State private var time = 0
    @State private var isRunning = false
    @State private var timer: Timer?
    
    @State private var showPauseView = false
    @State private var showPopUp = false
    
    var body: some View {
        VStack{
            Text("Você consegue!")
            
            // Estrutura do StopWatch
            Text(String(format: "\(convertSecondsToTimeString(time))"))
                .font(.system(size: 64))
                .monospacedDigit()
                .padding()
            
            HStack {
                // Encerrar atividade?
                Button(action: {
                    showPopUp = true
                }) {
                    Image(systemName: "stop")
                        .bold()
                }
                .padding()
                .foregroundStyle(Color.primary)
                .glassEffect()
                
                // Pausar atividade
                Button(action: {
                    if isRunning {
                        stopTimer()
                    } else {
                        startTimer()
                    }
                }) {
                    Image(systemName: isRunning ? "pause" : "play")
                        .bold()
                }
                .padding()
                .foregroundStyle(.primary)
                .glassEffect()
            }
        }
        .toolbarVisibility(Visibility.hidden, for: ToolbarPlacement.tabBar)
        .onAppear {
            startTimer()
        }
        .fullScreenCover(isPresented: $showPauseView) {
            PauseView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay {
            if showPopUp {
                ZStack {
                    Color.black
                        .opacity(0.2)
                    
                        .onTapGesture {
                            withAnimation {
                                showPopUp = false
                            }
                        }
                    
                    VStack {
                        Text("Finalizar atividade?")
                            .font(.title)
                        Text("Você será redirecionado para a tela de registro.")
                            .font(.title2)
                        HStack (spacing: 40) {
                            // Não encerrar
                            Button {
                                withAnimation {
                                    showPopUp = false
                                }
                            } label: {
                                Text("Não")
                            }
                            .buttonStyle(.glass)
                            
                            Button {
                                
                                // abre camera
                                withAnimation {
                                    showPopUp = true
                                }
                            } label: {
                                Text("Finalizar")
                            }
                            .buttonStyle(.glassProminent)
                           
                            // Encerrar
                            
                            
                        }
                        .shadow(radius: 10)
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 10).fill(Color(.systemBackground))
                    }
                    
                    .frame(maxWidth: 400)
                    
                    
                }
                .transition(.opacity.combined(with: .scale)) //smooth
            }
        }
        .ignoresSafeArea()
    }
    
    private func convertSecondsToTimeString(_ seconds: Int) -> String {
        let minutes = (seconds % 3600) / 60
        let seconds = (seconds % 60)
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func startTimer() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            time += 1
        }
    }
    
    private func stopTimer() {
        isRunning = false
        showPauseView = true
        timer?.invalidate()
    }
    
    private func resetTimer() {
        showPauseView = false
        stopTimer()
        time = 0
    }
}

func stopWatch(time: Int) {
    
}



#Preview {
    ChronometerView()
}
