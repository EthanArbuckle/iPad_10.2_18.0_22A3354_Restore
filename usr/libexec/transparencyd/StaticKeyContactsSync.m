@implementation StaticKeyContactsSync

- (StaticKeyContactsSync)initWithStorage:(id)a3
{
  id v4;
  StaticKeyContactsSync *v5;
  StaticKeyContactsSync *v6;
  dispatch_queue_t v7;
  KTSignalTermHandler *v8;
  KTSignalTermHandler *v9;
  StaticKeyContactsSync *v10;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)StaticKeyContactsSync;
  v5 = -[StaticKeyContactsSync init](&v18, "init");
  v6 = v5;
  if (v5)
  {
    -[StaticKeyContactsSync setStorage:](v5, "setStorage:", v4);
    -[StaticKeyContactsSync setStarted:](v6, "setStarted:", 0);
    -[StaticKeyContactsSync setTransaction:](v6, "setTransaction:", 0);
    v7 = dispatch_queue_create("StaticKeyContactsSync", 0);
    -[StaticKeyContactsSync setQueue:](v6, "setQueue:", v7);

    location = 0;
    objc_initWeak(&location, v6);
    v8 = [KTSignalTermHandler alloc];
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_10016D948;
    v15 = &unk_10023A970;
    objc_copyWeak(&v16, &location);
    v9 = -[KTSignalTermHandler initWithSIGTERMNotification:](v8, "initWithSIGTERMNotification:", &v12);
    -[StaticKeyContactsSync setSigTerm:](v6, "setSigTerm:", v9, v12, v13, v14, v15);

    v10 = v6;
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyContactsSync sigTerm](self, "sigTerm"));
  objc_msgSend(v3, "unregister");

  v4.receiver = self;
  v4.super_class = (Class)StaticKeyContactsSync;
  -[StaticKeyContactsSync dealloc](&v4, "dealloc");
}

- (void)startContactsSyncing
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[8];
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[StaticKeyContactsSync queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016DB60;
  block[3] = &unk_10023A390;
  block[4] = self;
  dispatch_sync(v3, block);

  if (qword_1002A7978 != -1)
    dispatch_once(&qword_1002A7978, &stru_100249EB0);
  v4 = qword_1002A7980;
  if (os_log_type_enabled((os_log_t)qword_1002A7980, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "StaticKeyContactsSync started", v5, 2u);
  }
  -[StaticKeyContactsSync consumeContactsChangeHistory](self, "consumeContactsChangeHistory");
}

- (void)contactStoreDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v4 = a3;
  if (qword_1002A7978 != -1)
    dispatch_once(&qword_1002A7978, &stru_100249ED0);
  v5 = qword_1002A7980;
  if (os_log_type_enabled((os_log_t)qword_1002A7980, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "contactStoreDidChange: %@", (uint8_t *)&v6, 0xCu);
  }
  -[StaticKeyContactsSync consumeContactsChangeHistory](self, "consumeContactsChangeHistory");

}

- (void)consumeContactsChangeHistory
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyContactsSync delegate](self, "delegate"));
  v10 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "listStaticKey:", &v10));
  v5 = v10;

  if (v5)
  {
    if (qword_1002A7978 != -1)
      dispatch_once(&qword_1002A7978, &stru_100249EF0);
    v6 = qword_1002A7980;
    if (os_log_type_enabled((os_log_t)qword_1002A7980, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error fetching static key results %@", buf, 0xCu);
    }
  }
  if (objc_msgSend(v4, "count"))
  {
    if (!+[KTSignalTermHandler terminated](KTSignalTermHandler, "terminated"))
    {
      v7 = objc_claimAutoreleasedReturnValue(-[StaticKeyContactsSync queue](self, "queue"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10016DFF8;
      v9[3] = &unk_10023A390;
      v9[4] = self;
      dispatch_async(v7, v9);

    }
  }
  else
  {
    if (qword_1002A7978 != -1)
      dispatch_once(&qword_1002A7978, &stru_100249F10);
    v8 = qword_1002A7980;
    if (os_log_type_enabled((os_log_t)qword_1002A7980, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "consumeContactsChangeHistory ignoring contacts change because we have no KT entries", buf, 2u);
    }
  }

}

- (void)invalidateContactsSyncing
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (qword_1002A7978 != -1)
    dispatch_once(&qword_1002A7978, &stru_100249F30);
  v3 = qword_1002A7980;
  if (os_log_type_enabled((os_log_t)qword_1002A7980, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "StaticKeyContactsSync invalidate", v5, 2u);
  }
  -[StaticKeyContactsSync setStorage:](self, "setStorage:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, CNContactStoreDidChangeNotification, 0);

}

- (void)drainContactsSyncing
{
  NSObject *v2;

  v2 = objc_claimAutoreleasedReturnValue(-[StaticKeyContactsSync queue](self, "queue"));
  dispatch_sync(v2, &stru_100249F50);

}

- (void)onQueueMergeChangesFromContacts
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  const char *v53;
  NSObject *v54;
  os_log_type_t v55;
  uint64_t v56;
  __int128 v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  _QWORD v66[3];

  if (qword_1002A7978 != -1)
    dispatch_once(&qword_1002A7978, &stru_100249F70);
  v3 = qword_1002A7980;
  if (os_log_type_enabled((os_log_t)qword_1002A7980, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "mergeChangesFromContacts started", buf, 2u);
  }
  v4 = objc_claimAutoreleasedReturnValue(-[StaticKeyContactsSync queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  v5 = objc_alloc_init((Class)CNChangeHistoryFetchRequest);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyContactsSync storage](self, "storage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fetchContactsSyncToken"));
  objc_msgSend(v5, "setStartingToken:", v7);

  objc_msgSend(v5, "setExcludedTransactionAuthors:", &off_10025C778);
  v66[0] = CNContactEmailAddressesKey;
  v66[1] = CNContactPhoneNumbersKey;
  v66[2] = CNContactExternalIdentifierKey;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v66, 3));
  objc_msgSend(v5, "setAdditionalContactKeyDescriptors:", v8);

  v9 = objc_alloc_init((Class)CNContactStore);
  v61 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "enumeratorForChangeHistoryFetchRequest:error:", v5, &v61));
  v11 = v61;
  v12 = v11;
  if (!v10)
  {
    if (qword_1002A7978 != -1)
      dispatch_once(&qword_1002A7978, &stru_100249F90);
    v47 = qword_1002A7980;
    if (os_log_type_enabled((os_log_t)qword_1002A7980, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v12;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "CNFetchResult failed: %@", buf, 0xCu);
    }
    goto LABEL_57;
  }
  v59 = v11;
  v60 = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "value"));
  v14 = 0;
  *(_QWORD *)&v15 = 138412546;
  v57 = v15;
  while (1)
  {
    v16 = v14;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nextObject", v57));

    if (!v14)
      break;
    if (qword_1002A7978 != -1)
      dispatch_once(&qword_1002A7978, &stru_100249FB0);
    v17 = qword_1002A7980;
    if (os_log_type_enabled((os_log_t)qword_1002A7980, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "mergeChangesFromContacts: change history enumerator object = %@", buf, 0xCu);
    }
    v19 = objc_opt_class(CNChangeHistoryDropEverythingEvent, v18);
    if ((objc_opt_isKindOfClass(v14, v19) & 1) != 0)
    {
      if (qword_1002A7978 != -1)
        dispatch_once(&qword_1002A7978, &stru_100249FD0);
      v21 = qword_1002A7980;
      if (os_log_type_enabled((os_log_t)qword_1002A7980, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "mergeChangesFromContacts: change history - drop everything", buf, 2u);
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyContactsSync delegate](self, "delegate"));
      objc_msgSend(v22, "resetContactsStorage");

    }
    else
    {
      v23 = objc_opt_class(CNChangeHistoryAddContactEvent, v20);
      if ((objc_opt_isKindOfClass(v14, v23) & 1) != 0)
      {
        v25 = v14;
        if (qword_1002A7978 != -1)
          dispatch_once(&qword_1002A7978, &stru_100249FF0);
        v26 = (void *)qword_1002A7980;
        if (os_log_type_enabled((os_log_t)qword_1002A7980, OS_LOG_TYPE_DEFAULT))
        {
          v27 = v26;
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "contact"));
          *(_DWORD *)buf = 138412290;
          v63 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "mergeChangesFromContacts: change history - AddContact event - %@", buf, 0xCu);

        }
      }
      else
      {
        v29 = objc_opt_class(CNChangeHistoryUpdateContactEvent, v24);
        if ((objc_opt_isKindOfClass(v14, v29) & 1) == 0)
        {
          v36 = objc_opt_class(CNChangeHistoryDeleteContactEvent, v30);
          if ((objc_opt_isKindOfClass(v14, v36) & 1) != 0)
          {
            v37 = v14;
            v58 = v9;
            if (qword_1002A7978 != -1)
              dispatch_once(&qword_1002A7978, &stru_10024A030);
            v38 = v5;
            v39 = (void *)qword_1002A7980;
            if (os_log_type_enabled((os_log_t)qword_1002A7980, OS_LOG_TYPE_DEFAULT))
            {
              v40 = v39;
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "contactIdentifier"));
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "externalURI"));
              *(_DWORD *)buf = v57;
              v63 = v41;
              v64 = 2112;
              v65 = v42;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "mergeChangesFromContacts: change history - DeleteContact event - %@[%@]", buf, 0x16u);

            }
            v43 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyContactsSync delegate](self, "delegate"));
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "contactIdentifier"));
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "externalURI"));
            objc_msgSend(v43, "deleteContact:contactExternalURI:", v44, v45);

            v5 = v38;
            v9 = v58;
          }
          else
          {
            if (qword_1002A7978 != -1)
              dispatch_once(&qword_1002A7978, &stru_10024A050);
            v46 = qword_1002A7980;
            if (os_log_type_enabled((os_log_t)qword_1002A7980, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v63 = v14;
              _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "mergeChangesFromContacts: change history - ignoring event - %@", buf, 0xCu);
            }
          }
          goto LABEL_29;
        }
        v25 = v14;
        if (qword_1002A7978 != -1)
          dispatch_once(&qword_1002A7978, &stru_10024A010);
        v31 = (void *)qword_1002A7980;
        if (os_log_type_enabled((os_log_t)qword_1002A7980, OS_LOG_TYPE_DEFAULT))
        {
          v32 = v31;
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "contact"));
          *(_DWORD *)buf = 138412290;
          v63 = v33;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "mergeChangesFromContacts: change history - UpdateContact event - %@", buf, 0xCu);

        }
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyContactsSync delegate](self, "delegate"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "contact"));
      objc_msgSend(v34, "updateContact:", v35);

    }
LABEL_29:
    if (+[KTSignalTermHandler terminated](KTSignalTermHandler, "terminated"))
    {
      if (qword_1002A7978 != -1)
        dispatch_once(&qword_1002A7978, &stru_10024A070);
      v56 = qword_1002A7980;
      v12 = v59;
      if (os_log_type_enabled((os_log_t)qword_1002A7980, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v53 = "terminated while syncing, abandon sync";
        v54 = v56;
        v55 = OS_LOG_TYPE_ERROR;
        goto LABEL_55;
      }
      goto LABEL_56;
    }
  }
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "currentHistoryToken"));

  if (v48)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyContactsSync storage](self, "storage"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "currentHistoryToken"));
    objc_msgSend(v49, "storeContactsSyncToken:", v50);

  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyContactsSync storage](self, "storage"));
  objc_msgSend(v51, "updateLastContactSyncDate");

  if (qword_1002A7978 != -1)
    dispatch_once(&qword_1002A7978, &stru_10024A090);
  v12 = v59;
  v52 = qword_1002A7980;
  if (os_log_type_enabled((os_log_t)qword_1002A7980, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v53 = "mergeChangesFromContacts: mergeChangesFromContacts done";
    v54 = v52;
    v55 = OS_LOG_TYPE_DEFAULT;
LABEL_55:
    _os_log_impl((void *)&_mh_execute_header, v54, v55, v53, buf, 2u);
  }
LABEL_56:

  v10 = v60;
LABEL_57:

}

- (StaticKeyContactsSyncDelegate)delegate
{
  return (StaticKeyContactsSyncDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (StaticKeyContactsStorage)storage
{
  return (StaticKeyContactsStorage *)objc_loadWeakRetained((id *)&self->_storage);
}

- (void)setStorage:(id)a3
{
  objc_storeWeak((id *)&self->_storage, a3);
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (KTSignalTermHandler)sigTerm
{
  return (KTSignalTermHandler *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSigTerm:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sigTerm, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_destroyWeak((id *)&self->_storage);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
