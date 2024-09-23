@implementation SUIBOrchestrationTask

- (SUIBOrchestrationTask)initWithBuilder:(id)a3
{
  void (**v4)(id, SUIBOrchestrationTaskMutation *);
  SUIBOrchestrationTask *v5;
  SUIBOrchestrationTask *v6;
  SUIBOrchestrationTaskMutation *v7;
  void *v8;
  uint64_t v9;
  NSUUID *taskId;
  objc_super v12;

  v4 = (void (**)(id, SUIBOrchestrationTaskMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)SUIBOrchestrationTask;
  v5 = -[SUIBOrchestrationTask init](&v12, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_alloc_init(SUIBOrchestrationTaskMutation);
    v4[2](v4, v7);
    -[SUIBOrchestrationTaskMutation taskId](v7, "taskId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    taskId = v6->_taskId;
    v6->_taskId = (NSUUID *)v9;

  }
  return v6;
}

- (SUIBOrchestrationTask)init
{
  return -[SUIBOrchestrationTask initWithBuilder:](self, "initWithBuilder:", &__block_literal_global_2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUIBOrchestrationTask)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  SUIBOrchestrationTask *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SUIBOrchestrationTask::taskId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __39__SUIBOrchestrationTask_initWithCoder___block_invoke;
  v9[3] = &unk_2518A4420;
  v10 = v5;
  v6 = v5;
  v7 = -[SUIBOrchestrationTask initWithBuilder:](self, "initWithBuilder:", v9);

  return v7;
}

uint64_t __39__SUIBOrchestrationTask_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTaskId:", *(_QWORD *)(a1 + 32));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_taskId, CFSTR("SUIBOrchestrationTask::taskId"));
}

- (NSUUID)taskId
{
  return self->_taskId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskId, 0);
}

@end
