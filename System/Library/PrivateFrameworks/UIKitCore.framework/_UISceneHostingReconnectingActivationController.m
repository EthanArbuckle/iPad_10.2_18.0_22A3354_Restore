@implementation _UISceneHostingReconnectingActivationController

- (_UISceneHostingReconnectingActivationController)init
{
  _UISceneHostingReconnectingActivationController *v2;
  _UISceneHostingReconnectingActivationController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UISceneHostingReconnectingActivationController;
  v2 = -[_UISceneHostingReconnectingActivationController init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_maxRetryCount = 3;
    v2->_retryTimeout = 0.5;
    -[_UISceneHostingReconnectingActivationController _setupActivationInhibitor](v2, "_setupActivationInhibitor");
  }
  return v3;
}

- (void)setMaxRetryCount:(unint64_t)a3
{
  if (self->_maxRetryCount != a3)
  {
    self->_maxRetryCount = a3;
    -[_UISceneHostingReconnectingActivationController _setupActivationInhibitor](self, "_setupActivationInhibitor");
  }
}

- (void)setRetryTimeout:(double)a3
{
  if (self->_retryTimeout != a3)
  {
    self->_retryTimeout = a3;
    -[_UISceneHostingReconnectingActivationController _setupActivationInhibitor](self, "_setupActivationInhibitor");
  }
}

- (void)_setupActivationInhibitor
{
  _UISimpleTimedInhibitor *v3;
  unint64_t v4;
  _UISimpleTimedInhibitor *v5;
  _UISimpleTimedInhibitor *activationInhibitor;

  v3 = [_UISimpleTimedInhibitor alloc];
  v4 = -[_UISceneHostingReconnectingActivationController maxRetryCount](self, "maxRetryCount");
  -[_UISceneHostingReconnectingActivationController retryTimeout](self, "retryTimeout");
  v5 = -[_UISimpleTimedInhibitor initWithClockType:maxAttempts:inPeriod:](v3, "initWithClockType:maxAttempts:inPeriod:", 0, v4);
  activationInhibitor = self->_activationInhibitor;
  self->_activationInhibitor = v5;

}

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
  id v7;

  v7 = a3;
  v6 = -[_UISceneHostingActivationHandle isActive](self->_activationHandle, "isActive");
  if (a4 && !v6)
    -[_UISceneHostingReconnectingActivationController _performActivationForHostingController:](self, "_performActivationForHostingController:", v7);

}

- (void)activationHandleDidUpdate:(id)a3 forHostingController:(id)a4
{
  _UISceneHostingReconnectingActivationControllerDelegate **p_delegate;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  id v12;

  v12 = a4;
  if ((objc_msgSend(a3, "isActive") & 1) == 0
    && -[_UISimpleTimedInhibitor attempt](self->_activationInhibitor, "attempt"))
  {
    -[_UISceneHostingReconnectingActivationController _performActivationForHostingController:](self, "_performActivationForHostingController:", v12);
  }
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained((id *)p_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v11, "hostingControllerDidReconnect:", v12);

    }
  }

}

- (void)_performActivationForHostingController:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained
    && (v5 = WeakRetained,
        v6 = objc_loadWeakRetained((id *)&self->_delegate),
        v7 = objc_opt_respondsToSelector(),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "transitionerForConnectingHostingController:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  -[_UISceneHostingActivationHandle activate:](self->_activationHandle, "activate:", v9);

}

- (unint64_t)maxRetryCount
{
  return self->_maxRetryCount;
}

- (double)retryTimeout
{
  return self->_retryTimeout;
}

- (_UISceneHostingReconnectingActivationControllerDelegate)delegate
{
  return (_UISceneHostingReconnectingActivationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activationInhibitor, 0);
  objc_storeStrong((id *)&self->_activationHandle, 0);
}

@end
