@implementation PUViewModelObservation

- (PUViewModelObservation)initWithViewModel:(id)a3 changeHandler:(id)a4
{
  id v6;
  id v7;
  PUViewModelObservation *v8;
  void *v9;
  id changeHandler;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUViewModelObservation;
  v8 = -[PUViewModelObservation init](&v12, sel_init);
  if (v8)
  {
    v9 = _Block_copy(v7);
    changeHandler = v8->_changeHandler;
    v8->_changeHandler = v9;

    objc_msgSend(v6, "registerChangeObserver:", v8);
  }

  return v8;
}

- (PUViewModelObservation)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUViewModelObservation.m"), 29, CFSTR("%s is not available as initializer"), "-[PUViewModelObservation init]");

  abort();
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v5;
  void (**v6)(id, id);

  v5 = a4;
  -[PUViewModelObservation changeHandler](self, "changeHandler");
  v6 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v6[2](v6, v5);

}

- (PUViewModel)viewModel
{
  return self->_viewModel;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUViewModelObservation.m"), 33, CFSTR("%s is not available as initializer"), "+[PUViewModelObservation new]");

  abort();
}

@end
