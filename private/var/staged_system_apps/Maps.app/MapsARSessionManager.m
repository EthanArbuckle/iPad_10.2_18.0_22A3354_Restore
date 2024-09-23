@implementation MapsARSessionManager

+ (MapsARSessionManager)sharedManager
{
  if (qword_1014D39D8 != -1)
    dispatch_once(&qword_1014D39D8, &stru_1011DBE18);
  return (MapsARSessionManager *)(id)qword_1014D39D0;
}

- (MapsARSessionManager)init
{
  MapsARSessionManager *v2;
  uint64_t v3;
  NSPointerArray *sessionOwners;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MapsARSessionManager;
  v2 = -[MapsARSessionManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSPointerArray pointerArrayWithOptions:](NSPointerArray, "pointerArrayWithOptions:", 2));
    sessionOwners = v2->_sessionOwners;
    v2->_sessionOwners = (NSPointerArray *)v3;

  }
  return v2;
}

- (ARSession)session
{
  ARSession *session;
  ARSession *v4;
  ARSession *v5;
  ARSessionDebugLogger *v6;
  ARSessionDebugLogger *debugLogger;

  session = self->_session;
  if (!session)
  {
    v4 = (ARSession *)objc_alloc_init((Class)ARSession);
    v5 = self->_session;
    self->_session = v4;

    v6 = -[ARSessionDebugLogger initWithSession:]([ARSessionDebugLogger alloc], "initWithSession:", self->_session);
    debugLogger = self->_debugLogger;
    self->_debugLogger = v6;

    session = self->_session;
  }
  return session;
}

- (void)requestSessionWithOwner:(id)a3
{
  char *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  char *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  int v16;
  const char *v17;
  __int16 v18;
  char *v19;

  v4 = (char *)a3;
  v5 = sub_100912970();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ is requesting session ownership", (uint8_t *)&v16, 0xCu);
    }

    v7 = objc_claimAutoreleasedReturnValue(-[MapsARSessionManager sessionOwners](self, "sessionOwners"));
    objc_sync_enter(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsARSessionManager sessionOwners](self, "sessionOwners"));
    v9 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_maps_lastObject"));

    if (v9 == v4)
    {
      v15 = sub_100912970();
      v14 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412546;
        v17 = v4;
        v18 = 2112;
        v19 = v4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Current session owner (%@) is equal to the requesting session owner (%@); ignoring",
          (uint8_t *)&v16,
          0x16u);
      }
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsARSessionManager sessionOwners](self, "sessionOwners"));
      objc_msgSend(v10, "_maps_moveOrAddObjectToTop:", v4);

      v11 = sub_100912970();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412546;
        v17 = v9;
        v18 = 2112;
        v19 = v4;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Session ownership transitioned from %@ to %@", (uint8_t *)&v16, 0x16u);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsARSessionManager session](self, "session"));
      objc_msgSend(v9, "sessionManager:didResignSessionOwnership:", self, v13);

      v14 = objc_claimAutoreleasedReturnValue(-[MapsARSessionManager session](self, "session"));
      objc_msgSend(v4, "sessionManager:didGainSessionOwnership:", self, v14);
    }

    objc_sync_exit(v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v16 = 136315138;
    v17 = "-[MapsARSessionManager requestSessionWithOwner:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s cannot be called with a nil owner", (uint8_t *)&v16, 0xCu);
  }

}

- (void)resignSessionWithOwner:(id)a3
{
  NSObject *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  const char *v22;
  __int16 v23;
  NSObject *v24;

  v4 = a3;
  v5 = sub_100912970();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = (const char *)v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ is resigning session ownership", (uint8_t *)&v21, 0xCu);
    }

    v7 = objc_claimAutoreleasedReturnValue(-[MapsARSessionManager sessionOwners](self, "sessionOwners"));
    objc_sync_enter(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsARSessionManager sessionOwners](self, "sessionOwners"));
    v9 = objc_msgSend(v8, "_maps_containsObject:", v4);

    if ((v9 & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsARSessionManager sessionOwners](self, "sessionOwners"));
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_maps_lastObject"));

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsARSessionManager sessionOwners](self, "sessionOwners"));
      objc_msgSend(v12, "_maps_removeObject:", v4);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsARSessionManager sessionOwners](self, "sessionOwners"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_maps_lastObject"));

      v15 = sub_100912970();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138412546;
        v22 = (const char *)v11;
        v23 = 2112;
        v24 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Session ownership transitioned from %@ to %@", (uint8_t *)&v21, 0x16u);
      }

      if (v11 == v4)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsARSessionManager session](self, "session"));
        -[NSObject sessionManager:didResignSessionOwnership:](v4, "sessionManager:didResignSessionOwnership:", self, v17);

      }
      if (v14 != v11)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsARSessionManager session](self, "session"));
        -[NSObject sessionManager:didGainSessionOwnership:](v14, "sessionManager:didGainSessionOwnership:", self, v18);

      }
      if (!v14)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsARSessionManager session](self, "session"));
        objc_msgSend(v19, "pause");

      }
    }
    else
    {
      v20 = sub_100912970();
      v11 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138412290;
        v22 = (const char *)v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Resigning session owner (%@) isn't part of the current session owners; ignoring",
          (uint8_t *)&v21,
          0xCu);
      }
    }

    objc_sync_exit(v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v21 = 136315138;
    v22 = "-[MapsARSessionManager resignSessionWithOwner:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s cannot be called with a nil owner", (uint8_t *)&v21, 0xCu);
  }

}

- (id)allSessionOwners
{
  void *v3;
  void *v4;
  unint64_t i;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsARSessionManager sessionOwners](self, "sessionOwners"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  for (i = 0; ; ++i)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsARSessionManager sessionOwners](self, "sessionOwners"));
    v7 = objc_msgSend(v6, "count");

    if (i >= (unint64_t)v7)
      break;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsARSessionManager sessionOwners](self, "sessionOwners"));
    objc_initWeak(&location, objc_msgSend(v8, "pointerAtIndex:", i));

    v9 = objc_loadWeakRetained(&location);
    if (v9)
      objc_msgSend(v4, "addObject:", v9);

    objc_destroyWeak(&location);
  }
  v10 = objc_msgSend(v4, "copy");

  objc_sync_exit(v3);
  return v10;
}

- (id)currentSessionOwner
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsARSessionManager sessionOwners](self, "sessionOwners"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsARSessionManager sessionOwners](self, "sessionOwners"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_lastObject"));

  objc_sync_exit(v3);
  return v5;
}

- (NSPointerArray)sessionOwners
{
  return self->_sessionOwners;
}

- (void)setSessionOwners:(id)a3
{
  objc_storeStrong((id *)&self->_sessionOwners, a3);
}

- (ARSessionDebugLogger)debugLogger
{
  return self->_debugLogger;
}

- (void)setDebugLogger:(id)a3
{
  objc_storeStrong((id *)&self->_debugLogger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugLogger, 0);
  objc_storeStrong((id *)&self->_sessionOwners, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
