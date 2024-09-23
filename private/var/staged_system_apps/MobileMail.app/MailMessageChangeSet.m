@implementation MailMessageChangeSet

- (MailMessageChangeSet)initWithMessages:(id)a3 operation:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  MailMessageChangeSet *v9;
  MailMessageChangeSet *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class(NSSet);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
    __assert_rtn("-[MailMessageChangeSet initWithMessages:operation:]", "MailMessageChangeSet.m", 29, "[messages isKindOfClass:[NSSet class]]");
  v12.receiver = self;
  v12.super_class = (Class)MailMessageChangeSet;
  v9 = -[MailMessageChangeSet init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    -[MailMessageChangeSet _setMessages:](v9, "_setMessages:", v6);
    objc_storeStrong((id *)&v10->_operation, a4);
    -[MailMessageChangeSet _populateMessageSets](v10, "_populateMessageSets");
    *((_BYTE *)&v10->super + 16) |= 1u;
  }

  return v10;
}

- (MailMessageChangeSet)initWithMessages:(id)a3 unreadMessages:(id)a4 readMessages:(id)a5 flaggedMessages:(id)a6 unflaggedMessages:(id)a7 operation:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  MailMessageChangeSet *v21;
  MailMessageChangeSet *v22;
  NSSet *v23;
  NSSet *messagesMarkedUnread;
  NSSet *v25;
  NSSet *messagesMarkedRead;
  NSSet *v27;
  NSSet *messagesFlagged;
  NSSet *v29;
  NSSet *messagesUnflagged;
  objc_super v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = objc_opt_class(NSSet);
  if ((objc_opt_isKindOfClass(v14, v20) & 1) == 0)
    __assert_rtn("-[MailMessageChangeSet initWithMessages:unreadMessages:readMessages:flaggedMessages:unflaggedMessages:operation:]", "MailMessageChangeSet.m", 44, "[messages isKindOfClass:[NSSet class]]");
  v32.receiver = self;
  v32.super_class = (Class)MailMessageChangeSet;
  v21 = -[MailMessageChangeSet init](&v32, "init");
  v22 = v21;
  if (v21)
  {
    -[MailMessageChangeSet _setMessages:](v21, "_setMessages:", v14);
    objc_storeStrong((id *)&v22->_operation, a8);
    v23 = (NSSet *)objc_msgSend(v15, "copy");
    messagesMarkedUnread = v22->_messagesMarkedUnread;
    v22->_messagesMarkedUnread = v23;

    v25 = (NSSet *)objc_msgSend(v16, "copy");
    messagesMarkedRead = v22->_messagesMarkedRead;
    v22->_messagesMarkedRead = v25;

    v27 = (NSSet *)objc_msgSend(v17, "copy");
    messagesFlagged = v22->_messagesFlagged;
    v22->_messagesFlagged = v27;

    v29 = (NSSet *)objc_msgSend(v18, "copy");
    messagesUnflagged = v22->_messagesUnflagged;
    v22->_messagesUnflagged = v29;

    *((_BYTE *)&v22->super + 16) |= 1u;
  }

  return v22;
}

- (void)_setMessages:(id)a3
{
  NSSet *v4;
  NSSet *v5;
  NSSet *v6;
  NSSet *messagesSet;
  MessageToMailboxUidCache *v8;
  NSSet *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = (NSSet *)a3;
  v5 = v4;
  if (self->_messagesSet != v4)
  {
    v6 = (NSSet *)-[NSSet copy](v4, "copy");
    messagesSet = self->_messagesSet;
    self->_messagesSet = v6;

    v8 = objc_alloc_init(MessageToMailboxUidCache);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v5;
    v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v13, "canBeTriaged", (_QWORD)v16))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageToMailboxUidCache mailboxForMessage:](v8, "mailboxForMessage:", v13));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "store"));
            objc_msgSend(v13, "setMessageStore:", v15);

          }
        }
        v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
}

- (id)localizedErrorDescription
{
  return -[MCSMessageOperation localizedErrorDescriptionForMessageCount:](self->_operation, "localizedErrorDescriptionForMessageCount:", -[NSSet count](self->_messagesSet, "count"));
}

- (id)localizedErrorTitle
{
  return -[MCSMessageOperation localizedErrorTitleForMessageCount:](self->_operation, "localizedErrorTitleForMessageCount:", -[NSSet count](self->_messagesSet, "count"));
}

- (void)_populateMessageSets
{
  NSSet *messagesMarkedRead;
  NSSet *messagesMarkedUnread;
  NSSet *v5;
  NSSet *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  NSSet *v11;
  NSSet *v12;
  NSSet *v13;
  id v14;
  uint64_t v15;
  void *j;
  void *v17;
  NSSet *messagesUnflagged;
  NSSet *messagesFlagged;
  NSSet *v20;
  NSSet *v21;
  id v22;
  uint64_t v23;
  void *k;
  void *v25;
  NSSet *v26;
  NSSet *v27;
  NSSet *v28;
  id v29;
  uint64_t v30;
  void *m;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];

  messagesMarkedRead = self->_messagesMarkedRead;
  self->_messagesMarkedRead = 0;

  messagesMarkedUnread = self->_messagesMarkedUnread;
  self->_messagesMarkedUnread = 0;

  if (-[MCSMessageOperation willMarkRead](self->_operation, "willMarkRead"))
  {
    v5 = (NSSet *)objc_alloc_init((Class)NSMutableSet);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v6 = self->_messagesSet;
    v7 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v46 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v10, "messageFlags") & 1) == 0)
            -[NSSet addObject:](v5, "addObject:", v10);
        }
        v7 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
      }
      while (v7);
    }

    v11 = self->_messagesMarkedRead;
    self->_messagesMarkedRead = v5;
  }
  else
  {
    if (!-[MCSMessageOperation willMarkUnread](self->_operation, "willMarkUnread"))
      goto LABEL_24;
    v12 = (NSSet *)objc_alloc_init((Class)NSMutableSet);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v13 = self->_messagesSet;
    v14 = -[NSSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(_QWORD *)v42 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j);
          if ((objc_msgSend(v17, "messageFlags") & 1) != 0)
            -[NSSet addObject:](v12, "addObject:", v17);
        }
        v14 = -[NSSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      }
      while (v14);
    }

    v11 = self->_messagesMarkedUnread;
    self->_messagesMarkedUnread = v12;
  }

LABEL_24:
  messagesUnflagged = self->_messagesUnflagged;
  self->_messagesUnflagged = 0;

  messagesFlagged = self->_messagesFlagged;
  self->_messagesFlagged = 0;

  if (-[MCSMessageOperation willUnflag](self->_operation, "willUnflag"))
  {
    v20 = (NSSet *)objc_alloc_init((Class)NSMutableSet);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v21 = self->_messagesSet;
    v22 = -[NSSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v38;
      do
      {
        for (k = 0; k != v22; k = (char *)k + 1)
        {
          if (*(_QWORD *)v38 != v23)
            objc_enumerationMutation(v21);
          v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)k);
          if ((objc_msgSend(v25, "messageFlags") & 0x10) != 0)
            -[NSSet addObject:](v20, "addObject:", v25);
        }
        v22 = -[NSSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
      }
      while (v22);
    }

    v26 = self->_messagesUnflagged;
    self->_messagesUnflagged = v20;
  }
  else
  {
    if (!-[MCSMessageOperation willFlag](self->_operation, "willFlag"))
      return;
    v27 = (NSSet *)objc_alloc_init((Class)NSMutableSet);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v28 = self->_messagesSet;
    v29 = -[NSSet countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v34;
      do
      {
        for (m = 0; m != v29; m = (char *)m + 1)
        {
          if (*(_QWORD *)v34 != v30)
            objc_enumerationMutation(v28);
          v32 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)m);
          if ((objc_msgSend(v32, "messageFlags", (_QWORD)v33) & 0x10) == 0)
            -[NSSet addObject:](v27, "addObject:", v32);
        }
        v29 = -[NSSet countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
      }
      while (v29);
    }

    v26 = self->_messagesFlagged;
    self->_messagesFlagged = v27;
  }

}

- (id)messagesSet
{
  return self->_messagesSet;
}

- (id)applyPendingChangeToObjects:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  if (!-[MCSChange isFinalized](self, "isFinalized"))
    __assert_rtn("-[MailMessageChangeSet applyPendingChangeToObjects:]", "MailMessageChangeSet.m", 136, "[self isFinalized]");
  v5 = objc_alloc_init((Class)NSMutableSet);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (-[NSSet containsObject:](self->_messagesSet, "containsObject:", v10, (_QWORD)v13))
          objc_msgSend(v5, "addObject:", v10);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCSOperation applyPendingChangeToObjects:](self->_operation, "applyPendingChangeToObjects:", v5));
  return v11;
}

- (BOOL)commit
{
  id v3;
  id v4;
  _BOOL4 v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  MailMessageChangeSet *v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  id v15;

  if (!-[MCSChange isFinalized](self, "isFinalized"))
    sub_100392804();
  v3 = objc_alloc_init((Class)NSMutableSet);
  v4 = objc_alloc_init((Class)NSMutableSet);
  v5 = -[MCSMessageOperation commitToMessages:failures:newMessages:](self->_operation, "commitToMessages:failures:newMessages:", self->_messagesSet, v3, v4);
  v6 = objc_msgSend(v4, "count");
  if (v6)
    v6 = -[MailMessageChangeSet _setMessages:](self, "_setMessages:", v4);
  v7 = MFLogGeneral(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 138412802;
    v11 = self;
    v12 = 1024;
    v13 = v5;
    v14 = 2112;
    v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#ChangeSetActions Committed %@ with result %d (%@)", (uint8_t *)&v10, 0x1Cu);
  }

  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ => %lu messages"), self->_operation, -[NSSet count](self->_messagesSet, "count"));
}

- (id)stores
{
  id v3;
  NSSet *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (!-[MCSChange isFinalized](self, "isFinalized"))
    sub_10039282C();
  v3 = objc_alloc_init((Class)NSMutableSet);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_messagesSet;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7), "messageStore", (_QWORD)v10));
        if (v8)
          objc_msgSend(v3, "addObject:", v8);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)accounts
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (!-[MCSChange isFinalized](self, "isFinalized"))
    sub_100392854();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailMessageChangeSet stores](self, "stores", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7), "account"));
        if (v8)
          objc_msgSend(v3, "addObject:", v8);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v3;
}

- (MCSMessageOperation)operation
{
  return (MCSMessageOperation *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_messagesFlagged, 0);
  objc_storeStrong((id *)&self->_messagesUnflagged, 0);
  objc_storeStrong((id *)&self->_messagesMarkedUnread, 0);
  objc_storeStrong((id *)&self->_messagesMarkedRead, 0);
  objc_storeStrong((id *)&self->_messagesSet, 0);
}

@end
