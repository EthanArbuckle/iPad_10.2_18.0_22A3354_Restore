@implementation MFMessageDisplayURLRoute

- (MFMessageDisplayURLRoute)initWithScene:(id)a3
{
  return -[MFMessageDisplayURLRoute initWithScene:actionHandler:](self, "initWithScene:actionHandler:", a3, self);
}

- (MFMessageDisplayURLRoute)initWithScene:(id)a3 actionHandler:(id)a4
{
  id v6;
  id v7;
  MFMessageDisplayURLRoute *v8;
  MFMessageDisplayURLRoute *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MFMessageDisplayURLRoute;
  v8 = -[MFMessageDisplayURLRoute init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_scene, v6);
    objc_storeWeak((id *)&v9->_actionHandler, v7);
    v9->_priority = 0;
    v9->_timeoutInterval = 5.0;
  }

  return v9;
}

- (BOOL)canRouteRequest:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "URL"));
  if ((objc_msgSend(v3, "em_isMessageURL") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "em_isInternalMessageURL");

  return v4;
}

- (id)routeRequest:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  MFUserInteractionAssertion *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  MFUserInteractionAssertion *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  MFUserInteractionAssertion *v28;
  void *v29;
  double v30;
  double v31;
  id v32;
  id v33;
  MFUserInteractionAssertion *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  MFUserInteractionAssertion *v40;
  void *v41;
  void *ptr;
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  MFUserInteractionAssertion *v49;
  MFMessageDisplayURLRoute *v50;
  os_signpost_id_t v51;
  _QWORD v52[4];
  id v53;
  id v54;
  MFUserInteractionAssertion *v55;
  MFMessageDisplayURLRoute *v56;
  os_signpost_id_t v57;
  _QWORD v58[4];
  MFUserInteractionAssertion *v59;
  MFMessageDisplayURLRoute *v60;
  id v61;
  os_signpost_id_t v62;
  _QWORD v63[5];
  id v64;
  _QWORD v65[5];
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;

  v43 = a3;
  ptr = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageDisplayURLRoute scene](self, "scene"));
  v4 = MFMessageLoadingSignpostLog(ptr);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_signpost_id_make_with_pointer(v5, ptr);

  v8 = MFMessageLoadingSignpostLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v6, "LaunchMessageURLDisplay", " enableTelemetry=YES ", buf, 2u);
  }

  v11 = [MFUserInteractionAssertion alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "URL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Load message from url - %@"), v12));
  -[MFMessageDisplayURLRoute timeoutInterval](self, "timeoutInterval");
  v40 = -[MFUserInteractionAssertion initWithReason:timeout:](v11, "initWithReason:timeout:", v13);

  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_10017A508;
  v65[3] = &unk_10051AA98;
  v65[4] = self;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  objc_msgSend(v14, "performBlock:", v65);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(ptr, "daemonInterface"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "messageRepository"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "URL"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "messageObjectIDForURL:", v17));

  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_10017A554;
  v63[3] = &unk_1005219B8;
  v63[4] = self;
  v18 = ptr;
  v64 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "then:", v63));
  v20 = objc_claimAutoreleasedReturnValue(+[MFURLRoutingRequest log](MFURLRoutingRequest, "log"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "ef_publicDescription"));
    *(_DWORD *)buf = 134218242;
    v67 = v19;
    v68 = 2114;
    v69 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%p: processing message display for request %{public}@", buf, 0x16u);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_10017A678;
  v58[3] = &unk_100521A30;
  v62 = v6;
  v23 = v40;
  v59 = v23;
  v60 = self;
  v24 = v18;
  v61 = v24;
  objc_msgSend(v19, "onScheduler:addSuccessBlock:", v22, v58);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10017AAA8;
  v52[3] = &unk_100521A58;
  v57 = v6;
  v26 = v19;
  v53 = v26;
  v27 = v43;
  v54 = v27;
  v28 = v23;
  v55 = v28;
  v56 = self;
  objc_msgSend(v26, "onScheduler:addFailureBlock:", v25, v52);

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  -[MFMessageDisplayURLRoute timeoutInterval](self, "timeoutInterval");
  v31 = v30;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10017AC80;
  v46[3] = &unk_10051CD78;
  v32 = v26;
  v47 = v32;
  v51 = v6;
  v33 = v27;
  v48 = v33;
  v34 = v28;
  v49 = v34;
  v50 = self;
  v35 = objc_msgSend(v29, "afterDelay:performBlock:", v46, v31);

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "then:", &stru_100521A98));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10017AE18;
  v44[3] = &unk_100521AC0;
  v37 = v33;
  v45 = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "recover:", v44));

  return v38;
}

- (id)_configureMessageListAndPromiseForQuery:(id)a3 repository:(id)a4
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
  -[MFMessageDisplayURLRoute _resetMessageListAndPromise](self, "_resetMessageListAndPromise");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
  -[MFMessageDisplayURLRoute setMessageDisplayPromise:](self, "setMessageDisplayPromise:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageDisplayURLRoute actionHandler](self, "actionHandler"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "createMessageListWithQuery:repository:", v6, v7));
  -[MFMessageDisplayURLRoute setMessageList:](self, "setMessageList:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageDisplayURLRoute messageList](self, "messageList"));
  objc_msgSend(v11, "beginObserving:", self);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageDisplayURLRoute messageDisplayPromise](self, "messageDisplayPromise"));
  return v12;
}

- (void)_resetMessageListAndPromise
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageDisplayURLRoute messageList](self, "messageList"));

  if (v3)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MFMessageDisplayURLRoute messageList](self, "messageList"));
    objc_msgSend(v6, "stopObserving:", self);

    -[MFMessageDisplayURLRoute setMessageList:](self, "setMessageList:", 0);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageDisplayURLRoute messageDisplayPromise](self, "messageDisplayPromise"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageDisplayURLRoute messageDisplayPromise](self, "messageDisplayPromise"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "future"));

    if ((objc_msgSend(v7, "isFinished") & 1) == 0)
      objc_msgSend(v7, "cancel");
    -[MFMessageDisplayURLRoute setMessageDisplayPromise:](self, "setMessageDisplayPromise:", 0);

  }
}

- (void)_determineMessageToDisplayForCollection:(id)a3 itemIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MFMessageDisplayURLRoute messageList](self, "messageList"));
  if (v7 == v11)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    if (v8)
    {
      objc_msgSend(v11, "stopObserving:", self);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageDisplayURLRoute messageDisplayPromise](self, "messageDisplayPromise"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "messageListItemForItemID:", v8));
      objc_msgSend(v9, "finishWithFuture:", v10);

    }
  }

}

- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a3;
  v8 = a5;
  v10 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  -[MFMessageDisplayURLRoute _determineMessageToDisplayForCollection:itemIDs:](self, "_determineMessageToDisplayForCollection:itemIDs:", v7, v9);

}

- (void)prewarmWebViewIfNeeded
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MFWKWebViewFactory sharedWebViewFactory](MFWKWebViewFactory, "sharedWebViewFactory"));
  objc_msgSend(v2, "preallocateWebViewIfNeeded");

}

- (id)createMessageListWithQuery:(id)a3 repository:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)EMMessageList), "initWithQuery:repository:", v5, v6);

  return v7;
}

- (NSString)ef_publicDescription
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(self), self);
}

- (int64_t)priority
{
  return self->_priority;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (DaemonInterfaceProviding)scene
{
  return (DaemonInterfaceProviding *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (MFMessageDisplayURLRouteActionHander)actionHandler
{
  return (MFMessageDisplayURLRouteActionHander *)objc_loadWeakRetained((id *)&self->_actionHandler);
}

- (void)setActionHandler:(id)a3
{
  objc_storeWeak((id *)&self->_actionHandler, a3);
}

- (EMMessageList)messageList
{
  return self->_messageList;
}

- (void)setMessageList:(id)a3
{
  objc_storeStrong((id *)&self->_messageList, a3);
}

- (EFPromise)messageDisplayPromise
{
  return self->_messageDisplayPromise;
}

- (void)setMessageDisplayPromise:(id)a3
{
  objc_storeStrong((id *)&self->_messageDisplayPromise, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDisplayPromise, 0);
  objc_storeStrong((id *)&self->_messageList, 0);
  objc_destroyWeak((id *)&self->_actionHandler);
  objc_destroyWeak((id *)&self->_scene);
}

@end
