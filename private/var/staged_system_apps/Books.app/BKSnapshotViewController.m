@implementation BKSnapshotViewController

- (BKSnapshotViewController)initWithViewController:(id)a3
{
  id v4;
  BKSnapshotViewController *v5;
  void *v6;
  uint64_t v7;
  UIView *snapshotView;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKSnapshotViewController;
  v5 = -[BKSnapshotViewController init](&v10, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewIfLoaded"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "snapshotViewAfterScreenUpdates:", 0));
    snapshotView = v5->_snapshotView;
    v5->_snapshotView = (UIView *)v7;

    v5->_statusBarStyle = (int64_t)objc_msgSend(v4, "preferredStatusBarStyle");
  }

  return v5;
}

- (void)loadView
{
  -[BKSnapshotViewController setView:](self, "setView:", self->_snapshotView);
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BKSnapshotViewController;
  -[BKSnapshotViewController viewDidLoad](&v2, "viewDidLoad");
}

- (int64_t)preferredStatusBarStyle
{
  return -[BKSnapshotViewController statusBarStyle](self, "statusBarStyle");
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BKSnapshotViewController;
  -[BKSnapshotViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotView, a3);
}

- (int64_t)statusBarStyle
{
  return self->_statusBarStyle;
}

- (void)setStatusBarStyle:(int64_t)a3
{
  self->_statusBarStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotView, 0);
}

@end
