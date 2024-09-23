@implementation UGCGlyphButtonView

- (double)animationDuration
{
  return 0.25;
}

+ (id)_sharedThumbButtonConfig
{
  UGCGlyphButtonAppearance *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(UGCGlyphButtonAppearance);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme ugcGlyphButtonViewUnselectedBackgroundColor](MapsTheme, "ugcGlyphButtonViewUnselectedBackgroundColor"));
  -[UGCGlyphButtonAppearance setUnselectedBackgroundColor:](v2, "setUnselectedBackgroundColor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme ugcGlyphButtonViewUnselectedGlyphColor](MapsTheme, "ugcGlyphButtonViewUnselectedGlyphColor"));
  -[UGCGlyphButtonAppearance setUnselectedGlyphColor:](v2, "setUnselectedGlyphColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme ugcGlyphButtonViewSelectedGlyphColor](MapsTheme, "ugcGlyphButtonViewSelectedGlyphColor"));
  -[UGCGlyphButtonAppearance setSelectedGlyphColor:](v2, "setSelectedGlyphColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme ugcGlyphButtonViewSelectedBackgroundColor](MapsTheme, "ugcGlyphButtonViewSelectedBackgroundColor"));
  -[UGCGlyphButtonAppearance setSelectedBackgroundColor:](v2, "setSelectedBackgroundColor:", v6);

  return v2;
}

+ (id)likeButtonView
{
  UGCLikeGlyphButtonView *v2;
  void *v3;
  UGCLikeGlyphButtonView *v4;

  v2 = [UGCLikeGlyphButtonView alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UGCGlyphButtonAppearance thumbsUpButtonAppearance](UGCGlyphButtonAppearance, "thumbsUpButtonAppearance"));
  v4 = -[UGCGlyphButtonView initWithAppearance:](v2, "initWithAppearance:", v3);

  return v4;
}

+ (id)dislikeButtonView
{
  UGCDislikeGlyphButtonView *v2;
  void *v3;
  UGCDislikeGlyphButtonView *v4;

  v2 = [UGCDislikeGlyphButtonView alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UGCGlyphButtonAppearance thumbsDownButtonAppearance](UGCGlyphButtonAppearance, "thumbsDownButtonAppearance"));
  v4 = -[UGCGlyphButtonView initWithAppearance:](v2, "initWithAppearance:", v3);

  return v4;
}

- (UGCGlyphButtonView)initWithAppearance:(id)a3
{
  id v5;
  UGCGlyphButtonView *v6;
  UGCGlyphButtonView *v7;
  UIImpactFeedbackGenerator *v8;
  UIImpactFeedbackGenerator *feedbackGenerator;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UGCGlyphButtonView;
  v6 = -[UGCGlyphButtonView initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_glyphAppearance, a3);
    v8 = (UIImpactFeedbackGenerator *)objc_msgSend(objc_alloc((Class)UIImpactFeedbackGenerator), "initWithStyle:view:", 1, v7);
    feedbackGenerator = v7->_feedbackGenerator;
    v7->_feedbackGenerator = v8;

    -[UGCGlyphButtonView _setupButton](v7, "_setupButton");
  }

  return v7;
}

- (void)_setupButton
{
  UIImageView *v3;
  UIImageView *glyph;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[2];

  -[UGCGlyphButtonView _setCornerRadius:](self, "_setCornerRadius:", 20.0);
  self->_selected = 0;
  self->_enabled = 1;
  v3 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  glyph = self->_glyph;
  self->_glyph = v3;

  -[UIImageView setMinimumContentSizeCategory:](self->_glyph, "setMinimumContentSizeCategory:", UIContentSizeCategoryLarge);
  -[UIImageView setMaximumContentSizeCategory:](self->_glyph, "setMaximumContentSizeCategory:", UIContentSizeCategoryLarge);
  -[UIImageView setContentMode:](self->_glyph, "setContentMode:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UGCFontManager ratingGlyphButtonFont](UGCFontManager, "ratingGlyphButtonFont"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v5));

  -[UIImageView setPreferredSymbolConfiguration:](self->_glyph, "setPreferredSymbolConfiguration:", v6);
  -[UGCGlyphButtonView addSubview:](self, "addSubview:", self->_glyph);
  v7 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_handleGlyphTap");
  -[UGCGlyphButtonView setTapGestureRecognizer:](self, "setTapGestureRecognizer:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonView tapGestureRecognizer](self, "tapGestureRecognizer"));
  -[UGCGlyphButtonView addGestureRecognizer:](self, "addGestureRecognizer:", v8);

  -[UGCGlyphButtonView _updateAppearanceAnimated:](self, "_updateAppearanceAnimated:", 0);
  v9 = objc_msgSend(objc_alloc((Class)MUEdgeLayout), "initWithItem:container:", self->_glyph, self);
  v10 = objc_msgSend(objc_alloc((Class)MUSizeLayout), "initWithItem:size:", self->_glyph, 40.0, 40.0);
  v12[0] = v9;
  v12[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
  +[NSLayoutConstraint _mapsui_activateLayouts:](NSLayoutConstraint, "_mapsui_activateLayouts:", v11);

}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[UITapGestureRecognizer setEnabled:](self->_tapGestureRecognizer, "setEnabled:");
    -[UGCGlyphButtonView _updateAppearanceAnimated:](self, "_updateAppearanceAnimated:", 0);
  }
}

- (void)setSelected:(BOOL)a3
{
  -[UGCGlyphButtonView setSelected:animated:](self, "setSelected:animated:", a3, 0);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_selected != a3)
  {
    v4 = a4;
    self->_selected = a3;
    if (a4)
      -[UIImpactFeedbackGenerator impactOccurred](self->_feedbackGenerator, "impactOccurred");
    -[UGCGlyphButtonView _updateAppearanceAnimated:](self, "_updateAppearanceAnimated:", v4);
  }
}

- (void)setMuted:(BOOL)a3
{
  if (self->_muted != a3)
  {
    self->_muted = a3;
    -[UGCGlyphButtonView _updateAppearanceAnimated:](self, "_updateAppearanceAnimated:", 0);
  }
}

- (void)_updateAppearanceAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[5];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonView layer](self, "layer"));
  objc_msgSend(v5, "removeAllAnimations");

  -[UGCGlyphButtonView _updateGlyphAppearance](self, "_updateGlyphAppearance");
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonView layer](self, "layer"));
    objc_msgSend(v6, "convertTime:fromLayer:", 0, CACurrentMediaTime());
    v8 = v7;

    -[UGCGlyphButtonView animationDuration](self, "animationDuration");
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10093F41C;
    v10[3] = &unk_1011AC860;
    v10[4] = self;
    -[UGCGlyphButtonView animateWithBeginTime:completionDelay:completion:](self, "animateWithBeginTime:completionDelay:completion:", v10, v8, v9);
  }
}

- (void)_updateGlyphAppearance
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  UGCGlyphButtonAppearance *glyphAppearance;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  if (self->_selected)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonAppearance selectedGlyphName](self->_glyphAppearance, "selectedGlyphName"));
    v16 = (id)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v3));

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonAppearance selectedBackgroundColor](self->_glyphAppearance, "selectedBackgroundColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonAppearance selectedGlyphColor](self->_glyphAppearance, "selectedGlyphColor"));
    v6 = objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonAppearance selectedGlyphFontSize](self->_glyphAppearance, "selectedGlyphFontSize"));
  }
  else
  {
    glyphAppearance = self->_glyphAppearance;
    if (self->_muted)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonAppearance mutedGlyphName](glyphAppearance, "mutedGlyphName"));
      v16 = (id)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v8));

      v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonAppearance mutedBackgroundColor](self->_glyphAppearance, "mutedBackgroundColor"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonAppearance mutedGlyphColor](self->_glyphAppearance, "mutedGlyphColor"));
      v6 = objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonAppearance mutedGlyphFontSize](self->_glyphAppearance, "mutedGlyphFontSize"));
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonAppearance unselectedGlyphName](glyphAppearance, "unselectedGlyphName"));
      v16 = (id)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v9));

      v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonAppearance unselectedBackgroundColor](self->_glyphAppearance, "unselectedBackgroundColor"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonAppearance unselectedGlyphColor](self->_glyphAppearance, "unselectedGlyphColor"));
      v6 = objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonAppearance unselectedGlyphFontSize](self->_glyphAppearance, "unselectedGlyphFontSize"));
    }
  }
  v10 = (void *)v6;
  if (!self->_enabled)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorWithAlphaComponent:", 0.3));

    v5 = (void *)v11;
  }
  -[UGCGlyphButtonView setBackgroundColor:](self, "setBackgroundColor:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonView glyph](self, "glyph"));
  objc_msgSend(v12, "setImage:", v16);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonView glyph](self, "glyph"));
  objc_msgSend(v13, "setTintColor:", v5);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UGCGlyphButtonView glyph](self, "glyph"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v10));
  objc_msgSend(v14, "setPreferredSymbolConfiguration:", v15);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 40.0;
  v3 = 40.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_handleGlyphTap
{
  id WeakRetained;

  -[UIImpactFeedbackGenerator prepare](self->_feedbackGenerator, "prepare");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didTapOnGlyphView:", self);

}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (UGCGlyphButtonViewDelegate)delegate
{
  return (UGCGlyphButtonViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImageView)glyph
{
  return self->_glyph;
}

- (void)setGlyph:(id)a3
{
  objc_storeStrong((id *)&self->_glyph, a3);
}

- (UGCGlyphButtonAppearance)glyphAppearance
{
  return self->_glyphAppearance;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (CALayer)animationLayer
{
  return self->_animationLayer;
}

- (void)setAnimationLayer:(id)a3
{
  objc_storeStrong((id *)&self->_animationLayer, a3);
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (void)setContentLayer:(id)a3
{
  objc_storeStrong((id *)&self->_contentLayer, a3);
}

- (CALayer)selectionLayer
{
  return self->_selectionLayer;
}

- (void)setSelectionLayer:(id)a3
{
  objc_storeStrong((id *)&self->_selectionLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionLayer, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_animationLayer, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_glyphAppearance, 0);
  objc_storeStrong((id *)&self->_glyph, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
