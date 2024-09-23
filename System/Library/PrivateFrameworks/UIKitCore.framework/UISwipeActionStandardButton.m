@implementation UISwipeActionStandardButton

- (UISwipeActionStandardButton)initWithFrame:(CGRect)a3
{
  UISwipeActionStandardButton *v3;
  UIView *v4;
  UIView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UISwipeActionStandardButton;
  v3 = -[UISwipeActionButton initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIView alloc];
    -[UIView bounds](v3, "bounds");
    v5 = -[UIView initWithFrame:](v4, "initWithFrame:");
    -[UISwipeActionButton setBackgroundView:](v3, "setBackgroundView:", v5);

    -[UISwipeActionButton visualStyle](v3, "visualStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "defaultButtonBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISwipeActionButton backgroundView](v3, "backgroundView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

    -[UISwipeActionButton backgroundView](v3, "backgroundView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v3, "addSubview:", v9);

    -[UIView setClipsToBounds:](v3, "setClipsToBounds:", 0);
    -[UIButton _visualProvider](v3, "_visualProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAvoidDefaultTitleAndImageLayout:", 1);

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  int isRenderingText;
  double v14;
  UISwipeActionStandardButton *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
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
  double v44;
  double v45;
  void *v46;
  void *v47;
  _BYTE *v48;
  uint64_t v49;
  CGFloat v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double MinY;
  CGFloat v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  CGFloat v69;
  CGFloat v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  CGFloat MinX;
  double MaxY;
  double v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  void *v94;
  void *v95;
  double v96;
  CGFloat v97;
  double v98;
  CGFloat v99;
  double v100;
  double width;
  double v102;
  double v103;
  CGFloat rect;
  CGFloat v105;
  CGFloat v106;
  double v107;
  CGFloat v108;
  double v109;
  objc_super v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;

  *(_BYTE *)&self->_flags |= 1u;
  v110.receiver = self;
  v110.super_class = (Class)UISwipeActionStandardButton;
  -[UIButton layoutSubviews](&v110, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[UIButton contentRectForBounds:](self, "contentRectForBounds:");
  -[UISwipeActionButton _allowableContentRectForContentRect:](self, "_allowableContentRectForContentRect:");
  v4 = v3;
  v108 = v5;
  v7 = v6;
  v9 = v8;
  -[UIButton _currentImageWithResolvedConfiguration](self, "_currentImageWithResolvedConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton currentImage](self, "currentImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v10, "size");
    -[UIView frame](self, "frame");
    -[UISwipeActionButton _defaultLayoutForHeight:](self, "_defaultLayoutForHeight:", v12);
    isRenderingText = _isRenderingText(self);
    v14 = 1.0;
    if ((isRenderingText & 1) == 0)
    {
      v15 = self;
      -[UIView bounds](v15, "bounds");
      v16 = -[UISwipeActionButton _defaultLayoutForHeight:](v15, "_defaultLayoutForHeight:", CGRectGetHeight(v111));

      if (v16 == 2)
        v14 = 0.8;
      else
        v14 = 1.0;
    }
    objc_msgSend(v10, "size");
    if (v17 > 0.0)
    {
      objc_msgSend(v10, "size");
      if (v18 > v7)
      {
        objc_msgSend(v10, "size");
        v20 = v7 / v19;
        if (v14 >= v20)
          v14 = v20;
      }
    }
    objc_msgSend(v10, "size");
    if (v21 > 0.0)
    {
      objc_msgSend(v10, "size");
      if (v22 > v9)
      {
        objc_msgSend(v10, "size");
        if (v14 >= v9 / v23)
          v14 = v9 / v23;
      }
    }
    if (fabs(v14 + -1.0) >= 2.22044605e-16)
    {
      -[UIButton imageView](self, "imageView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setContentMode:", 1);

    }
    v25 = _UITableCellLineHeightCenteredImageInRect(v10, v14, v4, v108, v7, v9);
    v27 = v26;
    v29 = v28;
    v31 = v30;
    -[UISwipeActionStandardButton titleLabel](self, "titleLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setHidden:", isRenderingText ^ 1u);

    if ((isRenderingText & 1) != 0)
    {
      v106 = v27;
      -[UISwipeActionStandardButton titleLabel](self, "titleLabel");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bounds](self, "bounds");
      objc_msgSend(v33, "sizeThatFits:", v34, v35);
      v102 = v36;

      -[UISwipeActionStandardButton titleLabel](self, "titleLabel");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "font");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "scale");
      v100 = v40;

      objc_msgSend(v38, "lineHeight");
      v42 = v41;
      -[UISwipeActionButton visualStyle](self, "visualStyle");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "iconToTitleSpacing");
      v45 = v42 + v44;

      objc_msgSend(v10, "symbolConfiguration");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v46;
      v105 = v31;
      v98 = v45;
      if (v46)
      {
        v109 = 0.0;
        v48 = v46;
        if ((v48[40] & 1) == 0)
        {
          +[UIImageSymbolConfiguration unspecifiedConfiguration](UIImageSymbolConfiguration, "unspecifiedConfiguration");
          v49 = objc_claimAutoreleasedReturnValue();

          v48 = (_BYTE *)v49;
        }
        v50 = v29;
        objc_msgSend(v48, "_deriveGlyphSize:weight:pointSize:", 0, 0, &v109);
        objc_msgSend(off_1E167A828, "systemFontOfSize:", v109);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "baselineOffsetFromBottom");
        v53 = -v52;
        objc_msgSend(v51, "descender");
        v96 = v53 - v54;

      }
      else
      {
        v50 = v29;
        v96 = 0.0;
      }
      v112.origin.x = v4;
      v112.origin.y = v108;
      v112.size.width = v7;
      v112.size.height = v9;
      MinY = CGRectGetMinY(v112);
      v113.origin.x = v25;
      v113.size.width = v50;
      rect = v7;
      v97 = v9;
      v63 = v4;
      v113.origin.y = v106;
      v113.size.height = v105;
      v64 = CGRectGetMinY(v113);
      UIRoundToScale(v98 * 0.5, v100);
      v66 = v64 - v65;
      if (MinY >= v66)
        v67 = MinY;
      else
        v67 = v66;
      v68 = v25;
      v107 = v67;
      v99 = v50;
      v69 = v50;
      v70 = v105;
      v71 = v96 + CGRectGetMaxY(*(CGRect *)(&v67 - 1));
      -[UISwipeActionButton visualStyle](self, "visualStyle");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "iconToTitleSpacing");
      UIRoundToScale(v71 + v73, v100);
      v75 = v74;

      v114.origin.x = v63;
      v114.origin.y = v108;
      v114.size.width = rect;
      v114.size.height = v97;
      v76 = CGRectGetMaxY(v114) - v75;
      if (v76 >= v102)
        v77 = v102;
      else
        v77 = v76;
      v115.origin.x = v63;
      v115.origin.y = v108;
      v115.size.width = rect;
      v115.size.height = v97;
      MinX = CGRectGetMinX(v115);
      v116.origin.x = v63;
      v116.origin.y = v108;
      v116.size.width = rect;
      v116.size.height = v97;
      v117.size.width = CGRectGetWidth(v116);
      width = v117.size.width;
      v103 = MinX;
      v117.origin.x = MinX;
      v117.origin.y = v75;
      v117.size.height = v77;
      MaxY = CGRectGetMaxY(v117);
      v118.origin.x = v63;
      v118.origin.y = v108;
      v118.size.width = rect;
      v118.size.height = v97;
      v80 = MaxY - CGRectGetMaxY(v118);
      if (v80 <= 0.0)
      {
        v27 = v107;
        v29 = v99;
      }
      else
      {
        v119.origin.x = v25;
        v119.size.height = v105;
        v119.origin.y = v107;
        v119.size.width = v99;
        v81 = CGRectGetMinY(v119);
        v120.origin.x = v63;
        v120.origin.y = v108;
        v120.size.width = rect;
        v120.size.height = v97;
        v82 = v81 - CGRectGetMinY(v120);
        if (v82 >= v80)
          v82 = v80;
        v27 = v107 - v82;
        v75 = v75 - v82;
        v29 = v99;
      }
      -[UISwipeActionStandardButton titleLabel](self, "titleLabel", *(_QWORD *)&v63);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "setFrame:", v103, v75, width, v77);

      v31 = v105;
    }
    -[UIButton imageView](self, "imageView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    v58 = v25;
    v59 = v27;
    v60 = v29;
    v61 = v31;
  }
  else
  {
    -[UISwipeActionStandardButton titleLabel](self, "titleLabel");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setHidden:", 0);

    -[UISwipeActionStandardButton titleLabel](self, "titleLabel");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    v58 = v4;
    v59 = v108;
    v60 = v7;
    v61 = v9;
  }
  objc_msgSend(v56, "setFrame:", v58, v59, v60, v61);

  -[UIView bounds](self, "bounds");
  v85 = v84;
  v87 = v86;
  v89 = v88;
  -[UISwipeActionStandardButton extensionLength](self, "extensionLength");
  v91 = v90;
  -[UIView bounds](self, "bounds");
  v92 = CGRectGetWidth(v121);
  if (v91 < v92)
    v91 = v92;
  if (-[UIControl contentHorizontalAlignment](self, "contentHorizontalAlignment") == UIControlContentHorizontalAlignmentRight)
  {
    -[UIView bounds](self, "bounds");
    v93 = CGRectGetWidth(v122);
    v123.origin.x = v85;
    v123.origin.y = v87;
    v123.size.width = v91;
    v123.size.height = v89;
    v85 = v93 - CGRectGetWidth(v123);
  }
  -[UISwipeActionButton backgroundView](self, "backgroundView");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setFrame:", v85, v87, v91, v89);

  -[UISwipeActionButton backgroundView](self, "backgroundView");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView sendSubviewToBack:](self, "sendSubviewToBack:", v95);

  *(_BYTE *)&self->_flags &= ~1u;
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISwipeActionStandardButton;
  -[UISwipeActionButton setTitle:forState:](&v5, sel_setTitle_forState_, a3, a4);
  self->_buttonWidth = 0.0;
}

- (double)buttonWidth
{
  double result;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  UISwipeActionStandardButton *v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  objc_super v41;
  CGRect v42;
  CGRect v43;

  if (-[UISwipeActionButton autosizes](self, "autosizes"))
  {
    result = self->_buttonWidth;
    if (result == 0.0)
    {
      -[UIButton _currentImageWithResolvedConfiguration](self, "_currentImageWithResolvedConfiguration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISwipeActionButton _horizontalPaddingForCurrentIdiom](self, "_horizontalPaddingForCurrentIdiom");
      v6 = v5;
      if (dyld_program_sdk_at_least()
        && (-[UIButton currentImage](self, "currentImage"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v7,
            v7))
      {
        -[UISwipeActionStandardButton titleLabel](self, "titleLabel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isHidden") & 1) == 0)
        {
          -[UISwipeActionStandardButton titleLabel](self, "titleLabel");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "text");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "length");

        }
        -[UIView bounds](self, "bounds");
        -[UISwipeActionButton _defaultLayoutForHeight:](self, "_defaultLayoutForHeight:", CGRectGetHeight(v42));
        objc_msgSend(v4, "size");
        v12 = v11;
        v13 = self;
        -[UIView bounds](v13, "bounds");
        v14 = -[UISwipeActionButton _defaultLayoutForHeight:](v13, "_defaultLayoutForHeight:", CGRectGetHeight(v43));

        v15 = 0.8;
        if (v14 != 2)
          v15 = 1.0;
        v16 = v12 * v15;
        -[UISwipeActionStandardButton titleLabel](v13, "titleLabel");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView bounds](v13, "bounds");
        objc_msgSend(v17, "sizeThatFits:", v18, v19);
        v21 = v20;

        if ((_isRenderingText(v13) & (v16 < v21)) != 0)
          v22 = v21;
        else
          v22 = v16;
        -[UISwipeActionButton visualStyle](v13, "visualStyle");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "maxButtonWidth");
        v25 = v24;

        -[UISwipeActionButton visualStyle](v13, "visualStyle");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "defaultButtonWidth");
        v28 = v27;

        v29 = v6 + v6 + v22;
        if (v28 >= v29)
          v29 = v28;
        if (v25 < v29)
          v29 = v25;
      }
      else
      {
        -[UISwipeActionStandardButton titleLabel](self, "titleLabel");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView bounds](self, "bounds");
        objc_msgSend(v30, "sizeThatFits:", v31, v32);
        v34 = v33;

        -[UISwipeActionButton visualStyle](self, "visualStyle");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "maxButtonWidth");
        v37 = v36;

        -[UISwipeActionButton visualStyle](self, "visualStyle");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "defaultButtonWidth");
        v40 = v39;

        v29 = v6 + v6 + v34;
        if (v40 >= v29)
          v29 = v40;
        if (v37 < v29)
          v29 = v37;
      }
      self->_buttonWidth = v29;

      return self->_buttonWidth;
    }
  }
  else
  {
    v41.receiver = self;
    v41.super_class = (Class)UISwipeActionStandardButton;
    -[UISwipeActionButton buttonWidth](&v41, sel_buttonWidth);
  }
  return result;
}

- (id)titleLabel
{
  objc_super v4;

  if ((*(_BYTE *)&self->_flags & 1) == 0)
    -[UIButton setNeedsLayout](self, "setNeedsLayout");
  v4.receiver = self;
  v4.super_class = (Class)UISwipeActionStandardButton;
  -[UIButton titleLabel](&v4, sel_titleLabel);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)extensionLength
{
  return self->_extensionLength;
}

- (void)setExtensionLength:(double)a3
{
  self->_extensionLength = a3;
}

@end
