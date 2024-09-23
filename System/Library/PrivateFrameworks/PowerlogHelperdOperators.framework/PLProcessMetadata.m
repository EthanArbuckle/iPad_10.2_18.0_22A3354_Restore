@implementation PLProcessMetadata

- (PLProcessMetadata)initWithPid:(int)a3
{
  uint64_t v3;
  PLProcessMetadata *v4;
  PLProcessMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = *(_QWORD *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)PLProcessMetadata;
  v4 = -[PLProcessMetadata init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    -[PLProcessMetadata setPid:](v4, "setPid:", v3);
    +[PLUtilities bundleIDFromPid:](PLUtilities, "bundleIDFromPid:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLProcessMetadata setBundleId:](v5, "setBundleId:", v6);

    +[PLUtilities fullProcessNameForPid:](PLUtilities, "fullProcessNameForPid:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLProcessMetadata setName:](v5, "setName:", v7);

    -[PLProcessMetadata setCoalitionID:](v5, "setCoalitionID:", +[PLUtilities coalitionIDForPid:](PLUtilities, "coalitionIDForPid:", v3));
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLProcessMetadata setLastActiveStart:](v5, "setLastActiveStart:", v8);

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLProcessMetadata setLastSuspendStart:](v5, "setLastSuspendStart:", v9);

    -[PLProcessMetadata setApplicationState:](v5, "setApplicationState:", 0);
  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLProcessMetadata name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLProcessMetadata pid](self, "pid");
  -[PLProcessMetadata bundleId](self, "bundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%d) bundle=%@ cid=<%llu>"), v4, v5, v6, -[PLProcessMetadata coalitionID](self, "coalitionID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSString)bundleId
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)coalitionID
{
  return self->_coalitionID;
}

- (void)setCoalitionID:(unint64_t)a3
{
  self->_coalitionID = a3;
}

- (NSDate)lastActiveStart
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLastActiveStart:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDate)lastSuspendStart
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastSuspendStart:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PLCoalitionSample)coalitionSample
{
  return (PLCoalitionSample *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCoalitionSample:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSNumber)applicationState
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setApplicationState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationState, 0);
  objc_storeStrong((id *)&self->_coalitionSample, 0);
  objc_storeStrong((id *)&self->_lastSuspendStart, 0);
  objc_storeStrong((id *)&self->_lastActiveStart, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
