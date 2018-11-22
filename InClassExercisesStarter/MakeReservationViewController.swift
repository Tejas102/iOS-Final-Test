//
//  MakeReservationViewController.swift
//  InClassExercisesStarter
//
//  Created by parrot on 2018-11-22.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import FirebaseFirestore


class MakeReservationViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var seatsTextField: UITextField!
    
    // Mark: Firestore variables
    var db:Firestore!
    
    
    // MARK: Default Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        db = Firestore.firestore()
        
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Actions
    @IBAction func buttonPressed(_ sender: Any) {
        print("pressed the button")
        
        let username = nameTextField.text!
        let day = dayTextField.text!
        let seats = seatsTextField.text!
        
//        Auth.auth().createUser(withUser: username, Day: day, Seats: seats) {
//            (user, error) in
//
//            if (user != nil) {
//                // 1. New user created!
//                print("Created user: ")
//                print("User id: \(user?.user.uid)")
//                print("Email: \(user?.user.email)")
//                print("DisplayName: \(user?.user.displayName)")
//                print("EmailVerified: \(user?.user.isEmailVerified)")
//
//                //2. @TODO: You decide what you want to do next!
//                // - do you want to send them to the next page?
//                // - maybe ask them to fill in other forms?
//                // - show a tutorial?
//
//            }
//            else {
//                // 1. Error when creating a user
//                print("ERROR!")
//                print(error?.localizedDescription)
//
//                // 2. Show the error in the UI
//                self.statusMessageLabel.text = error?.localizedDescription
//
//            }
//        }
        
        let reservationsRef = db.collection("reservations")
        
        reservationsRef.document("one").setData([
            "username": "human",
            "restaurant": "tim hortons",
            "day": "first day",
            "numSeats": "4",
            ])
        
        reservationsRef.document("two").setData([
            "username": "mouse",
            "restaurant": "North 44",
            "day": "22-11-2018",
            "numSeats": "4",
            ])

        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
