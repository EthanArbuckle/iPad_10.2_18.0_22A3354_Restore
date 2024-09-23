@implementation BNFeedViewController

- (BOOL)runningInExtension
{
  return 1;
}

- (void)feedViewController:(id)a3 willTransitionToContentHeight:(double)a4
{
  _QWORD v6[6];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BNFeedViewController;
  -[BNFeedViewController feedViewController:willTransitionToContentHeight:](&v7, "feedViewController:willTransitionToContentHeight:", a3);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100002D34;
  v6[3] = &unk_100008480;
  v6[4] = self;
  *(double *)&v6[5] = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (CGSize)_windowSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BNJSAWindowProvider sharedInstance](BNJSAWindowProvider, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));

  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BNFeedViewControllerDelegate)notificationDelegate
{
  return (BNFeedViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_notificationDelegate);
}

- (void)setNotificationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_notificationDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_notificationDelegate);
}

@end
