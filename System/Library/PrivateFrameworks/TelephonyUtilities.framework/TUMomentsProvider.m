@implementation TUMomentsProvider

- (TUMomentsProvider)initWithCall:(id)a3
{
  id v4;
  TUMomentsProvider *v5;
  void *v6;
  void *v7;
  NSDictionary *v8;
  NSDictionary *v9;
  NSDictionary *remoteIDSDestinations;
  NSDictionary *v11;
  void *v12;
  void *v13;
  NSString *requesterID;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TUMomentsProvider;
  v5 = -[TUMomentsProvider init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "providerContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TUCallFaceTimeRemoteIDSDestinationKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = v8;
    if (v7)
      -[NSDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, v7);
    remoteIDSDestinations = v5->_remoteIDSDestinations;
    v5->_remoteIDSDestinations = v9;
    v11 = v9;

    v5->_streamToken = objc_msgSend(v4, "videoStreamToken");
    objc_msgSend(v4, "providerContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("TUCallFaceTimeRemoteMomentsAvailableKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_remoteMomentsAvailable = objc_msgSend(v13, "BOOLValue");

    requesterID = v5->_requesterID;
    v5->_requesterID = 0;

  }
  return v5;
}

- (TUMomentsProvider)initWithConversation:(id)a3
{
  id v4;
  TUMomentsProvider *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSDictionary *remoteIDSDestinations;
  void *v24;
  uint64_t v25;
  NSString *requesterID;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)TUMomentsProvider;
  v5 = -[TUMomentsProvider init](&v32, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v4, "activeRemoteParticipants", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v12, "avcIdentifier");
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = (void *)v13;
            objc_msgSend(v12, "activeIDSDestination");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              objc_msgSend(v12, "activeIDSDestination");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "avcIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v17);

            }
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v4, "isOneToOneModeEnabled")
      && !objc_msgSend(v6, "count")
      && (objc_msgSend(v4, "isBackedByGroupSession") & 1) == 0)
    {
      objc_msgSend(v4, "activeRemoteParticipants");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "allObjects");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "activeIDSDestination");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, v21);

    }
    v22 = objc_msgSend(v6, "copy");
    remoteIDSDestinations = v5->_remoteIDSDestinations;
    v5->_remoteIDSDestinations = (NSDictionary *)v22;

    v5->_streamToken = objc_msgSend(v4, "avcSessionToken");
    v5->_remoteMomentsAvailable = 1;
    objc_msgSend(v4, "avcSessionIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    requesterID = v5->_requesterID;
    v5->_requesterID = (NSString *)v25;

  }
  return v5;
}

- (BOOL)isEqualToProvider:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  v5 = -[TUMomentsProvider streamToken](self, "streamToken");
  if (v5 == objc_msgSend(v4, "streamToken"))
  {
    -[TUMomentsProvider remoteIDSDestinations](self, "remoteIDSDestinations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteIDSDestinations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToDictionary:", v7))
    {
      objc_msgSend(v4, "requesterID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUMomentsProvider requesterID](self, "requesterID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v9)
      {
        v12 = 1;
      }
      else
      {
        -[TUMomentsProvider requesterID](self, "requesterID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "requesterID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

      }
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" streamToken=%ld"), -[TUMomentsProvider streamToken](self, "streamToken"));
  -[TUMomentsProvider remoteIDSDestinations](self, "remoteIDSDestinations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" remoteIDSDestinations=%@"), v4);

  -[TUMomentsProvider requesterID](self, "requesterID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" requesterID=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (NSString)requesterID
{
  return self->_requesterID;
}

- (NSDictionary)remoteIDSDestinations
{
  return self->_remoteIDSDestinations;
}

- (BOOL)isRemoteMomentsAvailable
{
  return self->_remoteMomentsAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteIDSDestinations, 0);
  objc_storeStrong((id *)&self->_requesterID, 0);
}

@end
