@implementation SBTransaction

- (SBTransaction)init
{
  SBTransaction *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBTransaction;
  v2 = -[SBTransaction init](&v5, sel_init);
  if (v2)
  {
    SBLogTransaction();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTransaction _addDebugLogCategory:](v2, "_addDebugLogCategory:", v3);

    -[SBTransaction setAuditHistoryEnabled:](v2, "setAuditHistoryEnabled:", 1);
  }
  return v2;
}

- (id)queue
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x1E0C80D38];
  v3 = MEMORY[0x1E0C80D38];
  return v2;
}

@end
