@implementation GKInstanceScoreNetworkRequest

+ (id)bagKey
{
  return CFSTR("gk-submit-instance-score");
}

- (GKInstanceScoreNetworkRequest)initWithTask:(id)a3
{
  id v4;
  GKInstanceScoreNetworkRequest *v5;
  GKInstanceScoreNetworkRequest *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKInstanceScoreNetworkRequest;
  v5 = -[GKInstanceScoreNetworkRequest init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[GKInstanceScoreNetworkRequest setNsurlTask:](v5, "setNsurlTask:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager dictionaryFromTaskDescription:](GKNetworkRequestManager, "dictionaryFromTaskDescription:", v4));
    -[GKInstanceScoreNetworkRequest updateWithTaskInfo:](v6, "updateWithTaskInfo:", v7);

  }
  return v6;
}

- (void)updateWithTaskInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UUIDKey")));
  -[GKInstanceScoreNetworkRequest setUuid:](self, "setUuid:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PlayerIDKey")));
  -[GKInstanceScoreNetworkRequest setPlayerID:](self, "setPlayerID:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BundleIDKey")));
  -[GKInstanceScoreNetworkRequest setBundleID:](self, "setBundleID:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RequestDataKey")));
  -[GKInstanceScoreNetworkRequest setRequestData:](self, "setRequestData:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RequestValueKey")));
  -[GKInstanceScoreNetworkRequest setValue:](self, "setValue:", objc_msgSend(v9, "longValue"));

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RequestLeaderboardIDKey")));
  -[GKInstanceScoreNetworkRequest setLeaderboardID:](self, "setLeaderboardID:", v10);

}

- (GKInstanceScoreNetworkRequest)initWithInstanceScore:(id)a3 bundleID:(id)a4 challenges:(id)a5
{
  id v8;
  id v9;
  id v10;
  GKInstanceScoreNetworkRequest *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)GKInstanceScoreNetworkRequest;
  v11 = -[GKInstanceScoreNetworkRequest init](&v25, "init");
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
    -[GKInstanceScoreNetworkRequest setUuid:](v11, "setUuid:", v13);

    v14 = _localPlayerID();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[GKInstanceScoreNetworkRequest setPlayerID:](v11, "setPlayerID:", v15);

    -[GKInstanceScoreNetworkRequest setBundleID:](v11, "setBundleID:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverRepresentation"));
    v17 = objc_msgSend(v16, "mutableCopy");
    -[GKInstanceScoreNetworkRequest setRequestData:](v11, "setRequestData:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leaderboardIdentifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKInstanceScoreNetworkRequest requestData](v11, "requestData"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("leaderboard-id"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKInstanceScoreNetworkRequest playerID](v11, "playerID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKInstanceScoreNetworkRequest requestData](v11, "requestData"));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, CFSTR("player-id"));

    if (v10)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKInstanceScoreNetworkRequest requestData](v11, "requestData"));
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v10, CFSTR("challenges"));

    }
    -[GKInstanceScoreNetworkRequest setValue:](v11, "setValue:", objc_msgSend(v8, "value"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leaderboardIdentifier"));
    -[GKInstanceScoreNetworkRequest setLeaderboardID:](v11, "setLeaderboardID:", v23);

  }
  return v11;
}

- (BOOL)isDuplicateRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKInstanceScoreNetworkRequest requestData](self, "requestData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestData"));

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToDictionary:", v6);
  return (char)v4;
}

- (id)taskInfo
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKInstanceScoreNetworkRequest playerID](self, "playerID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("PlayerIDKey"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKInstanceScoreNetworkRequest requestData](self, "requestData"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("RequestDataKey"));

  v7 = objc_msgSend((id)objc_opt_class(self, v6), "bagKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("BagKeyKey"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKInstanceScoreNetworkRequest uuid](self, "uuid"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("UUIDKey"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKInstanceScoreNetworkRequest bundleID](self, "bundleID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("BundleIDKey"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[GKInstanceScoreNetworkRequest value](self, "value")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("RequestValueKey"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKInstanceScoreNetworkRequest leaderboardID](self, "leaderboardID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("RequestLeaderboardIDKey"));

  return v3;
}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5
{
  handleStandardRequest(self, a3, a4, a5);
}

- (id)requestIdentifier
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = networkRequestIdentifier(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKInstanceScoreNetworkRequest leaderboardID](self, "leaderboardID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[GKInstanceScoreNetworkRequest value](self, "value")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@"), v4, v5, v6));

  return v7;
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

- (NSString)uuid
{
  return self->uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->uuid, a3);
}

- (NSString)bundleID
{
  return self->bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->bundleID, a3);
}

- (NSMutableDictionary)requestData
{
  return self->requestData;
}

- (void)setRequestData:(id)a3
{
  objc_storeStrong((id *)&self->requestData, a3);
}

- (NSString)leaderboardID
{
  return self->leaderboardID;
}

- (void)setLeaderboardID:(id)a3
{
  objc_storeStrong((id *)&self->leaderboardID, a3);
}

- (int64_t)value
{
  return self->value;
}

- (void)setValue:(int64_t)a3
{
  self->value = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->leaderboardID, 0);
  objc_storeStrong((id *)&self->requestData, 0);
  objc_storeStrong((id *)&self->bundleID, 0);
  objc_storeStrong((id *)&self->uuid, 0);
  objc_storeStrong((id *)&self->playerID, 0);
  objc_storeStrong((id *)&self->nsurlTask, 0);
  objc_storeStrong((id *)&self->nsurlRequest, 0);
}

@end
