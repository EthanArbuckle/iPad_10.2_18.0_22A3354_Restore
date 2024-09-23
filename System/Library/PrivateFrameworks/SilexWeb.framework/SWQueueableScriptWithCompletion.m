@implementation SWQueueableScriptWithCompletion

- (SWQueueableScriptWithCompletion)initWithScript:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  SWQueueableScriptWithCompletion *v9;
  SWQueueableScriptWithCompletion *v10;
  uint64_t v11;
  id completion;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SWQueueableScriptWithCompletion;
  v9 = -[SWQueueableScriptWithCompletion init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_script, a3);
    v11 = MEMORY[0x219A22DDC](v8);
    completion = v10->_completion;
    v10->_completion = (id)v11;

  }
  return v10;
}

- (SWScript)script
{
  return self->_script;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_script, 0);
}

@end
