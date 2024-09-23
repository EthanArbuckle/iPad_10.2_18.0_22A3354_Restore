@implementation HTUserNotificationHelper

+ (id)sharedHelperWithCategories:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  const char *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  const char *v15;

  v3 = a3;
  v4 = v3;
  v5 = (void *)qword_100060518;
  if (qword_100060518)
  {
    if (v3)
    {
      v6 = sub_100024FF4();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "+[HTUserNotificationHelper sharedHelperWithCategories:]";
        v8 = "%s Shared HTUserNotificationHelper was provided with notification categories, but singleton is already instantiated.";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  else
  {
    if (!v3)
    {
      v10 = sub_100024FF4();
      v7 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "+[HTUserNotificationHelper sharedHelperWithCategories:]";
        v8 = "%s Trying to create shared HTUserNotificationHelper but no notification categories provided";
        goto LABEL_12;
      }
LABEL_13:

      v9 = 0;
      goto LABEL_14;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100029248;
    block[3] = &unk_10004D278;
    v13 = v3;
    if (qword_100060520 != -1)
      dispatch_once(&qword_100060520, block);

    v5 = (void *)qword_100060518;
  }
  v9 = v5;
LABEL_14:

  return v9;
}

- (void)associatePrefix:(id)a3 withHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  if (a4)
  {
    v6 = a3;
    v8 = objc_retainBlock(a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HTUserNotificationHelper responseHandlers](self, "responseHandlers"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v6);

  }
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  (*((void (**)(id, uint64_t))a5 + 2))(a5, 24);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  HTUserNotificationHelper *v30;
  void (**v31)(_QWORD);
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];

  v7 = a4;
  v30 = self;
  v31 = (void (**)(_QWORD))a5;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HTUserNotificationHelper responseHandlers](self, "responseHandlers"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v33;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v11)
        objc_enumerationMutation(v8);
      v13 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "notification"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "request"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
      v17 = objc_msgSend(v16, "hasPrefix:", v13);

      if ((v17 & 1) != 0)
        break;
      if (v10 == (id)++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HTUserNotificationHelper responseHandlers](v30, "responseHandlers"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v13));

    if (!v19)
      goto LABEL_14;
    v20 = sub_100024FF4();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "notification"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "request"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionIdentifier"));
      *(_DWORD *)buf = 138412546;
      v37 = v24;
      v38 = 2112;
      v39 = v25;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "ResponseHandler invoked, request %@, action %@", buf, 0x16u);

    }
    (*(void (**)(uint64_t, id))(v19 + 16))(v19, v7);
  }
  else
  {
LABEL_9:

LABEL_14:
    v26 = sub_100024FF4();
    v19 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_INFO))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "notification"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "request"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "identifier"));
      *(_DWORD *)buf = 138412290;
      v37 = v29;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_INFO, "Request identifier %@ using default handler", buf, 0xCu);

    }
  }

  if (v31)
    v31[2](v31);

}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationQueue, a3);
}

- (NSMutableDictionary)responseHandlers
{
  return self->_responseHandlers;
}

- (void)setResponseHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_responseHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseHandlers, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end
