@implementation PLWallpaperButton

- (PLWallpaperButton)initWithFrame:(CGRect)a3
{
  return -[PLWallpaperButton initWithFrame:style:](self, "initWithFrame:style:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PLWallpaperButton)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  PLWallpaperButton *v5;
  PLWallpaperButton *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLWallpaperButton;
  v5 = -[PLWallpaperButton initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    -[PLWallpaperButton setOpaque:](v5, "setOpaque:", 0);
    if (!a4)
      -[PLWallpaperButton _setupBackdropView](v6, "_setupBackdropView");
    -[PLWallpaperButton _updateContentEdgeInsets](v6, "_updateContentEdgeInsets");
  }
  return v6;
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLWallpaperButton;
  -[PLWallpaperButton safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[PLWallpaperButton _updateContentEdgeInsets](self, "_updateContentEdgeInsets");
}

- (void)_updateContentEdgeInsets
{
  -[PLWallpaperButton safeAreaInsets](self, "safeAreaInsets");
  -[PLWallpaperButton setContentEdgeInsets:](self, "setContentEdgeInsets:");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLWallpaperButton;
  -[PLWallpaperButton dealloc](&v3, sel_dealloc);
}

- (void)_setupBackdropView
{
  _UIBackdropView *v3;

  v3 = (_UIBackdropView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC68]), "initWithPrivateStyle:", 2010);
  self->_backdropView = v3;
  -[_UIBackdropView addObserver:](v3, "addObserver:", self);
  -[PLWallpaperButton addSubview:](self, "addSubview:", self->_backdropView);
  -[_UIBackdropView setUserInteractionEnabled:](self->_backdropView, "setUserInteractionEnabled:", 0);
  -[_UIBackdropView setAppliesOutputSettingsAnimationDuration:](self->_backdropView, "setAppliesOutputSettingsAnimationDuration:", 0.0);
  -[PLWallpaperButton sendSubviewToBack:](self, "sendSubviewToBack:", self->_backdropView);
  -[PLWallpaperButton backdropViewDidChange:](self, "backdropViewDidChange:", self->_backdropView);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  _UIBackdropView *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v5 = -[PLWallpaperButton backdropView](self, "backdropView");
  v6 = (void *)-[_UIBackdropView inputSettings](v5, "inputSettings");
  v7 = (void *)-[_UIBackdropView outputSettings](v5, "outputSettings");
  v8.receiver = self;
  v8.super_class = (Class)PLWallpaperButton;
  -[PLWallpaperButton setHighlighted:](&v8, sel_setHighlighted_, v3);
  objc_msgSend(v6, "restoreDefaultValues");
  objc_msgSend(v6, "setHighlighted:", -[PLWallpaperButton isHighlighted](self, "isHighlighted"));
  objc_msgSend(v7, "computeOutputSettingsUsingModel:", v6);
  -[_UIBackdropView applySettings:](v5, "applySettings:", v7);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  _UIBackdropView *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v5 = -[PLWallpaperButton backdropView](self, "backdropView");
  v6 = (void *)-[_UIBackdropView inputSettings](v5, "inputSettings");
  v7 = (void *)-[_UIBackdropView outputSettings](v5, "outputSettings");
  v8.receiver = self;
  v8.super_class = (Class)PLWallpaperButton;
  -[PLWallpaperButton setSelected:](&v8, sel_setSelected_, v3);
  objc_msgSend(v6, "restoreDefaultValues");
  objc_msgSend(v6, "setSelected:", -[PLWallpaperButton isSelected](self, "isSelected"));
  objc_msgSend(v7, "computeOutputSettingsUsingModel:", v6);
  -[_UIBackdropView applySettings:](v5, "applySettings:", v7);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  _UIBackdropView *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v5 = -[PLWallpaperButton backdropView](self, "backdropView");
  v6 = (void *)-[_UIBackdropView inputSettings](v5, "inputSettings");
  v7 = (void *)-[_UIBackdropView outputSettings](v5, "outputSettings");
  v8.receiver = self;
  v8.super_class = (Class)PLWallpaperButton;
  -[PLWallpaperButton setEnabled:](&v8, sel_setEnabled_, v3);
  objc_msgSend(v6, "restoreDefaultValues");
  objc_msgSend(v6, "setEnabled:", -[PLWallpaperButton isEnabled](self, "isEnabled"));
  objc_msgSend(v7, "computeOutputSettingsUsingModel:", v6);
  -[_UIBackdropView applySettings:](v5, "applySettings:", v7);
}

- (void)backdropViewDidChange:(id)a3
{
  -[PLWallpaperButton setTitleColor:forState:](self, "setTitleColor:forState:", objc_msgSend((id)objc_msgSend(a3, "outputSettings"), "legibleColor"), 0);
}

- (UIImageView)titleMaskImageView
{
  return self->_titleMaskImageView;
}

- (void)setTitleMaskImageView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 752);
}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 760);
}

+ (id)autoLayoutCommonWallpaperButton
{
  return +[PLWallpaperButton autoLayoutCommonWallpaperButtonWithStyle:](PLWallpaperButton, "autoLayoutCommonWallpaperButtonWithStyle:", 0);
}

+ (id)autoLayoutCommonWallpaperButtonWithStyle:(int64_t)a3
{
  PLWallpaperButton *v4;
  PLWallpaperButton *v5;
  double v6;
  double v7;

  v4 = [PLWallpaperButton alloc];
  v5 = -[PLWallpaperButton initWithFrame:style:](v4, "initWithFrame:style:", a3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[PLWallpaperButton setExclusiveTouch:](v5, "setExclusiveTouch:", 1);
  -[PLWallpaperButton setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v6) = 1144750080;
  -[PLWallpaperButton setContentCompressionResistancePriority:forAxis:](v5, "setContentCompressionResistancePriority:forAxis:", 0, v6);
  LODWORD(v7) = 1132068864;
  -[PLWallpaperButton setContentHuggingPriority:forAxis:](v5, "setContentHuggingPriority:forAxis:", 0, v7);
  return v5;
}

@end
