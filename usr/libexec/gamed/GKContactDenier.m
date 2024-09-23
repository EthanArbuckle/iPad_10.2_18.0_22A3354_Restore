@implementation GKContactDenier

- (void)denyContact:(id)a3 replyQueue:(id)a4 handler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  id v12;
  NSObject *v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD);
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD))v10;
  if (!os_log_GKGeneral)
    v12 = (id)GKOSLoggers(v10);
  v13 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[GKContactDenier denyContact:replyQueue:handler:]";
    v21 = 2112;
    v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Attempting to deny contact: %@", buf, 0x16u);
  }
  if (v8)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D42C0;
    block[3] = &unk_1002BB568;
    v16 = (id)objc_claimAutoreleasedReturnValue(-[GKContactDenier friendSuggestionsDenyListLocation](self, "friendSuggestionsDenyListLocation"));
    v17 = v8;
    v18 = v11;
    v14 = v16;
    dispatch_async(v9, block);

  }
  else
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("gamed"), 17, 0));
    ((void (**)(_QWORD, id))v11)[2](v11, v14);
  }

}

- (id)denyListLocation:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = a3;
  v4 = GKInsecureCacheRoot(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", v3));

  v8 = GKInsecureCacheRoot(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (id)gkEnsureDirectory(v9);

  return v6;
}

- (void)clearFriendSuggestionsDenyList
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D4400;
  block[3] = &unk_1002BBBD8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)deniedContactIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactDenier friendSuggestionsDenyListLocation](self, "friendSuggestionsDenyListLocation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v2));

  v10 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", v3, &v10));
  v5 = v10;
  v6 = v5;
  if (v5)
  {
    if (!os_log_GKGeneral)
      v7 = (id)GKOSLoggers(v5);
    v8 = os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
      sub_1000D4538((uint64_t)v6, v8);
  }

  return v4;
}

- (id)friendSuggestionsDenyListLocation
{
  return -[GKContactDenier denyListLocation:](self, "denyListLocation:", CFSTR("friendSuggestionsDenyList.plist"));
}

@end
