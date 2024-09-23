@implementation MFConversationHandoffCoordinator

- (MFConversationHandoffCoordinator)initWithUserActivityProvider:(id)a3 currentVisibleMessageStrategy:(id)a4
{
  id v6;
  id v7;
  MFConversationHandoffCoordinator *v8;
  MFConversationHandoffCoordinator *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MFConversationHandoffCoordinator;
  v8 = -[MFConversationHandoffCoordinator init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_userActivityProvider, v6);
    objc_storeStrong((id *)&v9->_currentVisibleMessageStrategy, a4);
  }

  return v9;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100153F1C;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA0E8 != -1)
    dispatch_once(&qword_1005AA0E8, block);
  return (OS_os_log *)(id)qword_1005AA0E0;
}

- (void)updateUserActivityState
{
  -[MFConversationHandoffCoordinator updateUserActivityState:](self, "updateUserActivityState:", 0);
}

- (void)updateUserActivityState:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BOOL v20;
  id location;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationHandoffCoordinator handoffMessageRequest](self, "handoffMessageRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationHandoffCoordinator userActivityProvider](self, "userActivityProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userActivity"));
  if (!v7)
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationHandoffCoordinator _createUserActivity](self, "_createUserActivity"));
  objc_msgSend(v7, "setPersistentIdentifier:", 0);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messageFuture"));
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_10015416C;
  v15 = &unk_100520C48;
  v9 = v5;
  v16 = v9;
  objc_copyWeak(&v19, &location);
  v10 = v7;
  v17 = v10;
  v11 = v6;
  v18 = v11;
  v20 = a3;
  objc_msgSend(v8, "addSuccessBlock:", &v12);
  objc_msgSend(v8, "addFailureBlock:", &stru_100520C68, v12, v13, v14, v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)setHandoffMessageRequest:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[MessageContentRepresentationRequest isEqual:](self->_handoffMessageRequest, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_handoffMessageRequest, a3);
    -[MFConversationHandoffCoordinator updateUserActivityState:](self, "updateUserActivityState:", 1);
  }

}

- (void)updateHandoffMessageBasedOnMessageVisibility
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationHandoffCoordinator currentVisibleMessageStrategy](self, "currentVisibleMessageStrategy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentVisibleMessageContentRequest"));
  -[MFConversationHandoffCoordinator setHandoffMessageRequest:](self, "setHandoffMessageRequest:", v3);

}

- (id)_createUserActivity
{
  id v2;

  v2 = objc_alloc((Class)NSUserActivity);
  return objc_msgSend(v2, "initWithActivityType:", MSMailActivityHandoffTypeDisplayMessage);
}

- (void)_updateUserActivity:(id)a3 withSearchableItemAttributeSetForMessage:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  v6 = objc_alloc((Class)CSSearchableItemAttributeSet);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activityType"));
  v8 = objc_msgSend(v6, "initWithItemContentType:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentID"));
  if (v9)
  {
    objc_msgSend(v8, "setRelatedUniqueIdentifier:", v9);
    objc_msgSend(v10, "setEligibleForSearch:", 1);
  }
  else
  {

    v8 = 0;
    objc_msgSend(v10, "setEligibleForSearch:", 0);
  }
  objc_msgSend(v10, "setContentAttributeSet:", v8);

}

- (void)_updateUserActivity:(id)a3 withHandoffAvailabilityForContentRepresentation:(id)a4 message:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[2];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accountsProvider"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mailboxes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "account"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "legacyMailAccountForObjectID:", v15));

  v17 = MSMailActivityHandoffTypeDisplayMessage;
  v18 = objc_msgSend(v16, "supportsHandoffType:", MSMailActivityHandoffTypeDisplayMessage);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "publicMessageURL"));
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "absoluteString"));
  v21 = (void *)v20;
  if (v19)
  {
    v25[0] = MSMailActivityHandoffTypeKey;
    v25[1] = MSMailActivityHandoffDisplayMessageKeyURL;
    v26[0] = v17;
    v26[1] = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 2));
    objc_msgSend(v7, "setUserInfo:", v22);

    if ((objc_opt_respondsToSelector(v7, "set_canonicalURL:") & 1) != 0)
      objc_msgSend(v7, "set_canonicalURL:", v19);
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v7, "setEligibleForHandoff:", v18);
  objc_msgSend(v7, "setPersistentIdentifier:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subject"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[ECSubjectFormatter subjectStringForDisplayForSubject:](ECSubjectFormatter, "subjectStringForDisplayForSubject:", v23));
  objc_msgSend(v7, "setTitle:", v24);

}

- (void)_updateUserActivity:(id)a3 withPersistentIDForMessage:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationHandoffCoordinator currentVisibleMessageStrategy](self, "currentVisibleMessageStrategy"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "persistentIDForEMMessageObjectID:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100154CA8;
  v23[3] = &unk_100520C90;
  v15 = v8;
  v24 = v15;
  v16 = v10;
  v25 = v16;
  objc_msgSend(v13, "onScheduler:addSuccessBlock:", v14, v23);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100154D20;
  v20[3] = &unk_100520CB8;
  v18 = v9;
  v21 = v18;
  v19 = v16;
  v22 = v19;
  objc_msgSend(v13, "onScheduler:addFailureBlock:", v17, v20);

}

- (MFUserActivityProvider)userActivityProvider
{
  return (MFUserActivityProvider *)objc_loadWeakRetained((id *)&self->_userActivityProvider);
}

- (void)setUserActivityProvider:(id)a3
{
  objc_storeWeak((id *)&self->_userActivityProvider, a3);
}

- (MFCurrentVisibleMessageStrategy)currentVisibleMessageStrategy
{
  return self->_currentVisibleMessageStrategy;
}

- (void)setCurrentVisibleMessageStrategy:(id)a3
{
  objc_storeStrong((id *)&self->_currentVisibleMessageStrategy, a3);
}

- (MessageContentRepresentationRequest)handoffMessageRequest
{
  return self->_handoffMessageRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handoffMessageRequest, 0);
  objc_storeStrong((id *)&self->_currentVisibleMessageStrategy, 0);
  objc_destroyWeak((id *)&self->_userActivityProvider);
}

@end
