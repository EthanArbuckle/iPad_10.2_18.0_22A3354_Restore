@implementation SBIconLabelViewSimpleFactory

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_74 != -1)
    dispatch_once(&sharedInstance_onceToken_74, &__block_literal_global_75);
  return (id)sharedInstance_simpleIconLabelViewFactory;
}

void __46__SBIconLabelViewSimpleFactory_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_simpleIconLabelViewFactory;
  sharedInstance_simpleIconLabelViewFactory = v0;

}

- (id)iconLabelViewWithSettings:(id)a3 imageParameters:(id)a4 forIconView:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBIconSimpleLabelView *prewarmSimpleLabelView;
  SBIconSimpleLabelView *v12;
  SBIconSimpleLabelView *v13;
  SBIconSimpleLabelView *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  prewarmSimpleLabelView = self->_prewarmSimpleLabelView;
  if (!prewarmSimpleLabelView)
  {
    v12 = -[SBIconSimpleLabelView initWithSettings:]([SBIconSimpleLabelView alloc], "initWithSettings:", v8);
    v13 = self->_prewarmSimpleLabelView;
    self->_prewarmSimpleLabelView = v12;

    -[SBIconSimpleLabelView setUserInteractionEnabled:](self->_prewarmSimpleLabelView, "setUserInteractionEnabled:", 0);
    prewarmSimpleLabelView = self->_prewarmSimpleLabelView;
  }
  -[SBIconSimpleLabelView setIconView:](prewarmSimpleLabelView, "setIconView:", v10);
  -[SBIconSimpleLabelView updateIconLabelWithSettings:imageParameters:](self->_prewarmSimpleLabelView, "updateIconLabelWithSettings:imageParameters:", v8, v9);
  v14 = self->_prewarmSimpleLabelView;

  return v14;
}

- (BOOL)canUseIconLabelView:(id)a3 toDisplayLabelWithSettings:(id)a4 imageParameters:(id)a5 forIconView:(id)a6
{
  return self->_prewarmSimpleLabelView == a3;
}

- (BOOL)canUseIconSimpleLabelViewToDisplayLabelWithSettings:(id)a3 imageParameters:(id)a4 forIconView:(id)a5
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prewarmSimpleLabelView, 0);
}

@end
