@implementation SBFFeatherBlurView

- (SBFFeatherBlurView)initWithRecipe:(unint64_t)a3
{
  SBFFeatherBlurView *v4;
  SBFFeatherBlurView *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  MTMaterialView *backgroundBlurView;
  char v11;
  MTMaterialView *v12;
  MTMaterialView *v13;
  _QWORD v15[4];
  char v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SBFFeatherBlurView;
  v4 = -[SBFFeatherBlurView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    if (a3 > 7)
    {
      v6 = 0;
    }
    else
    {
      v6 = off_1E200E6E0[a3];
      *(_QWORD *)&v4->_intrinsicHeight = qword_18AC15A48[a3];
    }
    v7 = (void *)MEMORY[0x1E0D47498];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", v6, v8, 0, 0, 0.99);
    v9 = objc_claimAutoreleasedReturnValue();
    backgroundBlurView = v5->_backgroundBlurView;
    v5->_backgroundBlurView = (MTMaterialView *)v9;

    v11 = objc_msgSend((id)objc_opt_class(), "_requiresLowQualityFeatherBlur:", a3);
    v12 = v5->_backgroundBlurView;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __37__SBFFeatherBlurView_initWithRecipe___block_invoke;
    v15[3] = &__block_descriptor_33_e8_d16__0d8l;
    v16 = v11;
    -[MTMaterialView setBackdropScaleAdjustment:](v12, "setBackdropScaleAdjustment:", v15);
    v13 = v5->_backgroundBlurView;
    -[SBFFeatherBlurView bounds](v5, "bounds");
    -[MTMaterialView setFrame:](v13, "setFrame:");
    -[SBFFeatherBlurView addSubview:](v5, "addSubview:", v5->_backgroundBlurView);
    -[MTMaterialView setWeighting:](v5->_backgroundBlurView, "setWeighting:", 1.0);
  }
  return v5;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFFeatherBlurView;
  -[SBFFeatherBlurView layoutSubviews](&v3, sel_layoutSubviews);
  -[SBFFeatherBlurView bounds](self, "bounds");
  -[MTMaterialView setFrame:](self->_backgroundBlurView, "setFrame:");
}

+ (BOOL)_requiresLowQualityFeatherBlur:(unint64_t)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sbf_featherBlurGraphicsQuality");

  return (a3 == 2 || (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1) && v5 < 100;
}

double __37__SBFFeatherBlurView_initWithRecipe___block_invoke(uint64_t a1, double a2)
{
  return dbl_18AC15A30[*(_BYTE *)(a1 + 32) == 0] / a2;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double intrinsicHeight;
  CGSize result;

  v2 = *MEMORY[0x1E0CEBDE0];
  intrinsicHeight = self->_intrinsicHeight;
  result.height = intrinsicHeight;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double intrinsicHeight;

  intrinsicHeight = self->_intrinsicHeight;
  result.height = intrinsicHeight;
  return result;
}

+ (id)configureGradientMaskForFeatherBlurRecipe:(unint64_t)a3 onContentView:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[3];
  _QWORD v46[4];
  _QWORD v47[4];
  _QWORD v48[3];
  _QWORD v49[2];
  _QWORD v50[3];
  _QWORD v51[2];
  _QWORD v52[5];

  v52[3] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBFFeatherBlurView.m"), 121, CFSTR("contentView must have a superview."));

  }
  if ((objc_msgSend((id)objc_opt_class(), "_requiresLowQualityFeatherBlur:", a3) & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@:%p>:destOut"), v12, v7);
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD2708], "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCaptureOnly:", 1);
    objc_msgSend(v14, "setGroupName:", v13);
    objc_msgSend(v8, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "insertSublayer:below:", v14, v16);

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = 0;
    v44 = v14;
    v20 = 0;
    switch(a3)
    {
      case 0uLL:
        objc_msgSend(v17, "colorWithAlphaComponent:", 0.84);
        v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v52[0] = objc_msgSend(v21, "CGColor");
        objc_msgSend(v18, "colorWithAlphaComponent:", 0.66);
        v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v52[1] = objc_msgSend(v22, "CGColor");
        objc_msgSend(v18, "colorWithAlphaComponent:", 0.0);
        v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v52[2] = objc_msgSend(v24, "CGColor");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 3);
        v20 = objc_claimAutoreleasedReturnValue();

        v19 = &unk_1E203B318;
        goto LABEL_11;
      case 1uLL:
      case 3uLL:
        objc_msgSend(v17, "colorWithAlphaComponent:", 0.84);
        v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v50[0] = objc_msgSend(v21, "CGColor");
        objc_msgSend(v18, "colorWithAlphaComponent:", 0.66);
        v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v50[1] = objc_msgSend(v22, "CGColor");
        objc_msgSend(v18, "colorWithAlphaComponent:", 0.0);
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v50[2] = objc_msgSend(v23, "CGColor");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 3);
        v20 = objc_claimAutoreleasedReturnValue();

        v19 = &unk_1E203B348;
        goto LABEL_11;
      case 2uLL:
        objc_msgSend(v17, "colorWithAlphaComponent:", 0.84);
        v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v51[0] = objc_msgSend(v21, "CGColor");
        objc_msgSend(v18, "colorWithAlphaComponent:", 0.0);
        v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v51[1] = objc_msgSend(v22, "CGColor");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
        v20 = objc_claimAutoreleasedReturnValue();
        v19 = &unk_1E203B330;
        goto LABEL_11;
      case 4uLL:
        objc_msgSend(v17, "colorWithAlphaComponent:", 0.77);
        v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v49[0] = objc_msgSend(v21, "CGColor");
        objc_msgSend(v18, "colorWithAlphaComponent:", 0.81);
        v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v49[1] = objc_msgSend(v22, "CGColor");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
        v20 = objc_claimAutoreleasedReturnValue();
        v19 = &unk_1E203B360;
        goto LABEL_11;
      case 5uLL:
      case 6uLL:
        break;
      case 7uLL:
        objc_msgSend(v17, "colorWithAlphaComponent:", 0.84);
        v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v48[0] = objc_msgSend(v21, "CGColor");
        objc_msgSend(v18, "colorWithAlphaComponent:", 0.42);
        v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v48[1] = objc_msgSend(v22, "CGColor");
        objc_msgSend(v18, "colorWithAlphaComponent:", 0.0);
        v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v48[2] = objc_msgSend(v25, "CGColor");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3);
        v20 = objc_claimAutoreleasedReturnValue();

        v19 = &unk_1E203B378;
LABEL_11:

        break;
      default:
        v20 = 0;
        break;
    }
    v43 = (void *)v20;
    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setType:", *MEMORY[0x1E0CD2F48]);
    objc_msgSend(v26, "setColors:", v20);
    objc_msgSend(v26, "setLocations:", v19);
    objc_msgSend(v26, "setStartPoint:", 0.5, 0.0);
    objc_msgSend(v26, "setEndPoint:", 0.5, 1.0);
    objc_msgSend(v26, "setCompositingFilter:", *MEMORY[0x1E0CD2C50]);
    objc_msgSend(v8, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "insertSublayer:above:", v26, v28);

    objc_msgSend(MEMORY[0x1E0CD2708], "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setGroupName:", v13);
    objc_msgSend(v29, "setCompositingFilter:", *MEMORY[0x1E0CD2C58]);
    objc_msgSend(v8, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "insertSublayer:above:", v29, v26);

    objc_msgSend(v8, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setAllowsGroupBlending:", 0);

    v46[0] = CFSTR("position");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v32;
    v46[1] = CFSTR("bounds");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v42 = (void *)v13;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v33;
    v46[2] = CFSTR("opacity");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v34;
    v46[3] = CFSTR("hidden");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = v8;
    v36 = v7;
    v37 = v18;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v38;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v44, "setActions:", v39);
    objc_msgSend(v26, "setActions:", v39);
    objc_msgSend(v29, "setActions:", v39);
    v45[0] = v44;
    v45[1] = v26;
    v45[2] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v36;
    v8 = v35;

  }
  return v9;
}

+ (UIEdgeInsets)gradientMaskLayerInsetsForFeatherBlurRecipe:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  if (a3 - 4 >= 4)
  {
    v3 = 0.0;
    v5 = 30.0;
    if (a3 != 3)
      v5 = -10.0;
    v4 = 0.0;
    v6 = 0.0;
  }
  else
  {
    v3 = *MEMORY[0x1E0CEB4B0];
    v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

+ (id)matchMoveAnimationForFrame:(CGRect)a3 relativeToView:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double MinX;
  void *v14;
  void *v15;
  double MaxX;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  _QWORD v26[5];
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v26[4] = *MEMORY[0x1E0C80C00];
  v8 = (objc_class *)MEMORY[0x1E0CD27C0];
  v9 = a4;
  v10 = objc_alloc_init(v8);
  objc_msgSend(v9, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setSourceLayer:", v11);
  v12 = (void *)MEMORY[0x1E0CB3B18];
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MinX = CGRectGetMinX(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  objc_msgSend(v12, "valueWithCGPoint:", MinX, CGRectGetMinY(v28));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v14;
  v15 = (void *)MEMORY[0x1E0CB3B18];
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  MaxX = CGRectGetMaxX(v29);
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  objc_msgSend(v15, "valueWithCGPoint:", MaxX, CGRectGetMinY(v30));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v17;
  v18 = (void *)MEMORY[0x1E0CB3B18];
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  v19 = CGRectGetMaxX(v31);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  objc_msgSend(v18, "valueWithCGPoint:", v19, CGRectGetMaxY(v32));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v20;
  v21 = (void *)MEMORY[0x1E0CB3B18];
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  v22 = CGRectGetMinX(v33);
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  objc_msgSend(v21, "valueWithCGPoint:", v22, CGRectGetMaxY(v34));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSourcePoints:", v24);

  objc_msgSend(v10, "setAppliesX:", 0);
  objc_msgSend(v10, "setAppliesY:", 1);
  objc_msgSend(v10, "setAppliesScale:", 1);
  objc_msgSend(v10, "setAppliesRotation:", 0);
  objc_msgSend(v10, "setDuration:", INFINITY);
  objc_msgSend(v10, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v10, "setRemovedOnCompletion:", 0);
  return v10;
}

- (MTMaterialView)backgroundBlurView
{
  return self->_backgroundBlurView;
}

- (double)intrinsicHeight
{
  return self->_intrinsicHeight;
}

- (void)setIntrinsicHeight:(double)a3
{
  self->_intrinsicHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundBlurView, 0);
}

@end
