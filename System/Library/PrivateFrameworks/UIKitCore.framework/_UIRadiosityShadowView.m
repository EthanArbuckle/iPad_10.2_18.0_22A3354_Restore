@implementation _UIRadiosityShadowView

- (_UIRadiosityShadowView)initWithSourceView:(id)a3 shadowPath:(id)a4 isSoft:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  _UIRadiosityShadowView *v10;
  _UIRadiosityShadowView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  objc_super v26[10];
  objc_super v27;
  _QWORD v28[3];

  v5 = a5;
  v28[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "bounds");
  v27.receiver = self;
  v27.super_class = (Class)_UIRadiosityShadowView;
  v10 = -[UIView initWithFrame:](&v27, sel_initWithFrame_);
  v11 = v10;
  if (v10)
  {
    -[_UIRadiosityShadowView setShadowPath:](v10, "setShadowPath:", v9);
    v12 = (void *)objc_opt_new();
    -[UIView bounds](v11, "bounds");
    objc_msgSend(v12, "setFrame:");
    objc_msgSend(v8, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSourceLayer:", v13);

    objc_msgSend(v12, "setMatchesPosition:", 1);
    objc_msgSend(v12, "setAllowsBackdropGroups:", 1);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKey:", &unk_1E1A95AD0, *MEMORY[0x1E0CD2D90]);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    CAColorMatrixMakeMultiplyColor();
    memset(v26, 0, sizeof(v26));
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forKey:", v16, *MEMORY[0x1E0CD2D20]);

    v28[0] = v14;
    v28[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFilters:", v17);

    -[UIView layer](v11, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSublayer:", v12);

    if (v5)
      v19 = 0.07;
    else
      v19 = 0.15;
    if (v5)
      v20 = 16.0;
    else
      v20 = 8.0;
    if (v5)
      v21 = 5.0;
    else
      v21 = 3.0;
    v22 = (void *)objc_opt_new();
    -[UIView bounds](v11, "bounds");
    objc_msgSend(v22, "setFrame:");
    objc_msgSend(v22, "setShadowPath:", objc_msgSend(objc_retainAutorelease(v9), "CGPath"));
    objc_msgSend(v22, "setShadowOffset:", 0.0, v21);
    objc_msgSend(v22, "setShadowRadius:", v20);
    *(float *)&v23 = v19;
    objc_msgSend(v22, "setShadowOpacity:", v23);
    -[UIView layer](v11, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSublayer:", v22);

  }
  return v11;
}

- (void)setNeedsPunchout:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_needsPunchout != a3)
  {
    self->_needsPunchout = a3;
    if (a3)
    {
      v4 = (void *)objc_opt_new();
      -[_UIRadiosityShadowView shadowPath](self, "shadowPath");
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v4, "setPath:", objc_msgSend(v5, "CGPath"));

      objc_msgSend(v4, "setCompositingFilter:", *MEMORY[0x1E0CD2C50]);
      -[_UIRadiosityShadowView setPunchoutLayer:](self, "setPunchoutLayer:", v4);

      -[UIView layer](self, "layer");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[_UIRadiosityShadowView punchoutLayer](self, "punchoutLayer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSublayer:", v6);

    }
    else
    {
      -[_UIRadiosityShadowView punchoutLayer](self, "punchoutLayer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeFromSuperlayer");

      -[_UIRadiosityShadowView setPunchoutLayer:](self, "setPunchoutLayer:", 0);
    }
  }
}

- (BOOL)needsPunchout
{
  return self->_needsPunchout;
}

- (UIBezierPath)shadowPath
{
  return self->_shadowPath;
}

- (void)setShadowPath:(id)a3
{
  objc_storeStrong((id *)&self->_shadowPath, a3);
}

- (CALayer)punchoutLayer
{
  return self->_punchoutLayer;
}

- (void)setPunchoutLayer:(id)a3
{
  objc_storeStrong((id *)&self->_punchoutLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punchoutLayer, 0);
  objc_storeStrong((id *)&self->_shadowPath, 0);
}

@end
