@implementation MessageTriageInteractionHelper

- (id)_queryForObservedMailboxesWithPredicate:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[2];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper observedMailboxes](self, "observedMailboxes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForMessagesInMailboxes:](EMMessageListItemPredicates, "predicateForMessagesInMailboxes:", v8));

  v14[0] = v9;
  v14[1] = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v10));

  v12 = objc_msgSend(objc_alloc((Class)EMQuery), "initWithTargetClass:predicate:sortDescriptors:queryOptions:label:", objc_opt_class(EMMessage), v11, &__NSArray0__struct, 0, v7);
  return v12;
}

- (NSArray)mailboxes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper target](self, "target"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "messageListItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mailboxes"));

  return (NSArray *)v4;
}

- (void)startObservingMailboxes:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  NSArray *v6;
  NSArray *observedMailboxes;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper mailboxes](self, "mailboxes"));
  v5 = objc_msgSend(v4, "isEqualToArray:", v8);

  if ((v5 & 1) == 0)
  {
    v6 = (NSArray *)objc_msgSend(v8, "copy");
    observedMailboxes = self->_observedMailboxes;
    self->_observedMailboxes = v6;

    -[MessageTriageInteractionHelper _startObservingMailboxes](self, "_startObservingMailboxes");
  }

}

- (void)_startObservingMailboxes
{
  id v3;
  void *v4;
  EMQuery *v5;
  EMQuery *unflaggedCountQuery;
  EFCancelable *v7;
  EFCancelable *unflaggedCountObserver;
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper observedMailboxes](self, "observedMailboxes"));
  v3 = objc_msgSend(v9, "count");

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper unflaggedCountObserver](self, "unflaggedCountObserver"));

    if (v4)
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper unflaggedCountObserver](self, "unflaggedCountObserver"));
      objc_msgSend(v10, "cancel");

      -[MessageTriageInteractionHelper setUnflaggedCountObserver:](self, "setUnflaggedCountObserver:", 0);
    }
    v11 = (id)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForUnflaggedMessages](EMMessageListItemPredicates, "predicateForUnflaggedMessages"));
    v5 = (EMQuery *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper _queryForObservedMailboxesWithPredicate:label:](self, "_queryForObservedMailboxesWithPredicate:label:"));
    unflaggedCountQuery = self->_unflaggedCountQuery;
    self->_unflaggedCountQuery = v5;

    v12 = (id)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper messageRepository](self, "messageRepository"));
    v7 = (EFCancelable *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startCountingQuery:includingServerCountsForMailboxScope:withObserver:", self->_unflaggedCountQuery, 0, self));
    unflaggedCountObserver = self->_unflaggedCountObserver;
    self->_unflaggedCountObserver = v7;

  }
}

- (MessageTriageInteractionHelper)initWithDataSource:(id)a3 triageInteractionDelegate:(id)a4 scene:(id)a5 presentingViewController:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MessageTriageInteractionHelper *v14;
  MessageTriageInteractionHelper *v15;
  void *v16;
  uint64_t v17;
  EMMessageRepository *messageRepository;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MessageTriageInteractionHelper;
  v14 = -[MessageTriageInteractionHelper init](&v20, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_dataSource, v10);
    objc_storeWeak((id *)&v15->_delegate, v11);
    objc_storeWeak((id *)&v15->_scene, v12);
    objc_storeStrong((id *)&v15->_presentingViewController, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "daemonInterface"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "messageRepository"));
    messageRepository = v15->_messageRepository;
    v15->_messageRepository = (EMMessageRepository *)v17;

  }
  return v15;
}

- (EMQuery)unflaggedCountQuery
{
  return self->_unflaggedCountQuery;
}

- (EFCancelable)unflaggedCountObserver
{
  return self->_unflaggedCountObserver;
}

- (MFTriageInteractionTarget)target
{
  return self->_target;
}

- (void)setUnflaggedCount:(int64_t)a3
{
  self->_unflaggedCount = a3;
}

- (NSArray)observedMailboxes
{
  return self->_observedMailboxes;
}

- (EMMessageRepository)messageRepository
{
  return self->_messageRepository;
}

- (void)messageRepository:(id)a3 query:(id)a4 countDidChange:(int64_t)a5
{
  void *v7;
  unsigned int v8;
  id v9;

  v9 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper unflaggedCountQuery](self, "unflaggedCountQuery"));
  v8 = objc_msgSend(v7, "isEqual:", v9);

  if (v8)
    -[MessageTriageInteractionHelper setUnflaggedCount:](self, "setUnflaggedCount:", a5);

}

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013FE98;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA018 != -1)
    dispatch_once(&qword_1005AA018, block);
  return (id)qword_1005AA010;
}

- (MessageTriageInteractionHelper)initWithDataSource:(id)a3 triageInteractionDelegate:(id)a4 scene:(id)a5
{
  return -[MessageTriageInteractionHelper initWithDataSource:triageInteractionDelegate:scene:presentingViewController:](self, "initWithDataSource:triageInteractionDelegate:scene:presentingViewController:", a3, a4, a5, 0);
}

- (EMMessage)primaryMessage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper target](self, "target"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "primaryMessage"));

  return (EMMessage *)v3;
}

- (EMMessageListItem)messageListItem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper target](self, "target"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "messageListItem"));

  return (EMMessageListItem *)v3;
}

- (NSArray)targetedMessages
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  if ((id)-[MessageTriageInteractionHelper targetPreference](self, "targetPreference") == (id)1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper messageListItem](self, "messageListItem"));
    v11 = v3;
    v4 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper primaryMessage](self, "primaryMessage"));
    v3 = (void *)v5;
    if (!v5)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper messageListItem](self, "messageListItem"));
      v9 = v8;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

      goto LABEL_6;
    }
    v10 = v5;
    v4 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  }
  v6 = (void *)v4;
LABEL_6:

  return (NSArray *)v6;
}

- (NSArray)allMessagesInConversation
{
  void *v3;
  void *v4;
  void *v6;

  if (!-[MessageTriageInteractionHelper targetPreference](self, "targetPreference"))
    return (NSArray *)(id)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper targetedMessages](self, "targetedMessages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper messageListItem](self, "messageListItem"));
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  return (NSArray *)v4;
}

- (int64_t)targetPreference
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper target](self, "target"));
  v3 = objc_msgSend(v2, "targetPreference");

  return (int64_t)v3;
}

- (id)undoManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper scene](self, "scene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "undoManager"));

  return v3;
}

- (void)didLongPressTrashButtonWithPresentationSource:(id)a3 presentFromViewController:(id)a4 target:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id *v35;
  id *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  _QWORD v56[5];
  id v57;
  id v58;
  id v59;
  id v60;
  _QWORD v61[5];
  id v62;
  id v63;
  id v64;
  id v65;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[MessageTriageInteractionHelper setTarget:](self, "setTarget:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper primaryMessage](self, "primaryMessage"));
  if (v13)
  {
    v45 = v11;
    v46 = v10;
    v48 = v12;
    v44 = v13;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper messageListItem](self, "messageListItem"));
    v14 = objc_msgSend(v43, "count");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("ARCHIVE_EMAIL"), &stru_100531B00, CFSTR("Main")));
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_1001409AC;
    v61[3] = &unk_100520430;
    v61[4] = self;
    v18 = v13;
    v62 = v18;
    v19 = v10;
    v63 = v19;
    v20 = v11;
    v64 = v20;
    v21 = v48;
    v65 = v21;
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v17, 0, v61));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper mailboxes](self, "mailboxes"));
    LODWORD(v16) = +[EMMailbox deleteMovesToTrashForMailboxes:](EMMailbox, "deleteMovesToTrashForMailboxes:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if ((_DWORD)v16)
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("TRASH_EMAIL"), &stru_100531B00, CFSTR("Main")));
    else
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("DELETE_EMAIL"), &stru_100531B00, CFSTR("Main")));

    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_100140A8C;
    v56[3] = &unk_100520430;
    v56[4] = self;
    v24 = v18;
    v57 = v24;
    v25 = v19;
    v58 = v25;
    v26 = v20;
    v59 = v26;
    v27 = v21;
    v60 = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v47, 2, v56));
    if (objc_msgSend(v24, "shouldArchiveByDefault"))
    {
      objc_msgSend(v15, "addAction:", v49);
      v29 = v28;
      if ((unint64_t)v14 >= 2)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper allMessagesInConversation](self, "allMessagesInConversation"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper triageInteractionForTriageAction:withMessageListItems:presentationSource:presentingViewController:moveInteractionDelegate:forPreview:origin:](self, "triageInteractionForTriageAction:withMessageListItems:presentationSource:presentingViewController:moveInteractionDelegate:forPreview:origin:", 9, v30, v25, v26, 0, 0, 3));

        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "title"));
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_100140B6C;
        v53[3] = &unk_10051E460;
        v33 = v31;
        v54 = v33;
        v55 = v27;
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v32, 0, v53));
        objc_msgSend(v15, "addAction:", v34);
        v35 = &v54;
        v36 = &v55;
        v29 = v28;
LABEL_10:

      }
    }
    else
    {
      objc_msgSend(v15, "addAction:", v28);
      v29 = v49;
      if ((unint64_t)v14 >= 2)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper allMessagesInConversation](self, "allMessagesInConversation"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper triageInteractionForTriageAction:withMessageListItems:presentationSource:presentingViewController:moveInteractionDelegate:forPreview:origin:](self, "triageInteractionForTriageAction:withMessageListItems:presentationSource:presentingViewController:moveInteractionDelegate:forPreview:origin:", 8, v37, v25, v26, 0, 0, 3));

        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "title"));
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_100140B78;
        v50[3] = &unk_10051E460;
        v33 = v38;
        v51 = v33;
        v52 = v27;
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v32, 2, v50));
        objc_msgSend(v15, "addAction:", v34);
        v35 = &v51;
        v36 = &v52;
        v29 = v49;
        goto LABEL_10;
      }
    }
    objc_msgSend(v15, "addAction:", v29);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100531B00, CFSTR("Main")));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v40, 1, 0));
    objc_msgSend(v15, "addAction:", v41);

    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "popoverPresentationController"));
    objc_msgSend(v25, "mui_setAsSourceForPopoverPresentationController:", v42);

    objc_msgSend(v26, "presentViewController:animated:completion:", v15, 1, 0);
    v11 = v45;
    v10 = v46;
    v12 = v48;
    v13 = v44;
  }

}

- (id)archiveOrDeleteTriageInteractionWithPresentationSource:(id)a3 target:(id)a4 origin:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v18;
  void *v19;

  v8 = a3;
  -[MessageTriageInteractionHelper setTarget:](self, "setTarget:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper primaryMessage](self, "primaryMessage"));
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "shouldArchiveByDefault");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper undoManager](self, "undoManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper delegate](self, "delegate"));
    if (v11)
    {
      v19 = v10;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
      v15 = objc_claimAutoreleasedReturnValue(+[MFDestructiveTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:](MFArchiveTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:", v14, v12, a5, 2));
    }
    else
    {
      v18 = v10;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
      v15 = objc_claimAutoreleasedReturnValue(+[MFDestructiveTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:](MFDeleteTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:", v14, v12, a5, 2));
    }
    v16 = (void *)v15;

    objc_msgSend(v16, "setDelegate:", v13);
    objc_msgSend(v16, "setPresentationSource:", v8);
    objc_msgSend(v16, "setType:", 0);
    objc_msgSend(v16, "setShouldAskForConfirmation:", 1);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)triageInteractionForTriageAction:(int64_t)a3 withMessageListItems:(id)a4 presentationSource:(id)a5 presentingViewController:(id)a6 moveInteractionDelegate:(id)a7 forPreview:(BOOL)a8 origin:(int64_t)a9
{
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD *v26;
  void *v27;
  __objc2_class **v28;
  __objc2_class **v29;
  __objc2_class **v30;
  uint64_t v31;
  void *v32;
  unsigned __int8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  MessageTriageInteractionHelper *v52;
  id v53;
  id v54;
  BOOL v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[16];
  _BYTE v61[128];

  v15 = a4;
  v16 = a5;
  v45 = a6;
  v46 = a7;
  v44 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
  if (a3 == 16)
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v18 = v15;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v57;
      a3 = 8;
LABEL_4:
      v21 = 0;
      while (1)
      {
        if (*(_QWORD *)v57 != v20)
          objc_enumerationMutation(v18);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * v21), "shouldArchiveByDefault") & 1) != 0)
          break;
        if (v19 == (id)++v21)
        {
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
          if (v19)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      a3 = 9;
    }

    v16 = v44;
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper scene](self, "scene"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper dataSource](self, "dataSource"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper delegate](self, "delegate"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper undoManager](self, "undoManager"));
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10014141C;
  v49[3] = &unk_100520458;
  v22 = v17;
  v50 = v22;
  v23 = v42;
  v51 = v23;
  v52 = self;
  v24 = v43;
  v53 = v24;
  v25 = v16;
  v54 = v25;
  v55 = a8;
  v26 = objc_retainBlock(v49);
  v27 = 0;
  v28 = &off_100518EC0;
  v29 = off_100518D28;
  v30 = &off_100518EA0;
  switch(a3)
  {
    case 2:
      goto LABEL_27;
    case 6:
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[MFFlagChangeTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:reason:](MFFlagTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:reason:", v15, v48, a9, 2, 4));
      objc_msgSend(v27, "setDelegate:", self);
      break;
    case 7:
      v31 = objc_claimAutoreleasedReturnValue(+[MFMoveToPredictionTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:presentationSource:delegate:presentingViewController:predictedMailbox:](MFMoveToPredictionTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:presentationSource:delegate:presentingViewController:predictedMailbox:", v15, v48, a9, 2, v25, v46, v45, 0));
      goto LABEL_28;
    case 8:
      goto LABEL_17;
    case 9:
      v29 = &off_100518C90;
LABEL_17:
      v31 = objc_claimAutoreleasedReturnValue(-[__objc2_class interactionWithMessageListItems:undoManager:origin:actor:](*v29, "interactionWithMessageListItems:undoManager:origin:actor:", v15, v48, a9, 2));
      goto LABEL_28;
    case 10:
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[MFConversationFlagTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:](MFNotifyTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:", v15, v48, a9, 2));
      v33 = objc_msgSend(v32, "isPermitted");
      goto LABEL_20;
    case 11:
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[MFConversationFlagTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:](MFMuteTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:", v15, v48, a9, 2));
      v33 = objc_msgSend(v32, "isPermitted");
LABEL_20:
      if ((v33 & 1) == 0)
        goto LABEL_38;
      v27 = v32;
      break;
    case 12:
      goto LABEL_23;
    case 13:
      v28 = off_100518EB8;
LABEL_23:
      v34 = objc_opt_class(*v28);
      v35 = ((uint64_t (*)(_QWORD *, uint64_t))v26[2])(v26, v34);
      v31 = objc_claimAutoreleasedReturnValue(v35);
      goto LABEL_28;
    case 14:
      v36 = objc_opt_class(MFForwardTriageInteraction);
      v37 = ((uint64_t (*)(_QWORD *, uint64_t))v26[2])(v26, v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      v27 = v38;
      if (v38)
      {
        objc_msgSend(v38, "setAttachmentPolicy:", 1);
        objc_msgSend(v27, "setPresentationSource:", v25);
        objc_msgSend(v27, "setDelegate:", v47);
      }
      break;
    case 15:
      v30 = &off_100518D78;
LABEL_27:
      v31 = objc_claimAutoreleasedReturnValue(-[__objc2_class interactionWithMessageListItems:undoManager:origin:actor:reason:](*v30, "interactionWithMessageListItems:undoManager:origin:actor:reason:", v15, v48, a9, 2, 4));
      goto LABEL_28;
    case 17:
      if ((objc_opt_respondsToSelector(v23, "messageListForMessageTriageInteractionHelper:messageListItem:") & 1) != 0)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "messageListForMessageTriageInteractionHelper:messageListItem:", self, v22));
        if (v32)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[MFOpenWindowTriageInteraction interactionWithMessageListItem:origin:actor:messageList:](MFOpenWindowTriageInteraction, "interactionWithMessageListItem:origin:actor:messageList:", v22, a9, 2, v32));
        }
        else
        {
          v40 = objc_claimAutoreleasedReturnValue(+[MessageTriageInteractionHelper log](MessageTriageInteractionHelper, "log"));
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "itemID"));
            sub_1003937CC(v41, (uint64_t)v60, v40);
          }

LABEL_38:
          v27 = 0;
        }

      }
      else
      {
        v27 = 0;
      }
      break;
    case 18:
    case 19:
      v31 = objc_claimAutoreleasedReturnValue(+[MFSenderBlockingTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:blockSender:](MFSenderBlockingTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:blockSender:", v15, v48, a9, 2, a3 == 18));
LABEL_28:
      v27 = (void *)v31;
      break;
    case 20:
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[MFUnsubscribeTriageInteraction interactionWithReferenceMessageListItems:origin:actor:](MFUnsubscribeTriageInteraction, "interactionWithReferenceMessageListItems:origin:actor:", v15, a9, 2));
      objc_msgSend(v27, "setPresentationSource:", v25);
      objc_msgSend(v27, "setShouldAskForConfirmation:", 1);
      objc_msgSend(v27, "setDelegate:", v47);
      break;
    default:
      break;
  }

  return v27;
}

- (id)presentingViewControllerForTriageInteraction:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper presentingViewController](self, "presentingViewController", a3));
}

- (BOOL)flagStateForFlagChangeTriageInteraction:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v14;

  v5 = a3;
  if (!objc_msgSend(v5, "supportsSelectAll")
    || !objc_msgSend(v5, "shouldOverrideFlagState"))
  {
    v9 = objc_opt_class(MFFlagTriageInteraction);
    if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messageListItemSelection"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "messageListItems"));
      v8 = objc_msgSend(v11, "ef_any:", &stru_100520478);

      goto LABEL_12;
    }
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  v6 = objc_opt_class(MFReadTriageInteraction);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    v12 = objc_opt_class(MFFlagTriageInteraction);
    if ((objc_opt_isKindOfClass(v5, v12) & 1) != 0)
    {
      v8 = -[MessageTriageInteractionHelper unflaggedCount](self, "unflaggedCount") > 0;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper dataSource](self, "dataSource"));
  if ((objc_opt_respondsToSelector(v7, "unreadBadgeCountForMessageTriageInteractionHelper:") & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageTriageInteractionHelper.m"), 354, CFSTR("dataSource needs to implement unreadBadgeCountForMessageTriageInteractionHelper:."));

  }
  v8 = objc_msgSend(v7, "unreadBadgeCountForMessageTriageInteractionHelper:", self) == 0;

LABEL_12:
  return v8;
}

- (BOOL)flagStateForTriageAction:(int64_t)a3 messageListItems:(id)a4 isSelectAll:(BOOL)a5 supportsSelectAll:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  unsigned __int8 v15;
  void *v17;

  v6 = a6;
  v7 = a5;
  v11 = a4;
  v12 = v11;
  if (!v7 || !v6)
  {
    if (a3 == 2)
    {
      v15 = objc_msgSend(v11, "ef_all:", &stru_1005204B8);
    }
    else
    {
      if (a3 != 6)
      {
LABEL_11:
        v14 = 0;
        goto LABEL_15;
      }
      v15 = objc_msgSend(v11, "ef_any:", &stru_100520498);
    }
    v14 = v15;
    goto LABEL_15;
  }
  if (a3 == 6)
  {
    v14 = -[MessageTriageInteractionHelper unflaggedCount](self, "unflaggedCount") > 0;
    goto LABEL_15;
  }
  if (a3 != 2)
    goto LABEL_11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper dataSource](self, "dataSource"));
  if ((objc_opt_respondsToSelector(v13, "unreadBadgeCountForMessageTriageInteractionHelper:") & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageTriageInteractionHelper.m"), 375, CFSTR("dataSource needs to implement unreadBadgeCountForMessageTriageInteractionHelper:."));

  }
  v14 = objc_msgSend(v13, "unreadBadgeCountForMessageTriageInteractionHelper:", self) == 0;

LABEL_15:
  return v14;
}

- (id)messageRepositoryForTriageInteraction:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MessageTriageInteractionHelper messageRepository](self, "messageRepository", a3));
}

- (int64_t)unreadBadgetCount
{
  return self->_unreadBadgetCount;
}

- (void)setUnreadBadgetCount:(int64_t)a3
{
  self->_unreadBadgetCount = a3;
}

- (MessageTriageInteractionHelperDataSource)dataSource
{
  return (MessageTriageInteractionHelperDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (MFTriageInteractionDelegate)delegate
{
  return (MFTriageInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ComposeCapable)scene
{
  return (ComposeCapable *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void)setTarget:(id)a3
{
  objc_storeStrong((id *)&self->_target, a3);
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (void)setMessageRepository:(id)a3
{
  objc_storeStrong((id *)&self->_messageRepository, a3);
}

- (void)setUnflaggedCountObserver:(id)a3
{
  objc_storeStrong((id *)&self->_unflaggedCountObserver, a3);
}

- (void)setUnflaggedCountQuery:(id)a3
{
  objc_storeStrong((id *)&self->_unflaggedCountQuery, a3);
}

- (int64_t)unflaggedCount
{
  return self->_unflaggedCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unflaggedCountQuery, 0);
  objc_storeStrong((id *)&self->_unflaggedCountObserver, 0);
  objc_storeStrong((id *)&self->_messageRepository, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_observedMailboxes, 0);
}

@end
