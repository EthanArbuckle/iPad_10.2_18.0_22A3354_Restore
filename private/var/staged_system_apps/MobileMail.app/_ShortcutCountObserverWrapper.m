@implementation _ShortcutCountObserverWrapper

- (_ShortcutCountObserverWrapper)initWithFavoriteItem:(id)a3 messagePersistence:(id)a4 hookRegistry:(id)a5 countDidChange:(id)a6
{
  id v11;
  id v12;
  _ShortcutCountObserverWrapper *v13;
  _ShortcutCountObserverWrapper *v14;
  id v15;
  _QWORD *v16;
  id v17;
  void *v18;
  EFDebouncer *v19;
  EFDebouncer *badgeCountDebouncer;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  objc_super v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;

  v11 = a3;
  v31 = a4;
  v32 = a5;
  v12 = a6;
  v36.receiver = self;
  v36.super_class = (Class)_ShortcutCountObserverWrapper;
  v13 = -[_ShortcutCountObserverWrapper init](&v36, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_favoriteItem, a3);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100145C98;
    v33[3] = &unk_100520628;
    v15 = v11;
    v34 = v15;
    v35 = v12;
    v16 = objc_retainBlock(v33);
    v17 = objc_alloc((Class)EFDebouncer);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    v19 = (EFDebouncer *)objc_msgSend(v17, "initWithTimeInterval:scheduler:startAfter:block:", v18, 1, v16, 0.1);
    badgeCountDebouncer = v14->_badgeCountDebouncer;
    v14->_badgeCountDebouncer = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "countQueryPredicate"));
    if (v21)
    {
      v22 = objc_alloc((Class)NSString);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "displayName"));
      v24 = objc_msgSend(v22, "initWithFormat:", CFSTR("Application Shortcut Count Query %@"), v23);

      v25 = objc_msgSend(objc_alloc((Class)EMQuery), "initWithTargetClass:predicate:sortDescriptors:queryOptions:label:", objc_opt_class(EMMessage), v21, &__NSArray0__struct, 0, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "serverCountMailboxScope"));
      v27 = objc_claimAutoreleasedReturnValue(+[MFApplicationShortcutProvider log](MFApplicationShortcutProvider, "log"));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "predicate"));
        *(_DWORD *)buf = 138412546;
        v38 = v28;
        v39 = 2112;
        v40 = v26;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Starting count query for predicate: %@ mailboxScope: %@", buf, 0x16u);

      }
      v29 = objc_msgSend(objc_alloc((Class)EDMessageCountQueryHandler), "initWithQuery:serverCountMailboxScope:messagePersistence:hookRegistry:observer:", v25, v26, v31, v32, v14);
      -[_ShortcutCountObserverWrapper setQueryHandler:](v14, "setQueryHandler:", v29);

    }
    else
    {
      v24 = objc_claimAutoreleasedReturnValue(+[MFApplicationShortcutProvider log](MFApplicationShortcutProvider, "log"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_100393898((uint64_t)v15, v24);
    }

  }
  return v14;
}

- (void)countDidChange:(int64_t)a3 acknowledgementToken:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(v8, "invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_ShortcutCountObserverWrapper badgeCountDebouncer](self, "badgeCountDebouncer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  objc_msgSend(v6, "debounceResult:", v7);

}

- (void)cancel
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[_ShortcutCountObserverWrapper queryHandler](self, "queryHandler"));
  objc_msgSend(v2, "cancel");

}

- (FavoriteItem)favoriteItem
{
  return self->_favoriteItem;
}

- (EFDebouncer)badgeCountDebouncer
{
  return self->_badgeCountDebouncer;
}

- (void)setBadgeCountDebouncer:(id)a3
{
  objc_storeStrong((id *)&self->_badgeCountDebouncer, a3);
}

- (EDMessageCountQueryHandler)queryHandler
{
  return self->_queryHandler;
}

- (void)setQueryHandler:(id)a3
{
  objc_storeStrong((id *)&self->_queryHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryHandler, 0);
  objc_storeStrong((id *)&self->_badgeCountDebouncer, 0);
  objc_storeStrong((id *)&self->_favoriteItem, 0);
}

@end
