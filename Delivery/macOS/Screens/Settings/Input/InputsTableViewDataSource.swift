//
//  InputsTableViewDataSource.swift
//  Jirassic
//
//  Created by Cristian Baluta on 01/02/2018.
//  Copyright © 2018 Imagin soft. All rights reserved.
//

import Cocoa

let kShellCellHeight = CGFloat(50.0)
let kJirassicCellHeight = CGFloat(50.0)
let kJitCellHeight = CGFloat(50.0)
let kGitCellHeight = CGFloat(170.0)
let kBrowserCellHeight = CGFloat(170.0)

enum InputType {
    case shell
    case jirassic
    case jit
    case git
    case browser
    static var all: [InputType] = [.shell, .jirassic, .git, .browser]
}

class InputsTableViewDataSource: NSObject {
    
    fileprivate let tableView: NSTableView
    fileprivate let cells: [InputType] = InputType.all
    var shellCell: ShellCell?
    var jirassicCell: JirassicCell?
    var jitCell: JitCell?
    var gitCell: GitCell?
    var browserCell: BrowserCell?
    
    init (tableView: NSTableView) {
        self.tableView = tableView
        super.init()

        ShellCell.register(in: tableView)
        JirassicCell.register(in: tableView)
        JitCell.register(in: tableView)
        GitCell.register(in: tableView)
        BrowserCell.register(in: tableView)
        
        shellCell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: String(describing: ShellCell.self)), owner: self) as? ShellCell
        jirassicCell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: String(describing: JirassicCell.self)), owner: self) as? JirassicCell
        jitCell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: String(describing: JitCell.self)), owner: self) as? JitCell
        gitCell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: String(describing: GitCell.self)), owner: self) as? GitCell
        browserCell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: String(describing: BrowserCell.self)), owner: self) as? BrowserCell
    }

    func showSettingsBrowser (_ settings: SettingsBrowser) {
        browserCell!.showSettings(settings)
    }
    
    func settingsBrowser() -> SettingsBrowser {
        return browserCell!.settings()
    }
}

extension InputsTableViewDataSource: NSTableViewDataSource {
    
    func numberOfRows (in aTableView: NSTableView) -> Int {
        return cells.count
    }
    
    func tableView (_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        
        let inputType = cells[row]
        switch inputType {
        case .shell:
            return kShellCellHeight
        case .jirassic:
            return kJirassicCellHeight
        case .jit:
            return kJitCellHeight
        case .git:
            return kGitCellHeight
        case .browser:
            return kBrowserCellHeight
        }
    }
}

extension InputsTableViewDataSource: NSTableViewDelegate {
    
    func tableView (_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        var cell: NSView! = nil
        let outputType = cells[row]
        switch outputType {
        case .shell:
            cell = shellCell!
        case .jirassic:
            cell = jirassicCell!
        case .jit:
            cell = jitCell!
        case .git:
            cell = gitCell!
        case .browser:
            cell = browserCell!
        }
        
        return cell
    }
}
