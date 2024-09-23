@implementation HKSPTask

- (HKSPTask)initWithIdentifier:(id)a3 block:(id)a4 delay:(double)a5
{
  id v8;
  id v9;
  HKSPTask *v10;
  uint64_t v11;
  NSString *identifier;
  NACancelationToken *v13;
  NACancelationToken *token;
  uint64_t v15;
  id cancelableBlock;
  HKSPTask *v17;
  _QWORD v19[4];
  id v20;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HKSPTask;
  v10 = -[HKSPTask init](&v21, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v10->_delay = a5;
    v13 = (NACancelationToken *)objc_alloc_init(MEMORY[0x1E0D51990]);
    token = v10->_token;
    v10->_token = v13;

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __43__HKSPTask_initWithIdentifier_block_delay___block_invoke;
    v19[3] = &unk_1E4E3A788;
    v20 = v9;
    v15 = MEMORY[0x1A85ABD18](v19);
    cancelableBlock = v10->_cancelableBlock;
    v10->_cancelableBlock = (id)v15;

    v17 = v10;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_cancelableBlock, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

- (HKSPTask)initWithBlock:(id)a3
{
  return -[HKSPTask initWithIdentifier:block:](self, "initWithIdentifier:block:", 0, a3);
}

- (HKSPTask)initWithIdentifier:(id)a3 block:(id)a4
{
  return -[HKSPTask initWithIdentifier:block:delay:](self, "initWithIdentifier:block:delay:", a3, a4, 0.0);
}

- (HKSPTask)initWithBlock:(id)a3 delay:(double)a4
{
  return -[HKSPTask initWithIdentifier:block:delay:](self, "initWithIdentifier:block:delay:", 0, a3, a4);
}

uint64_t __43__HKSPTask_initWithIdentifier_block_delay___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCanceled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return result;
}

- (void)execute
{
  (*((void (**)(id, NACancelationToken *))self->_cancelableBlock + 2))(self->_cancelableBlock, self->_token);
}

- (BOOL)isCanceled
{
  return -[NACancelationToken isCanceled](self->_token, "isCanceled");
}

- (void)cancel
{
  -[NACancelationToken cancel](self->_token, "cancel");
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)delay
{
  return self->_delay;
}

@end
