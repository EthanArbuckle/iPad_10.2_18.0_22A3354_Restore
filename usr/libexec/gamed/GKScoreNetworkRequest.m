@implementation GKScoreNetworkRequest

+ (id)bagKey
{
  return CFSTR("gk-submit-scores");
}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5
{
  -[GKScoreNetworkRequest handleNetworkRequest:session:clientProxy:previousKnownPendingAmount:](self, "handleNetworkRequest:session:clientProxy:previousKnownPendingAmount:", a3, a4, a5, 0);
}

- (GKScoreNetworkRequest)initWithTask:(id)a3
{
  id v4;
  GKScoreNetworkRequest *v5;
  GKScoreNetworkRequest *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKScoreNetworkRequest;
  v5 = -[GKScoreNetworkRequest init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[GKScoreNetworkRequest setNsurlTask:](v5, "setNsurlTask:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager dictionaryFromTaskDescription:](GKNetworkRequestManager, "dictionaryFromTaskDescription:", v4));
    -[GKScoreNetworkRequest updateWithTaskInfo:](v6, "updateWithTaskInfo:", v7);

  }
  return v6;
}

- (GKScoreNetworkRequest)initWithScores:(id)a3 bundleID:(id)a4 eligibleChallenges:(id)a5
{
  id v8;
  id v9;
  id v10;
  GKScoreNetworkRequest *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)GKScoreNetworkRequest;
  v11 = -[GKScoreNetworkRequest init](&v30, "init");
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
    -[GKScoreNetworkRequest setUuid:](v11, "setUuid:", v13);

    v14 = _localPlayerID();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[GKScoreNetworkRequest setPlayerID:](v11, "setPlayerID:", v15);

    -[GKScoreNetworkRequest setBundleID:](v11, "setBundleID:", v9);
    v16 = objc_alloc_init((Class)NSMutableDictionary);
    -[GKScoreNetworkRequest setRequestData:](v11, "setRequestData:", v16);

    v17 = objc_alloc_init((Class)NSMutableSet);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest requestData](v11, "requestData"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("RequestDataKey"));

    -[GKScoreNetworkRequest setChallengeIDs:](v11, "setChallengeIDs:", v10);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v19 = v8;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v27;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v27 != v22)
            objc_enumerationMutation(v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v23), "serverRepresentation", (_QWORD)v26));
          objc_msgSend(v17, "addObject:", v24);

          v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v21);
    }

  }
  return v11;
}

- (int64_t)numberOfRequests
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest requestData](self, "requestData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("RequestDataKey")));

  v4 = objc_msgSend(v3, "count");
  return (int64_t)v4;
}

- (id)postBody
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest requestData](self, "requestData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RequestDataKey")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("scores"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest challengeIDs](self, "challengeIDs"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("eligible-challenges"));

  return v3;
}

- (void)removeFromStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentTasks"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest bundleID](self, "bundleID"));
  objc_msgSend(v5, "removeObjectForKey:", v6);

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pendingRequests"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest bundleID](self, "bundleID"));
  objc_msgSend(v8, "removeObjectForKey:", v7);

}

- (id)taskInfo
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest playerID](self, "playerID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("PlayerIDKey"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest requestData](self, "requestData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RequestDataKey")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("RequestDataKey"));

  v9 = objc_msgSend((id)objc_opt_class(self, v8), "bagKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("BagKeyKey"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest uuid](self, "uuid"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("UUIDKey"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest bundleID](self, "bundleID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("BundleIDKey"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest challengeIDs](self, "challengeIDs"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("challengesIDKey"));

  return v3;
}

- (void)addInRequestData:(id *)a3 additional:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v6 = *a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RequestDataKey")));

  if (v8)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RequestDataKey")));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RequestDataKey")));
    objc_msgSend(v9, "unionSet:", v12);

  }
  else
  {
    v10 = objc_msgSend(v7, "copy");

    v11 = v10;
    *a3 = v11;
  }
}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5 previousKnownPendingAmount:(int64_t)a6
{
  handleCoalescingRequest(self, a5, a3, a6, a4);
}

- (void)updateWithTaskInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[GKScoreNetworkRequest setCoalescingAgent:](self, "setCoalescingAgent:", 0);
  -[GKScoreNetworkRequest setIssueRequests:](self, "setIssueRequests:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UUIDKey")));
  -[GKScoreNetworkRequest setUuid:](self, "setUuid:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PlayerIDKey")));
  -[GKScoreNetworkRequest setPlayerID:](self, "setPlayerID:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BundleIDKey")));
  -[GKScoreNetworkRequest setBundleID:](self, "setBundleID:", v7);

  v8 = objc_alloc_init((Class)NSMutableDictionary);
  -[GKScoreNetworkRequest setRequestData:](self, "setRequestData:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("challengesIDKey")));
  -[GKScoreNetworkRequest setChallengeIDs:](self, "setChallengeIDs:", v9);

  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RequestDataKey")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v12));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest requestData](self, "requestData"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("RequestDataKey"));

}

+ (int64_t)coalescingDelay
{
  return 3;
}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest playerID](self, "playerID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest requestData](self, "requestData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKScoreNetworkRequest challengeIDs](self, "challengeIDs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: PlayerID: %@ Scores: %@ challengeIDs: %@"), v3, v4, v6, v7));

  return (NSString *)v8;
}

- (NSString)bundleID
{
  return self->bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->bundleID, a3);
}

- (BOOL)currentlyRunning
{
  return self->currentlyRunning;
}

- (void)setCurrentlyRunning:(BOOL)a3
{
  self->currentlyRunning = a3;
}

- (BOOL)issueRequests
{
  return self->issueRequests;
}

- (void)setIssueRequests:(BOOL)a3
{
  self->issueRequests = a3;
}

- (NSMutableURLRequest)nsurlRequest
{
  return self->nsurlRequest;
}

- (void)setNsurlRequest:(id)a3
{
  objc_storeStrong((id *)&self->nsurlRequest, a3);
}

- (NSURLSessionTask)nsurlTask
{
  return self->nsurlTask;
}

- (void)setNsurlTask:(id)a3
{
  objc_storeStrong((id *)&self->nsurlTask, a3);
}

- (NSString)playerID
{
  return self->playerID;
}

- (void)setPlayerID:(id)a3
{
  objc_storeStrong((id *)&self->playerID, a3);
}

- (NSMutableDictionary)requestData
{
  return self->requestData;
}

- (void)setRequestData:(id)a3
{
  objc_storeStrong((id *)&self->requestData, a3);
}

- (NSString)uuid
{
  return self->uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->uuid, a3);
}

- (NSArray)challengeIDs
{
  return self->challengeIDs;
}

- (void)setChallengeIDs:(id)a3
{
  objc_storeStrong((id *)&self->challengeIDs, a3);
}

- (BOOL)coalescingAgent
{
  return self->coalescingAgent;
}

- (void)setCoalescingAgent:(BOOL)a3
{
  self->coalescingAgent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->challengeIDs, 0);
  objc_storeStrong((id *)&self->uuid, 0);
  objc_storeStrong((id *)&self->requestData, 0);
  objc_storeStrong((id *)&self->playerID, 0);
  objc_storeStrong((id *)&self->nsurlTask, 0);
  objc_storeStrong((id *)&self->nsurlRequest, 0);
  objc_storeStrong((id *)&self->bundleID, 0);
}

@end
