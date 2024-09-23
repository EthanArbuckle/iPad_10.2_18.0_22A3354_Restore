@implementation MFMessageViewController

- (MFMessageViewController)initWithScene:(id)a3 accountsController:(id)a4
{
  id v6;
  id v7;
  MFMessageViewController *v8;
  MFMessageViewController *v9;
  uint64_t v10;
  MFMailboxProvider *mailboxProvider;
  uint64_t v12;
  MFMailAccountsProvider *accountsProvider;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MFMessageViewController;
  v8 = -[MFMessageViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_scene, v6);
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mailboxProvider"));
    mailboxProvider = v9->_mailboxProvider;
    v9->_mailboxProvider = (MFMailboxProvider *)v10;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accountsProvider"));
    accountsProvider = v9->_accountsProvider;
    v9->_accountsProvider = (MFMailAccountsProvider *)v12;

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[MFMessageContentView setDelegate:](self->_messageContentView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MFMessageViewController;
  -[MFMessageViewController dealloc](&v3, "dealloc");
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MFSuggestionController *v9;
  void *v10;
  MFSuggestionController *v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[MFMessageViewController scene](self, "scene"));
  v3 = objc_msgSend(objc_alloc((Class)MFMessageContentView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setDataSource:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController mailboxProvider](self, "mailboxProvider"));
  objc_msgSend(v3, "setMailboxProvider:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "daemonInterface"));
  objc_msgSend(v3, "setDaemonInterface:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "brandIndicatorProvider"));
  objc_msgSend(v3, "setBrandIndicatorProvider:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController contentRequest](self, "contentRequest"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController contentRequest](self, "contentRequest"));
    objc_msgSend(v3, "setContentRequest:", v8);

  }
  objc_msgSend(v3, "setAutomaticallyCollapseQuotedContent:", -[MFMessageViewController automaticallyCollapseQuotedContent](self, "automaticallyCollapseQuotedContent"));
  -[MFMessageViewController setMessageContentView:](self, "setMessageContentView:", v3);
  -[MFMessageViewController setView:](self, "setView:", v3);
  v9 = [MFSuggestionController alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "headerView"));
  v11 = -[MFSuggestionController initWithDelegate:headerView:](v9, "initWithDelegate:headerView:", self, v10);
  -[MFMessageViewController setSuggestionController:](self, "setSuggestionController:", v11);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MFScreenshotService *v13;
  MFScreenshotService *screenshotService;
  MFScreenshotService *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MFMessageViewController;
  -[MFMessageViewController viewDidAppear:](&v18, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController view](self, "view"));
  if ((*((_BYTE *)&self->_flags + 1) & 0x80) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageViewControllerMessageListMailboxScope:", self));

  }
  else
  {
    v5 = 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController scene](self, "scene"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "daemonInterface"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interactionLogger"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentRequest"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "message"));
  objc_msgSend(v9, "viewingStartedForMessage:messageListScope:", v11, v5);

  if (objc_msgSend(v4, "hasVisibleContent"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "postNotificationName:object:", MFMessageContentViewDidAppear, v4);

  }
  v13 = -[MFScreenshotService initWithDelegate:]([MFScreenshotService alloc], "initWithDelegate:", self);
  screenshotService = self->_screenshotService;
  self->_screenshotService = v13;

  v15 = self->_screenshotService;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "screenshotService"));
  objc_msgSend(v16, "setDelegate:", v15);

  if ((+[EMServerConfiguration isCacheRecent](EMServerConfiguration, "isCacheRecent") & 1) == 0)
    +[EMServerConfiguration refreshAsync](EMServerConfiguration, "refreshAsync");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v17, "addObserver:selector:name:object:", self, "_sceneMovedtoForeground:", UISceneWillEnterForegroundNotification, v7);

}

- (void)_sceneMovedtoForeground:(id)a3
{
  void *v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001861D4;
  v4[3] = &unk_10051AA98;
  v4[4] = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", a3));
  objc_msgSend(v3, "performBlock:", v4);

}

- (int64_t)_dataOwnerForPaste
{
  void *v2;
  int64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView"));
  if (objc_msgSend(v2, "sourceIsManaged"))
    v3 = 2;
  else
    v3 = 1;

  return v3;
}

- (int64_t)_dataOwnerForCopy
{
  void *v2;
  int64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView"));
  if (objc_msgSend(v2, "sourceIsManaged"))
    v3 = 2;
  else
    v3 = 1;

  return v3;
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  MFScreenshotService *screenshotService;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MFMessageViewController;
  -[MFMessageViewController viewDidDisappear:](&v16, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView"));
  objc_msgSend(v4, "clearSelectedHTML");
  -[MFMessageViewController messageContentView:didChangeSelectedHTML:](self, "messageContentView:didChangeSelectedHTML:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "message"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController scene](self, "scene"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "daemonInterface"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interactionLogger"));
  objc_msgSend(v9, "viewingEndedForMessage:", v6);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "screenshotService"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
  v12 = objc_msgSend(v11, "isEqual:", self->_screenshotService);

  if (v12)
  {
    screenshotService = self->_screenshotService;
    self->_screenshotService = 0;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "screenshotService"));
    objc_msgSend(v14, "setDelegate:", 0);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v15, "removeObserver:", self);

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_flags = ($087CBA907898140F4D8FBA24B97BA774)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | objc_opt_respondsToSelector(obj, "messageViewController:didFinishRenderingWithHeight:") & 1);
    if ((objc_opt_respondsToSelector(obj, "messageViewControllerDidFinishFirstPaint:") & 1) != 0)
      v6 = 2;
    else
      v6 = 0;
    self->_flags = ($087CBA907898140F4D8FBA24B97BA774)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v6);
    if ((objc_opt_respondsToSelector(obj, "messageViewControllerDidDisplayContent:success:") & 1) != 0)
      v7 = 4;
    else
      v7 = 0;
    self->_flags = ($087CBA907898140F4D8FBA24B97BA774)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v7);
    if ((objc_opt_respondsToSelector(obj, "messageViewController:didStartDownloadForContentItemWithProgress:") & 1) != 0)
      v8 = 8;
    else
      v8 = 0;
    self->_flags = ($087CBA907898140F4D8FBA24B97BA774)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v8);
    if ((objc_opt_respondsToSelector(obj, "messageViewController:didTapShowMoreAtCollapsedOffset:expandedOffset:") & 1) != 0)
      v9 = 16;
    else
      v9 = 0;
    self->_flags = ($087CBA907898140F4D8FBA24B97BA774)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v9);
    if ((objc_opt_respondsToSelector(obj, "messageViewController:mostRecentAncestorMessageForMessage:") & 1) != 0)
      v10 = 32;
    else
      v10 = 0;
    self->_flags = ($087CBA907898140F4D8FBA24B97BA774)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v10);
    if ((objc_opt_respondsToSelector(obj, "messageViewControllerContentViewWillBeginZooming:") & 1) != 0)
      v11 = 64;
    else
      v11 = 0;
    self->_flags = ($087CBA907898140F4D8FBA24B97BA774)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v11);
    if ((objc_opt_respondsToSelector(obj, "messageViewController:contentViewDidEndZoomingMessageWithOffset:") & 1) != 0)
      v12 = 128;
    else
      v12 = 0;
    self->_flags = ($087CBA907898140F4D8FBA24B97BA774)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v12);
    if ((objc_opt_respondsToSelector(obj, "messageViewController:didTapRevealActionsButton:") & 1) != 0)
      v13 = 256;
    else
      v13 = 0;
    self->_flags = ($087CBA907898140F4D8FBA24B97BA774)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v13);
    if ((objc_opt_respondsToSelector(obj, "messageViewController:didTapUndoSendButton:") & 1) != 0)
      v14 = 512;
    else
      v14 = 0;
    self->_flags = ($087CBA907898140F4D8FBA24B97BA774)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v14);
    if ((objc_opt_respondsToSelector(obj, "messageViewControllerDidTapToExpand:") & 1) != 0)
      v15 = 1024;
    else
      v15 = 0;
    self->_flags = ($087CBA907898140F4D8FBA24B97BA774)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v15);
    if ((objc_opt_respondsToSelector(obj, "messageViewControllerDidTapAddressAtom:contactViewController:") & 1) != 0)
      v16 = 2048;
    else
      v16 = 0;
    self->_flags = ($087CBA907898140F4D8FBA24B97BA774)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v16);
    if ((objc_opt_respondsToSelector(obj, "messageViewController:displayNameForEmailAddress:abbreviated:") & 1) != 0)
      v17 = 4096;
    else
      v17 = 0;
    self->_flags = ($087CBA907898140F4D8FBA24B97BA774)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v17);
    if ((objc_opt_respondsToSelector(obj, "messageViewController:didChangeSelectedHTML:") & 1) != 0)
      v18 = 0x2000;
    else
      v18 = 0;
    self->_flags = ($087CBA907898140F4D8FBA24B97BA774)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v18);
    if ((objc_opt_respondsToSelector(obj, "messageViewController:loadingIndicatorDidChangeVisibility:") & 1) != 0)
      v19 = 0x4000;
    else
      v19 = 0;
    self->_flags = ($087CBA907898140F4D8FBA24B97BA774)(*(_DWORD *)&self->_flags & 0xFFFFBFFF | v19);
    if ((objc_opt_respondsToSelector(obj, "messageViewControllerMessageListMailboxScope:") & 1) != 0)
      v20 = 0x8000;
    else
      v20 = 0;
    self->_flags = ($087CBA907898140F4D8FBA24B97BA774)(*(_DWORD *)&self->_flags & 0xFFFF7FFF | v20);
    if ((objc_opt_respondsToSelector(obj, "messageSourceMailboxObjectIDForMessageViewController:") & 1) != 0)
      v21 = 0x10000;
    else
      v21 = 0;
    self->_flags = ($087CBA907898140F4D8FBA24B97BA774)(*(_DWORD *)&self->_flags & 0xFFFEFFFF | v21);
    if ((objc_opt_respondsToSelector(obj, "messageViewController:webViewDidTerminateWithReason:") & 1) != 0)
      v22 = 0x20000;
    else
      v22 = 0;
    self->_flags = ($087CBA907898140F4D8FBA24B97BA774)(*(_DWORD *)&self->_flags & 0xFFFDFFFF | v22);
    v5 = obj;
  }

}

- (void)setAutomaticallyCollapseQuotedContent:(BOOL)a3
{
  -[MFMessageViewController setAutomaticallyCollapseQuotedContent:reloadIfNeeded:](self, "setAutomaticallyCollapseQuotedContent:reloadIfNeeded:", a3, 0);
}

- (void)setAutomaticallyCollapseQuotedContent:(BOOL)a3 reloadIfNeeded:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  self->_automaticallyCollapseQuotedContent = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView"));
  objc_msgSend(v6, "setAutomaticallyCollapseQuotedContent:reloadIfNeeded:", v5, v4);

}

- (void)setConfiguredForSingleMessageDisplay:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  self->_configuredForSingleMessageDisplay = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "mf_hasCompactDimension");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView"));
  if (v6)
    objc_msgSend(v7, "setShowMessageFooter:", !v3);
  else
    objc_msgSend(v7, "setShowMessageFooter:", 1);

  if (v3)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView", 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "headerView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "headerBlocks"));

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v13);
          v15 = objc_opt_class(MFConversationItemHeaderBlock);
          if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
            objc_msgSend(v14, "setShowsHeaderDetails:animated:", 0, 0);
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
}

- (void)prepareForQuickReplyAnimationWithContext:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView"));
  objc_msgSend(v4, "prepareForQuickReplyAnimationWithContext:", v5);

}

- (void)setContentRequest:(id)a3
{
  MessageContentRepresentationRequest *v5;
  MessageContentRepresentationRequest *v6;
  void *v7;
  MessageContentRequestRetryMiddleware *v8;
  MessageContentRequestRetryMiddleware *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  _BYTE location[12];
  __int16 v17;
  __CFString *v18;

  v5 = (MessageContentRepresentationRequest *)a3;
  v6 = v5;
  if (self->_contentRequest == v5 && -[MessageContentRepresentationRequest state](v5, "state") != (id)3)
  {
    if (self->_contentRequest == v6)
      v10 = CFSTR("assigning the same contentRequest");
    else
      v10 = CFSTR("message content representation request failed");
    v11 = v10;
    v12 = MFLogGeneral(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 134218242;
      *(_QWORD *)&location[4] = self;
      v17 = 2114;
      v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%p: Skipping setting the content request: %{public}@", location, 0x16u);
    }

  }
  else
  {
    objc_storeStrong((id *)&self->_contentRequest, a3);
    -[MFMessageViewController setDidCompleteFirstPaint:](self, "setDidCompleteFirstPaint:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView"));
    objc_msgSend(v7, "setContentRequest:", v6);

    -[MFMessageViewController setRetryMiddleware:](self, "setRetryMiddleware:", 0);
    if (v6)
    {
      *(_QWORD *)location = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)location, self);
      v8 = [MessageContentRequestRetryMiddleware alloc];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100186D1C;
      v14[3] = &unk_10051B1B8;
      objc_copyWeak(&v15, (id *)location);
      v9 = -[MessageContentRequestRetryMiddleware initWithMessageContentRequest:handler:](v8, "initWithMessageContentRequest:handler:", v6, v14);
      -[MFMessageViewController setRetryMiddleware:](self, "setRetryMiddleware:", v9);

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)location);
    }
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFMessageViewController;
  -[MFMessageViewController traitCollectionDidChange:](&v5, "traitCollectionDidChange:", v4);
  -[MFMessageViewController setConfiguredForSingleMessageDisplay:](self, "setConfiguredForSingleMessageDisplay:", -[MFMessageViewController configuredForSingleMessageDisplay](self, "configuredForSingleMessageDisplay"));

}

- (void)hideMenuForSelectedContentRepresentation
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MFMessageViewController doc](self, "doc"));
  objc_msgSend(v2, "dismissMenuAnimated:", 1);

}

- (void)showMenuForSelectedContentRepresentation:(id)a3 fromRect:(CGRect)a4 view:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void **v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *);
  void *v36;
  id v37;
  id v38;
  _QWORD *v39;
  id v40;
  id location;
  _QWORD v42[5];
  id v43;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "scrollView"));
  objc_msgSend(v14, "zoomScale");
  -[MFMessageViewController _setAttachmentOriginRect:scale:](self, "_setAttachmentOriginRect:scale:", x, y, width, height, v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController _attachmentShowcase](self, "_attachmentShowcase"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "documentInteractionControllerForContentRepresentation:", v11));

  objc_msgSend(v17, "setDelegate:", self);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView"));
  objc_msgSend(v17, "setIsContentManaged:", objc_msgSend(v18, "sourceIsManaged"));

  -[MFMessageViewController setDoc:](self, "setDoc:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentItem"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "uniformTypeIdentifier"));
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = sub_100187230;
  v42[4] = sub_100187240;
  v43 = (id)0xAAAAAAAAAAAAAAAALL;
  v21 = v17;
  v43 = v21;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v33 = _NSConcreteStackBlock;
  v34 = 3221225472;
  v35 = sub_100187248;
  v36 = &unk_100521ED0;
  objc_copyWeak(&v40, &location);
  v22 = v20;
  v37 = v22;
  v23 = v11;
  v38 = v23;
  v39 = v42;
  objc_msgSend(v21, "_setCompletionWithItemsHandler:", &v33);
  v24 = objc_msgSend(v21, "presentOptionsMenuFromRect:inView:animated:", v12, 1, x, y, width, height, v33, v34, v35, v36);
  if ((v24 & 1) == 0)
  {
    v25 = MFLogGeneral(v24);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      sub_100394578((uint64_t)v23, v26, v27, v28, v29, v30, v31, v32);

    if (objc_msgSend(v22, "ef_conformsToRFC822UTType"))
      -[MFMessageViewController showSelectedContentRepresentation:fromRect:view:](self, "showSelectedContentRepresentation:fromRect:view:", v23, v12, x, y, width, height);
  }

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);
  _Block_object_dispose(v42, 8);

}

- (void)showSelectedExchangeEventUID:(int)a3 fromRect:(CGRect)a4 view:(id)a5
{
  -[MFMessageViewController _showSelectedContentRepresentation:exchangeEventUID:fromRect:view:](self, "_showSelectedContentRepresentation:exchangeEventUID:fromRect:view:", 0, *(_QWORD *)&a3, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)showSelectedContentRepresentation:(id)a3 fromRect:(CGRect)a4 view:(id)a5
{
  -[MFMessageViewController _showSelectedContentRepresentation:exchangeEventUID:fromRect:view:](self, "_showSelectedContentRepresentation:exchangeEventUID:fromRect:view:", a3, 0, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)_showSelectedContentRepresentation:(id)a3 exchangeEventUID:(int)a4 fromRect:(CGRect)a5 view:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v11;
  id v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = *(_QWORD *)&a4;
  v25 = a3;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "scrollView"));
  objc_msgSend(v15, "zoomScale");
  -[MFMessageViewController _setAttachmentOriginRect:scale:](self, "_setAttachmentOriginRect:scale:", x, y, width, height, v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MFAttachmentShowcaseInformation showcaseInformation](MFAttachmentShowcaseInformation, "showcaseInformation"));
  objc_msgSend(v17, "setShouldAnimate:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView"));
  objc_msgSend(v17, "setFromManagedAccount:", objc_msgSend(v18, "sourceIsManaged"));

  objc_msgSend(v17, "setOriginRect:", x, y, width, height);
  objc_msgSend(v17, "setOriginView:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController contentRequest](self, "contentRequest"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "message"));
  objc_msgSend(v17, "setMessage:", v20);

  if ((*((_BYTE *)&self->_flags + 2) & 1) != 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "messageSourceMailboxObjectIDForMessageViewController:", self));
    objc_msgSend(v17, "setMailboxObjectID:", v22);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController _attachmentShowcase](self, "_attachmentShowcase"));
  if ((_DWORD)v11)
  {
    objc_msgSend(v23, "presentExchangeEventUID:showcaseInfo:delegate:completion:", v11, v17, self, 0);
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController scene](self, "scene"));
    objc_msgSend(v23, "presentContentRepresentation:scene:showcaseInfo:delegate:completion:", v25, v24, v17, self, &stru_100521EF0);

  }
}

- (void)didStartDownloadForContentItemWithProgress:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate"));
    objc_msgSend(v4, "messageViewController:didStartDownloadForContentItemWithProgress:", self, v5);

  }
}

- (id)participantHeaderForContactStore:(id)a3
{
  id v4;
  MFConversationItemHeaderBlock *participantHeader;
  id v6;
  MFConversationItemHeaderBlock *v7;
  void *v8;
  MFConversationItemHeaderBlock *v9;
  MFConversationItemHeaderBlock *v10;
  MFConversationItemHeaderBlock *v11;

  v4 = a3;
  participantHeader = self->_participantHeader;
  if (!participantHeader
    || (v6 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock contactStore](participantHeader, "contactStore")),
        v6,
        v6 != v4))
  {
    v7 = [MFConversationItemHeaderBlock alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController accountsProvider](self, "accountsProvider"));
    v9 = -[MFConversationItemHeaderBlock initWithFrame:contactStore:accountsProvider:](v7, "initWithFrame:contactStore:accountsProvider:", v4, v8, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v10 = self->_participantHeader;
    self->_participantHeader = v9;

    -[MFConversationItemHeaderBlock setDelegate:](self->_participantHeader, "setDelegate:", self);
  }
  v11 = self->_participantHeader;

  return v11;
}

- (void)messageContentView:(id)a3 didFinishRenderingWithHeight:(double)a4
{
  id v6;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate", a3));
    objc_msgSend(v6, "messageViewController:didFinishRenderingWithHeight:", self, a4);

  }
}

- (void)messageContentViewDidFinishFirstPaint:(id)a3
{
  id v4;

  -[MFMessageViewController setDidCompleteFirstPaint:](self, "setDidCompleteFirstPaint:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate"));
    objc_msgSend(v4, "messageViewControllerDidFinishFirstPaint:", self);

  }
}

- (void)messageContentViewDidDisplayContent:(id)a3 success:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v4 = a4;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate", a3));
    objc_msgSend(v6, "messageViewControllerDidDisplayContent:success:", self, v4);

  }
}

- (void)messageContentView:(id)a3 expandQuoteAtCollapsedOffset:(CGPoint)a4 expandedOffset:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  id v10;

  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    y = a5.y;
    x = a5.x;
    v7 = a4.y;
    v8 = a4.x;
    v10 = (id)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate", a3));
    objc_msgSend(v10, "messageViewController:didTapShowMoreAtCollapsedOffset:expandedOffset:", self, v8, v7, x, y);

  }
}

- (void)messageContentView:(id)a3 didTapRevealActionsButton:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate"));
    objc_msgSend(v5, "messageViewController:didTapRevealActionsButton:", self, v6);

  }
}

- (void)messageContentView:(id)a3 didTapUndoSendButton:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  if ((*((_BYTE *)&self->_flags + 1) & 2) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate"));
    objc_msgSend(v5, "messageViewController:didTapUndoSendButton:", self, v6);

  }
}

- (void)messageContentViewWillBeginZoomingMessage:(id)a3
{
  id v4;

  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate", a3));
    objc_msgSend(v4, "messageViewControllerContentViewWillBeginZooming:", self);

  }
}

- (void)messageContentView:(id)a3 didEndZoomingMessageWithOffset:(CGPoint)a4
{
  double y;
  double x;
  id v7;

  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    y = a4.y;
    x = a4.x;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate", a3));
    objc_msgSend(v7, "messageViewController:contentViewDidEndZoomingMessageWithOffset:", self, x, y);

  }
}

- (void)messageContentView:(id)a3 didChangeSelectedHTML:(id)a4
{
  void *v5;
  const __CFString *v6;
  __CFString *v7;

  v7 = (__CFString *)a4;
  if ((*((_BYTE *)&self->_flags + 1) & 0x20) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate"));
    if (v7)
      v6 = v7;
    else
      v6 = &stru_100531B00;
    objc_msgSend(v5, "messageViewController:didChangeSelectedHTML:", self, v6);

  }
}

- (void)messageContentView:(id)a3 loadingIndicatorDidChangeVisibility:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  if ((*((_BYTE *)&self->_flags + 1) & 0x40) != 0)
  {
    v4 = a4;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate", a3));
    objc_msgSend(v6, "messageViewController:loadingIndicatorDidChangeVisibility:", self, v4);

  }
}

- (void)messageViewControllerDidTapToExpand
{
  id v3;

  if ((*((_BYTE *)&self->_flags + 1) & 4) != 0)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate"));
    objc_msgSend(v3, "messageViewControllerDidTapToExpand:", self);

  }
}

- (id)presentingViewControllerForMessageContentView:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentingViewControllerForMessageViewController:", self));

  return v5;
}

- (void)messageContentView:(id)a3 scrollToRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate", a3));
  if ((objc_opt_respondsToSelector(v9, "messageViewController:scrollToRect:") & 1) != 0)
    objc_msgSend(v9, "messageViewController:scrollToRect:", self, x, y, width, height);

}

- (void)messageContentView:(id)a3 didLoadSecurityInformation:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  -[MFMessageViewController setSecurityInformation:](self, "setSecurityInformation:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController contactInteraction](self, "contactInteraction"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController contactInteraction](self, "contactInteraction"));
    objc_msgSend(v6, "updateWithSecurityInformation:", v7);

  }
}

- (void)messageContentView:(id)a3 clickedLinkInMessage:(id)a4 scheme:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController scene](self, "scene"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "daemonInterface"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "interactionLogger"));
  objc_msgSend(v10, "clickedLinkInMessage:scheme:", v11, v7);

}

- (void)messageContentView:(id)a3 openPossibleStoreURL:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  MFMessageViewController *v13;
  id v14;

  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_100188064;
  v12 = &unk_100521F18;
  v13 = self;
  v14 = a4;
  v8 = v14;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MFURLRoutingRequest requestWithURL:builderBlock:](MFURLRoutingRequest, "requestWithURL:builderBlock:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController scene](self, "scene"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "urlRouter"));
  objc_msgSend(v7, "routeRequest:", v5);

}

- (void)messageContentViewContentLayerFinished:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3));
  objc_msgSend(v3, "_messageContentLayerFinished");

}

- (void)messageContentView:(id)a3 handleContentRepresentation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController suggestionController](self, "suggestionController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "createAnalysisOperation"));
  objc_msgSend(v8, "handleContentRepresentation:allowUnsubscribe:", v6, objc_msgSend(v9, "hideSenderSpecificBanners") ^ 1);

}

- (void)messageContentView:(id)a3 clearSuggestionsBannerAnimated:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MFMessageViewController suggestionController](self, "suggestionController", a3));
  objc_msgSend(v5, "clearSuggestionsBannerAnimated:", v4);

}

- (void)messageContentView:(id)a3 viewedRemoteURLs:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController scene](self, "scene"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "daemonInterface"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageRepository"));
  objc_msgSend(v7, "noteViewOfRemoteContentLinks:", v8);

}

- (void)messageContentView:(id)a3 webViewDidTerminateWithReason:(int64_t)a4
{
  id v6;

  if ((*((_BYTE *)&self->_flags + 2) & 2) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate", a3));
    objc_msgSend(v6, "messageViewController:webViewDidTerminateWithReason:", self, a4);

  }
}

- (id)viewControllerForPresentingSuggestions
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentingViewControllerForMessageViewController:", self));

  return v4;
}

- (void)presentSuggestionViewController:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView"));
  objc_msgSend(v4, "_showModalViewController:presentationSource:", v5, 0);

}

- (BOOL)showsBanners
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView"));
  v3 = objc_msgSend(v2, "showsBanners");

  return v3;
}

- (id)presentingViewControllerForAttachmentShowcase:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentingViewControllerForMessageViewController:", self));

  return v5;
}

- (id)contactStoreForAttachmentShowcase:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MFMessageViewController contactStore](self, "contactStore", a3));
}

- (id)messageContentView:(id)a3 quotedContentAttributionForMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    goto LABEL_6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "messageViewController:mostRecentAncestorMessageForMessage:", self, v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstSender"));
  if (!v10)
  {

    goto LABEL_6;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController _delegateDisplayNameForEmailAddress:abbreviated:](self, "_delegateDisplayNameForEmailAddress:abbreviated:", v10, 0));

  if (!v11)
  {
LABEL_6:
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MFQuotedContentAttribution noAttribution](MFQuotedContentAttribution, "noAttribution"));
    goto LABEL_7;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MFQuotedContentAttribution attributionWithSenderName:](MFQuotedContentAttribution, "attributionWithSenderName:", v11));

LABEL_7:
  return v12;
}

- (id)messageSourceMailboxObjectIDForMessageContentView:(id)a3
{
  void *v3;
  void *v5;

  if ((*((_BYTE *)&self->_flags + 2) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate", a3));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messageSourceMailboxObjectIDForMessageViewController:", self));

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)conversationItemHeaderWasTapped:(id)a3
{
  -[MFMessageViewController messageViewControllerDidTapToExpand](self, "messageViewControllerDidTapToExpand", a3);
}

- (void)conversationItemHeader:(id)a3 didSelectAddressAtom:(id)a4 forAtomType:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  $087CBA907898140F4D8FBA24B97BA774 flags;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fullAddress"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController _contactViewControllerForAddress:forAtomType:](self, "_contactViewControllerForAddress:forAtomType:", v7, a5));
  -[MFMessageViewController setContactViewController:](self, "setContactViewController:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController contactViewController](self, "contactViewController"));
  if (v9)
  {
    flags = self->_flags;

    if ((*(_WORD *)&flags & 0x800) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController contactViewController](self, "contactViewController"));
      objc_msgSend(v11, "messageViewControllerDidTapAddressAtom:contactViewController:", v13, v12);

    }
  }

}

- (void)conversationItemHeader:(id)a3 didSelectAddress:(id)a4 forAtomType:(unint64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController _contactViewControllerForAddress:forAtomType:](self, "_contactViewControllerForAddress:forAtomType:"));
  -[MFMessageViewController setContactViewController:](self, "setContactViewController:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController contactViewController](self, "contactViewController"));
  if (v8)
  {
    v9 = objc_opt_respondsToSelector(v7, "messageViewControllerDidChooseAddress:contactViewController:");

    if ((v9 & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController contactViewController](self, "contactViewController"));
      objc_msgSend(v7, "messageViewControllerDidChooseAddress:contactViewController:", v11, v10);

    }
  }

}

- (id)conversationItemHeader:(id)a3 displayNameForEmailAddress:(id)a4 abbreviated:(BOOL)a5
{
  return (id)objc_claimAutoreleasedReturnValue(-[MFMessageViewController _delegateDisplayNameForEmailAddress:abbreviated:](self, "_delegateDisplayNameForEmailAddress:abbreviated:", a4, a5));
}

- (id)popoverManagerForForConversationItemHeader:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController scene](self, "scene", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "popoverManager"));

  return v4;
}

- (void)conversationItemHeader:(id)a3 didTapRevealActionsButton:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate"));
    objc_msgSend(v5, "messageViewController:didTapRevealActionsButton:", self, v6);

  }
}

- (void)conversationItemHeaderDidTapBIMILearnMore:(id)a3
{
  -[MFMessageViewController _presentBIMILearnMoreViewController](self, "_presentBIMILearnMoreViewController", a3);
}

- (void)conversationItemHeader:(id)a3 presentViewController:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a4;
  v5 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v7);
  v6 = objc_opt_class(MFMessageInfoViewController);
  if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
    -[MFMessageViewController setDelegate:](self, "setDelegate:", v7);
  -[MFMessageViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

- (CGRect)documentInteractionControllerRectForPreview:(id)a3
{
  CGFloat y;
  double x;
  double width;
  CGFloat height;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  x = self->_attachmentRect.origin.x;
  y = self->_attachmentRect.origin.y;
  width = self->_attachmentRect.size.width;
  height = self->_attachmentRect.size.height;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "icons"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));

  if (v8)
  {
    objc_msgSend(v8, "size");
    x = x + (width + -74.0 + v9) * 0.5;
  }

  v10 = x;
  v11 = y;
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)documentInteractionControllerViewForPreview:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MFMessageViewController view](self, "view", a3));
}

- (id)documentInteractionControllerTransitionImageForPreview:(id)a3 contentRect:(CGRect *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  CGSize v12;
  CGSize size;
  uint64_t v15;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "icons"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scrollView"));
    objc_msgSend(v9, "zoomScale");
    v15 = v10;

    size = self->_attachmentRect.size;
    objc_msgSend(v7, "size");
    v12 = (CGSize)vmulq_n_f64(vcvtq_f64_f32(vrnda_f32(vcvt_f32_f64(vmulq_n_f64(vdivq_f64((float64x2_t)xmmword_1004C9970, vdivq_f64((float64x2_t)size, (float64x2_t)vdupq_lane_s64(v15, 0))), v11)))), *(double *)&v15);
    a4->size = v12;
    *(float *)&v11 = (v11 - v12.width) * 0.5;
    a4->origin.x = roundf(*(float *)&v11);
    a4->origin.y = *(double *)&v15 * 15.0;
  }

  return v7;
}

- (id)excludedActivityTypesForDocumentInteractionController:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  _QWORD v9[3];

  v9[0] = MFActivityTypeQuicklook;
  v9[1] = UIActivityTypeSaveToCameraRoll;
  v9[2] = UIActivityTypeMarkupAsPDF;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView"));
  v6 = objc_msgSend(v5, "mayShareToUnmanaged");

  if ((v6 & 1) == 0)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObject:", UIActivityTypeCopyToPasteboard));

    v4 = (void *)v7;
  }
  return v4;
}

- (id)additionalActivitiesForDocumentInteractionController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MessageSaveVideoAttachmentActivity *v10;
  MessageSaveAllAttachmentsActivity *v11;
  void *v12;
  Class v13;
  char isKindOfClass;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  unsigned int v21;
  id v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathExtension"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lowercaseString"));

  if (objc_msgSend(v8, "length"))
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ef_declaredUTTypeFromExtension"));
  else
    v9 = 0;
  if (objc_msgSend(v9, "conformsToType:", UTTypeMovie))
  {
    v10 = -[MessageSaveToCameraRollActivity initWithAttachmentHandlingDelegate:context:]([MessageSaveVideoAttachmentActivity alloc], "initWithAttachmentHandlingDelegate:context:", self, 2);
    v11 = -[MessageSaveToCameraRollActivity initWithAttachmentHandlingDelegate:context:]([MessageSaveAllAttachmentsActivity alloc], "initWithAttachmentHandlingDelegate:context:", self, 2);
    objc_msgSend(v5, "addObject:", v10);
  }
  else
  {
    v10 = -[MessageSaveToCameraRollActivity initWithAttachmentHandlingDelegate:context:]([MessageSaveImageAttachmentActivity alloc], "initWithAttachmentHandlingDelegate:context:", self, 1);
    objc_msgSend(v5, "addObject:", v10);
    v11 = -[MessageSaveToCameraRollActivity initWithAttachmentHandlingDelegate:context:]([MessageSaveAllAttachmentsActivity alloc], "initWithAttachmentHandlingDelegate:context:", self, 1);
  }
  objc_msgSend(v5, "addObject:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController presentedViewController](self, "presentedViewController"));
  v13 = off_1005A24C8();
  isKindOfClass = objc_opt_isKindOfClass(v12, v13);

  if (!(isKindOfClass & 1 | (v6 == 0)))
  {
    if (-[objc_class canPreviewItem:](off_1005A24C8(), "canPreviewItem:", v6))
    {
      v15 = objc_msgSend(objc_alloc((Class)MessageQuicklookImageAttachmentsActivity), "initWithAttachmentHandlingDelegate:context:url:", self, 1, v6);
      objc_msgSend(v5, "addObject:", v15);

    }
    if ((objc_msgSend(v9, "conformsToType:", UTTypePDF) & 1) == 0)
    {
      v16 = objc_msgSend(objc_alloc(off_1005A24D0()), "initWithURL:", v6);
      v17 = -[objc_class printPageRendererForItem:](off_1005A24C8(), "printPageRendererForItem:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      if (v18)
      {
        v19 = objc_msgSend(objc_alloc((Class)MessagePrintQuicklookableAttachmentActivity), "initWithPrintPageRenderer:", v18);
        objc_msgSend(v5, "addObject:", v19);

      }
    }
  }
  if ((isKindOfClass & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    v21 = objc_msgSend(v20, "ef_conformsToMarkupUTType");

    if (v21)
    {
      v22 = objc_msgSend(objc_alloc((Class)MessageMarkupDocumentActivity), "initWithAttachmentHandlingDelegate:context:", self, 0);
      objc_msgSend(v5, "addObject:", v22);

    }
  }

  return v5;
}

- (void)_getNumberOfImages:(unint64_t *)a3 videos:(unint64_t *)a4 undownloaded:(unint64_t *)a5
{
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentItems"));

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v6;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v14 = objc_msgSend(v13, "isAvailableLocally");
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "type"));
        if (objc_msgSend(v15, "conformsToType:", UTTypeMovie))
        {
          ++v8;
        }
        else
        {
          v16 = objc_msgSend(v15, "conformsToType:", UTTypeImage);
          v7 += v16;
          if (!v16)
            goto LABEL_10;
        }
        v9 += v14 ^ 1;
LABEL_10:

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  if (a3)
    *a3 = v7;
  if (a4)
    *a4 = v8;
  if (a5)
    *a5 = v9;

}

- (BOOL)canSaveAllAttachmentsInContext:(int64_t)a3
{
  void *v5;
  char v6;
  uint64_t v8;
  uint64_t v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView"));
  if (!objc_msgSend(v5, "mayShareToUnmanaged"))
  {

    return 0;
  }
  v6 = MFIsAuthorizedToAccessPhotoLibrary();

  if ((v6 & 1) == 0)
    return 0;
  v8 = 0;
  v9 = 0;
  -[MFMessageViewController _getNumberOfImages:videos:undownloaded:](self, "_getNumberOfImages:videos:undownloaded:", &v9, &v8, 0);
  if (a3 == 2)
  {
    if (v8)
      --v8;
  }
  else if (a3 == 1)
  {
    if (v9)
      --v9;
  }
  return v9 + v8 != 0;
}

- (id)allMediaAttachmentFutures
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentItems"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_filter:", &stru_100521F38));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100189524;
  v8[3] = &unk_100521F60;
  v8[4] = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ef_map:", v8));

  return v6;
}

- (id)localizedTitleForSaveAllAttachmentsAction
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v10 = 0;
  v11 = 0;
  -[MFMessageViewController _getNumberOfImages:videos:undownloaded:](self, "_getNumberOfImages:videos:undownloaded:", &v11, &v10, 0);
  v2 = v10 + v11;
  if ((unint64_t)(v10 + v11) < 2)
  {
    if (v10)
    {
      if (v11)
        return &stru_100531B00;
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SAVE_VIDEO"), &stru_100531B00, CFSTR("Main")));
    }
    else
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SAVE_IMAGE"), &stru_100531B00, CFSTR("Main")));
    }
    v9 = (void *)v8;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter ef_formatInteger:withGrouping:](NSNumberFormatter, "ef_formatInteger:withGrouping:", v10 + v11, 1));
    if (v10)
    {
      if (v11)
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SAVE_N_ATTACHMENTS%1$lu%2$@"), &stru_100531B00, CFSTR("Main")));
        v6 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v2, v3));
      }
      else
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SAVE_N_VIDEOS%1$lu%2$@"), &stru_100531B00, CFSTR("Main")));
        v6 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v10, v3));
      }
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SAVE_N_IMAGES%1$lu%2$@"), &stru_100531B00, CFSTR("Main")));
      v6 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v11, v3));
    }
    v9 = (void *)v6;

  }
  return v9;
}

- (id)assetViewerManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController scene](self, "scene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "assetViewerManager"));

  return v3;
}

- (BOOL)previewController:(id)a3 canEditItem:(id)a4
{
  return 1;
}

- (BOOL)previewController:(id)a3 shouldSaveEditedItem:(id)a4
{
  return 0;
}

- (id)dismissActionsForPreviewController:(id)a3
{
  NSMutableArray *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  Class v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  Class v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  Class v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSMutableArray *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id location[2];

  v4 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentRequest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "message"));

  v8 = objc_msgSend(v7, "shouldShowReplyAll");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController contactStore](self, "contactStore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "senderDisplayNameUsingContactStore:", v9));

  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  if (v10)
  {
    v28 = v4;
    v11 = (Class)off_1005A24D8();
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("REPLY_TO_SENDER"), &stru_100531B00, CFSTR("Main")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v10));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphReply));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100189D48;
    v33[3] = &unk_10051E8D0;
    objc_copyWeak(&v34, location);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class actionWithTitle:image:handler:](v11, "actionWithTitle:image:handler:", v14, v15, v33));

    v4 = v28;
    -[NSMutableArray addObject:](v28, "addObject:", v16);

    objc_destroyWeak(&v34);
  }
  if (v8)
  {
    v17 = (Class)off_1005A24D8();
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("REPLY_ALL"), &stru_100531B00, CFSTR("Main")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphReplyAll));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100189EE8;
    v31[3] = &unk_10051E8D0;
    objc_copyWeak(&v32, location);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class actionWithTitle:image:handler:](v17, "actionWithTitle:image:handler:", v19, v20, v31));

    -[NSMutableArray addObject:](v4, "addObject:", v21);
    objc_destroyWeak(&v32);
  }
  v22 = (Class)off_1005A24D8();
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("TITLE_NEW_MESSAGE"), &stru_100531B00, CFSTR("Main")));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphCompose));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10018A088;
  v29[3] = &unk_10051E8D0;
  objc_copyWeak(&v30, location);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class actionWithTitle:image:handler:](v22, "actionWithTitle:image:handler:", v24, v25, v29));

  -[NSMutableArray addObject:](v4, "addObject:", v26);
  objc_destroyWeak(&v30);
  objc_destroyWeak(location);

  return v4;
}

- (id)documentInteractionControllerMarkupDismissActions:(id)a3
{
  NSMutableArray *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableArray *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id location[2];

  v4 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentRequest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "message"));

  v8 = objc_msgSend(v7, "shouldShowReplyAll");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController contactStore](self, "contactStore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "senderDisplayNameUsingContactStore:", v9));

  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  if (v10)
  {
    v25 = v4;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("REPLY_TO_SENDER"), &stru_100531B00, CFSTR("Main")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v10));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphReply));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10018A734;
    v30[3] = &unk_100521FD8;
    objc_copyWeak(&v31, location);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIDocumentInteractionControllerDismissMarkupAction actionWithTitle:image:handler:](UIDocumentInteractionControllerDismissMarkupAction, "actionWithTitle:image:handler:", v13, v14, v30));

    v4 = v25;
    -[NSMutableArray addObject:](v25, "addObject:", v15);

    objc_destroyWeak(&v31);
  }
  if (v8)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("REPLY_ALL"), &stru_100531B00, CFSTR("Main")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphReplyAll));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10018A8D4;
    v28[3] = &unk_100521FD8;
    objc_copyWeak(&v29, location);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIDocumentInteractionControllerDismissMarkupAction actionWithTitle:image:handler:](UIDocumentInteractionControllerDismissMarkupAction, "actionWithTitle:image:handler:", v17, v18, v28));

    -[NSMutableArray addObject:](v4, "addObject:", v19);
    objc_destroyWeak(&v29);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("TITLE_NEW_MESSAGE"), &stru_100531B00, CFSTR("Main")));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphCompose));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10018AA74;
  v26[3] = &unk_100521FD8;
  objc_copyWeak(&v27, location);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIDocumentInteractionControllerDismissMarkupAction actionWithTitle:image:handler:](UIDocumentInteractionControllerDismissMarkupAction, "actionWithTitle:image:handler:", v21, v22, v26));

  -[NSMutableArray addObject:](v4, "addObject:", v23);
  objc_destroyWeak(&v27);
  objc_destroyWeak(location);

  return v4;
}

- (id)_makeFileCopyOfEditedQuickLookFileToLocalContainer:(id)a3 preferredFileName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v15;
  _BYTE v16[24];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v15 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mf_copyFileAtURLToContainer:securityScoped:preferredFileName:error:", v5, 1, v6, &v15));
  v9 = v15;

  if (!v8)
  {
    v11 = MFLogGeneral(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ef_publicDescription"));
      sub_100394648(v13, (uint64_t)v16, v12);
    }

  }
  return v8;
}

- (void)_performMailAction:(int64_t)a3 withMarkedUpFileAttachments:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  MFMessageViewController *v21;
  _QWORD v22[4];
  id v23;

  v7 = a4;
  if ((unint64_t)a3 < 7 && ((0x71u >> a3) & 1) != 0)
  {
    v9 = qword_1004C9980[a3];
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMessageViewController.m"), 974, CFSTR("Message action value %lu is undefined."), a3);

    v9 = 5;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentRequest"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "message"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MFComposeMailMessage legacyMessageWithMessage:mailboxUid:skipAttachmentDownload:](MFComposeMailMessage, "legacyMessageWithMessage:mailboxUid:skipAttachmentDownload:", v12, 0, 1));
  v14 = objc_alloc((Class)_MFMailCompositionContext);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "emailMessageRepresentation"));
  v16 = objc_msgSend(v14, "initWithComposeType:originalMessage:legacyMessage:", v9, v15, v13);

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10018B030;
  v22[3] = &unk_100522000;
  v17 = v16;
  v23 = v17;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v22);
  objc_msgSend(v17, "setOriginatingFromAttachmentMarkup:", 1);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = sub_100187230;
  v20[4] = sub_100187240;
  v21 = (MFMessageViewController *)0xAAAAAAAAAAAAAAAALL;
  v21 = self;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController scene](v21, "scene"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10018B03C;
  v19[3] = &unk_100522028;
  v19[4] = v20;
  objc_msgSend(v18, "showComposeWithContext:animated:initialTitle:presentationSource:completionBlock:", v17, 1, 0, 0, v19);

  _Block_object_dispose(v20, 8);
}

- (void)presentMarkupViewController:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  MFMessageViewController *v6;
  id v7;

  v6 = self;
  v3 = a3;
  v7 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_10018B10C, &unk_10051A910, v6));
  objc_msgSend(v4, "performBlock:", &v5);

}

- (void)dismissMarkupViewController
{
  void *v2;
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10018B278;
  v3[3] = &unk_10051AA98;
  v3[4] = self;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  objc_msgSend(v2, "performBlock:", v3);

}

- (id)_attachmentShowcase
{
  MFAttachmentShowcase *attachmentShowcase;
  MFAttachmentShowcase *v4;
  MFAttachmentShowcase *v5;

  attachmentShowcase = self->_attachmentShowcase;
  if (!attachmentShowcase)
  {
    v4 = objc_alloc_init(MFAttachmentShowcase);
    v5 = self->_attachmentShowcase;
    self->_attachmentShowcase = v4;

    -[MFAttachmentShowcase setPresentingViewController:](self->_attachmentShowcase, "setPresentingViewController:", self);
    -[MFAttachmentShowcase setDocumentInteractionControllerDelegate:](self->_attachmentShowcase, "setDocumentInteractionControllerDelegate:", self);
    attachmentShowcase = self->_attachmentShowcase;
  }
  return attachmentShowcase;
}

- (void)_setAttachmentOriginRect:(CGRect)a3 scale:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  id v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController view](self, "view"));
  objc_msgSend(v9, "convertRect:fromView:", v14, x, y, width, height);
  self->_attachmentRect.origin.x = v10;
  self->_attachmentRect.origin.y = v11;
  self->_attachmentRect.size.width = v12;
  self->_attachmentRect.size.height = v13;

}

- (void)_previewURL:(id)a3 withEditingEnabled:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  MFMessageViewController *v15;
  id v16;
  id v17;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(objc_alloc(off_1005A24D0()), "initWithURL:", v6);
  if (v7)
  {
    v8 = objc_alloc(off_1005A24C8());
    v17 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    v10 = objc_msgSend(v8, "initWithPreviewItems:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView"));
    objc_msgSend(v10, "setIsContentManaged:", objc_msgSend(v11, "sourceIsManaged"));

    if (v4)
      objc_msgSend(v10, "setAppearanceActions:", 4);
    objc_msgSend(v10, "setDelegate:", self);
    -[MFMessageViewController setPreviewController:](self, "setPreviewController:", v10);
    objc_msgSend(v10, "setModalPresentationStyle:", 5);
    v15 = self;
    v12 = v10;
    v16 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_10018B5A4, &unk_10051A910, v15));
    objc_msgSend(v13, "performBlock:", &v14);

  }
}

- (BOOL)isSourceManagedForURL:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView", a3));
  v4 = objc_msgSend(v3, "sourceIsManaged");

  return v4;
}

- (void)previewURL:(id)a3
{
  -[MFMessageViewController _previewURL:withEditingEnabled:](self, "_previewURL:withEditingEnabled:", a3, 0);
}

- (void)markupURL:(id)a3
{
  -[MFMessageViewController _previewURL:withEditingEnabled:](self, "_previewURL:withEditingEnabled:", a3, 1);
}

- (id)_delegateDisplayNameForEmailAddress:(id)a3 abbreviated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v6 = a3;
  if ((*((_BYTE *)&self->_flags + 1) & 0x10) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "messageViewController:displayNameForEmailAddress:abbreviated:", self, v6, v4));

  }
  else
  {
    v7 = 0;
  }
  if (v7)
    v9 = v7;
  else
    v9 = v6;
  v10 = v9;

  return v10;
}

- (id)_contactViewControllerForAddress:(id)a3 forAtomType:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id WeakRetained;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  void *v67;
  unsigned int v68;
  id v69;
  void *v70;
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  id v75;
  _QWORD v76[4];
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;

  v69 = a3;
  v71 = objc_alloc_init((Class)CNContactStore);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "stringValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController descriptorForRequiredKeys](CNContactViewController, "descriptorForRequiredKeys"));
  v81 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v81, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "em_fetchContactForEmailAddress:keysToFetch:createIfNeeded:", v6, v8, 1));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController contentRequest](self, "contentRequest"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "resultIfAvailable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "requestedHeaders"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstHeaderForKey:", ECMessageHeaderKeyHMEAddress));
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[ECTagValueList tagValueListFromString:error:](ECTagValueList, "tagValueListFromString:error:", v13, 0));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "emailAddressValue"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "simpleAddress"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectForKeyedSubscript:", EMHeaderTagHMEAddress));
  v68 = objc_msgSend(v15, "isEqualToString:", v16);

  if (v68)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[EMHideMyEmail sharedInstance](EMHideMyEmail, "sharedInstance"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "forwardingEmailForPrimaryAccount"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController descriptorForRequiredKeys](CNContactViewController, "descriptorForRequiredKeys"));
    v80 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v80, 1));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "em_fetchContactForEmailAddress:keysToFetch:createIfNeeded:", v18, v20, 1));

    v22 = 0;
    v9 = (void *)v21;
  }
  else
  {
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectForKeyedSubscript:", EMHeaderTagHMESenderAddress));
    if (!v22)
    {
      v23 = 0;
      if (v9)
        goto LABEL_6;
LABEL_12:
      v31 = 0;
      goto LABEL_26;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController descriptorForRequiredKeys](CNContactViewController, "descriptorForRequiredKeys"));
    v79 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v79, 1));
    v20 = v9;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "em_fetchContactForEmailAddress:keysToFetch:createIfNeeded:", v22, v19, 1));
  }

  v23 = (void *)v22;
  if (!v9)
    goto LABEL_12;
LABEL_6:
  if (objc_msgSend(v9, "hasBeenPersisted")
    && +[MFContactsManager isAuthorizedToUseContacts](MFContactsManager, "isAuthorizedToUseContacts"))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController viewControllerForContact:](CNContactViewController, "viewControllerForContact:", v9));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "emailAddressValue"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "simpleAddress"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "emailAddressValue"));

    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "emailAddresses"));
      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472;
      v76[2] = sub_10018C32C;
      v76[3] = &unk_100521C50;
      v77 = v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "ef_firstObjectPassingTest:", v76));

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "identifier"));
    }
    else
    {
      v30 = 0;
    }
    objc_msgSend(v24, "highlightPropertyWithKey:identifier:", CNContactEmailAddressesKey, v30);

    v31 = v24;
  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController viewControllerForUnknownContact:](CNContactViewController, "viewControllerForUnknownContact:", v9));
  }
  if ((+[MFContactsManager isAuthorizedToUseContacts](MFContactsManager, "isAuthorizedToUseContacts") & 1) == 0)objc_msgSend(v31, "setActions:", (unint64_t)objc_msgSend(v31, "actions") & 0xFFFFFFFFFFFFFFDFLL);
  objc_msgSend(v31, "setContactStore:", v71);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController contentRequest](self, "contentRequest"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "message"));

  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "daemonInterface"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "blockedSenderManager"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[MFContactCardInteractions contactCardInteractionWithViewController:blockedSenderManager:](MFContactCardInteractions, "contactCardInteractionWithViewController:blockedSenderManager:", v31, v35));
  -[MFMessageViewController setContactCardInteractions:](self, "setContactCardInteractions:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController contactCardInteractions](self, "contactCardInteractions"));
  objc_msgSend(v37, "configureInteractionsWithInteractionDelegate:", self);

  objc_msgSend(v31, "_setDataOwnerForCopy:", -[MFMessageViewController _dataOwnerForCopy](self, "_dataOwnerForCopy"));
  objc_msgSend(v31, "_setDataOwnerForPaste:", -[MFMessageViewController _dataOwnerForPaste](self, "_dataOwnerForPaste"));
  if (a4 == 1)
  {
    v41 = objc_alloc_init((Class)MFContactMessageInteraction);
    -[MFMessageViewController setContactInteraction:](self, "setContactInteraction:");
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController contactInteraction](self, "contactInteraction"));
    objc_msgSend(v53, "setDelegate:", self);

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController contactInteraction](self, "contactInteraction"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController securityInformation](self, "securityInformation"));
    objc_msgSend(v54, "updateWithSecurityInformation:", v55);

    -[MFMessageViewController _setupHeaderViewForContactViewController:](self, "_setupHeaderViewForContactViewController:", v31);
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController scene](self, "scene"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "brandIndicatorProvider"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController contentRequest](self, "contentRequest"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "message"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "brandIndicatorLocation"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "brandIndicatorFutureForLocation:", v60));
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_10018C3EC;
    v72[3] = &unk_100522050;
    v73 = v23;
    v74 = v67;
    v75 = v31;
    objc_msgSend(v61, "addSuccessBlock:", v72);

    v42 = v73;
LABEL_22:

    goto LABEL_23;
  }
  if (a4 == 2)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController contentRequest](self, "contentRequest"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "contentRepresentationFuture"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "result"));
    v41 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "replyToList"));

    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "senderAddress"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "senderAddress"));
    v78 = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v78, 1));
    LODWORD(v38) = +[MFAddressAtomStatusManager shouldDecorateAtomListForSender:replyTo:](MFAddressAtomStatusManager, "shouldDecorateAtomListForSender:replyTo:", v44, v41);

    if ((_DWORD)v38)
    {
      v45 = objc_alloc((Class)MFSecureMIMEPersonHeaderView);
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailSecureMIMERegularTextColor](UIColor, "mailSecureMIMERegularTextColor"));
      v47 = objc_msgSend(v45, "initWithFrame:warningLabelTextColor:", v46, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

      v48 = _EFLocalizedString(CFSTR("Different Reply Address"), &unk_10059D2A0, &unk_10059D2A8);
      v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
      objc_msgSend(v47, "setWarningLabelText:", v49);

      v50 = _EFLocalizedString(CFSTR("The email address you’re replying to does not match the original email address from “%@”"), &unk_10059D2A0, &unk_10059D2A8);
      v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v51, v42));

      objc_msgSend(v47, "setExplanationText:", v52);
      objc_msgSend(v31, "setContactHeaderView:", v47);

    }
    goto LABEL_22;
  }
LABEL_23:
  if (v68)
  {
    v62 = objc_alloc((Class)MFHideMyEmailHeaderView);
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "emailAddressValue"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "simpleAddress"));
    v65 = objc_msgSend(v62, "initWithFrame:address:", v64, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

    objc_msgSend(v31, "setContactHeaderView:", v65);
  }

LABEL_26:
  objc_msgSend(v31, "setPreferredContentSize:", 0.0, 700.0);

  return v31;
}

- (void)_setupHeaderViewForContactViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController contactInteraction](self, "contactInteraction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "headerView"));

  if (v5)
    objc_msgSend(v6, "setContactHeaderView:", v5);

}

- (void)contactMessageInteraction:(id)a3 didUpdateHeaderView:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController contactViewController](self, "contactViewController"));
  v6 = v5;
  if (v5)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactHeaderView"));

    if (v7 != v8)
      -[MFMessageViewController _setupHeaderViewForContactViewController:](self, "_setupHeaderViewForContactViewController:", v6);
  }

}

- (BOOL)canSearchForContactFromContactCardInteractions:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "canSearchForContactFromContactCardInteractions:", v4);

  return v6;
}

- (void)contactCardInteractions:(id)a3 triggerSearchForDisplayName:(id)a4 emailAddresses:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate"));
  objc_msgSend(v10, "contactCardInteractions:triggerSearchForDisplayName:emailAddresses:", v11, v8, v9);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;

  -[MFConversationItemHeaderBlock prepareForReuse](self->_participantHeader, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self, "messageContentView"));
  objc_msgSend(v3, "prepareForReuse");

  -[MFMessageViewController setDelegate:](self, "setDelegate:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController parentViewController](self, "parentViewController"));

  if (v4)
  {
    -[MFMessageViewController willMoveToParentViewController:](self, "willMoveToParentViewController:", 0);
    -[MFMessageViewController removeFromParentViewController](self, "removeFromParentViewController");
  }
}

- (id)messageContentRepresentationRequestForScreenshotService:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MFMessageViewController contentRequest](self, "contentRequest", a3));
}

- (void)_presentBIMILearnMoreViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  _BYTE v43[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController contentRequest](self, "contentRequest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resultIfAvailable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestedHeaders"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstHeaderForKey:", ECMessageHeaderKeyHMEAddress));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ECTagValueList tagValueListFromString:error:](ECTagValueList, "tagValueListFromString:error:", v6, 0));

  v38 = v7;
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", EMHeaderTagHMESenderAddress));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController contentRequest](self, "contentRequest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "message"));

  if (v40)
    v10 = v40;
  else
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "senderAddress"));
  v39 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "emailAddressValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "domain"));

  if (!v12)
  {
    v14 = MFLogGeneral(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "senderAddress"));
      sub_100394690(v16, (uint64_t)v43, v15);
    }

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mailProviderDisplayNameForBIMI"));
  if (objc_msgSend(v17, "length"))
  {
    v18 = _EFLocalizedString(CFSTR("Your email provider, %@, verified that this email is coming from the owner of the logo and domain “%@”."), &unk_10059D2A0, &unk_10059D2A8);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v17, v12));
  }
  else
  {
    v21 = _EFLocalizedString(CFSTR("Your email provider verified that this email is coming from the owner of the logo and domain “%@”."), &unk_10059D2A0, &unk_10059D2A8);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v20 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v12));
  }
  v22 = (void *)v20;

  v23 = objc_alloc((Class)OBWelcomeController);
  v24 = _EFLocalizedString(CFSTR("Verified Logo"), &unk_10059D2A0, &unk_10059D2A8);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = objc_msgSend(v23, "initWithTitle:detailText:icon:", v25, v22, 0);

  objc_msgSend(v26, "setModalPresentationStyle:", 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[OBHeaderAccessoryButton accessoryButton](OBHeaderAccessoryButton, "accessoryButton"));
  v28 = _EFLocalizedString(CFSTR("Learn more…"), &unk_10059D2A0, &unk_10059D2A8);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  objc_msgSend(v27, "setTitle:forState:", v29, 0);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "headerView"));
  objc_msgSend(v30, "addAccessoryButton:", v27);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", &stru_100522090));
  objc_msgSend(v27, "addAction:forControlEvents:", v31, 0x2000);

  v32 = objc_alloc((Class)UIBarButtonItem);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10018CFB4;
  v41[3] = &unk_10051ECD8;
  v33 = v26;
  v42 = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v41));
  v35 = objc_msgSend(v32, "initWithBarButtonSystemItem:primaryAction:", 0, v34);

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "navigationItem"));
  objc_msgSend(v36, "setRightBarButtonItem:", v35);

  v37 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v33);
  -[MFMessageViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v37, 1, 0);

}

- (id)conversationAttachmentURLsForConversationItemHeaderBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "conversationAttachmentURLsForConversationItemHeaderBlock:", v4));

  return v6;
}

- (id)richLinksInConversationForConversationItemHeaderBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "richLinksInConversationForConversationItemHeaderBlock:", v4));

  return v6;
}

- (int64_t)numberOfMessagesInConversationForConversationItemHeaderBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "numberOfMessagesInConversationForConversationItemHeaderBlock:", v4);

  return (int64_t)v6;
}

- (MFMessageViewControllerDelegate)delegate
{
  return (MFMessageViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (MessageContentRepresentationRequest)contentRequest
{
  return self->_contentRequest;
}

- (BOOL)automaticallyCollapseQuotedContent
{
  return self->_automaticallyCollapseQuotedContent;
}

- (BOOL)configuredForSingleMessageDisplay
{
  return self->_configuredForSingleMessageDisplay;
}

- (MFMessageContentView)messageContentView
{
  return self->_messageContentView;
}

- (void)setMessageContentView:(id)a3
{
  objc_storeStrong((id *)&self->_messageContentView, a3);
}

- (EFFuture)predictedMailbox
{
  return self->_predictedMailbox;
}

- (void)setPredictedMailbox:(id)a3
{
  objc_storeStrong((id *)&self->_predictedMailbox, a3);
}

- (EMCachingContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (BOOL)didCompleteFirstPaint
{
  return self->_didCompleteFirstPaint;
}

- (void)setDidCompleteFirstPaint:(BOOL)a3
{
  self->_didCompleteFirstPaint = a3;
}

- (QLPreviewController)previewController
{
  return (QLPreviewController *)objc_loadWeakRetained((id *)&self->_previewController);
}

- (void)setPreviewController:(id)a3
{
  objc_storeWeak((id *)&self->_previewController, a3);
}

- (UIDocumentInteractionController)doc
{
  return (UIDocumentInteractionController *)objc_loadWeakRetained((id *)&self->_doc);
}

- (void)setDoc:(id)a3
{
  objc_storeWeak((id *)&self->_doc, a3);
}

- (CNContactViewController)contactViewController
{
  return self->_contactViewController;
}

- (void)setContactViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contactViewController, a3);
}

- (MFContactMessageInteraction)contactInteraction
{
  return self->_contactInteraction;
}

- (void)setContactInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_contactInteraction, a3);
}

- (MFContactCardInteractions)contactCardInteractions
{
  return self->_contactCardInteractions;
}

- (void)setContactCardInteractions:(id)a3
{
  objc_storeStrong((id *)&self->_contactCardInteractions, a3);
}

- (EMSecurityInformation)securityInformation
{
  return self->_securityInformation;
}

- (void)setSecurityInformation:(id)a3
{
  objc_storeStrong((id *)&self->_securityInformation, a3);
}

- (MessageContentRequestRetryMiddleware)retryMiddleware
{
  return self->_retryMiddleware;
}

- (void)setRetryMiddleware:(id)a3
{
  objc_storeStrong((id *)&self->_retryMiddleware, a3);
}

- (MFScreenshotService)screenshotService
{
  return self->_screenshotService;
}

- (ComposeCapable)scene
{
  return (ComposeCapable *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (MFSuggestionController)suggestionController
{
  return self->_suggestionController;
}

- (void)setSuggestionController:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionController, a3);
}

- (MFMailAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (MFMailboxProvider)mailboxProvider
{
  return self->_mailboxProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxProvider, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_suggestionController, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_screenshotService, 0);
  objc_storeStrong((id *)&self->_retryMiddleware, 0);
  objc_storeStrong((id *)&self->_securityInformation, 0);
  objc_storeStrong((id *)&self->_contactCardInteractions, 0);
  objc_storeStrong((id *)&self->_contactInteraction, 0);
  objc_storeStrong((id *)&self->_contactViewController, 0);
  objc_destroyWeak((id *)&self->_doc);
  objc_destroyWeak((id *)&self->_previewController);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_predictedMailbox, 0);
  objc_storeStrong((id *)&self->_messageContentView, 0);
  objc_storeStrong((id *)&self->_contentRequest, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_participantHeader, 0);
  objc_storeStrong((id *)&self->_attachmentShowcase, 0);
}

@end
