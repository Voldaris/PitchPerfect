//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Joseph Kelly on 5/12/17.
//  Copyright © 2017 Joseph Kelly. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        // gives a name to each button tag
        case slow = 0, fast = 1, chipmunk = 2, vader = 3, echo = 4, reverb = 5
    }
    
    // MARK: Actions
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        print("Play sound button pressed.")
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        print("Stop button pressed.")
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("Memory warning received.")
    }
    

}
