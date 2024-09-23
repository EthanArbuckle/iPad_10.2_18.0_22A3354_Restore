@implementation PXCMMComponentViewController

- (PXCMMComponentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMComponentViewController.m"), 23, CFSTR("%s is not available as initializer"), "-[PXCMMComponentViewController initWithNibName:bundle:]");

  abort();
}

- (PXCMMComponentViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMComponentViewController.m"), 27, CFSTR("%s is not available as initializer"), "-[PXCMMComponentViewController initWithCoder:]");

  abort();
}

- (PXCMMComponentViewController)initWithSession:(id)a3
{
  id v5;
  PXCMMComponentViewController *v6;
  PXCMMComponentViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXCMMComponentViewController;
  v6 = -[PXCMMComponentViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_session, a3);

  return v7;
}

- (double)preferredContentHeightForWidth:(double)a3
{
  return 0.0;
}

- (PXCMMSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

@end
