@implementation PLHIDEventOperatorComposition

- (PLHIDEventOperatorComposition)initWithOperator:(id)a3 forUsagePage:(unint64_t)a4 andUsage:(unint64_t)a5 withBlock:(id)a6
{
  id v10;
  id v11;
  PLHIDEventOperatorComposition *v12;
  PLHIDEventOperatorComposition *v13;
  uint64_t v14;
  id operatorBlock;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PLHIDEventOperatorComposition;
  v12 = -[PLHIDEventOperatorComposition init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    if (!v12->_eventSystemClient)
      v12->_eventSystemClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
    v14 = MEMORY[0x1BCC9EB70](v11);
    operatorBlock = v13->_operatorBlock;
    v13->_operatorBlock = (id)v14;

    objc_msgSend(v10, "workQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    IOHIDEventSystemClientScheduleWithDispatchQueue();

    v22[0] = CFSTR("DeviceUsagePage");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = CFSTR("DeviceUsage");
    v23[0] = v17;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    IOHIDEventSystemClientSetMatching();
    IOHIDEventSystemClientRegisterEventBlock();

  }
  return v13;
}

- (void)handleEvent:(__IOHIDEvent *)a3
{
  void (**operatorBlock)(id, __IOHIDEvent *);

  operatorBlock = (void (**)(id, __IOHIDEvent *))self->_operatorBlock;
  if (operatorBlock)
    operatorBlock[2](operatorBlock, a3);
}

- (__IOHIDEventSystemClient)eventSystemClient
{
  return self->_eventSystemClient;
}

- (void)setEventSystemClient:(__IOHIDEventSystemClient *)a3
{
  self->_eventSystemClient = a3;
}

- (id)operatorBlock
{
  return self->_operatorBlock;
}

- (void)setOperatorBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PLOperator)operator
{
  return (PLOperator *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOperator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operator, 0);
  objc_storeStrong(&self->_operatorBlock, 0);
}

@end
