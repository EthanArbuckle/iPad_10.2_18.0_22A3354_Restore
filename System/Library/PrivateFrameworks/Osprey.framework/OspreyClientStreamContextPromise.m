@implementation OspreyClientStreamContextPromise

- (OspreyClientStreamContextPromise)initWithFulfillmentQueue:(id)a3
{
  id v4;
  OspreyClientStreamContextPromise *v5;
  OspreyDeferredObject *v6;
  OspreyDeferredObject *deferredContext;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OspreyClientStreamContextPromise;
  v5 = -[OspreyClientStreamContextPromise init](&v9, sel_init);
  if (v5)
  {
    v6 = -[OspreyDeferredObject initWithFulfillmentQueue:]([OspreyDeferredObject alloc], "initWithFulfillmentQueue:", v4);
    deferredContext = v5->_deferredContext;
    v5->_deferredContext = v6;

  }
  return v5;
}

- (void)fulfill:(id)a3
{
  -[OspreyDeferredObject fulfill:](self->_deferredContext, "fulfill:", a3);
}

- (void)finishWriting
{
  -[OspreyDeferredObject fulfilledWithCompletion:](self->_deferredContext, "fulfilledWithCompletion:", &__block_literal_global_5);
}

uint64_t __49__OspreyClientStreamContextPromise_finishWriting__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "finishWriting");
}

- (void)writeFrame:(id)a3
{
  id v4;
  OspreyDeferredObject *deferredContext;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  deferredContext = self->_deferredContext;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__OspreyClientStreamContextPromise_writeFrame___block_invoke;
  v7[3] = &unk_1E7098520;
  v8 = v4;
  v6 = v4;
  -[OspreyDeferredObject fulfilledWithCompletion:](deferredContext, "fulfilledWithCompletion:", v7);

}

uint64_t __47__OspreyClientStreamContextPromise_writeFrame___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "writeFrame:", *(_QWORD *)(a1 + 32));
}

- (void)writeFrame:(id)a3 compressed:(BOOL)a4
{
  id v6;
  OspreyDeferredObject *deferredContext;
  id v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;

  v6 = a3;
  deferredContext = self->_deferredContext;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__OspreyClientStreamContextPromise_writeFrame_compressed___block_invoke;
  v9[3] = &unk_1E7098548;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  -[OspreyDeferredObject fulfilledWithCompletion:](deferredContext, "fulfilledWithCompletion:", v9);

}

uint64_t __58__OspreyClientStreamContextPromise_writeFrame_compressed___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "writeFrame:compressed:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredContext, 0);
}

@end
