//
//  MusicViewController.swift
//  Instagram
//
//  Created by Rustam on 24.09.2023.
//

import UIKit
import SnapKit
import AVFoundation


class MusicViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
        
        imageView.layoutIfNeeded()
        imageView.layer.cornerRadius = imageView.bounds.size.width / 2
        imageView.clipsToBounds = true
        
        if let audioURL = Bundle.main.url(forResource: "DayN", withExtension: "mp3") {
            let playerItem = AVPlayerItem(url: audioURL)
            player = AVPlayer(playerItem: playerItem)
            
            
            // Добавляем обработчик нажатия на кнопку "buttonPlay"
            buttonPlay.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
            
            slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
            
            buttonNext.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
            
            buttonBack.addTarget(self, action: #selector(previousButtonTapped), for: .touchUpInside)
        }
        
    }
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "cat2")
        view.contentMode = .scaleAspectFill
        
        return view
    }()
    
    private let buttonPlay: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.tintColor = .systemBlue
        
        return button
    }()
    
    private let buttonBack: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "backward.fill"), for: .normal)
        button.tintColor = .systemBlue
        
        return button
    }()
    
    private let buttonNext: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "forward.fill"), for: .normal)
        button.tintColor = .systemBlue
        
        return button
    }()
    
    private let slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0
        return slider
    }()
    
    // MARK: - Properties
    var player: AVPlayer!
    var audioFiles: [String] = ["DayN", "ava-kings-queens", "Boywithuke_Toxic"]
    var currentAudioIndex: Int = 0 // Индекс текущего аудиофайла
    
    private func setupUI() {
        view.addSubview(imageView)
        view.addSubview(buttonPlay)
        view.addSubview(buttonBack)
        view.addSubview(buttonNext)
        view.addSubview(slider)
        setupConstraints()
    }
    
    func loadAndPlayAudio() {
        if currentAudioIndex >= 0, currentAudioIndex < audioFiles.count {
            let audioFileName = audioFiles[currentAudioIndex]
            if let audioURL = Bundle.main.url(forResource: audioFileName, withExtension: "mp3") {
                let playerItem = AVPlayerItem(url: audioURL)
                player = AVPlayer(playerItem: playerItem)
                slider.maximumValue = Float(playerItem.asset.duration.seconds)
                playButtonTapped()
            }
        }
    }
    
    @objc func playButtonTapped() {
        if player.rate == 0 {
            // Если плеер остановлен, запускаем воспроизведение
            player.play()
            buttonPlay.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        } else {
            // Если плеер играет, приостанавливаем воспроизведение
            player.pause()
            buttonPlay.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
    }

@objc func sliderValueChanged() {
    let value = slider.value
    let time = CMTime(seconds: Double(value) * player.currentItem!.duration.seconds, preferredTimescale: 1)
    player.seek(to: time)
}
    
    @objc func nextButtonTapped() {
        currentAudioIndex += 1
        if currentAudioIndex >= audioFiles.count {
            currentAudioIndex = 0
        }
        loadAndPlayAudio()
    }
    
    @objc func previousButtonTapped() {
        currentAudioIndex -= 1
        if currentAudioIndex < 0 {
            currentAudioIndex = audioFiles.count - 1
        }
        loadAndPlayAudio()
    }
    
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().dividedBy(1.5) // Позиционируем чуть выше середины
            make.width.equalTo(350) // Ширина изображения
            make.height.equalTo(imageView.snp.width) // Изображение круглое
        }
        
        buttonBack.snp.makeConstraints { make in
            make.top.equalTo(buttonPlay.snp.top) // Выравниваем по верхнему краю
            make.right.equalTo(buttonPlay.snp.left).offset(-20) // Слева от "buttonPlay"
            make.width.height.equalTo(60) // Задаем ширину и высоту кнопки
        }
        
        buttonNext.snp.makeConstraints { make in
            make.top.equalTo(buttonPlay.snp.top)
            make.left.equalTo(buttonPlay.snp.right).offset(20)
            make.width.height.equalTo(60)
        }
        
        buttonPlay.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(150)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(60)
        }
        
        slider.snp.makeConstraints { (make) in
            make.bottom.equalTo(buttonPlay.snp.top).offset(-20) // Над "buttonPlay" с отступом
            make.centerX.equalToSuperview() // По центру
            make.width.equalTo(300) // Задаем ширину слайдера
        }
    }
}

