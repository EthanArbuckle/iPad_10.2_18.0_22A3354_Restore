@implementation UICalloutBarBackground

- (UICalloutBarBackground)initWithVisualStyle:(id)a3
{
  id v5;
  UICalloutBarBackground *v6;
  UIVisualEffectView *v7;
  UIVisualEffectView *blurView;
  void *v9;
  void *v10;
  void *v11;
  UIImageView *v12;
  UIImageView *selectionTintView;
  void *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UICalloutBarBackground;
  v6 = -[UIView init](&v16, sel_init);
  objc_storeStrong((id *)&v6->m_visualStyle, a3);
  v7 = objc_alloc_init(UIVisualEffectView);
  blurView = v6->_blurView;
  v6->_blurView = v7;

  -[UICalloutBarBackground containerBackgroundColor](v6, "containerBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UICalloutBarBackground containerBackgroundColor](v6, "containerBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6->_blurView, "setBackgroundColor:", v10);

    -[UIVisualEffectView setBackgroundEffects:](v6->_blurView, "setBackgroundEffects:", MEMORY[0x1E0C9AA60]);
  }
  else
  {
    -[UICalloutBarBackground blurViewBackgroundEffects](v6, "blurViewBackgroundEffects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setBackgroundEffects:](v6->_blurView, "setBackgroundEffects:", v11);

  }
  -[UIView setAutoresizingMask:](v6->_blurView, "setAutoresizingMask:", 18);
  -[UIVisualEffectView _setGroupName:](v6->_blurView, "_setGroupName:", CFSTR("UICalloutBarBackground"));
  -[UIView addSubview:](v6, "addSubview:", v6->_blurView);
  v12 = objc_alloc_init(UIImageView);
  selectionTintView = v6->_selectionTintView;
  v6->_selectionTintView = v12;

  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.8, 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setTintColor:](v6->_selectionTintView, "setTintColor:", v14);

  -[UIView setAutoresizingMask:](v6->_selectionTintView, "setAutoresizingMask:", 18);
  -[UIImageView setHidden:](v6->_selectionTintView, "setHidden:", 1);
  -[UIView addSubview:](v6, "addSubview:", v6->_selectionTintView);

  return v6;
}

- (double)cornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[_UICalloutBarVisualStyle barMetrics](self->m_visualStyle, "barMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cornerRadius");
  v4 = v3;

  return v4;
}

- (id)containerBackgroundColor
{
  void *v2;
  void *v3;

  -[_UICalloutBarVisualStyle barMetrics](self->m_visualStyle, "barMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)prefersCustomSelection
{
  void *v2;
  char v3;

  -[_UICalloutBarVisualStyle buttonMetrics](self->m_visualStyle, "buttonMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "prefersCustomSelection");

  return v3;
}

- (id)blurViewBackgroundEffects
{
  void *v2;
  void *v3;

  -[_UICalloutBarVisualStyle barMetrics](self->m_visualStyle, "barMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "blurViewBackgroundEffects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)layoutSubviews
{
  int has_internal_diagnostics;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  int v21;
  int v22;
  int v23;
  BOOL v24;
  int v25;
  int v26;
  double v27;
  double v28;
  int *ContextStack;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double x;
  double width;
  CGFloat height;
  double v38;
  double v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  double v69;
  double v70;
  double MinX;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  double v88;
  int *v89;
  objc_class *v90;
  void *v91;
  void *v92;
  void *v93;
  double v94;
  void *v95;
  void *v96;
  double v97;
  void *v98;
  void *v99;
  double v100;
  CGFloat y;
  CGFloat v102;
  objc_super v103;
  CGSize v104;
  CGSize v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v103.receiver = self;
  v103.super_class = (Class)UICalloutBarBackground;
  -[UIView layoutSubviews](&v103, sel_layoutSubviews);
  +[UICalloutBar sharedCalloutBar](UICalloutBar, "sharedCalloutBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controlFrame");
  objc_msgSend(v5, "convertRect:fromView:", 0);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UIView bounds](self, "bounds");
  v15 = v14;
  v17 = v16;
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  v19 = v18;
  if (v15 != *MEMORY[0x1E0C9D820] || v17 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v21 = objc_msgSend(v5, "targetDirection");
    v22 = objc_msgSend(v5, "targetDirection");
    v23 = v22;
    v24 = v21 == 3 || v22 == 4;
    v25 = v24;
    if (v24)
    {
      v26 = objc_msgSend(v5, "isDisplayingVertically");
      v27 = 18.0;
      if (v26)
        v27 = 9.0;
      v28 = 0.0;
      if (v21 == 3)
        v28 = v27;
      v7 = v7 + v28;
      v11 = v11 - v27;
    }
    _UIGraphicsBeginImageContextWithOptions(0, 0, v15, v17, v19);
    ContextStack = (int *)GetContextStack(0);
    if (*ContextStack >= 1 && *(_QWORD *)&ContextStack[6 * (*ContextStack - 1) + 2])
    {
LABEL_22:
      +[UIColor blackColor](UIColor, "blackColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "set");

      v106.origin.x = round(v19 * v7) / v19;
      v106.origin.y = round(v9 * v19) / v19;
      v106.size.width = round(v19 * v11) / v19;
      v106.size.height = round(v13 * v19) / v19;
      v107 = CGRectIntegral(v106);
      x = v107.origin.x;
      y = v107.origin.y;
      width = v107.size.width;
      height = v107.size.height;
      if ((objc_msgSend(v5, "isDisplayingVertically") & 1) != 0)
      {
        if (v25)
        {
          if (v21 == 3)
            objc_msgSend(v5, "pointRightOfControls");
          else
            objc_msgSend(v5, "pointLeftOfControls");
          objc_msgSend(v5, "convertPoint:fromView:", 0);
          v62 = round(v19 * v61) / v19;
          v64 = round(v19 * v63) / v19;
          +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = v64 + -9.0;
          v65 = x;
          if (v21 == 3)
          {
            v66 = y;
            v67 = width;
            v68 = height;
            v69 = CGRectGetMinX(*(CGRect *)&v65) + -9.0;
            if (v62 >= v69)
              v69 = v62;
            v70 = v64;
            objc_msgSend(v50, "moveToPoint:", v69, v64);
            v108.origin.x = x;
            v108.origin.y = y;
            v108.size.width = width;
            v108.size.height = height;
            objc_msgSend(v50, "addLineToPoint:", CGRectGetMinX(v108), v100);
            v109.origin.x = x;
            v109.origin.y = y;
            v109.size.width = width;
            v109.size.height = height;
            MinX = CGRectGetMinX(v109);
          }
          else
          {
            v72 = y;
            v73 = width;
            v74 = height;
            v75 = CGRectGetMaxX(*(CGRect *)&v65) + 9.0;
            if (v62 < v75)
              v75 = v62;
            v70 = v64;
            objc_msgSend(v50, "moveToPoint:", v75, v64);
            v110.origin.x = x;
            v110.origin.y = y;
            v110.size.width = width;
            v110.size.height = height;
            objc_msgSend(v50, "addLineToPoint:", CGRectGetMaxX(v110), v100);
            v111.origin.x = x;
            v111.origin.y = y;
            v111.size.width = width;
            v111.size.height = height;
            MinX = CGRectGetMaxX(v111);
          }
          objc_msgSend(v50, "addLineToPoint:", MinX, v70 + 9.0);
          v51 = -1;
          v48 = y;
        }
        else
        {
          objc_msgSend(v5, "targetPoint");
          objc_msgSend(v5, "convertPoint:fromView:", 0);
          v43 = round(v19 * v42) / v19;
          v45 = round(v19 * v44) / v19;
          v46 = (int)objc_msgSend(v5, "targetDirection");
          -[UICalloutBarBackground cornerRadius](self, "cornerRadius");
          v47 = v45;
          v48 = y;
          ArrowBezierPath(v46, v43, v47, x, y, width, height, v49, v19);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = -1;
        }
      }
      else
      {
        if (v21 == 3)
        {
          -[UICalloutBarBackground cornerRadius](self, "cornerRadius");
          x = x + v38;
          -[UICalloutBarBackground cornerRadius](self, "cornerRadius");
          width = width - v39;
        }
        if (v23 == 4)
        {
          -[UICalloutBarBackground cornerRadius](self, "cornerRadius");
          v40 = 0;
          width = width - v41;
        }
        else
        {
          v40 = 10;
        }
        v52 = 5;
        if (v21 == 3)
          v52 = 0;
        v51 = v40 | v52;
        objc_msgSend(v5, "targetPoint");
        objc_msgSend(v5, "convertPoint:fromView:", 0);
        v54 = round(v19 * v53) / v19;
        v56 = round(v19 * v55) / v19;
        v57 = (int)objc_msgSend(v5, "targetDirection");
        -[UICalloutBarBackground cornerRadius](self, "cornerRadius");
        v59 = v58;
        v60 = v54;
        v48 = y;
        ArrowBezierPath(v57, v60, v56, x, y, width, height, v59, v19);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v50, "fill");

      -[UICalloutBarBackground cornerRadius](self, "cornerRadius");
      v77 = v76;
      -[UICalloutBarBackground cornerRadius](self, "cornerRadius");
      +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v51, x, v48, width, height, v77, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "fill");

      _UIGraphicsGetImageFromCurrentImageContext(0);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView _setMaskImage:](self->_blurView, "_setMaskImage:", v80);
      UIGraphicsEndImageContext();
      -[UIImageView setBackgroundColor:](self->_selectionTintView, "setBackgroundColor:", 0);
      if (CGRectIsEmpty(self->_highlightRect)
        || -[UICalloutBarBackground prefersCustomSelection](self, "prefersCustomSelection"))
      {
        -[UIImageView setHidden:](self->_selectionTintView, "setHidden:", 1);
LABEL_47:

        goto LABEL_48;
      }
      v81 = self->_highlightRect.origin.y;
      v102 = self->_highlightRect.origin.x;
      v82 = self->_highlightRect.size.width;
      v83 = self->_highlightRect.size.height;
      objc_msgSend(v80, "size");
      v85 = v84;
      v87 = v86;
      objc_msgSend(v80, "scale");
      _UIGraphicsBeginImageContextWithOptions(0, 0, v85, v87, v88);
      v89 = (int *)GetContextStack(0);
      if (*v89 < 1 || !*(_QWORD *)&v89[6 * (*v89 - 1) + 2])
      {
        if (!has_internal_diagnostics)
          goto LABEL_47;
        v90 = (objc_class *)objc_opt_class();
        NSStringFromClass(v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v105.width = v15;
        v105.height = v17;
        NSStringFromCGSize(v105);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("NULL Context in [%@ %@] - size = %@ - scale = %g line = %d"), v91, v92, v93, *(_QWORD *)&v19, 460);

      }
      if ((objc_msgSend(v5, "isDisplayingVertically") & 1) == 0)
      {
        objc_msgSend(v80, "size");
        v83 = v94;
        v81 = 0.0;
      }
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 1.0);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "set");

      UIRectFillUsingOperation(1, v102, v81, v82, v83);
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v96, "_graphicsQuality") == 10)
        v97 = 0.75;
      else
        v97 = 0.4;
      objc_msgSend(v80, "drawAtPoint:blendMode:alpha:", 18, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v97);

      _UIGraphicsGetImageFromCurrentImageContext(0);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "imageWithRenderingMode:", 2);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](self->_selectionTintView, "setImage:", v99);

      -[UIImageView setHidden:](self->_selectionTintView, "setHidden:", 0);
      UIGraphicsEndImageContext();
      goto LABEL_47;
    }
    if (has_internal_diagnostics)
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v104.width = v15;
      v104.height = v17;
      NSStringFromCGSize(v104);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("NULL Context in [%@ %@] - size = %@ - scale = %g line = %d"), v31, v32, v33, *(_QWORD *)&v19, 407);

      goto LABEL_22;
    }
  }
LABEL_48:

}

- (void)setHighlighted:(BOOL)a3 forFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGRect v13;
  CGRect v14;

  if (a3)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
  }
  else
  {
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  -[UICalloutBarBackground highlightRect](self, "highlightRect");
  v14.origin.x = v9;
  v14.origin.y = v10;
  v14.size.width = v11;
  v14.size.height = v12;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    -[UICalloutBarBackground setHighlightRect:](self, "setHighlightRect:", x, y, width, height);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (_UICalloutBarVisualStyle)visualStyle
{
  return self->m_visualStyle;
}

- (void)setVisualStyle:(id)a3
{
  objc_storeStrong((id *)&self->m_visualStyle, a3);
}

- (CGRect)highlightRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_highlightRect.origin.x;
  y = self->_highlightRect.origin.y;
  width = self->_highlightRect.size.width;
  height = self->_highlightRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setHighlightRect:(CGRect)a3
{
  self->_highlightRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_visualStyle, 0);
  objc_storeStrong((id *)&self->_selectionTintView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end
