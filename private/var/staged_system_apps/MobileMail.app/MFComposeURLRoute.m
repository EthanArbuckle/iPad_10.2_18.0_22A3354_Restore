@implementation MFComposeURLRoute

- (MFComposeURLRoute)initWithScene:(id)a3
{
  return -[MFComposeURLRoute initWithScene:senderResolver:](self, "initWithScene:senderResolver:", a3, self);
}

- (MFComposeURLRoute)initWithScene:(id)a3 senderResolver:(id)a4
{
  id v6;
  id v7;
  MFComposeURLRoute *v8;
  MFComposeURLRoute *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MFComposeURLRoute;
  v8 = -[MFComposeURLRoute init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_scene, v6);
    v9->_priority = 0;
    objc_storeWeak((id *)&v9->_senderResolver, v7);
  }

  return v9;
}

- (BOOL)canRouteRequest:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "URL"));
  v4 = objc_msgSend(v3, "ef_hasScheme:", EMMailToURLScheme);

  return v4;
}

- (id)routeRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  char v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _BYTE v29[24];

  v4 = a3;
  v5 = objc_alloc((Class)_MFMailCompositionContext);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
  v7 = objc_msgSend(v5, "initWithURL:composeType:originalMessage:legacyMessage:", v6, 0, 0, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sourceMessageListItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayMessage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resultIfAvailable"));

  v11 = objc_msgSend(v4, "isExternal");
  if (v10)
    v12 = v11;
  else
    v12 = 1;
  if ((v12 & 1) != 0)
  {
    v13 = objc_claimAutoreleasedReturnValue(+[MFURLRoutingRequest log](MFURLRoutingRequest, "log"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_publicDescription"));
      sub_100393D3C(v14, (uint64_t)v29, v13);
    }
  }
  else
  {
    v15 = objc_claimAutoreleasedReturnValue(+[MFURLRoutingRequest log](MFURLRoutingRequest, "log"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_publicDescription"));
      sub_100393D84(v16, (uint64_t)v29, v15);
    }

    v13 = objc_claimAutoreleasedReturnValue(-[MFComposeURLRoute senderResolver](self, "senderResolver"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject preferredSenderFromMessage:](v13, "preferredSenderFromMessage:", v10));
    objc_msgSend(v7, "setPreferredSendingEmailAddress:", v17);

  }
  objc_msgSend(v7, "setShowKeyboardImmediately:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MFComposeURLRoute scene](self, "scene"));
  v20 = v19;
  if (v19)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10014F53C;
    v25[3] = &unk_10051A960;
    v26 = v19;
    v27 = v7;
    v28 = v18;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    objc_msgSend(v21, "performBlock:", v25);

    v22 = v26;
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mf_generalRoutingErrorWithDescription:request:](NSError, "mf_generalRoutingErrorWithDescription:request:", CFSTR("Can't present compose, scene is nil."), v4));
    objc_msgSend(v18, "finishWithError:", v22);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "future"));
  return v23;
}

- (id)preferredSenderFromMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFComposeURLRoute scene](self, "scene"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mailboxProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mailboxObjectIDs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "legacyMailboxForObjectID:", v8));

  v10 = objc_msgSend(objc_alloc((Class)MFEMMessageStore), "initWithEMMessage:messageClass:mailboxUid:skipAttachmentDownload:", v4, objc_opt_class(MFMailMessage), v9, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "legacyMessage"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "preferredEmailAddressToReplyWith"));

  return v12;
}

- (NSString)ef_publicDescription
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(self), self);
}

- (int64_t)priority
{
  return self->_priority;
}

- (ComposeCapable)scene
{
  return (ComposeCapable *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (MFComposeURLRouteSenderResolver)senderResolver
{
  return (MFComposeURLRouteSenderResolver *)objc_loadWeakRetained((id *)&self->_senderResolver);
}

- (void)setSenderResolver:(id)a3
{
  objc_storeWeak((id *)&self->_senderResolver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_senderResolver);
  objc_destroyWeak((id *)&self->_scene);
}

@end
