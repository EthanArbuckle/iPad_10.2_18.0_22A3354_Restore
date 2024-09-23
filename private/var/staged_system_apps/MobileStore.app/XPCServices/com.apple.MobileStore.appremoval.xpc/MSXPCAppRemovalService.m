@implementation MSXPCAppRemovalService

- (void)removeAppWithReply:(id)a3
{
  void (**v4)(id, void *);
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = (void (**)(id, void *))a3;
  v5 = OS_LOG_XPCAPPREMOVAL();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000036F8(v6, v7, v8, v9, v10, v11, v12, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSXPCAppRemovalService _deleteAllUserDefaults](self, "_deleteAllUserDefaults"));
  v15 = OS_LOG_XPCAPPREMOVAL();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
  if (v14)
  {
    if (v17)
      sub_100003694((uint64_t)v14, v16, v19, v20, v21, v22, v23, v24);
  }
  else if (v17)
  {
    sub_100003624(v16, v18, v19, v20, v21, v22, v23, v24);
  }

  v4[2](v4, v14);
}

- (id)_deleteAllUserDefaults
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  NSErrorUserInfoKey v19;
  const __CFString *v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE v23[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dictionaryRepresentation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v8);
        v10 = OS_LOG_XPCAPPREMOVAL();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v9;
          _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Removing user default key: %@", buf, 0xCu);
        }

        objc_msgSend(v2, "removeObjectForKey:", v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v6);
  }

  if ((objc_msgSend(v2, "synchronize") & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v19 = NSLocalizedDescriptionKey;
    v20 = CFSTR("Unable to synchronize NSUserDefaults for AppRemoval.");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.MobileStore.appremoval.errorDomain"), -1, v13));

  }
  return v12;
}

@end
