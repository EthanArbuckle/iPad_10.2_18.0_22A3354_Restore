@implementation APPCControllerReceiver

- (void)extendCollectionClassesForRemoteInterface:(id)a3
{
  id v3;
  uint64_t v4;
  NSSet *v5;
  id v6;

  v3 = a3;
  v4 = objc_opt_class(NSArray);
  v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, objc_opt_class(APContentData), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, "contentResponses:requester:", 0, 0);

}

- (void)extendCollectionClassesForExportedInterface:(id)a3
{
  id v3;
  uint64_t v4;
  NSSet *v5;
  id v6;

  v3 = a3;
  v4 = objc_opt_class(NSArray);
  v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, objc_opt_class(APContentData), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, "sendAndRankContent:forContext:placement:completionHandler:", 0, 0);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, "sendAndRankContent:forContext:placement:completionHandler:", 0, 1);

}

- (Protocol)exportedInterface
{
  return (Protocol *)&OBJC_PROTOCOL___APPCControllerDaemonInterface;
}

- (id)remoteObjectInterface
{
  return &OBJC_PROTOCOL___APPCControllerClientInterface;
}

- (void)preWarm:(id)a3
{
  +[APPromotedContentControllerDaemonModule didPrewarm:](APPromotedContentControllerDaemonModule, "didPrewarm:", a3);
}

- (void)_finishedWithRequestsForCoordinator:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerReceiver lock](self, "lock"));
  objc_msgSend(v5, "lock");

  v6 = APLogForCategory(34);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = (void *)objc_opt_class(self);
    v9 = v8;
    v10 = sub_1000303DC((uint64_t)v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v14 = 138478083;
    v15 = v8;
    v16 = 2114;
    v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{private}@] Finished with requests for coordinator %{public}@", (uint8_t *)&v14, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerReceiver coordinators](self, "coordinators"));
  objc_msgSend(v12, "removeObject:", v4);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerReceiver lock](self, "lock"));
  objc_msgSend(v13, "unlock");

}

- (void)finishedWithRequestsForRequester:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000027D4;
  v15[3] = &unk_100218860;
  v4 = a3;
  v16 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v15));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerReceiver lock](self, "lock"));
  objc_msgSend(v6, "lock");

  v7 = APLogForCategory(34);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_opt_class(self);
    *(_DWORD *)buf = 138478083;
    v18 = v9;
    v19 = 2114;
    v20 = v4;
    v10 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{private}@] Finished with requests for %{public}@", buf, 0x16u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerReceiver coordinators](self, "coordinators"));
  objc_msgSend(v11, "filterUsingPredicate:", v5);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerReceiver lock](self, "lock"));
  objc_msgSend(v12, "unlock");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerReceiver coordinators](self, "coordinators"));
  v14 = objc_msgSend(v13, "count");

  if (!v14)
    -[APPCControllerReceiver _finishedWithAllRequests](self, "_finishedWithAllRequests");

}

- (NSMutableSet)coordinators
{
  return self->_coordinators;
}

- (void)_finishedWithAllRequests
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;

  v3 = APLogForCategory(34);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v11 = 136642819;
    v12 = "-[APPCControllerReceiver _finishedWithAllRequests]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{sensitive}s: Removing all coordinators and setting APXPCConnection to nil", (uint8_t *)&v11, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerReceiver lock](self, "lock"));
  objc_msgSend(v5, "lock");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerReceiver coordinators](self, "coordinators"));
  objc_msgSend(v6, "removeAllObjects");

  v7 = APLogForCategory(34);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 136642819;
    v12 = "-[APPCControllerReceiver _finishedWithAllRequests]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{sensitive}s: Invalidating APXPCConnection", (uint8_t *)&v11, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerReceiver connection](self, "connection"));
  objc_msgSend(v9, "invalidate");

  -[APPCControllerReceiver setConnection:](self, "setConnection:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerReceiver lock](self, "lock"));
  objc_msgSend(v10, "unlock");

}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (void)setConnection:(id)a3
{
  id v5;
  APXPCConnection **p_connection;
  uint64_t v7;
  NSObject *v8;
  APXPCConnection *v9;
  int v10;
  const char *v11;
  __int16 v12;
  APXPCConnection *v13;

  v5 = a3;
  p_connection = &self->_connection;
  objc_storeStrong((id *)p_connection, a3);
  v7 = APLogForCategory(34);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = *p_connection;
    v10 = 136643075;
    v11 = "-[APPCControllerReceiver setConnection:]";
    v12 = 2114;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{sensitive}s: APXPCConnection set to %{public}@", (uint8_t *)&v10, 0x16u);
  }

}

- (void)connectionInvalidated
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;

  v3 = APLogForCategory(34);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 141558274;
    v7 = 1752392040;
    v8 = 2112;
    v9 = (id)objc_opt_class(self);
    v5 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{mask.hash}@] Connection from client has been invalidated.", (uint8_t *)&v6, 0x16u);

  }
  -[APPCControllerReceiver _finishedWithAllRequests](self, "_finishedWithAllRequests");
}

- (id)_coordinatorForRequester:(id)a3 clientInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  APPCControllerCoordinator *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id *v21;
  void *v22;
  void *v23;
  void *v24;
  void **v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  id v31;
  id v32;
  id location;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = APLogForCategory(34);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_loadWeakRetained(&location);
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "connection"));
    v13 = objc_loadWeakRetained(&location);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "connection"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleID"));
    *(_DWORD *)buf = 136643587;
    v35 = "-[APPCControllerReceiver _coordinatorForRequester:clientInfo:]";
    v36 = 2050;
    v37 = v10;
    v38 = 2050;
    v39 = v12;
    v40 = 2114;
    v41 = v15;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{sensitive}s: controller (weakSelf) %{public}p connection %{public}p bundleID is %{public}@.", buf, 0x2Au);

  }
  v16 = [APPCControllerCoordinator alloc];
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerReceiver connection](self, "connection"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundleID"));
  v26 = _NSConcreteStackBlock;
  v27 = 3221225472;
  v28 = sub_100017C14;
  v29 = &unk_100218888;
  v19 = v7;
  v30 = v19;
  objc_copyWeak(&v32, &location);
  v20 = v6;
  v31 = v20;
  v21 = sub_100020544((id *)&v16->super.isa, v18, v20, &v26);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerReceiver lock](self, "lock", v26, v27, v28, v29));
  objc_msgSend(v22, "lock");

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerReceiver coordinators](self, "coordinators"));
  objc_msgSend(v23, "addObject:", v21);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerReceiver lock](self, "lock"));
  objc_msgSend(v24, "unlock");

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  return v21;
}

- (void)requestPromotedContentOfTypes:(id)a3 forRequester:(id)a4 forContext:(id)a5 withClientInfo:(id)a6 deliverEntireBatch:(BOOL)a7 completionHandler:(id)a8
{
  id v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  char *v17;
  uint64_t v18;
  NSObject *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  unsigned int v37;
  void *v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id location;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;

  v37 = a7;
  v13 = a3;
  v39 = a4;
  v14 = a5;
  v40 = a6;
  v36 = a8;
  v15 = APLogForCategory(21);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
    *(_DWORD *)buf = 138543362;
    v47 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Received request to fetch ad for context %{public}@", buf, 0xCu);

  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
  v18 = APLogForCategory(34);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = (char *)objc_opt_class(self);
    *(_DWORD *)buf = 138478595;
    v47 = v20;
    v48 = 2114;
    v49 = v38;
    v50 = 2114;
    v51 = v38;
    v52 = 2114;
    v53 = v13;
    v21 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{private}@ %{public}@] Prefetching promoted content for context %{public}@ with requested Ad types %{public}@", buf, 0x2Au);

  }
  objc_initWeak(&location, self);
  v22 = APLogForCategory(34);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = objc_loadWeakRetained(&location);
    v25 = v13;
    v26 = v24;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "connection"));
    v28 = objc_loadWeakRetained(&location);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "connection"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bundleID"));
    *(_DWORD *)buf = 136643587;
    v47 = "-[APPCControllerReceiver requestPromotedContentOfTypes:forRequester:forContext:withClientInfo:deliverEntireBat"
          "ch:completionHandler:]";
    v48 = 2050;
    v49 = v24;
    v50 = 2050;
    v51 = v27;
    v52 = 2114;
    v53 = v30;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%{sensitive}s: controller (weakSelf) %{public}p connection %{public}p bundleID is %{public}@.", buf, 0x2Au);

    v13 = v25;
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerReceiver _coordinatorForRequester:clientInfo:](self, "_coordinatorForRequester:clientInfo:", v39, v40));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerReceiver connection](self, "connection"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bundleID"));
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100017D80;
  v41[3] = &unk_100218838;
  objc_copyWeak(&v44, &location);
  v34 = v31;
  v42 = v34;
  v35 = v36;
  v43 = v35;
  sub_10001E220(v34, v13, v14, v33, v40, v37, v41);

  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);

}

- (APXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinators, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)proxyURLWithCompletionHandler:(id)a3
{
  void (**v4)(id, id);
  NSObject *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;

  v4 = (void (**)(id, id))a3;
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[APProxySettings settings](APProxySettings, "settings"));
    v6 = v5;
    if (v5)
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(-[NSObject resourceConnectProxyURL](v5, "resourceConnectProxyURL"));
      v8 = APLogForCategory(38);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      v10 = v9;
      if (v7)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v17 = 138478083;
          v18 = (id)objc_opt_class(self);
          v19 = 2114;
          v20 = v7;
          v11 = v18;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{private}@] Retrieved APProxySettings, resourceConnectProxyURL is %{public}@", (uint8_t *)&v17, 0x16u);

        }
        v4[2](v4, v7);
      }
      else
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v17 = 138477827;
          v18 = (id)objc_opt_class(self);
          v16 = v18;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{private}@] resourceConnectProxyURL not found in proxySettings.", (uint8_t *)&v17, 0xCu);

        }
        v4[2](v4, 0);
      }
      goto LABEL_15;
    }
    v13 = APLogForCategory(38);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17 = 138477827;
      v18 = (id)objc_opt_class(self);
      v15 = v18;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[%{private}@] Error reading proxySettings.", (uint8_t *)&v17, 0xCu);

    }
    v4[2](v4, 0);
  }
  else
  {
    v12 = APLogForCategory(38);
    v6 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v17 = 138477827;
      v18 = (id)objc_opt_class(self);
      v7 = v18;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[%{private}@] completionHandler not present", (uint8_t *)&v17, 0xCu);
LABEL_15:

    }
  }

}

- (void)sendAndRankContent:(id)a3 forContext:(id)a4 placement:(unint64_t)a5 completionHandler:(id)a6
{
  (*((void (**)(id, _QWORD, _QWORD))a6 + 2))(a6, 0, 0);
}

- (void)connectionInterrupted
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;

  v3 = APLogForCategory(34);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 141558274;
    v7 = 1752392040;
    v8 = 2112;
    v9 = (id)objc_opt_class(self);
    v5 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{mask.hash}@] Connection from client has been interrupted.", (uint8_t *)&v6, 0x16u);

  }
  -[APPCControllerReceiver _finishedWithAllRequests](self, "_finishedWithAllRequests");
}

- (void)setCoordinators:(id)a3
{
  objc_storeStrong((id *)&self->_coordinators, a3);
}

@end
