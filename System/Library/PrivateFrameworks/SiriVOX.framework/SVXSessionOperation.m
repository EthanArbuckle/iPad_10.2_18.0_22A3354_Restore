@implementation SVXSessionOperation

- (id)description
{
  int64_t type;
  id v4;
  void *v5;
  unint64_t v6;
  __CFString *v7;
  unint64_t v8;
  __CFString *v9;
  id v10;
  unint64_t v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  void *deactivationContext;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  objc_super v20;
  objc_super v21;
  objc_super v22;

  type = self->_type;
  if (type == 2)
  {
    v4 = objc_alloc(MEMORY[0x24BDD17C8]);
    v21.receiver = self;
    v21.super_class = (Class)SVXSessionOperation;
    -[SVXSessionOperation description](&v21, sel_description);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_type;
    if (v8 > 2)
      v9 = CFSTR("(unknown)");
    else
      v9 = off_24D24D098[v8];
    v13 = v9;
    v14 = v13;
    deactivationContext = self->_deactivationContext;
    goto LABEL_13;
  }
  if (type == 1)
  {
    v4 = objc_alloc(MEMORY[0x24BDD17C8]);
    v22.receiver = self;
    v22.super_class = (Class)SVXSessionOperation;
    -[SVXSessionOperation description](&v22, sel_description);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = self->_type;
    if (v6 > 2)
      v7 = CFSTR("(unknown)");
    else
      v7 = off_24D24D098[v6];
    v13 = v7;
    v14 = v13;
    deactivationContext = self->_activationContext;
LABEL_13:
    v16 = objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {type = %@, context = %@}"), v5, v13, deactivationContext);
    goto LABEL_16;
  }
  v10 = objc_alloc(MEMORY[0x24BDD17C8]);
  v20.receiver = self;
  v20.super_class = (Class)SVXSessionOperation;
  -[SVXSessionOperation description](&v20, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = self->_type;
  if (v11 > 2)
    v12 = CFSTR("(unknown)");
  else
    v12 = off_24D24D098[v11];
  v14 = v12;
  v16 = objc_msgSend(v10, "initWithFormat:", CFSTR("%@ {type = %@}"), v5, v14, v19);
LABEL_16:
  v17 = (void *)v16;

  return v17;
}

- (SVXSessionOperation)initWithActivationContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  SVXSessionOperation *v8;
  SVXSessionOperation *v9;
  uint64_t v10;
  SVXActivationContext *activationContext;
  uint64_t v12;
  id activationCompletion;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SVXSessionOperation;
  v8 = -[SVXSessionOperation init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = 1;
    v10 = objc_msgSend(v6, "copy");
    activationContext = v9->_activationContext;
    v9->_activationContext = (SVXActivationContext *)v10;

    v12 = objc_msgSend(v7, "copy");
    activationCompletion = v9->_activationCompletion;
    v9->_activationCompletion = (id)v12;

  }
  return v9;
}

- (SVXSessionOperation)initWithDeactivationContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  SVXSessionOperation *v8;
  SVXSessionOperation *v9;
  uint64_t v10;
  SVXDeactivationContext *deactivationContext;
  uint64_t v12;
  id deactivationCompletion;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SVXSessionOperation;
  v8 = -[SVXSessionOperation init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = 2;
    v10 = objc_msgSend(v6, "copy");
    deactivationContext = v9->_deactivationContext;
    v9->_deactivationContext = (SVXDeactivationContext *)v10;

    v12 = objc_msgSend(v7, "copy");
    deactivationCompletion = v9->_deactivationCompletion;
    v9->_deactivationCompletion = (id)v12;

  }
  return v9;
}

- (BOOL)handleOperationUsingActivationBlock:(id)a3 deactivationBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t type;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  type = self->_type;
  if (type == 2)
  {
    if (v7)
    {
      v10 = 40;
      v11 = 32;
      goto LABEL_7;
    }
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  if (type != 1 || !v6)
    goto LABEL_8;
  v10 = 24;
  v11 = 16;
  v7 = v6;
LABEL_7:
  (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, *(Class *)((char *)&self->super.isa + v11), *(Class *)((char *)&self->super.isa + v10));
  v12 = 1;
LABEL_9:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deactivationCompletion, 0);
  objc_storeStrong((id *)&self->_deactivationContext, 0);
  objc_storeStrong(&self->_activationCompletion, 0);
  objc_storeStrong((id *)&self->_activationContext, 0);
}

@end
