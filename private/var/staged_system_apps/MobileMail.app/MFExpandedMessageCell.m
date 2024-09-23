@implementation MFExpandedMessageCell

+ (double)defaultSemiExpandedHeightWithDisplayMetrics:(id)a3
{
  return 500.0;
}

- (void)setMessageViewController:(id)a3
{
  MFMessageViewController *v5;
  MFMessageViewController *messageViewController;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MFMessageViewController *v15;

  v5 = (MFMessageViewController *)a3;
  messageViewController = self->_messageViewController;
  v15 = v5;
  if (messageViewController != v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController view](messageViewController, "view"));
    objc_msgSend(v7, "removeFromSuperview");

    objc_storeStrong((id *)&self->_messageViewController, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandedMessageCell messageViewController](self, "messageViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandedMessageCell contentView](self, "contentView"));
    objc_msgSend(v10, "bounds");
    objc_msgSend(v9, "setFrame:");

    objc_msgSend(v9, "setAutoresizingMask:", 18);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandedMessageCell contentView](self, "contentView"));
    objc_msgSend(v11, "addSubview:", v9);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell displayMetrics](self, "displayMetrics"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandedMessageCell messageViewController](self, "messageViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "messageContentView"));
    objc_msgSend(v14, "setDisplayMetrics:", v12);

    -[MFExpandedMessageCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailConversationViewMessage);
  }

}

- (void)setConfiguredForSingleMessageDisplay:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL8 v6;

  v3 = a3;
  self->_configuredForSingleMessageDisplay = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandedMessageCell messageViewController](self, "messageViewController"));
  objc_msgSend(v5, "setConfiguredForSingleMessageDisplay:", v3);

  v6 = (+[UIDevice mf_isPad](UIDevice, "mf_isPad") & 1) != 0
    || !self->_configuredForSingleMessageDisplay
    || -[MFExpandedMessageCell onlyMaskBottomCorners](self, "onlyMaskBottomCorners");
  -[MFMessageConversationViewCell setRoundsCellCorners:](self, "setRoundsCellCorners:", v6);
}

- (void)setOnlyMaskBottomCorners:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  id v8;

  if (self->_onlyMaskBottomCorners != a3)
  {
    v3 = a3;
    self->_onlyMaskBottomCorners = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandedMessageCell contentView](self, "contentView"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));

    if (v3)
      v6 = 12;
    else
      v6 = 15;
    objc_msgSend(v8, "setMaskedCorners:", v6);
    v7 = (+[UIDevice mf_isPad](UIDevice, "mf_isPad") & 1) != 0
      || !self->_configuredForSingleMessageDisplay
      || -[MFExpandedMessageCell onlyMaskBottomCorners](self, "onlyMaskBottomCorners");
    -[MFMessageConversationViewCell setRoundsCellCorners:](self, "setRoundsCellCorners:", v7);

  }
}

- (void)setMessageFlags:(unint64_t)a3 conversationFlags:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[MFExpandedMessageCell messageViewController](self, "messageViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "messageContentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "headerView"));
  objc_msgSend(v7, "setMessageFlags:conversationFlags:", a3, a4);

}

- (void)prepareForQuickReplyAnimationWithContext:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandedMessageCell messageViewController](self, "messageViewController"));
  objc_msgSend(v4, "prepareForQuickReplyAnimationWithContext:", v5);

}

- (void)_displayMetricsDidChange
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell displayMetrics](self, "displayMetrics"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandedMessageCell messageViewController](self, "messageViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "messageContentView"));
  objc_msgSend(v4, "setDisplayMetrics:", v5);

}

- (BOOL)expanded
{
  return 1;
}

- (void)setInteractivelyResizing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];

  v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MFExpandedMessageCell;
  -[MFMessageConversationViewCell setInteractivelyResizing:](&v16, "setInteractivelyResizing:");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandedMessageCell messageViewController](self, "messageViewController", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messageContentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "headerView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "headerBlocks"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "setInteractivelyResizing:", v3);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v9);
  }

}

- (void)setShouldArchiveByDefault:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  self->_shouldArchiveByDefault = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MFExpandedMessageCell messageViewController](self, "messageViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messageContentView"));
  objc_msgSend(v4, "setShouldArchiveByDefault:", v3);

}

- (void)setPredictedMailbox:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFExpandedMessageCell;
  -[MFMessageConversationViewCell setPredictedMailbox:](&v6, "setPredictedMailbox:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandedMessageCell messageViewController](self, "messageViewController"));
  objc_msgSend(v5, "setPredictedMailbox:", v4);

}

- (BOOL)hasVisibleContent
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandedMessageCell messageViewController](self, "messageViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "messageContentView"));
  v4 = objc_msgSend(v3, "hasVisibleContent");

  return v4;
}

- (BOOL)canBeginDragWithTouchAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  uint64_t v14;
  char v15;
  CGPoint v17;
  CGRect v18;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandedMessageCell messageViewController](self, "messageViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageContentView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "headerView"));

  -[MFExpandedMessageCell convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  v10 = v9;
  v12 = v11;
  objc_msgSend(v8, "draggableArea");
  v17.x = v10;
  v17.y = v12;
  if (CGRectContainsPoint(v18, v17))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandedMessageCell hitTest:withEvent:](self, "hitTest:withEvent:", 0, x, y));
    v14 = objc_opt_class(MFModernAddressAtom);
    v15 = objc_opt_isKindOfClass(v13, v14) ^ 1;

  }
  else
  {
    v15 = 0;
  }

  return v15 & 1;
}

- (void)prepareForReuse
{
  objc_super v3;

  -[MFExpandedMessageCell setOnlyMaskBottomCorners:](self, "setOnlyMaskBottomCorners:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MFExpandedMessageCell;
  -[MFMessageConversationViewCell prepareForReuse](&v3, "prepareForReuse");
}

- (MFMessageViewController)messageViewController
{
  return self->_messageViewController;
}

- (BOOL)isConfiguredForSingleMessageDisplay
{
  return self->_configuredForSingleMessageDisplay;
}

- (BOOL)shouldArchiveByDefault
{
  return self->_shouldArchiveByDefault;
}

- (BOOL)onlyMaskBottomCorners
{
  return self->_onlyMaskBottomCorners;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageViewController, 0);
}

@end
