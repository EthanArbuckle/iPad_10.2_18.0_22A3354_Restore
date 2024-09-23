@implementation GKAcceptedInviteManager

- (GKAcceptedInviteManager)init
{
  GKAcceptedInviteManager *v2;
  NSMutableArray *v3;
  NSMutableArray *acceptedMultiplayerInvites;
  NSMutableArray *v5;
  NSMutableArray *queuedCancelledMultiplayerInviteSessionTokens;
  NSMutableArray *v7;
  NSMutableArray *acceptedTurnBased;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKAcceptedInviteManager;
  v2 = -[GKAcceptedInviteManager init](&v10, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    acceptedMultiplayerInvites = v2->_acceptedMultiplayerInvites;
    v2->_acceptedMultiplayerInvites = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    queuedCancelledMultiplayerInviteSessionTokens = v2->_queuedCancelledMultiplayerInviteSessionTokens;
    v2->_queuedCancelledMultiplayerInviteSessionTokens = v5;

    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    acceptedTurnBased = v2->_acceptedTurnBased;
    v2->_acceptedTurnBased = v7;

  }
  return v2;
}

+ (id)syncQueue
{
  id v2;
  NSObject *v3;
  uint8_t v5[16];

  if (!os_log_GKGeneral)
    v2 = (id)GKOSLoggers(a1);
  v3 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager syncQueue", v5, 2u);
  }
  if (qword_100318160 != -1)
    dispatch_once(&qword_100318160, &stru_1002C4C78);
  return (id)qword_100318158;
}

- (void)performSync:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  dispatch_queue_t current_queue;
  NSObject *v11;
  const char *label;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager performSync:", buf, 2u);
  }
  v8 = objc_msgSend((id)objc_opt_class(self), "syncQueue");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  current_queue = dispatch_get_current_queue();
  v11 = objc_claimAutoreleasedReturnValue(current_queue);

  if (v11 == v9)
  {
    label = dispatch_queue_get_label(v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the same queue(\"%s\"), would deadlock at %@"), "-[GKAcceptedInviteManager performSync:]", label, v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAcceptedInviteManager.m"));
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (dispatch_get_current_queue() != queue)\n[%s (%s:%d)]"), v14, "-[GKAcceptedInviteManager performSync:]", objc_msgSend(v16, "UTF8String"), 58));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v17);
  }
  dispatch_sync(v9, v5);

}

- (void)_addBulletin:(id)a3 toArray:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager _addBulletin: toArray:", buf, 2u);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10013ECCC;
  v13[3] = &unk_1002BB658;
  v14 = v8;
  v15 = v6;
  v11 = v6;
  v12 = v8;
  -[GKAcceptedInviteManager performSync:](self, "performSync:", v13);

}

- (void)_insertBulletin:(id)a3 atFrontOfArray:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager _insertBulletin:toFrontOfArray:", buf, 2u);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10013EDDC;
  v13[3] = &unk_1002BB658;
  v14 = v8;
  v15 = v6;
  v11 = v6;
  v12 = v8;
  -[GKAcceptedInviteManager performSync:](self, "performSync:", v13);

}

- (id)_fetchObjectFromArray:(id)a3 passingTest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t *v18;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager _fetchObjectinFromArray: passingTest:", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v20 = buf;
  v21 = 0x3032000000;
  v22 = sub_10013EF60;
  v23 = sub_10013EF70;
  v24 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10013EF78;
  v15[3] = &unk_1002C4CA0;
  v11 = v6;
  v16 = v11;
  v12 = v8;
  v17 = v12;
  v18 = buf;
  -[GKAcceptedInviteManager performSync:](self, "performSync:", v15);
  v13 = *((id *)v20 + 5);

  _Block_object_dispose(buf, 8);
  return v13;
}

- (id)_fetchAndRemoveBulletinFromArray:(id)a3 passingTest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t *v18;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager _fetchAndRemoveBulletinFromArray: passingTest:", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v20 = buf;
  v21 = 0x3032000000;
  v22 = sub_10013EF60;
  v23 = sub_10013EF70;
  v24 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10013F1B4;
  v15[3] = &unk_1002C4CA0;
  v11 = v6;
  v16 = v11;
  v12 = v8;
  v17 = v12;
  v18 = buf;
  -[GKAcceptedInviteManager performSync:](self, "performSync:", v15);
  v13 = *((id *)v20 + 5);

  _Block_object_dispose(buf, 8);
  return v13;
}

- (void)addMultiplayerInvite:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSMutableArray *queuedCancelledMultiplayerInviteSessionTokens;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager addMultiplayerInvite:", buf, 2u);
  }
  queuedCancelledMultiplayerInviteSessionTokens = self->_queuedCancelledMultiplayerInviteSessionTokens;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10013F434;
  v14[3] = &unk_1002C4CC8;
  v9 = v5;
  v15 = v9;
  v10 = objc_claimAutoreleasedReturnValue(-[GKAcceptedInviteManager _fetchObjectFromArray:passingTest:](self, "_fetchObjectFromArray:passingTest:", queuedCancelledMultiplayerInviteSessionTokens, v14));
  v11 = (void *)v10;
  if (v10)
  {
    if (!os_log_GKGeneral)
      v12 = (id)GKOSLoggers(v10);
    v13 = os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager remove a queuedCancelledMultiplayerInviteSessionToken: %@", buf, 0xCu);
    }
    -[GKAcceptedInviteManager removeAndReturnQueuedCancelledInviteWithSessionToken:](self, "removeAndReturnQueuedCancelledInviteWithSessionToken:", v11);
  }
  -[GKAcceptedInviteManager _insertBulletin:atFrontOfArray:](self, "_insertBulletin:atFrontOfArray:", v9, self->_acceptedMultiplayerInvites);

}

- (void)declineMultiplayerInvite:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager declineMultiplayerInvite:", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "declineReason"));

  if (v8)
  {
    -[GKAcceptedInviteManager addMultiplayerInvite:](self, "addMultiplayerInvite:", v5);
  }
  else
  {
    if (!os_log_GKGeneral)
      v10 = (id)GKOSLoggers(v9);
    v11 = os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Cannot add a multiplayer invite as a declined invite if there is no declineReason set!", v12, 2u);
    }
  }

}

- (void)queueCancelledMultiplayerInviteSessionToken:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager queueCancelledMultiplayerInvite:", v8, 2u);
  }
  -[GKAcceptedInviteManager _insertBulletin:atFrontOfArray:](self, "_insertBulletin:atFrontOfArray:", v5, self->_queuedCancelledMultiplayerInviteSessionTokens);

}

- (void)addTurnBasedEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager addTurnBasedEvent:", v8, 2u);
  }
  -[GKAcceptedInviteManager _addBulletin:toArray:](self, "_addBulletin:toArray:", v5, self->_acceptedTurnBased);

}

- (id)removeAndReturnInviteWithSessionToken:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSMutableArray *acceptedMultiplayerInvites;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager removeAndReturnInviteWithSessionToken:", buf, 2u);
  }
  acceptedMultiplayerInvites = self->_acceptedMultiplayerInvites;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10013F7EC;
  v12[3] = &unk_1002C4CF0;
  v13 = v5;
  v9 = v5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKAcceptedInviteManager _fetchAndRemoveBulletinFromArray:passingTest:](self, "_fetchAndRemoveBulletinFromArray:passingTest:", acceptedMultiplayerInvites, v12));

  return v10;
}

- (BOOL)removeAndReturnQueuedCancelledInviteWithSessionToken:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSMutableArray *queuedCancelledMultiplayerInviteSessionTokens;
  id v9;
  void *v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager removeAndReturnQueuedCancelledInviteWithSessionToken:", buf, 2u);
  }
  queuedCancelledMultiplayerInviteSessionTokens = self->_queuedCancelledMultiplayerInviteSessionTokens;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10013F92C;
  v13[3] = &unk_1002C4CC8;
  v14 = v5;
  v9 = v5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKAcceptedInviteManager _fetchAndRemoveBulletinFromArray:passingTest:](self, "_fetchAndRemoveBulletinFromArray:passingTest:", queuedCancelledMultiplayerInviteSessionTokens, v13));
  v11 = v10 != 0;

  return v11;
}

- (id)removeAndReturnTurnBasedInviteWithMatchID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSMutableArray *acceptedTurnBased;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager removeAndReturnTurnBasedInviteWithMatchID:", buf, 2u);
  }
  acceptedTurnBased = self->_acceptedTurnBased;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10013FA30;
  v12[3] = &unk_1002C4D18;
  v13 = v5;
  v9 = v5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKAcceptedInviteManager _fetchAndRemoveBulletinFromArray:passingTest:](self, "_fetchAndRemoveBulletinFromArray:passingTest:", acceptedTurnBased, v12));

  return v10;
}

- (id)multiplayerInviteForGame:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint8_t v11[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager multiplayerInviteForGame:", v11, 2u);
  }
  v8 = objc_msgSend(objc_alloc((Class)GKGameDescriptor), "initWithDictionary:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKAcceptedInviteManager multiplayerInviteForGameDescriptor:](self, "multiplayerInviteForGameDescriptor:", v8));

  return v9;
}

- (id)multiplayerInviteForGameDescriptor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL8 v8;
  id v9;
  NSObject *v10;
  NSMutableArray *acceptedMultiplayerInvites;
  NSMutableArray *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  NSMutableArray *v19;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  v8 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager multiplayerInviteForGameDescriptor:", buf, 2u);
  }
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v8);
  v10 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    acceptedMultiplayerInvites = self->_acceptedMultiplayerInvites;
    *(_DWORD *)buf = 138412290;
    v19 = acceptedMultiplayerInvites;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager - accepted invite bulletins %@", buf, 0xCu);
  }
  v12 = self->_acceptedMultiplayerInvites;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10013FCC8;
  v16[3] = &unk_1002C4CF0;
  v17 = v5;
  v13 = v5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKAcceptedInviteManager _fetchAndRemoveBulletinFromArray:passingTest:](self, "_fetchAndRemoveBulletinFromArray:passingTest:", v12, v16));

  return v14;
}

- (id)turnBasedInviteForGame:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint8_t v11[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager turnBasedInviteForGame:", v11, 2u);
  }
  v8 = objc_msgSend(objc_alloc((Class)GKGameDescriptor), "initWithDictionary:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKAcceptedInviteManager turnBasedInviteForGameDescriptor:](self, "turnBasedInviteForGameDescriptor:", v8));

  return v9;
}

- (id)turnBasedInviteForGameDescriptor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSMutableArray *acceptedTurnBased;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager turnBasedInviteForGameDescriptor:", buf, 2u);
  }
  acceptedTurnBased = self->_acceptedTurnBased;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10013FE98;
  v12[3] = &unk_1002C4D40;
  v13 = v5;
  v9 = v5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKAcceptedInviteManager _fetchAndRemoveBulletinFromArray:passingTest:](self, "_fetchAndRemoveBulletinFromArray:passingTest:", acceptedTurnBased, v12));

  return v10;
}

- (id)description
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_10013EF60;
  v9 = sub_10013EF70;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10013FF68;
  v4[3] = &unk_1002BE9C0;
  v4[4] = self;
  v4[5] = &v5;
  -[GKAcceptedInviteManager performSync:](self, "performSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (NSMutableArray)acceptedMultiplayerInvites
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAcceptedMultiplayerInvites:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableArray)queuedCancelledMultiplayerInviteSessionTokens
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueuedCancelledMultiplayerInviteSessionTokens:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableArray)acceptedTurnBased
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAcceptedTurnBased:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptedTurnBased, 0);
  objc_storeStrong((id *)&self->_queuedCancelledMultiplayerInviteSessionTokens, 0);
  objc_storeStrong((id *)&self->_acceptedMultiplayerInvites, 0);
}

@end
