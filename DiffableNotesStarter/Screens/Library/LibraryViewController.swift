//
//  LibraryViewController.swift
//  DiffableNotes
//
//  Created by Eilon Krauthammer on 27/11/2020.
//

import UIKit
import Combine

class LibraryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private var tokens = [AnyCancellable]()
    
    private var viewModel = LibraryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nav = segue.destination as? UINavigationController, let dest = nav.viewControllers.first as? NewNoteViewController else { fatalError() }
        
        // I chose to use Combine's Publisher pattern for communication, but feel free to use any of your other favorite communication patterns such as delegates or closures.
        dest.notePublisher.sink { note in
            
        }
        .store(in: &tokens)
    }
}

