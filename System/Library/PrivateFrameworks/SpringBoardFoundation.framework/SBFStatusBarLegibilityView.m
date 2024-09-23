@implementation SBFStatusBarLegibilityView

- (double)strength
{
  return 1.0;
}

- (void)setForceLegibilityGradientHidden:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((BSEqualBools() & 1) == 0)
  {
    self->_forceLegibilityGradientHidden = v3;
    -[SBFStatusBarLegibilityView _configureWithLegibilitySettings:forceLegibilityGradientHidden:](self, "_configureWithLegibilitySettings:forceLegibilityGradientHidden:", self->_legibilitySettings, v3);
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBFStatusBarLegibilityView _configureWithLegibilitySettings:forceLegibilityGradientHidden:](self, "_configureWithLegibilitySettings:forceLegibilityGradientHidden:", v5, self->_forceLegibilityGradientHidden);
  }

}

- (void)_configureWithLegibilitySettings:(id)a3 forceLegibilityGradientHidden:(BOOL)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v7 = objc_msgSend(a3, "style");
  if (!a3 || v7 == 2 || a4)
  {
    -[SBFStatusBarLegibilityView statusBarGradientView](self, "statusBarGradientView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    -[SBFStatusBarLegibilityView setStatusBarGradientView:](self, "setStatusBarGradientView:", 0);
    -[SBFStatusBarLegibilityView leftCornerView](self, "leftCornerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromSuperview");

    -[SBFStatusBarLegibilityView setLeftCornerView:](self, "setLeftCornerView:", 0);
    -[SBFStatusBarLegibilityView rightCornerView](self, "rightCornerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromSuperview");

    -[SBFStatusBarLegibilityView setRightCornerView:](self, "setRightCornerView:", 0);
    return;
  }
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    if (v13 != 1)
    {
LABEL_6:
      -[SBFStatusBarLegibilityView statusBarGradientView](self, "statusBarGradientView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        -[SBFStatusBarLegibilityView _configureAsPhone](self, "_configureAsPhone");
      return;
    }
  }
  -[SBFStatusBarLegibilityView leftCornerView](self, "leftCornerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {

  }
  else
  {
    -[SBFStatusBarLegibilityView rightCornerView](self, "rightCornerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      -[SBFStatusBarLegibilityView _configureAsPad](self, "_configureAsPad");
  }
}

+ (id)gradientViewWithOpacities:(const double *)a3 locations:(id)a4
{
  id v5;
  SBStatusBarLegibilityGradientView *v6;
  void *v7;
  CFIndex v8;
  __CFArray *Mutable;
  CGColorSpace *i;
  CGColorRef v11;
  CGColorRef v12;
  void *v13;
  void *v14;
  CGFloat components[3];

  components[2] = *(CGFloat *)MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(SBStatusBarLegibilityGradientView);
  -[SBStatusBarLegibilityGradientView layer](v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "count");
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v8, MEMORY[0x1E0C9B378]);
  for (i = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D978]); v8; --v8)
  {
    components[0] = 0.0;
    components[1] = *a3;
    v11 = CGColorCreate(i, components);
    if (v11)
    {
      v12 = v11;
      CFArrayAppendValue(Mutable, v11);
      CFRelease(v12);
    }
    ++a3;
  }
  objc_msgSend(v7, "setColors:", Mutable);
  CFRelease(Mutable);
  CGColorSpaceRelease(i);
  objc_msgSend(v7, "setLocations:", v5);
  objc_msgSend(v7, "setStartPoint:", 0.5, 1.0);
  objc_msgSend(v7, "setEndPoint:", 0.5, 0.0);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C30]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBStatusBarLegibilityGradientView layer](v6, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCompositingFilter:", v13);

  return v6;
}

+ (id)statusBarGradientView
{
  _OWORD v3[15];
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3[12] = xmmword_18AC15BA8;
  v3[13] = unk_18AC15BB8;
  v3[14] = xmmword_18AC15BC8;
  v4 = 0x3FA999999999999ALL;
  v3[8] = xmmword_18AC15B68;
  v3[9] = unk_18AC15B78;
  v3[10] = xmmword_18AC15B88;
  v3[11] = unk_18AC15B98;
  v3[4] = xmmword_18AC15B28;
  v3[5] = unk_18AC15B38;
  v3[6] = xmmword_18AC15B48;
  v3[7] = unk_18AC15B58;
  v3[0] = xmmword_18AC15AE8;
  v3[1] = unk_18AC15AF8;
  v3[2] = xmmword_18AC15B08;
  v3[3] = unk_18AC15B18;
  objc_msgSend(a1, "gradientViewWithOpacities:locations:", v3, &unk_1E203B390);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_configureAsPhone
{
  void *v3;
  id v4;

  -[SBFStatusBarLegibilityView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsGroupBlending:", 0);

  objc_msgSend((id)objc_opt_class(), "statusBarGradientView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFStatusBarLegibilityView addSubview:](self, "addSubview:", v4);
  -[SBFStatusBarLegibilityView setStatusBarGradientView:](self, "setStatusBarGradientView:", v4);

}

- (void)_configureAsPad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("StatusBarLegibilityShadow"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageWithHorizontallyFlippedOrientation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v10);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v3);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C30]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompositingFilter:", v6);

  objc_msgSend(v5, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCompositingFilter:", v6);

  -[SBFStatusBarLegibilityView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsGroupBlending:", 0);

  -[SBFStatusBarLegibilityView addSubview:](self, "addSubview:", v4);
  -[SBFStatusBarLegibilityView addSubview:](self, "addSubview:", v5);
  -[SBFStatusBarLegibilityView setLeftCornerView:](self, "setLeftCornerView:", v4);
  -[SBFStatusBarLegibilityView setRightCornerView:](self, "setRightCornerView:", v5);

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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double MaxX;
  double v28;
  CGFloat rect;
  CGRect remainder;
  CGRect slice;
  objc_super v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v32.receiver = self;
  v32.super_class = (Class)SBFStatusBarLegibilityView;
  -[SBFStatusBarLegibilityView layoutSubviews](&v32, sel_layoutSubviews);
  -[SBFStatusBarLegibilityView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBFStatusBarLegibilityView statusBarGradientView](self, "statusBarGradientView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    memset(&slice, 0, sizeof(slice));
    memset(&remainder, 0, sizeof(remainder));
    v33.origin.x = v4;
    v33.origin.y = v6;
    v33.size.width = v8;
    v33.size.height = v10;
    CGRectDivide(v33, &slice, &remainder, 100.0, CGRectMinYEdge);
    objc_msgSend(v11, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  -[SBFStatusBarLegibilityView leftCornerView](self, "leftCornerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "frame");
    objc_msgSend(v13, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  }
  -[SBFStatusBarLegibilityView rightCornerView](self, "rightCornerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "frame");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v34.origin.x = v4;
    v34.origin.y = v6;
    v34.size.width = v8;
    v34.size.height = v10;
    rect = v10;
    v24 = v8;
    v25 = v6;
    v26 = v4;
    MaxX = CGRectGetMaxX(v34);
    v35.origin.x = v17;
    v35.origin.y = v19;
    v35.size.width = v21;
    v35.size.height = v23;
    v28 = MaxX - CGRectGetWidth(v35);
    v36.origin.x = v26;
    v36.origin.y = v25;
    v36.size.width = v24;
    v36.size.height = rect;
    objc_msgSend(v15, "setFrame:", v28, CGRectGetMinY(v36), v21, v23);
  }

}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)forceLegibilityGradientHidden
{
  return self->_forceLegibilityGradientHidden;
}

- (UIView)statusBarGradientView
{
  return self->_statusBarGradientView;
}

- (void)setStatusBarGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarGradientView, a3);
}

- (UIImageView)leftCornerView
{
  return self->_leftCornerView;
}

- (void)setLeftCornerView:(id)a3
{
  objc_storeStrong((id *)&self->_leftCornerView, a3);
}

- (UIImageView)rightCornerView
{
  return self->_rightCornerView;
}

- (void)setRightCornerView:(id)a3
{
  objc_storeStrong((id *)&self->_rightCornerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightCornerView, 0);
  objc_storeStrong((id *)&self->_leftCornerView, 0);
  objc_storeStrong((id *)&self->_statusBarGradientView, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end
