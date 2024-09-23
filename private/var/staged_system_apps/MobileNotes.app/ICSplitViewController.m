@implementation ICSplitViewController

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[2];

  height = a3.height;
  width = a3.width;
  v12[0] = CFSTR("ICSplitViewControllerWillTransitionToSizeNotificationNewSizeKey");
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithSize:](NSValue, "valueWithSize:", width, height));
  v12[1] = CFSTR("ICSplitViewControllerWillTransitionToSizeNotificationTransitionCoordinatorKey");
  v13[0] = v8;
  v13[1] = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("ICSplitViewControllerWillTransitionToSizeNotification"), self, v9);

  v11.receiver = self;
  v11.super_class = (Class)ICSplitViewController;
  -[ICSplitViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

}

@end
