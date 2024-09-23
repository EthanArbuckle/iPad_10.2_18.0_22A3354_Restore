@implementation GKChallengeNetworkRequest

+ (id)bagKey
{
  return CFSTR("gk-issue-challenges");
}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5
{
  handleStandardRequest(self, a3, a4, a5);
}

- (GKChallengeNetworkRequest)initWithChallenges:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  GKChallengeNetworkRequest *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GKChallengeNetworkRequest;
  v8 = -[GKChallengeNetworkRequest init](&v14, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
    -[GKChallengeNetworkRequest setUuid:](v8, "setUuid:", v10);

    v11 = _localPlayerID();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[GKChallengeNetworkRequest setPlayerID:](v8, "setPlayerID:", v12);

    -[GKChallengeNetworkRequest setChallenges:](v8, "setChallenges:", v6);
    -[GKChallengeNetworkRequest setBundleID:](v8, "setBundleID:", v7);
  }

  return v8;
}

- (BOOL)isDuplicateRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeNetworkRequest challenges](self, "challenges"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "challenges"));

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToSet:", v6);
  return (char)v4;
}

- (void)mergeRequestData:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[GKChallengeNetworkRequest challenges](self, "challenges"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "challenges"));

  objc_msgSend(v6, "unionSet:", v5);
}

- (GKChallengeNetworkRequest)initWithTask:(id)a3
{
  id v4;
  GKChallengeNetworkRequest *v5;
  GKChallengeNetworkRequest *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKChallengeNetworkRequest;
  v5 = -[GKChallengeNetworkRequest init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[GKChallengeNetworkRequest setNsurlTask:](v5, "setNsurlTask:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager dictionaryFromTaskDescription:](GKNetworkRequestManager, "dictionaryFromTaskDescription:", v4));
    -[GKChallengeNetworkRequest updateWithTaskInfo:](v6, "updateWithTaskInfo:", v7);

  }
  return v6;
}

- (id)postBody
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeNetworkRequest challenges](self, "challenges"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("challenges"));

  return v3;
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeNetworkRequest playerID](self, "playerID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("PlayerIDKey"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeNetworkRequest challenges](self, "challenges"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ChallengesTaskKey"));

  v8 = objc_msgSend((id)objc_opt_class(self, v7), "bagKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("BagKeyKey"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeNetworkRequest uuid](self, "uuid"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("UUIDKey"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeNetworkRequest bundleID](self, "bundleID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("BundleIDKey"));

  return v3;
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

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UUIDKey")));
  -[GKChallengeNetworkRequest setUuid:](self, "setUuid:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PlayerIDKey")));
  -[GKChallengeNetworkRequest setPlayerID:](self, "setPlayerID:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ChallengesTaskKey")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
  v9 = objc_msgSend(v8, "mutableCopy");
  -[GKChallengeNetworkRequest setChallenges:](self, "setChallenges:", v9);

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BundleIDKey")));
  -[GKChallengeNetworkRequest setBundleID:](self, "setBundleID:", v10);

}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeNetworkRequest playerID](self, "playerID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeNetworkRequest challenges](self, "challenges"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: PlayerID: %@ Challenges: %@"), v3, v4, v5));

  return (NSString *)v6;
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

- (NSMutableSet)challenges
{
  return self->challenges;
}

- (void)setChallenges:(id)a3
{
  objc_storeStrong((id *)&self->challenges, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->requestData, 0);
  objc_storeStrong((id *)&self->uuid, 0);
  objc_storeStrong((id *)&self->bundleID, 0);
  objc_storeStrong((id *)&self->challenges, 0);
  objc_storeStrong((id *)&self->playerID, 0);
  objc_storeStrong((id *)&self->nsurlRequest, 0);
  objc_storeStrong((id *)&self->nsurlTask, 0);
}

@end
