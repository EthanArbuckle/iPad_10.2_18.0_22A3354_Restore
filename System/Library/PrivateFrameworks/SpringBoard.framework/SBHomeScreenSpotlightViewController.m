@implementation SBHomeScreenSpotlightViewController

- (SBHomeScreenSpotlightViewController)initWithDelegate:(id)a3
{
  id v4;
  SBHomeScreenSpotlightViewController *v5;
  SBHomeScreenSpotlightViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBHomeScreenSpotlightViewController;
  v5 = -[SBHomeScreenSpotlightViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_homescreenSpotlightDelegate, v4);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_displayLayoutAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBHomeScreenSpotlightViewController;
  -[SBSpotlightMultiplexingViewController dealloc](&v3, sel_dealloc);
}

- (unint64_t)level
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenSpotlightViewController;
  -[SBSpotlightMultiplexingViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SBHomeScreenSpotlightViewController _setDisplayLayoutElementActive:](self, "_setDisplayLayoutElementActive:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenSpotlightViewController;
  -[SBSpotlightMultiplexingViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SBHomeScreenSpotlightViewController _setDisplayLayoutElementActive:](self, "_setDisplayLayoutElementActive:", 0);
}

- (void)_setDisplayLayoutElementActive:(BOOL)a3
{
  BSInvalidatable *displayLayoutAssertion;
  id v5;
  void *v6;
  BSInvalidatable *v7;
  BSInvalidatable *v8;
  BSInvalidatable *v9;
  void *v10;

  displayLayoutAssertion = self->_displayLayoutAssertion;
  if (a3)
  {
    if (!displayLayoutAssertion)
    {
      v5 = objc_alloc(MEMORY[0x1E0DAAE30]);
      v10 = (void *)objc_msgSend(v5, "initWithIdentifier:", *MEMORY[0x1E0DAB6A0]);
      objc_msgSend(v10, "setLevel:", 0);
      objc_msgSend(v10, "setFillsDisplayBounds:", 1);
      objc_msgSend(v10, "setLayoutRole:", 6);
      objc_msgSend(MEMORY[0x1E0D22910], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addElement:", v10);
      v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v8 = self->_displayLayoutAssertion;
      self->_displayLayoutAssertion = v7;

    }
  }
  else if (displayLayoutAssertion)
  {
    -[BSInvalidatable invalidate](displayLayoutAssertion, "invalidate");
    v9 = self->_displayLayoutAssertion;
    self->_displayLayoutAssertion = 0;

  }
}

- (unint64_t)remoteSearchViewPresentationSource
{
  id WeakRetained;
  void *v4;
  unint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_homescreenSpotlightDelegate);
  v4 = WeakRetained;
  if (WeakRetained)
    v5 = objc_msgSend(WeakRetained, "defaultSearchViewPresentationSourceForViewController:", self);
  else
    v5 = 1;

  return v5;
}

- (SBHomeScreenSpotlightDismissalDelegate)homescreenSpotlightDelegate
{
  return (SBHomeScreenSpotlightDismissalDelegate *)objc_loadWeakRetained((id *)&self->_homescreenSpotlightDelegate);
}

- (BSInvalidatable)displayLayoutAssertion
{
  return self->_displayLayoutAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLayoutAssertion, 0);
  objc_destroyWeak((id *)&self->_homescreenSpotlightDelegate);
}

@end
