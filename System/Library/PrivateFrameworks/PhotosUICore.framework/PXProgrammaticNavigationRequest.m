@implementation PXProgrammaticNavigationRequest

- (PXProgrammaticNavigationDestination)destination
{
  return self->_destination;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (unint64_t)options
{
  return self->_options;
}

- (PXProgrammaticNavigationRequest)initWithDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  PXProgrammaticNavigationRequest *v11;
  PXProgrammaticNavigationRequest *v12;
  void *v13;
  uint64_t v14;
  id completionHandler;
  objc_super v17;

  v9 = a3;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PXProgrammaticNavigationRequest;
  v11 = -[PXProgrammaticNavigationRequest init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_destination, a3);
    v12->_options = a4;
    if (v10)
      v13 = v10;
    else
      v13 = &__block_literal_global_283301;
    v14 = objc_msgSend(v13, "copy");
    completionHandler = v12->_completionHandler;
    v12->_completionHandler = (id)v14;

  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

- (PXProgrammaticNavigationRequest)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXProgrammaticNavigationRequest.m"), 17, CFSTR("%s is not available as initializer"), "-[PXProgrammaticNavigationRequest init]");

  abort();
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXProgrammaticNavigationRequest destination](self, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, destination=%@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)cancel
{
  void (**v2)(id, uint64_t, _QWORD);

  -[PXProgrammaticNavigationRequest completionHandler](self, "completionHandler");
  v2 = (void (**)(id, uint64_t, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, 4, 0);

}

@end
