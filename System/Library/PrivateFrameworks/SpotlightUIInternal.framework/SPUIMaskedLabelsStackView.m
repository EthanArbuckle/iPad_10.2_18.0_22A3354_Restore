@implementation SPUIMaskedLabelsStackView

- (SPUIMaskedLabelsStackView)init
{
  SPUIMaskedLabelsStackView *v2;
  SPUIMaskedLabelsStackView *v3;
  uint64_t v4;
  UILabel *completionLabel;
  uint64_t v6;
  UILabel *bridgeLabel;
  UILabel *v8;
  UILabel *extensionLabel;
  UILabel *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  int v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v36;
  _QWORD v37[5];

  v37[4] = *MEMORY[0x24BDAC8D0];
  v36.receiver = self;
  v36.super_class = (Class)SPUIMaskedLabelsStackView;
  v2 = -[SPUIMaskedLabelsStackView init](&v36, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SPUIMaskedLabelsStackView setDelegate:](v2, "setDelegate:", v2);
    -[NUIContainerStackView setSpacing:](v3, "setSpacing:", 0.0);
    v4 = objc_opt_new();
    completionLabel = v3->_completionLabel;
    v3->_completionLabel = (UILabel *)v4;

    -[UILabel setLineBreakMode:](v3->_completionLabel, "setLineBreakMode:", 2);
    objc_msgSend(MEMORY[0x24BEB4B98], "tertiaryLabel");
    v6 = objc_claimAutoreleasedReturnValue();
    bridgeLabel = v3->_bridgeLabel;
    v3->_bridgeLabel = (UILabel *)v6;

    -[UILabel setLineBreakMode:](v3->_completionLabel, "setLineBreakMode:", 2);
    objc_msgSend(MEMORY[0x24BEB4B98], "tertiaryLabel");
    v8 = (UILabel *)objc_claimAutoreleasedReturnValue();
    -[UILabel setSupportsColorGlyphs:](v8, "setSupportsColorGlyphs:", 1);
    -[UILabel setLineBreakMode:](v8, "setLineBreakMode:", 2);
    extensionLabel = v3->_extensionLabel;
    v3->_extensionLabel = v8;
    v10 = v8;

    -[SPUIMaskedLabelsStackView bridgeLabel](v3, "bridgeLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = 1148846080;
    objc_msgSend(v11, "setContentHuggingPriority:forAxis:", 0, v12);

    -[SPUIMaskedLabelsStackView completionLabel](v3, "completionLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = 1148829696;
    objc_msgSend(v13, "setContentHuggingPriority:forAxis:", 0, v14);

    -[SPUIMaskedLabelsStackView completionLabel](v3, "completionLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = 1148846080;
    objc_msgSend(v15, "setContentCompressionResistancePriority:forAxis:", 0, v16);

    -[SPUIMaskedLabelsStackView extensionLabel](v3, "extensionLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = 1148829696;
    objc_msgSend(v17, "setContentHuggingPriority:forAxis:", 0, v18);

    -[SPUIMaskedLabelsStackView extensionLabel](v3, "extensionLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = 1132068864;
    objc_msgSend(v19, "setContentCompressionResistancePriority:forAxis:", 0, v20);

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4BA8]), "initWithProminence:", 3);
    v22 = objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow");
    v23 = 8.0;
    if (v22)
      v23 = 4.0;
    objc_msgSend(v21, "_setContinuousCornerRadius:", v23);
    -[SPUIMaskedLabelsStackView setExtensionLabelProminenceView:](v3, "setExtensionLabelProminenceView:", v21);
    -[SPUIMaskedLabelsStackView extensionLabelProminenceView](v3, "extensionLabelProminenceView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIMaskedLabelsStackView addSubview:](v3, "addSubview:", v24);

    -[NUIContainerStackView setSpacing:](v3, "setSpacing:", 0.0);
    v25 = (void *)objc_opt_new();
    -[SPUIMaskedLabelsStackView setGradientView:](v3, "setGradientView:", v25);

    v26 = (void *)objc_opt_new();
    -[SPUIMaskedLabelsStackView setFillerView:](v3, "setFillerView:", v26);

    -[SPUIMaskedLabelsStackView fillerView](v3, "fillerView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v28) = 0;
    objc_msgSend(v27, "setContentCompressionResistancePriority:forAxis:", 0, v28);

    -[SPUIMaskedLabelsStackView completionLabel](v3, "completionLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v29;
    -[SPUIMaskedLabelsStackView bridgeLabel](v3, "bridgeLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v30;
    -[SPUIMaskedLabelsStackView extensionLabel](v3, "extensionLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v31;
    -[SPUIMaskedLabelsStackView fillerView](v3, "fillerView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v32;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIMaskedLabelsStackView setArrangedSubviews:](v3, "setArrangedSubviews:", v33);

    LODWORD(v29) = objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow");
    if ((_DWORD)v29)
    {
      -[SPUIMaskedLabelsStackView completionLabel](v3, "completionLabel");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUIContainerStackView setCustomSpacing:afterView:](v3, "setCustomSpacing:afterView:", v34, 2.0);

    }
  }
  return v3;
}

- (UIView)fillerView
{
  return (UIView *)objc_getProperty(self, a2, 776, 1);
}

void __68__SPUIMaskedLabelsStackView_containerViewDidLayoutArrangedSubviews___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  void *v60;
  char v61;
  void *v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  double v67;
  void *v68;
  char v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  double v79;
  CGFloat v80;
  double v81;
  CGFloat v82;
  void *v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  double x;
  double y;
  double width;
  int v91;
  double v92;
  id v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "gradientView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);

  objc_msgSend(*(id *)(a1 + 32), "additionalPadding");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(*(id *)(a1 + 32), "extensionLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "font");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ascender");
  v22 = v21;
  objc_msgSend(*(id *)(a1 + 32), "extensionLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "font");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "descender");
  v26 = v22 - v25;

  v27 = (void *)MEMORY[0x24BEB4BA0];
  objc_msgSend(*(id *)(a1 + 32), "completionLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "font");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "ascender");
  v31 = v30;
  objc_msgSend(*(id *)(a1 + 32), "completionLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "font");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "descender");
  objc_msgSend(v27, "deviceScaledRoundedValue:forView:", *(_QWORD *)(a1 + 32), v31 - v34);
  v36 = v16 + v12 + v35;

  v37 = (void *)MEMORY[0x24BEB4BA0];
  objc_msgSend(*(id *)(a1 + 32), "extensionLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "font");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "descender");
  objc_msgSend(v37, "deviceScaledRoundedValue:forView:", *(_QWORD *)(a1 + 32), (v36 - v26) * 0.5 - v40);
  v42 = v18 + v41;

  objc_msgSend(*(id *)(a1 + 32), "fillerView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "frame");
  v44 = *(void **)(a1 + 32);
  if (v45 >= v42)
  {
    objc_msgSend(v44, "setMaskView:", 0);
  }
  else
  {
    objc_msgSend(v44, "gradientView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setMaskView:", v46);

  }
  objc_msgSend(*(id *)(a1 + 32), "completionLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "alpha");
  v49 = v48;

  v50 = *(void **)(a1 + 32);
  if (v49 == 0.0)
  {
    objc_msgSend(v50, "bridgeLabel");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "isHidden");

    if ((v69 & 1) != 0)
    {
      v71 = *MEMORY[0x24BDBF090];
      v70 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v72 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v36 = *(double *)(MEMORY[0x24BDBF090] + 24);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "extensionLabel");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "frame");
      v76 = v75;
      v78 = v77;
      v80 = v79;
      v82 = v81;
      objc_msgSend(*(id *)(a1 + 32), "bridgeLabel");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "frame");
      v99.origin.x = v84;
      v99.origin.y = v85;
      v99.size.width = v86;
      v99.size.height = v87;
      v96.origin.x = v76;
      v96.origin.y = v78;
      v96.size.width = v80;
      v96.size.height = v82;
      v97 = CGRectUnion(v96, v99);
      x = v97.origin.x;
      y = v97.origin.y;
      width = v97.size.width;

      v72 = v14 + v42 + width;
      v91 = objc_msgSend(*(id *)(a1 + 32), "isRTL");
      v92 = 0.0;
      if (v91)
        v92 = v42;
      v71 = x - v92;
      v70 = y - v14 - v12;
    }
  }
  else
  {
    objc_msgSend(v50, "completionLabel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "frame");
    v53 = v52;
    v55 = v54;
    v57 = v56;
    v59 = v58;

    objc_msgSend(*(id *)(a1 + 32), "extensionLabel");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "isHidden");

    if ((v61 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "extensionLabel");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "frame");
      v98.origin.x = v63;
      v98.origin.y = v64;
      v98.size.width = v65;
      v98.size.height = v66;
      v94.origin.x = v53;
      v94.origin.y = v55;
      v94.size.width = v57;
      v94.size.height = v59;
      v95 = CGRectUnion(v94, v98);
      v53 = v95.origin.x;
      v55 = v95.origin.y;
      v57 = v95.size.width;

    }
    if (objc_msgSend(*(id *)(a1 + 32), "isRTL"))
      v67 = -v42;
    else
      objc_msgSend(*(id *)(a1 + 32), "completionStringOffset");
    v71 = v53 + v67 - v14;
    objc_msgSend(*(id *)(a1 + 32), "completionStringOffset");
    v72 = v14 + v42 + v57 - v73;
    v70 = v55 + v12 * -0.5;
  }
  objc_msgSend(*(id *)(a1 + 32), "extensionLabelProminenceView");
  v93 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setFrame:", v71, v70, v72, v36);

}

- (UILabel)extensionLabel
{
  return self->_extensionLabel;
}

- (UILabel)bridgeLabel
{
  return self->_bridgeLabel;
}

- (UILabel)completionLabel
{
  return self->_completionLabel;
}

- (UIView)gradientView
{
  return (UIView *)objc_getProperty(self, a2, 760, 1);
}

- (TLKProminenceView)extensionLabelProminenceView
{
  return (TLKProminenceView *)objc_getProperty(self, a2, 752, 1);
}

- (BOOL)isRTL
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceLayoutDirection") == 1;

  return v3;
}

- (NSDirectionalEdgeInsets)additionalPadding
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  if ((objc_msgSend(MEMORY[0x24BE85288], "isIpad") & 1) != 0)
  {
    v2 = 0.0;
    v3 = 4.0;
    v4 = 1.0;
    v5 = 1.0;
  }
  else
  {
    v3 = *MEMORY[0x24BEBD250];
    v4 = *(double *)(MEMORY[0x24BEBD250] + 8);
    v5 = *(double *)(MEMORY[0x24BEBD250] + 16);
    v2 = *(double *)(MEMORY[0x24BEBD250] + 24);
  }
  result.trailing = v2;
  result.bottom = v5;
  result.leading = v4;
  result.top = v3;
  return result;
}

- (void)setGradientView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 760);
}

- (void)setFillerView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 776);
}

- (void)setExtensionLabelProminenceView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 752);
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setFont:(id)a3
{
  id v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a3;
  if (v5)
  {
    v17 = v5;
    v6 = -[UIFont isEqual:](self->_font, "isEqual:");
    v5 = v17;
    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_font, a3);
      -[SPUIMaskedLabelsStackView completionLabel](self, "completionLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFont:", v17);

      v8 = (void *)MEMORY[0x24BEBB520];
      v9 = objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow");
      v10 = 20.0;
      if ((v9 & 1) == 0)
      {
        objc_msgSend(v17, "pointSize", 20.0);
        v10 = v11 + -2.0;
      }
      objc_msgSend(v8, "systemFontOfSize:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUIMaskedLabelsStackView extensionLabel](self, "extensionLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFont:", v12);

      -[SPUIMaskedLabelsStackView extensionLabel](self, "extensionLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "font");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUIMaskedLabelsStackView bridgeLabel](self, "bridgeLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFont:", v15);

      -[SPUIMaskedLabelsStackView resetStringOffset](self, "resetStringOffset");
      v5 = v17;
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

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[SPUIMaskedLabelsStackView typedString](self, "typedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SPUIMaskedLabelsStackView typedString](self, "typedString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BEBB360];
    -[SPUIMaskedLabelsStackView completionLabel](self, "completionLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sizeWithAttributes:", v7);
    -[SPUIMaskedLabelsStackView setCompletionStringOffset:](self, "setCompletionStringOffset:");

    -[SPUIMaskedLabelsStackView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)typedString
{
  return self->_typedString;
}

- (void)containerViewDidLayoutArrangedSubviews:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __68__SPUIMaskedLabelsStackView_containerViewDidLayoutArrangedSubviews___block_invoke;
  v3[3] = &unk_24F9D5CC8;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v3);
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
      -[SPUIMaskedLabelsStackView resetStringOffset](self, "resetStringOffset");
      v6 = v8;
    }
  }

}

- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  double y;
  CGFloat x;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a4;
  -[SPUIMaskedLabelsStackView completionLabel](self, "completionLabel");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 != v10 && objc_msgSend(MEMORY[0x24BE85288], "isIpad"))
    y = y + 2.0;
  if (objc_msgSend(MEMORY[0x24BE85288], "isIpad"))
  {
    objc_msgSend(MEMORY[0x24BEB4BC0], "pixelWidthForView:", self);
    y = y + v12;
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

- (UIFont)font
{
  return self->_font;
}

- (double)completionStringOffset
{
  return self->_completionStringOffset;
}

- (void)setCompletionStringOffset:(double)a3
{
  self->_completionStringOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillerView, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_extensionLabelProminenceView, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_typedString, 0);
  objc_storeStrong((id *)&self->_extensionLabel, 0);
  objc_storeStrong((id *)&self->_bridgeLabel, 0);
  objc_storeStrong((id *)&self->_completionLabel, 0);
}

@end
