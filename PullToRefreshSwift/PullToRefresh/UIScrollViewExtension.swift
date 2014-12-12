//
//  PullToRefreshConst.swift
//  PullToRefreshSwift
//
//  Created by Yuji Hato on 12/11/14.
//
import Foundation
import UIKit

extension UIScrollView {
    
    var pullToRefreshView: PullToRefreshView? {
        get {
            var pullToRefreshView = viewWithTag(PullToRefreshConst.tag)
            return pullToRefreshView as? PullToRefreshView
        }
    }

    func addPullToRefresh(refreshCompletion :(() -> ())) {

        var refreshView = PullToRefreshView(refreshCompletion: refreshCompletion, frame: CGRectMake(0, -PullToRefreshConst.height, self.frame.size.width, PullToRefreshConst.height))
        refreshView.frame = CGRectMake(0, -PullToRefreshConst.height, self.frame.size.width, PullToRefreshConst.height)
        refreshView.refreshCompletion = refreshCompletion
        refreshView.tag = PullToRefreshConst.tag
        addSubview(refreshView)
    }
    

    func startPullToRefresh() {
        pullToRefreshView?.state = PullToRefreshState.Refreshing
    }
    
    func stopPullToRefresh() {
        pullToRefreshView?.state = PullToRefreshState.Normal
    }
}
