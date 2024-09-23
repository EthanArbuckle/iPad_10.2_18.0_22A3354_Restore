@implementation _SBTodaySpotlightViewController

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_displayLayoutAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_SBTodaySpotlightViewController;
  -[SBSpotlightMultiplexingViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SBTodaySpotlightViewController;
  -[SBSpotlightMultiplexingViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[_SBTodaySpotlightViewController _setDisplayLayoutElementActive:](self, "_setDisplayLayoutElementActive:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SBTodaySpotlightViewController;
  -[SBSpotlightMultiplexingViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[_SBTodaySpotlightViewController _setDisplayLayoutElementActive:](self, "_setDisplayLayoutElementActive:", 0);
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
      objc_msgSend(v10, "setLevel:", -[_SBTodaySpotlightViewController _displayLayoutElementLevel](self, "_displayLayoutElementLevel"));
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

- (int64_t)_displayLayoutElementLevel
{
  if (self->_location == 2)
    return (uint64_t)*MEMORY[0x1E0CEBBD0];
  else
    return 0;
}

- (unint64_t)level
{
  if (self->_location == 1)
    return 1;
  else
    return 3;
}

- (unint64_t)remoteSearchViewPresentationSource
{
  if (self->_location == 1)
    return 2;
  else
    return 3;
}

- (int64_t)location
{
  return self->_location;
}

- (void)setLocation:(int64_t)a3
{
  self->_location = a3;
}

- (BSInvalidatable)displayLayoutAssertion
{
  return self->_displayLayoutAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLayoutAssertion, 0);
}

@end
