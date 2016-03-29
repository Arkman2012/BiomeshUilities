//
//  BioAudio.swift
//	Biomesh Audio Player Management System
//  Created by Rob Elser on 03/03/2015.
//  Copyright © 2015 Biomesh Studios, Ltd. All rights reserved.
//
//  version 1.4.0
//  Confirmed Xcode 7.2 compatible on 09/12/15 - RE
//

import AVFoundation

public class BioAudio {
    
    public var soundEffectPlayer                : AVAudioPlayer?
    public var backgroundMusicPlayer            : AVAudioPlayer?
    
    public class func sharedAudioInstance() ->  BioAudio {
        
        return BioAudioInstance
        
    }

    public func playBackgroundMusic(filename: String, volume: Float) {
		// To play a background music file named TitleScreen.mp3 you would use:
		// BioAudio.sharedAudioInstance().playBackgroundMusic("TitleScreen.mp3", volume: 0.5)

        let url = NSBundle.mainBundle().URLForResource(filename, withExtension: nil)
        if url == nil {
            print("Could not find file: \(filename)")
        }
        
        let error: NSError? = nil

        do {
            try backgroundMusicPlayer = AVAudioPlayer(contentsOfURL: url!)
        } catch {
            // error message can go here
            print("Could not create audio player: \(error)")
        }
        
        if let player = backgroundMusicPlayer {
            player.numberOfLoops = -1
            player.volume = volume
            player.prepareToPlay()
            player.play()
        } else {
            print("Could not create audio player: \(error)")   
        }
    }
    
    public func pauseBackgroundMusic() {
        if let player = backgroundMusicPlayer {
            
            if player.playing {
                player.pause()
            }
        }
    }
    
    public func resumeBackgroundMusic() {
        if let player = backgroundMusicPlayer {
            if !player.playing {
                player.play()
            }
        }
    }
    
    public func stopBackgroundMusic() {
        if let player = backgroundMusicPlayer {
            if player.playing {
                player.stop()
            }
        }
    }
        
    public func playSoundEffect(filename: String, volume: Float) {
		// To play a sound effect with the file name Button.mp3 you would use:
		// BioAudio.sharedAudioInstance().playSoundEffect("Button.mp3", volume: 0.5)

        let url = NSBundle.mainBundle().URLForResource(filename, withExtension: nil)
        if url == nil {
            print("Could not find file: \(filename)")
        }
        
        let error: NSError? = nil
        
        do {
            try soundEffectPlayer = AVAudioPlayer(contentsOfURL: url!)
        } catch {
            // error message can go here
            print("Could not create audio player: \(error)")
        }
        
        if let sfxPlayer = soundEffectPlayer {
            sfxPlayer.numberOfLoops = 0
            sfxPlayer.volume = volume
            sfxPlayer.prepareToPlay()
            sfxPlayer.play()
        } else {   
            print("Could not create audio player: \(error)")
        }   
    }    
}

private let BioAudioInstance = BioAudio()
