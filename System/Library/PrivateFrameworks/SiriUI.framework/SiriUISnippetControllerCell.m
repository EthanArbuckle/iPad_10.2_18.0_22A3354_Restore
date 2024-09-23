@implementation SiriUISnippetControllerCell

+ (CGRect)contentBoundsForCollectionViewCellBounds:(CGRect)a3 snippetViewController:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  if ((objc_msgSend(v8, "usePlatterStyle") & 1) != 0
    || objc_msgSend(v8, "_hasConfirmationOrCancelledInsets"))
  {
    UIRectInset();
    x = v9;
    y = v10;
    width = v11;
    height = v12;
  }

  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (SiriUISnippetControllerCell)initWithFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  double v24;
  uint64_t v25;
  void *v26;
  void *v27;
  objc_super v29;
  CGRect v30;
  CGRect v31;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v29.receiver = self;
  v29.super_class = (Class)SiriUISnippetControllerCell;
  v7 = -[SiriUISnippetControllerCell initWithFrame:](&v29, sel_initWithFrame_);
  if (v7)
  {
    +[SiriUIKeyline keyline](SiriUIKeyline, "keyline");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v7 + 81);
    *((_QWORD *)v7 + 81) = v8;

    +[SiriUIContentButton button](SiriUIContentButton, "button");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v7 + 82);
    *((_QWORD *)v7 + 82) = v10;

    objc_msgSend(*((id *)v7 + 82), "addTarget:action:forControlEvents:", v7, sel__snippetPunchOutButtonTapped_, 64);
    *(_OWORD *)(v7 + 760) = SiriUIDefaultSnippetViewInsets;
    *(_OWORD *)(v7 + 776) = *(_OWORD *)&qword_217698188;
    objc_msgSend(v7, "setPreservesSuperviewLayoutMargins:", 1);
    objc_msgSend(v7, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPreservesSuperviewLayoutMargins:", 1);

    objc_msgSend(MEMORY[0x24BEA6270], "labelWithHeaderFont");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v7 + 87);
    *((_QWORD *)v7 + 87) = v13;

    v15 = (void *)*((_QWORD *)v7 + 87);
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_textColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextColor:", v16);

    v17 = (void *)*((_QWORD *)v7 + 87);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "siriUILocalizedStringForKey:", CFSTR("CANCELED"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v19);

    v20 = objc_alloc(MEMORY[0x24BDF6F90]);
    v21 = objc_msgSend(v20, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v22 = (void *)*((_QWORD *)v7 + 86);
    *((_QWORD *)v7 + 86) = v21;

    v23 = objc_alloc(MEMORY[0x24BDF6F90]);
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    v24 = CGRectGetWidth(v30);
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    v25 = objc_msgSend(v23, "initWithFrame:", 0.0, 0.0, v24, CGRectGetHeight(v31));
    v26 = (void *)*((_QWORD *)v7 + 85);
    *((_QWORD *)v7 + 85) = v25;

    objc_msgSend(v7, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", *((_QWORD *)v7 + 85));

  }
  return (SiriUISnippetControllerCell *)v7;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriUISnippetControllerCell;
  -[SiriUISnippetControllerCell prepareForReuse](&v4, sel_prepareForReuse);
  -[SiriUISnippetControllerCell snippetViewController](self, "snippetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContainingView:", 0);
  -[UILabel removeFromSuperview](self->_cancelledLabel, "removeFromSuperview");
  -[SiriUIContentButton removeFromSuperview](self->_snippetPunchOutButton, "removeFromSuperview");
  -[SiriUIKeyline removeFromSuperview](self->_bottomKeyline, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_cancelledTouchPreventionView, "removeFromSuperview");
  -[SiriUIKeyline setAlpha:](self->_bottomKeyline, "setAlpha:", 1.0);
  self->_topPadding = 0.0;
  -[SiriUISnippetControllerCell setSnippetViewController:](self, "setSnippetViewController:", 0);

}

- (id)accessibilityIdentifier
{
  return CFSTR("SiriUISnippetControllerCellAccessibilityIdentifier");
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[UIView recursive_setSemanticContentAttribute:](self, "recursive_setSemanticContentAttribute:", SiriLanguageSemanticContentAttribute());
  v6.receiver = self;
  v6.super_class = (Class)SiriUISnippetControllerCell;
  -[SiriUISnippetControllerCell layoutSubviews](&v6, sel_layoutSubviews);
  -[SiriUISnippetControllerCell snippetViewController](self, "snippetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siriWillLayoutSnippetView");

  -[SiriUISnippetControllerCell _configureSubviewsForCurrentInset](self, "_configureSubviewsForCurrentInset");
  -[SiriUISnippetControllerCell snippetViewController](self, "snippetViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cellDidLayoutSubviews");

  -[SiriUISnippetControllerCell snippetViewController](self, "snippetViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriDidLayoutSnippetView");

}

- (void)_configureSubviewsForCurrentInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double Height;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  CGFloat v61;
  double v62;
  double v63;
  double v64;
  CGFloat v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double MaxY;
  CGFloat v73;
  double x;
  double y;
  double v76;
  double v77;
  double v78;
  double width;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;

  -[SiriUISnippetControllerCell bounds](self, "bounds");
  UIRectInset();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SiriUISnippetControllerCell snippetViewController](self, "snippetViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "_hasConfirmationButtons") & 1) != 0)
  {
    -[SiriUISnippetControllerCell snippetViewController](self, "snippetViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "_willAnimateConfirmation"))
    {

LABEL_6:
      -[SiriUISnippetControllerCell snippetViewController](self, "snippetViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_msgSend(v15, "footerViewClass"), "defaultHeight");
      v17 = v16;

      v76 = v17;
      v10 = v10 + v17;
      goto LABEL_8;
    }
    -[SiriUISnippetControllerCell snippetViewController](self, "snippetViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "_willAnimateCancellation");

    if (v14)
      goto LABEL_6;
  }
  else
  {

  }
  -[SiriUISnippetControllerCell _heightForFooterView](self, "_heightForFooterView");
  v76 = v18;
LABEL_8:
  v19 = (void *)objc_opt_class();
  -[SiriUISnippetControllerCell snippetViewController](self, "snippetViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "contentBoundsForCollectionViewCellBounds:snippetViewController:", v20, v4, v6, v8, v10);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  -[SiriUISnippetControllerCell _heightForTransparentHeaderView](self, "_heightForTransparentHeaderView");
  v30 = v29;
  -[SiriUIReusableView setFrame:](self->_transparentHeaderView, "setFrame:", v22, v24, v26, v29);
  -[SiriUISnippetControllerCell _heightForTransparentFooterView](self, "_heightForTransparentFooterView");
  v32 = v31;
  v80.origin.x = v22;
  v80.origin.y = v24;
  v80.size.width = v26;
  v80.size.height = v28;
  Height = CGRectGetHeight(v80);
  v81.origin.x = v22;
  v81.origin.y = v24;
  v81.size.width = v26;
  v81.size.height = v32;
  v34 = Height - CGRectGetHeight(v81);
  -[SiriUIReusableView setFrame:](self->_transparentFooterView, "setFrame:", v22, v34, v26, v32);
  v82.origin.x = v22;
  v82.origin.y = v24;
  v82.size.width = v26;
  v82.size.height = v30;
  CGRectGetHeight(v82);
  v83.origin.x = v22;
  v83.origin.y = v34;
  v83.size.width = v26;
  v83.size.height = v32;
  CGRectGetHeight(v83);
  UIRectInset();
  -[UIView setFrame:](self->_clippingContainerView, "setFrame:");
  -[UIView bounds](self->_clippingContainerView, "bounds");
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  -[UIView setFrame:](self->_snippetBackgroundView, "setFrame:");
  -[UIView setFrame:](self->_cancelledTouchPreventionView, "setFrame:", v36, v38, v40, v42);
  -[SiriUISnippetControllerCell _heightForHeaderView](self, "_heightForHeaderView");
  v44 = v43;
  -[SiriUIReusableView setFrame:](self->_headerView, "setFrame:", v36, v38, v40, v43);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SiriUIReusableView edgeInsets](self->_footerView, "edgeInsets");
    v46 = v36 + v45;
    v48 = v38 + v47;
    v50 = v40 - (v45 + v49);
  }
  else
  {
    v46 = v36;
    v48 = v38;
    v50 = v40;
  }
  v84.origin.x = v36;
  v84.origin.y = v38;
  v84.size.width = v40;
  v84.size.height = v42;
  v78 = v42;
  v51 = CGRectGetHeight(v84);
  v85.origin.x = v46;
  v85.origin.y = v48;
  v85.size.width = v50;
  v85.size.height = v76;
  v52 = v51 - CGRectGetHeight(v85);
  -[SiriUIReusableView setFrame:](self->_footerView, "setFrame:", v46, v52, v50, v76);
  v86.origin.x = v36;
  v86.origin.y = v38;
  v86.size.width = v40;
  v86.size.height = v44;
  v73 = v38 + CGRectGetHeight(v86);
  v87.origin.x = v36;
  v87.origin.y = v38;
  v87.size.width = v40;
  v87.size.height = v44;
  v53 = CGRectGetHeight(v87);
  v54 = v46;
  v55 = v44;
  v56 = v53;
  v88.origin.x = v54;
  v88.origin.y = v52;
  v88.size.width = v50;
  v88.size.height = v76;
  v57 = v78 - (v56 + CGRectGetHeight(v88));
  v89.origin.x = v36;
  v89.origin.y = v38;
  v89.size.width = v40;
  v89.size.height = v55;
  v93.origin.x = v36;
  v93.origin.y = v73;
  v93.size.width = v40;
  v93.size.height = v57;
  v90 = CGRectUnion(v89, v93);
  x = v90.origin.x;
  y = v90.origin.y;
  v77 = v90.size.height;
  width = v90.size.width;
  -[SiriUISnippetControllerCell _snippetEdgeInsets](self, "_snippetEdgeInsets");
  v59 = v36 + v58;
  v61 = v73 + v60;
  v63 = v40 - (v58 + v62);
  v65 = v57 - (v60 + v64);
  -[SiriUISnippetControllerCell snippetViewController](self, "snippetViewController");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "view");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setFrame:", v59, v61, v63, v65);

  -[SiriUIKeyline sizeThatFits:](self->_bottomKeyline, "sizeThatFits:", v40, v57);
  v69 = v68;
  v71 = v70;
  v91.origin.x = v36;
  v91.origin.y = v73;
  v91.size.width = v40;
  v91.size.height = v57;
  MaxY = CGRectGetMaxY(v91);
  v92.origin.x = v36;
  v92.origin.y = v73;
  v92.size.width = v69;
  v92.size.height = v71;
  -[SiriUIKeyline setFrame:](self->_bottomKeyline, "setFrame:", v36, MaxY - CGRectGetHeight(v92), v69, v71);
  -[SiriUIContentButton setFrame:](self->_snippetPunchOutButton, "setFrame:", x, y, width, v77);
  -[UILabel sizeThatFits:](self->_cancelledLabel, "sizeThatFits:", width, v77);
  UIRectCenteredIntegralRect();
  -[UILabel setFrame:](self->_cancelledLabel, "setFrame:");
}

- (double)_heightForHeaderView
{
  void *v3;
  char v4;
  void *v5;
  double v6;
  double v7;
  double result;

  -[SiriUISnippetControllerCell snippetViewController](self, "snippetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SiriUISnippetControllerCell snippetViewController](self, "snippetViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "desiredHeightForHeaderView");
    v7 = v6;

    return v7;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "defaultHeight");
  }
  return result;
}

- (double)_heightForFooterView
{
  void *v3;
  char v4;
  void *v5;
  double v6;
  double v7;
  double result;

  -[SiriUISnippetControllerCell snippetViewController](self, "snippetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SiriUISnippetControllerCell snippetViewController](self, "snippetViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "desiredHeightForFooterView");
    v7 = v6;

    return v7;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "defaultHeight");
  }
  return result;
}

- (double)_heightForTransparentHeaderView
{
  void *v3;
  char v4;
  void *v5;
  double v6;
  double v7;
  double result;

  -[SiriUISnippetControllerCell snippetViewController](self, "snippetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SiriUISnippetControllerCell snippetViewController](self, "snippetViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "desiredHeightForTransparentHeaderView");
    v7 = v6;

    return v7;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "defaultHeight");
  }
  return result;
}

- (double)_heightForTransparentFooterView
{
  void *v3;
  char v4;
  void *v5;
  double v6;
  double v7;
  double result;

  -[SiriUISnippetControllerCell snippetViewController](self, "snippetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SiriUISnippetControllerCell snippetViewController](self, "snippetViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "desiredHeightForTransparentFooterView");
    v7 = v6;

    return v7;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "defaultHeight");
  }
  return result;
}

- (void)setSnippetViewController:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  int v12;
  SiriUIKeyline *bottomKeyline;
  void *v14;
  UIView *snippetBackgroundView;
  id v16;
  UIView *v17;
  UIView *v18;
  BOOL v19;
  UIView *v20;
  UIView *materialView;
  void *v22;
  void *v23;
  UIView *v24;
  void *v25;
  void *v26;
  UIView *clippingContainerView;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  char v44;
  void *v45;
  _QWORD *v46;
  id v47;
  id v48;
  char v49;
  id v50;
  int v51;
  id obj;
  _QWORD v53[5];
  _QWORD v54[5];

  obj = a3;
  -[SiriUISnippetControllerCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_snippetViewController);
  objc_msgSend(WeakRetained, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isDescendantOfView:", v4))
  {
    v7 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

  }
  v9 = objc_storeWeak((id *)&self->_snippetViewController, obj);

  if (obj)
  {
    v10 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    objc_msgSend(v10, "setContainingView:", self);

    v11 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    v12 = objc_msgSend(v11, "usePlatterStyle");

    if (v12)
    {
      bottomKeyline = self->_bottomKeyline;
      objc_msgSend(MEMORY[0x24BDF6950], "siriui_platterKeylineColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriUIKeyline setCustomBackgroundColor:](bottomKeyline, "setCustomBackgroundColor:", v14);

    }
    snippetBackgroundView = self->_snippetBackgroundView;
    if (!snippetBackgroundView || self->_cellIsUsingPlatterStyle != v12)
    {
      -[UIView removeFromSuperview](snippetBackgroundView, "removeFromSuperview");
      v16 = objc_alloc(MEMORY[0x24BDF6F90]);
      v17 = (UIView *)objc_msgSend(v16, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      v18 = self->_snippetBackgroundView;
      self->_snippetBackgroundView = v17;

      if (v12)
      {
        v19 = 1;
        objc_msgSend(MEMORY[0x24BE64060], "materialViewWithRecipe:configuration:", 9, 1);
        v20 = (UIView *)objc_claimAutoreleasedReturnValue();
        materialView = self->_materialView;
        self->_materialView = v20;

        -[UIView setAutoresizingMask:](self->_materialView, "setAutoresizingMask:", 18);
        -[UIView addSubview:](self->_snippetBackgroundView, "addSubview:", self->_materialView);
        -[UIView layer](self->_clippingContainerView, "layer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setCornerRadius:", 15.0);

        -[UIView layer](self->_clippingContainerView, "layer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setMasksToBounds:", 1);
      }
      else
      {
        v24 = self->_snippetBackgroundView;
        objc_msgSend(MEMORY[0x24BDF6950], "siriui_snippetBackgroundColor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v24, "setBackgroundColor:", v25);

        -[UIView layer](self->_clippingContainerView, "layer");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setCornerRadius:", 0.0);

        -[UIView layer](self->_clippingContainerView, "layer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setMasksToBounds:", 0);
        v19 = 0;
      }

      self->_cellIsUsingPlatterStyle = v19;
      -[UIView addSubview:](self->_clippingContainerView, "addSubview:", self->_snippetBackgroundView);
      -[UIView sendSubviewToBack:](self->_clippingContainerView, "sendSubviewToBack:", self->_snippetBackgroundView);
    }
    clippingContainerView = self->_clippingContainerView;
    v28 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    objc_msgSend(v28, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](clippingContainerView, "addSubview:", v29);

    v30 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    objc_msgSend(v30, "_headerView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUISnippetControllerCell _setHeaderView:](self, "_setHeaderView:", v31);

    v32 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    objc_msgSend(v32, "_footerView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUISnippetControllerCell _setFooterView:](self, "_setFooterView:", v33);

    v34 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    objc_msgSend(v34, "_transparentHeaderView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUISnippetControllerCell _setTransparentHeaderView:](self, "_setTransparentHeaderView:", v35);

    v36 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    objc_msgSend(v36, "_transparentFooterView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUISnippetControllerCell _setTransparentFooterView:](self, "_setTransparentFooterView:", v37);

    v38 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    objc_msgSend(v38, "defaultViewInsets");
    -[SiriUISnippetControllerCell _setSnippetEdgeInsets:](self, "_setSnippetEdgeInsets:");

    v39 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    LODWORD(v37) = objc_msgSend(v39, "isTransparent");

    if ((_DWORD)v37)
    {
      -[UIView removeFromSuperview](self->_snippetBackgroundView, "removeFromSuperview");
    }
    else
    {
      -[UIView addSubview:](self->_clippingContainerView, "addSubview:", self->_snippetBackgroundView);
      -[UIView sendSubviewToBack:](self->_clippingContainerView, "sendSubviewToBack:", self->_snippetBackgroundView);
    }
    v40 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    objc_msgSend(v40, "snippetPunchOut");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      -[UIView addSubview:](self->_clippingContainerView, "addSubview:", self->_snippetPunchOutButton);
      -[UIView bringSubviewToFront:](self->_clippingContainerView, "bringSubviewToFront:", self->_snippetPunchOutButton);
    }
    v42 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    if ((objc_msgSend(v42, "isCancelled") & 1) != 0)
    {
      v43 = objc_loadWeakRetained((id *)&self->_snippetViewController);
      v44 = objc_msgSend(v43, "_willAnimateCancellation");

      if ((v44 & 1) == 0)
      {
        v45 = (void *)MEMORY[0x24BDF6F90];
        v54[0] = MEMORY[0x24BDAC760];
        v54[1] = 3221225472;
        v54[2] = __56__SiriUISnippetControllerCell_setSnippetViewController___block_invoke;
        v54[3] = &unk_24D7D91F8;
        v54[4] = self;
        v46 = v54;
        goto LABEL_24;
      }
    }
    else
    {

    }
    v47 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    if ((objc_msgSend(v47, "isConfirmed") & 1) == 0)
    {

      goto LABEL_26;
    }
    v48 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    v49 = objc_msgSend(v48, "_willAnimateConfirmation");

    if ((v49 & 1) != 0)
    {
LABEL_26:
      v50 = objc_loadWeakRetained((id *)&self->_snippetViewController);
      v51 = objc_msgSend(v50, "_hasConfirmationButtons");

      if (v51)
        -[UIView addSubview:](self->_clippingContainerView, "addSubview:", self->_bottomKeyline);
      -[SiriUISnippetControllerCell setNeedsLayout](self, "setNeedsLayout");
      goto LABEL_29;
    }
    v45 = (void *)MEMORY[0x24BDF6F90];
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __56__SiriUISnippetControllerCell_setSnippetViewController___block_invoke_2;
    v53[3] = &unk_24D7D91F8;
    v53[4] = self;
    v46 = v53;
LABEL_24:
    objc_msgSend(v45, "performWithoutAnimation:", v46);
    goto LABEL_26;
  }
LABEL_29:

}

uint64_t __56__SiriUISnippetControllerCell_setSnippetViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animateSnippetCancellationWithCompletion:", 0);
}

uint64_t __56__SiriUISnippetControllerCell_setSnippetViewController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animateSnippetConfirmationWithCompletion:", 0);
}

- (void)_setHeaderView:(id)a3
{
  id v5;

  v5 = a3;
  -[SiriUIReusableView removeFromSuperview](self->_headerView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_headerView, a3);
  if (self->_headerView)
    -[UIView addSubview:](self->_clippingContainerView, "addSubview:");

}

- (void)_setFooterView:(id)a3
{
  id v5;

  v5 = a3;
  -[SiriUIReusableView removeFromSuperview](self->_footerView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_footerView, a3);
  if (self->_footerView)
    -[UIView addSubview:](self->_clippingContainerView, "addSubview:");

}

- (void)_setTransparentHeaderView:(id)a3
{
  SiriUIReusableView **p_transparentHeaderView;
  void *v6;
  id v7;

  v7 = a3;
  p_transparentHeaderView = &self->_transparentHeaderView;
  -[SiriUIReusableView removeFromSuperview](self->_transparentHeaderView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_transparentHeaderView, a3);
  if (self->_transparentHeaderView)
  {
    -[SiriUISnippetControllerCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", *p_transparentHeaderView);

  }
}

- (void)_setTransparentFooterView:(id)a3
{
  SiriUIReusableView **p_transparentFooterView;
  void *v6;
  id v7;

  v7 = a3;
  p_transparentFooterView = &self->_transparentFooterView;
  -[SiriUIReusableView removeFromSuperview](self->_transparentFooterView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_transparentFooterView, a3);
  if (self->_transparentFooterView)
  {
    -[SiriUISnippetControllerCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", *p_transparentFooterView);

  }
}

- (void)animateSnippetCancellationWithCompletion:(id)a3
{
  UIView *clippingContainerView;
  UIView *cancelledTouchPreventionView;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  CGFloat Height;
  _QWORD v24[13];
  __int128 v25;
  uint64_t v26;
  double v27;
  CGRect v28;

  clippingContainerView = self->_clippingContainerView;
  cancelledTouchPreventionView = self->_cancelledTouchPreventionView;
  v6 = a3;
  -[UIView addSubview:](clippingContainerView, "addSubview:", cancelledTouchPreventionView);
  -[UIView bringSubviewToFront:](self->_clippingContainerView, "bringSubviewToFront:", self->_cancelledTouchPreventionView);
  -[UIView addSubview:](self->_clippingContainerView, "addSubview:", self->_cancelledLabel);
  -[UIView bringSubviewToFront:](self->_clippingContainerView, "bringSubviewToFront:", self->_cancelledLabel);
  -[UILabel setAlpha:](self->_cancelledLabel, "setAlpha:", 0.0);
  -[SiriUIReusableView frame](self->_footerView, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[UIView frame](self->_clippingContainerView, "frame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v28.origin.x = v8;
  v28.origin.y = v10;
  v28.size.width = v12;
  v28.size.height = v14;
  Height = CGRectGetHeight(v28);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __72__SiriUISnippetControllerCell_animateSnippetCancellationWithCompletion___block_invoke;
  v24[3] = &unk_24D7D9898;
  v24[4] = self;
  *(CGFloat *)&v24[5] = v8;
  *(CGFloat *)&v24[6] = v10;
  *(CGFloat *)&v24[7] = v12;
  v24[8] = 0;
  v24[9] = v16;
  v24[10] = v18;
  v24[11] = v20;
  *(double *)&v24[12] = v22 - Height;
  v25 = *MEMORY[0x24BDBEFB0];
  v26 = v20;
  v27 = v22 - Height;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v24, v6, 0.3);

}

uint64_t __72__SiriUISnippetControllerCell_animateSnippetCancellationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 728), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 680), "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 664), "setFrame:", *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
  objc_msgSend(*(id *)(a1 + 32), "snippetViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.08);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 728), "setAlpha:", 0.08);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 720), "setAlpha:", 0.08);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 648), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 696), "setAlpha:", 1.0);
}

- (void)animateSnippetConfirmationWithCompletion:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id WeakRetained;
  double v14;
  double v15;
  id v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double MaxY;
  double v27;
  _QWORD v28[17];
  CGRect v29;

  v4 = a3;
  -[SiriUISnippetControllerCell _heightForFooterView](self, "_heightForFooterView");
  v6 = v5;
  -[UIView frame](self->_clippingContainerView, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  WeakRetained = objc_loadWeakRetained((id *)&self->_snippetViewController);
  objc_msgSend(WeakRetained, "desiredHeight");
  v15 = v14;
  v16 = objc_loadWeakRetained((id *)&self->_snippetViewController);
  objc_msgSend(v16, "desiredHeightForHeaderView");
  v18 = v6 + v15 + v17;
  v19 = v6;

  -[SiriUIReusableView frame](self->_footerView, "frame");
  v21 = v20;
  v23 = v22;
  v27 = v22;
  v29.origin.x = v8;
  v29.origin.y = v10;
  v29.size.width = v12;
  v29.size.height = v18;
  MaxY = CGRectGetMaxY(v29);
  v24 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v25 = *MEMORY[0x24BDBEFB0];
  -[SiriUIReusableView setFrame:](self->_footerView, "setFrame:", v21, MaxY, v23, v19);
  -[UIView setFrame:](self->_clippingContainerView, "setFrame:", v8, v10, v12, v18);
  -[UIView setFrame:](self->_snippetBackgroundView, "setFrame:", v25, v24, v12, v18);
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __72__SiriUISnippetControllerCell_animateSnippetConfirmationWithCompletion___block_invoke;
  v28[3] = &unk_24D7D9898;
  v28[4] = self;
  *(double *)&v28[5] = v21;
  *(double *)&v28[6] = MaxY;
  *(double *)&v28[7] = v27;
  v28[8] = 0;
  *(double *)&v28[9] = v8;
  *(double *)&v28[10] = v10;
  *(double *)&v28[11] = v12;
  *(double *)&v28[12] = v18 - v19;
  *(double *)&v28[13] = v25;
  *(double *)&v28[14] = v24;
  *(double *)&v28[15] = v12;
  *(double *)&v28[16] = v18 - v19;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v28, v4, 0.3);

}

uint64_t __72__SiriUISnippetControllerCell_animateSnippetConfirmationWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 728), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 680), "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 664), "setFrame:", *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 648), "setAlpha:", 0.0);
}

- (void)animateSnippetResizeToSize:(CGSize)a3 completion:(id)a4
{
  double height;
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  id WeakRetained;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[21];
  CGRect v27;
  CGRect v28;
  CGRect v29;

  height = a3.height;
  v6 = a4;
  -[SiriUISnippetControllerCell _heightForFooterView](self, "_heightForFooterView");
  v8 = v7;
  -[UIView frame](self->_clippingContainerView, "frame");
  v24 = v10;
  v25 = v9;
  v12 = v11;
  v13 = *MEMORY[0x24BDBEFB0];
  v14 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  -[SiriUIReusableView frame](self->_footerView, "frame");
  v22 = v15;
  v23 = v16;
  v27.origin.x = v13;
  v27.origin.y = v14;
  v27.size.width = v12;
  v27.size.height = height;
  v17 = CGRectGetMaxY(v27) - v8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_snippetViewController);
  objc_msgSend(WeakRetained, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  v20 = CGRectGetHeight(v28);

  v29.origin.x = v13;
  v29.origin.y = v14;
  v29.size.width = v12;
  v29.size.height = height - v8;
  v21 = v20 - CGRectGetHeight(v29);
  if (v21 < 0.0)
    v21 = -v21;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __69__SiriUISnippetControllerCell_animateSnippetResizeToSize_completion___block_invoke;
  v26[3] = &unk_24D7D98C0;
  v26[4] = self;
  v26[5] = v22;
  *(double *)&v26[6] = v17;
  v26[7] = v23;
  *(double *)&v26[8] = v8;
  v26[9] = v25;
  v26[10] = v24;
  *(CGFloat *)&v26[11] = v12;
  *(double *)&v26[12] = height;
  *(CGFloat *)&v26[13] = v13;
  *(CGFloat *)&v26[14] = v14;
  *(CGFloat *)&v26[15] = v12;
  *(double *)&v26[16] = height;
  *(CGFloat *)&v26[17] = v13;
  *(CGFloat *)&v26[18] = v14;
  *(CGFloat *)&v26[19] = v12;
  *(double *)&v26[20] = height - v8;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v26, v6, fmin(v21 * 0.00005 + 0.2, 0.4), 0.0, 1.0, 0.5);

}

void __69__SiriUISnippetControllerCell_animateSnippetResizeToSize_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 728), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 680), "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 664), "setFrame:", *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 752));
  objc_msgSend(WeakRetained, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160));

}

- (void)_snippetPunchOutButtonTapped:(id)a3
{
  id v3;

  -[SiriUISnippetControllerCell snippetViewController](self, "snippetViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_snippetPunchOutButtonTapped");

}

+ (id)reuseIdentifier
{
  objc_class *v2;
  void *v3;
  void *v4;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("ReuseIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (double)defaultHeight
{
  return 0.0;
}

+ (id)elementKind
{
  return 0;
}

- (void)setShowBackgroundView:(BOOL)a3
{
  if (a3)
  {
    -[UIView addSubview:](self->_clippingContainerView, "addSubview:", self->_snippetBackgroundView);
    -[UIView sendSubviewToBack:](self->_clippingContainerView, "sendSubviewToBack:", self->_snippetBackgroundView);
  }
  else
  {
    -[UIView removeFromSuperview](self->_snippetBackgroundView, "removeFromSuperview");
  }
}

- (void)setTopPadding:(double)a3
{
  self->_topPadding = a3;
  -[SiriUISnippetControllerCell setNeedsLayout](self, "setNeedsLayout");
}

- (SiriUISnippetViewController)snippetViewController
{
  return (SiriUISnippetViewController *)objc_loadWeakRetained((id *)&self->_snippetViewController);
}

- (UIEdgeInsets)_snippetEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_snippetEdgeInsets.top;
  left = self->_snippetEdgeInsets.left;
  bottom = self->_snippetEdgeInsets.bottom;
  right = self->_snippetEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_setSnippetEdgeInsets:(UIEdgeInsets)a3
{
  self->_snippetEdgeInsets = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_snippetViewController);
  objc_storeStrong((id *)&self->_transparentFooterView, 0);
  objc_storeStrong((id *)&self->_transparentHeaderView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_cancelledLabel, 0);
  objc_storeStrong((id *)&self->_cancelledTouchPreventionView, 0);
  objc_storeStrong((id *)&self->_clippingContainerView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_snippetBackgroundView, 0);
  objc_storeStrong((id *)&self->_snippetPunchOutButton, 0);
  objc_storeStrong((id *)&self->_bottomKeyline, 0);
}

@end
