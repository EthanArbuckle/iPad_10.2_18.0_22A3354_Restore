@implementation PLPhotoTilePlaceholderView

- (PLPhotoTilePlaceholderView)initWithFrame:(CGRect)a3
{
  PLPhotoTilePlaceholderView *v3;
  double v4;
  id v5;
  UIActivityIndicatorView *v6;
  UILabel *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLPhotoTilePlaceholderView;
  v3 = -[PLPhotoTilePlaceholderView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v3->_lastViewPhaseChangeDate = v4;
    -[PLPhotoTilePlaceholderView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[PLPhotoTilePlaceholderView setBackgroundColor:](v3, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "clearColor"));
    v3->_loadingContainerView = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC68]), "initWithPrivateStyle:", 2020);
    -[UIView addSubview:](v3->_loadingContainerView, "addSubview:", v5);
    -[UIView sendSubviewToBack:](v3->_loadingContainerView, "sendSubviewToBack:", v5);
    -[UIView setClipsToBounds:](v3->_loadingContainerView, "setClipsToBounds:", 1);
    -[CALayer setCornerRadius:](-[UIView layer](v3->_loadingContainerView, "layer"), "setCornerRadius:", 9.0);
    v6 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    v3->_loadingIndicatorView = v6;
    -[UIActivityIndicatorView startAnimating](v6, "startAnimating");
    -[UIView addSubview:](v3->_loadingContainerView, "addSubview:", v3->_loadingIndicatorView);
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    v3->_loadingLabel = v7;
    -[UILabel setOpaque:](v7, "setOpaque:", 0);
    -[UILabel setBackgroundColor:](v3->_loadingLabel, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "clearColor"));
    -[UILabel setFont:](v3->_loadingLabel, "setFont:", objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 16.0));
    -[UILabel setAlpha:](v3->_loadingLabel, "setAlpha:", 0.5);
    -[UILabel setTextColor:](v3->_loadingLabel, "setTextColor:", objc_msgSend(MEMORY[0x1E0CEA478], "blackColor"));
    -[UILabel setText:](v3->_loadingLabel, "setText:", PLLocalizedFrameworkString());
    -[UIView addSubview:](v3->_loadingContainerView, "addSubview:", v3->_loadingLabel);
    -[PLPhotoTilePlaceholderView addSubview:](v3, "addSubview:", v3->_loadingContainerView);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLPhotoTilePlaceholderView;
  -[PLPhotoTilePlaceholderView dealloc](&v3, sel_dealloc);
}

- (void)fadeOutSoonIfNeededAndRemoveFromSuperview:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  if (v3)
  {
    v6 = v5 - self->_lastViewPhaseChangeDate;
    v7 = 0.3 - v6;
    v8 = v6 < 0.3;
    v9 = 0.0;
    if (v8)
      v9 = v7;
    v10[4] = self;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__PLPhotoTilePlaceholderView_fadeOutSoonIfNeededAndRemoveFromSuperview___block_invoke;
    v11[3] = &unk_1E70B6370;
    v11[4] = self;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72__PLPhotoTilePlaceholderView_fadeOutSoonIfNeededAndRemoveFromSuperview___block_invoke_2;
    v10[3] = &unk_1E70B6398;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v11, v10, 0.3, v9);
  }
  else
  {
    -[PLPhotoTilePlaceholderView removeFromSuperview](self, "removeFromSuperview");
  }
}

- (void)showLoadingIndicatorWhenReady
{
  _QWORD v2[5];
  _QWORD v3[5];

  if (!self->_indicatorIsVisible)
  {
    self->_indicatorIsVisible = 1;
    v2[4] = self;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __59__PLPhotoTilePlaceholderView_showLoadingIndicatorWhenReady__block_invoke;
    v3[3] = &unk_1E70B6370;
    v3[4] = self;
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __59__PLPhotoTilePlaceholderView_showLoadingIndicatorWhenReady__block_invoke_2;
    v2[3] = &unk_1E70B6398;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v3, v2, 0.25, 1.0);
  }
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v16.receiver = self;
  v16.super_class = (Class)PLPhotoTilePlaceholderView;
  -[PLPhotoTilePlaceholderView layoutSubviews](&v16, sel_layoutSubviews);
  -[PLPhotoTilePlaceholderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIActivityIndicatorView setFrame:](self->_loadingIndicatorView, "setFrame:", 10.0, 10.0, 20.0, 20.0);
  -[UILabel sizeThatFits:](self->_loadingLabel, "sizeThatFits:", v8, v10);
  v12 = v11;
  v14 = v13;
  v17.origin.x = 10.0;
  v17.origin.y = 10.0;
  v17.size.width = 20.0;
  v17.size.height = 20.0;
  v15 = CGRectGetMaxX(v17) + 5.0;
  -[UILabel setFrame:](self->_loadingLabel, "setFrame:", v15, 11.0, v12, v14);
  v18.origin.y = 11.0;
  v18.origin.x = v15;
  v18.size.width = v12;
  v18.size.height = v14;
  CGRectGetMaxX(v18);
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  CGRectGetMidY(v19);
  UIRectCenteredXInRect();
  -[UIView setFrame:](self->_loadingContainerView, "setFrame:");
}

uint64_t __59__PLPhotoTilePlaceholderView_showLoadingIndicatorWhenReady__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 1.0);
}

uint64_t __59__PLPhotoTilePlaceholderView_showLoadingIndicatorWhenReady__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440) = v3;
  return result;
}

uint64_t __72__PLPhotoTilePlaceholderView_fadeOutSoonIfNeededAndRemoveFromSuperview___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __72__PLPhotoTilePlaceholderView_fadeOutSoonIfNeededAndRemoveFromSuperview___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

@end
