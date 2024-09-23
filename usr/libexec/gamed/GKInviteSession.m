@implementation GKInviteSession

- (GKInviteSession)init
{
  GKInviteSession *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *syncQueue;
  NSMutableDictionary *v7;
  NSMutableDictionary *invitees;
  NSArray *v9;
  NSArray *responses;
  NSMutableArray *v11;
  NSMutableArray *invitedPlayers;
  NSMutableArray *v13;
  NSMutableArray *shareInvitees;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)GKInviteSession;
  v2 = -[GKInviteSession init](&v16, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.gamed.invitesession", v4);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 0);
    invitees = v2->_invitees;
    v2->_invitees = v7;

    v9 = (NSArray *)objc_alloc_init((Class)NSArray);
    responses = v2->_responses;
    v2->_responses = v9;

    v11 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
    invitedPlayers = v2->_invitedPlayers;
    v2->_invitedPlayers = v11;

    v13 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
    shareInvitees = v2->_shareInvitees;
    v2->_shareInvitees = v13;

  }
  return v2;
}

- (GKInviteSession)initWithSessionToken:(id)a3
{
  id v5;
  GKInviteSession *v6;
  GKInviteSession *v7;

  v5 = a3;
  v6 = -[GKInviteSession init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sessionToken, a3);

  return v7;
}

- (void)performAsync:(id)a3
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
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKInviteSession: performAsync", v8, 2u);
  }
  dispatch_async((dispatch_queue_t)self->_syncQueue, v5);

}

- (void)performSync:(id)a3
{
  dispatch_sync((dispatch_queue_t)self->_syncQueue, a3);
}

- (void)addInvitee:(id)a3 reference:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "playerID"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_invitees, "objectForKey:", v7));
    if (v8)
    {
      if (!v6)
      {
LABEL_5:

        goto LABEL_6;
      }
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", 0));
      -[NSMutableDictionary setObject:forKey:](self->_invitees, "setObject:forKey:", v8, v7);
      -[NSMutableArray addObject:](self->_invitedPlayers, "addObject:", v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("inviteInvitee.%@"), v7));
      objc_msgSend(v9, "beginTransaction:", v10);

      if (!v6)
        goto LABEL_5;
    }
    objc_msgSend(v8, "addObject:", v6);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)removeInvitee:(id)a3 reference:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  _BOOL8 v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  _BOOL8 v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = (void *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "debugDescription"));
    *(_DWORD *)buf = 138412546;
    v41 = v12;
    v42 = 2112;
    v43 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "GKInviteSession: removeInvitee: %@ refrence: %@", buf, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playerID"));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_invitees, "objectForKey:", v13));
    v15 = v14;
    if (v14)
    {
      if (!v8 || (objc_msgSend(v14, "removeObject:", v8), !objc_msgSend(v15, "count")))
      {
        -[NSMutableDictionary removeObjectForKey:](self->_invitees, "removeObjectForKey:", v13);
        v16 = -[NSMutableArray removeObject:](self->_invitedPlayers, "removeObject:", v6);
        if (!os_log_GKGeneral)
          v17 = (id)GKOSLoggers(v16);
        v18 = os_log_GKTrace;
        if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "GKInviteSession: removeInvitee: reference exist and player has been removed from _invitees/_invitedPlayers", buf, 2u);
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("inviteInvitee.%@"), v13));
        objc_msgSend(v19, "endTransaction:", v20);

      }
    }
    v21 = -[NSMutableDictionary count](self->_invitees, "count");
    if (v21 || (v21 = -[NSMutableArray count](self->_shareInvitees, "count")) != 0)
    {
      if (!os_log_GKGeneral)
        v22 = (id)GKOSLoggers(v21);
      v23 = (void *)os_log_GKMatch;
      v24 = os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO);
      if (v24)
      {
        v25 = v23;
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKInviteSession sessionToken](self, "sessionToken"));
        *(_DWORD *)buf = 138412290;
        v41 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "GKInviteSession - Still have invitees in invite session, %@", buf, 0xCu);

      }
      if (!os_log_GKGeneral)
        v27 = (id)GKOSLoggers(v24);
      v28 = (void *)os_log_GKMatch;
      v29 = os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO);
      if (v29)
      {
        v30 = v28;
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[GKInviteSession invitees](self, "invitees"));
        *(_DWORD *)buf = 138412290;
        v41 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "invitees %@", buf, 0xCu);

      }
      if (!os_log_GKGeneral)
        v32 = (id)GKOSLoggers(v29);
      v33 = (void *)os_log_GKMatch;
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        v34 = v33;
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[GKInviteSession shareInvitees](self, "shareInvitees"));
        *(_DWORD *)buf = 138412290;
        v41 = v35;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "shareInvitees %@", buf, 0xCu);

      }
    }
    else
    {
      if (!os_log_GKGeneral)
        v36 = (id)GKOSLoggers(0);
      v37 = (void *)os_log_GKMatch;
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        v38 = v37;
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[GKInviteSession sessionToken](self, "sessionToken"));
        *(_DWORD *)buf = 138412290;
        v41 = v39;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "No more invitees, clearing session token %@", buf, 0xCu);

      }
      -[GKInviteSession setSessionToken:](self, "setSessionToken:", 0);
    }

  }
}

- (id)referencesForInvitee:(id)a3
{
  NSMutableDictionary *invitees;
  void *v4;
  void *v5;

  invitees = self->_invitees;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "playerID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](invitees, "objectForKey:", v4));

  return v5;
}

- (id)allInvitees
{
  return +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", self->_invitedPlayers);
}

- (void)removeAllInvitees
{
  id v3;
  NSObject *v4;
  void *v5;
  NSMutableDictionary *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[16];
  _BYTE v18[128];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKInviteSession: removeAllInvitees", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_invitees;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "conciseDescription"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("inviteInvitee.%@"), v11));
        objc_msgSend(v5, "endTransaction:", v12);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v8);
  }

  -[NSMutableDictionary removeAllObjects](self->_invitees, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_invitedPlayers, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_shareInvitees, "removeAllObjects");

}

- (void)addResponse:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObject:](self->_responses, "arrayByAddingObject:", a3));
  -[GKInviteSession setResponses:](self, "setResponses:", v4);

}

- (void)removeAllResponses
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKInviteSession: removeAllResponses", v6, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  -[GKInviteSession setResponses:](self, "setResponses:", v5);

}

- (BOOL)shouldBeCleared
{
  id v3;
  id v4;
  NSObject *v5;
  _BOOL8 v6;
  id v7;
  NSObject *v8;
  _BOOL8 v9;
  NSMutableDictionary *invitees;
  id v11;
  NSObject *v12;
  _BOOL8 v13;
  NSMutableArray *shareInvitees;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  NSArray *responses;
  int v20;
  void *v21;

  v3 = -[NSMutableDictionary count](self->_invitees, "count");
  if (v3
    || (v3 = -[NSArray count](self->_responses, "count")) != 0
    || (v3 = -[NSMutableArray count](self->_shareInvitees, "count")) != 0)
  {
    if (!os_log_GKGeneral)
      v4 = (id)GKOSLoggers(v3);
    v5 = os_log_GKMatch;
    v6 = os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO);
    if (v6)
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKInviteSession - SHOULD NOT be cleared because still have items:", (uint8_t *)&v20, 2u);
    }
    if (!os_log_GKGeneral)
      v7 = (id)GKOSLoggers(v6);
    v8 = os_log_GKMatch;
    v9 = os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO);
    if (v9)
    {
      invitees = self->_invitees;
      v20 = 138412290;
      v21 = invitees;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "invitees %@", (uint8_t *)&v20, 0xCu);
    }
    if (!os_log_GKGeneral)
      v11 = (id)GKOSLoggers(v9);
    v12 = os_log_GKMatch;
    v13 = os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO);
    if (v13)
    {
      shareInvitees = self->_shareInvitees;
      v20 = 138412290;
      v21 = shareInvitees;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "shareInvitees %@", (uint8_t *)&v20, 0xCu);
    }
    if (!os_log_GKGeneral)
      v15 = (id)GKOSLoggers(v13);
    v16 = os_log_GKMatch;
    v17 = os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO);
    if (v17)
    {
      responses = self->_responses;
      v20 = 138412290;
      v21 = responses;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "responses %@", (uint8_t *)&v20, 0xCu);
      LOBYTE(v17) = 0;
    }
  }
  else
  {
    LOBYTE(v17) = 1;
  }
  return v17;
}

- (NSData)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
  objc_storeStrong((id *)&self->_sessionToken, a3);
}

- (NSMutableArray)shareInvitees
{
  return self->_shareInvitees;
}

- (void)setShareInvitees:(id)a3
{
  objc_storeStrong((id *)&self->_shareInvitees, a3);
}

- (CKRecordID)shareRecordID
{
  return self->_shareRecordID;
}

- (void)setShareRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_shareRecordID, a3);
}

- (NSArray)responses
{
  return self->_responses;
}

- (void)setResponses:(id)a3
{
  objc_storeStrong((id *)&self->_responses, a3);
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_syncQueue, a3);
}

- (NSMutableDictionary)invitees
{
  return self->_invitees;
}

- (void)setInvitees:(id)a3
{
  objc_storeStrong((id *)&self->_invitees, a3);
}

- (NSMutableArray)invitedPlayers
{
  return self->_invitedPlayers;
}

- (void)setInvitedPlayers:(id)a3
{
  objc_storeStrong((id *)&self->_invitedPlayers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitedPlayers, 0);
  objc_storeStrong((id *)&self->_invitees, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_responses, 0);
  objc_storeStrong((id *)&self->_shareRecordID, 0);
  objc_storeStrong((id *)&self->_shareInvitees, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
}

@end
