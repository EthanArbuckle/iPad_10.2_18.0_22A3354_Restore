@implementation PXExpectation

- (PXExpectation)init
{
  return -[PXExpectation initWithLabelFormat:](self, "initWithLabelFormat:", 0);
}

- (PXExpectation)initWithLabelFormat:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  PXExpectation *v7;
  uint64_t v9;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0CB3940];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v9);

  }
  else
  {
    v6 = 0;
  }
  v7 = -[PXExpectation initWithQueue:label:](self, "initWithQueue:label:", 0, v6);

  return v7;
}

- (PXExpectation)initWithQueue:(id)a3
{
  return -[PXExpectation initWithQueue:label:](self, "initWithQueue:label:", a3, 0);
}

- (PXExpectation)initWithQueue:(id)a3 labelFormat:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  PXExpectation *v9;
  uint64_t v11;

  v6 = a3;
  if (a4)
  {
    v7 = (objc_class *)MEMORY[0x1E0CB3940];
    v8 = a4;
    a4 = (id)objc_msgSend([v7 alloc], "initWithFormat:arguments:", v8, &v11);

  }
  v9 = -[PXExpectation initWithQueue:label:](self, "initWithQueue:label:", v6, a4);

  return v9;
}

- (PXExpectation)initWithQueue:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  PXExpectation *v8;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v11;
  id v12;
  uint64_t v13;
  NSDate *creationDate;
  uint64_t v15;
  NSString *label;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PXExpectation;
  v8 = -[PXExpectation init](&v18, sel_init);
  if (v8)
  {
    if (v6)
    {
      v9 = (OS_dispatch_queue *)v6;
      queue = v8->_queue;
      v8->_queue = v9;
    }
    else
    {
      v11 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v12 = MEMORY[0x1E0C80D38];
      queue = v8->_queue;
      v8->_queue = v11;
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = objc_claimAutoreleasedReturnValue();
    creationDate = v8->_creationDate;
    v8->_creationDate = (NSDate *)v13;

    v15 = objc_msgSend(v7, "copy");
    label = v8->_label;
    v8->_label = (NSString *)v15;

  }
  return v8;
}

- (void)performWhenFulfilled:(id)a3 timeout:(double)a4
{
  id v7;
  void *v8;
  dispatch_time_t v9;
  NSObject *queue;
  void *v11;
  _QWORD block[5];
  id v13;
  id location;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[PXExpectation handler](self, "handler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExpectation.m"), 68, CFSTR("multiple handlers not supported yet"));

  }
  -[PXExpectation setHandler:](self, "setHandler:", v7);
  objc_initWeak(&location, self);
  v9 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PXExpectation_performWhenFulfilled_timeout___block_invoke;
  block[3] = &unk_1E5147280;
  objc_copyWeak(&v13, &location);
  block[4] = self;
  dispatch_after(v9, queue, block);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)fulfill
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[PXExpectation _performHandlerWithSuccess:error:](self, "_performHandlerWithSuccess:error:", 1, 0);
}

- (void)_performHandlerWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;

  v4 = a3;
  v7 = a4;
  -[PXExpectation handler](self, "handler");
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PXExpectation setHandler:](self, "setHandler:", 0);
    ((void (**)(_QWORD, _BOOL8, id))v6)[2](v6, v4, v7);
  }

}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXExpectation label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p, label=%@>"), v5, self, v6);

  return v7;
}

- (NSString)label
{
  return self->_label;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __46__PXExpectation_performWhenFulfilled_timeout___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXExpectationErrorDomain"), 1, CFSTR("%@ timed out"), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_performHandlerWithSuccess:error:", 0, v2);

}

@end
