@implementation ICProgressViewController

- (ICProgressViewController)initWithDelegate:(id)a3
{
  id v4;
  void *v5;
  ICProgressViewController *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)ICProgressViewController;
  v6 = -[ICProgressViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, CFSTR("ICProgressViewController"), v5);

  if (v6)
    -[ICProgressViewController setProgressDelegate:](v6, "setProgressDelegate:", v4);

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICProgressViewController;
  -[ICProgressViewController viewDidLoad](&v10, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICProgressViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICProgressViewController label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

  -[ICProgressViewController activityIndicator](self, "activityIndicator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActivityIndicatorViewStyle:", 100);

  -[ICProgressViewController label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", CFSTR(" "));

  -[ICProgressViewController circularProgressView](self, "circularProgressView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICProgressViewController;
  -[ICProgressViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[ICProgressViewController activityIndicator](self, "activityIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startAnimating");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICProgressViewController;
  -[ICProgressViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  -[ICProgressViewController activityIndicator](self, "activityIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAnimating");

  -[ICProgressViewController progressDelegate](self, "progressDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willDismissProgressViewController:", self);

}

- (void)setObservedProgress:(id)a3
{
  NSProgress *v5;
  void *v6;
  NSProgress *observedProgress;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSProgress *v13;

  v5 = (NSProgress *)a3;
  if (self->_observedProgress != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)&self->_observedProgress, a3);
    -[ICProgressViewController circularProgressView](self, "circularProgressView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObservedProgress:", v13);

    observedProgress = self->_observedProgress;
    -[ICProgressViewController activityIndicator](self, "activityIndicator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (observedProgress)
    {
      objc_msgSend(v8, "setHidden:", 1);

      -[ICProgressViewController circularProgressView](self, "circularProgressView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = 0;
    }
    else
    {
      objc_msgSend(v8, "setHidden:", 0);

      -[ICProgressViewController circularProgressView](self, "circularProgressView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = 1;
    }
    objc_msgSend(v10, "setHidden:", v12);

    v5 = v13;
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSProgress)observedProgress
{
  return self->_observedProgress;
}

- (BOOL)showsCancel
{
  return self->_showsCancel;
}

- (void)setShowsCancel:(BOOL)a3
{
  self->_showsCancel = a3;
}

- (ICProgressViewControllerDelegate)progressDelegate
{
  return (ICProgressViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_progressDelegate);
}

- (void)setProgressDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_progressDelegate, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (ICCircularProgressView)circularProgressView
{
  return self->_circularProgressView;
}

- (void)setCircularProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_circularProgressView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circularProgressView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_progressDelegate);
  objc_storeStrong((id *)&self->_observedProgress, 0);
}

@end
