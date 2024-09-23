@implementation SLComposeViewControllerDelegate

- (SLComposeViewControllerDelegate)initWithCallback:(id)a3
{
  id v4;
  SLComposeViewControllerDelegate *v5;
  void *v6;
  id callback;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SLComposeViewControllerDelegate;
  v5 = -[SLComposeViewControllerDelegate init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    callback = v5->_callback;
    v5->_callback = v6;

  }
  return v5;
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  void *v6;
  void (**v7)(id, int64_t);

  -[SLComposeViewControllerDelegate callback](self, "callback", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SLComposeViewControllerDelegate callback](self, "callback");
    v7 = (void (**)(id, int64_t))objc_claimAutoreleasedReturnValue();
    v7[2](v7, a4);

  }
}

- (id)callback
{
  return self->_callback;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
}

@end
