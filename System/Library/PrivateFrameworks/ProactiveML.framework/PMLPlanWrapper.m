@implementation PMLPlanWrapper

- (PMLPlanWrapper)initWithPlan:(id)a3
{
  id v5;
  PMLPlanWrapper *v6;
  PMLPlanWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PMLPlanWrapper;
  v6 = -[PMLPlanWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_plan, a3);

  return v7;
}

- (id)toPlistWithChunks:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("PLAN_CLASSNAME");
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("PLAN");
  v11[0] = v6;
  -[PMLPlanProtocol toPlistWithChunks:](self->_plan, "toPlistWithChunks:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PMLPlanWrapper)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSString *v12;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  PMLPlanWrapper *v17;
  void *v19;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLAN_CLASSNAME"));
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  v13 = NSClassFromString(v12);
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLPlanSerialization.m"), 55, CFSTR("Invalid plan. Unknown class: %@"), v12);

  }
  v14 = [v13 alloc];
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLAN"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v14, "initWithPlist:chunks:context:", v15, v10, v9);
  if (v16)
  {
    self = -[PMLPlanWrapper initWithPlan:](self, "initWithPlan:", v16);
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (PMLPlanProtocol)plan
{
  return self->_plan;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plan, 0);
}

@end
