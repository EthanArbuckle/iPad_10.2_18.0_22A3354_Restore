@implementation STHeroWelcomeController

- (STHeroWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 topInset:(double)a5
{
  return -[STHeroWelcomeController initWithTitle:detailText:icon:contentLayout:topInset:](self, "initWithTitle:detailText:icon:contentLayout:topInset:", a3, a4, 0, 1, a5);
}

- (STHeroWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 topInset:(double)a6
{
  return -[STHeroWelcomeController initWithTitle:detailText:icon:contentLayout:topInset:](self, "initWithTitle:detailText:icon:contentLayout:topInset:", a3, a4, a5, 2, a6);
}

- (STHeroWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6 topInset:(double)a7
{
  STHeroWelcomeController *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STHeroWelcomeController;
  result = -[STHeroWelcomeController initWithTitle:detailText:icon:contentLayout:](&v9, sel_initWithTitle_detailText_icon_contentLayout_, a3, a4, a5, a6);
  result->_topInset = a7;
  return result;
}

- (void)setView:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)STHeroWelcomeController;
    -[STHeroWelcomeController setView:](&v5, sel_setView_, v4);
  }

}

- (void)loadView
{
  STOnboardingView *v3;
  STOnboardingView *v4;
  objc_super v5;

  v3 = [STOnboardingView alloc];
  -[STHeroWelcomeController topInset](self, "topInset");
  v4 = -[STOnboardingView initWithTopInset:](v3, "initWithTopInset:");
  -[STHeroWelcomeController setView:](self, "setView:", v4);

  v5.receiver = self;
  v5.super_class = (Class)STHeroWelcomeController;
  -[OBBaseWelcomeController loadView](&v5, sel_loadView);
}

- (double)topInset
{
  return self->_topInset;
}

- (void)setTopInset:(double)a3
{
  self->_topInset = a3;
}

@end
