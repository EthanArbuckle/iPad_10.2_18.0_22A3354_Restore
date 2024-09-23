@implementation PBUISnapshotPreconditionResult

- (PBUISnapshotPreconditionResult)initWithVariant:(int64_t)a3
{
  return -[PBUISnapshotPreconditionResult initWithExternalDisplayConfiguration:variant:](self, "initWithExternalDisplayConfiguration:variant:", 0, a3);
}

- (PBUISnapshotPreconditionResult)initWithExternalDisplayConfiguration:(id)a3 variant:(int64_t)a4
{
  id v7;
  PBUISnapshotPreconditionResult *v8;
  NSMutableArray *v9;
  NSMutableArray *reasonsToNotSnapshot;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PBUISnapshotPreconditionResult;
  v8 = -[PBUISnapshotPreconditionResult init](&v12, sel_init);
  if (v8 == self)
  {
    objc_storeStrong((id *)&self->_externalDisplayConfiguration, a3);
    self->_variant = a4;
    v9 = (NSMutableArray *)objc_opt_new();
    reasonsToNotSnapshot = self->_reasonsToNotSnapshot;
    self->_reasonsToNotSnapshot = v9;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PBUISnapshotPreconditionResult *v4;
  uint64_t v5;
  NSMutableArray *reasonsToNotSnapshot;

  v4 = -[PBUISnapshotPreconditionResult initWithExternalDisplayConfiguration:variant:](+[PBUISnapshotPreconditionResult allocWithZone:](PBUISnapshotPreconditionResult, "allocWithZone:", a3), "initWithExternalDisplayConfiguration:variant:", self->_externalDisplayConfiguration, self->_variant);
  v5 = -[NSMutableArray mutableCopy](self->_reasonsToNotSnapshot, "mutableCopy");
  reasonsToNotSnapshot = v4->_reasonsToNotSnapshot;
  v4->_reasonsToNotSnapshot = (NSMutableArray *)v5;

  return v4;
}

- (id)description
{
  _BOOL8 v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v3 = -[PBUISnapshotPreconditionResult canSnapshot](self, "canSnapshot");
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendBool:withName:", v3, CFSTR("canSnapshot"));
  v6 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[PBUISnapshotPreconditionResult isSnapshottingForExternalDisplayHostedWallpaper](self, "isSnapshottingForExternalDisplayHostedWallpaper"), CFSTR("isSnapshottingForExternalDisplayHostedWallpaper"), 1);
  if (!v3)
  {
    v7 = (void *)-[NSMutableArray copy](self->_reasonsToNotSnapshot, "copy");
    objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", v7, CFSTR("reasons to not snapshot"), 0);

  }
  objc_msgSend(v4, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)canSnapshot
{
  return -[NSMutableArray count](self->_reasonsToNotSnapshot, "count") == 0;
}

- (BOOL)isSnapshottingForExternalDisplayHostedWallpaper
{
  return self->_externalDisplayConfiguration != 0;
}

- (void)appendPreconditionResultFailureWithFormat:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v7);

  -[PBUISnapshotPreconditionResult appendPreconditionResultFailure:](self, "appendPreconditionResultFailure:", v6);
}

- (void)appendPreconditionResultFailure:(id)a3
{
  NSMutableArray *reasonsToNotSnapshot;
  const __CFString *v4;
  __CFString *v5;

  reasonsToNotSnapshot = self->_reasonsToNotSnapshot;
  v5 = (__CFString *)a3;
  if (-[__CFString length](v5, "length"))
    v4 = v5;
  else
    v4 = CFSTR("UNSPECIFIED FAILURE REASON!!!!");
  -[NSMutableArray addObject:](reasonsToNotSnapshot, "addObject:", v4);

}

- (NSArray)reasonsToNotSnapshot
{
  return &self->_reasonsToNotSnapshot->super;
}

- (PBUIExternalDisplayConfiguration)externalDisplayConfiguration
{
  return self->_externalDisplayConfiguration;
}

- (int64_t)variant
{
  return self->_variant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalDisplayConfiguration, 0);
  objc_storeStrong((id *)&self->_reasonsToNotSnapshot, 0);
}

@end
