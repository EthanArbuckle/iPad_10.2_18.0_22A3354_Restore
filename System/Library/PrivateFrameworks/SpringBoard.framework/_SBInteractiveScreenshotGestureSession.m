@implementation _SBInteractiveScreenshotGestureSession

- (_SBInteractiveScreenshotGestureSession)initWithSessionID:(id)a3
{
  id v4;
  _SBInteractiveScreenshotGestureSession *v5;
  uint64_t v6;
  NSUUID *sessionID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SBInteractiveScreenshotGestureSession;
  v5 = -[_SBInteractiveScreenshotGestureSession init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSUUID *)v6;

  }
  return v5;
}

- (SBInteractiveScreenshotGestureHostRootViewController)hostRootViewController
{
  return (SBInteractiveScreenshotGestureHostRootViewController *)-[SBInteractiveScreenshotGestureHostWindow rootViewController](self->_hostWindow, "rootViewController");
}

- (SBInteractiveScreenshotGestureRootViewController)rootViewController
{
  return (SBInteractiveScreenshotGestureRootViewController *)-[SBInteractiveScreenshotGestureRootWindow rootViewController](self->_rootWindow, "rootViewController");
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (SBInteractiveScreenshotGestureRootWindow)rootWindow
{
  return self->_rootWindow;
}

- (void)setRootWindow:(id)a3
{
  objc_storeStrong((id *)&self->_rootWindow, a3);
}

- (SBInteractiveScreenshotGestureHostWindow)hostWindow
{
  return self->_hostWindow;
}

- (void)setHostWindow:(id)a3
{
  objc_storeStrong((id *)&self->_hostWindow, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostWindow, 0);
  objc_storeStrong((id *)&self->_rootWindow, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
