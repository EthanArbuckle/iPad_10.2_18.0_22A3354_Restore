@implementation MFAccountsController

- (void)_gatherStatisticsWithAccounts:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler globalAsyncScheduler](EFScheduler, "globalAsyncScheduler"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100016828;
  v6[3] = &unk_10051AA98;
  v5 = v3;
  v7 = v5;
  objc_msgSend(v4, "performBlock:", v6);

}

- (MFAccountsController)initWithFocusController:(id)a3
{
  id v4;
  MFAccountsController *v5;
  MFMailAccountsProvider *v6;
  MFMailAccountsProvider *accountsProvider;
  MFMailboxProvider *v8;
  MFMailboxProvider *mailboxProvider;
  objc_class *v10;
  NSString *v11;
  void *v12;
  uint64_t v13;
  EFScheduler *scheduler;
  uint64_t v15;
  EFCancelable *focusObservationToken;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MFAccountsController;
  v5 = -[MFAccountsController init](&v18, "init");
  if (v5)
  {
    v6 = objc_alloc_init(MFMailAccountsProvider);
    accountsProvider = v5->_accountsProvider;
    v5->_accountsProvider = v6;

    v8 = (MFMailboxProvider *)objc_msgSend(objc_alloc((Class)MFMailboxProvider), "initWithAccountsProvider:", v5->_accountsProvider);
    mailboxProvider = v5->_mailboxProvider;
    v5->_mailboxProvider = v8;

    v5->_currentFocusLock._os_unfair_lock_opaque = 0;
    v10 = (objc_class *)objc_opt_class(v5);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_claimAutoreleasedReturnValue(+[EFScheduler serialDispatchQueueSchedulerWithName:qualityOfService:](EFScheduler, "serialDispatchQueueSchedulerWithName:qualityOfService:", v12, 25));
    scheduler = v5->_scheduler;
    v5->_scheduler = (EFScheduler *)v13;

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addObserver:currentFocus:", v5, &v5->_currentFocus));
    focusObservationToken = v5->_focusObservationToken;
    v5->_focusObservationToken = (EFCancelable *)v15;

  }
  return v5;
}

- (void)_resetAccounts
{
  MFAccountsController *v3;
  void *v4;
  NSObject *v5;
  EMFocus *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *k;
  void *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  EMFocus *v44;
  void *v45;
  void *v46;
  void *v47;
  id v49;
  id obj;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[2];
  _QWORD v65[2];
  _BYTE v66[128];
  uint8_t v67[128];
  uint8_t buf[128];

  v3 = self;
  if (pthread_main_np() != 1)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFAccountsController.m"), 91, CFSTR("Current thread must be main"));

    v3 = self;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFAccountsController mailboxProvider](v3, "mailboxProvider"));
  objc_msgSend(v4, "invalidateMailboxes");

  v5 = objc_claimAutoreleasedReturnValue(+[MFAccountsController log](MFAccountsController, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reloading accounts", buf, 2u);
  }

  +[MailAccount reloadAccounts](MailAccount, "reloadAccounts");
  +[DeliveryAccount reloadDeliveryAccounts](DeliveryAccount, "reloadDeliveryAccounts");
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MFAccountsController accountsProvider](self, "accountsProvider"));
  os_unfair_lock_lock(&self->_currentFocusLock);
  v6 = self->_currentFocus;
  os_unfair_lock_unlock(&self->_currentFocusLock);
  v44 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount mailAccounts](MailAccount, "mailAccounts"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "reloadWithMailAccounts:currentFocus:", v7, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "first"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mailAccounts"));

  if (v45)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "mailAccounts"));
    v42 = v45;
    v43 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "ef_mapSelector:", "uniqueID"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v10));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v43, "count")));
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    obj = v43;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, buf, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v61 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uniqueID"));
          objc_msgSend(v11, "setObject:forKey:", v15, v16);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, buf, 16);
      }
      while (v12);
    }

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v49 = v42;
    v17 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(_QWORD *)v57 != v18)
            objc_enumerationMutation(v49);
          v20 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)j);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "uniqueID"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v21));

          v23 = (void *)objc_claimAutoreleasedReturnValue(+[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue"));
          if (v22)
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[MFMonitoredInvocation mf_invocationWithSelector:target:object:](MFMonitoredInvocation, "mf_invocationWithSelector:target:object:", "transferNotificationSessionToAccount:", v20, v22));
          else
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[MFMonitoredInvocation mf_invocationWithSelector:target:](MFMonitoredInvocation, "mf_invocationWithSelector:target:", "stopListeningForNotifications", v20));
          objc_msgSend(v23, "addInvocation:", v24);

        }
        v17 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
      }
      while (v17);
    }

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v25 = obj;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v53;
      do
      {
        for (k = 0; k != v26; k = (char *)k + 1)
        {
          if (*(_QWORD *)v53 != v27)
            objc_enumerationMutation(v25);
          v29 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)k);
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "uniqueID"));
          if ((objc_msgSend(v51, "containsObject:", v30) & 1) == 0)
          {
            v31 = objc_msgSend(v29, "canFetch");

            if (!v31)
              continue;
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[MFMonitoredInvocation mf_invocationWithSelector:target:](MFMonitoredInvocation, "mf_invocationWithSelector:target:", "startListeningForNotifications", v29));
            objc_msgSend(v30, "addInvocation:", v32);

          }
        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
      }
      while (v26);
    }

  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "mailAccounts"));
  -[MFAccountsController _gatherStatisticsWithAccounts:](self, "_gatherStatisticsWithAccounts:", v33);

  v64[0] = ECMailAccountsDidChangeNotificationKeyPreviousAccountIdentifiers;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "first"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "displayedAccountsIdentifiers"));
  v65[0] = v35;
  v64[1] = ECMailAccountsDidChangeNotificationKeyAccountIdentifiers;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "second"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "displayedAccountsIdentifiers"));
  v65[1] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v65, v64, 2));

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v39, "postNotificationName:object:userInfo:", ECMailAccountsDidChangeNotification, self, v38);

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v40, "postNotificationName:object:", MFMailComposeControllerShouldReloadAccounts, self);

}

- (void)resetAccountsSynchronouslyOnMainThread
{
  -[MFAccountsController _resetAccounts](self, "_resetAccounts");
}

- (MFMailboxProvider)mailboxProvider
{
  return self->_mailboxProvider;
}

- (MFMailAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C580;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA038 != -1)
    dispatch_once(&qword_1005AA038, block);
  return (id)qword_1005AA030;
}

- (void)resetAccounts
{
  void *v2;
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100143924;
  v3[3] = &unk_10051AA98;
  v3[4] = self;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  objc_msgSend(v2, "performBlock:", v3);

}

- (void)currentFocusChanged:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  EMFocus *v8;
  EMFocus *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  EMFocus *v13;
  id v14;
  MFAccountsController *v15;
  uint8_t buf[4];
  void *v17;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(+[MFAccountsController log](MFAccountsController, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ef_publicDescription"));
    *(_DWORD *)buf = 138543362;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Current focus has changed %{public}@", buf, 0xCu);

  }
  os_unfair_lock_lock(&self->_currentFocusLock);
  v8 = self->_currentFocus;
  objc_storeStrong((id *)&self->_currentFocus, a3);
  os_unfair_lock_unlock(&self->_currentFocusLock);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100143AFC;
  v12[3] = &unk_10051A960;
  v9 = v8;
  v13 = v9;
  v10 = v5;
  v14 = v10;
  v15 = self;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  objc_msgSend(v11, "performBlock:", v12);

}

- (EFScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_scheduler, a3);
}

- (EMFocus)currentFocus
{
  return self->_currentFocus;
}

- (void)setCurrentFocus:(id)a3
{
  objc_storeStrong((id *)&self->_currentFocus, a3);
}

- (EFCancelable)focusObservationToken
{
  return self->_focusObservationToken;
}

- (void)setFocusObservationToken:(id)a3
{
  objc_storeStrong((id *)&self->_focusObservationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusObservationToken, 0);
  objc_storeStrong((id *)&self->_currentFocus, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_mailboxProvider, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
}

@end
