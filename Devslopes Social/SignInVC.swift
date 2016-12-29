//
//  ViewController.swift
//  Devslopes Social
//
//  Created by Jacob West on 12/26/16.
//  Copyright © 2016 Jacob West. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["Email"], from: self) { (result, error) in if error != nil {
            print ("JACOB: Unable to authenticate with Facebook. -\(error)")
            }
            
        else if result?.isCancelled == true {
            print("JACOB: User canceled Facebook authentication.")
            }
        else {print("JACOB: User successfully authenticated with Facebook")
            let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
            self.firebaseAuth(credential)
            }

        }
        
    }
        
        func firebaseAuth(_ credential: FIRAuthCredential) {
            FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
                if error != nil {
                    print("JACOB: Unable to Authenticate with Firebase - \(error)")
                } else {
                    print("JACOB: Successfully authenticated with Firebase!")
                }
            })
    
        }
    }
