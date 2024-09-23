@implementation TUConversationUnreliableMessengerConfig

- (TUConversationUnreliableMessengerConfig)initWithEstablishChannelMaxAttempts:(unint64_t)a3 establishChannelRetryIntervalMillis:(unint64_t)a4 egressMessagePayloadMaxSizeBytes:(unint64_t)a5 channelStreamMaxQueueSize:(unint64_t)a6 channelStreamMaxTries:(unint64_t)a7 channelStreamRetryIntervalMillis:(unint64_t)a8 seqNumBufferSize:(unint64_t)a9
{
  TUConversationUnreliableMessengerConfig *result;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TUConversationUnreliableMessengerConfig;
  result = -[TUConversationUnreliableMessengerConfig init](&v16, sel_init);
  if (result)
  {
    result->_establishChannelMaxAttempts = a3;
    result->_establishChannelRetryIntervalMillis = a4;
    result->_egressMessagePayloadMaxSizeBytes = a5;
    result->_channelStreamMaxQueueSize = a6;
    result->_channelStreamMaxTries = a7;
    result->_channelStreamRetryIntervalMillis = a8;
    result->_seqNumBufferSize = a9;
  }
  return result;
}

+ (id)shared
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithEstablishChannelMaxAttempts:establishChannelRetryIntervalMillis:egressMessagePayloadMaxSizeBytes:channelStreamMaxQueueSize:channelStreamMaxTries:channelStreamRetryIntervalMillis:seqNumBufferSize:", 3, 1000, 1180, 1000, 3, 3000, 1024);
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" establishChannelMaxAttempts=%lu"), -[TUConversationUnreliableMessengerConfig establishChannelMaxAttempts](self, "establishChannelMaxAttempts"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" establishChannelRetryIntervalMillis=%lu"), -[TUConversationUnreliableMessengerConfig establishChannelRetryIntervalMillis](self, "establishChannelRetryIntervalMillis"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" egressMessagePayloadMaxSizeBytes=%lu"), -[TUConversationUnreliableMessengerConfig egressMessagePayloadMaxSizeBytes](self, "egressMessagePayloadMaxSizeBytes"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" channelStreamMaxQueueSize=%lu"), -[TUConversationUnreliableMessengerConfig channelStreamMaxQueueSize](self, "channelStreamMaxQueueSize"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" channelStreamMaxTries=%lu"), -[TUConversationUnreliableMessengerConfig channelStreamMaxTries](self, "channelStreamMaxTries"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" channelStreamRetryIntervalMillis=%lu"), -[TUConversationUnreliableMessengerConfig channelStreamRetryIntervalMillis](self, "channelStreamRetryIntervalMillis"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" seqNumBufferSize=%lu"), -[TUConversationUnreliableMessengerConfig seqNumBufferSize](self, "seqNumBufferSize"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TUConversationUnreliableMessengerConfig isEqualToConversationUnreliableMessengerConfig:](self, "isEqualToConversationUnreliableMessengerConfig:", v4);

  return v5;
}

- (BOOL)isEqualToConversationUnreliableMessengerConfig:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = a3;
  v5 = -[TUConversationUnreliableMessengerConfig establishChannelMaxAttempts](self, "establishChannelMaxAttempts");
  if (v5 == objc_msgSend(v4, "establishChannelMaxAttempts")
    && (v6 = -[TUConversationUnreliableMessengerConfig establishChannelRetryIntervalMillis](self, "establishChannelRetryIntervalMillis"), v6 == objc_msgSend(v4, "establishChannelRetryIntervalMillis"))&& (v7 = -[TUConversationUnreliableMessengerConfig egressMessagePayloadMaxSizeBytes](self, "egressMessagePayloadMaxSizeBytes"), v7 == objc_msgSend(v4, "egressMessagePayloadMaxSizeBytes"))&& (v8 = -[TUConversationUnreliableMessengerConfig channelStreamMaxQueueSize](self, "channelStreamMaxQueueSize"), v8 == objc_msgSend(v4, "channelStreamMaxQueueSize"))&& (v9 = -[TUConversationUnreliableMessengerConfig channelStreamMaxTries](self, "channelStreamMaxTries"), v9 == objc_msgSend(v4, "channelStreamMaxTries"))&& (v10 = -[TUConversationUnreliableMessengerConfig channelStreamRetryIntervalMillis](self, "channelStreamRetryIntervalMillis"), v10 == objc_msgSend(v4, "channelStreamRetryIntervalMillis"))&& (v11 = -[TUConversationUnreliableMessengerConfig seqNumBufferSize](self, "seqNumBufferSize"), v11 == objc_msgSend(v4, "seqNumBufferSize")))
  {
    -[TUConversationUnreliableMessengerConfig idsAliasingSalt](self, "idsAliasingSalt");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "idsAliasingSalt");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 == v13)
    {
      v16 = 1;
    }
    else
    {
      -[TUConversationUnreliableMessengerConfig idsAliasingSalt](self, "idsAliasingSalt");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "idsAliasingSalt");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqualToData:", v15);

    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;

  v3 = -[TUConversationUnreliableMessengerConfig establishChannelMaxAttempts](self, "establishChannelMaxAttempts");
  v4 = -[TUConversationUnreliableMessengerConfig establishChannelRetryIntervalMillis](self, "establishChannelRetryIntervalMillis") ^ v3;
  v5 = -[TUConversationUnreliableMessengerConfig egressMessagePayloadMaxSizeBytes](self, "egressMessagePayloadMaxSizeBytes");
  v6 = v4 ^ v5 ^ -[TUConversationUnreliableMessengerConfig channelStreamMaxQueueSize](self, "channelStreamMaxQueueSize");
  v7 = -[TUConversationUnreliableMessengerConfig channelStreamMaxTries](self, "channelStreamMaxTries");
  v8 = v7 ^ -[TUConversationUnreliableMessengerConfig channelStreamRetryIntervalMillis](self, "channelStreamRetryIntervalMillis");
  v9 = v6 ^ v8 ^ -[TUConversationUnreliableMessengerConfig seqNumBufferSize](self, "seqNumBufferSize");
  -[TUConversationUnreliableMessengerConfig idsAliasingSalt](self, "idsAliasingSalt");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithEstablishChannelMaxAttempts:establishChannelRetryIntervalMillis:egressMessagePayloadMaxSizeBytes:channelStreamMaxQueueSize:channelStreamMaxTries:channelStreamRetryIntervalMillis:seqNumBufferSize:", -[TUConversationUnreliableMessengerConfig establishChannelMaxAttempts](self, "establishChannelMaxAttempts"), -[TUConversationUnreliableMessengerConfig establishChannelRetryIntervalMillis](self, "establishChannelRetryIntervalMillis"), -[TUConversationUnreliableMessengerConfig egressMessagePayloadMaxSizeBytes](self, "egressMessagePayloadMaxSizeBytes"), -[TUConversationUnreliableMessengerConfig channelStreamMaxQueueSize](self, "channelStreamMaxQueueSize"), -[TUConversationUnreliableMessengerConfig channelStreamMaxTries](self, "channelStreamMaxTries"), -[TUConversationUnreliableMessengerConfig channelStreamRetryIntervalMillis](self, "channelStreamRetryIntervalMillis"), -[TUConversationUnreliableMessengerConfig seqNumBufferSize](self, "seqNumBufferSize"));
  -[TUConversationUnreliableMessengerConfig idsAliasingSalt](self, "idsAliasingSalt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdsAliasingSalt:", v5);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationUnreliableMessengerConfig)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  TUConversationUnreliableMessengerConfig *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v4 = a3;
  NSStringFromSelector(sel_establishChannelMaxAttempts);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", v5);

  NSStringFromSelector(sel_establishChannelRetryIntervalMillis);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", v7);

  NSStringFromSelector(sel_egressMessagePayloadMaxSizeBytes);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", v9);

  NSStringFromSelector(sel_channelStreamMaxQueueSize);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "decodeIntegerForKey:", v11);

  NSStringFromSelector(sel_channelStreamMaxTries);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "decodeIntegerForKey:", v13);

  NSStringFromSelector(sel_channelStreamRetryIntervalMillis);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v4, "decodeIntegerForKey:", v15);

  NSStringFromSelector(sel_seqNumBufferSize);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v4, "decodeIntegerForKey:", v17);

  v19 = -[TUConversationUnreliableMessengerConfig initWithEstablishChannelMaxAttempts:establishChannelRetryIntervalMillis:egressMessagePayloadMaxSizeBytes:channelStreamMaxQueueSize:channelStreamMaxTries:channelStreamRetryIntervalMillis:seqNumBufferSize:](self, "initWithEstablishChannelMaxAttempts:establishChannelRetryIntervalMillis:egressMessagePayloadMaxSizeBytes:channelStreamMaxQueueSize:channelStreamMaxTries:channelStreamRetryIntervalMillis:seqNumBufferSize:", v6, v8, v10, v12, v14, v16, v18);
  if (v19)
  {
    v20 = objc_opt_class();
    NSStringFromSelector(sel_idsAliasingSalt);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUConversationUnreliableMessengerConfig setIdsAliasingSalt:](v19, "setIdsAliasingSalt:", v22);

  }
  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v4 = a3;
  v5 = -[TUConversationUnreliableMessengerConfig establishChannelMaxAttempts](self, "establishChannelMaxAttempts");
  NSStringFromSelector(sel_establishChannelMaxAttempts);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, v6);

  v7 = -[TUConversationUnreliableMessengerConfig establishChannelRetryIntervalMillis](self, "establishChannelRetryIntervalMillis");
  NSStringFromSelector(sel_establishChannelRetryIntervalMillis);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v7, v8);

  v9 = -[TUConversationUnreliableMessengerConfig egressMessagePayloadMaxSizeBytes](self, "egressMessagePayloadMaxSizeBytes");
  NSStringFromSelector(sel_egressMessagePayloadMaxSizeBytes);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v9, v10);

  v11 = -[TUConversationUnreliableMessengerConfig channelStreamMaxQueueSize](self, "channelStreamMaxQueueSize");
  NSStringFromSelector(sel_channelStreamMaxQueueSize);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v11, v12);

  v13 = -[TUConversationUnreliableMessengerConfig channelStreamMaxTries](self, "channelStreamMaxTries");
  NSStringFromSelector(sel_channelStreamMaxTries);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v13, v14);

  v15 = -[TUConversationUnreliableMessengerConfig channelStreamRetryIntervalMillis](self, "channelStreamRetryIntervalMillis");
  NSStringFromSelector(sel_channelStreamRetryIntervalMillis);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v15, v16);

  v17 = -[TUConversationUnreliableMessengerConfig seqNumBufferSize](self, "seqNumBufferSize");
  NSStringFromSelector(sel_seqNumBufferSize);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v17, v18);

  -[TUConversationUnreliableMessengerConfig idsAliasingSalt](self, "idsAliasingSalt");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_idsAliasingSalt);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, v19);

}

- (unint64_t)establishChannelMaxAttempts
{
  return self->_establishChannelMaxAttempts;
}

- (unint64_t)establishChannelRetryIntervalMillis
{
  return self->_establishChannelRetryIntervalMillis;
}

- (unint64_t)egressMessagePayloadMaxSizeBytes
{
  return self->_egressMessagePayloadMaxSizeBytes;
}

- (unint64_t)channelStreamMaxQueueSize
{
  return self->_channelStreamMaxQueueSize;
}

- (unint64_t)channelStreamMaxTries
{
  return self->_channelStreamMaxTries;
}

- (unint64_t)channelStreamRetryIntervalMillis
{
  return self->_channelStreamRetryIntervalMillis;
}

- (unint64_t)seqNumBufferSize
{
  return self->_seqNumBufferSize;
}

- (NSData)idsAliasingSalt
{
  return self->_idsAliasingSalt;
}

- (void)setIdsAliasingSalt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsAliasingSalt, 0);
}

@end
