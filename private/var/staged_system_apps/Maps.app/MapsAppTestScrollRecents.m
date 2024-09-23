@implementation MapsAppTestScrollRecents

- (void)_startRecentsTest
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v3, "pptTestOpenRecents");

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100351930;
  v4[3] = &unk_1011AD1C0;
  v4[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("PPTMyRecentsViewControllerDidAppearNotification"), 0, v4);
}

- (void)_setupTrayLayoutAndPerformScrollTest
{
  _QWORD v3[5];

  if (-[MapsAppTest canUpdateTrayLayout](self, "canUpdateTrayLayout"))
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100351A34;
    v3[3] = &unk_1011AC860;
    v3[4] = self;
    -[MapsAppTest updateTrayLayout:animated:completion:](self, "updateTrayLayout:animated:completion:", 2, 1, v3);
  }
  else
  {
    -[MapsAppTestScrollRecents _performScrollTest](self, "_performScrollTest");
  }
}

- (void)_performScrollTest
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pptTestScrollView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
  objc_msgSend(v5, "_performScrollTest:iterations:delta:", v4, 10, 20);

}

@end
