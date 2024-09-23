@implementation SBExternalDisplayWallpaperController

- (SBExternalDisplayWallpaperController)initWithWindowScene:(id)a3 requiresTraitsParticipant:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  SBExternalDisplayWallpaperController *v7;
  _SBWallpaperWindow *v8;
  SBFWindow *window;
  SBFWindow *v10;
  void *v11;
  SBExternalDisplayWallpaperViewController *v12;
  void *v13;
  uint64_t v14;
  SBFZStackParticipant *zStackParticipant;
  void *v16;
  void *v17;
  objc_super v19;

  v4 = a4;
  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBExternalDisplayWallpaperController;
  v7 = -[SBExternalDisplayWallpaperController init](&v19, sel_init);
  if (v7)
  {
    v8 = -[_SBWallpaperWindow initWithWindowScene:]([_SBWallpaperWindow alloc], "initWithWindowScene:", v6);
    window = v7->_window;
    v7->_window = &v8->super;

    -[SBFWindow _setRoleHint:](v7->_window, "_setRoleHint:", CFSTR("SBTraitsParticipantRoleWallpaperExternal"));
    -[SBFWindow setWindowLevel:](v7->_window, "setWindowLevel:", *MEMORY[0x1E0CEBE28] + -3.0);
    v10 = v7->_window;
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFWindow setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[SBFWindow setUserInteractionEnabled:](v7->_window, "setUserInteractionEnabled:", 0);
    v12 = -[SBExternalDisplayWallpaperViewController initWithWindowScene:]([SBExternalDisplayWallpaperViewController alloc], "initWithWindowScene:", v6);
    -[SBFWindow setRootViewController:](v7->_window, "setRootViewController:", v12);
    -[SBFWindow setHidden:](v7->_window, "setHidden:", 0);
    if (v4)
    {
      objc_msgSend(v6, "zStackResolver");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "acquireParticipantWithIdentifier:delegate:", 0, v7);
      v14 = objc_claimAutoreleasedReturnValue();
      zStackParticipant = v7->_zStackParticipant;
      v7->_zStackParticipant = (SBFZStackParticipant *)v14;

      objc_msgSend(v6, "statusBarManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "layoutManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "setOrientationWindow:forStatusBarLayoutLayer:", v7->_window, 0);
    }

  }
  return v7;
}

- (SBFWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (void)setZStackParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_zStackParticipant, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
