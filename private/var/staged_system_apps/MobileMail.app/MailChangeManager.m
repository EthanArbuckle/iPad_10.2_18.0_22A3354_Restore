@implementation MailChangeManager

- (int)levelForMailbox:(id)a3
{
  id v4;
  NSMutableDictionary *lastCalculatedMailboxDictionary;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  lastCalculatedMailboxDictionary = self->_lastCalculatedMailboxDictionary;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "account"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](lastCalculatedMailboxDictionary, "objectForKeyedSubscript:", v7));

  LODWORD(v6) = objc_msgSend(v8, "levelForMailbox:", v4);
  return (int)v6;
}

- (id)allMailboxUidsSortedWithSpecialsAtTopForAccount:(id)a3 includingLocals:(BOOL)a4 client:(id)a5 outbox:(id)a6
{
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSMutableArray *pendingChanges;
  NSMutableArray *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSMutableDictionary *lastCalculatedMailboxDictionary;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v8 = a4;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (pthread_main_np() != 1)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailChangeManager.m"), 263, CFSTR("Current thread must be main"));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "treeOfAllMailboxUidsSortedWithSpecialsAtTopIncludingLocals:client:outbox:", v8, v12, v13));
  pendingChanges = self->_pendingChanges;
  if (pendingChanges && -[NSMutableArray count](pendingChanges, "count"))
  {
    if (!self->_currentChange)
      goto LABEL_9;
  }
  else if (!self->_currentChange)
  {
    goto LABEL_17;
  }
  -[MailChangeManager _modifyMailboxesForMailboxTree:forChange:](self, "_modifyMailboxesForMailboxTree:forChange:", v14);
LABEL_9:
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = self->_pendingChanges;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v26;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v16);
        -[MailChangeManager _modifyMailboxesForMailboxTree:forChange:](self, "_modifyMailboxesForMailboxTree:forChange:", v14, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v19), (_QWORD)v25);
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v17);
  }

LABEL_17:
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueID", (_QWORD)v25));
  if (v20)
  {
    lastCalculatedMailboxDictionary = self->_lastCalculatedMailboxDictionary;
    if (v14)
      -[NSMutableDictionary setObject:forKeyedSubscript:](lastCalculatedMailboxDictionary, "setObject:forKeyedSubscript:", v14, v20);
    else
      -[NSMutableDictionary removeObjectForKey:](lastCalculatedMailboxDictionary, "removeObjectForKey:", v20);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "flattenedMailboxTreeRepresentation"));

  return v22;
}

- (MailChangeManager)init
{
  MailChangeManager *v2;
  MFInvocationQueue *v3;
  MFInvocationQueue *invocationQueue;
  NSMutableDictionary *v5;
  NSMutableDictionary *lastCalculatedMailboxDictionary;
  MFConditionLock *v7;
  MFConditionLock *processingLock;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MailChangeManager;
  v2 = -[MailChangeManager init](&v11, "init");
  if (v2)
  {
    v3 = (MFInvocationQueue *)objc_alloc_init((Class)MFInvocationQueue);
    invocationQueue = v2->_invocationQueue;
    v2->_invocationQueue = v3;

    -[MFInvocationQueue setMaxThreadCount:](v2->_invocationQueue, "setMaxThreadCount:", 1);
    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    lastCalculatedMailboxDictionary = v2->_lastCalculatedMailboxDictionary;
    v2->_lastCalculatedMailboxDictionary = v5;

    v7 = (MFConditionLock *)objc_msgSend(objc_alloc((Class)MFConditionLock), "initWithCondition:", 0);
    processingLock = v2->_processingLock;
    v2->_processingLock = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MFDiagnostics sharedController](MFDiagnostics, "sharedController"));
    objc_msgSend(v9, "addDiagnosticsGenerator:", v2);

  }
  return v2;
}

+ (id)sharedChangeManager
{
  if (qword_1005A9CF8 != -1)
    dispatch_once(&qword_1005A9CF8, &stru_10051E2B0);
  return (id)qword_1005A9CF0;
}

- (id)copyDiagnosticInformation
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithFormat:", CFSTR("\n==== %@ ====\n"), objc_opt_class(self));
  -[MailChangeManager pause](self, "pause");
  -[MailChangeManager mf_lock](self, "mf_lock");
  objc_msgSend(v3, "appendFormat:", CFSTR("  current change:    %@\n"), self->_currentChange);
  objc_msgSend(v3, "appendFormat:", CFSTR("  pending changes:   %@\n"), self->_pendingChanges);
  objc_msgSend(v3, "appendFormat:", CFSTR("  committed changes: %@\n"), self->_committedChanges);
  objc_msgSend(v3, "appendFormat:", CFSTR("  invocation queue:  %@\n"), self->_invocationQueue);
  -[MailChangeManager mf_unlock](self, "mf_unlock");
  -[MailChangeManager resume](self, "resume");
  return v3;
}

- (void)pause
{
  -[MFConditionLock lock](self->_processingLock, "lock");
  -[MFConditionLock unlockWithCondition:](self->_processingLock, "unlockWithCondition:", (char *)-[MFConditionLock condition](self->_processingLock, "condition") + 1);
}

- (void)resume
{
  -[MFConditionLock lock](self->_processingLock, "lock");
  -[MFConditionLock unlockWithCondition:](self->_processingLock, "unlockWithCondition:", (char *)-[MFConditionLock condition](self->_processingLock, "condition") - 1);
}

- (void)addChange:(id)a3
{
  -[MailChangeManager addChange:currentAndPendingChangesBlock:](self, "addChange:currentAndPendingChangesBlock:", a3, 0);
}

- (BOOL)addChange:(id)a3 currentAndPendingChangesBlock:(id)a4
{
  id v6;
  unsigned int (**v7)(id, MCSChange *, NSMutableArray *);
  id v8;
  void *v9;
  NSMutableArray *pendingChanges;
  NSMutableArray *v11;
  NSMutableArray *v12;
  BOOL v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  _BYTE v30[128];

  v6 = a3;
  v7 = (unsigned int (**)(id, MCSChange *, NSMutableArray *))a4;
  if ((objc_msgSend(v6, "isFinalized") & 1) == 0)
    __assert_rtn("-[MailChangeManager addChange:currentAndPendingChangesBlock:]", "MailChangeManager.m", 98, "[change isFinalized]");
  -[MFConditionLock lock](self->_processingLock, "lock");
  v8 = -[MFConditionLock condition](self->_processingLock, "condition");
  -[MFConditionLock unlock](self->_processingLock, "unlock");
  if (!v8)
    __assert_rtn("-[MailChangeManager addChange:currentAndPendingChangesBlock:]", "MailChangeManager.m", 104, "isProperlyPaused");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  -[MailChangeManager mf_lock](self, "mf_lock");
  pendingChanges = self->_pendingChanges;
  if (pendingChanges)
  {
    if (!v7)
      goto LABEL_9;
  }
  else
  {
    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v12 = self->_pendingChanges;
    self->_pendingChanges = v11;

    pendingChanges = self->_pendingChanges;
    if (!v7)
    {
LABEL_9:
      -[NSMutableArray addObject:](pendingChanges, "addObject:", v6);
      v13 = 1;
      goto LABEL_11;
    }
  }
  if (v7[2](v7, self->_currentChange, pendingChanges))
  {
    pendingChanges = self->_pendingChanges;
    goto LABEL_9;
  }
  v13 = 0;
LABEL_11:
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stores", 0));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "mailbox"));
        if (v18)
          objc_msgSend(v9, "addObject:", v18);

      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v15);
  }

  v19 = -[NSMutableArray count](self->_pendingChanges, "count");
  if (v19 == (id)1)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MFMonitoredInvocation invocationWithSelector:target:taskName:priority:canBeCancelled:](MFMonitoredInvocation, "invocationWithSelector:target:taskName:priority:canBeCancelled:", "processPendingChanges", self, CFSTR("FLUSH_MBOX_CHANGES"), 5, 0));
    objc_msgSend(v6, "setInvocation:", v20);
    -[MFInvocationQueue addInvocation:](self->_invocationQueue, "addInvocation:", v20);

  }
  v21 = MFLogGeneral(v19);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "#ChangeSetActions Added %@ to changes", buf, 0xCu);
  }

  -[MailChangeManager mf_unlock](self, "mf_unlock");
  return v13;
}

- (void)processPendingChanges
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  MailChangeManager *v8;
  uint64_t v9;
  NSObject *v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  NSMutableArray *committedChanges;
  NSMutableArray *v15;
  NSMutableArray *v16;
  uint64_t v17;
  NSObject *v18;
  MailChangeManager *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *i;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  MCSChange *currentChange;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  const __CFString *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _QWORD v54[2];
  _QWORD v55[2];
  uint8_t buf[4];
  MailChangeManager *v57;
  __int16 v58;
  id v59;

  if (pthread_main_np())
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailChangeManager.m"), 139, CFSTR("Current thread is main"));

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MFPowerController sharedInstance](MFPowerController, "sharedInstance"));
  objc_msgSend(v4, "retainAssertionWithIdentifier:", CFSTR("MailPendingChanges"));

  v6 = MFLogGeneral(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v57 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#ChangeSetActions %@ taking power assertion", buf, 0xCu);
  }

  v46 = MFMessageErrorDomain;
  v45 = CFSTR("MailChangeSetEncounteredError");
  while (1)
  {
    -[MFConditionLock lockWhenCondition:](self->_processingLock, "lockWhenCondition:", 0, v45);
    -[MFConditionLock unlock](self->_processingLock, "unlock");
    -[MailChangeManager mf_lock](self, "mf_lock");
    if (!-[NSMutableArray count](self->_pendingChanges, "count"))
      break;
    v8 = (MailChangeManager *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_pendingChanges, "objectAtIndexedSubscript:", 0));
    objc_storeStrong((id *)&self->_currentChange, v8);
    v9 = MFLogGeneral(-[NSMutableArray removeObjectAtIndex:](self->_pendingChanges, "removeObjectAtIndex:", 0));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v57 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ChangeSetActions Initiating change %@", buf, 0xCu);
    }

    if (!v8)
      break;
    -[MailChangeManager mf_unlock](self, "mf_unlock");
    v11 = -[MailChangeManager commit](v8, "commit");
    v12 = MFLogGeneral(-[MailChangeManager mf_lock](self, "mf_lock"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v57 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#ChangeSetActions Committed change %@", buf, 0xCu);
    }

    if (v11)
    {
      committedChanges = self->_committedChanges;
      if (!committedChanges)
      {
        v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        v16 = self->_committedChanges;
        self->_committedChanges = v15;

        committedChanges = self->_committedChanges;
      }
      v17 = MFLogGeneral(-[NSMutableArray addObject:](committedChanges, "addObject:", v8));
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (MailChangeManager *)-[NSMutableArray count](self->_committedChanges, "count");
        v20 = -[NSMutableArray count](self->_pendingChanges, "count");
        *(_DWORD *)buf = 134218240;
        v57 = v19;
        v58 = 2048;
        v59 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#ChangeSetActions Committed: %lu\tPending: %lu", buf, 0x16u);
      }

    }
    -[MailChangeManager setInvocation:](v8, "setInvocation:", 0);
    -[MailChangeManager mf_unlock](self, "mf_unlock");
    if ((v11 & 1) == 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MailChangeManager localizedErrorDescription](v8, "localizedErrorDescription"));
      v48 = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MailChangeManager localizedErrorTitle](v8, "localizedErrorTitle"));
      v47 = v22;
      if (objc_msgSend(v21, "length") && objc_msgSend(v22, "length"))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", v46, 1030, v21, v22, &off_100542470));
        v54[0] = CFSTR("MailChangeSetErrorKey");
        v54[1] = CFSTR("MailChangeSetAccountKey");
        v55[0] = v23;
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[MailChangeManager accounts](v8, "accounts"));
        v55[1] = v24;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v55, v54, 2));

        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v26, "postNotificationName:object:userInfo:", v45, 0, v25);

        v22 = v47;
      }
      v27 = objc_opt_class(MailMailboxChangeSet);
      if ((objc_opt_isKindOfClass(v8, v27) & 1) != 0)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[MailChangeManager mailboxToMoveOrRename](v8, "mailboxToMoveOrRename"));
        if (v28)
        {
          -[MailChangeManager mf_lock](self, "mf_lock");
          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          v29 = -[NSMutableArray copy](self->_pendingChanges, "copy");
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
          if (v30)
          {
            v31 = *(_QWORD *)v50;
            do
            {
              for (i = 0; i != v30; i = (char *)i + 1)
              {
                if (*(_QWORD *)v50 != v31)
                  objc_enumerationMutation(v29);
                v33 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
                v34 = objc_opt_class(MailMailboxChangeSet);
                if ((objc_opt_isKindOfClass(v33, v34) & 1) != 0)
                {
                  v35 = v33;
                  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "mailboxToMoveOrRename"));
                  v37 = v28 == v36;

                  if (v37)
                  {
                    objc_msgSend(v35, "revert");
                    -[NSMutableArray removeObject:](self->_pendingChanges, "removeObject:", v35);
                  }

                }
              }
              v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
            }
            while (v30);
          }

          -[MailChangeManager mf_unlock](self, "mf_unlock");
        }
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v38, "postNotificationName:object:", CFSTR("MVMailboxListHasPendingChangesNotification"), 0);

        v22 = v47;
      }

    }
  }
  currentChange = self->_currentChange;
  self->_currentChange = 0;

  -[MailChangeManager mf_unlock](self, "mf_unlock");
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[MFPowerController sharedInstance](MFPowerController, "sharedInstance"));
  objc_msgSend(v40, "releaseAssertionWithIdentifier:", CFSTR("MailPendingChanges"));

  v42 = MFLogGeneral(v41);
  v43 = objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v57 = self;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "#ChangeSetActions %@ releasing power assertion", buf, 0xCu);
  }

}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ChangeManager %p (%lu pending, %lu committed)"), self, -[NSMutableArray count](self->_pendingChanges, "count"), -[NSMutableArray count](self->_committedChanges, "count"));
}

- (void)_modifyMailboxesForMailboxTree:(id)a3 forChange:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mailboxToRemove"));
  if (v6)
    objc_msgSend(v10, "removeNodeForMailbox:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mailboxToMoveOrRename"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "modifiedMailboxName"));
    if (v8)
      objc_msgSend(v10, "setDisplayName:forMailbox:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mailboxParentForMove"));
    if (v9)
      objc_msgSend(v10, "moveMailbox:toParent:", v7, v9);

  }
}

- (id)genericMailboxUidsSortedForAccount:(id)a3 includingLocals:(BOOL)a4 excludingMailbox:(id)a5
{
  id v7;
  void *v8;
  NSMutableArray *pendingChanges;
  NSMutableArray *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "treeOfAllGenericMailboxes"));
  pendingChanges = self->_pendingChanges;
  if (pendingChanges && -[NSMutableArray count](pendingChanges, "count"))
  {
    if (!self->_currentChange)
      goto LABEL_7;
  }
  else if (!self->_currentChange)
  {
    goto LABEL_15;
  }
  -[MailChangeManager _modifyMailboxesForMailboxTree:forChange:](self, "_modifyMailboxesForMailboxTree:forChange:", v8);
LABEL_7:
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_pendingChanges;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v10);
        -[MailChangeManager _modifyMailboxesForMailboxTree:forChange:](self, "_modifyMailboxesForMailboxTree:forChange:", v8, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v13), (_QWORD)v16);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

LABEL_15:
  if (v7)
    objc_msgSend(v8, "removeNodeForMailbox:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "flattenedMailboxTreeRepresentation", (_QWORD)v16));

  return v14;
}

- (id)parentForMailbox:(id)a3
{
  id v4;
  NSMutableDictionary *lastCalculatedMailboxDictionary;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  lastCalculatedMailboxDictionary = self->_lastCalculatedMailboxDictionary;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "account"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](lastCalculatedMailboxDictionary, "objectForKeyedSubscript:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parentForMailbox:", v4));
  if (!v9)
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parent"));

  return v9;
}

- (id)displayNameForMailbox:(id)a3
{
  id v4;
  NSMutableDictionary *lastCalculatedMailboxDictionary;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  lastCalculatedMailboxDictionary = self->_lastCalculatedMailboxDictionary;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "account"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](lastCalculatedMailboxDictionary, "objectForKeyedSubscript:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayNameForMailbox:", v4));
  if (!v9)
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));

  return v9;
}

- (id)displayNameUsingSpecialNamesForMailbox:(id)a3
{
  id v4;
  NSMutableDictionary *lastCalculatedMailboxDictionary;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  lastCalculatedMailboxDictionary = self->_lastCalculatedMailboxDictionary;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "account"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](lastCalculatedMailboxDictionary, "objectForKeyedSubscript:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayNameForMailbox:", v4));
  if (!v9)
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayNameUsingSpecialNames"));

  return v9;
}

- (BOOL)mailboxHasSubMailboxes:(id)a3
{
  id v4;
  NSMutableDictionary *lastCalculatedMailboxDictionary;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  lastCalculatedMailboxDictionary = self->_lastCalculatedMailboxDictionary;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "account"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](lastCalculatedMailboxDictionary, "objectForKeyedSubscript:", v7));

  LOBYTE(v6) = objc_msgSend(v8, "mailboxHasSubMailboxes:", v4);
  return (char)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_lastCalculatedMailboxDictionary, 0);
  objc_storeStrong((id *)&self->_invocationQueue, 0);
  objc_storeStrong((id *)&self->_currentChange, 0);
  objc_storeStrong((id *)&self->_committedChanges, 0);
  objc_storeStrong((id *)&self->_pendingChanges, 0);
  objc_storeStrong((id *)&self->_processingLock, 0);
}

@end
