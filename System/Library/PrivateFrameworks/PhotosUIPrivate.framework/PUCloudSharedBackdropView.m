@implementation PUCloudSharedBackdropView

- (PUCloudSharedBackdropView)init
{
  return -[PUCloudSharedBackdropView initWithFrame:asMask:](self, "initWithFrame:asMask:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PUCloudSharedBackdropView)initWithFrame:(CGRect)a3
{
  return -[PUCloudSharedBackdropView initWithFrame:asMask:](self, "initWithFrame:asMask:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PUCloudSharedBackdropView)initWithFrame:(CGRect)a3 asMask:(BOOL)a4
{
  PUCloudSharedBackdropView *v5;
  PUCloudSharedBackdropView *v6;
  uint64_t v7;
  UIView *backdropView;
  PUCloudSharedBackdropView *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUCloudSharedBackdropView;
  v5 = -[PUCloudSharedBackdropView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    v5->_isMask = a4;
    if (!a4)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithPrivateStyle:", 10050);
      backdropView = v6->_backdropView;
      v6->_backdropView = (UIView *)v7;

      -[PUCloudSharedBackdropView addSubview:](v6, "addSubview:", v6->_backdropView);
    }
    v9 = v6;
  }

  return v6;
}

- (void)setHasRoundedCorners:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  id v8;

  v3 = a3;
  self->_hasRoundedCorners = a3;
  -[PUCloudSharedBackdropView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 0.0;
  if (v3)
    v7 = 7.0;
  objc_msgSend(v5, "setCornerRadius:", v7);

  -[PUCloudSharedBackdropView layer](self, "layer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMasksToBounds:", 1);

}

- (void)layoutSubviews
{
  UIView *backdropView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUCloudSharedBackdropView;
  -[PUCloudSharedBackdropView layoutSubviews](&v4, sel_layoutSubviews);
  backdropView = self->_backdropView;
  if (backdropView)
  {
    -[PUCloudSharedBackdropView bounds](self, "bounds");
    -[UIView setFrame:](backdropView, "setFrame:");
    -[PUCloudSharedBackdropView sendSubviewToBack:](self, "sendSubviewToBack:", self->_backdropView);
  }
}

- (BOOL)hasRoundedCorners
{
  return self->_hasRoundedCorners;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
