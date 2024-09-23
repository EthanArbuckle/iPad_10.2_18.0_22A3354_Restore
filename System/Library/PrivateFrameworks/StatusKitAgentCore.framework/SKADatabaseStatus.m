@implementation SKADatabaseStatus

- (SKADatabaseStatus)initWithCoreDataStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SKADatabaseStatus *v12;

  v4 = a3;
  objc_msgSend(v4, "channelIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "datePublished");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateReceived");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateExpired");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rawData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[SKADatabaseStatus initWithChannelIdentifier:dateCreated:datePublished:dateReceived:dateExpired:rawData:uniqueIdentifier:](self, "initWithChannelIdentifier:dateCreated:datePublished:dateReceived:dateExpired:rawData:uniqueIdentifier:", v5, v6, v7, v8, v9, v10, v11);
  return v12;
}

- (SKADatabaseStatus)initWithChannelIdentifier:(id)a3 dateCreated:(id)a4 datePublished:(id)a5 dateReceived:(id)a6 dateExpired:(id)a7 rawData:(id)a8 uniqueIdentifier:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  SKADatabaseStatus *v22;
  uint64_t v23;
  NSString *channelIdentifier;
  uint64_t v25;
  NSDate *dateCreated;
  uint64_t v27;
  NSDate *datePublished;
  uint64_t v29;
  NSDate *dateReceived;
  uint64_t v31;
  NSDate *dateExpired;
  uint64_t v33;
  NSString *uniqueIdentifier;
  objc_super v36;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v36.receiver = self;
  v36.super_class = (Class)SKADatabaseStatus;
  v22 = -[SKADatabaseStatus init](&v36, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v15, "copy");
    channelIdentifier = v22->_channelIdentifier;
    v22->_channelIdentifier = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    dateCreated = v22->_dateCreated;
    v22->_dateCreated = (NSDate *)v25;

    v27 = objc_msgSend(v17, "copy");
    datePublished = v22->_datePublished;
    v22->_datePublished = (NSDate *)v27;

    v29 = objc_msgSend(v18, "copy");
    dateReceived = v22->_dateReceived;
    v22->_dateReceived = (NSDate *)v29;

    v31 = objc_msgSend(v19, "copy");
    dateExpired = v22->_dateExpired;
    v22->_dateExpired = (NSDate *)v31;

    objc_storeStrong((id *)&v22->_rawData, a8);
    v33 = objc_msgSend(v21, "copy");
    uniqueIdentifier = v22->_uniqueIdentifier;
    v22->_uniqueIdentifier = (NSString *)v33;

  }
  return v22;
}

- (BOOL)isExpired
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[SKADatabaseStatus dateExpired](self, "dateExpired");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SKADatabaseStatus dateExpired](self, "dateExpired");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSince1970");
    v6 = v5;
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    v9 = v6 < v8;

  }
  else
  {
    v9 = 0;
  }

  +[SKADatabaseStatus logger](SKADatabaseStatus, "logger");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[SKADatabaseStatus dateExpired](self, "dateExpired");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v11;
    v15 = 1024;
    v16 = v9;
    _os_log_impl(&dword_2188DF000, v10, OS_LOG_TYPE_DEFAULT, "Date expired: %@, isExpired: %d", (uint8_t *)&v13, 0x12u);

  }
  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[SKADatabaseStatus uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKADatabaseStatus channelIdentifier](self, "channelIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKADatabaseStatus dateCreated](self, "dateCreated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKADatabaseStatus dateExpired](self, "dateExpired");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; uniqueIdentifier = \"%@\"; channelIdentifier = \"%@\"; dateCreated = \"%@\"; dateExpired = \"%@\">;"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)logger
{
  if (logger_onceToken_18 != -1)
    dispatch_once(&logger_onceToken_18, &__block_literal_global_18);
  return (id)logger__logger_18;
}

void __27__SKADatabaseStatus_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKADatabaseStatus");
  v1 = (void *)logger__logger_18;
  logger__logger_18 = (uint64_t)v0;

}

- (NSString)channelIdentifier
{
  return self->_channelIdentifier;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSDate)datePublished
{
  return self->_datePublished;
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (NSDate)dateExpired
{
  return self->_dateExpired;
}

- (NSData)rawData
{
  return self->_rawData;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
  objc_storeStrong((id *)&self->_dateExpired, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_datePublished, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_channelIdentifier, 0);
}

@end
