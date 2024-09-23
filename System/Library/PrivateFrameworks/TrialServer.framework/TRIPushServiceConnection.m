@implementation TRIPushServiceConnection

- (TRIPushServiceConnection)initWithDelegate:(id)a3
{
  id v5;
  TRIPushServiceConnection *v6;
  TRIPushServiceConnection *v7;
  uint64_t v8;
  OS_dispatch_queue *pushServiceQueue;
  uint64_t v10;
  OS_dispatch_queue *subscriptionRequestQueue;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  APSConnection *connection;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint8_t v22[16];
  objc_super v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TRIPushServiceConnection;
  v6 = -[TRIPushServiceConnection init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_triDelegate, a3);
    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.triald.pushServiceQueue", 17);
    v8 = objc_claimAutoreleasedReturnValue();
    pushServiceQueue = v7->_pushServiceQueue;
    v7->_pushServiceQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.triald.subscriptionRequestQueue", 17);
    v10 = objc_claimAutoreleasedReturnValue();
    subscriptionRequestQueue = v7->_subscriptionRequestQueue;
    v7->_subscriptionRequestQueue = (OS_dispatch_queue *)v10;

    v12 = objc_alloc(MEMORY[0x1E0CFE148]);
    v13 = *MEMORY[0x1E0CFE130];
    -[TRIPushServiceConnection pushServiceQueue](v7, "pushServiceQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "initWithEnvironmentName:namedDelegatePort:queue:", v13, CFSTR("com.apple.aps.triald"), v14);
    connection = v7->_connection;
    v7->_connection = (APSConnection *)v15;

    -[TRIPushServiceConnection connection](v7, "connection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v24[0] = CFSTR("com.apple.triald");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIPushServiceConnection connection](v7, "connection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_setOpportunisticTopics:", v18);

      -[TRIPushServiceConnection connection](v7, "connection");
      v20 = objc_claimAutoreleasedReturnValue();
      -[NSObject setDelegate:](v20, "setDelegate:", v7);
    }
    else
    {
      TRILogCategory_Server();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v22 = 0;
        _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, "Failed to create an APSConnection", v22, 2u);
      }
    }

  }
  return v7;
}

- (void)subscribeToChannel:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TRIPushServiceConnection subscriptionRequestQueue](self, "subscriptionRequestQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__TRIPushServiceConnection_subscribeToChannel___block_invoke;
  v7[3] = &unk_1E932F8C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __47__TRIPushServiceConnection_subscribeToChannel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_subscribeToChannel:", *(_QWORD *)(a1 + 40));
}

- (void)_subscribeToChannel:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  unint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[TRIPushServiceConnection _subscribedChannelCount](self, "_subscribedChannelCount");
  if (v5 < 0x64)
  {
    -[TRIPushServiceConnection _publicChannelForChannelId:](self, "_publicChannelForChannelId:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = (unint64_t)v4;
        _os_log_impl(&dword_1D207F000, v9, OS_LOG_TYPE_DEFAULT, "Subscribing to channel %@", (uint8_t *)&v10, 0xCu);
      }

      -[TRIPushServiceConnection connection](self, "connection");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject subscribeToChannel:forTopic:](v9, "subscribeToChannel:forTopic:", v7, CFSTR("com.apple.triald"));
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = (unint64_t)v4;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "Could not subscribe to channel %@", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    v6 = v5;
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 134218240;
      v11 = v6;
      v12 = 2048;
      v13 = 100;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "New subscription denied since we reached the channel limit (%tu >= %tu)", (uint8_t *)&v10, 0x16u);
    }
  }

}

- (void)unsubscribeFromChannel:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TRIPushServiceConnection subscriptionRequestQueue](self, "subscriptionRequestQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__TRIPushServiceConnection_unsubscribeFromChannel___block_invoke;
  v7[3] = &unk_1E932F8C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __51__TRIPushServiceConnection_unsubscribeFromChannel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unsubscribeFromChannel:", *(_QWORD *)(a1 + 40));
}

- (void)_unsubscribeFromChannel:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TRIPushServiceConnection _publicChannelForChannelId:](self, "_publicChannelForChannelId:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TRILogCategory_Server();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "Unsubscribing from channel %@", (uint8_t *)&v8, 0xCu);
    }

    -[TRIPushServiceConnection connection](self, "connection");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject unsubscribeFromChannel:forTopic:](v7, "unsubscribeFromChannel:forTopic:", v5, CFSTR("com.apple.triald"));
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "Could not unsubscribe from channel %@", (uint8_t *)&v8, 0xCu);
  }

}

- (id)_publicChannelForChannelId:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
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
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v12 = 138412802;
        v13 = v3;
        v14 = 2048;
        v15 = objc_msgSend(v6, "length");
        v16 = 2048;
        v17 = 16;
        _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "Received channel id %@ with length %tu > %tu", (uint8_t *)&v12, 0x20u);
      }

    }
  }
  v8 = objc_alloc(MEMORY[0x1E0CD22E8]);
  objc_msgSend(v3, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithChannelID:", v9);

  return v10;
}

- (id)subscribedChannelIds
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[TRIPushServiceConnection connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "registeredChannelsForTopic:error:", CFSTR("com.apple.triald"), &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;

  if (v3)
  {
    objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v4;
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Couldn't get registered channels: %{public}@", buf, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

uint64_t __48__TRIPushServiceConnection_subscribedChannelIds__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "channelID");
}

- (unint64_t)_subscribedChannelCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[TRIPushServiceConnection subscribedChannelIds](self, "subscribedChannelIds");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "count");
  else
    v4 = 0;

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[TRIPushServiceConnection connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)TRIPushServiceConnection;
  -[TRIPushServiceConnection dealloc](&v4, sel_dealloc);
}

- (void)connection:(id)a3 channelSubscriptionsFailedWithFailures:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  TRILogCategory_Server();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_error_impl(&dword_1D207F000, v5, OS_LOG_TYPE_ERROR, "Failed to subscribe to some channels: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  NSObject *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("notification-content"));
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 0);
      if (v9)
      {
        v19 = 0;
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0F70]), "initWithData:error:", v9, &v19);
        v11 = v19;
        TRILogCategory_Server();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v10)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v10, "description");
            v14 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v21 = v14;
            _os_log_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEFAULT, "Received notification: %@", buf, 0xCu);

          }
          -[TRIPushServiceConnection triDelegate](self, "triDelegate");
          v13 = objc_claimAutoreleasedReturnValue();
          -[NSObject didReceivePushNotification:](v13, "didReceivePushNotification:", v10);
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v6, "userInfo");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "channelID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v21 = v11;
          v22 = 2112;
          v23 = v17;
          v24 = 2112;
          v25 = v18;
          _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Unable to deserialize push notification with decode error %@. Received %@ on channel %@", buf, 0x20u);

        }
        goto LABEL_18;
      }
      TRILogCategory_Server();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
LABEL_19:

        goto LABEL_20;
      }
      objc_msgSend(v6, "channelID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v8;
      v22 = 2112;
      v23 = v10;
      v15 = "Received invalid base 64 notification content. Received %@ on channel %@";
      v16 = v11;
    }
    else
    {
      TRILogCategory_Server();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
LABEL_20:

        goto LABEL_21;
      }
      objc_msgSend(v6, "userInfo");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "channelID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v11;
      v22 = 2114;
      v23 = v10;
      v15 = "Expected notification content not found. Received %{public}@ on channel %{public}@";
      v16 = v9;
    }
    _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, v15, buf, 0x16u);
LABEL_18:

    goto LABEL_19;
  }
  TRILogCategory_Server();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "-connection:didReceiveIncomingMessage: called without a message", buf, 2u);
  }
LABEL_21:

}

- (OS_dispatch_queue)pushServiceQueue
{
  return self->_pushServiceQueue;
}

- (OS_dispatch_queue)subscriptionRequestQueue
{
  return self->_subscriptionRequestQueue;
}

- (TRIPushServiceConnectionDelegate)triDelegate
{
  return self->_triDelegate;
}

- (APSConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_triDelegate, 0);
  objc_storeStrong((id *)&self->_subscriptionRequestQueue, 0);
  objc_storeStrong((id *)&self->_pushServiceQueue, 0);
}

@end
