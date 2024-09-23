@implementation NonRotatingARSCNView

- (void)setLockedOrientation:(int64_t)a3
{
  void *v4;
  id v5;

  self->_lockedOrientation = a3;
  -[NonRotatingARSCNView lockRendererOrientation](self, "lockRendererOrientation");
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NonRotatingARSCNView renderer](self, "renderer"));
  objc_msgSend(v5, "removeObserver:name:object:", v4, UIApplicationDidChangeStatusBarOrientationNotification, 0);

}

- (void)windowWillAnimateRotateNotification:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NonRotatingARSCNView renderer](self, "renderer", a3));
  objc_msgSend(v4, "_setInterfaceOrientation:", -[NonRotatingARSCNView lockedOrientation](self, "lockedOrientation"));

}

- (void)layoutSubviews
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100003A44;
  v2[3] = &unk_10043BB10;
  v2[4] = self;
  +[UIWindowScene performWhileInterfaceOrientationLocked:](UIWindowScene, "performWhileInterfaceOrientationLocked:", v2);
}

- (void)lockRendererOrientation
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[NonRotatingARSCNView renderer](self, "renderer"));
  objc_msgSend(v3, "_setInterfaceOrientation:", -[NonRotatingARSCNView lockedOrientation](self, "lockedOrientation"));

}

- (int64_t)lockedOrientation
{
  return self->_lockedOrientation;
}

@end
