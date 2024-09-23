@implementation HKLoadingShareViewController

- (void)viewDidLoad
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *activityIndicatorView;
  dispatch_time_t v5;
  _QWORD block[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKLoadingShareViewController;
  -[HKLoadingShareViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  activityIndicatorView = self->_activityIndicatorView;
  self->_activityIndicatorView = v3;

  -[UIActivityIndicatorView setHidesWhenStopped:](self->_activityIndicatorView, "setHidesWhenStopped:", 1);
  -[HKLoadingShareViewController setView:](self, "setView:", self->_activityIndicatorView);
  v5 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005E8C;
  block[3] = &unk_100008280;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)finishedLoading
{
  -[UIActivityIndicatorView stopAnimating](self->_activityIndicatorView, "stopAnimating");
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
}

@end
