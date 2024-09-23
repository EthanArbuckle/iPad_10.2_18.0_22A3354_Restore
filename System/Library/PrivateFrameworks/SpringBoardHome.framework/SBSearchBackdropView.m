@implementation SBSearchBackdropView

- (SBSearchBackdropView)initWithFrame:(CGRect)a3
{
  return -[SBSearchBackdropView initWithFrame:style:](self, "initWithFrame:style:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBSearchBackdropView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  SBSearchBackdropView *v5;
  char v6;
  void *v7;
  MTMaterialView *materialView;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBSearchBackdropView;
  v5 = -[SBSearchBackdropView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = SBHIsSpotlightFloatingWindowEnabled();
    if (a4 == 1 || (v6 & 1) == 0)
    {
      -[SBSearchBackdropView _materialViewForStyle:](v5, "_materialViewForStyle:", a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_storeStrong((id *)&v5->_materialView, v7);
        materialView = v5->_materialView;
        -[SBSearchBackdropView bounds](v5, "bounds");
        -[MTMaterialView setFrame:](materialView, "setFrame:");
        -[MTMaterialView setShouldCrossfade:](v5->_materialView, "setShouldCrossfade:", 1);
        -[MTMaterialView setAutoresizingMask:](v5->_materialView, "setAutoresizingMask:", 18);
        -[SBSearchBackdropView addSubview:](v5, "addSubview:", v5->_materialView);
      }

    }
  }
  return v5;
}

- (void)prepareForTransitionToBlurred:(BOOL)a3
{
  self->_transitioningToBlurred = a3;
  -[SBSearchBackdropView setTransitionProgress:](self, "setTransitionProgress:", 0.0);
}

- (void)completeTransitionSuccessfully:(BOOL)a3
{
  -[SBSearchBackdropView setTransitionProgress:](self, "setTransitionProgress:", (double)a3);
}

- (void)setTransitionProgress:(double)a3
{
  self->_transitionProgress = a3;
  if (!self->_transitioningToBlurred)
    a3 = 1.0 - a3;
  -[MTMaterialView setWeighting:](self->_materialView, "setWeighting:", a3);
}

- (id)_materialViewForStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  if (a3 == 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v4;
    v15[0] = CFSTR("knowledgeBackgroundZoomed");
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v5;
    v15[1] = CFSTR("knowledgeBackgroundZoomed");
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v6;
    v15[2] = CFSTR("knowledgeBackgroundDarkZoomed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0D47498];
    SBHBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSearchBackdropView traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "materialViewWithRecipeNamesByTraitCollection:inBundle:options:initialWeighting:scaleAdjustment:compatibleWithTraitCollection:", v7, v9, 0, 0, v10, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return v11;
  }
  else
  {
    v13 = objc_msgSend((id)objc_opt_class(), "_builtInMaterialRecipeForStyle:", a3);
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", v13);
      return (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
}

+ (int64_t)_builtInMaterialRecipeForStyle:(int64_t)a3
{
  if (a3)
    return 4 * (a3 == 2);
  else
    return 14;
}

- (BOOL)isTransitioningToBlurred
{
  return self->_transitioningToBlurred;
}

- (double)transitionProgress
{
  return self->_transitionProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialView, 0);
}

@end
