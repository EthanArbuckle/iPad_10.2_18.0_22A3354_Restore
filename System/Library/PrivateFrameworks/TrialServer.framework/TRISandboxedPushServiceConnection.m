@implementation TRISandboxedPushServiceConnection

- (TRISandboxedPushServiceConnection)init
{
  TRISandboxedPushServiceConnection *v2;
  TRISandboxedPushServiceConnection *v3;
  void *v4;
  uint64_t v5;
  NSMutableArray *channels;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TRISandboxedPushServiceConnection;
  v2 = -[TRISandboxedPushServiceConnection init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[TRISandboxedPushServiceConnection _readPersistedSubscriptions](v2, "_readPersistedSubscriptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "mutableCopy");
    channels = v3->_channels;
    v3->_channels = (NSMutableArray *)v5;

  }
  return v3;
}

- (void)subscribeToChannel:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TRISandboxedPushServiceConnection channels](self, "channels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 >= 0x64)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[TRISandboxedPushServiceConnection channels](self, "channels");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 134218240;
      v13 = objc_msgSend(v11, "count");
      v14 = 2048;
      v15 = 100;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "[Sandbox] New subscription denied since we reached the channel limit (%tu >= %tu)", (uint8_t *)&v12, 0x16u);

    }
  }
  else
  {
    -[TRISandboxedPushServiceConnection _validateChannelForChannelId:](self, "_validateChannelForChannelId:", v4);
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = (uint64_t)v4;
      _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "[Sandbox] Subscribing to channel %@", (uint8_t *)&v12, 0xCu);
    }

    -[TRISandboxedPushServiceConnection channels](self, "channels");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

    -[TRISandboxedPushServiceConnection _persistSubscriptions](self, "_persistSubscriptions");
  }

}

- (void)unsubscribeFromChannel:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TRISandboxedPushServiceConnection _validateChannelForChannelId:](self, "_validateChannelForChannelId:", v4);
  TRILogCategory_Server();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "[Sandbox] Unsubscribing from channel %@", (uint8_t *)&v8, 0xCu);
  }

  -[TRISandboxedPushServiceConnection channels](self, "channels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v7);

  -[TRISandboxedPushServiceConnection _persistSubscriptions](self, "_persistSubscriptions");
}

- (void)_validateChannelForChannelId:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "type") == 1)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99D50]);
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithBase64EncodedString:options:", v5, 0);

    if ((unint64_t)objc_msgSend(v6, "length") >= 0x11)
    {
      TRILogCategory_Server();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138412802;
        v9 = v3;
        v10 = 2048;
        v11 = objc_msgSend(v6, "length");
        v12 = 2048;
        v13 = 16;
        _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "[Sandbox] Received channel id %@ with length %tu > %tu", (uint8_t *)&v8, 0x20u);
      }

    }
  }

}

- (id)_readPersistedSubscriptions
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t v8[16];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", CFSTR("com.apple.triald.aps.subscriptions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "[Sandbox] Unable to unarchive persisted subscriptions", v8, 2u);
    }

    v5 = (id)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (void)_persistSubscriptions
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRISandboxedPushServiceConnection channels](self, "channels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("com.apple.triald.aps.subscriptions"));

  TRILogCategory_Server();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("com.apple.triald.aps.subscriptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "[Sandbox] Just persisted subscriptions. Now persisted: %@", (uint8_t *)&v7, 0xCu);

  }
}

- (NSMutableArray)channels
{
  return self->_channels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channels, 0);
}

@end
