//
//  LinkPresentationVC.swift
//  LinkPreview
//
//  Created by Faiz Ul Hassan on 08/08/2023.
//

import UIKit
import LinkPresentation

class LinkPresentationVC: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStaticMetaData()
        loadVideoMetadata()
        loadVideoMetadata2()
    }
    
    func loadStaticMetaData() {
        let url = URL(string: "https://socialsharepreview.com/")!
        loadMetadata(for: url)
    }
    
    func loadVideoMetadata() {
        let url = URL(string: "https://github.com/quanghoang0101/HPRecorder")!
        loadMetadata(for: url)
    }
    
    func loadVideoMetadata2() {
        let url = URL(string: "https://youtu.be/oJaxHabyp-4")!
        loadMetadata(for: url)
    }
    
    func loadMetadata(for url: URL) {
        let metadataProvider = LPMetadataProvider()
        metadataProvider.startFetchingMetadata(for: url) { (returnedMetadata, error) in
            if let error = error{
                print("Error \(error.localizedDescription)")
                
            }else if let metadata = returnedMetadata {
                
                print("Title: " + (metadata.title ?? "No Title"))
                
                DispatchQueue.main.async { [weak self] in
                    self?.addLinkView(metadata: metadata)
                }
            }
        }
    }
    
    func addLinkView(metadata: LPLinkMetadata) {
        let linkView = LPLinkView(metadata: metadata)
        linkView.bounds = CGRect(x: 0, y: 0, width: 200.0, height: 150.0)
        stackView.addArrangedSubview(linkView)
    }
    
}

