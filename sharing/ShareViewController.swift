//
//  ShareViewController.swift
//  sharing
//
//  Created by hung pham on 26/08/2022.
//

import UIKit
import Social
import MobileCoreServices
import UniformTypeIdentifiers

class ShareViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        setupNavBar()
        guard let content = extensionContext?.inputItems[0] as? NSExtensionItem, let attachments = content.attachments else { return }
        for attachment in attachments {
            if attachment.hasItemConformingToTypeIdentifier(UTType.image.identifier) {
                attachment.loadItem(forTypeIdentifier: UTType.image.identifier, options: nil) { imageURL, error in
                    if let imageURL = imageURL as? NSURL {
                        print("========== ShareViewController didSelectPost \(imageURL)")
                      }
                }
            }
        }
    }
    
    @IBAction func didTouchExten(_ sender: Any) {
        print("==== touch exten")
    }
    
    private func setupNavBar() {
            self.navigationItem.title = "My app"

            let itemCancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAction))
            self.navigationItem.setLeftBarButton(itemCancel, animated: false)

            let itemDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
            self.navigationItem.setRightBarButton(itemDone, animated: false)
        }

        @objc private func cancelAction () {
            let error = NSError(domain: "some.bundle.identifier", code: 0, userInfo: [NSLocalizedDescriptionKey: "An error description"])
            print("===== cancel")
            extensionContext?.cancelRequest(withError: error)
        }

        @objc private func doneAction() {
            print("===== done")
            extensionContext?.completeRequest(returningItems: [], completionHandler: nil)
        }

}
