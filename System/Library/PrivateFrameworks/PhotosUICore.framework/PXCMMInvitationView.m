@implementation PXCMMInvitationView

- (PXCMMInvitationView)initWithFrame:(CGRect)a3
{
  PXCMMInvitationView *v3;
  PXCMMPosterHeaderView *v4;
  PXCMMPosterHeaderView *headerView;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  UILabel *titleLabel;
  uint64_t v13;
  UILabel *subtitle1Label;
  uint64_t v15;
  UILabel *subtitle2Label;
  PXRoundedCornerOverlayView *v17;
  uint64_t v18;
  PXRoundedCornerOverlayView *roundedCornerOverlayView;
  PXRoundedCornerOverlayView *v20;
  PXCMMInvitationView *v21;
  void *v22;
  _QWORD v24[4];
  PXCMMInvitationView *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PXCMMInvitationView;
  v3 = -[PXCMMInvitationView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[PXCMMPosterHeaderView initWithPresentationStyle:]([PXCMMPosterHeaderView alloc], "initWithPresentationStyle:", 1);
    headerView = v3->_headerView;
    v3->_headerView = v4;

    -[PXCMMInvitationView addSubview:](v3, "addSubview:", v3->_headerView);
    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v11;

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 2);
    -[PXCMMInvitationView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    subtitle1Label = v3->_subtitle1Label;
    v3->_subtitle1Label = (UILabel *)v13;

    -[PXCMMInvitationView addSubview:](v3, "addSubview:", v3->_subtitle1Label);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    subtitle2Label = v3->_subtitle2Label;
    v3->_subtitle2Label = (UILabel *)v15;

    -[PXCMMInvitationView addSubview:](v3, "addSubview:", v3->_subtitle2Label);
    v17 = [PXRoundedCornerOverlayView alloc];
    -[PXCMMInvitationView bounds](v3, "bounds");
    v18 = -[PXRoundedCornerOverlayView initWithFrame:](v17, "initWithFrame:");
    roundedCornerOverlayView = v3->_roundedCornerOverlayView;
    v3->_roundedCornerOverlayView = (PXRoundedCornerOverlayView *)v18;

    v20 = v3->_roundedCornerOverlayView;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __37__PXCMMInvitationView_initWithFrame___block_invoke;
    v24[3] = &unk_1E51406D0;
    v21 = v3;
    v25 = v21;
    -[PXRoundedCornerOverlayView performChanges:](v20, "performChanges:", v24);
    -[PXCMMInvitationView addSubview:](v21, "addSubview:", v3->_roundedCornerOverlayView);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v21, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v3;
}

- (void)setViewModel:(id)a3
{
  PXCMMInvitationViewModel **p_viewModel;
  PXCMMInvitationViewModel *v7;
  PXCMMInvitationViewModel *v8;
  char v9;
  void *v10;
  PXCMMInvitationViewModel *v11;

  v11 = (PXCMMInvitationViewModel *)a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationView.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewModel"));

  }
  p_viewModel = &self->_viewModel;
  v7 = self->_viewModel;
  if (v7 == v11)
  {

  }
  else
  {
    v8 = v11;
    v9 = -[PXCMMInvitationViewModel isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
      -[PXCMMInvitationViewModel unregisterChangeObserver:context:](*p_viewModel, "unregisterChangeObserver:context:", self, PXCMMInvitationViewModelObservationContext);
      objc_storeStrong((id *)&self->_viewModel, a3);
      -[PXCMMInvitationViewModel registerChangeObserver:context:](*p_viewModel, "registerChangeObserver:context:", self, PXCMMInvitationViewModelObservationContext);
      -[PXCMMInvitationView _updateHeaderView](self, "_updateHeaderView");
      -[PXCMMInvitationView _updateTitle](self, "_updateTitle");
      -[PXCMMInvitationView _updateSubtitle1](self, "_updateSubtitle1");
      -[PXCMMInvitationView _updateSubtitle2](self, "_updateSubtitle2");
      -[PXCMMInvitationView _updateOpaqueAncestorBackgroundColor](self, "_updateOpaqueAncestorBackgroundColor");
      -[PXCMMInvitationView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (CGRect)headerViewBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[PXCMMPosterHeaderView bounds](self->_headerView, "bounds");
  -[PXCMMPosterHeaderView convertRect:toCoordinateSpace:](self->_headerView, "convertRect:toCoordinateSpace:", self);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (UIView)previewView
{
  return (UIView *)self->_headerView;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PXCMMInvitationView _performLayoutInWidth:updateSubviewFrames:](self, "_performLayoutInWidth:updateSubviewFrames:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCMMInvitationView;
  -[PXCMMInvitationView layoutSubviews](&v4, sel_layoutSubviews);
  -[PXCMMInvitationView bounds](self, "bounds");
  -[PXCMMInvitationView _performLayoutInWidth:updateSubviewFrames:](self, "_performLayoutInWidth:updateSubviewFrames:", 1, v3);
}

- (id)focusEffect
{
  void *v3;
  void *v4;

  -[PXRoundedCornerOverlayView focusInfo](self->_roundedCornerOverlayView, "focusInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeHaloEffectForSourceView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGSize)_performLayoutInWidth:(double)a3 updateSubviewFrames:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat MinX;
  double v15;
  double MaxY;
  void *v17;
  void *v18;
  void *v19;
  UILabel *titleLabel;
  BOOL v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  NSString *v46;
  BOOL IsAccessibilityCategory;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double y;
  double v64;
  double x;
  double v66;
  double v67;
  CGSize result;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  v4 = a4;
  -[PXCMMInvitationView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  if (v8 == 0.0)
    v9 = 1.0;
  else
    v9 = v8;

  objc_msgSend((id)objc_opt_class(), "posterHeaderViewSizeForSize:scale:", a3, 1.79769313e308, v9);
  v11 = v10;
  v13 = v12;
  v69.origin.x = 0.0;
  v69.origin.y = 0.0;
  v69.size.width = a3;
  v69.size.height = 1.79769313e308;
  MinX = CGRectGetMinX(v69);
  v70.origin.x = 0.0;
  v70.origin.y = 0.0;
  v70.size.width = a3;
  v70.size.height = 1.79769313e308;
  v71.origin.y = CGRectGetMinY(v70);
  v15 = MinX;
  v71.origin.x = MinX;
  y = v71.origin.y;
  v67 = v11;
  v71.size.width = v11;
  v60 = v13;
  v71.size.height = v13;
  MaxY = CGRectGetMaxY(v71);
  +[PXCMMInvitationView spec](PXCMMInvitationView, "spec");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "titleFont");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMInvitationViewModel attributedTitle](self->_viewModel, "attributedTitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  titleLabel = self->_titleLabel;
  if (v19)
    v21 = !v4;
  else
    v21 = 1;
  if (v21)
  {
    v22 = -[UILabel numberOfLines](titleLabel, "numberOfLines");
    objc_msgSend(v18, "lineHeight");
    v24 = v23;
    objc_msgSend(v18, "leading");
    v27 = v25 * (double)(v22 - 1) + v24 * (double)v22;
  }
  else
  {
    -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:", a3, 1.79769313e308);
    v27 = v26;
  }
  objc_msgSend(v17, "titleTextStyle");
  PXScaledValueForTextStyleWithSymbolicTraits();
  v29 = MaxY + v28;
  objc_msgSend(v18, "ascender");
  v31 = v29 - v30;
  v72.origin.x = 0.0;
  v72.origin.y = 0.0;
  v72.size.width = a3;
  v72.size.height = 1.79769313e308;
  v73.origin.x = CGRectGetMinX(v72);
  x = v73.origin.x;
  v66 = v31;
  v73.origin.y = v31;
  v73.size.width = a3;
  v73.size.height = v27;
  v32 = CGRectGetMaxY(v73);
  objc_msgSend(v18, "descender");
  v34 = v33;

  objc_msgSend(v17, "subtitle1Font");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "lineHeight");
  v37 = v36;
  objc_msgSend(v17, "subtitle1TextStyle");
  PXScaledValueForTextStyleWithSymbolicTraits();
  v39 = v32 + v34 + v38;
  objc_msgSend(v35, "ascender");
  v41 = v39 - v40;
  v74.origin.x = 0.0;
  v74.origin.y = 0.0;
  v74.size.width = a3;
  v74.size.height = 1.79769313e308;
  v75.origin.x = CGRectGetMinX(v74);
  v62 = v75.origin.x;
  v75.origin.y = v41;
  v75.size.width = a3;
  v64 = v37;
  v75.size.height = v37;
  v42 = CGRectGetMaxY(v75);
  objc_msgSend(v35, "descender");
  v44 = v43;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "preferredContentSizeCategory");
  v46 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v46);

  if (IsAccessibilityCategory)
  {
    v49 = *MEMORY[0x1E0C9D648];
    v48 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v50 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v61 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    if (!v4)
      goto LABEL_15;
    goto LABEL_14;
  }
  objc_msgSend(v17, "subtitle2Font");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "lineHeight");
  v53 = v52;
  objc_msgSend(v17, "subtitle2TextStyle");
  PXScaledValueForTextStyleWithSymbolicTraits();
  v55 = v42 + v44 + v54;
  objc_msgSend(v51, "ascender");
  v48 = v55 - v56;
  v76.origin.x = 0.0;
  v76.origin.y = 0.0;
  v76.size.width = a3;
  v76.size.height = 1.79769313e308;
  v77.origin.x = CGRectGetMinX(v76);
  v49 = v77.origin.x;
  v77.origin.y = v48;
  v77.size.width = a3;
  v61 = v53;
  v77.size.height = v53;
  v42 = CGRectGetMaxY(v77);

  v50 = a3;
  if (v4)
  {
LABEL_14:
    v59 = v50;
    -[PXCMMPosterHeaderView setFrame:](self->_headerView, "setFrame:", v15, y, v67, v60);
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", x, v66, a3, v27);
    -[UILabel setFrame:](self->_subtitle1Label, "setFrame:", v62, v41, a3, v64);
    -[UILabel setFrame:](self->_subtitle2Label, "setFrame:", v49, v48, v59, v61);
    -[PXRoundedCornerOverlayView setFrame:](self->_roundedCornerOverlayView, "setFrame:", v15, y, v67, v60);
  }
LABEL_15:

  v57 = a3;
  v58 = v42;
  result.height = v58;
  result.width = v57;
  return result;
}

- (void)_updateHeaderView
{
  void *v3;
  _QWORD v4[5];

  -[PXCMMPosterHeaderView viewModel](self->_headerView, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__PXCMMInvitationView__updateHeaderView__block_invoke;
  v4[3] = &unk_1E513D060;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (BOOL)_updateTitle
{
  id v3;
  id v4;
  char v5;
  BOOL v6;

  -[UILabel attributedText](self->_titleLabel, "attributedText");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXCMMInvitationViewModel attributedTitle](self->_viewModel, "attributedTitle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 == v4)
  {

    goto LABEL_5;
  }
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) != 0)
  {
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", v4);
  -[PXCMMInvitationView setNeedsLayout](self, "setNeedsLayout");
  v6 = 1;
LABEL_6:

  return v6;
}

- (BOOL)_updateSubtitle1
{
  id v3;
  id v4;
  char v5;
  BOOL v6;

  -[UILabel attributedText](self->_subtitle1Label, "attributedText");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXCMMInvitationViewModel attributedSubtitle1](self->_viewModel, "attributedSubtitle1");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 == v4)
  {

    goto LABEL_5;
  }
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) != 0)
  {
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  -[UILabel setAttributedText:](self->_subtitle1Label, "setAttributedText:", v4);
  -[PXCMMInvitationView setNeedsLayout](self, "setNeedsLayout");
  v6 = 1;
LABEL_6:

  return v6;
}

- (BOOL)_updateSubtitle2
{
  id v3;
  id v4;
  char v5;
  BOOL v6;

  -[UILabel attributedText](self->_subtitle2Label, "attributedText");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXCMMInvitationViewModel attributedSubtitle2](self->_viewModel, "attributedSubtitle2");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 == v4)
  {

    goto LABEL_5;
  }
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) != 0)
  {
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  -[UILabel setAttributedText:](self->_subtitle2Label, "setAttributedText:", v4);
  -[PXCMMInvitationView setNeedsLayout](self, "setNeedsLayout");
  v6 = 1;
LABEL_6:

  return v6;
}

- (void)_updateOpaqueAncestorBackgroundColor
{
  PXRoundedCornerOverlayView *roundedCornerOverlayView;
  _QWORD v3[5];

  roundedCornerOverlayView = self->_roundedCornerOverlayView;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__PXCMMInvitationView__updateOpaqueAncestorBackgroundColor__block_invoke;
  v3[3] = &unk_1E51406D0;
  v3[4] = self;
  -[PXRoundedCornerOverlayView performChanges:](roundedCornerOverlayView, "performChanges:", v3);
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[PXCMMInvitationView _updateTitle](self, "_updateTitle", a3);
  -[PXCMMInvitationView _updateSubtitle1](self, "_updateSubtitle1");
  -[PXCMMInvitationView _updateSubtitle2](self, "_updateSubtitle2");
  -[PXCMMInvitationView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[PXCMMInvitationView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invitationViewSizeThatFitsDidChange:", self);

  }
}

- (id)test_title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (id)test_subtitle1
{
  return -[UILabel text](self->_subtitle1Label, "text");
}

- (id)test_subtitle2
{
  return -[UILabel text](self->_subtitle2Label, "text");
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  int v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v6 = a4;
  v12 = a3;
  if ((void *)PXCMMInvitationViewModelObservationContext != a5)
    goto LABEL_17;
  if ((v6 & 0x21E) != 0)
    -[PXCMMInvitationView _updateHeaderView](self, "_updateHeaderView");
  if ((v6 & 0x20) != 0)
  {
    v8 = -[PXCMMInvitationView _updateTitle](self, "_updateTitle");
    if ((v6 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  v8 = 0;
  if ((v6 & 0x40) != 0)
LABEL_8:
    v8 |= -[PXCMMInvitationView _updateSubtitle1](self, "_updateSubtitle1");
LABEL_9:
  if ((v6 & 0x80) == 0)
  {
    if ((v6 & 0x100) == 0)
      goto LABEL_11;
LABEL_14:
    -[PXCMMInvitationView _updateOpaqueAncestorBackgroundColor](self, "_updateOpaqueAncestorBackgroundColor");
    if (!v8)
      goto LABEL_17;
    goto LABEL_15;
  }
  v8 |= -[PXCMMInvitationView _updateSubtitle2](self, "_updateSubtitle2");
  if ((v6 & 0x100) != 0)
    goto LABEL_14;
LABEL_11:
  if (!v8)
    goto LABEL_17;
LABEL_15:
  -[PXCMMInvitationView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[PXCMMInvitationView delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invitationViewSizeThatFitsDidChange:", self);

  }
LABEL_17:

}

- (PXCMMInvitationViewDelegate)delegate
{
  return (PXCMMInvitationViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXCMMInvitationViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_roundedCornerOverlayView, 0);
  objc_storeStrong((id *)&self->_subtitle2Label, 0);
  objc_storeStrong((id *)&self->_subtitle1Label, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

void __59__PXCMMInvitationView__updateOpaqueAncestorBackgroundColor__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 696);
  v3 = a2;
  objc_msgSend(v2, "opaqueAncestorBackgroundColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOverlayColor:", v4);

}

void __40__PXCMMInvitationView__updateHeaderView__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 696);
  v8 = a2;
  objc_msgSend(v3, "posterTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 696), "posterSubtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSubtitle:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 696), "posterAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAsset:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 696), "posterMediaProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMediaProvider:", v7);

  objc_msgSend(v8, "setHighlighted:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 696), "isHighlighted"));
}

void __37__PXCMMInvitationView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "setCornerRadius:", 4.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOverlayColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v4);

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  if (v6 == 0.0)
    v6 = 1.0;
  objc_msgSend(v7, "setDisplayScale:", v6);

  objc_msgSend(v7, "setCornersToRound:", -1);
}

+ (PXCMMInvitationSpec)spec
{
  return (PXCMMInvitationSpec *)+[PXCMMInvitationSpec specForLayoutVariant:](PXCMMInvitationSpec, "specForLayoutVariant:", 0);
}

+ (CGSize)sizeThatFits:(CGSize)a3 viewModel:(id)a4
{
  double height;
  double width;
  uint64_t v6;
  id v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = sizeThatFits_viewModel__predicate;
  v7 = a4;
  if (v6 != -1)
    dispatch_once(&sizeThatFits_viewModel__predicate, &__block_literal_global_245380);
  objc_msgSend((id)sizeThatFits_viewModel__view_245381, "setViewModel:", v7);

  objc_msgSend((id)sizeThatFits_viewModel__view_245381, "sizeThatFits:", width, height);
  result.height = v9;
  result.width = v8;
  return result;
}

+ (CGSize)posterImageSizeThatFits:(CGSize)a3 scale:(double)a4
{
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(a1, "posterHeaderViewSizeForSize:scale:", a3.width, a3.height);
  PXSizeScale();
  PXSizeRound();
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)posterHeaderViewSizeForSize:(CGSize)a3 scale:(double)a4
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  +[PXCMMInvitationView spec](PXCMMInvitationView, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aspectRatio");
  PXSizeRoundToPixel();
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

void __46__PXCMMInvitationView_sizeThatFits_viewModel___block_invoke()
{
  PXCMMInvitationView *v0;
  void *v1;

  v0 = objc_alloc_init(PXCMMInvitationView);
  v1 = (void *)sizeThatFits_viewModel__view_245381;
  sizeThatFits_viewModel__view_245381 = (uint64_t)v0;

}

@end
