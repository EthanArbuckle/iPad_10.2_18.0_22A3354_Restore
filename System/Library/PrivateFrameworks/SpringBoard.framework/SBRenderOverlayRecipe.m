@implementation SBRenderOverlayRecipe

- (id)title
{
  return CFSTR("Render Overlay Persistence");
}

- (void)windowSceneDidUpdate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_windowScene, obj);
    -[SBWindow setWindowScene:](self->_window, "setWindowScene:", obj);
  }

}

- (void)handleVolumeIncrease
{
  void *v3;
  void *v4;
  SBWindow *v5;
  id WeakRetained;
  SBWindow *v7;
  SBWindow *window;
  dispatch_time_t v9;
  id v10;

  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB8]), "initWithNibName:bundle:", 0, 0);
  objc_msgSend(v10, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = [SBWindow alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v7 = -[SBWindow initWithWindowScene:role:debugName:](v5, "initWithWindowScene:role:debugName:", WeakRetained, CFSTR("SBTraitsParticipantRoleRenderOverlayRecipe"), CFSTR("SBRenderOverlayRecipe"));
  window = self->_window;
  self->_window = v7;

  -[SBWindow setRootViewController:](self->_window, "setRootViewController:", v10);
  -[SBWindow setHidden:](self->_window, "setHidden:", 0);
  -[SBWindow setLevel:](self->_window, "setLevel:", 100000.0);
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  objc_msgSend(MEMORY[0x1E0CD28B0], "synchronize");
  v9 = dispatch_time(0, 2000000000);
  dispatch_after(v9, MEMORY[0x1E0C80D38], &__block_literal_global_37);

}

void __45__SBRenderOverlayRecipe_handleVolumeIncrease__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v0 = (void *)MEMORY[0x1E0D00C88];
  objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "descriptorWithName:display:", CFSTR("login"), v1);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setInterfaceOrientation:", objc_msgSend((id)SBApp, "activeInterfaceOrientation"));
  objc_msgSend(v7, "setLockBacklight:", 1);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00C80]), "initWithDescriptor:", v7);
  objc_msgSend(v2, "present");
  objc_msgSend(v2, "freeze");
  objc_msgSend(MEMORY[0x1E0D229A0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForExitAndRelaunch:", 1);

  objc_msgSend(MEMORY[0x1E0D00DC0], "actionWithOptions:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D229A8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendActionsToBackBoard:", v6);

}

- (void)handleVolumeDecrease
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = (void *)MEMORY[0x1E0D00C88];
  objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithName:display:", CFSTR("logout"), v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setInterfaceOrientation:", objc_msgSend((id)SBApp, "activeInterfaceOrientation"));
  objc_msgSend(v9, "setLockBacklight:", 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00C80]), "initWithDescriptor:", v9);
  objc_msgSend(v4, "present");
  objc_msgSend(v4, "freeze");
  objc_msgSend(MEMORY[0x1E0D229A0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareForExitAndRelaunch:", 1);

  objc_msgSend(MEMORY[0x1E0D00DC0], "actionWithOptions:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D229A8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendActionsToBackBoard:", v8);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
