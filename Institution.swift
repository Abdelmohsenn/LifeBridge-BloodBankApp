//
//  Institution.swift
//  LifeBridge
//
//  Created by muhammad abdelmohsen on 03/12/2023.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation

struct InstitutionView: View {
    @State private var showNewView  = false
    @State private var showNewView2 = false
    @State private var showNewView3 = false
    
    
    var body: some View {
            VStack(spacing: 10) {
                Image("lifebridge")
                    .resizable()
                    .padding([.leading, .bottom, .trailing], 20.0)
                    .frame(width: 400, height: 320)
                    .alignmentGuide(.top) { _ in 0 } // Aligns the image at the top
                
                NavigationLink(destination: INSTLOGINview(), isActive: $showNewView) {
                    Text("Login")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color(hue: 1.0, saturation: 1.0, brightness: 0.681))
                        .cornerRadius(20) // Round the corners
                        .shadow(color: .gray, radius: 5, x: 0, y: 5) // Add a shadow effect
                        .padding(.horizontal)
                    
                }
                .navigationTitle("")
                
                NavigationLink(destination: InstSIGNupView(), isActive: $showNewView2) {
                    Text("Not part of LifeBridge?                                Create your Account now")
                        .underline(true)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(hue: 1.0, saturation: 1.0, brightness: 0.681))
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
  
        
    }


    
}
struct INSTLOGINview: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    @State private var showMainMenu = false

    var body: some View {
        ZStack {
            Image("Image 3")
                                       .resizable()
                                       .scaledToFill()
                                       .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                                       .foregroundColor(Color.red)
                                       .opacity(0.18).padding(.bottom, 60.0)
            
            VStack(spacing: 10) {
                
                HStack(spacing:0) {
                    Text("Welcome Back!")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(Color(hue: 1.0, saturation: 1.0, brightness: 0.681)) // Set the color of the first part to black
                
                }
                .frame(height: 30)
                .padding()
                .background(Color.white) // Set the background color to white
                .cornerRadius(20)
                .shadow(color: .black, radius: 5, x: 0, y: 5)
                .padding(.bottom, 50.0)
                
                VStack(spacing: 2) {
                    Text("Enter Your Email:")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    TextField("Your Email..", text: $email)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50.0)
                        .padding(.horizontal, 20)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1))
                        .padding()
                }
                
                VStack(spacing: 2) {
                        Text("Enter Your Password:")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                      
                    ZStack{
                        if showPassword {
                            TextField("Your Password..", text: $password)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50.0)
                                .padding(.horizontal, 20)
                                .background(Color.white)
                                .cornerRadius(8)
                                .overlay(RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1))
                                .padding()
                        } else {
                            SecureField("Your Password..", text: $password)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50.0)
                                .padding(.horizontal, 20)
                                .background(Color.white)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1))
                                .padding()
                        }
                        Button(action: {
                            showPassword.toggle()
                        }) {
                            Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                                .foregroundColor(.gray)
                                
                        }.padding(.leading, 280)
                    }
                      
                    
                }
                
                Button(action: {
                    showMainMenu = true
                }) {
                    Text("Sign-In")
                        .font(.headline)
                        .padding()
                        .background(Color(hue: 1.0, saturation: 1.0, brightness: 0.681))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .fontWeight(.bold)
                        .cornerRadius(15)
                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
                }.padding()
            }
        }
        .background(
            NavigationLink("", destination: instWelcomeMenu()
                .navigationBarTitle("")
                ,isActive: $showMainMenu)
        )
    }
}




struct InstSIGNupView: View {
    @State var email: String = ""
    @State var pass: String = ""
    @State private var Confirmpassword: String = ""
    @State var BLOOD = false
    @State var selectedBloodType:String = ""
    @State private var showPassword: Bool = false
    @State private var showAlert = false

    
    
    var body: some View {
        ZStack{     Image("Image 3")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .foregroundColor(Color.red)
                .opacity(0.18).padding(.bottom, 60.0)
            VStack(spacing:0) {
                
                HStack(spacing:0) {
                    Text("Save Lives now! ")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(Color(hue: 1.0, saturation: 1.0, brightness: 0.681)) // Set the color of the first part to black
                    
                }
                .frame(height: 30)
                .padding()
                .background(Color.white) // Set the background color to white
                .cornerRadius(20)
                .shadow(color: .black, radius: 5, x: 0, y: 5)
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
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1))
                    .padding()
                
                Text("Enter Your Password")
                    .foregroundColor(.black)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                
                ZStack{
                    if showPassword {
                        TextField("Your Password..", text: $pass)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50.0)
                            .padding(.horizontal, 20)
                            .background(Color.white)
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1))
                            .padding()
                    } else {
                        SecureField("Your Password..", text: $pass)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50.0)
                            .padding(.horizontal, 20)
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1))
                            .padding()
                    }
                    Button(action: {
                        showPassword.toggle()
                    }) {
                        Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(.gray)
                        
                    }.padding(.leading, 280)
                }
                
                Text("Confirm Your Password")
                    .foregroundColor(.black)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                
                ZStack{
                    if showPassword {
                        TextField("Your Password..", text: $Confirmpassword)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50.0)
                            .padding(.horizontal, 20)
                            .background(Color.white)
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1))
                            .padding()
                    } else {
                        SecureField("Your Password..", text: $Confirmpassword)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50.0)
                            .padding(.horizontal, 20)
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1))
                            .padding()
                    }
                    Button(action: {
                        showPassword.toggle()
                    }) {
                        Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(.gray)
                        
                    }.padding(.leading, 280)
                }
                
                
                NavigationLink(destination: INSTLOGINview(), isActive: $BLOOD) {
                    // Button label and styling
                    Text("Create Account")
                        .font(.custom("Arial", size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .cornerRadius(10)
                        .frame(maxWidth: 200)
                        .frame(height: 50)
                        .background(Color(hue: 1.0, saturation: 1.0, brightness: 0.681))
                        .cornerRadius(15)
                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
                        .onTapGesture {
                            showAlert.toggle()
                        }
                }
                .navigationTitle("")
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Account Created"),
                        message: Text("Your account has been created for your institution."),
                        dismissButton: .default(Text("OK")) {
                            BLOOD.toggle()
                        }
                    )
                }
            }
        }
    }
}

struct InstForgotPassView: View {
    @State var email: String = ""
    @State var ViewPass = false
    
    var body: some View {
        
        VStack {
            Image("Image 2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            Text("Trouble with logging in?")
                .font(.custom("Times New Roman", size: 25))
                .fontWeight(.heavy)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
                .foregroundColor(Color(hue: 1.0, saturation: 1.0, brightness: 0.681))
            
            Text("Enter your email address, phone number, or username, and we'll send you a link to get back into your account")
                .foregroundColor(Color(hue: 1.0, saturation: 1.0, brightness: 0.681))
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
                    .background(Color(hue: 1.0, saturation: 1.0, brightness: 0.681))
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


struct instWelcomeMenu: View {

    @State private var isConfirmed = false
    @State private var isProfileShown = false
    @State private var userName: String = "Institution"
    @State private var selectedhosp: String = ""
    @State private var gender = false
    @State private var selectedGender: String = ""
    @State private var showprofile = false
    @State private var showHospitalAlert = false
    @State private var BacktoUserView = false
    @State private var NavigateToWelcome = false
    @State private var selectedOption: Int?
    @State private var isAlertPresented = false
    @State private var isSystemMode = false
    @State private var isDarkMode = false

    
    
    var body: some View {
        VStack {
//            HStack {
//                Button(action: {
//                    showprofile.toggle()
//                    
//                }) {
//                    Image(systemName: "person.circle")
//                        .aspectRatio(contentMode: .fit)
//                        .padding(.all, 5.0)
//                    .font(.system(size: 20)) // Adjust the font size
//                    .background(Color.white)
//                    .foregroundColor(.black)
//                    .cornerRadius(10)
//                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
//                    
//                }.padding(.leading, 300.0)
//                    .padding(.top, -70)
//                .background(
//                
//                NavigationLink("", destination: ProfileView(UserNames: "Mohamed Abdelmohsen", Email: "Abdelmohsen@aucegypt.edu", Phone: "01110966552", Age: 21, Gender: "Male")
//                               , isActive: $showprofile)
//                .navigationBarBackButtonHidden(true)
//                .navigationBarTitle("", displayMode: .inline) // Clear the title
//                ) // Align to the trailing edge
//            }
        
            Text("Hello, \(userName)")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.bottom,20)
                .foregroundColor(.black)
                .frame()
                .shadow(color: .gray, radius: 20)
            
            Image("Image 2").resizable().aspectRatio(contentMode: .fit).padding()
            
            Button(action: {
                    isAlertPresented = true
                }) {
                    Text("Request BloodDrive")
                        .font(.headline)
                        .padding()
                        .background(Color(hue: 1.0, saturation: 1.0, brightness: 0.681))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .fontWeight(.bold)
                        .cornerRadius(15)
                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
                }
                .background(
                    NavigationLink(destination: RequestDrive(Location: $selectedGender), isActive: $isAlertPresented){
                        EmptyView()
                    }
                )

            Button(action:{
                
                BacktoUserView=true
                
            }){
                
                Text("Sign out")
                    .padding()
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .frame(height: 50)
                    .background(Color.white) // Background color
                    .cornerRadius(15) // Round the corners
                    .shadow(color: .gray, radius: 5, x: 0, y: 5) // Add a shadow effect
                
            }.background(
                NavigationLink("", destination: AuthenticationView(), isActive: $BacktoUserView)
                    .navigationTitle("")
                
            )                    .navigationBarBackButtonHidden(false)
           
            
        }
        
        
    }
}

struct RequestDrive : View{
    @Binding var Location:String
    @State var IsAlert = false
    @State var CurrLocation = false
    @State private var NavigateToInsWelcome = false

    var body : some View{
        
        VStack(spacing: 20){
            
            Text("Enter the institution's location")
                .font(.title3)
                .fontWeight(.bold)
            
            TextField("Location...", text: $Location)
                .frame(maxWidth: .infinity)
                .frame(height: 50.0)
                .padding(.horizontal, 20)
                .background(Color.white)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1))
                .padding()
            
            NavigationLink(destination: instWelcomeMenu(), isActive: $NavigateToInsWelcome) {
                Button(action:{
                    
                    IsAlert.toggle()
                    
                }){
                    
                    Text("Send Location")
                        .padding()
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(height: 50)
                        .background(Color.white) // Background color
                        .cornerRadius(15) // Round the corners
                        .shadow(color: .gray, radius: 5, x: 0, y: 5) // Add a shadow effect
                    
                }
                .alert(isPresented: $IsAlert) {
                    Alert(title: Text(""), message: Text("We will contact you soon"), dismissButton: .default(Text("OK")){NavigateToInsWelcome.toggle()}
                    )
                }
            }
            Text("or").font(.callout)
            
            Button(action:{
                
                CurrLocation.toggle()
            }){
                
                Text("Send Your Current Location")
                    .padding()
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hue: 1.0, saturation: 1.0, brightness: 0.681))
                    .frame(height: 50)
                    .background(Color.white) // Background color
                    .cornerRadius(15) // Round the corners
                    .shadow(color: .gray, radius: 5, x: 0, y: 5) // Add a shadow effect
                
            }.background( NavigationLink("", destination: currloc(), isActive: $CurrLocation)
            
            )
            
            
        }
        
        
    }
}



struct currloc: View {
    
    let egyptCoordinates = CLLocationCoordinate2D(latitude: 30.0176, longitude: 31.5036)
    @State private var userLocation: CLLocationCoordinate2D?
    @State private var isAlert = false
    @State private var NavigateToInsWelcome = false;
    
    var body: some View {
        VStack {
            MapView(isPresented: $isAlert, Location: "Your Current Location", annotationItems: [MyAnnotationItem(coordinate: userLocation ?? egyptCoordinates)])
                .frame(width:300, height: 400)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 5, x: 2, y: 2)
            NavigationLink(destination: instWelcomeMenu(), isActive: $NavigateToInsWelcome) {
                Button(action: {
                    isAlert.toggle()
                }) {
                    Text("Confirm and Send Location")
                        .padding()
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(height: 50)
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
                }
                .alert(isPresented: $isAlert) {
                    Alert(title: Text(""), message: Text("We will contact you soon"), dismissButton: .default(Text("OK")){
                        NavigateToInsWelcome.toggle()
                    })
                }
            }
        }
        .onAppear {
            userLocation = egyptCoordinates
        }
    }

 
}




struct ContentView_Previews2: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
    

    

