@implementation MessageListRestorationState

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001111FC;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9FA8 != -1)
    dispatch_once(&qword_1005A9FA8, block);
  return (OS_os_log *)(id)qword_1005A9FA0;
}

+ (id)loadFromDictionary:(id)a3 daemonInterface:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSSet *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  NSSet *v27;
  void *v28;
  id v29;
  NSObject *v30;
  MessageListRestorationState *v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  unsigned int v36;
  void *v37;
  unsigned int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint8_t buf[4];
  uint64_t v49;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MessageListStateVersion")));
  v9 = v8;
  if (v8)
  {
    v10 = (uint64_t)objc_msgSend(v8, "integerValue");
    if (v10 > 2)
    {
      v11 = objc_claimAutoreleasedReturnValue(+[MessageListRestorationState log](MessageListRestorationState, "log"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v49 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Decoding v%li state from dictionary...", buf, 0xCu);
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MessageListStateEncodedMailboxes")));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MessageListStateVisibleItems")));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MessageListStateLastSelectedItemID")));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MessageListStateScrolledToTop")));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MessageListStateIsThreaded")));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MessageListStateTrackOldest")));
      v42 = (void *)v13;
      v43 = v7;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MessageListStateUpdateDisplayDate")));
      v38 = objc_msgSend(v14, "BOOLValue");

      v15 = objc_opt_class(NSArray);
      v16 = objc_opt_class(EMThread);
      v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, v16, objc_opt_class(EMMessage), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v47 = 0;
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v18, v45, &v47));
      v19 = v47;
      v20 = v42;
      if (v19)
      {
        v21 = v19;
        v22 = objc_claimAutoreleasedReturnValue(+[MessageListRestorationState log](MessageListRestorationState, "log"));
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "ef_publicDescription"));
          sub_1003930EC();
        }

        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mf_invalidRestorationDataErrorWithUnderlyingError:](NSError, "mf_invalidRestorationDataErrorWithUnderlyingError:", v21));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithError:](EFFuture, "futureWithError:", v23));
        goto LABEL_27;
      }
      if (objc_msgSend(v44, "length"))
      {
        v26 = objc_opt_class(EMMessageCollectionItemID);
        v27 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v26, objc_opt_class(EMThreadCollectionItemID), 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        v46 = 0;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v28, v44, &v46));
        v29 = v46;
        if (v29)
        {
          v21 = v29;
          v37 = v28;
          v30 = objc_claimAutoreleasedReturnValue(+[MessageListRestorationState log](MessageListRestorationState, "log"));
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "ef_publicDescription"));
            sub_1003930B0();
          }

          v31 = (MessageListRestorationState *)objc_claimAutoreleasedReturnValue(+[NSError mf_invalidRestorationDataErrorWithUnderlyingError:](NSError, "mf_invalidRestorationDataErrorWithUnderlyingError:", v21));
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithError:](EFFuture, "futureWithError:", v31));
          v20 = v42;
          v7 = v43;
LABEL_26:

LABEL_27:
          goto LABEL_28;
        }

        v20 = v42;
        v7 = v43;
      }
      else
      {
        v23 = 0;
        v20 = v42;
      }
      if (v20)
        v32 = (uint64_t)objc_msgSend(v20, "BOOLValue");
      else
        v32 = 1;
      v36 = objc_msgSend(v40, "BOOLValue");
      v33 = objc_msgSend(v41, "BOOLValue");
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_loadMailboxesFromEncodedMailboxes:daemonInterface:", v12, v7));
      v34 = objc_claimAutoreleasedReturnValue(+[MessageListRestorationState log](MessageListRestorationState, "log"));
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Decoded dictionary representation. Beginning load....", buf, 2u);
      }

      v31 = objc_alloc_init(MessageListRestorationState);
      -[MessageListRestorationState setLastSelectedItemID:](v31, "setLastSelectedItemID:", v23);
      -[MessageListRestorationState setVisibleItems:](v31, "setVisibleItems:", v39);
      -[MessageListRestorationState setScrolledToTop:](v31, "setScrolledToTop:", v32);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListRestorationState _beginLoadingWithMailboxesFuture:threaded:trackOldest:updateDisplayDate:daemonInterface:](v31, "_beginLoadingWithMailboxesFuture:threaded:trackOldest:updateDisplayDate:daemonInterface:", v37, v36, v33, v38, v7));
      v21 = 0;
      goto LABEL_26;
    }
  }
  else
  {
    v10 = 1;
  }
  v25 = objc_claimAutoreleasedReturnValue(+[MessageListRestorationState log](MessageListRestorationState, "log"));
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    sub_10039302C(v10, v25);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mf_invalidRestorationDataErrorWithUnderlyingError:](NSError, "mf_invalidRestorationDataErrorWithUnderlyingError:", 0));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithError:](EFFuture, "futureWithError:", v12));
LABEL_28:

  return v24;
}

+ (id)_loadMailboxesFromObjectIDData:(id)a3 daemonInterface:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  NSSet *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  uint8_t buf[24];

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class(NSArray);
  v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(EMMailboxObjectID), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v20 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v9, v5, &v20));
  v11 = v20;

  if (v11)
  {
    v12 = objc_claimAutoreleasedReturnValue(+[MessageListRestorationState log](MessageListRestorationState, "log"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ef_publicDescription"));
      sub_100393128();
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mf_invalidRestorationDataErrorWithUnderlyingError:](NSError, "mf_invalidRestorationDataErrorWithUnderlyingError:", v11));
    v14 = objc_claimAutoreleasedReturnValue(+[EFFuture futureWithError:](EFFuture, "futureWithError:", v13));
  }
  else
  {
    v15 = objc_claimAutoreleasedReturnValue(+[MessageListRestorationState log](MessageListRestorationState, "log"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Requesting mailboxes by object ID (v1)...", buf, 2u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mailboxRepository"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mailboxesForObjectIDs:", v10));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture join:](EFFuture, "join:", v17));

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recover:", &stru_10051F210));
  }
  v18 = (void *)v14;

  return v18;
}

+ (id)_loadMailboxesFromEncodedMailboxes:(id)a3 daemonInterface:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(+[MessageListRestorationState log](MessageListRestorationState, "log"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Decoding mailboxes (v2)...", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MessageListRestorationState log](MessageListRestorationState, "log"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RestorationMailboxDecoder decoderWithDaemonInterface:log:](RestorationMailboxDecoder, "decoderWithDaemonInterface:log:", v6, v8));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100111EF4;
  v14[3] = &unk_10051F238;
  v10 = v9;
  v15 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ef_map:", v14));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture join:](EFFuture, "join:", v11));

  return v12;
}

- (MessageListRestorationState)initWithMessageList:(id)a3 mailboxes:(id)a4 visibleItems:(id)a5 scrolledToTop:(BOOL)a6 lastSelectedItemID:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  MessageListRestorationState *v17;
  MessageListRestorationState *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)MessageListRestorationState;
  v17 = -[MessageListRestorationState init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_messageList, a3);
    objc_storeStrong((id *)&v18->_mailboxes, a4);
    objc_storeStrong((id *)&v18->_visibleItems, a5);
    v18->_scrolledToTop = a6;
    objc_storeStrong((id *)&v18->_lastSelectedItemID, a7);
  }

  return v18;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListRestorationState messageList](self, "messageList"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "query"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListRestorationState mailboxes](self, "mailboxes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ef_map:", &stru_10051F258));

  if (v4)
  {
    if (objc_msgSend(v6, "count"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListRestorationState visibleItems](self, "visibleItems"));

      if (v7)
      {
        v28 = objc_alloc_init((Class)NSMutableDictionary);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[MessageListRestorationState log](MessageListRestorationState, "log"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[RestorationMailboxEncoder encoderWithLog:](RestorationMailboxEncoder, "encoderWithLog:", v8));

        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListRestorationState mailboxes](self, "mailboxes"));
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_100112608;
        v31[3] = &unk_10051F280;
        v11 = v9;
        v32 = v11;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ef_compactMap:", v31));

        if (!objc_msgSend(v12, "count"))
        {
          v14 = objc_claimAutoreleasedReturnValue(+[MessageListRestorationState log](MessageListRestorationState, "log"));
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            sub_1003931A0(v14);
          v17 = 0;
          v15 = 0;
          goto LABEL_21;
        }
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v12, CFSTR("MessageListStateEncodedMailboxes"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListRestorationState visibleItems](self, "visibleItems"));
        v30 = 0;
        v14 = objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, &v30));
        v15 = v30;

        if (v15)
        {
          v16 = objc_claimAutoreleasedReturnValue(+[MessageListRestorationState log](MessageListRestorationState, "log"));
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ef_publicDescription"));
            sub_10039321C();
          }
LABEL_17:
          v17 = 0;
LABEL_20:

LABEL_21:
          goto LABEL_22;
        }
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v14, CFSTR("MessageListStateVisibleItems"));
        v27 = objc_claimAutoreleasedReturnValue(-[MessageListRestorationState lastSelectedItemID](self, "lastSelectedItemID"));
        if (v27)
        {
          v29 = 0;
          v16 = v27;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v27, 1, &v29));
          v15 = v29;
          if (v15)
          {
            v19 = objc_claimAutoreleasedReturnValue(+[MessageListRestorationState log](MessageListRestorationState, "log"));
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ef_publicDescription"));
              sub_1003931E0();
            }

            goto LABEL_17;
          }
          objc_msgSend(v28, "setObject:forKeyedSubscript:", v18, CFSTR("MessageListStateLastSelectedItemID"));

        }
        v16 = v27;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MessageListRestorationState scrolledToTop](self, "scrolledToTop", v27)));
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v20, CFSTR("MessageListStateScrolledToTop"));

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListRestorationState messageList](self, "messageList"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v21, "isThreaded")));
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v22, CFSTR("MessageListStateIsThreaded"));

        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)objc_msgSend(v4, "queryOptions") & 1));
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v23, CFSTR("MessageListStateTrackOldest"));

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "targetClassOptions"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", EMMessageListItemQueryOptionUpdateDisplayDate));
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v25, CFSTR("MessageListStateUpdateDisplayDate"));

        objc_msgSend(v28, "setObject:forKeyedSubscript:", &off_100541818, CFSTR("MessageListStateVersion"));
        v17 = objc_msgSend(v28, "copy");
        v15 = 0;
        goto LABEL_20;
      }
    }
  }
  v17 = 0;
LABEL_22:

  return v17;
}

- (id)_beginLoadingWithMailboxesFuture:(id)a3 threaded:(BOOL)a4 trackOldest:(BOOL)a5 updateDisplayDate:(BOOL)a6 daemonInterface:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  char v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[5];
  _QWORD v29[5];
  id v30;
  BOOL v31;
  BOOL v32;
  char v33;
  BOOL v34;
  BOOL v35;

  v12 = a3;
  v13 = a7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
  -[MessageListRestorationState setFirstVisibleItemIDPromise:](self, "setFirstVisibleItemIDPromise:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListRestorationState visibleItems](self, "visibleItems"));
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListRestorationState visibleItems](self, "visibleItems"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ef_mapSelector:", "itemID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v18));
    -[MessageListRestorationState setPreviouslyVisibleItemIDs:](self, "setPreviouslyVisibleItemIDs:", v19);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  v21 = v16 != 0;
  v22 = objc_msgSend(v20, "BOOLForKey:", DisableThreadingKey) ^ 1;

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1001128A4;
  v29[3] = &unk_10051F2A8;
  v29[4] = self;
  v23 = v13;
  v30 = v23;
  v31 = a5;
  v32 = a4;
  v33 = v22;
  v34 = a6;
  v35 = v21;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "then:", v29));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "recover:", &stru_10051F2C8));

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100112D5C;
  v28[3] = &unk_10051F2F0;
  v28[4] = self;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "then:", v28));

  return v26;
}

- (void)_handleItemIDsAdded:(id)a3 messageList:(id)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListRestorationState _firstVisibleItemFromAddedItemIDs:](self, "_firstVisibleItemFromAddedItemIDs:", a3, a4));
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[MessageListRestorationState log](MessageListRestorationState, "log"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Message list has loaded the first visible item. Continuing...", v9, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListRestorationState firstVisibleItemIDPromise](self, "firstVisibleItemIDPromise"));
    objc_msgSend(v7, "finishWithResult:", v5);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListRestorationState messageList](self, "messageList"));
    objc_msgSend(v8, "stopObserving:", self);

  }
}

- (id)_firstVisibleItemFromAddedItemIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListRestorationState previouslyVisibleItemIDs](self, "previouslyVisibleItemIDs"));
  v6 = objc_msgSend(v5, "mutableCopy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v4));
  objc_msgSend(v6, "intersectOrderedSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  return v8;
}

- (void)collectionDidFinishInitialLoad:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[MessageListRestorationState log](MessageListRestorationState, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_publicDescription"));
    v10 = 138543362;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Finished initial load for: %{public}@", (uint8_t *)&v10, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListRestorationState firstVisibleItemIDPromise](self, "firstVisibleItemIDPromise"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError em_internalErrorWithReason:](NSError, "em_internalErrorWithReason:", CFSTR("no visible item IDs after initial load")));
  objc_msgSend(v7, "finishWithError:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListRestorationState messageList](self, "messageList"));
  objc_msgSend(v9, "stopObserving:", self);

}

- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5
{
  -[MessageListRestorationState _handleItemIDsAdded:messageList:](self, "_handleItemIDsAdded:messageList:", a4, a3, a5);
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5
{
  -[MessageListRestorationState _handleItemIDsAdded:messageList:](self, "_handleItemIDsAdded:messageList:", a4, a3, a5);
}

- (EMMessageList)messageList
{
  return self->_messageList;
}

- (void)setMessageList:(id)a3
{
  objc_storeStrong((id *)&self->_messageList, a3);
}

- (NSArray)mailboxes
{
  return self->_mailboxes;
}

- (void)setMailboxes:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxes, a3);
}

- (NSArray)visibleItems
{
  return self->_visibleItems;
}

- (void)setVisibleItems:(id)a3
{
  objc_storeStrong((id *)&self->_visibleItems, a3);
}

- (BOOL)scrolledToTop
{
  return self->_scrolledToTop;
}

- (void)setScrolledToTop:(BOOL)a3
{
  self->_scrolledToTop = a3;
}

- (EMCollectionItemID)lastSelectedItemID
{
  return self->_lastSelectedItemID;
}

- (void)setLastSelectedItemID:(id)a3
{
  objc_storeStrong((id *)&self->_lastSelectedItemID, a3);
}

- (EFPromise)firstVisibleItemIDPromise
{
  return (EFPromise *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFirstVisibleItemIDPromise:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSOrderedSet)previouslyVisibleItemIDs
{
  return self->_previouslyVisibleItemIDs;
}

- (void)setPreviouslyVisibleItemIDs:(id)a3
{
  objc_storeStrong((id *)&self->_previouslyVisibleItemIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previouslyVisibleItemIDs, 0);
  objc_storeStrong((id *)&self->_firstVisibleItemIDPromise, 0);
  objc_storeStrong((id *)&self->_lastSelectedItemID, 0);
  objc_storeStrong((id *)&self->_visibleItems, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_messageList, 0);
}

@end
