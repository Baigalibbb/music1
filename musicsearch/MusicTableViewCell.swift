//
//  MusicTableViewCell.swift
//  musicsearch
//
//  Created by Tenizbayev Bolat on 26.01.2024.
//

import UIKit
import SDWebImage

class MusicTableViewCell: UITableViewCell {
    @IBOutlet weak var albomImage: UIImageView!
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(music: Itunes){
        
        singerLabel.text = music.singer
        songLabel.text = music.track
        albomImage.sd_setImage(with: URL(string: music.artworkUrl100), completed: nil)
        
    }

}
