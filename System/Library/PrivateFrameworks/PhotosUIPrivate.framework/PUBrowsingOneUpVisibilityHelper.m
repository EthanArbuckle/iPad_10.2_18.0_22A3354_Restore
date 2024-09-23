@implementation PUBrowsingOneUpVisibilityHelper

- (PUBrowsingOneUpVisibilityHelper)initWithBrowsingViewModel:(id)a3 isPresentedForSecondScreen:(BOOL)a4
{
  id v7;
  PUBrowsingOneUpVisibilityHelper *v8;
  PUBrowsingOneUpVisibilityHelper *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUBrowsingOneUpVisibilityHelper;
  v8 = -[PUBrowsingOneUpVisibilityHelper init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_isOneUpVisible = 0;
    v8->_isPresentedForSecondScreen = a4;
    objc_storeStrong((id *)&v8->_browsingViewModel, a3);
    -[PUBrowsingViewModel registerChangeObserver:](v9->_browsingViewModel, "registerChangeObserver:", v9);
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PUBrowsingOneUpVisibilityHelper browsingViewModel](self, "browsingViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterChangeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PUBrowsingOneUpVisibilityHelper;
  -[PUBrowsingOneUpVisibilityHelper dealloc](&v4, sel_dealloc);
}

- (void)setIsOneUpVisible:(BOOL)a3
{
  if (self->_isOneUpVisible != a3)
    self->_isOneUpVisible = a3;
}

- (BOOL)isOneUpVisible
{
  return self->_isOneUpVisible;
}

- (BOOL)isPresentedForSecondScreen
{
  return self->_isPresentedForSecondScreen;
}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (void)setBrowsingViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_browsingViewModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
}

@end
