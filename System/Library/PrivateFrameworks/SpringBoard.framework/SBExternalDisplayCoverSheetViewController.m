@implementation SBExternalDisplayCoverSheetViewController

- (id)_initWithWindowScene:(id)a3 wallpaperEffectViewFactory:(id)a4
{
  id v6;
  id v7;
  SBExternalDisplayCoverSheetViewController *v8;
  SBExternalDisplayCoverSheetViewController *v9;
  void *v10;
  uint64_t v11;
  SBFZStackParticipant *zStackParticipant;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBExternalDisplayCoverSheetViewController;
  v8 = -[SBExternalDisplayCoverSheetViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_sbWindowScene, v6);
    objc_storeStrong((id *)&v9->_wallpaperEffectViewFactory, a4);
    objc_msgSend(v6, "zStackResolver");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "acquireParticipantWithIdentifier:delegate:", 8, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    zStackParticipant = v9->_zStackParticipant;
    v9->_zStackParticipant = (SBFZStackParticipant *)v11;

  }
  return v9;
}

- (void)dealloc
{
  SBFZStackParticipant *zStackParticipant;
  SBFloatingDockBehaviorAssertion *externalDisplayFloatingDockBehaviorAssertion;
  objc_super v5;

  -[SBFZStackParticipant invalidate](self->_zStackParticipant, "invalidate");
  zStackParticipant = self->_zStackParticipant;
  self->_zStackParticipant = 0;

  -[SBFloatingDockBehaviorAssertion invalidate](self->_externalDisplayFloatingDockBehaviorAssertion, "invalidate");
  externalDisplayFloatingDockBehaviorAssertion = self->_externalDisplayFloatingDockBehaviorAssertion;
  self->_externalDisplayFloatingDockBehaviorAssertion = 0;

  v5.receiver = self;
  v5.super_class = (Class)SBExternalDisplayCoverSheetViewController;
  -[SBExternalDisplayCoverSheetViewController dealloc](&v5, sel_dealloc);
}

- (void)viewDidLoad
{
  id WeakRetained;
  id v4;
  void *v5;
  UIView *v6;
  UIView *wallpaperContainerView;
  UIView *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *wallpaperEffectViewFactory;
  UIView *v14;
  UIView *wallpaperEffectView;
  id v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SBExternalDisplayCoverSheetViewController;
  -[SBExternalDisplayCoverSheetViewController viewDidLoad](&v17, sel_viewDidLoad);
  WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
  objc_msgSend(WeakRetained, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v6 = (UIView *)objc_msgSend(v4, "initWithFrame:");
  wallpaperContainerView = self->_wallpaperContainerView;
  self->_wallpaperContainerView = v6;

  v8 = self->_wallpaperContainerView;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

  -[UIView setUserInteractionEnabled:](self->_wallpaperContainerView, "setUserInteractionEnabled:", 0);
  -[UIView setHidden:](self->_wallpaperContainerView, "setHidden:", 0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_wallpaperContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SBExternalDisplayCoverSheetViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_wallpaperContainerView);

  -[SBExternalDisplayCoverSheetViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)SBHPinViewWithinView();

  if (self->_wallpaperEffectViewFactory)
    wallpaperEffectViewFactory = self->_wallpaperEffectViewFactory;
  else
    wallpaperEffectViewFactory = self;
  v14 = (UIView *)objc_msgSend(wallpaperEffectViewFactory, "newWallpaperEffectView");
  wallpaperEffectView = self->_wallpaperEffectView;
  self->_wallpaperEffectView = v14;

  -[UIView setClipsToBounds:](self->_wallpaperEffectView, "setClipsToBounds:", 1);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_wallpaperEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_wallpaperContainerView, "addSubview:", self->_wallpaperEffectView);
  v16 = (id)SBHPinViewWithinView();

}

- (void)prepareForPresentation
{
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, a1, a3, "[EXTERNAL] %s", a5, a6, a7, a8, 2u);
}

- (void)cleanupAfterDismissal
{
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, a1, a3, "[EXTERNAL] %s", a5, a6, a7, a8, 2u);
}

- (id)_floatingDockController
{
  void *v2;
  void *v3;

  -[SBExternalDisplayCoverSheetViewController _sbWindowScene](self, "_sbWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatingDockController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)newWallpaperEffectView
{
  return -[SBExternalDisplayWallpaperEffectView initExternalDisplayWithDelegate:wallpaperVariant:transformOptions:]([SBExternalDisplayWallpaperEffectView alloc], "initExternalDisplayWithDelegate:wallpaperVariant:transformOptions:", self, 0, 15);
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  objc_msgSend(a4, "setActivationPolicyForParticipantsBelow:", 2 * self->_isPresented);
}

- (BOOL)enableBlurEffects
{
  return 0;
}

- (UIView)wallpaperContainerView
{
  return self->_wallpaperContainerView;
}

- (void)setWallpaperContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperContainerView, a3);
}

- (UIView)wallpaperEffectView
{
  return self->_wallpaperEffectView;
}

- (void)setWallpaperEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperEffectView, a3);
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (void)setZStackParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_zStackParticipant, a3);
}

- (BOOL)isPresented
{
  return self->_isPresented;
}

- (void)setIsPresented:(BOOL)a3
{
  self->_isPresented = a3;
}

- (SBFloatingDockBehaviorAssertion)externalDisplayFloatingDockBehaviorAssertion
{
  return self->_externalDisplayFloatingDockBehaviorAssertion;
}

- (void)setExternalDisplayFloatingDockBehaviorAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_externalDisplayFloatingDockBehaviorAssertion, a3);
}

- (SBWindowScene)_sbWindowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_sbWindowScene);
}

- (void)setSbWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_sbWindowScene, a3);
}

- (SBWallpaperEffectViewFactory)wallpaperEffectViewFactory
{
  return self->_wallpaperEffectViewFactory;
}

- (SBBacklightController)backlightController
{
  return self->_backlightController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backlightController, 0);
  objc_storeStrong((id *)&self->_wallpaperEffectViewFactory, 0);
  objc_destroyWeak((id *)&self->_sbWindowScene);
  objc_storeStrong((id *)&self->_externalDisplayFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_wallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_wallpaperContainerView, 0);
}

@end
