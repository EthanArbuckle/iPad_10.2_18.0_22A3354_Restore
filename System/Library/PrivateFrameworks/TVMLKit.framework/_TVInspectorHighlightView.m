@implementation _TVInspectorHighlightView

- (_TVInspectorHighlightView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  _TVInspectorHighlightView *v5;
  id v6;
  uint64_t v7;
  UIView *highlightView;
  UIView *v9;
  void *v10;
  void *v11;
  _TVInspectorHighlightMetadataView *v12;
  uint64_t v13;
  _TVInspectorHighlightMetadataView *metadataView;
  _TVInspectorHighlightMetadataView *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  v21.receiver = self;
  v21.super_class = (Class)_TVInspectorHighlightView;
  v5 = -[_TVInspectorHighlightView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDF6F90]);
    v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), width, height);
    highlightView = v5->_highlightView;
    v5->_highlightView = (UIView *)v7;

    -[UIView setAlpha:](v5->_highlightView, "setAlpha:", 0.5);
    v9 = v5->_highlightView;
    objc_msgSend(MEMORY[0x24BDF6950], "greenColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[_TVInspectorHighlightView addSubview:](v5, "addSubview:", v5->_highlightView);
    -[_TVInspectorHighlightView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVInspectorHighlightView setBackgroundColor:](v5, "setBackgroundColor:", v11);

    -[_TVInspectorHighlightView setOpaque:](v5, "setOpaque:", 0);
    -[_TVInspectorHighlightView setAlpha:](v5, "setAlpha:", 1.0);
    v12 = [_TVInspectorHighlightMetadataView alloc];
    v13 = -[_TVInspectorHighlightMetadataView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    metadataView = v5->_metadataView;
    v5->_metadataView = (_TVInspectorHighlightMetadataView *)v13;

    v15 = v5->_metadataView;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 0.980392157, 0.803921569, 1.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVInspectorHighlightMetadataView setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[_TVInspectorHighlightMetadataView layer](v5->_metadataView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v17, "setBorderColor:", objc_msgSend(v18, "CGColor"));

    -[_TVInspectorHighlightMetadataView layer](v5->_metadataView, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBorderWidth:", 1.0);

    -[_TVInspectorHighlightView addSubview:](v5, "addSubview:", v5->_metadataView);
  }
  return v5;
}

- (UILabel)descriptionLabel
{
  return -[_TVInspectorHighlightMetadataView descriptionLabel](self->_metadataView, "descriptionLabel");
}

- (void)setBorderColor:(id)a3
{
  UIColor *v5;
  void *v6;
  void *v7;
  UIColor *v8;

  v5 = (UIColor *)a3;
  if (self->_borderColor != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_borderColor, a3);
    -[UIView layer](self->_highlightView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBorderColor:", -[UIColor CGColor](self->_borderColor, "CGColor"));

    -[UIView layer](self->_highlightView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBorderWidth:", 1.0);

    v5 = v8;
  }

}

- (void)setContentColor:(id)a3
{
  -[UIView setBackgroundColor:](self->_highlightView, "setBackgroundColor:", a3);
}

- (UIColor)contentColor
{
  return -[UIView backgroundColor](self->_highlightView, "backgroundColor");
}

- (void)highlightView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v18 = a3;
  -[_TVInspectorHighlightView removeFromSuperview](self, "removeFromSuperview");
  v4 = v18;
  if (v18)
  {
    -[_TVInspectorHighlightView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(v18, "window");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

    objc_msgSend(v18, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frame");
    objc_msgSend(v9, "convertRect:toView:", v8);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    objc_msgSend(v8, "addSubview:", self);
    objc_msgSend(v8, "bringSubviewToFront:", self);
    -[_TVInspectorHighlightView setFrame:](self, "setFrame:", v11, v13, v15, v17);
    -[_TVInspectorHighlightView setNeedsLayout](self, "setNeedsLayout");

    v4 = v18;
  }

}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  UIView *highlightView;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  CGFloat v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  void *v39;
  double v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  double v51;
  double v52;
  BOOL v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  double MinY;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double Height;
  double v71;
  double v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat rect;
  CGFloat v86;
  double Width;
  objc_super v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;

  v88.receiver = self;
  v88.super_class = (Class)_TVInspectorHighlightView;
  -[_TVInspectorHighlightView layoutSubviews](&v88, sel_layoutSubviews);
  -[_TVInspectorHighlightView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  highlightView = self->_highlightView;
  -[_TVInspectorHighlightView bounds](self, "bounds");
  -[UIView setFrame:](highlightView, "setFrame:");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%g x %g"), *(_QWORD *)&v8, *(_QWORD *)&v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v12);
  v14 = *MEMORY[0x24BDF65F8];
  objc_msgSend(MEMORY[0x24BDF6A70], "monospacedDigitSystemFontOfSize:weight:", 15.0, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAttribute:value:range:", v14, v15, 0, objc_msgSend(v12, "length"));

  v16 = *MEMORY[0x24BDF6600];
  objc_msgSend(MEMORY[0x24BDF6950], "lightGrayColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAttribute:value:range:", v16, v17, 0, objc_msgSend(v12, "length"));

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%g "), *(_QWORD *)&v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v12, "rangeOfString:", v19);
  objc_msgSend(v13, "addAttribute:value:range:", v16, v18, v20, v21);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" %g"), *(_QWORD *)&v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v12, "rangeOfString:", v23);
  objc_msgSend(v13, "addAttribute:value:range:", v16, v22, v24, v25);

  -[_TVInspectorHighlightMetadataView frameLabel](self->_metadataView, "frameLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAttributedText:", v13);

  v84 = 20.0;
  -[_TVInspectorHighlightMetadataView sizeThatFits:](self->_metadataView, "sizeThatFits:", 1.79769313e308);
  v28 = v27;
  v89.origin.x = v4;
  v89.origin.y = v6;
  v89.size.width = v8;
  v89.size.height = v10;
  v29 = CGRectGetHeight(v89) + 5.0;
  -[_TVInspectorHighlightView superview](self, "superview");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;

  -[_TVInspectorHighlightView superview](self, "superview");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v29;
  v86 = v28;
  -[_TVInspectorHighlightView convertRect:toView:](self, "convertRect:toView:", v39, 0.0, v29, v28, 20.0);
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;

  v80 = v41;
  v90.origin.x = v41;
  v90.origin.y = v43;
  v90.size.width = v45;
  v90.size.height = v47;
  v48 = CGRectGetMaxX(v90) + 5.0;
  v91.origin.x = v32;
  v91.origin.y = v34;
  v91.size.width = v36;
  v91.size.height = v38;
  rect = v34;
  v82 = v38;
  if (v48 <= CGRectGetWidth(v91))
  {
    v81 = 0.0;
    v54 = v47;
    v55 = v80;
    v56 = 5.0;
  }
  else
  {
    v92.origin.x = v80;
    v92.origin.y = v43;
    v92.size.width = v45;
    v92.size.height = v47;
    Width = CGRectGetWidth(v92);
    v93.origin.x = v32;
    v93.origin.y = v34;
    v93.size.width = v36;
    v93.size.height = v38;
    v49 = CGRectGetWidth(v93);
    v94.origin.y = v34;
    v50 = v32;
    v51 = v49;
    v94.origin.x = v50;
    v94.size.width = v36;
    v94.size.height = v38;
    v52 = CGRectGetWidth(v94);
    v53 = Width <= v51;
    v32 = v50;
    v54 = v47;
    v55 = v80;
    v56 = 5.0;
    if (v53)
    {
      v57 = v52 + -5.0;
      v95.origin.x = v80;
      v95.origin.y = v43;
      v95.size.width = v45;
      v95.size.height = v54;
      v55 = v57 - CGRectGetWidth(v95);
      -[_TVInspectorHighlightView superview](self, "superview");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "convertRect:toView:", self, v55, v43, v45, v54);
      v81 = v59;
      v83 = v60;
      v84 = v61;
      v86 = v62;

    }
    else
    {
      v86 = v52;
      v81 = 0.0;
    }
  }
  v96.origin.x = v55;
  v96.origin.y = v43;
  v96.size.width = v45;
  v96.size.height = v54;
  v63 = CGRectGetMaxY(v96) + v56;
  v97.origin.x = v32;
  v97.origin.y = rect;
  v97.size.width = v36;
  v97.size.height = v82;
  if (v63 <= CGRectGetHeight(v97))
  {
    v69 = v83;
    v65 = v84;
    v68 = v81;
    v66 = v86;
  }
  else
  {
    v78 = v43;
    v79 = v32;
    -[_TVInspectorHighlightView frame](self, "frame");
    MinY = CGRectGetMinY(v98);
    v99.origin.x = v81;
    v65 = v84;
    v99.origin.y = v83;
    v66 = v86;
    v99.size.width = v86;
    v99.size.height = v84;
    v67 = MinY - CGRectGetHeight(v99);
    v68 = v81;
    if (v67 + -5.0 + -5.0 <= 0.0)
    {
      v101.origin.x = v79;
      v101.origin.y = rect;
      v101.size.width = v36;
      v101.size.height = v82;
      Height = CGRectGetHeight(v101);
      v71 = v55;
      v102.origin.x = v55;
      v102.origin.y = v78;
      v102.size.width = v45;
      v102.size.height = v54;
      v72 = Height - CGRectGetHeight(v102) + -5.0;
      -[_TVInspectorHighlightView superview](self, "superview");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "convertRect:toView:", self, v71, v72, v45, v54);
      v68 = v74;
      v69 = v75;
      v66 = v76;
      v65 = v77;

    }
    else
    {
      v100.origin.x = v81;
      v100.origin.y = v83;
      v100.size.width = v86;
      v100.size.height = v84;
      v69 = -5.0 - CGRectGetHeight(v100);
    }
  }
  -[_TVInspectorHighlightMetadataView setFrame:](self->_metadataView, "setFrame:", v68, v69, v66, v65);
  -[_TVInspectorHighlightMetadataView setNeedsLayout](self->_metadataView, "setNeedsLayout");

}

- (UIWindow)targetWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_targetWindow);
}

- (void)setTargetWindow:(id)a3
{
  objc_storeWeak((id *)&self->_targetWindow, a3);
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_destroyWeak((id *)&self->_targetWindow);
  objc_storeStrong((id *)&self->_metadataView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
}

@end
