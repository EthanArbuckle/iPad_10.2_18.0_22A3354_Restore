@implementation ICCloudSharingController

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICCloudSharingController;
  -[ICCloudSharingController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudSharingController share](self, "share"));
  -[ICCloudSharingController setCanDeferDismissal:](self, "setCanDeferDismissal:", v4 == 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void (**v7)(void);
  unsigned int v8;
  objc_super v9;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudSharingController share](self, "share"));
  if (v5 && !-[ICCloudSharingController deferDismissal](self, "deferDismissal"))
  {
    v8 = -[ICCloudSharingController canDeferDismissal](self, "canDeferDismissal");

    if (v8)
      -[ICCloudSharingController setDeferDismissal:](self, "setDeferDismissal:", 1);
  }
  else
  {

  }
  if (-[ICCloudSharingController deferDismissal](self, "deferDismissal"))
  {
    -[ICCloudSharingController setDeferDismissal:](self, "setDeferDismissal:", 0);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCloudSharingController dismissed](self, "dismissed"));

    if (v6)
    {
      v7 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[ICCloudSharingController dismissed](self, "dismissed"));
      v7[2]();

    }
    -[ICCloudSharingController setDismissed:](self, "setDismissed:", 0);
  }
  v9.receiver = self;
  v9.super_class = (Class)ICCloudSharingController;
  -[ICCloudSharingController viewDidDisappear:](&v9, "viewDidDisappear:", v3);
}

- (id)dismissed
{
  return self->_dismissed;
}

- (void)setDismissed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)canDeferDismissal
{
  return self->_canDeferDismissal;
}

- (void)setCanDeferDismissal:(BOOL)a3
{
  self->_canDeferDismissal = a3;
}

- (BOOL)deferDismissal
{
  return self->_deferDismissal;
}

- (void)setDeferDismissal:(BOOL)a3
{
  self->_deferDismissal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissed, 0);
}

@end
