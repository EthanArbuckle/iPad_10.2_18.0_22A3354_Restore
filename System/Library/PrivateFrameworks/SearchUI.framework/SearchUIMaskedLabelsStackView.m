@implementation SearchUIMaskedLabelsStackView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SearchUIMaskedLabelsStackView)init
{
  SearchUIMaskedLabelsStackView *v2;
  SearchUIMaskedLabelsStackView *v3;
  uint64_t v4;
  TLKLabel *completionLabel;
  uint64_t v6;
  TLKLabel *bridgeLabel;
  uint64_t v8;
  TLKLabel *extensionLabel;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v35;
  _QWORD v36[5];

  v36[4] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)SearchUIMaskedLabelsStackView;
  v2 = -[SearchUIMaskedLabelsStackView init](&v35, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SearchUIMaskedLabelsStackView setDelegate:](v2, "setDelegate:", v2);
    -[NUIContainerStackView setSpacing:](v3, "setSpacing:", 0.0);
    objc_msgSend(MEMORY[0x1E0DBD9A8], "primaryLabel");
    v4 = objc_claimAutoreleasedReturnValue();
    completionLabel = v3->_completionLabel;
    v3->_completionLabel = (TLKLabel *)v4;

    -[TLKLabel setLineBreakMode:](v3->_completionLabel, "setLineBreakMode:", 2);
    objc_msgSend(MEMORY[0x1E0DBD9A8], "secondaryLabel");
    v6 = objc_claimAutoreleasedReturnValue();
    bridgeLabel = v3->_bridgeLabel;
    v3->_bridgeLabel = (TLKLabel *)v6;

    -[TLKLabel setLineBreakMode:](v3->_bridgeLabel, "setLineBreakMode:", 2);
    objc_msgSend(MEMORY[0x1E0DBD9A8], "secondaryLabel");
    v8 = objc_claimAutoreleasedReturnValue();
    extensionLabel = v3->_extensionLabel;
    v3->_extensionLabel = (TLKLabel *)v8;

    -[TLKLabel setLineBreakMode:](v3->_extensionLabel, "setLineBreakMode:", 2);
    -[SearchUIMaskedLabelsStackView bridgeLabel](v3, "bridgeLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 1148846080;
    objc_msgSend(v10, "setContentHuggingPriority:forAxis:", 0, v11);

    -[SearchUIMaskedLabelsStackView completionLabel](v3, "completionLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = 1148829696;
    objc_msgSend(v12, "setContentHuggingPriority:forAxis:", 0, v13);

    -[SearchUIMaskedLabelsStackView completionLabel](v3, "completionLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = 1148846080;
    objc_msgSend(v14, "setContentCompressionResistancePriority:forAxis:", 0, v15);

    -[SearchUIMaskedLabelsStackView extensionLabel](v3, "extensionLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = 1148829696;
    objc_msgSend(v16, "setContentHuggingPriority:forAxis:", 0, v17);

    -[SearchUIMaskedLabelsStackView extensionLabel](v3, "extensionLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = 1132068864;
    objc_msgSend(v18, "setContentCompressionResistancePriority:forAxis:", 0, v19);

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD9D0]), "initWithProminence:", 3);
    -[SearchUIMaskedLabelsStackView setExtensionLabelBackgroundView:](v3, "setExtensionLabelBackgroundView:", v20);
    -[SearchUIMaskedLabelsStackView extensionLabelBackgroundView](v3, "extensionLabelBackgroundView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "tlks_setCornerRadius:withStyle:", *MEMORY[0x1E0CD2A68], 2.0);

    -[SearchUIMaskedLabelsStackView extensionLabelBackgroundView](v3, "extensionLabelBackgroundView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIMaskedLabelsStackView addSubview:](v3, "addSubview:", v22);

    -[NUIContainerStackView setSpacing:](v3, "setSpacing:", 0.0);
    v23 = (void *)objc_opt_new();
    -[SearchUIMaskedLabelsStackView setGradientView:](v3, "setGradientView:", v23);

    v24 = (void *)objc_opt_new();
    -[SearchUIMaskedLabelsStackView setFillerView:](v3, "setFillerView:", v24);

    -[SearchUIMaskedLabelsStackView fillerView](v3, "fillerView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = 1.0;
    objc_msgSend(v25, "setContentCompressionResistancePriority:forAxis:", 0, v26);

    -[SearchUIMaskedLabelsStackView completionLabel](v3, "completionLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v27;
    -[SearchUIMaskedLabelsStackView bridgeLabel](v3, "bridgeLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v28;
    -[SearchUIMaskedLabelsStackView extensionLabel](v3, "extensionLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v29;
    -[SearchUIMaskedLabelsStackView fillerView](v3, "fillerView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIMaskedLabelsStackView setArrangedSubviews:](v3, "setArrangedSubviews:", v31);

    -[SearchUIMaskedLabelsStackView bridgeLabel](v3, "bridgeLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIMaskedLabelsStackView setAlignment:forView:inAxis:](v3, "setAlignment:forView:inAxis:", 3, v32, 1);

    -[SearchUIMaskedLabelsStackView extensionLabel](v3, "extensionLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIMaskedLabelsStackView setAlignment:forView:inAxis:](v3, "setAlignment:forView:inAxis:", 3, v33, 1);

  }
  return v3;
}

- (void)setFont:(id)a3
{
  id v5;
  char v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a3;
  if (v5)
  {
    v18 = v5;
    v6 = -[UIFont isEqual:](self->_font, "isEqual:");
    v5 = v18;
    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_font, a3);
      -[SearchUIMaskedLabelsStackView completionLabel](self, "completionLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFont:", v18);

      v8 = (void *)MEMORY[0x1E0DC1350];
      v9 = 15.0;
      if (!+[SearchUIUtilities isIpad](SearchUIUtilities, "isIpad")
        && !+[SearchUIUtilities isLargeIpad](SearchUIUtilities, "isLargeIpad"))
      {
        objc_msgSend(v18, "pointSize");
        v9 = v10 + -2.0;
      }
      objc_msgSend(v8, "systemFontOfSize:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIMaskedLabelsStackView extensionLabel](self, "extensionLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFont:", v11);

      -[SearchUIMaskedLabelsStackView extensionLabel](self, "extensionLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "font");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIMaskedLabelsStackView bridgeLabel](self, "bridgeLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFont:", v14);

      -[SearchUIMaskedLabelsStackView resetStringOffset](self, "resetStringOffset");
      -[SearchUIMaskedLabelsStackView extensionLabel](self, "extensionLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIMaskedLabelsStackView extensionLabel](self, "extensionLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "intrinsicContentSize");
      objc_msgSend(v16, "setMaximumLayoutSize:", 3.40282347e38);

      v5 = v18;
    }
  }

}

- (void)setTypedString:(id)a3
{
  id v5;
  void *v6;
  char v7;
  id v8;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v8 = v5;
    v7 = objc_msgSend(v5, "isEqualToString:", self->_typedString);
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_typedString, a3);
      -[SearchUIMaskedLabelsStackView resetStringOffset](self, "resetStringOffset");
      v6 = v8;
    }
  }

}

- (void)resetStringOffset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[SearchUIMaskedLabelsStackView typedString](self, "typedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SearchUIMaskedLabelsStackView typedString](self, "typedString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0DC1138];
    -[SearchUIMaskedLabelsStackView completionLabel](self, "completionLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sizeWithAttributes:", v7);
    -[SearchUIMaskedLabelsStackView setCompletionStringOffset:](self, "setCompletionStringOffset:");

    -[SearchUIMaskedLabelsStackView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  double v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a4;
  -[SearchUIMaskedLabelsStackView extensionLabel](self, "extensionLabel");
  v11 = objc_claimAutoreleasedReturnValue();
  if ((id)v11 == v10)
  {

  }
  else
  {
    v12 = (void *)v11;
    -[SearchUIMaskedLabelsStackView bridgeLabel](self, "bridgeLabel");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13 != v10)
      goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0DBD9B0], "deviceScaledRoundedValue:forView:", self, 2.0);
  y = y + v14;
  -[SearchUIMaskedLabelsStackView bridgeLabel](self, "bridgeLabel");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15 == v10)
    x = x + (double)objc_msgSend(MEMORY[0x1E0DBD9B0], "isLTR");
LABEL_7:

  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)containerViewDidLayoutArrangedSubviews:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__SearchUIMaskedLabelsStackView_containerViewDidLayoutArrangedSubviews___block_invoke;
  v3[3] = &unk_1EA1F62F0;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
}

uint64_t __72__SearchUIMaskedLabelsStackView_containerViewDidLayoutArrangedSubviews___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutMasksAndLabels");
}

- (void)layoutMasksAndLabels
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
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGFloat v51;
  void *v52;
  char v53;
  void *v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v63;
  double v64;
  void *v65;
  char v66;
  void *v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  void *v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  double v81;
  double v82;
  double v83;
  int v84;
  double v85;
  double v86;
  double v87;
  id v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;

  -[SearchUIMaskedLabelsStackView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SearchUIMaskedLabelsStackView gradientView](self, "gradientView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[SearchUIMaskedLabelsStackView extensionLabel](self, "extensionLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "font");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ascender");
  v15 = v14;
  -[SearchUIMaskedLabelsStackView extensionLabel](self, "extensionLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "font");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "descender");
  v19 = v15 - v18;

  v20 = (void *)MEMORY[0x1E0DBD9B0];
  -[SearchUIMaskedLabelsStackView completionLabel](self, "completionLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "font");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "ascender");
  v24 = v23;
  -[SearchUIMaskedLabelsStackView completionLabel](self, "completionLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "font");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "descender");
  objc_msgSend(v20, "deviceScaledRoundedValue:forView:", self, v24 - v27);
  v29 = v28;

  v30 = (void *)MEMORY[0x1E0DBD9B0];
  -[SearchUIMaskedLabelsStackView extensionLabel](self, "extensionLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "font");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "descender");
  objc_msgSend(v30, "deviceScaledRoundedValue:forView:", self, (v29 - v19) * 0.5 - v33);
  v35 = v34;

  -[SearchUIMaskedLabelsStackView fillerView](self, "fillerView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "frame");
  if (v37 >= v35)
  {
    -[SearchUIMaskedLabelsStackView setMaskView:](self, "setMaskView:", 0);
  }
  else
  {
    -[SearchUIMaskedLabelsStackView gradientView](self, "gradientView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIMaskedLabelsStackView setMaskView:](self, "setMaskView:", v38);

  }
  -[SearchUIMaskedLabelsStackView completionLabel](self, "completionLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "alpha");
  v41 = v40;

  if (v41 != 0.0)
  {
    if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
      v42 = 3.0;
    else
      v42 = 0.0;
    -[SearchUIMaskedLabelsStackView completionLabel](self, "completionLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "frame");
    v45 = v44;
    v47 = v46;
    v49 = v48;
    v51 = v50;

    -[SearchUIMaskedLabelsStackView extensionLabel](self, "extensionLabel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "isHidden");

    if ((v53 & 1) == 0)
    {
      -[SearchUIMaskedLabelsStackView extensionLabel](self, "extensionLabel");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "frame");
      v95.origin.x = v55;
      v95.origin.y = v56;
      v95.size.width = v57;
      v95.size.height = v58;
      v89.origin.x = v45;
      v89.origin.y = v47;
      v89.size.width = v49;
      v89.size.height = v51;
      v90 = CGRectUnion(v89, v95);
      x = v90.origin.x;
      y = v90.origin.y;
      width = v90.size.width;
      height = v90.size.height;

      v91.origin.x = x;
      v91.origin.y = y;
      v91.size.width = width;
      v91.size.height = height;
      v92 = CGRectInset(v91, v42, 0.0);
      v45 = v92.origin.x;
      v47 = v92.origin.y;
      v49 = v92.size.width;
    }
    if ((objc_msgSend(MEMORY[0x1E0DBD9B0], "isLTR") & 1) != 0)
    {
      -[SearchUIMaskedLabelsStackView completionStringOffset](self, "completionStringOffset");
      v64 = v63;
    }
    else
    {
      v64 = -v35;
    }
    -[SearchUIMaskedLabelsStackView completionStringOffset](self, "completionStringOffset");
    v83 = v35 + v49 - v87;
    if (v83 > v42)
    {
      v86 = v45 + v64;
      goto LABEL_20;
    }
LABEL_19:
    v86 = *MEMORY[0x1E0C9D648];
    v47 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v83 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v29 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    goto LABEL_20;
  }
  -[SearchUIMaskedLabelsStackView bridgeLabel](self, "bridgeLabel");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "isHidden");

  if ((v66 & 1) != 0)
    goto LABEL_19;
  -[SearchUIMaskedLabelsStackView extensionLabel](self, "extensionLabel");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "frame");
  v69 = v68;
  v71 = v70;
  v73 = v72;
  v75 = v74;
  -[SearchUIMaskedLabelsStackView bridgeLabel](self, "bridgeLabel");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "frame");
  v96.origin.x = v77;
  v96.origin.y = v78;
  v96.size.width = v79;
  v96.size.height = v80;
  v93.origin.x = v69;
  v93.origin.y = v71;
  v93.size.width = v73;
  v93.size.height = v75;
  v94 = CGRectUnion(v93, v96);
  v81 = v94.origin.x;
  v47 = v94.origin.y;
  v82 = v94.size.width;

  v83 = v35 + v82;
  v84 = objc_msgSend(MEMORY[0x1E0DBD9B0], "isLTR");
  v85 = 0.0;
  if (!v84)
    v85 = v35;
  v86 = v81 - v85;
LABEL_20:
  -[SearchUIMaskedLabelsStackView extensionLabelBackgroundView](self, "extensionLabelBackgroundView");
  v88 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setFrame:", v86, v47, v83, v29);

}

- (TLKLabel)completionLabel
{
  return self->_completionLabel;
}

- (TLKLabel)bridgeLabel
{
  return self->_bridgeLabel;
}

- (TLKLabel)extensionLabel
{
  return self->_extensionLabel;
}

- (NSString)typedString
{
  return self->_typedString;
}

- (UIFont)font
{
  return self->_font;
}

- (UIColor)completionFillColor
{
  return self->_completionFillColor;
}

- (void)setCompletionFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_completionFillColor, a3);
}

- (UIView)extensionLabelBackgroundView
{
  return (UIView *)objc_getProperty(self, a2, 760, 1);
}

- (void)setExtensionLabelBackgroundView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 760);
}

- (UIView)gradientView
{
  return (UIView *)objc_getProperty(self, a2, 768, 1);
}

- (void)setGradientView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 768);
}

- (double)completionStringOffset
{
  return self->_completionStringOffset;
}

- (void)setCompletionStringOffset:(double)a3
{
  self->_completionStringOffset = a3;
}

- (UIView)fillerView
{
  return (UIView *)objc_getProperty(self, a2, 784, 1);
}

- (void)setFillerView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 784);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillerView, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_extensionLabelBackgroundView, 0);
  objc_storeStrong((id *)&self->_completionFillColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_typedString, 0);
  objc_storeStrong((id *)&self->_extensionLabel, 0);
  objc_storeStrong((id *)&self->_bridgeLabel, 0);
  objc_storeStrong((id *)&self->_completionLabel, 0);
}

@end
