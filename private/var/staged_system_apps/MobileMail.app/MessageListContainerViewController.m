@implementation MessageListContainerViewController

- (MessageListContainerViewController)initWithMainScene:(id)a3 mailboxes:(id)a4 accountsProvider:(id)a5 favoritesShortcutsProvider:(id)a6 contactStore:(id)a7 diagnosticsHelper:(id)a8 mailboxPickerDelegate:(id)a9
{
  id v15;
  id v16;
  id v17;
  MessageListContainerViewController *v18;
  MessageListContainerViewController *v19;
  void *v20;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a4;
  v22 = a5;
  v15 = a6;
  v16 = a8;
  v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)MessageListContainerViewController;
  v18 = -[MessageListContainerViewController initWithNibName:bundle:](&v25, "initWithNibName:bundle:", 0, 0);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_scene, a3);
    objc_storeStrong((id *)&v19->_mailboxes, a4);
    objc_storeStrong((id *)&v19->_accountsProvider, a5);
    objc_storeStrong((id *)&v19->_favoritesShortcutsProvider, a6);
    objc_storeStrong((id *)&v19->_diagnosticsHelper, a8);
    objc_storeWeak((id *)&v19->_mailboxPickerDelegate, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v20, "addObserver:selector:name:object:", v19, "_didReceivePreferredFontChangedNotification:", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v19;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double Width;
  double v5;
  double v6;
  objc_super v7;
  CGRect v8;

  v7.receiver = self;
  v7.super_class = (Class)MessageListContainerViewController;
  -[MessageListContainerViewController viewDidLayoutSubviews](&v7, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController view](self, "view"));
  objc_msgSend(v3, "frame");
  Width = CGRectGetWidth(v8);

  -[MessageListContainerViewController previousPaletteWidth](self, "previousPaletteWidth");
  v6 = Width - v5;
  if (v6 < 0.0)
    v6 = -v6;
  if (v6 >= 2.22044605e-16)
  {
    -[MessageListContainerViewController setPreviousPaletteWidth:](self, "setPreviousPaletteWidth:", Width);
    sub_10010CBB8((id *)&self->super.super.super.isa, 1);
  }
}

- (void)updateForSplitViewControllerHidingMessageList
{
  id v3;

  if (!-[MessageListContainerViewController mode](self, "mode"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController messageListViewController](self, "messageListViewController"));
    objc_msgSend(v3, "updateForSplitViewControllerHidingMessageList");

  }
}

- (void)restoreState:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[MessageListContainerViewController mode](self, "mode"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController messageListViewController](self, "messageListViewController"));
    objc_msgSend(v4, "restoreState:", v5);

  }
}

- (id)captureRestorationState
{
  void *v2;
  void *v4;

  if (!-[MessageListContainerViewController mode](self, "mode"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController messageListViewController](self, "messageListViewController"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "captureRestorationState"));

  }
  return v2;
}

- (BOOL)showingPopoverViewController
{
  unsigned __int8 v3;
  void *v4;

  if (-[MessageListContainerViewController mode](self, "mode"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController messageListViewController](self, "messageListViewController"));
  v3 = objc_msgSend(v4, "showingPopoverViewController");

  return v3;
}

- (MessageListViewController)messageListViewController
{
  MessageListViewController *messageListViewController;
  MessageListViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MessageListViewController *v9;
  MessageListViewController *v10;
  void *v11;
  void *v12;
  void *v13;

  messageListViewController = self->_messageListViewController;
  if (!messageListViewController)
  {
    v4 = [MessageListViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController scene](self, "scene"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController accountsProvider](self, "accountsProvider"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController favoritesShortcutsProvider](self, "favoritesShortcutsProvider"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController diagnosticsHelper](self, "diagnosticsHelper"));
    v9 = -[MessageListViewController initWithMainScene:mailboxes:accountsProvider:favoritesShortcutsProvider:contactStore:diagnosticsHelper:](v4, "initWithMainScene:mailboxes:accountsProvider:favoritesShortcutsProvider:contactStore:diagnosticsHelper:", v5, 0, v6, v7, 0, v8);
    v10 = self->_messageListViewController;
    self->_messageListViewController = v9;

    -[MessageListViewController setDelegate:](self->_messageListViewController, "setDelegate:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController mailboxPickerDelegate](self, "mailboxPickerDelegate"));
    -[MessageListViewController setMailboxPickerDelegate:](self->_messageListViewController, "setMailboxPickerDelegate:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController scrollableHintBlock](self, "scrollableHintBlock"));
    -[MessageListViewController setScrollableHintBlock:](self->_messageListViewController, "setScrollableHintBlock:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController updateScrollableHintBlock](self, "updateScrollableHintBlock"));
    -[MessageListViewController setUpdateScrollableHintBlock:](self->_messageListViewController, "setUpdateScrollableHintBlock:", v13);

    messageListViewController = self->_messageListViewController;
  }
  return messageListViewController;
}

- (ConversationViewController)conversationViewController
{
  ConversationViewController *conversationViewController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ConversationViewController *v8;
  ConversationViewController *v9;
  ConversationViewController *v10;
  ConversationViewController *v11;
  id v12;
  void *v13;

  conversationViewController = self->_conversationViewController;
  if (!conversationViewController)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController scene](self, "scene"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "splitViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messageDetailNavController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "conversationViewController"));

    if (v7)
    {
      v8 = v7;
      v9 = self->_conversationViewController;
      self->_conversationViewController = v8;
    }
    else
    {
      v10 = -[ConversationViewController initWithScene:]([ConversationViewController alloc], "initWithScene:", v4);
      v11 = self->_conversationViewController;
      self->_conversationViewController = v10;

      v12 = sub_10010D368(self, -[MessageListContainerViewController mode](self, "mode"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      -[ConversationViewControllerBase setDelegate:](self->_conversationViewController, "setDelegate:", v13);

      -[ConversationViewControllerBase setIsPrimary:](self->_conversationViewController, "setIsPrimary:", 1);
      v9 = (ConversationViewController *)objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController diagnosticsHelper](self, "diagnosticsHelper"));
      -[ConversationViewController setDiagnosticsHelper:](self->_conversationViewController, "setDiagnosticsHelper:", v9);
    }

    conversationViewController = self->_conversationViewController;
  }
  return conversationViewController;
}

- (void)suspendRefreshAnimationIfNecessary
{
  id v2;
  id v3;

  v2 = sub_10010D368(self, -[MessageListContainerViewController mode](self, "mode"));
  v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v3, "suspendRefreshAnimationIfNecessary");

}

- (void)resumeRefreshAnimationIfNecessary
{
  id v2;
  id v3;

  v2 = sub_10010D368(self, -[MessageListContainerViewController mode](self, "mode"));
  v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v3, "resumeRefreshAnimationIfNecessary");

}

- (void)setMailboxes:(id)a3 forceReload:(BOOL)a4
{
  -[MessageListContainerViewController setMailboxes:mode:forceReload:](self, "setMailboxes:mode:forceReload:", a3, 0, a4);
}

- (void)setMailboxes:(id)a3 mode:(int64_t)a4 forceReload:(BOOL)a5
{
  _BOOL8 v5;
  NSArray *v9;
  NSArray *mailboxes;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;

  v5 = a5;
  v9 = (NSArray *)a3;
  mailboxes = self->_mailboxes;
  v15 = v9;
  if (mailboxes != v9)
    objc_storeStrong((id *)&self->_mailboxes, a3);
  -[MessageListContainerViewController setMode:](self, "setMode:", a4);
  -[MessageListContainerViewController setShouldShowPreparingSearch:](self, "setShouldShowPreparingSearch:", 0);
  v11 = sub_10010D5A0(self, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController conversationViewController](self, "conversationViewController"));
  objc_msgSend(v13, "setDelegate:", v12);

  objc_msgSend(v12, "setMailboxes:forceReload:", v15, v5);
  sub_10010CBB8((id *)&self->super.super.super.isa, mailboxes != v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v12, "configureNavigationItem:forViewController:", v14, self);

  -[MessageListContainerViewController mf_updateAlertSuppressionContextsForReason:](self, "mf_updateAlertSuppressionContextsForReason:", CFSTR("Message list mailboxes did change"));
}

- (void)toggleFilters
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController messageListViewController](self, "messageListViewController"));
  objc_msgSend(v2, "toggleFilters");

}

- (void)setFiltersEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController messageListViewController](self, "messageListViewController"));
  objc_msgSend(v4, "setFiltersEnabled:", v3);

}

- (UIBarButtonItem)composeButtonItem
{
  void *v2;
  void *v4;

  if (!-[MessageListContainerViewController mode](self, "mode"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController messageListViewController](self, "messageListViewController"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "composeButtonItem"));

  }
  return (UIBarButtonItem *)v2;
}

- (id)mf_preferredTitle
{
  id v2;
  void *v3;
  void *v4;

  v2 = sub_10010D368(self, -[MessageListContainerViewController mode](self, "mode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mf_preferredTitle"));

  return v4;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  if (-[MessageListContainerViewController mode](self, "mode"))
  {
    v11.receiver = self;
    v11.super_class = (Class)MessageListContainerViewController;
    v7 = -[MessageListContainerViewController targetForAction:withSender:](&v11, "targetForAction:withSender:", a3, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController messageListViewController](self, "messageListViewController"));
  }
  v9 = (void *)v8;

  return v9;
}

- (BOOL)canHandleAction:(SEL)a3 withMailMenuCommand:(id)a4
{
  id v6;
  unsigned __int8 v7;
  void *v8;

  v6 = a4;
  if (-[MessageListContainerViewController mode](self, "mode"))
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController messageListViewController](self, "messageListViewController"));
    v7 = objc_msgSend(v8, "canHandleAction:withMailMenuCommand:", a3, v6);

  }
  return v7;
}

- (BOOL)shouldRouteActionToConversation:(SEL)a3 withCommand:(id)a4
{
  unsigned __int8 v4;
  id v7;
  void *v8;

  v7 = a4;
  if (!-[MessageListContainerViewController mode](self, "mode"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController messageListViewController](self, "messageListViewController"));
    v4 = objc_msgSend(v8, "shouldRouteActionToConversation:withCommand:", a3, v7);

  }
  return v4 & 1;
}

- (BOOL)isEditing
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController childViewControllers](self, "childViewControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));
  v4 = objc_msgSend(v3, "isEditing");

  return v4;
}

- (BOOL)isSearchViewControllerEditing
{
  unsigned __int8 v2;
  void *v4;

  if (!-[MessageListContainerViewController mode](self, "mode"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController messageListViewController](self, "messageListViewController"));
    v2 = objc_msgSend(v4, "isSearchViewControllerEditing");

  }
  return v2 & 1;
}

- (void)messageListViewControllerRequiresPaletteUpdate:(id)a3 enableSearchPreparing:(BOOL)a4
{
  -[MessageListContainerViewController setShouldShowPreparingSearch:](self, "setShouldShowPreparingSearch:", a4);
  sub_10010CBB8((id *)&self->super.super.super.isa, 0);
}

- (void)messageListViewControllerRequiresPaletteUpdate:(id)a3 disableFocusFilter:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  if (v4)
  {
    v6 = sub_10010D968(self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v7, "setFocusFilterEnabled:", 0);

  }
  sub_10010CBB8((id *)&self->super.super.super.isa, 0);

}

- (void)messageListViewController:(id)a3 updateLayoutMarginsForFocusBannerView:(NSDirectionalEdgeInsets)a4
{
  double trailing;
  double bottom;
  double leading;
  double top;
  _QWORD *v8;
  id v9;

  trailing = a4.trailing;
  bottom = a4.bottom;
  leading = a4.leading;
  top = a4.top;
  v8 = sub_10010D968(self);
  v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v9, "setDirectionalLayoutMargins:", top, leading, bottom, trailing);

}

- (void)messageListViewController:(id)a3 didRestoreStateWithMailboxes:(id)a4
{
  -[MessageListContainerViewController setMailboxes:forceReload:](self, "setMailboxes:forceReload:", a4, 0);
}

- (BOOL)isMessageListViewControllerVisible:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  v5 = sub_10010D368(self, -[MessageListContainerViewController mode](self, "mode"));
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController navigationController](self, "navigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewControllers"));
  v9 = objc_msgSend(v8, "containsObject:", self);

  if (v6 != v4)
    v9 = 0;

  return v9;
}

- (void)focusBannerView:(id)a3 stateDidChange:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MessageListContainerViewController messageListViewController](self, "messageListViewController", a3));
  objc_msgSend(v5, "setFocusFilterEnabled:", v4);

}

- (void)_didReceivePreferredFontChangedNotification:(id)a3
{
  sub_10010CBB8((id *)&self->super.super.super.isa, 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MessageListContainerViewController;
  -[MessageListContainerViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[MessageListContainerViewController mf_updateAlertSuppressionContextsForReason:](self, "mf_updateAlertSuppressionContextsForReason:", CFSTR("MessageListViewController did disappear"));
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MessageListContainerViewController;
  -[MessageListContainerViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[MessageListContainerViewController mf_updateAlertSuppressionContextsForReason:](self, "mf_updateAlertSuppressionContextsForReason:", CFSTR("mailbox content did appear"));
}

- (MailboxPickerDelegate)mailboxPickerDelegate
{
  return (MailboxPickerDelegate *)objc_loadWeakRetained((id *)&self->_mailboxPickerDelegate);
}

- (void)setMailboxPickerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_mailboxPickerDelegate, a3);
}

- (MailMainScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
  objc_storeStrong((id *)&self->_scene, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (NSArray)mailboxes
{
  return self->_mailboxes;
}

- (void)setMessageListViewController:(id)a3
{
  objc_storeStrong((id *)&self->_messageListViewController, a3);
}

- (void)setConversationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_conversationViewController, a3);
}

- (id)scrollableHintBlock
{
  return self->_scrollableHintBlock;
}

- (void)setScrollableHintBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)updateScrollableHintBlock
{
  return self->_updateScrollableHintBlock;
}

- (void)setUpdateScrollableHintBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (MFAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (void)setAccountsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accountsProvider, a3);
}

- (FavoritesShortcutsProvider)favoritesShortcutsProvider
{
  return self->_favoritesShortcutsProvider;
}

- (void)setFavoritesShortcutsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_favoritesShortcutsProvider, a3);
}

- (EMDiagnosticsHelper)diagnosticsHelper
{
  return self->_diagnosticsHelper;
}

- (void)setDiagnosticsHelper:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticsHelper, a3);
}

- (double)previousPaletteWidth
{
  return self->_previousPaletteWidth;
}

- (void)setPreviousPaletteWidth:(double)a3
{
  self->_previousPaletteWidth = a3;
}

- (unint64_t)paletteConfiguration
{
  return self->_paletteConfiguration;
}

- (void)setPaletteConfiguration:(unint64_t)a3
{
  self->_paletteConfiguration = a3;
}

- (BOOL)shouldShowPreparingSearch
{
  return self->_shouldShowPreparingSearch;
}

- (void)setShouldShowPreparingSearch:(BOOL)a3
{
  self->_shouldShowPreparingSearch = a3;
}

- (double)preferredFocusBarHeight
{
  return self->_preferredFocusBarHeight;
}

- (void)setPreferredFocusBarHeight:(double)a3
{
  self->_preferredFocusBarHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navBarPalette, 0);
  objc_storeStrong((id *)&self->_focusBannerView, 0);
  objc_storeStrong((id *)&self->_paletteStackView, 0);
  objc_storeStrong((id *)&self->_diagnosticsHelper, 0);
  objc_storeStrong((id *)&self->_favoritesShortcutsProvider, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong(&self->_updateScrollableHintBlock, 0);
  objc_storeStrong(&self->_scrollableHintBlock, 0);
  objc_storeStrong((id *)&self->_conversationViewController, 0);
  objc_storeStrong((id *)&self->_messageListViewController, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_destroyWeak((id *)&self->_mailboxPickerDelegate);
}

@end
