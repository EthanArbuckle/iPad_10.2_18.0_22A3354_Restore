@implementation SKAGeneratedEncryptionKey

- (SKAGeneratedEncryptionKey)initWithCoreDataGeneratedEncryptionKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SKAGeneratedEncryptionKey *v7;

  v4 = a3;
  objc_msgSend(v4, "originalOutgoingRatchetState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SKAGeneratedEncryptionKey initWithOriginalOutgoingRatchetState:dateGenerated:](self, "initWithOriginalOutgoingRatchetState:dateGenerated:", v5, v6);
  return v7;
}

- (SKAGeneratedEncryptionKey)initWithOriginalOutgoingRatchetState:(id)a3 dateGenerated:(id)a4
{
  id v7;
  id v8;
  SKAGeneratedEncryptionKey *v9;
  SKAGeneratedEncryptionKey *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SKAGeneratedEncryptionKey;
  v9 = -[SKAGeneratedEncryptionKey init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_originalOutgoingRatchetState, a3);
    objc_storeStrong((id *)&v10->_dateGenerated, a4);
  }

  return v10;
}

+ (id)logger
{
  if (logger_onceToken_23 != -1)
    dispatch_once(&logger_onceToken_23, &__block_literal_global_23);
  return (id)logger__logger_23;
}

void __35__SKAGeneratedEncryptionKey_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKAGeneratedEncryptionKey");
  v1 = (void *)logger__logger_23;
  logger__logger_23 = (uint64_t)v0;

}

- (NSData)originalOutgoingRatchetState
{
  return self->_originalOutgoingRatchetState;
}

- (NSDate)dateGenerated
{
  return self->_dateGenerated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateGenerated, 0);
  objc_storeStrong((id *)&self->_originalOutgoingRatchetState, 0);
}

- (MPStatusKitOutgoingRatchet)outgoingRatchet
{
  NSData *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;

  v2 = self->_originalOutgoingRatchetState;
  if (v2)
  {
    v14 = 0;
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66650]), "initWithData:error:", v2, &v14);
    v4 = v14;
    if (!v3)
    {
      +[SKAGeneratedEncryptionKey logger](SKAGeneratedEncryptionKey, "logger");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[SKAGeneratedEncryptionKey(Ratchets) outgoingRatchet].cold.2((uint64_t)v4, v5);

    }
  }
  else
  {
    +[SKAGeneratedEncryptionKey logger](SKAGeneratedEncryptionKey, "logger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SKAGeneratedEncryptionKey(Ratchets) outgoingRatchet].cold.1(v4, v6, v7, v8, v9, v10, v11, v12);
    v3 = 0;
  }

  return (MPStatusKitOutgoingRatchet *)v3;
}

- (MPStatusKitIncomingRatchet)incomingRatchet
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;

  -[SKAGeneratedEncryptionKey outgoingRatchet](self, "outgoingRatchet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "currentSubscriptionKeys");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = objc_alloc(MEMORY[0x24BE66648]);
      v6 = -[NSObject index](v4, "index");
      -[NSObject chainKey](v4, "chainKey");
      v7 = objc_claimAutoreleasedReturnValue();
      -[NSObject signingKey](v4, "signingKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      v9 = (void *)objc_msgSend(v5, "initWithIndex:chainKey:signingKey:error:", v6, v7, v8, &v25);

    }
    else
    {
      +[SKAGeneratedEncryptionKey logger](SKAGeneratedEncryptionKey, "logger");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[SKAGeneratedEncryptionKey(Ratchets) incomingRatchet].cold.2(v7, v17, v18, v19, v20, v21, v22, v23);
      v9 = 0;
    }

  }
  else
  {
    +[SKAGeneratedEncryptionKey logger](SKAGeneratedEncryptionKey, "logger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SKAGeneratedEncryptionKey(Ratchets) incomingRatchet].cold.1(v4, v10, v11, v12, v13, v14, v15, v16);
    v9 = 0;
  }

  return (MPStatusKitIncomingRatchet *)v9;
}

@end
