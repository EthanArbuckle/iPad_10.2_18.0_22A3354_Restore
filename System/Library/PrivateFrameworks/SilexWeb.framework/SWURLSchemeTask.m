@implementation SWURLSchemeTask

- (SWURLSchemeTask)initWithTask:(id)a3 logger:(id)a4
{
  id v7;
  id v8;
  SWURLSchemeTask *v9;
  SWURLSchemeTask *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SWURLSchemeTask;
  v9 = -[SWURLSchemeTask init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_task, a3);
    objc_storeStrong((id *)&v10->_logger, a4);
  }

  return v10;
}

- (NSURLRequest)request
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __26__SWURLSchemeTask_request__block_invoke;
  v4[3] = &unk_24DA0BAE8;
  v4[4] = self;
  v4[5] = &v5;
  -[SWURLSchemeTask performBlockOnMainThread:](self, "performBlockOnMainThread:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSURLRequest *)v2;
}

void __26__SWURLSchemeTask_request__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "request");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)didReceiveResponse:(id)a3
{
  id v4;
  SWLogger *logger;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  logger = self->_logger;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Received response for task %@"), self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWLogger log:](logger, "log:", v6);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__SWURLSchemeTask_didReceiveResponse___block_invoke;
  v8[3] = &unk_24DA0BB10;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SWURLSchemeTask performBlockOnMainThread:](self, "performBlockOnMainThread:", v8);

}

uint64_t __38__SWURLSchemeTask_didReceiveResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "didReceiveResponse:", *(_QWORD *)(a1 + 40));
}

- (void)didReceiveData:(id)a3
{
  id v4;
  SWLogger *logger;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  logger = self->_logger;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Received data (%li) for task %@"), objc_msgSend(v4, "length"), self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWLogger log:](logger, "log:", v6);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __34__SWURLSchemeTask_didReceiveData___block_invoke;
  v8[3] = &unk_24DA0BB10;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SWURLSchemeTask performBlockOnMainThread:](self, "performBlockOnMainThread:", v8);

}

uint64_t __34__SWURLSchemeTask_didReceiveData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "didReceiveData:", *(_QWORD *)(a1 + 40));
}

- (void)didFinish
{
  SWLogger *logger;
  void *v4;
  _QWORD v5[5];

  logger = self->_logger;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Finished task %@"), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWLogger log:](logger, "log:", v4);

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __28__SWURLSchemeTask_didFinish__block_invoke;
  v5[3] = &unk_24DA0BB38;
  v5[4] = self;
  -[SWURLSchemeTask performBlockOnMainThread:](self, "performBlockOnMainThread:", v5);
}

void __28__SWURLSchemeTask_didFinish__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  objc_msgSend(v6, "didFinish");
  v4 = v6;
  if (v6)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (v5)
    {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
      v4 = v6;
    }
  }

}

- (void)didFailWithError:(id)a3
{
  id v4;
  SWLogger *logger;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  logger = self->_logger;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed task %@ with error %@"), self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWLogger logError:](logger, "logError:", v6);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __36__SWURLSchemeTask_didFailWithError___block_invoke;
  v8[3] = &unk_24DA0BB10;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SWURLSchemeTask performBlockOnMainThread:](self, "performBlockOnMainThread:", v8);

}

void __36__SWURLSchemeTask_didFailWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  objc_msgSend(v6, "didFailWithError:", *(_QWORD *)(a1 + 40));
  v4 = v6;
  if (v6)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (v5)
    {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
      v4 = v6;
    }
  }

}

- (void)performBlockOnMainThread:(id)a3
{
  void *v3;
  void (**block)(void);

  v3 = (void *)MEMORY[0x24BDD17F0];
  block = (void (**)(void))a3;
  if (objc_msgSend(v3, "isMainThread"))
    block[2]();
  else
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)onCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (WKURLSchemeTask)task
{
  return self->_task;
}

- (SWLogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
