@implementation RCRecordingCardViewController

- (RCRecordingCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  RCRecordingCardViewController *v4;
  RCRecordingCardViewController *v5;
  void *v6;
  RCUndoManager *v7;
  RCUndoManager *undoManager;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RCRecordingCardViewController;
  v4 = -[RCRecordingCardViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCardViewController navigationItem](v4, "navigationItem"));
    objc_msgSend(v6, "setHidesBackButton:", 1);

    v7 = objc_opt_new(RCUndoManager);
    undoManager = v5->_undoManager;
    v5->_undoManager = v7;

  }
  return v5;
}

- (void)loadView
{
  RCRecordingCardView *v3;

  v3 = objc_opt_new(RCRecordingCardView);
  -[RCRecordingCardViewController setView:](self, "setView:", v3);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCRecordingCardViewController;
  -[RCRecordingCardViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[RCRecordingCardViewController becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCRecordingCardViewController;
  -[RCRecordingCardViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[RCRecordingCardViewController resignFirstResponder](self, "resignFirstResponder");
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = objc_msgSend(v2, "supportedInterfaceOrientations");

  return (unint64_t)v3;
}

- (id)undoManager
{
  return self->_undoManager;
}

- (void)setHostedView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingCardViewController view](self, "view"));
  objc_msgSend(v5, "setHostedView:", v4);

}

- (UIView)hostedView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCardViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "hostedView"));

  return (UIView *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoManager, 0);
}

@end
