@implementation GKPlayerGameSettingsNetworkRequest

+ (id)bagKey
{
  return CFSTR("gk-set-per-game-settings");
}

- (BOOL)isDuplicateRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerGameSettingsNetworkRequest settingValue](self, "settingValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "settingValue"));

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (GKPlayerGameSettingsNetworkRequest)initWithBundleID:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  GKPlayerGameSettingsNetworkRequest *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GKPlayerGameSettingsNetworkRequest;
  v8 = -[GKPlayerGameSettingsNetworkRequest init](&v14, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
    -[GKPlayerGameSettingsNetworkRequest setUuid:](v8, "setUuid:", v10);

    v11 = _localPlayerID();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[GKPlayerGameSettingsNetworkRequest setPlayerID:](v8, "setPlayerID:", v12);

    -[GKPlayerGameSettingsNetworkRequest setBundleID:](v8, "setBundleID:", v6);
    -[GKPlayerGameSettingsNetworkRequest setSettingValue:](v8, "setSettingValue:", v7);
  }

  return v8;
}

- (void)updateWithTaskInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UUIDKey")));
  -[GKPlayerGameSettingsNetworkRequest setUuid:](self, "setUuid:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BundleIDKey")));
  -[GKPlayerGameSettingsNetworkRequest setBundleID:](self, "setBundleID:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PlayerIDKey")));
  -[GKPlayerGameSettingsNetworkRequest setPlayerID:](self, "setPlayerID:", v7);

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playerGameSettingsKey")));
  -[GKPlayerGameSettingsNetworkRequest setSettingValue:](self, "setSettingValue:", v8);

}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v12 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerGameSettingsNetworkRequest nsurlRequest](self, "nsurlRequest"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerGameSettingsNetworkRequest bundleID](self, "bundleID"));
  objc_msgSend(v10, "setValue:forHTTPHeaderField:", v11, CFSTR("x-gk-bundle-id"));

  handleStandardRequest(self, v12, v9, v8);
}

- (GKPlayerGameSettingsNetworkRequest)initWithTask:(id)a3
{
  id v4;
  GKPlayerGameSettingsNetworkRequest *v5;
  GKPlayerGameSettingsNetworkRequest *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKPlayerGameSettingsNetworkRequest;
  v5 = -[GKPlayerGameSettingsNetworkRequest init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[GKPlayerGameSettingsNetworkRequest setNsurlTask:](v5, "setNsurlTask:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager dictionaryFromTaskDescription:](GKNetworkRequestManager, "dictionaryFromTaskDescription:", v4));
    -[GKPlayerGameSettingsNetworkRequest updateWithTaskInfo:](v6, "updateWithTaskInfo:", v7);

  }
  return v6;
}

- (id)postBody
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[2];

  v7[0] = CFSTR("allow-friend-list-access");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerGameSettingsNetworkRequest settingValue](self, "settingValue"));
  v7[1] = CFSTR("for-bundle-id");
  v8[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerGameSettingsNetworkRequest bundleID](self, "bundleID"));
  v8[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 2));

  return v5;
}

- (void)removeFromStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerGameSettingsNetworkRequest playerID](self, "playerID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerGameSettingsNetworkRequest bundleID](self, "bundleID"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentTasks"));
  objc_msgSend(v7, "removeObjectForKey:", v9);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pendingRequests"));
  objc_msgSend(v8, "removeObjectForKey:", v9);

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

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerGameSettingsNetworkRequest playerID](self, "playerID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("PlayerIDKey"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerGameSettingsNetworkRequest bundleID](self, "bundleID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("BundleIDKey"));

  v7 = objc_msgSend((id)objc_opt_class(self, v6), "bagKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("BagKeyKey"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerGameSettingsNetworkRequest uuid](self, "uuid"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("UUIDKey"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerGameSettingsNetworkRequest settingValue](self, "settingValue"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("playerGameSettingsKey"));

  return v3;
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

- (NSString)uuid
{
  return self->uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->uuid, a3);
}

- (NSMutableDictionary)requestData
{
  return self->requestData;
}

- (void)setRequestData:(id)a3
{
  objc_storeStrong((id *)&self->requestData, a3);
}

- (NSString)settingValue
{
  return self->settingValue;
}

- (void)setSettingValue:(id)a3
{
  objc_storeStrong((id *)&self->settingValue, a3);
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
  objc_storeStrong((id *)&self->settingValue, 0);
  objc_storeStrong((id *)&self->requestData, 0);
  objc_storeStrong((id *)&self->uuid, 0);
  objc_storeStrong((id *)&self->playerID, 0);
  objc_storeStrong((id *)&self->nsurlRequest, 0);
  objc_storeStrong((id *)&self->nsurlTask, 0);
}

@end
