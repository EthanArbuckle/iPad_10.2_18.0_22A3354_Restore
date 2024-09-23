@implementation PXCMMPosterHeaderView

- (PXCMMPosterHeaderView)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPosterHeaderView.m"), 48, CFSTR("%s is not available as initializer"), "-[PXCMMPosterHeaderView init]");

  abort();
}

- (PXCMMPosterHeaderView)initWithFrame:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPosterHeaderView.m"), 52, CFSTR("%s is not available as initializer"), "-[PXCMMPosterHeaderView initWithFrame:]");

  abort();
}

- (PXCMMPosterHeaderView)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPosterHeaderView.m"), 56, CFSTR("%s is not available as initializer"), "-[PXCMMPosterHeaderView initWithCoder:]");

  abort();
}

- (PXCMMPosterHeaderView)initWithPresentationStyle:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  PXCMMPosterHeaderView *v8;
  PXCMMPosterHeaderView *v9;
  PXCMMPosterHeaderViewSpec *v10;
  PXCMMPosterHeaderViewSpec *spec;
  PXCMMImageView *v12;
  PXCMMImageView *imageView;
  PXGradientView *v14;
  PXGradientView *topGradientView;
  void *v16;
  void *v17;
  void *v18;
  PXGradientView *v19;
  PXGradientView *bottomGradientView;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  UILabel *titleLabel;
  void *v26;
  uint64_t v27;
  UILabel *subtitleLabel;
  void *v29;
  uint64_t v30;
  UILabel *statusLabel;
  void *v32;
  uint64_t v33;
  UIImageView *statusCheckmark;
  void *v35;
  void *v36;
  void *v37;
  PXCMMPosterHeaderViewModel *v38;
  objc_super v40;
  _QWORD v41[2];
  _QWORD v42[3];

  v42[2] = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)PXCMMPosterHeaderView;
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = -[PXCMMPosterHeaderView initWithFrame:](&v40, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->_presentationStyle = a3;
    v10 = -[PXCMMPosterHeaderViewSpec initWithPresentationStyle:]([PXCMMPosterHeaderViewSpec alloc], "initWithPresentationStyle:", v8->_presentationStyle);
    spec = v9->_spec;
    v9->_spec = v10;

    v12 = -[PXCMMImageView initWithFrame:]([PXCMMImageView alloc], "initWithFrame:", v4, v5, v6, v7);
    imageView = v9->_imageView;
    v9->_imageView = v12;

    -[PXCMMImageView setAutoresizingMask:](v9->_imageView, "setAutoresizingMask:", 18);
    -[PXCMMPosterHeaderView addSubview:](v9, "addSubview:", v9->_imageView);
    v14 = -[PXGradientView initWithFrame:]([PXGradientView alloc], "initWithFrame:", v4, v5, v6, v7);
    topGradientView = v9->_topGradientView;
    v9->_topGradientView = v14;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v16;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGradientView setColors:](v9->_topGradientView, "setColors:", v18);

    -[PXCMMPosterHeaderView addSubview:](v9, "addSubview:", v9->_topGradientView);
    v19 = -[PXGradientView initWithFrame:]([PXGradientView alloc], "initWithFrame:", v4, v5, v6, v7);
    bottomGradientView = v9->_bottomGradientView;
    v9->_bottomGradientView = v19;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v21;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGradientView setColors:](v9->_bottomGradientView, "setColors:", v23);

    -[PXCMMPosterHeaderView addSubview:](v9, "addSubview:", v9->_bottomGradientView);
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
    titleLabel = v9->_titleLabel;
    v9->_titleLabel = (UILabel *)v24;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9->_titleLabel, "setTextColor:", v26);

    -[UILabel setNumberOfLines:](v9->_titleLabel, "setNumberOfLines:", 2);
    -[PXCMMPosterHeaderView addSubview:](v9, "addSubview:", v9->_titleLabel);
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
    subtitleLabel = v9->_subtitleLabel;
    v9->_subtitleLabel = (UILabel *)v27;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9->_subtitleLabel, "setTextColor:", v29);

    -[PXCMMPosterHeaderView addSubview:](v9, "addSubview:", v9->_subtitleLabel);
    if (-[PXCMMPosterHeaderViewSpec canShowStatus](v9->_spec, "canShowStatus"))
    {
      v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
      statusLabel = v9->_statusLabel;
      v9->_statusLabel = (UILabel *)v30;

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v9->_statusLabel, "setTextColor:", v32);

      -[PXCMMPosterHeaderView addSubview:](v9, "addSubview:", v9->_statusLabel);
      v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v4, v5, v6, v7);
      statusCheckmark = v9->_statusCheckmark;
      v9->_statusCheckmark = (UIImageView *)v33;

      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](v9->_statusCheckmark, "setImage:", v35);
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setTintColor:](v9->_statusCheckmark, "setTintColor:", v36);

      -[PXCMMPosterHeaderView addSubview:](v9, "addSubview:", v9->_statusCheckmark);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObserver:selector:name:object:", v9, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

    -[PXCMMPosterHeaderView _updateFonts](v9, "_updateFonts");
    v38 = objc_alloc_init(PXCMMPosterHeaderViewModel);
    -[PXCMMPosterHeaderView setViewModel:](v9, "setViewModel:", v38);

    -[PXCMMPosterHeaderView setAccessibilityIgnoresInvertColors:](v9, "setAccessibilityIgnoresInvertColors:", 1);
  }
  return v9;
}

- (void)setViewModel:(id)a3
{
  PXCMMPosterHeaderViewModel **p_viewModel;
  PXCMMPosterHeaderViewModel *v7;
  PXCMMPosterHeaderViewModel *v8;
  char v9;
  void *v10;
  PXCMMPosterHeaderViewModel *v11;

  v11 = (PXCMMPosterHeaderViewModel *)a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPosterHeaderView.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewModel"));

  }
  p_viewModel = &self->_viewModel;
  v7 = self->_viewModel;
  if (v7 == v11)
  {

  }
  else
  {
    v8 = v11;
    v9 = -[PXCMMPosterHeaderViewModel isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
      -[PXCMMPosterHeaderViewModel unregisterChangeObserver:context:](*p_viewModel, "unregisterChangeObserver:context:", self, PXCMMPosterHeaderViewModelObservationContext);
      objc_storeStrong((id *)&self->_viewModel, a3);
      -[PXCMMPosterHeaderViewModel registerChangeObserver:context:](*p_viewModel, "registerChangeObserver:context:", self, PXCMMPosterHeaderViewModelObservationContext);
      -[PXCMMPosterHeaderView _updateTitle](self, "_updateTitle");
      -[PXCMMPosterHeaderView _updateSubtitle](self, "_updateSubtitle");
      -[PXCMMPosterHeaderView _updateStatusString](self, "_updateStatusString");
    }
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXCMMPosterHeaderView;
  -[PXCMMPosterHeaderView layoutSubviews](&v5, sel_layoutSubviews);
  -[PXCMMPosterHeaderView bounds](self, "bounds");
  -[PXCMMPosterHeaderView _performLayoutWithSize:](self, "_performLayoutWithSize:", v3, v4);
}

- (void)_performLayoutWithSize:(CGSize)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  CGFloat v16;
  double Width;
  double v18;
  CGFloat v19;
  double MaxY;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  CGFloat v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double MinX;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  CGFloat v70;
  double v71;
  double v72;
  CGFloat v73;
  double v74;
  double rect;
  double recta;
  double rect_8;
  double rect_16;
  double rect_24a;
  double rect_24;
  double v81;
  double v82;
  double v83;
  CGFloat v84;
  CGFloat x;
  CGFloat v86;
  double v87;
  CGFloat v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v95;
  double v96;
  double v97;
  double v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;

  PXEdgeInsetsInsetRect();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  rect = *MEMORY[0x1E0C9D648];
  v97 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v95 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v96 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[PXCMMPosterHeaderViewSpec scaledTitleBaselineOffset](self->_spec, "scaledTitleBaselineOffset");
  v13 = v12 + 0.0;
  -[UILabel font](self->_titleLabel, "font");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ascender");
  v16 = v13 - v15;

  v99.origin.x = v5;
  v99.origin.y = v7;
  v99.size.width = v9;
  v99.size.height = v11;
  Width = CGRectGetWidth(v99);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", Width, 1.79769313e308);
  v19 = v18;
  v100.origin.x = v5;
  v100.origin.y = v7;
  v100.size.width = v9;
  v100.size.height = v11;
  v101.origin.x = CGRectGetMinX(v100);
  x = v101.origin.x;
  v86 = v19;
  v87 = Width;
  v88 = v16;
  v101.origin.y = v16;
  v101.size.width = Width;
  v101.size.height = v19;
  MaxY = CGRectGetMaxY(v101);
  -[UILabel font](self->_titleLabel, "font");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "descender");
  v23 = MaxY + v22;

  -[PXCMMPosterHeaderViewSpec scaledSubtitleBaselineOffset](self->_spec, "scaledSubtitleBaselineOffset");
  v25 = v23 + v24;
  -[UILabel font](self->_subtitleLabel, "font");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "ascender");
  v28 = v25 - v27;

  v102.origin.x = v5;
  v102.origin.y = v7;
  v102.size.width = v9;
  v102.size.height = v11;
  v29 = CGRectGetWidth(v102);
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v29, 1.79769313e308);
  v31 = v30;
  v103.origin.x = v5;
  v103.origin.y = v7;
  v103.size.width = v9;
  v103.size.height = v11;
  v104.origin.x = CGRectGetMinX(v103);
  v90 = v104.origin.x;
  v104.origin.y = v28;
  v104.size.width = v29;
  v104.size.height = v31;
  v84 = CGRectGetMaxY(v104);
  -[UILabel font](self->_subtitleLabel, "font");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "descender");
  v83 = v33;

  -[PXCMMPosterHeaderViewSpec scaledTopGradientBaselineOffset](self->_spec, "scaledTopGradientBaselineOffset");
  v82 = v34;
  v105.origin.x = 0.0;
  v105.origin.y = 0.0;
  v105.size = a3;
  v89 = CGRectGetWidth(v105);
  v92 = v29;
  v93 = v28;
  v91 = v31;
  if (!-[PXCMMPosterHeaderViewSpec canShowStatus](self->_spec, "canShowStatus"))
  {
    v58 = v95;
    v35 = v96;
    rect_24 = v95;
    v81 = v96;
LABEL_8:
    v59 = v97;
    v60 = rect;
    v61 = rect;
    v46 = v35;
    v62 = v58;
    rect_8 = v97;
    rect_16 = rect;
    v64 = v87;
    v63 = v88;
    v65 = x;
    v66 = v86;
    v68 = v83;
    v67 = v84;
    v69 = v82;
    goto LABEL_13;
  }
  v35 = v96;
  -[UILabel text](self->_statusLabel, "text");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "length");

  if (!v37)
  {
    rect_24 = v95;
    v81 = v96;
    v58 = v95;
    goto LABEL_8;
  }
  -[PXCMMPosterHeaderViewSpec scaledStatusBaselineOffset](self->_spec, "scaledStatusBaselineOffset");
  rect_24a = v38;
  v106.origin.x = v5;
  v106.origin.y = v7;
  v106.size.width = v9;
  v106.size.height = v11;
  v39 = CGRectGetWidth(v106);
  -[UILabel sizeThatFits:](self->_statusLabel, "sizeThatFits:", v39, 1.79769313e308);
  v41 = v40;
  -[UILabel font](self->_statusLabel, "font");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "descender");
  v44 = fabs(v43);

  v107.origin.x = v5;
  v107.origin.y = v7;
  v107.size.width = v9;
  v107.size.height = v11;
  MinX = CGRectGetMinX(v107);
  v108.origin.x = v5;
  v108.origin.y = v7;
  v108.size.width = v9;
  v108.size.height = v11;
  v46 = v41;
  v47 = v44 + CGRectGetMaxY(v108) - rect_24a - v41;
  if (-[PXCMMPosterHeaderViewModel showStatusCheckmark](self->_viewModel, "showStatusCheckmark"))
  {
    rect = MinX;
    v98 = v46;
    -[UILabel font](self->_statusLabel, "font");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "ascender");
    v50 = v49;

    -[UIImageView image](self->_statusCheckmark, "image");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "size");

    PXSizeGetAspectRatio();
    v53 = v39;
    v54 = ceil(v50 * v52);
    v55 = v53 - (v54 + 4.0);
    v95 = v54;
    v96 = v50;
    if (-[PXCMMPosterHeaderView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"))
    {
      v56 = MinX;
      v57 = v47;
      rect = MinX + v55 + 4.0;
    }
    else
    {
      v109.origin.x = MinX;
      v109.origin.y = v47;
      v109.size.width = v54;
      v109.size.height = v50;
      v56 = CGRectGetMaxX(v109) + 4.0;
      v57 = v47;
    }
    v70 = a3.width;
    v39 = v55;
    v46 = v98;
  }
  else
  {
    v56 = MinX;
    v57 = v97;
    v70 = a3.width;
  }
  rect_8 = v57;
  rect_24 = v95;
  v81 = v96;
  -[PXCMMPosterHeaderViewSpec scaledBottomGradientBaselineOffset](self->_spec, "scaledBottomGradientBaselineOffset", *(_QWORD *)&rect);
  v72 = v71;
  rect_16 = v56;
  v110.origin.x = v56;
  v110.origin.y = v47;
  v110.size.width = v39;
  v110.size.height = v46;
  v59 = v47;
  v73 = CGRectGetMinY(v110) - v72;
  v111.origin.x = 0.0;
  v111.origin.y = 0.0;
  v111.size.width = v70;
  v111.size.height = a3.height;
  v62 = v39;
  v58 = CGRectGetWidth(v111);
  v112.origin.x = 0.0;
  v112.origin.y = 0.0;
  v112.size.width = v70;
  v112.size.height = a3.height;
  v97 = v73;
  v35 = CGRectGetHeight(v112) - v73;
  v60 = 0.0;
  v64 = v87;
  v63 = v88;
  v65 = x;
  v66 = v86;
  v68 = v83;
  v67 = v84;
  v69 = v82;
  v61 = recta;
LABEL_13:
  v74 = v67 + v68 + v69;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v65, v63, v64, v66);
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v90, v93, v92, v91);
  -[PXGradientView setFrame:](self->_topGradientView, "setFrame:", 0.0, 0.0, v89, v74);
  -[UILabel setFrame:](self->_statusLabel, "setFrame:", rect_16, v59, v62, v46);
  -[UIImageView setFrame:](self->_statusCheckmark, "setFrame:", v61, rect_8, rect_24, v81);
  -[PXGradientView setFrame:](self->_bottomGradientView, "setFrame:", v60, v97, v58, v35);
}

- (void)_updateTitle
{
  void *v3;

  -[PXCMMPosterHeaderViewModel title](self->_viewModel, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v3);

  -[PXCMMPosterHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateSubtitle
{
  void *v3;

  -[PXCMMPosterHeaderViewModel subtitle](self->_viewModel, "subtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_subtitleLabel, "setText:", v3);

  -[PXCMMPosterHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateStatusString
{
  void *v3;

  -[PXCMMPosterHeaderViewModel statusString](self->_viewModel, "statusString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_statusLabel, "setText:", v3);

  -[PXCMMPosterHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXCMMPosterHeaderViewSpec preferredTitleFont](self->_spec, "preferredTitleFont");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:");
  -[PXCMMPosterHeaderViewSpec preferredSubtitleFont](self->_spec, "preferredSubtitleFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v3);
  if (-[PXCMMPosterHeaderViewSpec canShowStatus](self->_spec, "canShowStatus"))
  {
    -[PXCMMPosterHeaderViewSpec preferredStatusFont](self->_spec, "preferredStatusFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_statusLabel, "setFont:", v4);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setSymbolConfiguration:](self->_statusCheckmark, "setSymbolConfiguration:", v5);

  }
  -[PXCMMPosterHeaderView setNeedsLayout](self, "setNeedsLayout");

}

- (id)test_title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (id)test_subtitle
{
  return -[UILabel text](self->_subtitleLabel, "text");
}

- (id)test_statusString
{
  return -[UILabel text](self->_statusLabel, "text");
}

- (BOOL)test_showStatusCheckmark
{
  CGRect v3;

  -[UIImageView frame](self->_statusCheckmark, "frame");
  return !CGRectEqualToRect(v3, *MEMORY[0x1E0C9D648]);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;
  void *v9;
  _QWORD v10[5];

  v6 = a4;
  v8 = a3;
  if ((void *)PXCMMPosterHeaderViewModelObservationContext != a5)
    goto LABEL_9;
  if ((v6 & 1) != 0)
  {
    -[PXCMMPosterHeaderView _updateTitle](self, "_updateTitle");
    if ((v6 & 2) == 0)
    {
LABEL_4:
      if ((v6 & 4) == 0)
        goto LABEL_5;
      goto LABEL_12;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_4;
  }
  -[PXCMMPosterHeaderView _updateSubtitle](self, "_updateSubtitle");
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_12:
  -[PXCMMPosterHeaderView _updateStatusString](self, "_updateStatusString");
  if ((v6 & 8) != 0)
LABEL_6:
    -[PXCMMPosterHeaderView setNeedsLayout](self, "setNeedsLayout");
LABEL_7:
  if ((v6 & 0x70) != 0)
  {
    -[PXCMMImageView viewModel](self->_imageView, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__PXCMMPosterHeaderView_observable_didChange_context___block_invoke;
    v10[3] = &unk_1E5124DF8;
    v10[4] = self;
    objc_msgSend(v9, "performChanges:", v10);

  }
LABEL_9:

}

- (PXCMMPosterHeaderViewModel)viewModel
{
  return self->_viewModel;
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_statusCheckmark, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_bottomGradientView, 0);
  objc_storeStrong((id *)&self->_topGradientView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

void __54__PXCMMPosterHeaderView_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 480);
  v6 = a2;
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAsset:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "mediaProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMediaProvider:", v5);

  objc_msgSend(v6, "setHighlighted:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "isHighlighted"));
}

+ (double)preferredHeightForWidth:(double)a3 traitCollection:(id)a4 screen:(id)a5
{
  id v7;
  double v8;
  CGRect v10;

  v7 = a5;
  objc_msgSend(a4, "displayScale");
  v10.size.height = 1.79769313e308;
  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  v10.size.width = a3;
  +[PXPhotosDetailsHeaderTileWidget preferredHeaderContentHeightForWidth:screen:](PXPhotosDetailsHeaderTileWidget, "preferredHeaderContentHeightForWidth:screen:", v7, CGRectGetWidth(v10));

  PXSizeRoundToPixel();
  return v8;
}

+ (void)preheatSharedValuesForPresentationStyle:(int64_t)a3
{
  id *v3;
  dispatch_once_t *v4;
  _QWORD *v5;
  _QWORD v6[4];
  void *v7;
  _QWORD v8[4];
  void *v9;

  if (!a3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__PXCMMPosterHeaderView_preheatSharedValuesForPresentationStyle___block_invoke_3;
    v6[3] = &unk_1E5148A40;
    v3 = &v7;
    v7 = &__block_literal_global_92501;
    if (preheatSharedValuesForPresentationStyle__onceToken_24 == -1)
    {
LABEL_6:

      return;
    }
    v4 = &preheatSharedValuesForPresentationStyle__onceToken_24;
    v5 = v6;
LABEL_10:
    dispatch_once(v4, v5);
    goto LABEL_6;
  }
  if (a3 == 1)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__PXCMMPosterHeaderView_preheatSharedValuesForPresentationStyle___block_invoke_2;
    v8[3] = &unk_1E5148A40;
    v3 = &v9;
    v9 = &__block_literal_global_92501;
    if (preheatSharedValuesForPresentationStyle__onceToken == -1)
      goto LABEL_6;
    v4 = &preheatSharedValuesForPresentationStyle__onceToken;
    v5 = v8;
    goto LABEL_10;
  }
}

void __65__PXCMMPosterHeaderView_preheatSharedValuesForPresentationStyle___block_invoke_2(uint64_t a1)
{
  PXCMMPosterHeaderViewSpec *v2;

  v2 = -[PXCMMPosterHeaderViewSpec initWithPresentationStyle:]([PXCMMPosterHeaderViewSpec alloc], "initWithPresentationStyle:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __65__PXCMMPosterHeaderView_preheatSharedValuesForPresentationStyle___block_invoke_3(uint64_t a1)
{
  PXCMMPosterHeaderViewSpec *v2;

  v2 = -[PXCMMPosterHeaderViewSpec initWithPresentationStyle:]([PXCMMPosterHeaderViewSpec alloc], "initWithPresentationStyle:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __65__PXCMMPosterHeaderView_preheatSharedValuesForPresentationStyle___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "scaledTitleBaselineOffset");
  objc_msgSend(v2, "scaledSubtitleBaselineOffset");
  objc_msgSend(v2, "scaledTopGradientBaselineOffset");
  objc_msgSend(v2, "scaledStatusBaselineOffset");
  objc_msgSend(v2, "scaledBottomGradientBaselineOffset");

}

@end
