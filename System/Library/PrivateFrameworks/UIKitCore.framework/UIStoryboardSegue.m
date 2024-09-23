@implementation UIStoryboardSegue

- (UIStoryboardSegue)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination
{
  NSString *v9;
  UIViewController *v10;
  UIViewController *v11;
  UIViewController *v12;
  UIStoryboardSegue *v13;
  uint64_t v14;
  NSString *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v9 = identifier;
  v10 = source;
  v11 = destination;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIStoryboardSegue.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIStoryboardSegue.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destination"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)UIStoryboardSegue;
  v13 = -[UIStoryboardSegue init](&v19, sel_init);
  if (v13)
  {
    v14 = -[NSString copy](v9, "copy");
    v15 = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    objc_storeStrong((id *)&v13->_sourceViewController, source);
    objc_storeStrong((id *)&v13->_destinationViewController, destination);
  }

  return v13;
}

+ (UIStoryboardSegue)segueWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination performHandler:(void *)performHandler
{
  NSString *v11;
  UIViewController *v12;
  UIViewController *v13;
  void *v14;
  void *v15;
  void *v17;

  v11 = identifier;
  v12 = source;
  v13 = destination;
  v14 = performHandler;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIStoryboardSegue.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("performHandler != NULL"));

  }
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:source:destination:", v11, v12, v13);
  objc_msgSend(v15, "setPerformHandler:", v14);

  return (UIStoryboardSegue *)v15;
}

- (UIStoryboardSegue)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[UIStoryboardSegue init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Don't call %@."), v5);

  return 0;
}

- (void)perform
{
  void (**performHandler)(id);
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  performHandler = (void (**)(id))self->_performHandler;
  if (!performHandler)
  {
    v3 = (void *)MEMORY[0x1E0C99DA0];
    v4 = *MEMORY[0x1E0C99768];
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[UIStoryboardSegue identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Could not perform segue with identifier '%@'. A segue must either have a performHandler or it must override -perform."), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v7, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v8);
  }
  performHandler[2](self->_performHandler);
}

- (void)_prepare
{
  void (**prepareHandler)(void);

  prepareHandler = (void (**)(void))self->_prepareHandler;
  if (prepareHandler)
    prepareHandler[2]();
}

- (NSString)identifier
{
  return self->_identifier;
}

- (UIViewController)sourceViewController
{
  return self->_sourceViewController;
}

- (UIViewController)destinationViewController
{
  return self->_destinationViewController;
}

- (id)performHandler
{
  return self->_performHandler;
}

- (void)setPerformHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)prepareHandler
{
  return self->_prepareHandler;
}

- (void)setPrepareHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_storeStrong(&self->_sender, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sender, 0);
  objc_storeStrong(&self->_prepareHandler, 0);
  objc_storeStrong(&self->_performHandler, 0);
  objc_storeStrong((id *)&self->_destinationViewController, 0);
  objc_storeStrong((id *)&self->_sourceViewController, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
