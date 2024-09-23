@implementation MailActionsViewDataSource

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AE530;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9BE8 != -1)
    dispatch_once(&qword_1005A9BE8, block);
  return (id)qword_1005A9BE0;
}

- (MailActionsViewDataSource)initWithBuilderBlock:(id)a3
{
  void (**v4)(id, MailActionsViewDataSource *);
  MailActionsViewDataSource *v5;
  objc_super v7;

  v4 = (void (**)(id, MailActionsViewDataSource *))a3;
  v7.receiver = self;
  v7.super_class = (Class)MailActionsViewDataSource;
  v5 = -[MailActionsViewDataSource init](&v7, "init");
  if (v5)
    v4[2](v4, v5);

  return v5;
}

- (id)sectionDataForMailActionsViewController:(id)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableArray *v11;
  MFCardActionSectionData *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  MFCardActionSectionData *v17;
  void *v18;
  MFCardActionSectionData *v19;
  void *v21;
  MFCardActionSectionData *v22;
  void *v23;
  MFCardActionSectionData *v24;
  void *v25;
  MFCardActionSectionData *v26;
  MFCardActionSectionData *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  MFCardActionSectionData *v32;
  void *v33;
  MFCardActionSectionData *v34;
  void *v35;
  BOOL v36;
  void *v37;
  MFCardActionSectionData *v38;
  void *v39;
  MFCardActionSectionData *v40;
  void *v41;
  void *v42;
  NSString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[2];
  void *v60;
  void *v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;

  if (!-[MailActionsViewDataSource isTargetValid](self, "isTargetValid", a3))
    return &__NSArray0__struct;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource primaryMessageContentRequest](self, "primaryMessageContentRequest"));

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource presentationSource](self, "presentationSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource completion](self, "completion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource preparation](self, "preparation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource predictedMailbox](self, "predictedMailbox"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resultIfAvailable"));

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource moveToPredictionTriageInteractionDelegate](self, "moveToPredictionTriageInteractionDelegate"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource presentingViewControllerForTransferUI](self, "presentingViewControllerForTransferUI"));
    v10 = objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource delegate](self, "delegate"));
    v50 = (void *)v10;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource undoManager](self, "undoManager"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource allMessagesInConversation](self, "allMessagesInConversation"));
    v11 = objc_opt_new(NSMutableArray);
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource _mailActionCardHorizontalActionsWithPresentationSource:preparation:completion:](self, "_mailActionCardHorizontalActionsWithPresentationSource:preparation:completion:", v6, v8, v7));
    v12 = -[MFCardActionSectionData initWithActions:viewLayout:]([MFCardActionSectionData alloc], "initWithActions:viewLayout:", v56, 1);
    -[NSMutableArray addObject:](v11, "addObject:", v12);

    if (-[MailActionsViewDataSource includeReadLaterAction](self, "includeReadLaterAction"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MFReadLaterTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:](MFReadLaterTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:", v57, v58, -[MailActionsViewDataSource origin](self, "origin"), 2));
      objc_msgSend(v13, "setPresentationSource:", v6);
      objc_msgSend(v13, "setDelegate:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "selectedDate"));
      v15 = v14 != 0;

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cardActionWithPreparation:completion:", v8, v7));
      objc_msgSend(v16, "setShouldDismissCardBeforeExecuteHandler:", 1);
      objc_msgSend(v16, "setShouldDeferDismissHandler:", 1);
      v17 = [MFCardActionSectionData alloc];
      v61 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v61, 1));
      v19 = -[MFCardActionSectionData initWithActions:viewLayout:](v17, "initWithActions:viewLayout:", v18, 0);
      -[NSMutableArray addObject:](v11, "addObject:", v19);

    }
    else
    {
      v15 = 0;
    }
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[MFDestructiveTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:](MFRemoveFollowUpTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:", v57, v58, -[MailActionsViewDataSource origin](self, "origin"), 2));
    if (((objc_msgSend(v51, "isPermitted") ^ 1 | v15) & 1) == 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "cardActionWithPreparation:completion:", v8, v7));
      v22 = [MFCardActionSectionData alloc];
      v60 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v60, 1));
      v24 = -[MFCardActionSectionData initWithActions:viewLayout:](v22, "initWithActions:viewLayout:", v23, 0);
      -[NSMutableArray addObject:](v11, "addObject:", v24);

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource _mailActionCardFlagActionsWithPresentationSource:preparation:completion:](self, "_mailActionCardFlagActionsWithPresentationSource:preparation:completion:", v6, v8, v7));
    if (objc_msgSend(v25, "count"))
    {
      v26 = -[MFCardActionSectionData initWithActions:viewLayout:]([MFCardActionSectionData alloc], "initWithActions:viewLayout:", v25, 2);
      -[NSMutableArray addObject:](v11, "addObject:", v26);

    }
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource _mailActionCardSendAgainAndUnreadActionsWithPresentationSource:preparation:completion:](self, "_mailActionCardSendAgainAndUnreadActionsWithPresentationSource:preparation:completion:", v6, v8, v7));
    v27 = -[MFCardActionSectionData initWithActions:viewLayout:]([MFCardActionSectionData alloc], "initWithActions:viewLayout:", v52, 0);
    -[NSMutableArray addObject:](v11, "addObject:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource allMessagesInConversation](self, "allMessagesInConversation"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource undoManager](self, "undoManager"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[MFMoveToPredictionTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:presentationSource:delegate:presentingViewController:predictedMailbox:](MFMoveToPredictionTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:presentationSource:delegate:presentingViewController:predictedMailbox:", v28, v29, -[MailActionsViewDataSource origin](self, "origin"), 2, v6, v55, v54, v53));

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "cardActionsWithCompletion:", v7));
    v32 = -[MFCardActionSectionData initWithActions:viewLayout:]([MFCardActionSectionData alloc], "initWithActions:viewLayout:", v31, 2);
    -[NSMutableArray addObject:](v11, "addObject:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource _mailActionCardVerticalActionsWithPresentationSource:preparation:completion:](self, "_mailActionCardVerticalActionsWithPresentationSource:preparation:completion:", v6, v8, v7));
    v34 = -[MFCardActionSectionData initWithActions:viewLayout:]([MFCardActionSectionData alloc], "initWithActions:viewLayout:", v33, 0);
    -[NSMutableArray addObject:](v11, "addObject:", v34);

    if ((id)-[MailActionsViewDataSource origin](self, "origin") == (id)2
      && _os_feature_enabled_impl("Mail", "CatchUp")
      && EMIsGreymatterSupportedWithOverride()
      && _os_feature_enabled_impl("FeedbackFrameworks", "CentralizedFeedback"))
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource targetedMessages](self, "targetedMessages"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "firstObject"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "generatedSummary"));
      v36 = v35 == 0;

      if (!v36)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource targetedMessages](self, "targetedMessages"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[MFTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:](MFCatchUpFeedbackTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:", v37, v58, -[MailActionsViewDataSource origin](self, "origin"), 2));

        objc_msgSend(v49, "setDelegate:", v50);
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "cardActionWithCompletion:", v7));
        v38 = [MFCardActionSectionData alloc];
        v59[0] = v47;
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "feedbackAction"));
        v59[1] = v45;
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 2));
        v40 = -[MFCardActionSectionData initWithActions:viewLayout:](v38, "initWithActions:viewLayout:", v39, 2);
        -[NSMutableArray addObject:](v11, "addObject:", v40);

      }
    }

  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(+[MailActionsViewDataSource log](MailActionsViewDataSource, "log"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource primaryMessage](self, "primaryMessage"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "itemID"));
      v43 = NSStringFromSelector(a2);
      v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      *(_DWORD *)buf = 138543618;
      v63 = v42;
      v64 = 2114;
      v65 = v44;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "No contentRequest for %{public}@ in %{public}@", buf, 0x16u);

    }
    v11 = (NSMutableArray *)&__NSArray0__struct;
  }

  return v11;
}

- (id)primaryMessage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource target](self, "target"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "primaryMessage"));

  return v3;
}

- (id)selectedMessageContent
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource target](self, "target"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selectedMessageContent"));

  return v3;
}

- (id)primaryMessageContentRequest
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource target](self, "target"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "primaryMessageContentRequest"));

  return v3;
}

- (id)messageListItem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource target](self, "target"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "messageListItem"));

  return v3;
}

- (id)mailboxes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource target](self, "target"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "messageListItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mailboxes"));

  return v4;
}

- (id)targetedMessages
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource target](self, "target"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "targetedMessages"));

  return v3;
}

- (id)allMessagesInConversation
{
  void *v3;
  void *v4;
  void *v6;

  if (!-[MailActionsViewDataSource targetPreference](self, "targetPreference"))
    return (id)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource targetedMessages](self, "targetedMessages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource messageListItem](self, "messageListItem"));
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  return v4;
}

- (int64_t)targetPreference
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource target](self, "target"));
  v3 = objc_msgSend(v2, "targetPreference");

  return (int64_t)v3;
}

- (id)undoManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource scene](self, "scene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "undoManager"));

  return v3;
}

- (BOOL)isTargetValid
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  void *v14;
  _BYTE v15[24];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource delegate](self, "delegate"));
  if (!v4)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailActionsViewDataSource.m"), 198, CFSTR("MessageTriageInteractionHelper requires delegate to create triage interactions"));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource messageListItem](self, "messageListItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource primaryMessage](self, "primaryMessage"));
  if (!v6)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[MailActionsViewDataSource log](MailActionsViewDataSource, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      sub_100391BF0(v10, (uint64_t)v15, v8);
    }
    goto LABEL_10;
  }
  if (!v5)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[MailActionsViewDataSource log](MailActionsViewDataSource, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      sub_100391C38(v12, (uint64_t)v15, v8);
    }
LABEL_10:

    v7 = 0;
    goto LABEL_11;
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (id)_mailActionCardHorizontalActionsWithPresentationSource:(id)a3 preparation:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  int64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  NSMutableArray *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  MailActionsViewDataSource *v49;
  id v50;
  id v51;

  v8 = a3;
  v35 = a4;
  v34 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource primaryMessage](self, "primaryMessage"));
  v41 = v9;
  v10 = objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource primaryMessageContentRequest](self, "primaryMessageContentRequest"));
  v40 = (void *)v10;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource delegate](self, "delegate"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource scene](self, "scene"));
  v42 = objc_opt_new(NSMutableArray);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource selectedMessageContent](self, "selectedMessageContent"));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1000AF97C;
  v44[3] = &unk_10051D3D8;
  v39 = (id)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource mailboxes](self, "mailboxes"));
  v45 = v39;
  v11 = v8;
  v46 = v11;
  v37 = v33;
  v47 = v37;
  v36 = v32;
  v48 = v36;
  v49 = self;
  v12 = v35;
  v50 = v12;
  v13 = v34;
  v51 = v13;
  v14 = objc_retainBlock(v44);
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageCompositionTriageInteraction interactionWithContentRequest:scene:](MFReplyTriageInteraction, "interactionWithContentRequest:scene:", v10, v43));
  v15 = ((uint64_t (*)(_QWORD *, void *))v14[2])(v14, v38);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  -[NSMutableArray addObject:](v42, "addObject:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageCompositionTriageInteraction interactionWithContentRequest:scene:](MFReplyAllTriageInteraction, "interactionWithContentRequest:scene:", v10, v43));
  if (objc_msgSend(v17, "isPermitted"))
  {
    v18 = ((uint64_t (*)(_QWORD *, void *))v14[2])(v14, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    -[NSMutableArray addObject:](v42, "addObject:", v19);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageCompositionTriageInteraction interactionWithContentRequest:scene:](MFForwardTriageInteraction, "interactionWithContentRequest:scene:", v10, v43));
  v21 = ((uint64_t (*)(_QWORD *, void *))v14[2])(v14, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  -[NSMutableArray addObject:](v42, "addObject:", v22);

  v23 = objc_msgSend(v9, "shouldArchiveByDefault");
  v24 = -[MailActionsViewDataSource targetPreference](self, "targetPreference");
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource targetedMessages](self, "targetedMessages"));
  if (v23)
    v26 = 2;
  else
    v26 = 1;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource _archiveOrDeleteInteractionForMessageListItems:deleteOrArchive:presentationSource:type:shouldAskForConfirmation:](self, "_archiveOrDeleteInteractionForMessageListItems:deleteOrArchive:presentationSource:type:shouldAskForConfirmation:", v25, v26, v11, v24 != 0, 0));

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "cardActionWithPreparation:completion:", v12, v13));
  v29 = v28;
  v30 = &MFImageGlyphArchiveFill;
  if (!v23)
    v30 = &MFImageGlyphTrashFill;
  objc_msgSend(v28, "setImageName:", *v30);
  -[NSMutableArray addObject:](v42, "addObject:", v29);

  return v42;
}

- (id)_mailActionCardFlagActionsWithPresentationSource:(id)a3 preparation:(id)a4 completion:(id)a5
{
  id v6;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;

  v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource undoManager](self, "undoManager"));
  v8 = objc_opt_new(NSMutableArray);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource targetedMessages](self, "targetedMessages"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MFFlagChangeTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:reason:](MFFlagTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:reason:", v9, v7, -[MailActionsViewDataSource origin](self, "origin"), 2, 4));
  if ((objc_msgSend(v10, "isPermitted") & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource flagChangeInteractionDelegate](self, "flagChangeInteractionDelegate"));
    objc_msgSend(v10, "setDelegate:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cardActionWithCompletion:", v6));
    -[NSMutableArray addObject:](v8, "addObject:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MFFlagChangeTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:reason:](MFFlagColorTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:reason:", v9, v7, -[MailActionsViewDataSource origin](self, "origin"), 2, 4));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cardActionWithCompletion:", v6));
    -[NSMutableArray addObject:](v8, "addObject:", v14);

    v15 = v8;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_mailActionCardSendAgainAndUnreadActionsWithPresentationSource:(id)a3 preparation:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSMutableArray *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource delegate](self, "delegate"));
  v12 = objc_opt_new(NSMutableArray);
  if (!-[MailActionsViewDataSource targetPreference](self, "targetPreference"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource primaryMessageContentRequest](self, "primaryMessageContentRequest"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource scene](self, "scene"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageCompositionTriageInteraction interactionWithContentRequest:scene:](MFSendAgainTriageInteraction, "interactionWithContentRequest:scene:", v13, v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource mailboxes](self, "mailboxes"));
    objc_msgSend(v15, "setMessageSourceMailboxes:", v16);

    if (objc_msgSend(v15, "isPermitted"))
    {
      objc_msgSend(v15, "setPresentationSource:", v8);
      objc_msgSend(v15, "setDelegate:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cardActionWithPreparation:completion:", v9, v10));
      -[NSMutableArray addObject:](v12, "addObject:", v17);

    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource targetedMessages](self, "targetedMessages"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource undoManager](self, "undoManager"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MFFlagChangeTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:reason:](MFReadTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:reason:", v18, v19, -[MailActionsViewDataSource origin](self, "origin"), 2, 4));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "cardActionWithPreparation:completion:", v9, v10));
  -[NSMutableArray addObject:](v12, "addObject:", v21);

  return v12;
}

- (id)_mailActionCardVerticalActionsWithPresentationSource:(id)a3 preparation:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  NSMutableArray *v11;
  id v12;
  NSMutableArray *v13;
  id v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  unsigned int v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  NSMutableArray *v38;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  NSMutableArray *v54;
  id v55;
  id v56;

  v8 = a3;
  v42 = a4;
  v41 = a5;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource delegate](self, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource scene](self, "scene"));
  v10 = objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource undoManager](self, "undoManager"));
  v46 = (void *)v10;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource primaryMessage](self, "primaryMessage"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource allMessagesInConversation](self, "allMessagesInConversation"));
  v11 = objc_opt_new(NSMutableArray);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource primaryMessageContentRequest](self, "primaryMessageContentRequest", v11));
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_1000B05D0;
  v51[3] = &unk_10051D400;
  v12 = v8;
  v52 = v12;
  v47 = v40;
  v53 = v47;
  v13 = v11;
  v54 = v13;
  v14 = v42;
  v55 = v14;
  v15 = v41;
  v56 = v15;
  v16 = objc_retainBlock(v51);
  if (objc_msgSend(v50, "shouldArchiveByDefault"))
    v17 = 1;
  else
    v17 = 2;
  v18 = v12;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource _archiveOrDeleteInteractionForMessageListItems:deleteOrArchive:presentationSource:type:shouldAskForConfirmation:](self, "_archiveOrDeleteInteractionForMessageListItems:deleteOrArchive:presentationSource:type:shouldAskForConfirmation:", v49, v17, v12, 1, 0));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "cardActionWithPreparation:completion:", v14, v15));
  -[NSMutableArray addObject:](v13, "addObject:", v19);

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[MFFlagChangeTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:reason:](MFJunkTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:reason:", v49, v10, -[MailActionsViewDataSource origin](self, "origin"), 2, 4));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "cardActionWithPreparation:completion:", v14, v15));
  v48 = v18;
  -[NSMutableArray addObject:](v13, "addObject:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MFConversationFlagTriageInteraction interactionWithReferenceMessage:undoManager:origin:actor:](MFMuteTriageInteraction, "interactionWithReferenceMessage:undoManager:origin:actor:", v50, v10, -[MailActionsViewDataSource origin](self, "origin"), 2));
  objc_msgSend(v21, "setPresentationSource:", v48);
  objc_msgSend(v21, "setDelegate:", v47);
  if (objc_msgSend(v21, "isPermitted"))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "cardActionWithPreparation:completion:", v14, v15));
    -[NSMutableArray addObject:](v13, "addObject:", v22);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[MFConversationFlagTriageInteraction interactionWithReferenceMessage:undoManager:origin:actor:](MFNotifyTriageInteraction, "interactionWithReferenceMessage:undoManager:origin:actor:", v50, v10, -[MailActionsViewDataSource origin](self, "origin"), 2));
  ((void (*)(_QWORD *, void *))v16[2])(v16, v23);

  if (+[UIPrintInteractionController isPrintingAvailable](UIPrintInteractionController, "isPrintingAvailable")&& !-[MailActionsViewDataSource targetPreference](self, "targetPreference"))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource printerDelegate](self, "printerDelegate"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MFPrintTriageInteraction interactionWithContentRequest:scene:delegate:](MFPrintTriageInteraction, "interactionWithContentRequest:scene:delegate:", v45, v9, v24));

    objc_msgSend(v25, "setDelegate:", v47);
    objc_msgSend(v25, "setPresentationSource:", v48);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "cardActionWithPreparation:completion:", v14, v15));
    objc_msgSend(v26, "setShouldDismissCardBeforeExecuteHandler:", 1);
    -[NSMutableArray addObject:](v13, "addObject:", v26);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[MFSenderBlockingTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:blockSender:](MFSenderBlockingTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:blockSender:", v49, v46, -[MailActionsViewDataSource origin](self, "origin"), 2, objc_msgSend(v50, "isBlocked") ^ 1));
  ((void (*)(_QWORD *, void *))v16[2])(v16, v27);
  if (((unint64_t)objc_msgSend(v50, "unsubscribeType") & 5) != 0)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[MFUnsubscribeTriageInteraction interactionWithReferenceMessageListItems:origin:actor:](MFUnsubscribeTriageInteraction, "interactionWithReferenceMessageListItems:origin:actor:", v49, -[MailActionsViewDataSource origin](self, "origin"), 2));
    ((void (*)(_QWORD *, void *))v16[2])(v16, v28);

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v30 = mf_defaultsKeyForFeature(1);
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  v32 = objc_msgSend(v29, "BOOLForKey:", v31);

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v34 = objc_msgSend(v33, "BOOLForKey:", CFSTR("ShowSendEmlToTriageTeam"));

  if ((v32 | v34) == 1)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageCompositionTriageInteraction interactionWithContentRequest:scene:](MFSendAsEMLTriageInteraction, "interactionWithContentRequest:scene:", v45, v9));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource mailboxes](self, "mailboxes"));
    objc_msgSend(v35, "setMessageSourceMailboxes:", v36);

    objc_msgSend(v35, "setForTriageTeam:", v34);
    objc_msgSend(v35, "setPresentationSource:", v48);
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "cardActionWithPreparation:completion:", v14, v15));
    -[NSMutableArray addObject:](v13, "addObject:", v37);

  }
  v38 = v13;

  return v38;
}

- (id)_archiveOrDeleteInteractionForMessageListItems:(id)a3 deleteOrArchive:(unint64_t)a4 presentationSource:(id)a5 type:(int64_t)a6 shouldAskForConfirmation:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  void *v14;
  void *v15;
  __objc2_class *v16;
  void *v17;

  v7 = a7;
  v12 = a3;
  v13 = a5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource undoManager](self, "undoManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource delegate](self, "delegate"));
  if (a4 == 2)
    v16 = MFArchiveTriageInteraction;
  else
    v16 = MFDeleteTriageInteraction;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class interactionWithMessageListItems:undoManager:origin:actor:](v16, "interactionWithMessageListItems:undoManager:origin:actor:", v12, v14, -[MailActionsViewDataSource origin](self, "origin"), 2));
  objc_msgSend(v17, "setDelegate:", v15);
  objc_msgSend(v17, "setPresentationSource:", v13);
  objc_msgSend(v17, "setType:", a6);
  objc_msgSend(v17, "setShouldAskForConfirmation:", v7);

  return v17;
}

- (id)_categoryMailActionsWithCompletion:(id)a3
{
  return 0;
}

- (BOOL)includeReadLaterAction
{
  return self->includeReadLaterAction;
}

- (void)setIncludeReadLaterAction:(BOOL)a3
{
  self->includeReadLaterAction = a3;
}

- (ComposeCapable)scene
{
  return (ComposeCapable *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (MFTriageInteractionDelegate)delegate
{
  return (MFTriageInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MFFlagChangeTriageInteractionDelegate)flagChangeInteractionDelegate
{
  return (MFFlagChangeTriageInteractionDelegate *)objc_loadWeakRetained((id *)&self->_flagChangeInteractionDelegate);
}

- (void)setFlagChangeInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flagChangeInteractionDelegate, a3);
}

- (MUIPresentationSource)presentationSource
{
  return self->_presentationSource;
}

- (void)setPresentationSource:(id)a3
{
  objc_storeStrong((id *)&self->_presentationSource, a3);
}

- (MFTriageInteractionTarget)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_storeStrong((id *)&self->_target, a3);
}

- (id)preparation
{
  return self->_preparation;
}

- (void)setPreparation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (EFFuture)predictedMailbox
{
  return self->_predictedMailbox;
}

- (void)setPredictedMailbox:(id)a3
{
  objc_storeStrong((id *)&self->_predictedMailbox, a3);
}

- (MFMoveToPredictionTriageInteractionDelegate)moveToPredictionTriageInteractionDelegate
{
  return (MFMoveToPredictionTriageInteractionDelegate *)objc_loadWeakRetained((id *)&self->_moveToPredictionTriageInteractionDelegate);
}

- (void)setMoveToPredictionTriageInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_moveToPredictionTriageInteractionDelegate, a3);
}

- (UIViewController)presentingViewControllerForTransferUI
{
  return self->_presentingViewControllerForTransferUI;
}

- (void)setPresentingViewControllerForTransferUI:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewControllerForTransferUI, a3);
}

- (MFMessagePrinterDelegate)printerDelegate
{
  return (MFMessagePrinterDelegate *)objc_loadWeakRetained((id *)&self->_printerDelegate);
}

- (void)setPrinterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_printerDelegate, a3);
}

- (int64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(int64_t)a3
{
  self->_origin = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_printerDelegate);
  objc_storeStrong((id *)&self->_presentingViewControllerForTransferUI, 0);
  objc_destroyWeak((id *)&self->_moveToPredictionTriageInteractionDelegate);
  objc_storeStrong((id *)&self->_predictedMailbox, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_preparation, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_presentationSource, 0);
  objc_destroyWeak((id *)&self->_flagChangeInteractionDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_scene);
}

@end
