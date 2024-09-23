@implementation GKAchievementNetworkRequest

+ (id)bagKey
{
  return CFSTR("gk-submit-achievements");
}

+ (int64_t)coalescingDelay
{
  return 3;
}

- (GKAchievementNetworkRequest)initWithTask:(id)a3
{
  id v4;
  GKAchievementNetworkRequest *v5;
  GKAchievementNetworkRequest *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKAchievementNetworkRequest;
  v5 = -[GKAchievementNetworkRequest init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[GKAchievementNetworkRequest setNsurlTask:](v5, "setNsurlTask:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager dictionaryFromTaskDescription:](GKNetworkRequestManager, "dictionaryFromTaskDescription:", v4));
    -[GKAchievementNetworkRequest updateWithTaskInfo:](v6, "updateWithTaskInfo:", v7);

  }
  return v6;
}

- (GKAchievementNetworkRequest)initWithAchievements:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  GKAchievementNetworkRequest *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];

  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)GKAchievementNetworkRequest;
  v8 = -[GKAchievementNetworkRequest init](&v29, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
    -[GKAchievementNetworkRequest setUuid:](v8, "setUuid:", v10);

    v11 = _localPlayerID();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[GKAchievementNetworkRequest setPlayerID:](v8, "setPlayerID:", v12);

    -[GKAchievementNetworkRequest setBundleID:](v8, "setBundleID:", v7);
    v13 = objc_alloc_init((Class)NSMutableDictionary);
    -[GKAchievementNetworkRequest setRequestData:](v8, "setRequestData:", v13);

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v14 = v6;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier", (_QWORD)v25));

          if (v20)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "serverRepresentation"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementNetworkRequest requestData](v8, "requestData"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v23);

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v16);
    }

  }
  return v8;
}

- (int64_t)numberOfRequests
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementNetworkRequest requestData](self, "requestData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allKeys"));
  v4 = objc_msgSend(v3, "count");

  return (int64_t)v4;
}

- (void)updateWithTaskInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  -[GKAchievementNetworkRequest setCoalescingAgent:](self, "setCoalescingAgent:", 0);
  -[GKAchievementNetworkRequest setIssueRequests:](self, "setIssueRequests:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UUIDKey")));
  -[GKAchievementNetworkRequest setUuid:](self, "setUuid:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PlayerIDKey")));
  -[GKAchievementNetworkRequest setPlayerID:](self, "setPlayerID:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BundleIDKey")));
  -[GKAchievementNetworkRequest setBundleID:](self, "setBundleID:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RequestDataKey")));
  v9 = objc_alloc_init((Class)NSMutableDictionary);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("achievement-id"), (_QWORD)v17));
        if (v16)
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  -[GKAchievementNetworkRequest setRequestData:](self, "setRequestData:", v9);
}

- (void)addInRequestData:(id *)a3 additional:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[16];
  _BYTE v32[128];

  v5 = a4;
  if (v5)
  {
    v6 = *a3;
    if (v6)
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v24 = v5;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v28;
        v10 = CFSTR("achievement-id");
        do
        {
          v11 = 0;
          v25 = v8;
          do
          {
            if (*(_QWORD *)v28 != v9)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v10));
            if (v13)
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v13));

              if (v14)
              {
                v15 = v9;
                v16 = v10;
                v17 = v6;
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v13));
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("achievement-pct")));
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("achievement-pct")));
                v21 = objc_msgSend(v20, "longValue");
                if ((uint64_t)v21 > (uint64_t)objc_msgSend(v19, "longValue"))
                  objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, v13);

                v10 = v16;
                v9 = v15;
                v6 = v17;
                v8 = v25;
              }
              else
              {
                objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v13);
              }
            }

            v11 = (char *)v11 + 1;
          }
          while (v8 != v11);
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v8);
      }

      v5 = v24;
    }
    else
    {
      *a3 = objc_msgSend(v5, "copy");
    }

  }
  else
  {
    if (!os_log_GKGeneral)
      v22 = (id)GKOSLoggers(0);
    v23 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "GKScoreNetworkRequest no incoming data, skipping", buf, 2u);
    }
  }

}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5 previousKnownPendingAmount:(int64_t)a6
{
  handleCoalescingRequest(self, a5, a3, a6, a4);
}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5
{
  -[GKAchievementNetworkRequest handleNetworkRequest:session:clientProxy:previousKnownPendingAmount:](self, "handleNetworkRequest:session:clientProxy:previousKnownPendingAmount:", a3, a4, a5, 0);
}

- (id)postBody
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementNetworkRequest requestData](self, "requestData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("achievement-ids"));

  return v3;
}

- (void)removeFromStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint8_t v18[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentTasks"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementNetworkRequest bundleID](self, "bundleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  if (v7
    && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "requestData")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementNetworkRequest requestData](self, "requestData")),
        v11 = objc_msgSend(v9, "isEqualToDictionary:", v10),
        v10,
        v9,
        v11))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentTasks"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementNetworkRequest bundleID](self, "bundleID"));
    objc_msgSend(v12, "removeObjectForKey:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pendingRequests"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementNetworkRequest bundleID](self, "bundleID"));
    objc_msgSend(v14, "removeObjectForKey:", v15);

  }
  else
  {
    if (!os_log_GKGeneral)
      v16 = (id)GKOSLoggers(v8);
    v17 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "GKAchievementNetworkRequest task completed that was not the current active task, skipping clean up", v18, 2u);
    }
  }

}

- (id)taskInfo
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementNetworkRequest playerID](self, "playerID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("PlayerIDKey"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementNetworkRequest requestData](self, "requestData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("RequestDataKey"));

  v8 = objc_msgSend((id)objc_opt_class(self, v7), "bagKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("BagKeyKey"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementNetworkRequest uuid](self, "uuid"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("UUIDKey"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementNetworkRequest bundleID](self, "bundleID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("BundleIDKey"));

  return v3;
}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementNetworkRequest playerID](self, "playerID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[GKAchievementNetworkRequest numberOfRequests](self, "numberOfRequests")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: PlayerID: %@ Achievement Count: %@"), v3, v4, v5));

  return (NSString *)v6;
}

- (NSString)playerID
{
  return self->playerID;
}

- (void)setPlayerID:(id)a3
{
  objc_storeStrong((id *)&self->playerID, a3);
}

- (NSURLSessionTask)nsurlTask
{
  return self->nsurlTask;
}

- (void)setNsurlTask:(id)a3
{
  objc_storeStrong((id *)&self->nsurlTask, a3);
}

- (NSMutableURLRequest)nsurlRequest
{
  return self->nsurlRequest;
}

- (void)setNsurlRequest:(id)a3
{
  objc_storeStrong((id *)&self->nsurlRequest, a3);
}

- (BOOL)currentlyRunning
{
  return self->currentlyRunning;
}

- (void)setCurrentlyRunning:(BOOL)a3
{
  self->currentlyRunning = a3;
}

- (NSMutableDictionary)requestData
{
  return self->requestData;
}

- (void)setRequestData:(id)a3
{
  objc_storeStrong((id *)&self->requestData, a3);
}

- (NSString)bundleID
{
  return self->bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->bundleID, a3);
}

- (NSString)uuid
{
  return self->uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->uuid, a3);
}

- (BOOL)coalescingAgent
{
  return self->coalescingAgent;
}

- (void)setCoalescingAgent:(BOOL)a3
{
  self->coalescingAgent = a3;
}

- (BOOL)issueRequests
{
  return self->issueRequests;
}

- (void)setIssueRequests:(BOOL)a3
{
  self->issueRequests = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->uuid, 0);
  objc_storeStrong((id *)&self->bundleID, 0);
  objc_storeStrong((id *)&self->requestData, 0);
  objc_storeStrong((id *)&self->nsurlRequest, 0);
  objc_storeStrong((id *)&self->nsurlTask, 0);
  objc_storeStrong((id *)&self->playerID, 0);
}

@end
