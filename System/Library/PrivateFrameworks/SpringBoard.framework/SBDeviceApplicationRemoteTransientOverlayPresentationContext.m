@implementation SBDeviceApplicationRemoteTransientOverlayPresentationContext

- (void)dealloc
{
  BSInvalidatable *pipStashAssertion;
  BSInvalidatable *v4;
  objc_super v5;

  pipStashAssertion = self->_pipStashAssertion;
  if (pipStashAssertion)
  {
    -[BSInvalidatable invalidate](pipStashAssertion, "invalidate");
    v4 = self->_pipStashAssertion;
    self->_pipStashAssertion = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)SBDeviceApplicationRemoteTransientOverlayPresentationContext;
  -[SBDeviceApplicationRemoteTransientOverlayPresentationContext dealloc](&v5, sel_dealloc);
}

- (SBRemoteTransientOverlayViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewController, a3);
}

- (SBSRemoteAlertPresentationTarget)presentationTarget
{
  return self->_presentationTarget;
}

- (void)setPresentationTarget:(id)a3
{
  objc_storeStrong((id *)&self->_presentationTarget, a3);
}

- (BSInvalidatable)pipStashAssertion
{
  return self->_pipStashAssertion;
}

- (void)setPIPStashAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_pipStashAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipStashAssertion, 0);
  objc_storeStrong((id *)&self->_presentationTarget, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

@end
