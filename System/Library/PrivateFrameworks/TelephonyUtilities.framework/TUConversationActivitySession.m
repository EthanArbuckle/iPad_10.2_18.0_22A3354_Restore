@implementation TUConversationActivitySession

- (TUConversationActivitySession)initWithActivity:(id)a3 state:(unint64_t)a4 uuid:(id)a5 endpoint:(id)a6 locallyInitiated:(BOOL)a7 timestamp:(id)a8 isFirstJoin:(BOOL)a9 activeRemoteParticipants:(id)a10 isLocalParticipantActive:(BOOL)a11 applicationState:(unint64_t)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  TUConversationActivitySession *v21;
  TUConversationActivitySession *v22;
  NSArray *v23;
  NSArray *persistentSceneIdentifiers;
  id v28;
  objc_super v29;

  v17 = a3;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v28 = a10;
  v29.receiver = self;
  v29.super_class = (Class)TUConversationActivitySession;
  v21 = -[TUConversationActivitySession init](&v29, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_UUID, a5);
    objc_storeStrong((id *)&v22->_activity, a3);
    v22->_state = a4;
    objc_storeStrong((id *)&v22->_endpoint, a6);
    v22->_isLocallyInitiated = a7;
    v22->_isLightweightPrimaryInitiated = 0;
    objc_storeStrong((id *)&v22->_timestamp, a8);
    v22->_isFirstJoin = a9;
    objc_storeStrong((id *)&v22->_activeRemoteParticipants, a10);
    v22->_localParticipantActive = a11;
    v22->_permittedToJoin = 0;
    v22->_usingAirplay = 0;
    v22->_distributionCount = 0;
    v22->_applicationState = a12;
    v23 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    persistentSceneIdentifiers = v22->_persistentSceneIdentifiers;
    v22->_persistentSceneIdentifiers = v23;

  }
  return v22;
}

- (TUConversationActivitySession)initWithTUConversationActivitySession:(id)a3
{
  id v4;
  TUConversationActivitySession *v5;
  uint64_t v6;
  NSUUID *UUID;
  uint64_t v8;
  TUConversationActivity *activity;
  uint64_t v10;
  NSXPCListenerEndpoint *endpoint;
  uint64_t v12;
  NSDate *timestamp;
  uint64_t v14;
  NSSet *activeRemoteParticipants;
  uint64_t v16;
  NSArray *persistentSceneIdentifiers;
  uint64_t v18;
  NSNumber *clientAudioSessionID;
  uint64_t v20;
  NSDate *localCreationTimestamp;
  uint64_t v22;
  NSDate *permittedJoinTimestamp;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)TUConversationActivitySession;
  v5 = -[TUConversationActivitySession init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    objc_msgSend(v4, "activity");
    v8 = objc_claimAutoreleasedReturnValue();
    activity = v5->_activity;
    v5->_activity = (TUConversationActivity *)v8;

    v5->_state = objc_msgSend(v4, "state");
    objc_msgSend(v4, "endpoint");
    v10 = objc_claimAutoreleasedReturnValue();
    endpoint = v5->_endpoint;
    v5->_endpoint = (NSXPCListenerEndpoint *)v10;

    v5->_isLocallyInitiated = objc_msgSend(v4, "isLocallyInitiated");
    v5->_isLightweightPrimaryInitiated = objc_msgSend(v4, "isLightweightPrimaryInitiated");
    objc_msgSend(v4, "timestamp");
    v12 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v12;

    v5->_isFirstJoin = objc_msgSend(v4, "isFirstJoin");
    objc_msgSend(v4, "activeRemoteParticipants");
    v14 = objc_claimAutoreleasedReturnValue();
    activeRemoteParticipants = v5->_activeRemoteParticipants;
    v5->_activeRemoteParticipants = (NSSet *)v14;

    v5->_localParticipantActive = objc_msgSend(v4, "isLocalParticipantActive");
    v5->_distributionCount = objc_msgSend(v4, "distributionCount");
    v5->_permittedToJoin = objc_msgSend(v4, "isPermittedToJoin");
    v5->_usingAirplay = objc_msgSend(v4, "isUsingAirplay");
    v5->_persistentSceneIsEligibleForAutoClose = objc_msgSend(v4, "persistentSceneIsEligibleForAutoClose");
    objc_msgSend(v4, "persistentSceneIdentifiers");
    v16 = objc_claimAutoreleasedReturnValue();
    persistentSceneIdentifiers = v5->_persistentSceneIdentifiers;
    v5->_persistentSceneIdentifiers = (NSArray *)v16;

    v5->_applicationState = objc_msgSend(v4, "applicationState");
    objc_msgSend(v4, "clientAudioSessionID");
    v18 = objc_claimAutoreleasedReturnValue();
    clientAudioSessionID = v5->_clientAudioSessionID;
    v5->_clientAudioSessionID = (NSNumber *)v18;

    objc_msgSend(v4, "localCreationTimestamp");
    v20 = objc_claimAutoreleasedReturnValue();
    localCreationTimestamp = v5->_localCreationTimestamp;
    v5->_localCreationTimestamp = (NSDate *)v20;

    objc_msgSend(v4, "permittedJoinTimestamp");
    v22 = objc_claimAutoreleasedReturnValue();
    permittedJoinTimestamp = v5->_permittedJoinTimestamp;
    v5->_permittedJoinTimestamp = (NSDate *)v22;

  }
  return v5;
}

- (TUConversationActivitySession)initWithActivity:(id)a3 state:(unint64_t)a4 endpoint:(id)a5 locallyInitiated:(BOOL)a6 timestamp:(id)a7 isFirstJoin:(BOOL)a8
{
  _BOOL8 v9;
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  TUConversationActivitySession *v20;
  uint64_t v22;
  uint64_t v23;

  v9 = a6;
  v14 = (objc_class *)MEMORY[0x1E0CB3A28];
  v15 = a7;
  v16 = a5;
  v17 = a3;
  v18 = objc_alloc_init(v14);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v23) = 0;
  LOBYTE(v22) = a8;
  v20 = -[TUConversationActivitySession initWithActivity:state:uuid:endpoint:locallyInitiated:timestamp:isFirstJoin:activeRemoteParticipants:isLocalParticipantActive:applicationState:](self, "initWithActivity:state:uuid:endpoint:locallyInitiated:timestamp:isFirstJoin:activeRemoteParticipants:isLocalParticipantActive:applicationState:", v17, a4, v18, v16, v9, v15, v22, v19, v23, 1);

  return v20;
}

- (TUConversationActivitySession)initWithActivity:(id)a3 uuid:(id)a4 locallyInitiated:(BOOL)a5 timestamp:(id)a6 isFirstJoin:(BOOL)a7
{
  _BOOL8 v8;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  TUConversationActivitySession *v17;
  uint64_t v19;
  uint64_t v20;

  v8 = a5;
  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = a6;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v12, "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = 0;
  LOBYTE(v19) = a7;
  v17 = -[TUConversationActivitySession initWithActivity:state:uuid:endpoint:locallyInitiated:timestamp:isFirstJoin:activeRemoteParticipants:isLocalParticipantActive:applicationState:](self, "initWithActivity:state:uuid:endpoint:locallyInitiated:timestamp:isFirstJoin:activeRemoteParticipants:isLocalParticipantActive:applicationState:", v15, 0, v14, 0, v8, v13, v19, v16, v20, 1);

  return v17;
}

- (TUConversationActivitySession)initWithActivity:(id)a3 locallyInitiated:(BOOL)a4 timestamp:(id)a5 isFirstJoin:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  TUConversationActivitySession *v14;

  v6 = a6;
  v7 = a4;
  v10 = (objc_class *)MEMORY[0x1E0CB3A28];
  v11 = a5;
  v12 = a3;
  v13 = objc_alloc_init(v10);
  v14 = -[TUConversationActivitySession initWithActivity:uuid:locallyInitiated:timestamp:isFirstJoin:](self, "initWithActivity:uuid:locallyInitiated:timestamp:isFirstJoin:", v12, v13, v7, v11, v6);

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivitySession activity](self, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" activity=%@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(" state=%lu"), -[TUConversationActivitySession state](self, "state"));
  -[TUConversationActivitySession UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" UUID=%@"), v5);

  -[TUConversationActivitySession timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" timestamp=%@"), v6);

  -[TUConversationActivitySession endpoint](self, "endpoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" endpoint=%@"), v7);

  -[TUConversationActivitySession clientAudioSessionID](self, "clientAudioSessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" audioSessionID=%@"), v8);

  if (-[TUConversationActivitySession isLocallyInitiated](self, "isLocallyInitiated"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isLocallyInitiated=%d"), -[TUConversationActivitySession isLocallyInitiated](self, "isLocallyInitiated"));
  if (-[TUConversationActivitySession isLightweightPrimaryInitiated](self, "isLightweightPrimaryInitiated"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isLightweightPrimaryInitiated=%d"), -[TUConversationActivitySession isLightweightPrimaryInitiated](self, "isLightweightPrimaryInitiated"));
  if (-[TUConversationActivitySession isFirstJoin](self, "isFirstJoin"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isFirstJoin=%d"), -[TUConversationActivitySession isFirstJoin](self, "isFirstJoin"));
  if (-[TUConversationActivitySession isPermittedToJoin](self, "isPermittedToJoin"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isPermittedToJoin=%d"), -[TUConversationActivitySession isPermittedToJoin](self, "isPermittedToJoin"));
  if (-[TUConversationActivitySession isUsingAirplay](self, "isUsingAirplay"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isUsingAirplay=%d"), -[TUConversationActivitySession isUsingAirplay](self, "isUsingAirplay"));
  if (-[TUConversationActivitySession isLocalParticipantActive](self, "isLocalParticipantActive"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isLocalParticipantActive=%d"), -[TUConversationActivitySession isLocalParticipantActive](self, "isLocalParticipantActive"));
  -[TUConversationActivitySession activeRemoteParticipants](self, "activeRemoteParticipants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    -[TUConversationActivitySession activeRemoteParticipants](self, "activeRemoteParticipants");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" activeRemoteParticipants=%@"), v13);

  }
  if (-[TUConversationActivitySession distributionCount](self, "distributionCount"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" distributionCount=%ld"), -[TUConversationActivitySession distributionCount](self, "distributionCount"));
  -[TUConversationActivitySession persistentSceneIdentifiers](self, "persistentSceneIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[TUConversationActivitySession persistentSceneIdentifiers](self, "persistentSceneIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" persistentSceneIdentifiers=%@"), v15);

  }
  if (-[TUConversationActivitySession persistentSceneIsEligibleForAutoClose](self, "persistentSceneIsEligibleForAutoClose"))
  {
    objc_msgSend(v3, "appendFormat:", CFSTR(" persistentSceneIsEligibleForAutoClose=%d"), -[TUConversationActivitySession persistentSceneIsEligibleForAutoClose](self, "persistentSceneIsEligibleForAutoClose"));
  }
  objc_msgSend(v3, "appendFormat:", CFSTR(" applicationState=%lu"), -[TUConversationActivitySession applicationState](self, "applicationState"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v16 = (void *)objc_msgSend(v3, "copy");

  return v16;
}

- (NSString)persistentSceneIdentifier
{
  return (NSString *)-[NSArray lastObject](self->_persistentSceneIdentifiers, "lastObject");
}

- (void)setPersistentSceneIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUConversationActivitySession setPersistentSceneIdentifiers:](self, "setPersistentSceneIdentifiers:", v6, v7, v8);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TUConversationActivitySession isEqualToConversationActivitySession:](self, "isEqualToConversationActivitySession:", v4);

  return v5;
}

- (BOOL)isEqualToConversationActivitySession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  unint64_t v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  BOOL v19;
  void *v21;
  void *v22;
  int v23;
  int v24;
  unint64_t v25;
  unint64_t v26;
  int v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v4 = a3;
  -[TUConversationActivitySession UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[TUConversationActivitySession timestamp](self, "timestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    v9 = v8;
    objc_msgSend(v4, "timestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970");
    if (v9 == v11 && (v12 = -[TUConversationActivitySession state](self, "state"), v12 == objc_msgSend(v4, "state")))
    {
      -[TUConversationActivitySession endpoint](self, "endpoint");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "endpoint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 == v14
        && (v15 = -[TUConversationActivitySession isLocallyInitiated](self, "isLocallyInitiated"),
            v15 == objc_msgSend(v4, "isLocallyInitiated"))
        && (v16 = -[TUConversationActivitySession isLightweightPrimaryInitiated](self, "isLightweightPrimaryInitiated"),
            v16 == objc_msgSend(v4, "isLightweightPrimaryInitiated"))
        && (v17 = -[TUConversationActivitySession isFirstJoin](self, "isFirstJoin"),
            v17 == objc_msgSend(v4, "isFirstJoin"))
        && (v18 = -[TUConversationActivitySession isPermittedToJoin](self, "isPermittedToJoin"),
            v18 == objc_msgSend(v4, "isPermittedToJoin")))
      {
        -[TUConversationActivitySession activeRemoteParticipants](self, "activeRemoteParticipants");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "activeRemoteParticipants");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (TUObjectsAreEqualOrNil((unint64_t)v21, (uint64_t)v22))
        {
          v33 = v21;
          v23 = -[TUConversationActivitySession isLocalParticipantActive](self, "isLocalParticipantActive");
          if (v23 == objc_msgSend(v4, "isLocalParticipantActive")
            && (v24 = -[TUConversationActivitySession persistentSceneIsEligibleForAutoClose](self, "persistentSceneIsEligibleForAutoClose"), v24 == objc_msgSend(v4, "persistentSceneIsEligibleForAutoClose")))
          {
            -[TUConversationActivitySession persistentSceneIdentifiers](self, "persistentSceneIdentifiers");
            v25 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "persistentSceneIdentifiers");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = (void *)v25;
            if (TUObjectsAreEqualOrNil(v25, (uint64_t)v31)
              && (v26 = -[TUConversationActivitySession distributionCount](self, "distributionCount"),
                  v26 == objc_msgSend(v4, "distributionCount"))
              && (v27 = -[TUConversationActivitySession isUsingAirplay](self, "isUsingAirplay"),
                  v27 == objc_msgSend(v4, "isUsingAirplay"))
              && (v28 = -[TUConversationActivitySession applicationState](self, "applicationState"),
                  v28 == objc_msgSend(v4, "applicationState")))
            {
              -[TUConversationActivitySession clientAudioSessionID](self, "clientAudioSessionID");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "clientAudioSessionID");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v29 == v30;

            }
            else
            {
              v19 = 0;
            }
            v21 = v33;

          }
          else
          {
            v19 = 0;
            v21 = v33;
          }
        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  void *v32;

  -[TUConversationActivitySession UUID](self, "UUID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v32, "hash");
  -[TUConversationActivitySession activity](self, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[TUConversationActivitySession timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  v8 = v5 ^ v7 ^ -[TUConversationActivitySession state](self, "state");
  -[TUConversationActivitySession endpoint](self, "endpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  if (-[TUConversationActivitySession isLocallyInitiated](self, "isLocallyInitiated"))
    v11 = 1231;
  else
    v11 = 1237;
  v12 = v8 ^ v10 ^ v11;
  if (-[TUConversationActivitySession isLightweightPrimaryInitiated](self, "isLightweightPrimaryInitiated"))
    v13 = 1231;
  else
    v13 = 1237;
  if (-[TUConversationActivitySession isFirstJoin](self, "isFirstJoin"))
    v14 = 1231;
  else
    v14 = 1237;
  v15 = v13 ^ v14;
  if (-[TUConversationActivitySession isPermittedToJoin](self, "isPermittedToJoin"))
    v16 = 1231;
  else
    v16 = 1237;
  v17 = v12 ^ v15 ^ v16;
  -[TUConversationActivitySession activeRemoteParticipants](self, "activeRemoteParticipants");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hash");
  if (-[TUConversationActivitySession isLocalParticipantActive](self, "isLocalParticipantActive"))
    v20 = 1231;
  else
    v20 = 1237;
  v21 = v19 ^ v20;
  if (-[TUConversationActivitySession persistentSceneIsEligibleForAutoClose](self, "persistentSceneIsEligibleForAutoClose"))
  {
    v22 = 1231;
  }
  else
  {
    v22 = 1237;
  }
  v23 = v21 ^ v22;
  -[TUConversationActivitySession persistentSceneIdentifiers](self, "persistentSceneIdentifiers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v17 ^ v23 ^ objc_msgSend(v24, "hash");
  v26 = -[TUConversationActivitySession distributionCount](self, "distributionCount");
  if (-[TUConversationActivitySession isUsingAirplay](self, "isUsingAirplay"))
    v27 = 1231;
  else
    v27 = 1237;
  v28 = v26 ^ v27 ^ -[TUConversationActivitySession applicationState](self, "applicationState");
  -[TUConversationActivitySession clientAudioSessionID](self, "clientAudioSessionID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v25 ^ v28 ^ objc_msgSend(v29, "hash");

  return v30;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TUConversationActivitySession initWithTUConversationActivitySession:](+[TUConversationActivitySession allocWithZone:](TUConversationActivitySession, "allocWithZone:", a3), "initWithTUConversationActivitySession:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TUConversationActivitySession initWithTUConversationActivitySession:](+[TUMutableConversationActivitySession allocWithZone:](TUMutableConversationActivitySession, "allocWithZone:", a3), "initWithTUConversationActivitySession:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationActivitySession)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  TUConversationActivitySession *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;

  v3 = a3;
  v4 = objc_opt_class();
  NSStringFromSelector(sel_activity);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v4, v5);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_state);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v3, "decodeIntegerForKey:", v6);

  v7 = objc_opt_class();
  NSStringFromSelector(sel_endpoint);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_isLocallyInitiated);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v3, "decodeBoolForKey:", v10);

  v12 = objc_opt_class();
  NSStringFromSelector(sel_UUID);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();

  v15 = objc_opt_class();
  NSStringFromSelector(sel_timestamp);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_isFirstJoin);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v3, "decodeBoolForKey:", v18);

  v20 = (void *)MEMORY[0x1E0C99E60];
  v21 = objc_opt_class();
  objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activeRemoteParticipants);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_isLocalParticipantActive);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v23) = objc_msgSend(v3, "decodeBoolForKey:", v25);

  NSStringFromSelector(sel_applicationState);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v3, "decodeIntegerForKey:", v26);

  LOBYTE(v49) = (_BYTE)v23;
  LOBYTE(v48) = v19;
  v28 = (void *)v14;
  v29 = -[TUConversationActivitySession initWithActivity:state:uuid:endpoint:locallyInitiated:timestamp:isFirstJoin:activeRemoteParticipants:isLocalParticipantActive:applicationState:](self, "initWithActivity:state:uuid:endpoint:locallyInitiated:timestamp:isFirstJoin:activeRemoteParticipants:isLocalParticipantActive:applicationState:", v51, v50, v14, v9, v11, v17, v48, v24, v49, v27);
  NSStringFromSelector(sel_distributionCount);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivitySession setDistributionCount:](v29, "setDistributionCount:", objc_msgSend(v3, "decodeIntegerForKey:", v30));

  NSStringFromSelector(sel_isLightweightPrimaryInitiated);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivitySession setIsLightweightPrimaryInitiated:](v29, "setIsLightweightPrimaryInitiated:", objc_msgSend(v3, "decodeBoolForKey:", v31));

  NSStringFromSelector(sel_isPermittedToJoin);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivitySession setPermittedToJoin:](v29, "setPermittedToJoin:", objc_msgSend(v3, "decodeBoolForKey:", v32));

  NSStringFromSelector(sel_persistentSceneIsEligibleForAutoClose);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivitySession setPersistentSceneIsEligibleForAutoClose:](v29, "setPersistentSceneIsEligibleForAutoClose:", objc_msgSend(v3, "decodeBoolForKey:", v33));

  NSStringFromSelector(sel_isUsingAirplay);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivitySession setUsingAirplay:](v29, "setUsingAirplay:", objc_msgSend(v3, "decodeBoolForKey:", v34));

  v35 = objc_opt_class();
  NSStringFromSelector(sel_persistentSceneIdentifiers);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeArrayOfObjectsOfClass:forKey:", v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivitySession setPersistentSceneIdentifiers:](v29, "setPersistentSceneIdentifiers:", v37);

  v38 = objc_opt_class();
  NSStringFromSelector(sel_clientAudioSessionID);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivitySession setClientAudioSessionID:](v29, "setClientAudioSessionID:", v40);

  v41 = objc_opt_class();
  NSStringFromSelector(sel_localCreationTimestamp);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivitySession setLocalCreationTimestamp:](v29, "setLocalCreationTimestamp:", v43);

  v44 = objc_opt_class();
  NSStringFromSelector(sel_permittedJoinTimestamp);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUConversationActivitySession setPermittedJoinTimestamp:](v29, "setPermittedJoinTimestamp:", v46);
  return v29;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  unint64_t v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  _BOOL8 v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL8 v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;

  v4 = a3;
  -[TUConversationActivitySession UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_UUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[TUConversationActivitySession timestamp](self, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_timestamp);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[TUConversationActivitySession activity](self, "activity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activity);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  v11 = -[TUConversationActivitySession state](self, "state");
  NSStringFromSelector(sel_state);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v11, v12);

  -[TUConversationActivitySession endpoint](self, "endpoint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_endpoint);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  v15 = -[TUConversationActivitySession isLocallyInitiated](self, "isLocallyInitiated");
  NSStringFromSelector(sel_isLocallyInitiated);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v15, v16);

  v17 = -[TUConversationActivitySession isLightweightPrimaryInitiated](self, "isLightweightPrimaryInitiated");
  NSStringFromSelector(sel_isLightweightPrimaryInitiated);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v17, v18);

  v19 = -[TUConversationActivitySession isFirstJoin](self, "isFirstJoin");
  NSStringFromSelector(sel_isFirstJoin);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v19, v20);

  -[TUConversationActivitySession activeRemoteParticipants](self, "activeRemoteParticipants");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activeRemoteParticipants);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, v22);

  v23 = -[TUConversationActivitySession isLocalParticipantActive](self, "isLocalParticipantActive");
  NSStringFromSelector(sel_isLocalParticipantActive);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v23, v24);

  v25 = -[TUConversationActivitySession distributionCount](self, "distributionCount");
  NSStringFromSelector(sel_distributionCount);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v25, v26);

  v27 = -[TUConversationActivitySession isPermittedToJoin](self, "isPermittedToJoin");
  NSStringFromSelector(sel_isPermittedToJoin);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v27, v28);

  v29 = -[TUConversationActivitySession persistentSceneIsEligibleForAutoClose](self, "persistentSceneIsEligibleForAutoClose");
  NSStringFromSelector(sel_persistentSceneIsEligibleForAutoClose);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v29, v30);

  -[TUConversationActivitySession persistentSceneIdentifiers](self, "persistentSceneIdentifiers");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_persistentSceneIdentifiers);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, v32);

  v33 = -[TUConversationActivitySession isUsingAirplay](self, "isUsingAirplay");
  NSStringFromSelector(sel_isUsingAirplay);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v33, v34);

  v35 = -[TUConversationActivitySession applicationState](self, "applicationState");
  NSStringFromSelector(sel_applicationState);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v35, v36);

  -[TUConversationActivitySession clientAudioSessionID](self, "clientAudioSessionID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_clientAudioSessionID);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v37, v38);

  -[TUConversationActivitySession localCreationTimestamp](self, "localCreationTimestamp");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localCreationTimestamp);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v39, v40);

  -[TUConversationActivitySession permittedJoinTimestamp](self, "permittedJoinTimestamp");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_permittedJoinTimestamp);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v42, v41);

}

- (void)launchApplicationWithForcedURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD aBlock[4];
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  TUConversationActivitySession *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TUConversationActivitySession activity](self, "activity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "representativeBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v9, "length"))
  {
    TUDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[TUConversationActivitySession activity](self, "activity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "activityIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v35 = v9;
      v36 = 2112;
      v37 = self;
      v38 = 2112;
      v39 = v12;
      _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "Manually launching Expanse app with bundleIdentifier: %@ for activity session: %@ with activity identifier: %@", buf, 0x20u);

    }
    v13 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__TUConversationActivitySession_launchApplicationWithForcedURL_completion___block_invoke;
    aBlock[3] = &unk_1E38A48F8;
    v14 = v9;
    v32 = v14;
    v33 = v7;
    v15 = _Block_copy(aBlock);
    v16 = objc_alloc_init(MEMORY[0x1E0CA5938]);
    TUUnlockDeviceWithPromptFrontBoardOptionsDictionary(v6 != 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrontBoardOptions:", v17);

    v18 = (void *)CUTWeakLinkClass();
    v19 = v18;
    if (v6)
    {
      objc_msgSend(v18, "defaultWorkspace");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v13;
      v29[1] = 3221225472;
      v29[2] = __75__TUConversationActivitySession_launchApplicationWithForcedURL_completion___block_invoke_94;
      v29[3] = &unk_1E38A2CE8;
      v30 = v15;
      objc_msgSend(v20, "openURL:configuration:completionHandler:", v6, v16, v29);

      v21 = v30;
    }
    else
    {
      v28 = 0;
      v23 = (void *)objc_msgSend(objc_alloc((Class)CUTWeakLinkClass()), "initWithBundleIdentifier:allowPlaceholder:error:", v14, 0, &v28);
      v24 = v28;
      v21 = v24;
      if (!v23 || v24)
      {
        (*((void (**)(void *, _QWORD, _QWORD, id))v15 + 2))(v15, 0, 0, v24);
      }
      else
      {
        objc_msgSend(v19, "defaultWorkspace");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v13;
        v26[1] = 3221225472;
        v26[2] = __75__TUConversationActivitySession_launchApplicationWithForcedURL_completion___block_invoke_2;
        v26[3] = &unk_1E38A1470;
        v27 = v15;
        objc_msgSend(v25, "openApplicationWithBundleIdentifier:configuration:completionHandler:", v14, v16, v26);

      }
    }

  }
  else
  {
    TUDefaultLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[TUConversationActivitySession launchApplicationWithForcedURL:completion:].cold.1((uint64_t)self, (uint64_t)v9, v22);

    if (v7)
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

void __75__TUConversationActivitySession_launchApplicationWithForcedURL_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if ((a3 & 1) == 0)
  {
    TUDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v12 = 138412546;
      v13 = v10;
      v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Application for activity session is not installed with bundleIdentifier: %@; error: %{public}@",
        (uint8_t *)&v12,
        0x16u);
    }
    goto LABEL_8;
  }
  if (v7 || (a2 & 1) == 0)
  {
    TUDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __75__TUConversationActivitySession_launchApplicationWithForcedURL_completion___block_invoke_cold_1(a1, (uint64_t)v8, v9);
LABEL_8:

  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v11, a2, a3);

}

uint64_t __75__TUConversationActivitySession_launchApplicationWithForcedURL_completion___block_invoke_94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a3 == 0, 1, a3);
}

uint64_t __75__TUConversationActivitySession_launchApplicationWithForcedURL_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)publicCopy
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;

  v2 = (_QWORD *)-[TUConversationActivitySession copy](self, "copy");
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v2[8];
  v2[8] = v3;

  return v2;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (TUConversationActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_endpoint, a3);
}

- (BOOL)isLocallyInitiated
{
  return self->_isLocallyInitiated;
}

- (void)setIsLocallyInitiated:(BOOL)a3
{
  self->_isLocallyInitiated = a3;
}

- (NSNumber)clientAudioSessionID
{
  return self->_clientAudioSessionID;
}

- (void)setClientAudioSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_clientAudioSessionID, a3);
}

- (BOOL)isLightweightPrimaryInitiated
{
  return self->_isLightweightPrimaryInitiated;
}

- (void)setIsLightweightPrimaryInitiated:(BOOL)a3
{
  self->_isLightweightPrimaryInitiated = a3;
}

- (BOOL)isFirstJoin
{
  return self->_isFirstJoin;
}

- (BOOL)isPermittedToJoin
{
  return self->_permittedToJoin;
}

- (void)setPermittedToJoin:(BOOL)a3
{
  self->_permittedToJoin = a3;
}

- (BOOL)isLocalParticipantActive
{
  return self->_localParticipantActive;
}

- (NSSet)activeRemoteParticipants
{
  return self->_activeRemoteParticipants;
}

- (NSArray)persistentSceneIdentifiers
{
  return self->_persistentSceneIdentifiers;
}

- (void)setPersistentSceneIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_persistentSceneIdentifiers, a3);
}

- (BOOL)persistentSceneIsEligibleForAutoClose
{
  return self->_persistentSceneIsEligibleForAutoClose;
}

- (void)setPersistentSceneIsEligibleForAutoClose:(BOOL)a3
{
  self->_persistentSceneIsEligibleForAutoClose = a3;
}

- (unint64_t)distributionCount
{
  return self->_distributionCount;
}

- (void)setDistributionCount:(unint64_t)a3
{
  self->_distributionCount = a3;
}

- (unint64_t)applicationState
{
  return self->_applicationState;
}

- (TUHandle)terminatingHandle
{
  return self->_terminatingHandle;
}

- (void)setTerminatingHandle:(id)a3
{
  objc_storeStrong((id *)&self->_terminatingHandle, a3);
}

- (BOOL)isUsingAirplay
{
  return self->_usingAirplay;
}

- (void)setUsingAirplay:(BOOL)a3
{
  self->_usingAirplay = a3;
}

- (NSDate)localCreationTimestamp
{
  return self->_localCreationTimestamp;
}

- (void)setLocalCreationTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_localCreationTimestamp, a3);
}

- (NSDate)permittedJoinTimestamp
{
  return self->_permittedJoinTimestamp;
}

- (void)setPermittedJoinTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_permittedJoinTimestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_permittedJoinTimestamp, 0);
  objc_storeStrong((id *)&self->_localCreationTimestamp, 0);
  objc_storeStrong((id *)&self->_terminatingHandle, 0);
  objc_storeStrong((id *)&self->_persistentSceneIdentifiers, 0);
  objc_storeStrong((id *)&self->_activeRemoteParticipants, 0);
  objc_storeStrong((id *)&self->_clientAudioSessionID, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (void)launchApplicationWithForcedURL:(NSObject *)a3 completion:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_19A50D000, a2, a3, "Failed to launch activity session: %@ with bundle identifier: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

void __75__TUConversationActivitySession_launchApplicationWithForcedURL_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_19A50D000, a2, a3, "Failed to open activity session with bundleIdentifier: %@; error: %{public}@",
    *(_QWORD *)v3,
    *(_QWORD *)&v3[8],
    *(_QWORD *)&v3[16],
    *MEMORY[0x1E0C80C00]);
}

@end
