@implementation PUPhotosSharingOptionView

- (PUPhotosSharingOptionView)initWithFrame:(CGRect)a3
{
  PUPhotosSharingOptionView *v3;
  id v4;
  uint64_t v5;
  PXUIAssetBadgeView *toggleGlyphButton;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUPhotosSharingOptionView;
  v3 = -[PUPhotosSharingOptionView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D7BB38]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    toggleGlyphButton = v3->_toggleGlyphButton;
    v3->_toggleGlyphButton = (PXUIAssetBadgeView *)v5;

    -[PXUIAssetBadgeView setDelegate:](v3->_toggleGlyphButton, "setDelegate:", v3);
    -[PXUIAssetBadgeView setStyle:](v3->_toggleGlyphButton, "setStyle:", 4);
    -[PXUIAssetBadgeView setOverContent:](v3->_toggleGlyphButton, "setOverContent:", 1);
    -[PUPhotosSharingOptionView addSubview:](v3, "addSubview:", v3->_toggleGlyphButton);
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PXUIAssetBadgeView sizeThatFits:](self->_toggleGlyphButton, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setInteractive:(BOOL)a3
{
  if (self->_interactive != a3)
  {
    self->_interactive = a3;
    -[PUPhotosSharingOptionView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setToggled:(BOOL)a3
{
  if (self->_toggled != a3)
  {
    self->_toggled = a3;
    -[PUPhotosSharingOptionView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  objc_storeWeak(&self->_target, a3);
  self->_action = a4;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  -[PUPhotosSharingOptionView bounds](self, "bounds", a4);
  v9 = CGRectInset(v8, -8.0, -8.0);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v9, v7);
}

- (void)layoutSubviews
{
  PXUIAssetBadgeView *toggleGlyphButton;
  double v4;
  double v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUPhotosSharingOptionView;
  -[PUPhotosSharingOptionView layoutSubviews](&v7, sel_layoutSubviews);
  if (-[PUPhotosSharingOptionView isInteractive](self, "isInteractive"))
    -[PUPhotosSharingOptionView isToggled](self, "isToggled");
  toggleGlyphButton = self->_toggleGlyphButton;
  PXAssetBadgeInfoCreateWithBadges();
  -[PXUIAssetBadgeView setBadgeInfo:](toggleGlyphButton, "setBadgeInfo:", &v6);
  -[PXUIAssetBadgeView sizeThatFits:](self->_toggleGlyphButton, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[PXUIAssetBadgeView setFrame:](self->_toggleGlyphButton, "setFrame:", 0.0, 0.0, v4, v5);
}

- (void)assetBadgeView:(id)a3 userDidSelectBadges:(unint64_t)a4
{
  SEL action;
  id WeakRetained;
  id v7;

  if (self->_action)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", a3, a4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    action = self->_action;
    WeakRetained = objc_loadWeakRetained(&self->_target);
    objc_msgSend(v7, "sendAction:to:from:forEvent:", action, WeakRetained, self, 0);

  }
}

- (BOOL)isInteractive
{
  return self->_interactive;
}

- (BOOL)isToggled
{
  return self->_toggled;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_toggleGlyphButton, 0);
}

@end
