//
//  BioUtilities.swift
//  Biomesh Commonly Used Utilities
//  Created by Rob Elser on 07/12/2015.
//  Copyright © 2015 Biomesh Studios, Ltd. All rights reserved.
//
//  version 1.3.0
//  Confirmed Xcode 7.2 compatible on 12/12/15 - RE
//

import UIKit

public class Alert: NSObject {
 
    // To call an Alert you would use:
    // Alert.Warning(self, alertTitle: "Danger", alertMessage: "This is not a drill!", alertActionTitle: "OK", style: .Alert)
    //
    // To call an ActionPage you would use:
    // Alert.Warning(self, alertTitle: "Danger", alertMessage: "This is not a drill!", alertActionTitle: "OK", style: .ActionSheet)
    //
    // Primary difference is the style: variable being sent.
    
    class func Warning(delegate: UIViewController, alertTitle: String, alertMessage: String, alertActionTitle: String, style: UIAlertControllerStyle) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: style)
        alert.addAction(UIAlertAction(title: alertActionTitle, style: UIAlertActionStyle.Default, handler: nil))
        delegate.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    // To call a Multiple Item Alert you would use:
    // Alert.Warning(self, Title: "Danger", actionTitleOne: "One", actionTitleTwo: "Two", actionMessage: "This is not a drill!", style: .Alert)
    //
    // To call a Multiple Item ActionPage you would use:
    // Alert.MultipleActions(self, Title: "Danger", actionTitleOne: "One", actionTitleTwo: "Two", actionMessage: "This is not a drill!", style: .ActionSheet)
    
    class func MultipleWarnings(delegate: UIViewController, Title: String, actionTitleOne: String, actionTitleTwo: String, actionMessage: String, style: UIAlertControllerStyle) {
        
        let action = UIAlertController(title: Title, message: actionMessage, preferredStyle: style)

        let firstAction = UIAlertAction(title: actionTitleOne, style: .Default) { (alert: UIAlertAction!) -> Void in
            // Response code for firstAction goes here
            NSLog("You pressed button one")
        }
        
        let secondAction = UIAlertAction(title: actionTitleTwo, style: .Default) { (alert: UIAlertAction!) -> Void in
            // Response code for firstAction goes here
            NSLog("You pressed button two")
        }
        
        // Adds sent actions and presents them
        action.addAction(firstAction)
        action.addAction(secondAction)
        delegate.presentViewController(action, animated: true, completion:nil)
    }
    
    
    // To call a MultiActions Alert you will need to set an array with the Names of each Alert:
    // let myTitles = ["Tabs", "Add page to bookmarks", "Bookmarks", "Settings", "Close"]
    //
    // To call a MultiActions Alert you would use:
    // Alert.MultiActions(self, myTitle: "My Menu", message: "", alertTitle: myTitles)
    
    class func MultiActions(delegate: UIViewController, myTitle: String, message: String, var alertTitle: [String], callback: (String) -> ()) {
        
        let action = UIAlertController(title: myTitle, message: message, preferredStyle: .ActionSheet)
        var whichItem:  String  = ""
        if let myIndex = alertTitle.indexOf("Close") {
            alertTitle.removeAtIndex(myIndex)
            for item in alertTitle {
                let actionItem = UIAlertAction(title: item, style: .Default) { (alert: UIAlertAction!) -> Void in
                    // Response code for firstAction goes here
                    whichItem = item
                    callback(whichItem)
                }
                action.addAction(actionItem)
            }
            let actionItem = UIAlertAction(title: "Close", style: .Cancel) { (alert: UIAlertAction!) -> Void in
                whichItem = "Close"
                callback(whichItem)
            }
            action.addAction(actionItem)
        } else if let myIndex = alertTitle.indexOf("Cancel") {
            alertTitle.removeAtIndex(myIndex)
            for item in alertTitle {
                let actionItem = UIAlertAction(title: item, style: .Default) { (alert: UIAlertAction!) -> Void in
                    // Response code for firstAction goes here
                    whichItem = item
                    callback(whichItem)
                }
                action.addAction(actionItem)
            }
            let actionItem = UIAlertAction(title: "Cancel", style: .Cancel) { (alert: UIAlertAction!) -> Void in
                whichItem = "Cancel"
                callback(whichItem)
            }
            action.addAction(actionItem)
        } else {
            for item in alertTitle {
                let actionItem = UIAlertAction(title: item, style: .Default) { (alert: UIAlertAction!) -> Void in
                    // Response code for firstAction goes here
                    whichItem = item
                    callback(whichItem)
                }
                action.addAction(actionItem)
            }
        }
        delegate.presentViewController(action, animated: true, completion:nil)
    }
}


func shareItem(delegate: UIViewController, message: String, URL: String) {
    
    // let textToShare = "Swift is awesome!  Check out this website about it!"
    // if let myWebsite = NSURL(string: "http://www.codingexplorer.com/")
    
    if let myURL = NSURL(string: URL)
    {
        let objectsToShare = [message, myURL]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        
        // We can also add Excluded Activities Codes to disable them at runtime
        // activityVC.excludedActivityTypes = [UIActivityTypeAirDrop, UIActivityTypeAddToReadingList]

        delegate.presentViewController(activityVC, animated: true, completion: nil)
    }
}

func Gomez(action: String) {
    let myGomez = action
    print("Well then - \(myGomez)")
}

public func timestamp() -> String {
    let timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
    print(timestamp)
    return timestamp
}

    
public func Now(type: String) -> String {
        let currentDateTime = NSDate()
        
        // get the user's calendar
        let userCalendar = NSCalendar.currentCalendar()
        
        // choose which date and time components are needed
        let requestedComponents: NSCalendarUnit = [
            NSCalendarUnit.Year,
            NSCalendarUnit.Month,
            NSCalendarUnit.Day,
            NSCalendarUnit.Hour,
            NSCalendarUnit.Minute,
            NSCalendarUnit.Second,
            NSCalendarUnit.Weekday
        ]
        
        //        // get the components
        let dateTimeComponents = userCalendar.components(requestedComponents, fromDate: currentDateTime)
        
        // now the components are available
        let year    = dateTimeComponents.year       // 2015
        let month   = dateTimeComponents.month      // 12
        let day     = dateTimeComponents.day        // 11
        let hour    = dateTimeComponents.hour       // 17
        let minute  = dateTimeComponents.minute     // 41
        let second  = dateTimeComponents.second     // 57
        let weekday = dateTimeComponents.weekday    // 6 (Friday)
        
        // print("\(weekday) - \(day)-\(month)-\(year) at \(hour):\(minute):\(second)")
        
        // initialize the date formatter and set the style
        let formatter = NSDateFormatter()

        //        // Initial formatting option
        //        formatter.timeStyle = NSDateFormatterStyle.MediumStyle
        //        formatter.dateStyle = NSDateFormatterStyle.LongStyle

        if type == "Short" || type == "short" {
            formatter.timeStyle = NSDateFormatterStyle.ShortStyle
            formatter.dateStyle = NSDateFormatterStyle.ShortStyle
            formatter.stringFromDate(currentDateTime)
        } else if type == "Medium" || type == "medium" {
            formatter.timeStyle = NSDateFormatterStyle.MediumStyle
            formatter.dateStyle = NSDateFormatterStyle.MediumStyle
            formatter.stringFromDate(currentDateTime)
        } else if type == "Long" || type == "long" {
            formatter.timeStyle = NSDateFormatterStyle.LongStyle
            formatter.dateStyle = NSDateFormatterStyle.LongStyle
            formatter.stringFromDate(currentDateTime)
        } else if type == "Date" || type == "date" {
            formatter.timeStyle = NSDateFormatterStyle.NoStyle
            formatter.dateStyle = NSDateFormatterStyle.LongStyle
            formatter.stringFromDate(currentDateTime)
        } else if type == "Time" || type == "time" {
            formatter.timeStyle = NSDateFormatterStyle.MediumStyle
            formatter.dateStyle = NSDateFormatterStyle.NoStyle
            formatter.stringFromDate(currentDateTime)
        }
    
        // get the date time String from the date object
        let now = formatter.stringFromDate(currentDateTime) // October 26, 2015 at 6:09:16 PM
        return now
    }

public class BioUtility {
    
    public class func sharedUtilityInstance() -> BioUtility {
        return BioUtilityInstance
    }
    
}

private let BioUtilityInstance = BioUtility()
