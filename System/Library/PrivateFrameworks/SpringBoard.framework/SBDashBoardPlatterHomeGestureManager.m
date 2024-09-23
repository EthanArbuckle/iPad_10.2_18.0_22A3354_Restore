@implementation SBDashBoardPlatterHomeGestureManager

- (id)homeGestureContextForViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (-[SBDashBoardPlatterHomeGestureManager _isViewControllerPlatterHomeGestureParticipant:](self, "_isViewControllerPlatterHomeGestureParticipant:", v4))
  {
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  objc_msgSend(v4, "_sbWindowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SBDashBoardPlatterHomeGestureManager _platterHomeGestureManager](self, "_platterHomeGestureManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerParticipant:windowScene:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)unregisterHomeGestureContextForViewController:(id)a3
{
  _BOOL4 v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = -[SBDashBoardPlatterHomeGestureManager _isViewControllerPlatterHomeGestureParticipant:](self, "_isViewControllerPlatterHomeGestureParticipant:", v6);
  v5 = v6;
  if (v6 && v4)
  {
    -[SBPlatterHomeGestureManager unregisterParticipant:](self->_platterHomeGestureManager, "unregisterParticipant:", v6);
    v5 = v6;
  }

}

- (int64_t)platterHomeGestureManager:(id)a3 zStackParticipantIdentifierForParticipant:(id)a4
{
  return 14;
}

- (id)platterHomeGestureManager:(id)a3 windowForParticipant:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_platterHomeGestureManager
{
  SBPlatterHomeGestureManager *platterHomeGestureManager;
  SBPlatterHomeGestureManager *v4;
  SBPlatterHomeGestureManager *v5;

  platterHomeGestureManager = self->_platterHomeGestureManager;
  if (!platterHomeGestureManager)
  {
    v4 = -[SBPlatterHomeGestureManager initWithDelegate:]([SBPlatterHomeGestureManager alloc], "initWithDelegate:", self);
    v5 = self->_platterHomeGestureManager;
    self->_platterHomeGestureManager = v4;

    platterHomeGestureManager = self->_platterHomeGestureManager;
  }
  return platterHomeGestureManager;
}

- (BOOL)_isViewControllerPlatterHomeGestureParticipant:(id)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterHomeGestureManager, 0);
}

@end
