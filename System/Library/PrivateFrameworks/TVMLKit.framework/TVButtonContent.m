@implementation TVButtonContent

- (TVButtonContent)initWithFrame:(CGRect)a3 blurEffectStyle:(int64_t)a4 blurEnabled:(BOOL)a5
{
  TVButtonContent *v7;
  TVButtonContent *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TVButtonContent;
  v7 = -[_UIFloatingContentView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    v7->_focused = 0;
    v7->_backdropStyle = a4;
    v7->_blurEnabled = a5;
    -[TVButtonContent setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0);
  }
  return v8;
}

- (void)setGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_groupName, a3);
}

- (id)backgroundColor
{
  return self->__backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  UIColor *v5;
  UIColor *backgroundColor;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TVButtonContent;
  v4 = a3;
  -[TVButtonContent setBackgroundColor:](&v7, sel_setBackgroundColor_, v4);
  v5 = (UIColor *)objc_msgSend(v4, "copy", v7.receiver, v7.super_class);

  backgroundColor = self->__backgroundColor;
  self->__backgroundColor = v5;

}

- (void)setHighlightColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_highlightColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_highlightColor, a3);
    v5 = v6;
  }

}

- (void)_updateBackgroundColorForState:(unint64_t)a3
{
  int *v3;
  uint64_t v4;
  objc_super v5;

  v3 = &OBJC_IVAR___TVButtonContent__highlightColor;
  if ((a3 & 0xD) == 0)
    v3 = &OBJC_IVAR___TVButtonContent___backgroundColor;
  v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa + *v3);
  v5.receiver = self;
  v5.super_class = (Class)TVButtonContent;
  -[TVButtonContent setBackgroundColor:](&v5, sel_setBackgroundColor_, v4);
}

- (void)setCornerRadius:(double)a3
{
  void *v5;

  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[TVButtonContent layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", a3);

    -[TVButtonContent setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTextContentView:(id)a3
{
  UILabel *v5;
  UILabel *textContentView;
  UILabel *v7;

  v5 = (UILabel *)a3;
  textContentView = self->_textContentView;
  v7 = v5;
  if (textContentView != v5)
  {
    -[UILabel removeFromSuperview](textContentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_textContentView, a3);
    if (self->_textContentView)
      -[TVButtonContent addSubview:](self, "addSubview:");
  }
  -[TVButtonContent _updateFocusStateWithCoordinator:](self, "_updateFocusStateWithCoordinator:", 0);
  -[TVButtonContent setNeedsLayout](self, "setNeedsLayout");

}

- (void)setImageView:(id)a3
{
  _TVImageView *v5;
  _TVImageView **p_imageView;
  _TVImageView *imageView;
  _TVImageView *v8;

  v5 = (_TVImageView *)a3;
  p_imageView = &self->_imageView;
  imageView = self->_imageView;
  v8 = v5;
  if (imageView != v5)
  {
    -[_TVImageView removeFromSuperview](imageView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_imageView, a3);
    if (*p_imageView)
    {
      -[TVButtonContent addSubview:](self, "addSubview:");
      -[_TVImageView setUserInteractionEnabled:](*p_imageView, "setUserInteractionEnabled:", 0);
    }
  }
  -[TVButtonContent _updateFocusStateWithCoordinator:](self, "_updateFocusStateWithCoordinator:", 0);
  -[TVButtonContent setNeedsLayout](self, "setNeedsLayout");

}

- (void)setAccessoryView:(id)a3
{
  _TVImageView *v5;
  _TVImageView *accessoryView;
  _TVImageView *v7;

  v5 = (_TVImageView *)a3;
  accessoryView = self->_accessoryView;
  v7 = v5;
  if (accessoryView != v5)
  {
    -[_TVImageView removeFromSuperview](accessoryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_accessoryView, a3);
    if (self->_accessoryView)
    {
      -[TVButtonContent addSubview:](self, "addSubview:");
      -[_TVImageView setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0);
    }
  }
  -[TVButtonContent _updateFocusStateWithCoordinator:](self, "_updateFocusStateWithCoordinator:", 0);
  -[TVButtonContent setNeedsLayout](self, "setNeedsLayout");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v42;
  double v43;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGSize result;

  -[UIView tv_itemWidth](self, "tv_itemWidth", a3.width, a3.height);
  v56 = v4;
  -[UIView tv_itemHeight](self, "tv_itemHeight");
  v55 = v5;
  -[UIView tv_minWidth](self, "tv_minWidth");
  v54 = v6;
  -[UIView tv_minHeight](self, "tv_minHeight");
  v53 = v7;
  -[UIView tv_maxWidth](self, "tv_maxWidth");
  v9 = v8;
  -[UIView tv_maxHeight](self, "tv_maxHeight");
  v11 = v10;
  -[UIView tv_padding](self, "tv_padding");
  v51 = v13;
  v52 = v12;
  v15 = v14;
  v50 = v16;
  -[TVButtonContent accessoryView](self, "accessoryView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "tv_margin");
  v47 = v19;
  v48 = v18;

  -[TVButtonContent imageView](self, "imageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x24BDBF148];
  v22 = *(double *)(MEMORY[0x24BDBF148] + 8);
  objc_msgSend(v20, "sizeThatFits:", *MEMORY[0x24BDBF148], v22);
  v49 = v23;

  -[TVButtonContent _imageMarginFromText](self, "_imageMarginFromText");
  v25 = v24;
  -[TVButtonContent textContentView](self, "textContentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sizeThatFits:", v21, v22);
  v28 = v27;
  v30 = v29;

  -[TVButtonContent accessoryView](self, "accessoryView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sizeThatFits:", v21, v22);
  v33 = v32;

  -[TVButtonContent accessoryView](self, "accessoryView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[TVButtonContent accessoryView](self, "accessoryView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "tv_alignment");

    if (v36 == 1)
      v37 = v15;
    else
      v37 = v50;
    v38 = v49 + v25 + v28 + fmax(v47 + v48 + v33 + v37, fmax(v15, v50)) * 2.0;
  }
  else
  {
    v38 = v50 + v15 + v49 + v25 + v28;
  }
  v39 = v51 + v52 + v30;
  v40 = 20.0;
  if (v53 != 0.0)
    v40 = v53;
  if (v38 <= v9 || v9 <= 0.0)
    v42 = v38;
  else
    v42 = v9;
  if (v38 >= v54)
    v43 = v42;
  else
    v43 = v54;
  if (v39 <= v11 || v11 <= 0.0)
    v45 = v51 + v52 + v30;
  else
    v45 = v11;
  if (v39 >= v40)
    v46 = v45;
  else
    v46 = v40;
  if (v56 > 0.0)
    v43 = v56;
  if (v55 > 0.0)
    v46 = v55;
  result.height = v46;
  result.width = v43;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  double *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  unint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  CGFloat v61;
  void *v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  double Width;
  CGFloat v68;
  CGFloat v69;
  double v70;
  CGFloat Height;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double x;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  CGFloat v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  double v99;
  CGFloat v100;
  CGFloat v101;
  CGFloat v102;
  double v103;
  CGFloat v104;
  double v105;
  double v106;
  double v107;
  CGFloat v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double rect;
  objc_super v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;

  v115.receiver = self;
  v115.super_class = (Class)TVButtonContent;
  -[_UIFloatingContentView layoutSubviews](&v115, sel_layoutSubviews);
  -[TVButtonContent bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView tv_padding](self, "tv_padding");
  v12 = v11;
  v14 = v13;
  v101 = v10;
  v102 = v6;
  v111 = v10 - (v15 + v16);
  v112 = v6 + v15;
  -[TVButtonContent textContentView](self, "textContentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "tv_alignment");

  -[TVButtonContent accessoryView](self, "accessoryView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "tv_alignment");

  -[TVButtonContent accessoryView](self, "accessoryView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (double *)MEMORY[0x24BDBF148];
  v108 = v8;
  if (v21)
  {
    -[TVButtonContent accessoryView](self, "accessoryView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sizeThatFits:", *v22, v22[1]);
    v25 = v24;
    v27 = v26;

    -[TVButtonContent accessoryView](self, "accessoryView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "tv_margin");
    v30 = v29;
    v32 = v31;

    if (v20 == 1)
    {
      v33 = v12 + v30;
    }
    else
    {
      v116.origin.x = v4;
      v116.size.height = v101;
      v116.origin.y = v102;
      v116.size.width = v8;
      v33 = CGRectGetWidth(v116) - v14 - v25 - v32;
    }
    v35 = v32 + v25 + v30;
    v36 = v12 + v35;
    v37 = v14 + v35;
    v38 = v18 & 0xFFFFFFFFFFFFFFFDLL;
    if (v20 == 1)
      v39 = v36;
    else
      v39 = v37;
    v40 = fmax(v39, fmax(v12, v14));
    v41 = fmax(v36, v12);
    if (v20 != 1)
      v41 = v12;
    v42 = fmax(v37, v14);
    if (v20 == 1)
      v42 = v14;
    v43 = v41 + v42;
    if (v38 == 1)
      v12 = v41;
    else
      v12 = v40;
    if (v38 == 1)
      v34 = v43;
    else
      v34 = v40 + v40;
    -[TVButtonContent accessoryView](self, "accessoryView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setFrame:", v33, v112 + floor((v111 - v27) * 0.5), v25, v27);

    v8 = v108;
  }
  else
  {
    v34 = v12 + v14;
  }
  v109 = v8 - v34;
  -[TVButtonContent imageView](self, "imageView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    -[TVButtonContent textContentView](self, "textContentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
      v47 = !-[TVButtonContent imageTrailsTextContent](self, "imageTrailsTextContent");
    else
      v47 = 1;

  }
  else
  {
    v47 = 1;
  }
  v99 = v4;
  v105 = v4 + v12;

  -[TVButtonContent _imageMarginFromText](self, "_imageMarginFromText");
  v110 = v48;
  v49 = *MEMORY[0x24BDBF090];
  v50 = *(double *)(MEMORY[0x24BDBF090] + 8);
  -[TVButtonContent textContentView](self, "textContentView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "tv_alignmentInsetsForExpectedWidth:", 0.0);
  v106 = v52;
  v103 = v53;

  -[TVButtonContent imageView](self, "imageView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = *v22;
  v56 = v22[1];
  objc_msgSend(v54, "sizeThatFits:", *v22, v56);
  v58 = v57;
  v60 = v59;

  v117.origin.x = v49;
  v117.origin.y = v50;
  v117.size.width = v58;
  v117.size.height = v60;
  v61 = v112 + floor((v111 - CGRectGetHeight(v117)) * 0.5);
  -[TVButtonContent textContentView](self, "textContentView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "sizeThatFits:", v55, v56);
  v64 = v63;
  v66 = v65;

  v118.origin.x = v49;
  v118.origin.y = v50;
  v118.size.width = v64;
  v118.size.height = v66;
  Width = CGRectGetWidth(v118);
  v119.origin.x = v49;
  v68 = v61;
  v119.origin.y = v61;
  rect = v58;
  v119.size.width = v58;
  v104 = v60;
  v119.size.height = v60;
  v120.size.width = fmin(Width, v109 - (v110 + CGRectGetWidth(v119)));
  v69 = v49;
  v120.origin.x = v49;
  v120.origin.y = v50;
  v70 = v120.size.width;
  v113 = v66;
  v120.size.height = v66;
  Height = CGRectGetHeight(v120);
  v73 = v111;
  v72 = v112;
  v74 = v112 + floor((v111 - (Height - (v106 + v103))) * 0.5) - v106;
  v107 = v74;
  if (v18 == 3)
  {
    v81 = v105;
    v82 = v109;
    v83 = CGRectGetWidth(*(CGRect *)(&v72 - 1));
    v122.origin.x = v69;
    v122.origin.y = v74;
    v122.size.width = v70;
    v122.size.height = v113;
    v84 = v105 + v83 - CGRectGetWidth(v122);
    if ((v47 & 1) != 0)
    {
      x = v84 + 0.0;
      v123.origin.x = v69;
      v77 = v68;
      v123.origin.y = v68;
      v123.size.width = rect;
      v76 = v104;
      v123.size.height = v104;
      v85 = -(v110 + CGRectGetWidth(v123));
    }
    else
    {
      v127.origin.x = v69;
      v77 = v68;
      v127.origin.y = v68;
      v127.size.width = rect;
      v76 = v104;
      v127.size.height = v104;
      v128.origin.x = v84 - (v110 + CGRectGetWidth(v127));
      v128.origin.y = v74;
      x = v128.origin.x;
      v128.size.width = v70;
      v128.size.height = v113;
      v85 = v110 + CGRectGetWidth(v128);
    }
    v80 = x + v85;
  }
  else if (v18 == 1)
  {
    v75 = 0.0;
    v76 = v60;
    v77 = v68;
    if (v47)
    {
      v121.origin.x = v69;
      v121.origin.y = v68;
      v121.size.width = v58;
      v121.size.height = v104;
      v75 = v110 + CGRectGetWidth(v121);
    }
    x = v105 + v75;
    v79 = v110 + v70;
    if (v47)
      v79 = 0.0;
    v80 = v105 + v79;
  }
  else
  {
    v124.origin.x = v69;
    v124.origin.y = v74;
    v124.size.width = v70;
    v124.size.height = v113;
    v86 = CGRectGetWidth(v124);
    v125.origin.x = v69;
    v77 = v68;
    v125.origin.y = v68;
    v125.size.width = rect;
    v76 = v104;
    v125.size.height = v104;
    v87 = v105 + floor((v109 - (v110 + v86 + CGRectGetWidth(v125))) * 0.5);
    if (v47)
    {
      v126.origin.x = v69;
      v126.origin.y = v68;
      v126.size.width = rect;
      v126.size.height = v104;
      x = v87 + v110 + CGRectGetWidth(v126);
      v88 = 0.0;
    }
    else
    {
      v129.origin.x = v87 + 0.0;
      v129.origin.y = v74;
      v129.size.width = v70;
      v129.size.height = v113;
      v88 = v110 + CGRectGetWidth(v129);
      x = v87 + 0.0;
    }
    v80 = v87 + v88;
  }
  if (-[TVButtonContent effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection", *(_QWORD *)&v99) == 1)
  {
    v89 = _TVMLRectWithFlippedOriginRelativeToBoundingRect(x, v107, v70, v113, v100, v102, v108, v101);
    v91 = v90;
    v113 = v92;
    v70 = v93;
    x = v89;
    v80 = _TVMLRectWithFlippedOriginRelativeToBoundingRect(v80, v77, rect, v76, v100, v102, v108, v101);
    v77 = v94;
    rect = v95;
    v76 = v96;
  }
  else
  {
    v91 = v107;
  }
  -[TVButtonContent textContentView](self, "textContentView");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setFrame:", x, v91, v70, v113);

  -[TVButtonContent imageView](self, "imageView");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setFrame:", v80, v77, rect, v76);

}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  if (v4)
  {
    -[TVButtonContent traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "userInterfaceStyle"))
    {
      objc_msgSend(v4, "userInterfaceStyle");
      -[TVButtonContent traitCollection](self, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userInterfaceStyle");

    }
  }
  v7.receiver = self;
  v7.super_class = (Class)TVButtonContent;
  -[_UIFloatingContentView traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);

}

- (double)_imageMarginFromText
{
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  -[TVButtonContent imageView](self, "imageView");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  if (v3)
  {
    v5 = (void *)v3;
    -[TVButtonContent textContentView](self, "textContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = -[TVButtonContent imageTrailsTextContent](self, "imageTrailsTextContent");
      -[TVButtonContent imageView](self, "imageView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tv_margin");
      v10 = v9;
      v12 = v11;

      -[TVButtonContent textContentView](self, "textContentView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "tv_margin");
      v15 = v14;
      v17 = v16;

      v18 = fmax(v17, v10);
      v19 = fmax(v12, v15);
      if (v7)
        return v18;
      else
        return v19;
    }
  }
  return v4;
}

- (void)setSelected:(BOOL)a3
{
  -[TVButtonContent setSelected:animated:](self, "setSelected:animated:", a3, 0);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TVButtonContent;
  -[UIView setHighlighted:](&v5, sel_setHighlighted_);
  -[TVButtonContent setSelected:animated:](self, "setSelected:animated:", v3, 0);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  -[TVButtonContent _setFocused:animationCoordinator:](self, "_setFocused:animationCoordinator:", a3, 0);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  -[TVButtonContent _setFocused:animationCoordinator:](self, "_setFocused:animationCoordinator:", a3, a5);
}

- (void)_setFocused:(BOOL)a3 animationCoordinator:(id)a4
{
  if (self->_focused != a3)
  {
    self->_focused = a3;
    -[TVButtonContent _updateFocusStateWithCoordinator:](self, "_updateFocusStateWithCoordinator:", a4);
  }
}

- (void)_updateFloaingViewFocusState:(BOOL)a3 coordinator:(id)a4
{
  uint64_t v4;

  if (a3)
    v4 = 8;
  else
    v4 = 0;
  -[_UIFloatingContentView setControlState:withAnimationCoordinator:](self, "setControlState:withAnimationCoordinator:", v4, a4);
}

- (void)_updateFocusStateWithCoordinator:(id)a3
{
  _BOOL8 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  _QWORD v15[6];

  v5 = -[TVButtonContent isFocused](self, "isFocused");
  if (v5)
    v6 = 8;
  else
    v6 = 0;
  -[TVButtonContent _updateBackgroundColorForState:](self, "_updateBackgroundColorForState:", v6);
  -[TVButtonContent textContentView](self, "textContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHighlighted:", v5);

  -[TVButtonContent textContentView](self, "textContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMarqueeEnabled:", v5);

  -[TVButtonContent textContentView](self, "textContentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMarqueeRunning:", v5);

  if (v5)
  {
    v10 = 0.2;
  }
  else
  {
    -[TVButtonContent textContentView](self, "textContentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLineBreakMode:", 4);

    v10 = 1.0;
  }
  -[TVButtonContent imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSelected:animated:", v5, 0);

  -[TVButtonContent accessoryView](self, "accessoryView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSelected:animated:", v5, 0);

  v14 = 0.37;
  if (!a3)
    v14 = 0.0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __52__TVButtonContent__updateFocusStateWithCoordinator___block_invoke;
  v15[3] = &unk_24EB85540;
  v15[4] = self;
  *(double *)&v15[5] = v10;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 327684, v15, 0, v14, 0.0);
}

void __52__TVButtonContent__updateFocusStateWithCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "textContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", *(double *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", *(double *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "accessoryView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", *(double *)(a1 + 40));

}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (UIVisualEffectView)backdropView
{
  return self->_backdropView;
}

- (BOOL)isFocused
{
  return self->_focused;
}

- (int64_t)backdropStyle
{
  return self->_backdropStyle;
}

- (BOOL)blurEnabled
{
  return self->_blurEnabled;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (double)focusSizeIncrease
{
  return self->_focusSizeIncrease;
}

- (void)setFocusSizeIncrease:(double)a3
{
  self->_focusSizeIncrease = a3;
}

- (BOOL)imageTrailsTextContent
{
  return self->_imageTrailsTextContent;
}

- (void)setImageTrailsTextContent:(BOOL)a3
{
  self->_imageTrailsTextContent = a3;
}

- (_TVImageView)imageView
{
  return self->_imageView;
}

- (UILabel)textContentView
{
  return self->_textContentView;
}

- (_TVImageView)accessoryView
{
  return self->_accessoryView;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (IKViewElement)viewElement
{
  return self->_viewElement;
}

- (void)setViewElement:(id)a3
{
  objc_storeStrong((id *)&self->_viewElement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_textContentView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->__backgroundColor, 0);
}

@end
