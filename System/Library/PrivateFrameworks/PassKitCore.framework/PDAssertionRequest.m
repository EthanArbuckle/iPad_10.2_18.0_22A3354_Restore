@implementation PDAssertionRequest

- (PDAssertionRequest)initWithAssertion:(id)a3 delegate:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  PDAssertionRequest *v12;
  PDAssertionRequest *v13;
  void *v14;
  id resultHandler;
  NSObject *v16;
  dispatch_source_t v17;
  OS_dispatch_source *invalidationTimer;
  NSObject *v19;
  dispatch_time_t v20;
  NSObject *v21;
  _QWORD handler[4];
  id v24;
  id v25;
  id location;
  objc_super v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PDAssertionRequest;
  v12 = -[PDAssertionRequest init](&v27, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assertion, a3);
    v14 = _Block_copy(v11);
    resultHandler = v13->_resultHandler;
    v13->_resultHandler = v14;

    objc_initWeak(&location, v13);
    dispatch_get_global_queue(25, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v16);
    invalidationTimer = v13->_invalidationTimer;
    v13->_invalidationTimer = (OS_dispatch_source *)v17;

    v19 = v13->_invalidationTimer;
    v20 = dispatch_time(0, 100000000);
    dispatch_source_set_timer(v19, v20, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    v21 = v13->_invalidationTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __63__PDAssertionRequest_initWithAssertion_delegate_resultHandler___block_invoke;
    handler[3] = &unk_1E2ABE7B0;
    objc_copyWeak(&v25, &location);
    v24 = v10;
    dispatch_source_set_event_handler(v21, handler);
    dispatch_resume((dispatch_object_t)v13->_invalidationTimer);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __63__PDAssertionRequest_initWithAssertion_delegate_resultHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "assertionRequestDidTimeout:", WeakRetained);
    WeakRetained = v3;
  }

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PDAssertion identifier](self->_assertion, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (PDAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_assertion, a3);
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (void)setResultHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_source)invalidationTimer
{
  return self->_invalidationTimer;
}

- (void)setInvalidationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_invalidationTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationTimer, 0);
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
}

@end
