@implementation GKRemoveFriendNetworkRequest

+ (id)bagKey
{
  return CFSTR("gk-remove-friend");
}

- (id)postBody
{
  void *v2;
  void *v3;
  const __CFString *v5;
  void *v6;

  v5 = CFSTR("player-id");
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoveFriendNetworkRequest friendID](self, "friendID"));
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));

  return v3;
}

- (GKRemoveFriendNetworkRequest)initWithTask:(id)a3
{
  id v4;
  GKRemoveFriendNetworkRequest *v5;
  GKRemoveFriendNetworkRequest *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKRemoveFriendNetworkRequest;
  v5 = -[GKRemoveFriendNetworkRequest init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[GKRemoveFriendNetworkRequest setNsurlTask:](v5, "setNsurlTask:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager dictionaryFromTaskDescription:](GKNetworkRequestManager, "dictionaryFromTaskDescription:", v4));
    -[GKRemoveFriendNetworkRequest updateWithTaskInfo:](v6, "updateWithTaskInfo:", v7);

  }
  return v6;
}

- (GKRemoveFriendNetworkRequest)initWithFriendPlayerID:(id)a3
{
  id v4;
  GKRemoveFriendNetworkRequest *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKRemoveFriendNetworkRequest;
  v5 = -[GKRemoveFriendNetworkRequest init](&v11, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
    -[GKRemoveFriendNetworkRequest setUuid:](v5, "setUuid:", v7);

    v8 = _localPlayerID();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[GKRemoveFriendNetworkRequest setPlayerID:](v5, "setPlayerID:", v9);

    -[GKRemoveFriendNetworkRequest setFriendID:](v5, "setFriendID:", v4);
  }

  return v5;
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

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoveFriendNetworkRequest playerID](self, "playerID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("PlayerIDKey"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoveFriendNetworkRequest friendID](self, "friendID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("FriendPlayerIDKey"));

  v7 = objc_msgSend((id)objc_opt_class(self, v6), "bagKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("BagKeyKey"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoveFriendNetworkRequest uuid](self, "uuid"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("UUIDKey"));

  return v3;
}

- (void)updateWithTaskInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UUIDKey")));
  -[GKRemoveFriendNetworkRequest setUuid:](self, "setUuid:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FriendPlayerIDKey")));
  -[GKRemoveFriendNetworkRequest setFriendID:](self, "setFriendID:", v6);

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PlayerIDKey")));
  -[GKRemoveFriendNetworkRequest setPlayerID:](self, "setPlayerID:", v7);

}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5
{
  handleStandardRequest(self, a3, a4, a5);
}

- (id)requestIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoveFriendNetworkRequest friendID](self, "friendID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoveFriendNetworkRequest playerID](self, "playerID"));
  v6 = objc_msgSend((id)objc_opt_class(self, v5), "bagKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@+%@+%@"), v3, v4, v7));

  return v8;
}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoveFriendNetworkRequest playerID](self, "playerID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoveFriendNetworkRequest friendID](self, "friendID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: PlayerID: %@ FriendPlayerID: %@"), v3, v4, v5));

  return (NSString *)v6;
}

- (BOOL)isDuplicateRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKRemoveFriendNetworkRequest friendID](self, "friendID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "friendID"));

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (NSString)friendID
{
  return self->friendID;
}

- (void)setFriendID:(id)a3
{
  objc_storeStrong((id *)&self->friendID, a3);
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

- (NSString)playerID
{
  return self->playerID;
}

- (void)setPlayerID:(id)a3
{
  objc_storeStrong((id *)&self->playerID, a3);
}

- (BOOL)currentlyRunning
{
  return self->currentlyRunning;
}

- (void)setCurrentlyRunning:(BOOL)a3
{
  self->currentlyRunning = a3;
}

- (NSString)uuid
{
  return self->uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->uuid, a3);
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

- (NSString)bundleID
{
  return self->bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->bundleID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->bundleID, 0);
  objc_storeStrong((id *)&self->requestData, 0);
  objc_storeStrong((id *)&self->uuid, 0);
  objc_storeStrong((id *)&self->playerID, 0);
  objc_storeStrong((id *)&self->nsurlRequest, 0);
  objc_storeStrong((id *)&self->nsurlTask, 0);
  objc_storeStrong((id *)&self->friendID, 0);
}

@end
