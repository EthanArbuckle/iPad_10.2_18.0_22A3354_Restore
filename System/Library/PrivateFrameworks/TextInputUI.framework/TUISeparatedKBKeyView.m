@implementation TUISeparatedKBKeyView

- (TUISeparatedKBKeyView)initWithKey:(id)a3
{
  TUISeparatedKBKeyView *v3;
  TUISeparatedKBKeyView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUISeparatedKBKeyView;
  v3 = -[TUIKBKeyView initWithKey:](&v6, sel_initWithKey_, a3);
  v4 = v3;
  if (v3)
  {
    -[TUISeparatedKBKeyView _setContinuousCornerRadius:](v3, "_setContinuousCornerRadius:", 30.0);
    -[TUISeparatedKBKeyView _addGlassEffect](v4, "_addGlassEffect");
    -[TUISeparatedKBKeyView _addShadowEffect](v4, "_addShadowEffect");
    -[TUISeparatedKBKeyView _addHoverEffect](v4, "_addHoverEffect");
  }
  return v4;
}

- (void)_addGlassEffect
{
  void *v2;
  id v3;

  -[TUISeparatedKBKeyView layer](self, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], CFSTR("separatedOptions.acceptsUpstreamHitTesting"));
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("separatedOptions.platter.enabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(v3, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], CFSTR("separatedOptions.platter.enabled"));
    objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E25178F0, CFSTR("separatedOptions.platter.frontDepthForNormals"));
    objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E2517900, CFSTR("separatedOptions.geometry.frontBevel"));
    objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E25172A8, CFSTR("separatedOptions.geometry.flatDepth"));
    objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E25172A8, CFSTR("separatedOptions.geometry.backBevel"));
    objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E2517910, CFSTR("separatedOptions.platter.mainSpecularStrength"));
    objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E2517900, CFSTR("separatedOptions.platter.fillSpecularStrength"));
    objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E2517920, CFSTR("separatedOptions.platter.mainSpecularExponent"));
    objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E2517930, CFSTR("separatedOptions.platter.fillSpecularExponent"));
    objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E2517940, CFSTR("separatedOptions.platter.fakeFresnelMaxDist"));
    objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E2517900, CFSTR("separatedOptions.platter.fakeFresnelStrength"));
    objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E25178F0, CFSTR("separatedOptions.platter.fakeFresnelFalloff"));
  }

}

- (void)_addShadowEffect
{
  double v2;
  id v3;
  id v4;

  -[TUISeparatedKBKeyView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = 1017370378;
  objc_msgSend(v4, "setShadowOpacity:", v2);
  objc_msgSend(v4, "setShadowRadius:", 1.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "setShadowColor:", objc_msgSend(v3, "CGColor"));

  objc_msgSend(v4, "setShadowOffset:", 0.5, 2.0);
  objc_msgSend(v4, "setShadowPathIsBounds:", 1);
  objc_msgSend(v4, "setValue:forKeyPath:", &unk_1E2517950, CFSTR("separatedOptions.shadows.expansionOpacity"));
  objc_msgSend(v4, "setValue:forKeyPath:", &unk_1E2517960, CFSTR("separatedOptions.shadows.expansionRadius"));
  objc_msgSend(v4, "setValue:forKeyPath:", &unk_1E2517960, CFSTR("separatedOptions.shadows.expansionSize"));
  objc_msgSend(v4, "setValue:forKeyPath:", &unk_1E2517960, CFSTR("separatedOptions.shadows.maxDynamicOffset"));
  objc_msgSend(v4, "setValue:forKeyPath:", &unk_1E2517970, CFSTR("separatedOptions.shadows.expansionTargetZ"));

}

- (id)_pressRingLayer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  double v21;
  void *v22;
  CATransform3D v24;
  CATransform3D v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  CGRect v33;
  CGRect v34;

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__2460;
  v31 = __Block_byref_object_dispose__2461;
  v32 = 0;
  -[TUISeparatedKBKeyView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sublayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __40__TUISeparatedKBKeyView__pressRingLayer__block_invoke;
  v26[3] = &unk_1E24FB2D8;
  v26[4] = &v27;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v26);

  v5 = (void *)v28[5];
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    -[TUISeparatedKBKeyView bounds](self, "bounds");
    x = v33.origin.x;
    y = v33.origin.y;
    width = v33.size.width;
    height = v33.size.height;
    v11 = v33.origin.x + -2.0;
    v12 = v33.origin.y + -2.0;
    v13 = CGRectGetWidth(v33) + 4.0;
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = height;
    v14 = CGRectGetHeight(v34) + 4.0;
    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFrame:", v11, v12, v13, v14);
    v15 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.666666667, 0.666666667, 0.666666667, 1.0);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.7);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v15, "arrayWithObjects:", v17, objc_msgSend(v18, "CGColor"), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setColors:", v19);

    objc_msgSend(v6, "setType:", *MEMORY[0x1E0CD2F58]);
    objc_msgSend(v6, "setStartPoint:", 0.5, 0.5);
    objc_msgSend(v6, "setEndPoint:", 0.95, 0.95);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.05, 0.1);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "setBorderColor:", objc_msgSend(v20, "CGColor"));

    objc_msgSend(v6, "setBorderWidth:", 3.0);
    objc_msgSend(v6, "setCornerRadius:", 32.0);
    objc_msgSend(v6, "setCornerCurve:", *MEMORY[0x1E0CD2A60]);
    LODWORD(v21) = 0;
    objc_msgSend(v6, "setOpacity:", v21);
    CATransform3DMakeTranslation(&v25, 0.0, 0.0, -4.0);
    v24 = v25;
    objc_msgSend(v6, "setTransform:", &v24);
    objc_msgSend(v6, "setValue:forKeyPath:", &unk_1E25172C0, CFSTR("separatedOptions.separatedThickness"));
    objc_msgSend(v6, "setName:", CFSTR("KeyPressEffectHighlightLayerName"));
    -[TUISeparatedKBKeyView layer](self, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSublayer:", v6);

  }
  _Block_object_dispose(&v27, 8);

  return v6;
}

- (void)updateStateFrom:(int)a3 to:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  -[TUISeparatedKBKeyView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", 30.0);
  -[TUISeparatedKBKeyView _updateHoverToEnabled:](self, "_updateHoverToEnabled:", (v4 & 0x6E) != 0);
  v7.receiver = self;
  v7.super_class = (Class)TUISeparatedKBKeyView;
  -[TUIKBKeyView updateStateFrom:to:](&v7, sel_updateStateFrom_to_, v5, v4);
}

- (void)_startStateTransitionAnimationsFrom:(int)a3 to:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  void *v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  CATransform3D v54;
  CATransform3D v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  CGRect v64;
  CGRect v65;

  if (a3 != a4)
  {
    v56 = v11;
    v57 = v10;
    v58 = v9;
    v59 = v8;
    v60 = v7;
    v61 = v6;
    v62 = v4;
    v63 = v5;
    v12 = a4;
    v13 = a3;
    -[TUISeparatedKBKeyView layer](self, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISeparatedKBKeyView bounds](self, "bounds");
    x = v64.origin.x;
    y = v64.origin.y;
    width = v64.size.width;
    height = v64.size.height;
    v20 = CGRectGetHeight(v64);
    v65.origin.x = x;
    v65.origin.y = y;
    v65.size.width = width;
    v65.size.height = height;
    v21 = CGRectGetWidth(v65);
    v22 = vabdd_f64(v21, v20);
    if ((v12 & 4) != 0)
    {
      v36 = v21;
      CATransform3DMakeTranslation(&v55, 0.0, 0.0, 0.0);
      v54 = v55;
      -[TUISeparatedKBKeyView setTransform3D:](self, "setTransform3D:", &v54);
      objc_msgSend(v15, "setValue:forKeyPath:", &unk_1E25172C0, CFSTR("separatedOptions.separatedThickness"));
      objc_msgSend(v15, "removeAllAnimations");
      v37 = (v20 + 4.0) / v20;
      -[TUISeparatedKBKeyView _pressRingLayer](self, "_pressRingLayer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeAllAnimations");
      if (v22 >= 2.22044605e-16)
      {
        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.scale.x"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setFromValue:", &unk_1E2517980);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v36 + 4.0) / v36);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setToValue:", v42);

        objc_msgSend(v38, "setDuration:", 0.100000001);
        v40 = *MEMORY[0x1E0CD2B60];
        objc_msgSend(v38, "setFillMode:", *MEMORY[0x1E0CD2B60]);
        objc_msgSend(v38, "setRemovedOnCompletion:", 0);
        v43 = *MEMORY[0x1E0CD3050];
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setTimingFunction:", v44);

        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.scale.y"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setFromValue:", &unk_1E2517980);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v37);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setToValue:", v46);

        objc_msgSend(v45, "setDuration:", 0.100000001);
        objc_msgSend(v45, "setFillMode:", v40);
        objc_msgSend(v45, "setRemovedOnCompletion:", 0);
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v43);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setTimingFunction:", v47);

        objc_msgSend(v23, "addAnimation:forKey:", v38, CFSTR("touch down scale X"));
        objc_msgSend(v23, "addAnimation:forKey:", v45, CFSTR("touch down scale Y"));

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.scale"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setFromValue:", &unk_1E2517980);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setToValue:", v39);

        objc_msgSend(v38, "setDuration:", 0.100000001);
        v40 = *MEMORY[0x1E0CD2B60];
        objc_msgSend(v38, "setFillMode:", *MEMORY[0x1E0CD2B60]);
        objc_msgSend(v38, "setRemovedOnCompletion:", 0);
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setTimingFunction:", v41);

        objc_msgSend(v23, "addAnimation:forKey:", v38, CFSTR("touch down scale"));
      }

      LODWORD(v48) = 1032805417;
      objc_msgSend(v23, "setOpacity:", v48);
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.translation.z"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setFromValue:", &unk_1E2517990);
      objc_msgSend(v49, "setToValue:", &unk_1E25179A0);
      objc_msgSend(v49, "setDuration:", 0.00749999983);
      objc_msgSend(v49, "setFillMode:", v40);
      objc_msgSend(v49, "setRemovedOnCompletion:", 0);
      v50 = *MEMORY[0x1E0CD3058];
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setTimingFunction:", v51);

      objc_msgSend(v15, "addAnimation:forKey:", v49, CFSTR("touch down z translation"));
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.translation.z"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setFromValue:", &unk_1E25179A0);
      objc_msgSend(v52, "setToValue:", &unk_1E25179B0);
      objc_msgSend(v52, "setDuration:", 0.00749999983);
      objc_msgSend(v52, "setFillMode:", v40);
      objc_msgSend(v52, "setRemovedOnCompletion:", 0);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v50);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setTimingFunction:", v53);

      objc_msgSend(v23, "addAnimation:forKey:", v52, CFSTR("touch down z translation reverse"));
    }
    else
    {
      if ((v13 & 0x14) == 0)
      {
LABEL_10:

        return;
      }
      -[TUISeparatedKBKeyView _pressRingLayer](self, "_pressRingLayer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeAllAnimations");
      objc_msgSend(v15, "removeAllAnimations");
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.scale"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v25) = dword_18C80CB50[v22 < 2.22044605e-16];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setFromValue:", v26);

      objc_msgSend(v24, "setToValue:", &unk_1E2517980);
      objc_msgSend(v24, "setDuration:", 0.100000001);
      v27 = *MEMORY[0x1E0CD2B60];
      objc_msgSend(v24, "setFillMode:", *MEMORY[0x1E0CD2B60]);
      objc_msgSend(v24, "setRemovedOnCompletion:", 0);
      v28 = *MEMORY[0x1E0CD3050];
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setTimingFunction:", v29);

      objc_msgSend(v23, "addAnimation:forKey:", v24, CFSTR("touch up scale"));
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setFromValue:", &unk_1E25179C0);
      objc_msgSend(v30, "setToValue:", &unk_1E2517990);
      objc_msgSend(v30, "setDuration:", 0.100000001);
      objc_msgSend(v30, "setFillMode:", v27);
      objc_msgSend(v30, "setRemovedOnCompletion:", 0);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setTimingFunction:", v31);

      objc_msgSend(v23, "addAnimation:forKey:", v30, CFSTR("touch up opacity"));
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.translation.z"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setFromValue:", &unk_1E25179A0);
      objc_msgSend(v32, "setToValue:", &unk_1E2517990);
      objc_msgSend(v32, "setDuration:", 0.150000006);
      objc_msgSend(v32, "setFillMode:", v27);
      objc_msgSend(v32, "setRemovedOnCompletion:", 0);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v28);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setTimingFunction:", v33);

      objc_msgSend(v15, "addAnimation:forKey:", v32, CFSTR("touch up z translation"));
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.translation.z"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setFromValue:", &unk_1E25179B0);
      objc_msgSend(v34, "setToValue:", &unk_1E25179A0);
      objc_msgSend(v34, "setDuration:", 0.150000006);
      objc_msgSend(v34, "setFillMode:", v27);
      objc_msgSend(v34, "setRemovedOnCompletion:", 0);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v28);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setTimingFunction:", v35);

      objc_msgSend(v23, "addAnimation:forKey:", v34, CFSTR("touch up z translation reverse"));
    }

    goto LABEL_10;
  }
}

void __40__TUISeparatedKBKeyView__pressRingLayer__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("KeyPressEffectHighlightLayerName"));

    if (v8)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
      *a4 = 1;
    }
  }

}

@end
