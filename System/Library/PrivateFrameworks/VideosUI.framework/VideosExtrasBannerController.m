@implementation VideosExtrasBannerController

- (VideosExtrasBannerController)initWithBannerElement:(id)a3
{
  id v5;
  VideosExtrasBannerController *v6;
  VideosExtrasBannerController *v7;
  uint64_t v8;
  UIView *maskView;
  UIView *v10;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VideosExtrasBannerController;
  v6 = -[VideosExtrasBannerController init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bannerElement, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initForAutolayout");
    maskView = v7->_maskView;
    v7->_maskView = (UIView *)v8;

    v10 = v7->_maskView;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v11);

  }
  return v7;
}

- (void)_configureBanner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  double v8;
  double v9;
  UIImageView *bannerImageView;
  _QWORD v11[5];

  -[IKDocumentBannerElement background](self->_bannerElement, "background");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "images");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "artworkCatalog");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_installedView);
    objc_msgSend(WeakRetained, "frame");
    objc_msgSend(v6, "setFittingSize:", v8, v9);

    bannerImageView = self->_bannerImageView;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __48__VideosExtrasBannerController__configureBanner__block_invoke;
    v11[3] = &unk_1E9FA0530;
    v11[4] = self;
    objc_msgSend(v6, "setDestination:configurationBlock:", bannerImageView, v11);

  }
}

void __48__VideosExtrasBannerController__configureBanner__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "size");
    v9 = v8 / v7;
    v10 = v7 <= 0.0;
    v11 = 1.0;
    if (!v10)
      v11 = v9;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), 8, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), 7, v11, 0.0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 64);
    *(_QWORD *)(v13 + 64) = v12;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setActive:", 1);
    objc_msgSend(v15, "setImage:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setActive:", 0);
  }

}

- (void)_doAllSetup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIImageView *v9;
  UIImageView *bannerImageView;
  double v11;
  double v12;
  UIImageView *v13;
  UIImageView *vignetteImageView;
  void *v15;
  UIImageView *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  NSArray *v28;
  void *v29;
  void *v30;
  NSArray *installedConstraints;
  NSArray *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];

  v38[4] = *MEMORY[0x1E0C80C00];
  if (self->_installedConstraints)
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
  -[UIImageView superview](self->_bannerImageView, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[UIImageView removeFromSuperview](self->_bannerImageView, "removeFromSuperview");
  -[UIImageView superview](self->_vignetteImageView, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[UIImageView removeFromSuperview](self->_vignetteImageView, "removeFromSuperview");
  -[UIView superview](self->_maskView, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[UIView removeFromSuperview](self->_maskView, "removeFromSuperview");
  -[VideosExtrasBannerController trackingScrollView](self, "trackingScrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasBannerController installedView](self, "installedView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasBannerController maskView](self, "maskView");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initForAutolayout");
  bannerImageView = self->_bannerImageView;
  self->_bannerImageView = v9;

  LODWORD(v11) = 1132068864;
  -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_bannerImageView, "setContentCompressionResistancePriority:forAxis:", 0, v11);
  LODWORD(v12) = 1132068864;
  -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_bannerImageView, "setContentCompressionResistancePriority:forAxis:", 1, v12);
  -[UIImageView setUserInteractionEnabled:](self->_bannerImageView, "setUserInteractionEnabled:", 0);
  v13 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initForAutolayout");
  vignetteImageView = self->_vignetteImageView;
  self->_vignetteImageView = v13;

  -[VideosExtrasBannerController _updateVignetteImage](self, "_updateVignetteImage");
  objc_msgSend(v6, "superview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = self->_bannerImageView;
  if (v15 == v7)
    objc_msgSend(v7, "insertSubview:belowSubview:", v16, v6);
  else
    objc_msgSend(v7, "addSubview:", v16);
  objc_msgSend(v7, "insertSubview:aboveSubview:", self->_vignetteImageView, self->_bannerImageView);
  objc_msgSend(v7, "insertSubview:aboveSubview:", v8, self->_vignetteImageView);
  -[UIImageView topAnchor](self->_bannerImageView, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v18 = v6;
  v37 = v6;
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_bannerImageView, 3, -1, v7, 3, 1.0, 0.0);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x1E0DC49E8];
  v22 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v23 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v24 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", self->_bannerImageView, v18, 10, *MEMORY[0x1E0DC49E8], v22, v23, v24);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", self->_vignetteImageView, self->_bannerImageView, 11, v21, v22, v23, v24);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_vignetteImageView, 8, 0, v7, 8, 1.0, 0.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 3, 0, self->_vignetteImageView, 4, 1.0, 0.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", v8, v7, 14, v21, v22, v23, v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObjectsFromArray:](v28, "addObjectsFromArray:", v34);
  -[NSArray addObjectsFromArray:](v28, "addObjectsFromArray:", v33);
  -[NSArray addObjectsFromArray:](v28, "addObjectsFromArray:", v27);
  v38[0] = v20;
  v38[1] = v25;
  v29 = (void *)v20;
  v38[2] = v36;
  v38[3] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObjectsFromArray:](v28, "addObjectsFromArray:", v30);

  installedConstraints = self->_installedConstraints;
  self->_installedConstraints = v28;
  v32 = v28;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v32);
  -[VideosExtrasBannerController _configureBanner](self, "_configureBanner");

}

- (void)installBannerOnView:(id)a3 anchoredToScrollView:(id)a4
{
  UIScrollView **p_trackingScrollView;
  id v7;

  p_trackingScrollView = &self->_trackingScrollView;
  v7 = a3;
  objc_storeWeak((id *)p_trackingScrollView, a4);
  objc_storeWeak((id *)&self->_installedView, v7);

  -[VideosExtrasBannerController _doAllSetup](self, "_doAllSetup");
}

- (void)setVignetteType:(unint64_t)a3
{
  if (self->_vignetteType != a3)
  {
    self->_vignetteType = a3;
    -[VideosExtrasBannerController _updateVignetteImage](self, "_updateVignetteImage");
  }
}

- (void)_updateVignetteImage
{
  id v3;

  +[VideosExtrasBackgroundViewController vignetteImageForType:](VideosExtrasBackgroundViewController, "vignetteImageForType:", self->_vignetteType);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_vignetteImageView, "setImage:", v3);

}

- (IKDocumentBannerElement)bannerElement
{
  return self->_bannerElement;
}

- (unint64_t)vignetteType
{
  return self->_vignetteType;
}

- (UIView)installedView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_installedView);
}

- (void)setInstalledView:(id)a3
{
  objc_storeWeak((id *)&self->_installedView, a3);
}

- (UIScrollView)trackingScrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_trackingScrollView);
}

- (void)setTrackingScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_trackingScrollView, a3);
}

- (NSArray)installedConstraints
{
  return self->_installedConstraints;
}

- (void)setInstalledConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_installedConstraints, a3);
}

- (UIImageView)bannerImageView
{
  return self->_bannerImageView;
}

- (void)setBannerImageView:(id)a3
{
  objc_storeStrong((id *)&self->_bannerImageView, a3);
}

- (UIImageView)vignetteImageView
{
  return self->_vignetteImageView;
}

- (void)setVignetteImageView:(id)a3
{
  objc_storeStrong((id *)&self->_vignetteImageView, a3);
}

- (NSLayoutConstraint)bannerImageViewHeightConstraint
{
  return self->_bannerImageViewHeightConstraint;
}

- (void)setBannerImageViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bannerImageViewHeightConstraint, a3);
}

- (UIView)maskView
{
  return self->_maskView;
}

- (void)setMaskView:(id)a3
{
  objc_storeStrong((id *)&self->_maskView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_bannerImageViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_vignetteImageView, 0);
  objc_storeStrong((id *)&self->_bannerImageView, 0);
  objc_storeStrong((id *)&self->_installedConstraints, 0);
  objc_destroyWeak((id *)&self->_trackingScrollView);
  objc_destroyWeak((id *)&self->_installedView);
  objc_storeStrong((id *)&self->_bannerElement, 0);
}

@end
