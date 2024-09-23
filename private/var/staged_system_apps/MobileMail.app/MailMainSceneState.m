@implementation MailMainSceneState

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EEB24;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9D90 != -1)
    dispatch_once(&qword_1005A9D90, block);
  return (id)qword_1005A9D88;
}

- (MailMainSceneState)initWithDictionary:(id)a3 daemonInterface:(id)a4
{
  return -[MailMainSceneState initWithDictionary:daemonInterface:componentFactory:](self, "initWithDictionary:daemonInterface:componentFactory:", a3, a4, self);
}

- (MailMainSceneState)initWithDictionary:(id)a3 daemonInterface:(id)a4 componentFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  MailMainSceneState *v11;
  MailMainSceneState *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MailMainSceneState;
  v11 = -[MailMainSceneState init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    -[MailMainSceneState _setDefaultValues](v11, "_setDefaultValues");
    -[MailMainSceneState _loadFromDictionary:daemonInterface:componentFactory:](v12, "_loadFromDictionary:daemonInterface:componentFactory:", v8, v9, v10);
  }

  return v12;
}

- (MailMainSceneState)initWithBuilder:(id)a3
{
  void (**v4)(id, MailMainSceneState *);
  MailMainSceneState *v5;
  MailMainSceneState *v6;
  objc_super v8;

  v4 = (void (**)(id, MailMainSceneState *))a3;
  v8.receiver = self;
  v8.super_class = (Class)MailMainSceneState;
  v5 = -[MailMainSceneState init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    -[MailMainSceneState _setDefaultValues](v5, "_setDefaultValues");
    v4[2](v4, v6);
  }

  return v6;
}

- (void)_setDefaultValues
{
  -[MailMainSceneState setPrimaryNavState:](self, "setPrimaryNavState:", 1);
  -[MailMainSceneState setSupplementaryNavState:](self, "setSupplementaryNavState:", 0);
  -[MailMainSceneState setDetailNavState:](self, "setDetailNavState:", 0);
  -[MailMainSceneState setMessageListState:](self, "setMessageListState:", 0);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  int64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainSceneState conversationViewState](self, "conversationViewState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dictionaryRepresentation"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainSceneState messageListState](self, "messageListState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dictionaryRepresentation"));

  v7 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &off_100541668, CFSTR("StateDictionaryVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainSceneState favoritesManagerState](self, "favoritesManagerState"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("FavoritesManagerState"));

  v9 = -[MailMainSceneState primaryNavState](self, "primaryNavState");
  v10 = CFSTR("MessageList");
  if (v9 <= 2)
    v10 = off_10051E870[v9];
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("PrimaryNavigationState"));
  if ((id)-[MailMainSceneState supplementaryNavState](self, "supplementaryNavState") == (id)1)
    v11 = CFSTR("MessageList");
  else
    v11 = CFSTR("MessageListCollapsedToPrimary");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("SupplementaryNavigationState"));
  v12 = -[MailMainSceneState detailNavState](self, "detailNavState");
  v13 = CFSTR("NoSelection");
  if (v12 == 1)
    v13 = CFSTR("ConversationViewPrimary");
  if (v12 == 2)
    v14 = CFSTR("ConversationViewSecondary");
  else
    v14 = v13;
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("DetailNavigationState"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("ConversationViewState"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("MessageListState"));
  v15 = objc_msgSend(v7, "copy");

  return v15;
}

- (void)_loadFromDictionary:(id)a3 daemonInterface:(id)a4 componentFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 || !objc_msgSend(v8, "count"))
  {
    v12 = objc_claimAutoreleasedReturnValue(+[MailMainSceneState log](MailMainSceneState, "log"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100392740(v12);
    goto LABEL_8;
  }
  v11 = -[MailMainSceneState _versionFromDictionary:](self, "_versionFromDictionary:", v8);
  if (v11 >= 4)
  {
    v12 = objc_claimAutoreleasedReturnValue(+[MailMainSceneState log](MailMainSceneState, "log"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100392780(v11, v12);
LABEL_8:

    goto LABEL_9;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainSceneState _favoritesManagerStateFromDictionary:version:](self, "_favoritesManagerStateFromDictionary:version:", v8, v11));
  -[MailMainSceneState setFavoritesManagerState:](self, "setFavoritesManagerState:", v13);

  -[MailMainSceneState setPrimaryNavState:](self, "setPrimaryNavState:", -[MailMainSceneState _primaryNavigationStateFromDictionary:version:](self, "_primaryNavigationStateFromDictionary:version:", v8, v11));
  -[MailMainSceneState setSupplementaryNavState:](self, "setSupplementaryNavState:", -[MailMainSceneState _supplementaryNavigationStateFromDictionary:version:](self, "_supplementaryNavigationStateFromDictionary:version:", v8, v11));
  -[MailMainSceneState setDetailNavState:](self, "setDetailNavState:", -[MailMainSceneState _detailNavigationStateFromDictionary:version:](self, "_detailNavigationStateFromDictionary:version:", v8, v11));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainSceneState _conversationStateDictionaryFromDictionary:version:](self, "_conversationStateDictionaryFromDictionary:version:", v8, v11));
  if (objc_msgSend(v14, "count"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "beginLoadingConversationStateWithDictionary:daemonInterface:", v14, v9));
    -[MailMainSceneState setConversationViewStateFuture:](self, "setConversationViewStateFuture:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainSceneState _messageListStateDictionaryFromDictionary:version:](self, "_messageListStateDictionaryFromDictionary:version:", v8, v11));
  if (objc_msgSend(v16, "count"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "beginLoadingMessageListStateWithDictionary:daemonInterface:", v16, v9));
    -[MailMainSceneState setMessageListStateFuture:](self, "setMessageListStateFuture:", v17);

  }
LABEL_9:

}

- (int64_t)_versionFromDictionary:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  int v13;
  int64_t v14;

  v3 = a3;
  v4 = objc_msgSend(v3, "ef_objectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("StateDictionaryVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v5)
  {
    v7 = (int64_t)objc_msgSend(v5, "integerValue");
    v8 = objc_claimAutoreleasedReturnValue(+[MailMainSceneState log](MailMainSceneState, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v13 = 134217984;
      v14 = v7;
      v9 = "Found dictionary version: %ld";
      v10 = v8;
      v11 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v13, v11);
    }
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[MailMainSceneState log](MailMainSceneState, "log"));
    v7 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      v9 = "No version was found in dictionary. Assuming v1.";
      v7 = 1;
      v10 = v8;
      v11 = 2;
      goto LABEL_6;
    }
  }

  return v7;
}

- (id)_favoritesManagerStateFromDictionary:(id)a3 version:(int64_t)a4
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "ef_objectOfClass:forKey:", objc_opt_class(NSDictionary), CFSTR("FavoritesManagerState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (int64_t)_primaryNavigationStateFromDictionary:(id)a3 version:(int64_t)a4
{
  id v4;
  id v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "ef_objectOfClass:forKey:", objc_opt_class(NSString), CFSTR("PrimaryNavigationState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = sub_1000EF3E8(v6);

  return v7;
}

- (int64_t)_supplementaryNavigationStateFromDictionary:(id)a3 version:(int64_t)a4
{
  id v5;
  int64_t v6;
  id v7;
  void *v8;

  v5 = a3;
  if (a4 >= 3)
  {
    v7 = objc_msgSend(v5, "ef_objectOfClass:forKey:", objc_opt_class(NSString), CFSTR("SupplementaryNavigationState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v6 = sub_1000EF504(v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)_detailNavigationStateFromDictionary:(id)a3 version:(int64_t)a4
{
  id v4;
  id v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "ef_objectOfClass:forKey:", objc_opt_class(NSString), CFSTR("DetailNavigationState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = sub_1000EF5E8(v6);

  return v7;
}

- (id)_conversationStateDictionaryFromDictionary:(id)a3 version:(int64_t)a4
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ConversationViewState"), a4));
}

- (id)_messageListStateDictionaryFromDictionary:(id)a3 version:(int64_t)a4
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MessageListState"), a4));
}

- (ConversationViewRestorationState)conversationViewState
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainSceneState conversationViewStateFuture](self, "conversationViewStateFuture"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "resultIfAvailable"));

  return (ConversationViewRestorationState *)v3;
}

- (void)setConversationViewState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithResult:](EFFuture, "futureWithResult:", v4));
    -[MailMainSceneState setConversationViewStateFuture:](self, "setConversationViewStateFuture:", v5);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mf_invalidRestorationDataErrorWithUnderlyingError:](NSError, "mf_invalidRestorationDataErrorWithUnderlyingError:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithError:](EFFuture, "futureWithError:", v5));
    -[MailMainSceneState setConversationViewStateFuture:](self, "setConversationViewStateFuture:", v6);

  }
}

- (MessageListRestorationState)messageListState
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainSceneState messageListStateFuture](self, "messageListStateFuture"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "resultIfAvailable"));

  return (MessageListRestorationState *)v3;
}

- (void)setMessageListState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithResult:](EFFuture, "futureWithResult:", v4));
    -[MailMainSceneState setMessageListStateFuture:](self, "setMessageListStateFuture:", v5);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mf_invalidRestorationDataErrorWithUnderlyingError:](NSError, "mf_invalidRestorationDataErrorWithUnderlyingError:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithError:](EFFuture, "futureWithError:", v5));
    -[MailMainSceneState setMessageListStateFuture:](self, "setMessageListStateFuture:", v6);

  }
}

- (id)beginLoadingConversationStateWithDictionary:(id)a3 daemonInterface:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue(+[ConversationViewRestorationState loadFromDictionary:daemonInterface:](ConversationViewRestorationState, "loadFromDictionary:daemonInterface:", a3, a4));
}

- (id)beginLoadingMessageListStateWithDictionary:(id)a3 daemonInterface:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue(+[MessageListRestorationState loadFromDictionary:daemonInterface:](MessageListRestorationState, "loadFromDictionary:daemonInterface:", a3, a4));
}

- (NSString)ef_publicDescription
{
  unint64_t v3;
  const __CFString *v4;
  int64_t v5;
  __CFString *v6;
  int64_t v7;
  __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v19;
  __CFString *v20;
  __CFString *v21;

  v3 = -[MailMainSceneState primaryNavState](self, "primaryNavState");
  v4 = CFSTR("MessageList");
  if (v3 <= 2)
    v4 = off_10051E870[v3];
  v5 = -[MailMainSceneState supplementaryNavState](self, "supplementaryNavState");
  v6 = CFSTR("MessageListCollapsedToPrimary");
  if (v5 == 1)
    v6 = CFSTR("MessageList");
  v21 = v6;
  v7 = -[MailMainSceneState detailNavState](self, "detailNavState");
  v8 = CFSTR("NoSelection");
  if (v7 == 1)
    v8 = CFSTR("ConversationViewPrimary");
  if (v7 == 2)
    v8 = CFSTR("ConversationViewSecondary");
  v20 = v8;
  v9 = objc_opt_class(self);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainSceneState favoritesManagerState](self, "favoritesManagerState"));
  if (v19)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainSceneState conversationViewState](self, "conversationViewState"));
  if (v12)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainSceneState messageListState](self, "messageListState"));
  if (v15)
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> primaryNav=%@ supplementaryNav=%@ detailNav=%@ hasFavoritesManagerState=%@ hasConversationViewState=%@ hasMessageListState=%@"), v9, self, v4, v21, v20, v11, v14, v16));

  return (NSString *)v17;
}

- (NSDictionary)favoritesManagerState
{
  return self->_favoritesManagerState;
}

- (void)setFavoritesManagerState:(id)a3
{
  objc_storeStrong((id *)&self->_favoritesManagerState, a3);
}

- (int64_t)primaryNavState
{
  return self->_primaryNavState;
}

- (void)setPrimaryNavState:(int64_t)a3
{
  self->_primaryNavState = a3;
}

- (int64_t)supplementaryNavState
{
  return self->_supplementaryNavState;
}

- (void)setSupplementaryNavState:(int64_t)a3
{
  self->_supplementaryNavState = a3;
}

- (int64_t)detailNavState
{
  return self->_detailNavState;
}

- (void)setDetailNavState:(int64_t)a3
{
  self->_detailNavState = a3;
}

- (EFFuture)conversationViewStateFuture
{
  return self->_conversationViewStateFuture;
}

- (void)setConversationViewStateFuture:(id)a3
{
  objc_storeStrong((id *)&self->_conversationViewStateFuture, a3);
}

- (EFFuture)messageListStateFuture
{
  return self->_messageListStateFuture;
}

- (void)setMessageListStateFuture:(id)a3
{
  objc_storeStrong((id *)&self->_messageListStateFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageListStateFuture, 0);
  objc_storeStrong((id *)&self->_conversationViewStateFuture, 0);
  objc_storeStrong((id *)&self->_favoritesManagerState, 0);
}

@end
