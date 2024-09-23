@implementation SUCoreEventReporterActive

- (SUCoreEventReporterActive)initWithServerURL:(id)a3
{
  id v5;
  SUCoreEventReporterActive *v6;
  SUCoreEventReporterActive *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCoreEventReporterActive;
  v6 = -[SUCoreEventReporterActive init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serverURL, a3);
    v7->_discoveredCancelingCount = 0;
    *(_OWORD *)&v7->_attemptedSendCount = 0u;
    *(_OWORD *)&v7->_discoveredRunningCount = 0u;
  }

  return v7;
}

- (SUCoreEventReporterActive)initWithCoder:(id)a3
{
  id v4;
  SUCoreEventReporterActive *v5;
  uint64_t v6;
  NSURL *serverURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCoreEventReporterActive;
  v5 = -[SUCoreEventReporterActive init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ServerURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    serverURL = v5->_serverURL;
    v5->_serverURL = (NSURL *)v6;

    v5->_attemptedSendCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AttemptedSendCount"));
    v5->_failedSendCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FailedSendCount"));
    v5->_discoveredRunningCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DiscoveredRunningCount"));
    v5->_discoveredSuspendedCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DiscoveredSuspendedCount"));
    v5->_discoveredCancelingCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DiscoveredCancelingCount"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SUCoreEventReporterActive serverURL](self, "serverURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("ServerURL"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[SUCoreEventReporterActive attemptedSendCount](self, "attemptedSendCount"), CFSTR("AttemptedSendCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[SUCoreEventReporterActive failedSendCount](self, "failedSendCount"), CFSTR("FailedSendCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[SUCoreEventReporterActive discoveredRunningCount](self, "discoveredRunningCount"), CFSTR("DiscoveredRunningCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[SUCoreEventReporterActive discoveredSuspendedCount](self, "discoveredSuspendedCount"), CFSTR("DiscoveredSuspendedCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[SUCoreEventReporterActive discoveredCancelingCount](self, "discoveredCancelingCount"), CFSTR("DiscoveredCancelingCount"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)toArchivedData
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
}

- (id)initFromArchivedData:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3710];
  v5 = a3;
  objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  SUCoreEventReporterActive *v4;
  SUCoreEventReporterActive *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;

  v4 = (SUCoreEventReporterActive *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SUCoreEventReporterActive serverURL](self, "serverURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreEventReporterActive serverURL](v5, "serverURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[SUCore objectIsEqual:to:](SUCore, "objectIsEqual:to:", v6, v7)
        && (v8 = -[SUCoreEventReporterActive attemptedSendCount](v5, "attemptedSendCount"),
            v8 == -[SUCoreEventReporterActive attemptedSendCount](self, "attemptedSendCount"))
        && (v9 = -[SUCoreEventReporterActive failedSendCount](v5, "failedSendCount"),
            v9 == -[SUCoreEventReporterActive failedSendCount](self, "failedSendCount"))
        && (v10 = -[SUCoreEventReporterActive discoveredRunningCount](v5, "discoveredRunningCount"),
            v10 == -[SUCoreEventReporterActive discoveredRunningCount](self, "discoveredRunningCount"))
        && (v11 = -[SUCoreEventReporterActive discoveredSuspendedCount](v5, "discoveredSuspendedCount"),
            v11 == -[SUCoreEventReporterActive discoveredSuspendedCount](self, "discoveredSuspendedCount")))
      {
        v12 = -[SUCoreEventReporterActive discoveredCancelingCount](v5, "discoveredCancelingCount");
        v13 = v12 == -[SUCoreEventReporterActive discoveredCancelingCount](self, "discoveredCancelingCount");
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (id)description
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCoreEventReporterActive serverURL](self, "serverURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SUCoreEventReporterActive serverURL](self, "serverURL");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("DEFAULT");
  }
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("serverURL:%@ attemptedSendCount:%d failedSendCount:%d discoveredRunningCount:%d discoveredSuspendedCount:%d discoveredCancelingCount:%d"), v5, -[SUCoreEventReporterActive attemptedSendCount](self, "attemptedSendCount"), -[SUCoreEventReporterActive failedSendCount](self, "failedSendCount"), -[SUCoreEventReporterActive discoveredRunningCount](self, "discoveredRunningCount"), -[SUCoreEventReporterActive discoveredSuspendedCount](self, "discoveredSuspendedCount"), -[SUCoreEventReporterActive discoveredCancelingCount](self, "discoveredCancelingCount"));
  if (v4)

  return v6;
}

- (NSURL)serverURL
{
  return self->_serverURL;
}

- (void)setServerURL:(id)a3
{
  objc_storeStrong((id *)&self->_serverURL, a3);
}

- (int64_t)attemptedSendCount
{
  return self->_attemptedSendCount;
}

- (void)setAttemptedSendCount:(int64_t)a3
{
  self->_attemptedSendCount = a3;
}

- (int64_t)failedSendCount
{
  return self->_failedSendCount;
}

- (void)setFailedSendCount:(int64_t)a3
{
  self->_failedSendCount = a3;
}

- (int64_t)discoveredRunningCount
{
  return self->_discoveredRunningCount;
}

- (void)setDiscoveredRunningCount:(int64_t)a3
{
  self->_discoveredRunningCount = a3;
}

- (int64_t)discoveredSuspendedCount
{
  return self->_discoveredSuspendedCount;
}

- (void)setDiscoveredSuspendedCount:(int64_t)a3
{
  self->_discoveredSuspendedCount = a3;
}

- (int64_t)discoveredCancelingCount
{
  return self->_discoveredCancelingCount;
}

- (void)setDiscoveredCancelingCount:(int64_t)a3
{
  self->_discoveredCancelingCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverURL, 0);
}

@end
