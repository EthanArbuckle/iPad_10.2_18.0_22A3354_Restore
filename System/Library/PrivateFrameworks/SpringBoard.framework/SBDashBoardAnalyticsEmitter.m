@implementation SBDashBoardAnalyticsEmitter

- (SBDashBoardAnalyticsEmitter)initWithCoverSheetViewController:(id)a3
{
  id v5;
  SBDashBoardAnalyticsEmitter *v6;
  SBDashBoardAnalyticsEmitter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBDashBoardAnalyticsEmitter;
  v6 = -[SBDashBoardAnalyticsEmitter init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coverSheetViewController, a3);
    -[CSCoverSheetViewController registerExternalEventHandler:](v7->_coverSheetViewController, "registerExternalEventHandler:", v7);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[CSCoverSheetViewController unregisterExternalEventHandler:](self->_coverSheetViewController, "unregisterExternalEventHandler:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardAnalyticsEmitter;
  -[SBDashBoardAnalyticsEmitter dealloc](&v3, sel_dealloc);
}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (BOOL)handleEvent:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t *v6;
  uint64_t *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a3, "type");
  v4 = v3;
  if (v3 == 25)
  {
    v20 = *MEMORY[0x1E0DABEB8];
    v21 = MEMORY[0x1E0C9AAA0];
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = &v21;
    v7 = &v20;
  }
  else
  {
    if (v3 != 24)
      goto LABEL_6;
    v22 = *MEMORY[0x1E0DABEB8];
    v23[0] = MEMORY[0x1E0C9AAB0];
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = v23;
    v7 = &v22;
  }
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DA9D78];
  v10 = v8;
  objc_msgSend(v9, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "emitEvent:withPayload:", 36, v10);

LABEL_6:
  if (CSEventShouldBeLogged())
  {
    v18 = *MEMORY[0x1E0DABFD8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0DA9D78];
    v15 = v13;
    objc_msgSend(v14, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "emitEvent:withPayload:", 37, v15);

  }
  return 0;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverSheetViewController, 0);
}

@end
