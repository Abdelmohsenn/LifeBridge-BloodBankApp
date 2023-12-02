//
//  User.swift
//  SWEBloodBridge
//
//  Created by muhammad abdelmohsen on 18/11/2023.
//

import Foundation
import SwiftUI

struct AuthenticationView: View {
    @State private var isUser = false
    @State private var isInstitution = false
    
    var body: some View {
        VStack(spacing: 20) {
            Image("lifebridge")
                .resizable()
                .padding([.leading, .bottom, .trailing], 20.0)
                .frame(width: 400, height: 320)
                .alignmentGuide(.top) { _ in 0 } // Aligns the image at the top
            
            Button(action: {
                isUser = true
            }) {
                Text("I'm a User")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.red)
                    .cornerRadius(20) // Round the corners
                    .shadow(color: .gray, radius: 5, x: 0, y: 5) // Add a shadow effect
                    .padding(.horizontal)
            }
            .background(
                NavigationLink("", destination: User_View(),isActive: $isUser)
                    .navigationTitle("")

                
            )
            
            Button(action: {
                isInstitution = true
            }) {
                Text("I'm an Institution")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.red)
                    .cornerRadius(20) // Round the corners
                    .shadow(color: .gray, radius: 5, x: 0, y: 5) // Add a shadow effect
                    .padding(.horizontal)
            }
            .background(
                NavigationLink("", destination: EmptyView(),isActive: $isInstitution)
                    .navigationTitle("")

            )
        }
    }
}


struct User_View: View {
    @State private var showNewView  = false
    @State private var showNewView2 = false
    @State private var showNewView3 = false
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Image("lifebridge")
                    .resizable()
                    .padding([.leading, .bottom, .trailing], 20.0)
                    .frame(width: 400, height: 320)
                    .alignmentGuide(.top) { _ in 0 } // Aligns the image at the top
                
                NavigationLink(destination: LOGINview(), isActive: $showNewView) {
                    Text("Login")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.red)
                        .cornerRadius(20) // Round the corners
                        .shadow(color: .gray, radius: 5, x: 0, y: 5) // Add a shadow effect
                        .padding(.horizontal)
                    
                }
                .navigationTitle("")
                
                NavigationLink(destination: SIGNupView(), isActive: $showNewView2) {
                    Text("Not part of LifeBridge?                                Create your Account now")
                        .underline(true)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.white) // Background color
                        .cornerRadius(20) // Round the corners
                        .shadow(color: .gray, radius: 5, x: 0, y: 5) // Add a shadow effect
                        .padding()
                }
                .navigationTitle(" SignUp ")
                
                NavigationLink(destination: ForgotPassView(), isActive: $showNewView3)
                {
                    Text("Forgot Password?")
                        .font(.custom("Times New Roman", size: 15))
                        .underline(true, color: .black)
                        .foregroundColor(.black)
                        .padding(-3)
                }
                .navigationTitle("")
            }
        }.navigationBarBackButtonHidden(true)
        
    }


    
}
struct LOGINview: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showMainMenu = false

    var body: some View {
        ZStack {
            Image("Image 1")
                .resizable()
                .foregroundColor(Color.red)
                .opacity(0.18)
            
            VStack(spacing: 0) {
                (Text("Login").padding()
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .frame(height: 30).padding()
                    .background(.white)
                    .cornerRadius(20)
                    .shadow(color: .red, radius: 5, x: 0, y: 5)
                ).padding(.bottom, 70.0)
                
                VStack(spacing: 8) {
                    Text("Enter Your Email:")
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                    
                    TextField("Your Email..", text: $email)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50.0)
                        .padding(.horizontal, 20)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1))
                        .padding()
                }
                
                VStack(spacing: 8) {
                    Text("Enter Your Password:")
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                    
                    SecureField("Your Password..", text: $password)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50.0)
                        .padding(.horizontal, 20)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1))
                        .padding()
                }
                
                Button(action: {
                    showMainMenu = true
                }) {
                    Text("Log In")
                        .font(.headline)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .fontWeight(.bold)
                        .cornerRadius(15)
                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
                }.padding()
            }
        }
        .background(
            NavigationLink("", destination: WelcomeMenu()
                .navigationBarTitle("") // Clear the title
                ,isActive: $showMainMenu)
        )
        
        
    }
}




struct SIGNupView: View {
    @State var email: String = ""
    @State var pass: String = ""
    @State private var Confirmpassword: String = ""
    @State var BLOOD = false
    @State var selectedBloodType:String = ""
    
    
    var body: some View {
        ZStack{ Image("Image 1")
                .renderingMode(.original)
                .resizable()
                .opacity(0.18)
            VStack(spacing:0) {
                
                HStack(spacing:0) {
                    Text("Be part of ")
                        .font(.title3)
                        .fontWeight(.heavy)
                        .foregroundColor(.black) // Set the color of the first part to black
                    
                    Text("LifeBridge")
                        .font(.title3)
                        .fontWeight(.heavy)
                        .foregroundColor(.red) // Set the color of "BloodBridge" to red
                    
                    Text("!")
                        .font(.title3)
                        .fontWeight(.heavy)
                        .foregroundColor(.black) // Set the color of the exclamation mark to black
                }
                .frame(height: 30)
                .padding()
                .background(Color.white) // Set the background color to white
                .cornerRadius(20)
                .shadow(color: .red, radius: 5, x: 0, y: 5)
                .padding(.bottom, 50.0)
                
                
                Text("Enter Your Email")
                    .foregroundColor(.black)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding(.top, 20)
                
                TextField("Your Email..", text: $email)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(height: 50.0)
                    .padding(.horizontal, 20)
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1))
                    .padding()
                
                Text("Enter Your Password")
                    .foregroundColor(.black)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                
                SecureField("Your Password..", text: $pass)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(height: 50.0)
                    .padding(.horizontal, 20)
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1))
                    .padding()
                
                Text("Confirm Your Password")
                    .foregroundColor(.black)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                
                SecureField("Your Password..", text: $Confirmpassword)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(height: 50.0)
                    .padding(.horizontal, 20)
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1))
                    .padding()
                
                
                NavigationLink(destination: BloodTypeSelectionView(selectedBloodType:$selectedBloodType), isActive: $BLOOD) {
                    // Button label and styling
                    Text("Next")
                        .font(.custom("Arial", size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .cornerRadius(10)
                        .frame(maxWidth: 130)
                        .frame(height: 50)
                        .background(Color.red) // Background color
                        .cornerRadius(15) // Round the corners
                        .shadow(color: .gray, radius: 5, x: 0, y: 5) // Add a shadow effect
                    
                }.navigationTitle("").padding()
                
            }
        }
    }
    
}

struct ForgotPassView: View {
    @State var email: String = ""
    @State var ViewPass = false
    
    var body: some View {
        
        VStack {
            Image("Imageblood")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            Text("Trouble with logging in?")
                .font(.custom("Times New Roman", size: 25))
                .fontWeight(.heavy)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
                .foregroundColor(.red)
            
            Text("Enter your email address, phone number, or username, and we'll send you a link to get back into your account")
                .foregroundColor(.red)
                .font(.custom("Times New Roman", size: 15))
                .padding()
            
            TextField("Your Email..", text: $email)
                .frame(width: 250.0, height: 50.0)
                .padding(.horizontal, 20)
                .background(Color.white) // Set background color
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                .padding(.bottom, 10)
            
            Button(action: {
                // Action to perform when the button is tapped
                print("Link Sent Successfully")
                ViewPass=true
            }) {
                Text("Send Reset Link")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            .alert(isPresented: $ViewPass){
                Alert(
                    title: Text(""),
                    message: Text("Email has been sent successfully")
                )
            }
          
            }
        }
}
