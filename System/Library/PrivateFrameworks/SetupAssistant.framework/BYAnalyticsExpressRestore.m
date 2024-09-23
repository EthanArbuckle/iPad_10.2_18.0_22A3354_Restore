@implementation BYAnalyticsExpressRestore

- (BYAnalyticsExpressRestore)initWithAnalyticsManager:(id)a3
{
  id v4;
  BYAnalyticsExpressRestore *v5;
  BYAnalyticsExpressRestore *v6;
  _QWORD v8[4];
  BYAnalyticsExpressRestore *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BYAnalyticsExpressRestore;
  v5 = -[BYAnalyticsExpressRestore init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__BYAnalyticsExpressRestore_initWithAnalyticsManager___block_invoke;
    v8[3] = &unk_1E4E27B08;
    v9 = v5;
    objc_msgSend(v4, "addEvent:withPayloadBlock:persist:", CFSTR("com.apple.setupassistant.ios.expressRestore.pane"), v8, 0);

  }
  return v6;
}

uint64_t __54__BYAnalyticsExpressRestore_initWithAnalyticsManager___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "eventPayload");
}

- (id)eventPayload
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v3 = -[BYAnalyticsExpressRestore restoreChoice](self, "restoreChoice");
  if (v3 > 3)
    v4 = 0;
  else
    v4 = (uint64_t)*(&off_1E4E281C0 + v3);
  v9[0] = CFSTR("paneShown");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BYAnalyticsExpressRestore paneShown](self, "paneShown"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v9[1] = CFSTR("offeredBackup");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BYAnalyticsExpressRestore offeredBackup](self, "offeredBackup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = CFSTR("restoreChoice");
  v10[1] = v6;
  v10[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)paneShown
{
  return self->_paneShown;
}

- (void)setPaneShown:(BOOL)a3
{
  self->_paneShown = a3;
}

- (unint64_t)restoreChoice
{
  return self->_restoreChoice;
}

- (void)setRestoreChoice:(unint64_t)a3
{
  self->_restoreChoice = a3;
}

- (BOOL)offeredBackup
{
  return self->_offeredBackup;
}

- (void)setOfferedBackup:(BOOL)a3
{
  self->_offeredBackup = a3;
}

@end
