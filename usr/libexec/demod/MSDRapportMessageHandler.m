@implementation MSDRapportMessageHandler

- (MSDRapportMessageHandler)initWithObserver:(id)a3
{
  id v4;
  MSDRapportMessageHandler *v5;
  dispatch_queue_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSDRapportMessageHandler;
  v5 = -[MSDRapportMessageHandler init](&v9, "init");
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.MobileStoreDemo.RapportMessageHandler", 0);
    -[MSDRapportMessageHandler setQueue:](v5, "setQueue:", v6);

    -[MSDRapportMessageHandler setObserver:](v5, "setObserver:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 4));
    -[MSDRapportMessageHandler setSenderRPClients:](v5, "setSenderRPClients:", v7);

  }
  return v5;
}

- (void)listenForIncomingRequestMessageOfID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000909D8;
  block[3] = &unk_10013DDB8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)listenForIncomingEventMessageOfID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100090AF0;
  block[3] = &unk_10013DDB8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)sendOutgoingRequestMessage:(id)a3 toDevice:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  if (v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100090C50;
    block[3] = &unk_10013F628;
    objc_copyWeak(&v16, &location);
    v13 = v8;
    v14 = v9;
    v15 = v10;
    dispatch_async(v11, block);

    objc_destroyWeak(&v16);
  }
  objc_destroyWeak(&location);

}

- (void)sendOutgoingEventMessage:(id)a3 toDevice:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  if (v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100090DB4;
    block[3] = &unk_10013F628;
    objc_copyWeak(&v16, &location);
    v13 = v8;
    v14 = v9;
    v15 = v10;
    dispatch_async(v11, block);

    objc_destroyWeak(&v16);
  }
  objc_destroyWeak(&location);

}

- (void)invalidateOutgoingConnectionForDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100090ED0;
  block[3] = &unk_10013DDB8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_ensureListenerRPClientStartedWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  void (**v17)(id, void *, _QWORD);
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id buf[2];

  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler listenerRPClient](self, "listenerRPClient"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler listenerRPClient](self, "listenerRPClient"));
      v4[2](v4, v7, 0);

    }
    else
    {
      v8 = sub_1000604F0();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MSDRapportMessageHandler: Creating RPCompanionLinkClient for listener!", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, self);
      v10 = objc_alloc_init((Class)RPCompanionLinkClient);
      -[MSDRapportMessageHandler setListenerRPClient:](self, "setListenerRPClient:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler queue](self, "queue"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler listenerRPClient](self, "listenerRPClient"));
      objc_msgSend(v12, "setDispatchQueue:", v11);

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100091190;
      v20[3] = &unk_10013D840;
      objc_copyWeak(&v21, buf);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler listenerRPClient](self, "listenerRPClient"));
      objc_msgSend(v13, "setInterruptionHandler:", v20);

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10009120C;
      v18[3] = &unk_10013D840;
      objc_copyWeak(&v19, buf);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler listenerRPClient](self, "listenerRPClient"));
      objc_msgSend(v14, "setInvalidationHandler:", v18);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler listenerRPClient](self, "listenerRPClient"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100091288;
      v16[3] = &unk_10013F650;
      v16[4] = self;
      v17 = v4;
      objc_msgSend(v15, "activateWithCompletion:", v16);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&v21);
      objc_destroyWeak(buf);
    }
  }

}

- (void)_invalidateListenerRPClient
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler listenerRPClient](self, "listenerRPClient"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler listenerRPClient](self, "listenerRPClient"));
    objc_msgSend(v5, "setInvalidationHandler:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler listenerRPClient](self, "listenerRPClient"));
    objc_msgSend(v6, "invalidate");

    -[MSDRapportMessageHandler setListenerRPClient:](self, "setListenerRPClient:", 0);
  }
}

- (void)_listenForIncomingRequestMessageOfID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  MSDRapportMessageHandler *v11;
  id v12;
  uint8_t buf[4];
  id v14;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MSDRapportMessageHandler: Registering request of ID: %{public}@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100091528;
  v9[3] = &unk_10013F6C8;
  v8 = v4;
  v10 = v8;
  objc_copyWeak(&v12, (id *)buf);
  v11 = self;
  -[MSDRapportMessageHandler _ensureListenerRPClientStartedWithCompletion:](self, "_ensureListenerRPClientStartedWithCompletion:", v9);
  objc_destroyWeak(&v12);

  objc_destroyWeak((id *)buf);
}

- (void)_listenForIncomingEventMessageOfID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MSDRapportMessageHandler: Registering event of ID: %{public}@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100091AE4;
  v9[3] = &unk_10013F718;
  v8 = v4;
  v10 = v8;
  objc_copyWeak(&v11, (id *)buf);
  -[MSDRapportMessageHandler _ensureListenerRPClientStartedWithCompletion:](self, "_ensureListenerRPClientStartedWithCompletion:", v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak((id *)buf);
}

- (id)_findSenderRPClientForDevice:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler senderRPClients](self, "senderRPClients"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "destinationDevice"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rpDevice"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
        v13 = objc_msgSend(v10, "isEqualToString:", v12);

        if ((v13 & 1) != 0)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)_ensureSenderRPClientStartedForDevice:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  MSDRapportMessageHandler *v32;
  id v33;
  void (**v34)(id, void *, _QWORD);
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint8_t buf[4];
  id v45;

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v8 = objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler _findSenderRPClientForDevice:](self, "_findSenderRPClientForDevice:", v6));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler senderRPClients](self, "senderRPClients"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));

      if (v11 != v9)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler senderRPClients](self, "senderRPClients"));
        objc_msgSend(v12, "removeObject:", v9);

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler senderRPClients](self, "senderRPClients"));
        objc_msgSend(v13, "addObject:", v9);

      }
      v7[2](v7, v9, 0);
    }
    else
    {
      v14 = sub_1000604F0();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v45 = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "MSDRapportMessageHandler: Creating RPCompanionLinkClient for device: %{public}@", buf, 0xCu);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler senderRPClients](self, "senderRPClients"));
      v17 = (unint64_t)objc_msgSend(v16, "count") > 3;

      if (v17)
      {
        v18 = sub_1000604F0();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "MSDRapportMessageHandler: Removing", buf, 2u);
        }

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler senderRPClients](self, "senderRPClients"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler senderRPClients](self, "senderRPClients"));
        objc_msgSend(v22, "removeObjectAtIndex:", 0);

        objc_msgSend(v21, "setInvalidationHandler:", 0);
        objc_msgSend(v21, "invalidate");

      }
      objc_initWeak((id *)buf, self);
      v23 = objc_alloc_init((Class)RPCompanionLinkClient);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler queue](self, "queue"));
      objc_msgSend(v23, "setDispatchQueue:", v24);

      objc_msgSend(v23, "setControlFlags:", 8454);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rpDevice"));
      objc_msgSend(v23, "setDestinationDevice:", v25);

      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100092380;
      v41[3] = &unk_10013F740;
      v26 = v6;
      v42 = v26;
      objc_copyWeak(&v43, (id *)buf);
      objc_msgSend(v23, "setInterruptionHandler:", v41);
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_1000923E0;
      v38[3] = &unk_10013F740;
      v27 = v26;
      v39 = v27;
      objc_copyWeak(&v40, (id *)buf);
      objc_msgSend(v23, "setInvalidationHandler:", v38);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100092440;
      v35[3] = &unk_10013F740;
      v28 = v27;
      v36 = v28;
      objc_copyWeak(&v37, (id *)buf);
      objc_msgSend(v23, "setDisconnectHandler:", v35);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1000924A0;
      v30[3] = &unk_10013E190;
      v31 = v28;
      v34 = v7;
      v32 = self;
      v29 = v23;
      v33 = v29;
      objc_msgSend(v29, "activateWithCompletion:", v30);

      objc_destroyWeak(&v37);
      objc_destroyWeak(&v40);

      objc_destroyWeak(&v43);
      objc_destroyWeak((id *)buf);
    }

  }
}

- (void)_invalidateSenderRPClientForDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler _findSenderRPClientForDevice:](self, "_findSenderRPClientForDevice:", v4));
  if (v6)
  {
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "MSDRapportMessageHandler: Invalidating sender RPCompanionLinkClient for device: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(v6, "setInvalidationHandler:", 0);
    objc_msgSend(v6, "invalidate");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler senderRPClients](self, "senderRPClients"));
    objc_msgSend(v9, "removeObject:", v6);

  }
}

- (void)_sendOutgoingRequestMessage:(id)a3 toDevice:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  MSDRapportMessageHandler *v20;
  id v21;
  id v22;
  void (**v23)(id, _QWORD, void *);
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v11 = objc_claimAutoreleasedReturnValue(-[MSDRapportMessageHandler queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v13 = sub_1000604F0();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = v12;
    v26 = 2114;
    v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "MSDRapportMessageHandler: Sending request of ID: %{public}@ to device: %{public}@", buf, 0x16u);
  }

  if (!v9)
  {
    v16 = CFSTR("Cannot find specified demo peer.");
    v17 = 3727741104;
LABEL_8:
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", v17, v16));
    v10[2](v10, 0, v15);
    goto LABEL_9;
  }
  if ((objc_msgSend(v9, "authenticated") & 1) == 0)
  {
    v17 = 3727741106;
    v16 = CFSTR("Cannot operate on demo peer not already authenticated.");
    goto LABEL_8;
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100092860;
  v18[3] = &unk_10013F790;
  v19 = v9;
  v23 = v10;
  v20 = self;
  v21 = v8;
  v22 = v12;
  -[MSDRapportMessageHandler _ensureSenderRPClientStartedForDevice:withCompletion:](self, "_ensureSenderRPClientStartedForDevice:withCompletion:", v19, v18);

  v15 = v19;
LABEL_9:

}

- (void)_sendOutgoingEventMessage:(id)a3 toDevice:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  MSDRapportMessageHandler *v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v12 = sub_1000604F0();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = v11;
    v26 = 2114;
    v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "MSDRapportMessageHandler: Sending event of ID: %{public}@ to device: %{public}@", buf, 0x16u);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100092D1C;
  v18[3] = &unk_10013F790;
  v22 = v11;
  v23 = v10;
  v19 = v9;
  v20 = self;
  v21 = v8;
  v14 = v11;
  v15 = v8;
  v16 = v10;
  v17 = v9;
  -[MSDRapportMessageHandler _ensureSenderRPClientStartedForDevice:withCompletion:](self, "_ensureSenderRPClientStartedForDevice:withCompletion:", v17, v18);

}

- (unint64_t)_getCurrentProtocolVersion
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  unint64_t v6;
  int v8;
  void *v9;

  if (!os_variant_has_internal_content("com.apple.mobilestoredemod"))
    return 2;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mockPeerProtocolVersion"));

  if (v3)
  {
    v4 = sub_1000604F0();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerCommander: Use mock protocol version: %@", (uint8_t *)&v8, 0xCu);
    }

    v6 = (unint64_t)objc_msgSend(v3, "unsignedIntegerValue");
  }
  else
  {
    v6 = 2;
  }

  return v6;
}

- (id)_extractRapportPayloadFromMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
    objc_msgSend(v5, "addEntriesFromDictionary:", v7);

  }
  if (-[MSDRapportMessageHandler _getCurrentProtocolVersion](self, "_getCurrentProtocolVersion"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MSDRapportMessageHandler _getCurrentProtocolVersion](self, "_getCurrentProtocolVersion")));
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("ProtocolVersion"));

  }
  v9 = objc_msgSend(v5, "copy");

  return v9;
}

- (id)_extractRapportOptionsFromMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_1000932A8;
  v13 = sub_1000932B8;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "options"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "options"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000932C0;
    v8[3] = &unk_10013F7E0;
    v8[4] = &v9;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
  v6 = objc_msgSend((id)v10[5], "copy");
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (RPCompanionLinkClient)listenerRPClient
{
  return self->_listenerRPClient;
}

- (void)setListenerRPClient:(id)a3
{
  objc_storeStrong((id *)&self->_listenerRPClient, a3);
}

- (NSMutableArray)senderRPClients
{
  return self->_senderRPClients;
}

- (void)setSenderRPClients:(id)a3
{
  objc_storeStrong((id *)&self->_senderRPClients, a3);
}

- (MSDRapportMessageHandlerProtocol)observer
{
  return (MSDRapportMessageHandlerProtocol *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_senderRPClients, 0);
  objc_storeStrong((id *)&self->_listenerRPClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
