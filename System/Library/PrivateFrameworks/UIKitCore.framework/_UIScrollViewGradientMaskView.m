@implementation _UIScrollViewGradientMaskView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_UIScrollViewGradientMaskView)initWithFrame:(CGRect)a3
{
  _UIScrollViewGradientMaskView *v3;
  _UIScrollViewGradientMaskView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIScrollViewGradientMaskView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  return v4;
}

- (void)updateWithFrame:(double)a3 gradientStartInsets:(double)a4 gradientEndInsets:(double)a5 gradientIntensities:(double)a6
{
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  int v35;
  _BOOL4 v36;
  double v37;
  double v38;
  double v39;
  double v40;
  BOOL v41;
  double v44;
  double v45;
  double v46;
  int v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  BOOL v54;
  BOOL v55;
  double v56;
  double v57;
  double v58;
  double v59;
  _BOOL4 v60;
  double v61;
  double v62;
  _BOOL8 v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  id v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  uint64_t v97;
  id v98;
  id v99;
  void *v100;
  double v104;
  double v105;
  double v106;
  id v107;
  _QWORD v108[5];
  id v109;
  id v110;

  v31 = a1[52];
  objc_msgSend(a1, "frame");
  v106 = a6;
  v41 = v33 == a6;
  v34 = a5;
  v35 = !v41;
  if (v31)
    v36 = v32 != a5;
  else
    v36 = v35;
  objc_msgSend(a1, "gradientStartInsets");
  v104 = a9;
  v41 = a8 == v40 && a7 == v37;
  v105 = a10;
  if (!v41 || a10 != v39 || a9 != v38)
  {
    v44 = a11;
    v45 = a13;
    v46 = a12;
    v47 = 1;
    v48 = a14;
LABEL_29:
    v56 = a18;
    goto LABEL_37;
  }
  objc_msgSend(a1, "gradientEndInsets");
  v46 = a12;
  v44 = a11;
  v54 = a12 == v52 && a11 == v49 && a14 == v51;
  v45 = a13;
  v55 = v54 && a13 == v50;
  v48 = a14;
  if (!v55)
  {
    v47 = 1;
    goto LABEL_29;
  }
  objc_msgSend(a1, "gradientIntensities", a14);
  v60 = a17 != v59;
  v56 = a18;
  if (a18 != v61)
    v60 = 1;
  if (a15 != v57)
    v60 = 1;
  v47 = a16 != v58 || v60;
LABEL_37:
  objc_msgSend(a1, "setFrame:", a3, a4, v34, v106);
  objc_msgSend(a1, "setGradientStartInsets:", a7, a8, v104, v105);
  objc_msgSend(a1, "setGradientEndInsets:", v44, v46, v45, v48);
  objc_msgSend(a1, "setGradientIntensities:", a15, a16, a17, v56);
  if ((v36 | v47) == 1)
  {
    v62 = v34;
    v63 = v45 <= 0.0 && v44 <= 0.0;
    a1[52] = v63;
    if (!v63 && (v46 > 0.0 || v48 > 0.0))
      NSLog(CFSTR("_UIScrollViewGradientMaskView: gradient must be either horizontal or vertical, not both"));
    v64 = (void *)objc_opt_new();
    v65 = (void *)objc_opt_new();
    objc_msgSend(a1, "gradientIntensities");
    v67 = v66;
    objc_msgSend(a1, "gradientIntensities");
    v69 = v68;
    objc_msgSend(a1, "gradientStartInsets");
    v71 = v70;
    objc_msgSend(a1, "gradientEndInsets");
    v73 = v72;
    objc_msgSend(a1, "gradientStartInsets");
    v75 = v74;
    objc_msgSend(a1, "gradientEndInsets");
    v77 = v106;
    if (a1[52])
    {
      objc_msgSend(a1, "gradientIntensities");
      v67 = v78;
      objc_msgSend(a1, "gradientIntensities");
      v69 = v79;
      objc_msgSend(a1, "gradientStartInsets");
      v71 = v80;
      objc_msgSend(a1, "gradientEndInsets");
      v73 = v81;
      objc_msgSend(a1, "gradientStartInsets");
      v75 = v82;
      objc_msgSend(a1, "gradientEndInsets");
      v84 = v83;
      v77 = v62;
    }
    else
    {
      v84 = v76;
    }
    +[UIColor blackColor](UIColor, "blackColor");
    v85 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v85, "CGColor");
    v107 = (id)objc_claimAutoreleasedReturnValue();

    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.0);
    v86 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v86, "CGColor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 1.0 - v67);
    v88 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v88, "CGColor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 1.0 - v69);
    v90 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v90, "CGColor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    if (v77 > 0.0)
    {
      if (v73 <= 0.0)
      {
        objc_msgSend(v64, "addObject:", &unk_1E1A9AF08);
      }
      else
      {
        objc_msgSend(v64, "addObject:", &unk_1E1A9AF08);
        if (v71 > 0.0)
        {
          objc_msgSend(v65, "addObject:", v87);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v71 / v77);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "addObject:", v92);

        }
        objc_msgSend(v65, "addObject:", v89);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v73 / v77);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "addObject:", v93);

      }
      objc_msgSend(v65, "addObject:", v107);
      v94 = v107;
      if (v84 > 0.0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v77 - v84) / v77);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "addObject:", v95);

        objc_msgSend(v65, "addObject:", v107);
        v94 = v91;
        if (v75 > 0.0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v77 - v75) / v77);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "addObject:", v96);

          objc_msgSend(v65, "addObject:", v91);
          v94 = v87;
        }
      }
      objc_msgSend(v64, "addObject:", &unk_1E1A9AF20);
      objc_msgSend(v65, "addObject:", v94);
    }
    v97 = objc_msgSend(v64, "count");
    if (v97 != objc_msgSend(v65, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIScrollViewGradientMaskView.m"), 147, CFSTR("Bug in _UIScrollViewGradientMaskView: different number of gradient stops and colors"));

    }
    v108[0] = MEMORY[0x1E0C809B0];
    v108[1] = 3221225472;
    v108[2] = __107___UIScrollViewGradientMaskView_updateWithFrame_gradientStartInsets_gradientEndInsets_gradientIntensities___block_invoke;
    v108[3] = &unk_1E16B47A8;
    v108[4] = a1;
    v109 = v65;
    v110 = v64;
    v98 = v64;
    v99 = v65;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v108);

  }
}

- (UIEdgeInsets)gradientStartInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_gradientStartInsets.top;
  left = self->_gradientStartInsets.left;
  bottom = self->_gradientStartInsets.bottom;
  right = self->_gradientStartInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setGradientStartInsets:(UIEdgeInsets)a3
{
  self->_gradientStartInsets = a3;
}

- (UIEdgeInsets)gradientEndInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_gradientEndInsets.top;
  left = self->_gradientEndInsets.left;
  bottom = self->_gradientEndInsets.bottom;
  right = self->_gradientEndInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setGradientEndInsets:(UIEdgeInsets)a3
{
  self->_gradientEndInsets = a3;
}

- (UIEdgeInsets)gradientIntensities
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_gradientIntensities.top;
  left = self->_gradientIntensities.left;
  bottom = self->_gradientIntensities.bottom;
  right = self->_gradientIntensities.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setGradientIntensities:(UIEdgeInsets)a3
{
  self->_gradientIntensities = a3;
}

- (int64_t)gradientDirection
{
  return self->_gradientDirection;
}

- (void)setGradientDirection:(int64_t)a3
{
  self->_gradientDirection = a3;
}

@end
