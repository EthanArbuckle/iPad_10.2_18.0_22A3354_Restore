@implementation _UISceneHostingDisconnectingActivationController

- (void)beginManagingHostedSceneActivationUsingHandle:(id)a3 forHostingController:(id)a4
{
  objc_storeStrong((id *)&self->_activationHandle, a3);
}

- (void)endManagingHostedSceneActivationForHostingController:(id)a3
{
  _UISceneHostingActivationHandle *activationHandle;

  activationHandle = self->_activationHandle;
  self->_activationHandle = 0;

}

- (void)hostingController:(id)a3 isMovingToParentScene:(id)a4
{
  BOOL v6;

  v6 = -[_UISceneHostingActivationHandle isActive](self->_activationHandle, "isActive", a3);
  if (a4)
  {
    if (!v6)
      -[_UISceneHostingActivationHandle activate:](self->_activationHandle, "activate:", 0);
  }
}

- (void)activationHandleDidUpdate:(id)a3 forHostingController:(id)a4
{
  id v5;

  v5 = a4;
  if ((objc_msgSend(a3, "isActive") & 1) == 0)
    objc_msgSend(v5, "invalidate");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationHandle, 0);
}

@end
