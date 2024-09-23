@implementation RTIInputSystemServiceSessionPlaceholder

+ (id)placeholderServiceSessionWithIdentifier:(id)a3 traits:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:traits:state:", v9, v8, v7);

  return v10;
}

- (RTIInputSystemServiceSessionPlaceholder)initWithConnection:(id)a3
{
  void *v4;
  RTIDocumentTraits *v5;
  RTIDocumentState *v6;
  RTIInputSystemServiceSessionPlaceholder *v7;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(RTIDocumentTraits);
  v6 = objc_alloc_init(RTIDocumentState);
  v7 = -[RTIInputSystemServiceSessionPlaceholder initWithIdentifier:traits:state:](self, "initWithIdentifier:traits:state:", v4, v5, v6);

  return v7;
}

- (RTIInputSystemServiceSessionPlaceholder)initWithIdentifier:(id)a3 traits:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  id v10;
  RTIInputSystemServiceSessionPlaceholder *v11;
  RTIInputSystemServiceSessionPlaceholder *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)RTIInputSystemServiceSessionPlaceholder;
  v11 = -[RTIInputSystemServiceSession initWithConnection:](&v16, sel_initWithConnection_, 0);
  v12 = v11;
  if (v11)
  {
    -[RTIInputSystemSession setUuid:](v11, "setUuid:", v8);
    v13 = (void *)objc_msgSend(v9, "copy");
    -[RTIInputSystemSession setDocumentTraits:](v12, "setDocumentTraits:", v13);

    v14 = (void *)objc_msgSend(v10, "copy");
    -[RTIInputSystemSession setDocumentState:](v12, "setDocumentState:", v14);

  }
  return v12;
}

- (int)pid
{
  return 0;
}

- (id)bundleIdentifier
{
  return 0;
}

- (id)valueForEntitlement:(id)a3
{
  return 0;
}

- (void)_updateAppIdsFromConnectionOnInternalQueueWithCompletionHandler:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)flushOperations
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  -[RTIInputSystemServiceSession internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  -[RTIInputSystemServiceSession internalQueue](self, "internalQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__RTIInputSystemServiceSessionPlaceholder_flushOperations__block_invoke;
  block[3] = &unk_1E35C25C0;
  block[4] = self;
  dispatch_sync(v4, block);

}

void __58__RTIInputSystemServiceSessionPlaceholder_flushOperations__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "textOperations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "textOperations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "documentState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_applyLocalTextOperations:toDocumentState:", v4, v5);

    objc_msgSend(*(id *)(a1 + 32), "setTextOperations:", 0);
  }
}

- (void)flushOperationsWithResultHandler:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];

  -[RTIInputSystemServiceSession internalQueue](self, "internalQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  -[RTIInputSystemServiceSession internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__RTIInputSystemServiceSessionPlaceholder_flushOperationsWithResultHandler___block_invoke;
  block[3] = &unk_1E35C25C0;
  block[4] = self;
  dispatch_sync(v5, block);

}

void __76__RTIInputSystemServiceSessionPlaceholder_flushOperationsWithResultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "textOperations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "textOperations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "documentState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_applyLocalTextOperations:toDocumentState:", v4, v5);

    objc_msgSend(*(id *)(a1 + 32), "setTextOperations:", 0);
  }
}

@end
