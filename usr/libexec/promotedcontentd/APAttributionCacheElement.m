@implementation APAttributionCacheElement

- (APAttributionCacheElement)initWith:(id)a3 andToken:(id)a4 andAppTrackingStatus:(BOOL)a5 andToroID:(id)a6
{
  id v11;
  id v12;
  id v13;
  APAttributionCacheElement *v14;
  APAttributionCacheElement *v15;
  void *v16;
  double v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)APAttributionCacheElement;
  v14 = -[APAttributionCacheElement init](&v19, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_bundleID, a3);
    objc_storeStrong((id *)&v15->_token, a4);
    v15->_appAdTrackingStatus = a5;
    objc_storeStrong((id *)&v15->_toroID, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v16, "timeIntervalSince1970");
    v15->_timestamp = v17;

  }
  return v15;
}

+ (id)elementWithToken:(id)a3 andBundle:(id)a4 andAppTrackingStatus:(BOOL)a5 andToroID:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;
  APAttributionCacheElement *v12;

  v7 = a5;
  v9 = a4;
  v10 = a6;
  v11 = a3;
  +[APAttributionCacheElement cacheStore](APAttributionCacheElement, "cacheStore");
  v12 = -[APAttributionCacheElement initWith:andToken:andAppTrackingStatus:andToroID:]([APAttributionCacheElement alloc], "initWith:andToken:andAppTrackingStatus:andToroID:", v9, v11, v7, v10);

  if (v12)
  {
    objc_msgSend((id)qword_100268878, "lock");
    objc_msgSend((id)qword_100268880, "setObject:forKey:", v12, v9);
    objc_msgSend((id)qword_100268878, "unlock");
  }
  +[APAttributionCacheElement cleanCache](APAttributionCacheElement, "cleanCache");

  return v12;
}

+ (id)cachedElementForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  +[APAttributionCacheElement cacheStore](APAttributionCacheElement, "cacheStore");
  objc_msgSend((id)qword_100268878, "lock");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100268880, "objectForKeyedSubscript:", v3));

  if (v4)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100268880, "objectForKeyedSubscript:", v3));
  objc_msgSend((id)qword_100268878, "unlock");

  return v4;
}

+ (void)cacheStore
{
  if (qword_100268888[0] != -1)
    dispatch_once(qword_100268888, &stru_100213590);
}

- (BOOL)isExpired
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  BOOL v16;

  objc_msgSend((id)qword_100268878, "lock");
  v3 = (void *)qword_100268880;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionCacheElement bundleID](self, "bundleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v6, "timeIntervalSince1970");
    v8 = v7;
    v9 = (void *)qword_100268880;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionCacheElement bundleID](self, "bundleID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));
    objc_msgSend(v11, "timestamp");
    v13 = v8 - v12;

    if (v13 <= 300.0)
    {
      v16 = 0;
      goto LABEL_6;
    }
    v14 = (void *)qword_100268880;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionCacheElement bundleID](self, "bundleID"));
    objc_msgSend(v14, "removeObjectForKey:", v15);

  }
  v16 = 1;
LABEL_6:
  objc_msgSend((id)qword_100268878, "unlock");
  return v16;
}

- (BOOL)didAppTrackingStateChange:(BOOL)a3
{
  unsigned int v4;
  void *v5;
  void *v6;

  v4 = -[APAttributionCacheElement appAdTrackingStatus](self, "appAdTrackingStatus") ^ a3;
  if (v4 == 1)
  {
    objc_msgSend((id)qword_100268878, "lock");
    v5 = (void *)qword_100268880;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionCacheElement bundleID](self, "bundleID"));
    objc_msgSend(v5, "removeObjectForKey:", v6);

    objc_msgSend((id)qword_100268878, "unlock");
  }
  return v4;
}

- (BOOL)didToroIDChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  BOOL v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[APAttributionCacheElement toroID](self, "toroID"));
  if (v5
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionCacheElement toroID](self, "toroID")),
        v8 = objc_msgSend(v7, "isEqual:", v4),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    v9 = 0;
  }
  else
  {
    +[APAttributionCacheElement clearCache](APAttributionCacheElement, "clearCache");
    v9 = 1;
  }

  return v9;
}

- (BOOL)checkExpiry
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  BOOL v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;
  v6 = (void *)qword_100268880;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APAttributionCacheElement bundleID](self, "bundleID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v7));
  objc_msgSend(v8, "timestamp");
  v10 = v5 - v9 > 300.0;

  return v10;
}

- (BOOL)isValidCheckWithToroID:(id)a3 andTrackingStatus:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  if (-[APAttributionCacheElement didToroIDChange:](self, "didToroIDChange:", a3)
    || -[APAttributionCacheElement didAppTrackingStateChange:](self, "didAppTrackingStateChange:", v4))
  {
    return 0;
  }
  else
  {
    return !-[APAttributionCacheElement isExpired](self, "isExpired");
  }
}

+ (void)cleanCache
{
  void *v2;
  void *v3;
  id v4;
  __int128 v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  _BYTE v23[128];

  objc_msgSend((id)qword_100268878, "lock");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100268880, "allKeys"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v16;
    *(_QWORD *)&v5 = 136643075;
    v14 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100268880, "objectForKeyedSubscript:", v9, v14));
        v11 = objc_msgSend(v10, "checkExpiry");

        if (v11)
        {
          v12 = APLogForCategory(4);
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v14;
            v20 = "+[APAttributionCacheElement cleanCache]";
            v21 = 2114;
            v22 = v9;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{sensitive}s Removing expired token from bundleID %{public}@", buf, 0x16u);
          }

          objc_msgSend(v2, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v6);
  }

  objc_msgSend((id)qword_100268880, "removeObjectsForKeys:", v2);
  objc_msgSend((id)qword_100268878, "unlock");

}

+ (void)clearCache
{
  objc_msgSend((id)qword_100268878, "lock");
  objc_msgSend((id)qword_100268880, "removeAllObjects");
  objc_msgSend((id)qword_100268878, "unlock");
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (NSUUID)toroID
{
  return self->_toroID;
}

- (void)setToroID:(id)a3
{
  objc_storeStrong((id *)&self->_toroID, a3);
}

- (BOOL)appAdTrackingStatus
{
  return self->_appAdTrackingStatus;
}

- (void)setAppAdTrackingStatus:(BOOL)a3
{
  self->_appAdTrackingStatus = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toroID, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
