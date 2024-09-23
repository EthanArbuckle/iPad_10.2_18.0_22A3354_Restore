@implementation EMLMessageViewController

- (EMLMessageViewController)initWithScene:(id)a3 messageListItem:(id)a4
{
  id v7;
  EMLMessageViewController *v8;
  EMLMessageViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v16;

  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)EMLMessageViewController;
  v8 = -[ConversationViewControllerBase initWithScene:](&v16, "initWithScene:", a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_messageListItem, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayMessage"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "result"));

    -[ConversationViewControllerBase setReferenceMessageListItem:](v9, "setReferenceMessageListItem:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](v9, "collectionView"));
    objc_msgSend(v12, "setDataSource:", v9);

    v13 = objc_msgSend(objc_alloc((Class)MessageContentRepresentationRequest), "initWithMessage:", v11);
    -[EMLMessageViewController setContentRepresentationRequest:](v9, "setContentRepresentationRequest:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[EMLMessageViewController contentRepresentationRequest](v9, "contentRepresentationRequest"));
    objc_msgSend(v14, "start");

  }
  return v9;
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EMLMessageViewController;
  -[ConversationViewControllerBase loadView](&v4, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase conversationLayout](self, "conversationLayout"));
  objc_msgSend(v3, "setSwipeDelegate:", 0);

}

- (void)_reloadDataSource
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  objc_msgSend(v2, "reloadData");

}

- (int64_t)countOfMessages
{
  return 1;
}

- (int64_t)countOfSummaries
{
  return 0;
}

- (id)_messageItemIDAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EMLMessageViewController messageListItem](self, "messageListItem", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "itemID"));

  return v4;
}

- (int64_t)_headerDisplayOptionsForCell:(id)a3 displayedAsSingleMessage:(BOOL)a4
{
  return 3;
}

- (void)_showSingleMessage:(id)a3 animationOffset:(CGPoint)a4 initialScrollOffset:(CGPoint)a5
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView", a3, a4.x, a4.y, a5.x, a5.y));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visibleCells"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  v7 = v13;
  if (v13)
  {
    v8 = objc_opt_class(MFExpandedMessageCell);
    isKindOfClass = objc_opt_isKindOfClass(v13, v8);
    v7 = v13;
    if ((isKindOfClass & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "messageViewController"));
      objc_msgSend(v10, "setAutomaticallyCollapseQuotedContent:", 0);

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "messageViewController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "messageContentView"));
      objc_msgSend(v12, "reload");

      v7 = v13;
    }
  }

}

- (void)_configureExpandedCell:(id)a3 atIndexPath:(id)a4 viewModel:(id)a5 collapseQuotedContent:(BOOL)a6
{
  _BOOL8 v6;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MessageHeaderSubjectBlock *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v6 = a6;
  v25 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "messageContentRequest"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "messageViewController"));

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase messageViewControllerReuseQueue](self, "messageViewControllerReuseQueue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dequeueMessageViewControllerForContentRequest:", v9));
    objc_msgSend(v25, "setMessageViewController:", v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "messageViewController"));
  objc_msgSend(v13, "setDelegate:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "messageContentView"));
  objc_msgSend(v14, "setSuppressScrolling:", 0);

  v15 = objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase contactStore](self, "contactStore"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v15, "cnStore"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "participantHeaderForContactStore:", v16));

  objc_msgSend(v17, "setDisplayOptions:", -[EMLMessageViewController _headerDisplayOptionsForCell:displayedAsSingleMessage:](self, "_headerDisplayOptionsForCell:displayedAsSingleMessage:", v25, 1));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contentRequest"));
  LOBYTE(v15) = objc_msgSend(v18, "isEqual:", v9);

  if ((v15 & 1) == 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v17));
    v20 = -[MessageHeaderSubjectBlock initWithFrame:]([MessageHeaderSubjectBlock alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v19, "addObject:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "messageContentView"));
    objc_msgSend(v21, "setHeaderViewSubjectBlock:", v20);

    -[MessageHeaderSubjectBlock setHidden:](v20, "setHidden:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "messageContentView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "headerView"));

    objc_msgSend(v23, "setHeaderBlocks:", v19);
    objc_msgSend(v13, "setAutomaticallyCollapseQuotedContent:", v6);
    objc_msgSend(v13, "setContentRequest:", v9);

  }
  objc_msgSend(v25, "setConfiguredForSingleMessageDisplay:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "messageContentView"));
  objc_msgSend(v24, "setShowMessageFooter:", 0);

}

- (id)cellConfigurator:(id)a3 messageItemIDAtIndexPath:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EMLMessageViewController messageListItem](self, "messageListItem", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemID"));

  return v5;
}

- (id)_persistentIDForEMMessageObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "daemonInterface"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageRepository"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "persistentIDForMessageObjectID:", v4));

  return v8;
}

- (id)_dragItemsForItemAtIndexPath:(id)a3
{
  return 0;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return 1;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase cellConfigurator](self, "cellConfigurator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "unconfiguredCellForItemAtIndexPath:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[EMLMessageViewController contentRepresentationRequest](self, "contentRepresentationRequest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "messageFuture"));
  objc_msgSend(v6, "configureCell:forItemAtIndexPath:itemID:messageFuture:contentRequest:", v7, v5, v9, v10, v8);

  return v7;
}

- (BOOL)_isDisplayingSingleMessage
{
  return 1;
}

- (BOOL)_shouldArchiveByDefault
{
  return 0;
}

- (id)_messageContentViewForVisibleMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EMLMessageViewController _currentlyVisibleIndexPath](self, "_currentlyVisibleIndexPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cellForItemAtIndexPath:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messageViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageContentView"));

  return v7;
}

- (id)_getCurrentlySelectedMessageContentForVisibleMessage
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[EMLMessageViewController _messageContentViewForVisibleMessage](self, "_messageContentViewForVisibleMessage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selectedHTML"));
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selectedHTML"));
    v7 = v5;
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));

  }
  return v4;
}

- (id)_defaultBarButtonItems
{
  EMLMessageViewController *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[2];

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase barItemsManager](self, "barItemsManager"));
  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "destructiveButtonItem"));
  objc_msgSend(v5, "setEnabled:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "moveButtonItem"));
  objc_msgSend(v6, "setEnabled:", 0);
  v14[0] = v5;
  v14[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
  objc_msgSend(v4, "addObjectsFromArray:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[EMLMessageViewController traitCollection](v2, "traitCollection"));
  LODWORD(v2) = objc_msgSend(v8, "mf_hasCompactDimension");

  if ((_DWORD)v2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "replyButtonItem"));
    objc_msgSend(v4, "addObject:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "composeButtonItem"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "composeButtonItem"));
    objc_msgSend(v4, "addObject:", v11);

  }
  v12 = objc_msgSend(v4, "copy");

  return v12;
}

- (void)replyButtonTapped:(id)a3
{
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[5];

  v19 = a3;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EMLMessageViewController contentRepresentationRequest](self, "contentRepresentationRequest"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100096E94;
  v21[3] = &unk_10051B9C8;
  v21[4] = self;
  v5 = objc_retainBlock(v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController mf_actionSheetWithTitle:cancellationHandler:](UIAlertController, "mf_actionSheetWithTitle:cancellationHandler:", 0, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EMLMessageViewController _getCurrentlySelectedMessageContentForVisibleMessage](self, "_getCurrentlySelectedMessageContentForVisibleMessage"));
  v8 = sub_100096EF4(self, 0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "alertActionWithCompletion:", v5));
  objc_msgSend(v6, "addAction:", v10);

  v11 = sub_100096EF4(self, 1, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "alertActionWithCompletion:", v5));
  objc_msgSend(v6, "addAction:", v13);

  v14 = sub_10009701C(self, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "alertActionWithCompletion:", v5));
  objc_msgSend(v6, "addAction:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MFPrintTriageInteraction interactionWithContentRequest:scene:delegate:](MFPrintTriageInteraction, "interactionWithContentRequest:scene:delegate:", v4, v20, self));
  objc_msgSend(v17, "setDelegate:", self);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "alertActionWithCompletion:", v5));
  objc_msgSend(v6, "addAction:", v18);

  objc_msgSend(v6, "mf_presentFromViewController:withSource:", self, v19);
}

- (id)_currentlyVisibleIndexPath
{
  return +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0);
}

- (id)_indexPathForReferenceMessage
{
  return +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0);
}

- (id)_indexPathOfMessageViewControllerMessage:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
}

- (BOOL)_isItemInitiallyUnreadAtIndexPath:(id)a3
{
  return 0;
}

- (BOOL)_shouldAutomaticallyMarkAsReadWithCellViewModel:(id)a3
{
  return 1;
}

- (id)targetMessageItemIDForBarButtonTriage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displayMessageItemID"));

  return v3;
}

- (id)targetMessageForBarButtonTriage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase referenceMessageListItem](self, "referenceMessageListItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displayMessage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "result"));

  return v4;
}

- (BOOL)_canBrowseInDirection:(int)a3
{
  return 0;
}

- (id)presentingViewControllerForTriageInteraction:(id)a3
{
  void *v4;
  EMLMessageViewController *v5;
  void *v6;
  EMLMessageViewController *v7;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EMLMessageViewController presentingViewController](self, "presentingViewController", a3));

  if (v4)
  {
    v5 = self;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[EMLMessageViewController presentedViewController](self, "presentedViewController"));

    if (!v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
      v7 = (EMLMessageViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mf_rootViewController"));

      return v7;
    }
    v5 = (EMLMessageViewController *)objc_claimAutoreleasedReturnValue(-[EMLMessageViewController presentedViewController](self, "presentedViewController"));
  }
  v7 = v5;
  return v7;
}

- (id)messageRepositoryForTriageInteraction:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "daemonInterface"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "messageRepository"));

  return v5;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return "_forwardCommandInvoked:" == a3
      || "_replyCommandInvoked:" == a3
      || "_replyAllCommandInvoked:" == a3
      || "_printCommandInvoked:" == a3;
}

- (void)_replyCommandInvoked:(id)a3
{
  sub_100097388(self, 0);
}

- (void)_replyAllCommandInvoked:(id)a3
{
  sub_100097388(self, 1);
}

- (void)_printCommandInvoked:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EMLMessageViewController contentRepresentationRequest](self, "contentRepresentationRequest", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewControllerBase scene](self, "scene"));
  v6 = (id)objc_claimAutoreleasedReturnValue(+[MFPrintTriageInteraction interactionWithContentRequest:scene:delegate:](MFPrintTriageInteraction, "interactionWithContentRequest:scene:delegate:", v4, v5, self));

  objc_msgSend(v6, "setDelegate:", self);
  sub_1000974E8((uint64_t)self, v6);

}

- (void)_forwardCommandInvoked:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EMLMessageViewController _getCurrentlySelectedMessageContentForVisibleMessage](self, "_getCurrentlySelectedMessageContentForVisibleMessage", a3));
  v5 = sub_10009701C(self, v4);
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);

  sub_1000974E8((uint64_t)self, v6);
}

- (EMMessageListItem)messageListItem
{
  return self->_messageListItem;
}

- (void)setMessageListItem:(id)a3
{
  objc_storeStrong((id *)&self->_messageListItem, a3);
}

- (MessageContentRepresentationRequest)contentRepresentationRequest
{
  return self->_contentRepresentationRequest;
}

- (void)setContentRepresentationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_contentRepresentationRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentRepresentationRequest, 0);
  objc_storeStrong((id *)&self->_messageListItem, 0);
}

@end
