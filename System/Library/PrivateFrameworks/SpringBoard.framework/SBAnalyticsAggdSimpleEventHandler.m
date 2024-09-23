@implementation SBAnalyticsAggdSimpleEventHandler

+ (id)latchForEvent:(unint64_t)a3 aggdKey:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = objc_alloc((Class)objc_opt_class());
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__SBAnalyticsAggdSimpleEventHandler_latchForEvent_aggdKey___block_invoke;
  v10[3] = &unk_1E8EB8CF0;
  v11 = v5;
  v7 = v5;
  v8 = (void *)objc_msgSend(v6, "initWithEvent:emitBlock:", a3, v10);

  return v8;
}

void __59__SBAnalyticsAggdSimpleEventHandler_latchForEvent_aggdKey___block_invoke(uint64_t a1)
{
  id v2;

  +[SBAnalyticsAggdInterface sharedInstance](SBAnalyticsAggdInterface, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forScalarKey:", 1, *(_QWORD *)(a1 + 32));

}

+ (id)monotonicallyIncreasingForEvent:(unint64_t)a3 aggdKey:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = objc_alloc((Class)objc_opt_class());
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__SBAnalyticsAggdSimpleEventHandler_monotonicallyIncreasingForEvent_aggdKey___block_invoke;
  v10[3] = &unk_1E8EB8CF0;
  v11 = v5;
  v7 = v5;
  v8 = (void *)objc_msgSend(v6, "initWithEvent:emitBlock:", a3, v10);

  return v8;
}

void __77__SBAnalyticsAggdSimpleEventHandler_monotonicallyIncreasingForEvent_aggdKey___block_invoke(uint64_t a1)
{
  id v2;

  +[SBAnalyticsAggdInterface sharedInstance](SBAnalyticsAggdInterface, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addValue:forScalarKey:", 1, *(_QWORD *)(a1 + 32));

}

+ (id)setScalarForEvent:(unint64_t)a3 aggdKey:(id)a4 valueBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v7 = a4;
  v8 = a5;
  v9 = objc_alloc((Class)objc_opt_class());
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__SBAnalyticsAggdSimpleEventHandler_setScalarForEvent_aggdKey_valueBlock___block_invoke;
  v14[3] = &unk_1E8EB8D18;
  v15 = v7;
  v16 = v8;
  v10 = v7;
  v11 = v8;
  v12 = (void *)objc_msgSend(v9, "initWithEvent:emitBlock:", a3, v14);

  return v12;
}

void __74__SBAnalyticsAggdSimpleEventHandler_setScalarForEvent_aggdKey_valueBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  +[SBAnalyticsAggdInterface sharedInstance](SBAnalyticsAggdInterface, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forScalarKey:", v2, *(_QWORD *)(a1 + 32));

}

- (SBAnalyticsAggdSimpleEventHandler)initWithEvent:(unint64_t)a3 emitBlock:(id)a4
{
  id v6;
  SBAnalyticsAggdSimpleEventHandler *v7;
  SBAnalyticsAggdSimpleEventHandler *v8;
  uint64_t v9;
  id emitBlock;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBAnalyticsAggdSimpleEventHandler;
  v7 = -[SBAnalyticsAggdSimpleEventHandler init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_eventType = a3;
    v9 = objc_msgSend(v6, "copy");
    emitBlock = v8->_emitBlock;
    v8->_emitBlock = (id)v9;

  }
  return v8;
}

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  unint64_t eventType;

  eventType = self->_eventType;
  if (eventType == a3)
    (*((void (**)(void))self->_emitBlock + 2))();
  return eventType == a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_emitBlock, 0);
}

@end
