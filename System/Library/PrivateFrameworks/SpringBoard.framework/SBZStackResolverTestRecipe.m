@implementation SBZStackResolverTestRecipe

- (id)title
{
  return CFSTR("Take Home Gesture Ownership using Z Stack Resolver");
}

- (void)windowSceneDidUpdate:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (void)handleVolumeIncrease
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  SBZStackResolverTestRecipe *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[SBZStackResolverTestRecipe participant](self, "participant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_msgSend(WeakRetained, "zStackResolver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "acquireParticipantWithIdentifier:delegate:", 31, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBZStackResolverTestRecipe setParticipant:](self, "setParticipant:", v6);

    SBLogZStack();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[SBZStackResolverTestRecipe participant](self, "participant");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = self;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%@ acquired participant: %@", (uint8_t *)&v11, 0x16u);

    }
  }
  SBLogZStack();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = self;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%@ setting wantsHomeGesture=YES", (uint8_t *)&v11, 0xCu);
  }

  -[SBZStackResolverTestRecipe setWantsHomeGesture:](self, "setWantsHomeGesture:", 1);
  -[SBZStackResolverTestRecipe participant](self, "participant");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsUpdatePreferencesWithReason:", CFSTR("User pressed volume up"));

}

- (void)handleVolumeDecrease
{
  NSObject *v3;
  void *v4;
  int v5;
  SBZStackResolverTestRecipe *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogZStack();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "%@ setting wantsHomeGesture=NO", (uint8_t *)&v5, 0xCu);
  }

  -[SBZStackResolverTestRecipe setWantsHomeGesture:](self, "setWantsHomeGesture:", 0);
  -[SBZStackResolverTestRecipe participant](self, "participant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsUpdatePreferencesWithReason:", CFSTR("User pressed volume down"));

}

- (void)zStackParticipantDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  SBZStackResolverTestRecipe *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogZStack();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = self;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%@ got zStackParticipantDidChange: %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  SBZStackResolverTestRecipe *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "setActivationPolicyForParticipantsBelow:", 0);
  objc_msgSend(v5, "setHomeGestureConsumption:", -[SBZStackResolverTestRecipe wantsHomeGesture](self, "wantsHomeGesture"));
  SBLogZStack();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%@ updating preferences to: %@", (uint8_t *)&v7, 0x16u);
  }

}

- (SBFZStackParticipant)participant
{
  return self->_participant;
}

- (void)setParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_participant, a3);
}

- (BOOL)wantsHomeGesture
{
  return self->_wantsHomeGesture;
}

- (void)setWantsHomeGesture:(BOOL)a3
{
  self->_wantsHomeGesture = a3;
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void)setWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_participant, 0);
}

@end
