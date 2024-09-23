@implementation REMReminderCreationViewController

- (REMReminderCreationViewController)initWithDelegate:(id)a3
{
  id v5;
  REMReminderCreationViewController *v6;
  REMReminderCreationViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMReminderCreationViewController;
  v6 = -[REMReminderCreationViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_delegate, a3);

  return v7;
}

- (void)sendDidCreate:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  -[REMReminderCreationViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[REMReminderCreationViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reminderCreationViewController:didCreateReminder:error:", self, v4, v9);

  }
}

- (void)remoteViewControllerDidLoad:(id)a3 setupCompletion:(id)a4
{
  id v6;
  id v7;
  REMReminderCreationContext *v8;
  void *v9;
  REMReminderCreationContext *v10;

  v6 = a4;
  v7 = a3;
  v8 = [REMReminderCreationContext alloc];
  -[REMReminderCreationViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[REMReminderCreationContext initWithDelegate:](v8, "initWithDelegate:", v9);

  objc_msgSend(v7, "displayForCreationWithContext:completion:", v10, v6);
}

- (void)viewServiceDidCancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)REMReminderCreationViewController;
  -[REMReminderServiceViewController viewServiceDidCancel](&v3, sel_viewServiceDidCancel);
  -[REMReminderCreationViewController sendDidCreate:error:](self, "sendDidCreate:error:", 0, 0);
}

- (void)viewServiceDidFailWithError:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REMReminderCreationViewController;
  v4 = a3;
  -[REMReminderServiceViewController viewServiceDidFailWithError:](&v5, sel_viewServiceDidFailWithError_, v4);
  -[REMReminderCreationViewController sendDidCreate:error:](self, "sendDidCreate:error:", 0, v4, v5.receiver, v5.super_class);

}

- (void)viewServiceDidFinish
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)REMReminderCreationViewController;
  -[REMReminderServiceViewController viewServiceDidFinish](&v3, sel_viewServiceDidFinish);
  -[REMReminderCreationViewController sendDidCreate:error:](self, "sendDidCreate:error:", 1, 0);
}

- (REMReminderCreationDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
