@implementation SBIconLabelViewDefaultFactory

- (void)prewarmForSettings:(id)a3 maxSize:(CGSize)a4 minSize:(CGSize)a5 scale:(double)a6
{
  -[SBUILegibilityEngine prewarmForSettings:maxSize:minSize:scale:](self->_engine, "prewarmForSettings:maxSize:minSize:scale:", a3, a4.width, a4.height, a5.width, a5.height, a6);
}

- (id)iconLabelViewWithSettings:(id)a3 imageParameters:(id)a4 forIconView:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBIconSimpleLabelView *v11;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  if (-[SBIconLabelViewDefaultFactory canUseIconSimpleLabelViewToDisplayLabelWithSettings:imageParameters:forIconView:](self, "canUseIconSimpleLabelViewToDisplayLabelWithSettings:imageParameters:forIconView:", v8, v10, v9))
  {
    v11 = -[SBIconSimpleLabelView initWithSettings:]([SBIconSimpleLabelView alloc], "initWithSettings:", v8);
  }
  else
  {
    v11 = -[SBIconLegibilityLabelView initWithSettings:legibilityEngine:]([SBIconLegibilityLabelView alloc], "initWithSettings:legibilityEngine:", v8, self->_engine);
    -[SBIconSimpleLabelView setBackfillTemplateResults:](v11, "setBackfillTemplateResults:", 1);
  }
  -[SBIconSimpleLabelView setUserInteractionEnabled:](v11, "setUserInteractionEnabled:", 0);
  -[SBIconSimpleLabelView setIconView:](v11, "setIconView:", v9);

  -[SBIconSimpleLabelView updateIconLabelWithSettings:imageParameters:](v11, "updateIconLabelWithSettings:imageParameters:", v8, v10);
  return v11;
}

- (BOOL)canUseIconLabelView:(id)a3 toDisplayLabelWithSettings:(id)a4 imageParameters:(id)a5 forIconView:(id)a6
{
  id v10;
  void *v11;

  v10 = a3;
  -[SBIconLabelViewDefaultFactory canUseIconSimpleLabelViewToDisplayLabelWithSettings:imageParameters:forIconView:](self, "canUseIconSimpleLabelViewToDisplayLabelWithSettings:imageParameters:forIconView:", a4, a5, a6);
  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_opt_isKindOfClass();

  return a5 & 1;
}

- (BOOL)canUseIconSimpleLabelViewToDisplayLabelWithSettings:(id)a3 imageParameters:(id)a4 forIconView:(id)a5
{
  id v6;
  _BOOL4 v7;

  v6 = a4;
  if (objc_msgSend(a3, "style"))
    LOBYTE(v7) = 0;
  else
    v7 = !+[SBIconLabelImage needsLegibilityImageForParameters:](SBIconLabelImage, "needsLegibilityImageForParameters:", v6);

  return v7;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_14);
  return (id)sharedInstance_defaultIconLabelViewFactory;
}

void __47__SBIconLabelViewDefaultFactory_sharedInstance__block_invoke()
{
  SBIconLabelViewDefaultFactory *v0;
  void *v1;

  v0 = -[SBIconLabelViewDefaultFactory initWithFactoryIdentifier:]([SBIconLabelViewDefaultFactory alloc], "initWithFactoryIdentifier:", CFSTR("Default SBIconLabelViewDefaultFactory"));
  v1 = (void *)sharedInstance_defaultIconLabelViewFactory;
  sharedInstance_defaultIconLabelViewFactory = (uint64_t)v0;

}

- (SBIconLabelViewDefaultFactory)initWithFactoryIdentifier:(id)a3
{
  id v4;
  SBIconLabelViewDefaultFactory *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  id v9;
  void *v10;
  uint64_t v11;
  SBUILegibilityEngine *engine;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBIconLabelViewDefaultFactory;
  v5 = -[SBIconLabelViewDefaultFactory init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = CFSTR("(SBIconLabelViewDefaultFactory no identifier specified!)");
    objc_storeStrong((id *)&v5->_factoryIdentifier, v8);

    v9 = objc_alloc(MEMORY[0x1E0DAC5D0]);
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("-LegibilityEngine"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithEngineIdentifier:", v10);
    engine = v5->_engine;
    v5->_engine = (SBUILegibilityEngine *)v11;

    -[SBUILegibilityEngine setUseMinFillHeightForTemplateGeneration:](v5->_engine, "setUseMinFillHeightForTemplateGeneration:", 1);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factoryIdentifier, 0);
  objc_storeStrong((id *)&self->_engine, 0);
}

@end
