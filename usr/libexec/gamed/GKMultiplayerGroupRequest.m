@implementation GKMultiplayerGroupRequest

+ (id)bagKey
{
  return CFSTR("gk-put-player-group");
}

- (BOOL)isDuplicateRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest playerGroupID](self, "playerGroupID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "playerGroupID"));
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest participants](self, "participants"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "participants"));
    v9 = objc_msgSend(v7, "isEqualToSet:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5
{
  handleStandardRequest(self, a3, a4, a5);
}

- (GKMultiplayerGroupRequest)initWithGroupID:(id)a3
{
  id v4;
  GKMultiplayerGroupRequest *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKMultiplayerGroupRequest;
  v5 = -[GKMultiplayerGroupRequest init](&v11, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
    -[GKMultiplayerGroupRequest setUuid:](v5, "setUuid:", v7);

    -[GKMultiplayerGroupRequest setPlayerGroupID:](v5, "setPlayerGroupID:", v4);
    v8 = _localPlayerID();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[GKMultiplayerGroupRequest setPlayerID:](v5, "setPlayerID:", v9);

  }
  return v5;
}

- (GKMultiplayerGroupRequest)initWithTask:(id)a3
{
  id v4;
  GKMultiplayerGroupRequest *v5;
  GKMultiplayerGroupRequest *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKMultiplayerGroupRequest;
  v5 = -[GKMultiplayerGroupRequest init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[GKMultiplayerGroupRequest setNsurlTask:](v5, "setNsurlTask:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager dictionaryFromTaskDescription:](GKNetworkRequestManager, "dictionaryFromTaskDescription:", v4));
    -[GKMultiplayerGroupRequest updateWithTaskInfo:](v6, "updateWithTaskInfo:", v7);

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
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UUIDKey")));
  -[GKMultiplayerGroupRequest setUuid:](self, "setUuid:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BundleIDKey")));
  -[GKMultiplayerGroupRequest setBundleID:](self, "setBundleID:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RequestDataKey")));
  -[GKMultiplayerGroupRequest setRequestData:](self, "setRequestData:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RequestParticipantsKey")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));
  -[GKMultiplayerGroupRequest setParticipants:](self, "setParticipants:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RequestPlayerGroupIDKey")));
  -[GKMultiplayerGroupRequest setPlayerGroupID:](self, "setPlayerGroupID:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RequestPlayedAtKey")));
  -[GKMultiplayerGroupRequest setPlayedAt:](self, "setPlayedAt:", objc_msgSend(v11, "longValue"));

  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PlayerIDKey")));
  -[GKMultiplayerGroupRequest setPlayerID:](self, "setPlayerID:", v12);

}

- (id)taskInfo
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest uuid](self, "uuid"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("UUIDKey"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest bundleID](self, "bundleID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("BundleIDKey"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest requestData](self, "requestData"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("RequestDataKey"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest participants](self, "participants"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("RequestParticipantsKey"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest playerGroupID](self, "playerGroupID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("RequestPlayerGroupIDKey"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[GKMultiplayerGroupRequest playedAt](self, "playedAt")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("RequestPlayedAtKey"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest playerID](self, "playerID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("PlayerIDKey"));

  v13 = objc_msgSend((id)objc_opt_class(self, v12), "bagKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("BagKeyKey"));

  return v3;
}

- (id)postBody
{
  void *v3;
  void *v4;
  void *v5;
  NSString *bundleID;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  NSString *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v14[0] = CFSTR("player-group-id");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest playerGroupID](self, "playerGroupID"));
  v15[0] = v3;
  v14[1] = CFSTR("participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest participants](self, "participants"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
  v15[1] = v5;
  v14[2] = CFSTR("game");
  bundleID = self->bundleID;
  v12 = CFSTR("bundle-id");
  v13 = bundleID;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  v15[2] = v7;
  v14[3] = CFSTR("played-at");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[GKMultiplayerGroupRequest playedAt](self, "playedAt")));
  v15[3] = v8;
  v14[4] = CFSTR("properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest requestData](self, "requestData"));
  v15[4] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 5));

  return v10;
}

- (id)requestIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest playerGroupID](self, "playerGroupID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKMultiplayerGroupRequest playerID](self, "playerID"));
  v6 = objc_msgSend((id)objc_opt_class(self, v5), "bagKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@+%@+%@"), v3, v4, v7));

  return v8;
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

- (BOOL)issueRequests
{
  return self->issueRequests;
}

- (void)setIssueRequests:(BOOL)a3
{
  self->issueRequests = a3;
}

- (NSMutableDictionary)requestData
{
  return self->requestData;
}

- (void)setRequestData:(id)a3
{
  objc_storeStrong((id *)&self->requestData, a3);
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

- (NSString)playerGroupID
{
  return self->playerGroupID;
}

- (void)setPlayerGroupID:(id)a3
{
  objc_storeStrong((id *)&self->playerGroupID, a3);
}

- (NSSet)participants
{
  return self->participants;
}

- (void)setParticipants:(id)a3
{
  objc_storeStrong((id *)&self->participants, a3);
}

- (int64_t)playedAt
{
  return self->_playedAt;
}

- (void)setPlayedAt:(int64_t)a3
{
  self->_playedAt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->participants, 0);
  objc_storeStrong((id *)&self->playerGroupID, 0);
  objc_storeStrong((id *)&self->uuid, 0);
  objc_storeStrong((id *)&self->playerID, 0);
  objc_storeStrong((id *)&self->requestData, 0);
  objc_storeStrong((id *)&self->nsurlTask, 0);
  objc_storeStrong((id *)&self->nsurlRequest, 0);
  objc_storeStrong((id *)&self->bundleID, 0);
}

@end
