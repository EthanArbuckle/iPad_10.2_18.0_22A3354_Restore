@implementation MFConversationAssistantContextProvider

- (MFConversationAssistantContextProvider)initWithCurrentVisibileMessageStrategy:(id)a3 contactStore:(id)a4
{
  id v7;
  id v8;
  MFConversationAssistantContextProvider *v9;
  MFConversationAssistantContextProvider *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MFConversationAssistantContextProvider;
  v9 = -[MFConversationAssistantContextProvider init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStore, a4);
    objc_storeStrong((id *)&v10->_visibleMessageStrategy, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AFContextManager defaultContextManager](AFContextManager, "defaultContextManager"));
    objc_msgSend(v11, "addContextProvider:", v10);

  }
  return v10;
}

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001503E8;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA0A8 != -1)
    dispatch_once(&qword_1005AA0A8, block);
  return (id)qword_1005AA0A0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFContextManager defaultContextManager](AFContextManager, "defaultContextManager"));
  objc_msgSend(v3, "removeContextProvider:", self);

  v4.receiver = self;
  v4.super_class = (Class)MFConversationAssistantContextProvider;
  -[MFConversationAssistantContextProvider dealloc](&v4, "dealloc");
}

- (BOOL)allowContextProvider:(id)a3
{
  NSObject *v3;
  int v5;
  const __CFString *v6;

  v3 = objc_claimAutoreleasedReturnValue(+[MFConversationAssistantContextProvider log](MFConversationAssistantContextProvider, "log", a3));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = 138543362;
    v6 = CFSTR("YES");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "allowContextProvider %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return 1;
}

- (id)getCurrentContext
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint8_t v43[24];

  v3 = -[objc_class email](off_1005A1A88(), "email");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationAssistantContextProvider visibleMessageStrategy](self, "visibleMessageStrategy"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentVisibleMessageContentRequest"));

    v37 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "waitForResult"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "message"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "date"));
      objc_msgSend(v4, "setDateSent:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "toList"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationAssistantContextProvider _saPersonAttributesFromEmailAddresses:](self, "_saPersonAttributesFromEmailAddresses:", v10));
      objc_msgSend(v4, "setRecipientsTo:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ccList"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationAssistantContextProvider _saPersonAttributesFromEmailAddresses:](self, "_saPersonAttributesFromEmailAddresses:", v12));
      objc_msgSend(v4, "setRecipientsCc:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bccList"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationAssistantContextProvider _saPersonAttributesFromEmailAddresses:](self, "_saPersonAttributesFromEmailAddresses:", v14));
      objc_msgSend(v4, "setRecipientsBcc:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "senderList"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationAssistantContextProvider _saPersonAttributesFromEmailAddresses:](self, "_saPersonAttributesFromEmailAddresses:", v16));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastObject"));
      objc_msgSend(v4, "setFromEmail:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mailboxes"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "ef_map:", &stru_100520A18));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "ef_flatten"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "ef_compactMap:", &stru_100520A58));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v22));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allObjects"));
      objc_msgSend(v4, "setReceivingAddresses:", v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mailboxes"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v25, "ef_any:", &stru_100520A78)));
      objc_msgSend(v4, "setOutgoing:", v26);

      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "publicMessageURL"));
      objc_msgSend(v4, "setIdentifier:", v27);

    }
    else
    {
      v29 = objc_claimAutoreleasedReturnValue(+[MFConversationAssistantContextProvider log](MFConversationAssistantContextProvider, "log"));
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationAssistantContextProvider visibleMessageStrategy](self, "visibleMessageStrategy"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "currentVisibleMessageContentRequest"));
        sub_100393DCC(v31, v43, v29, v30);
      }

    }
    v32 = objc_claimAutoreleasedReturnValue(+[MFConversationAssistantContextProvider log](MFConversationAssistantContextProvider, "log"));
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dictionary"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
      *(_DWORD *)buf = 138412546;
      v40 = v33;
      v41 = 2114;
      v42 = v34;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Returning %@, %{public}@.", buf, 0x16u);

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dictionary"));
    v38 = v35;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));

  }
  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  }

  return v28;
}

- (id)_saPersonAttributesFromEmailAddresses:(id)a3
{
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v19 = a3;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v19;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(obj);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), "emailAddressValue"));
        v8 = v7;
        if (v7)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "simpleAddress"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayName"));
          if (objc_msgSend(v9, "length"))
          {
            v11 = -[objc_class personAttribute](off_1005A1A90(), "personAttribute");
            v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
            objc_msgSend(v12, "setData:", v9);
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationAssistantContextProvider contactStore](self, "contactStore"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "displayNameForEmailAddress:", v9));

            if (objc_msgSend(v14, "length"))
              v15 = v14;
            else
              v15 = v10;
            objc_msgSend(v12, "setDisplayText:", v15);
            objc_msgSend(v20, "addObject:", v12);

          }
        }
        else
        {
          v9 = 0;
          v10 = 0;
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v4);
  }

  if (objc_msgSend(v20, "count"))
    v16 = v20;
  else
    v16 = 0;
  v17 = v16;

  return v17;
}

- (EMCachingContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (MFCurrentVisibleMessageStrategy)visibleMessageStrategy
{
  return self->_visibleMessageStrategy;
}

- (void)setVisibleMessageStrategy:(id)a3
{
  objc_storeStrong((id *)&self->_visibleMessageStrategy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleMessageStrategy, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
