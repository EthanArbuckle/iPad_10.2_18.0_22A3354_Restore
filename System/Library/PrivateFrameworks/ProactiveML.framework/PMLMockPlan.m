@implementation PMLMockPlan

- (PMLMockPlan)initWithPlanId:(id)a3 store:(id)a4 version:(unint64_t)a5 returningAfterRunning:(BOOL)a6
{
  id v11;
  id v12;
  PMLMockPlan *v13;
  PMLMockPlan *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PMLMockPlan;
  v13 = -[PMLMockPlan init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_planId, a3);
    objc_storeStrong((id *)&v14->_store, a4);
    v14->_version = a5;
    v14->_returnValue = a6;
    v14->_didRun = 0;
  }

  return v14;
}

- (PMLMockPlan)initWithPlanId:(id)a3 version:(unint64_t)a4 returningAfterRunning:(BOOL)a5
{
  return -[PMLMockPlan initWithPlanId:store:version:returningAfterRunning:](self, "initWithPlanId:store:version:returningAfterRunning:", a3, 0, a4, a5);
}

- (PMLMockPlan)initWithPlanId:(id)a3 version:(unint64_t)a4
{
  return -[PMLMockPlan initWithPlanId:version:returningAfterRunning:](self, "initWithPlanId:version:returningAfterRunning:", a3, a4, 1);
}

- (PMLMockPlan)initWithVersion:(unint64_t)a3
{
  return -[PMLMockPlan initWithPlanId:version:](self, "initWithPlanId:version:", CFSTR("dummy"), a3);
}

- (PMLMockPlan)initWithPlanId:(id)a3
{
  return -[PMLMockPlan initWithPlanId:version:](self, "initWithPlanId:version:", a3, 0);
}

- (PMLMockPlan)initWithPlanId:(id)a3 store:(id)a4
{
  return -[PMLMockPlan initWithPlanId:store:version:returningAfterRunning:](self, "initWithPlanId:store:version:returningAfterRunning:", a3, a4, 0, 1);
}

- (id)runWithError:(id *)a3
{
  self->_didRun = 1;
  return 0;
}

- (id)toPlistWithChunks:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v9[0] = self->_planId;
  v8[0] = CFSTR("id");
  v8[1] = CFSTR("version");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PMLMockPlan version](self, "version", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("returnValue");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_returnValue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PMLMockPlan)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  PMLMockPlan *v14;
  void *v15;

  v7 = a5;
  v8 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TRAINING_STORE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("version"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("returnValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PMLMockPlan initWithPlanId:store:version:returningAfterRunning:](self, "initWithPlanId:store:version:returningAfterRunning:", v9, v10, v12, objc_msgSend(v13, "BOOLValue"));

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("id"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[PMLMockPlan setLastDeserializedPlanWithId:toPlan:](PMLMockPlan, "setLastDeserializedPlanWithId:toPlan:", v15, v14);
  return v14;
}

- (NSString)planId
{
  return self->_planId;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (BOOL)didRun
{
  return self->_didRun;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planId, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

+ (id)lastDeserializedPlanWithId:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "lastDeserializedPlansMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)setLastDeserializedPlanWithId:(id)a3 toPlan:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "lastDeserializedPlansMap");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);

}

+ (void)clearLastDeserializedPlans
{
  id v2;

  objc_msgSend(a1, "lastDeserializedPlansMap");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

+ (id)lastDeserializedPlansMap
{
  if (lastDeserializedPlansMap__pasOnceToken2 != -1)
    dispatch_once(&lastDeserializedPlansMap__pasOnceToken2, &__block_literal_global_4538);
  return (id)lastDeserializedPlansMap__pasExprOnceResult;
}

void __39__PMLMockPlan_lastDeserializedPlansMap__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x2199EA600]();
  v1 = objc_opt_new();
  v2 = (void *)lastDeserializedPlansMap__pasExprOnceResult;
  lastDeserializedPlansMap__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
