@implementation _UIFocusHaloView

- (_UIFocusHaloView)initWithFrame:(CGRect)a3
{
  _UIFocusHaloView *v3;
  _UIFocusHaloView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)_UIFocusHaloView;
  v3 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[UIView layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsHitTesting:", 0);

    -[_UIFocusHaloView setThickness:](v4, "setThickness:", 3.0);
    -[_UIFocusHaloView setGapWidth:](v4, "setGapWidth:", 1.0);
    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFocusHaloView setGapColor:](v4, "setGapColor:", v6);

    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[UIView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v8, sel__updateHaloForCurrentUserInterfaceStyle);

  }
  return v4;
}

- (void)setShape:(id)a3
{
  _UIShape *v4;
  _UIShape *shape;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_shape) & 1) == 0)
  {
    v4 = (_UIShape *)objc_msgSend(v6, "copy");
    shape = self->_shape;
    self->_shape = v4;

    -[_UIFocusHaloView _updateHalo](self, "_updateHalo");
  }

}

- (void)setPosition:(int64_t)a3
{
  if (self->_position != a3)
  {
    self->_position = a3;
    -[_UIFocusHaloView _updateHalo](self, "_updateHalo");
  }
}

- (BOOL)_isEligibleForFocusInteraction
{
  return 0;
}

- (id)focusItemsInRect:(CGRect)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)_supportsInvalidatingFocusCache
{
  return 1;
}

- (void)_updateHaloForCurrentUserInterfaceStyle
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  -[_UIFocusHaloView _updateGapColor](self, "_updateGapColor");
  -[_UIFocusHaloView haloColor](self, "haloColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");
  -[_UIFocusHaloView haloView](self, "haloView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shapeLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStrokeColor:", v4);

  -[_UIFocusHaloView resolvedGapColor](self, "resolvedGapColor");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v10, "CGColor");
  -[_UIFocusHaloView gapView](self, "gapView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shapeLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStrokeColor:", v7);

}

- (void)_updateHalo
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  _UIShapeView *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _UIShapeView *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  _UIShapeView *v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UIFocusHaloView shape](self, "shape");
  v64 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "zeroOriginShape");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "outline");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = objc_msgSend(v12, "CGPath");

  -[_UIFocusHaloView thickness](self, "thickness");
  v15 = v14 + v14;
  if (!-[_UIFocusHaloView position](self, "position"))
  {
    -[_UIFocusHaloView gapWidth](self, "gapWidth");
    v15 = v15 + v16 + v16;
  }
  -[_UIFocusHaloView haloView](self, "haloView");
  v17 = (_UIShapeView *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v17 = -[UIView initWithFrame:]([_UIShapeView alloc], "initWithFrame:", v4, v6, v8, v10);
    v18 = *MEMORY[0x1E0CD3030];
    -[_UIShapeView shapeLayer](v17, "shapeLayer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setLineJoin:", v18);

    v20 = *MEMORY[0x1E0CD3010];
    -[_UIShapeView shapeLayer](v17, "shapeLayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLineCap:", v20);

    -[_UIShapeView shapeLayer](v17, "shapeLayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAllowsEdgeAntialiasing:", 1);

    -[UIView addSubview:](self, "addSubview:", v17);
    -[_UIFocusHaloView setHaloView:](self, "setHaloView:", v17);
  }
  -[_UIShapeView shapeLayer](v17, "shapeLayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFillColor:", 0);

  -[_UIFocusHaloView haloColor](self, "haloColor");
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v25 = objc_msgSend(v24, "CGColor");
  -[_UIShapeView shapeLayer](v17, "shapeLayer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setStrokeColor:", v25);

  -[_UIShapeView shapeLayer](v17, "shapeLayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setLineWidth:", v15);

  -[_UIShapeView shapeLayer](v17, "shapeLayer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setPath:", v13);

  -[_UIFocusHaloView gapView](self, "gapView");
  v29 = (_UIShapeView *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    v29 = -[UIView initWithFrame:]([_UIShapeView alloc], "initWithFrame:", v4, v6, v8, v10);
    v30 = *MEMORY[0x1E0CD3030];
    -[_UIShapeView shapeLayer](v29, "shapeLayer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setLineJoin:", v30);

    v32 = *MEMORY[0x1E0CD3010];
    -[_UIShapeView shapeLayer](v29, "shapeLayer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setLineCap:", v32);

    -[_UIShapeView shapeLayer](v29, "shapeLayer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setAllowsEdgeAntialiasing:", 1);

    -[UIView addSubview:](self, "addSubview:", v29);
    -[_UIFocusHaloView setGapView:](self, "setGapView:", v29);
  }
  -[_UIShapeView shapeLayer](v29, "shapeLayer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setPath:", v13);

  if (-[_UIFocusHaloView position](self, "position"))
  {
    -[_UIShapeView shapeLayer](v29, "shapeLayer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setFillColor:", 0);

    -[_UIFocusHaloView resolvedGapColor](self, "resolvedGapColor");
    v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v38 = objc_msgSend(v37, "CGColor");
    -[_UIShapeView shapeLayer](v29, "shapeLayer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setStrokeColor:", v38);

    -[_UIFocusHaloView gapWidth](self, "gapWidth");
    v41 = v15 + v40 + v40;
    -[_UIShapeView shapeLayer](v29, "shapeLayer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setLineWidth:", v41);

    -[_UIShapeView shapeLayer](v29, "shapeLayer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setCompositingFilter:", 0);

    -[UIView sendSubviewToBack:](self, "sendSubviewToBack:", v29);
    -[_UIFocusHaloView maskViewWhenInside](self, "maskViewWhenInside");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v44)
    {
      v45 = -[UIView initWithFrame:]([_UIShapeView alloc], "initWithFrame:", v4, v6, v8, v10);
      -[_UIFocusHaloView setMaskViewWhenInside:](self, "setMaskViewWhenInside:", v45);

      +[UIColor blackColor](UIColor, "blackColor");
      v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v47 = objc_msgSend(v46, "CGColor");
      -[_UIFocusHaloView maskViewWhenInside](self, "maskViewWhenInside");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "shapeLayer");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setFillColor:", v47);

      -[_UIFocusHaloView maskViewWhenInside](self, "maskViewWhenInside");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "shapeLayer");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setAllowsEdgeAntialiasing:", 1);

    }
    -[_UIFocusHaloView maskViewWhenInside](self, "maskViewWhenInside");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "shapeLayer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setPath:", v13);

    -[_UIFocusHaloView maskViewWhenInside](self, "maskViewWhenInside");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setMaskView:](self, "setMaskView:", v54);

  }
  else
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v56 = objc_msgSend(v55, "CGColor");

    -[_UIShapeView shapeLayer](v29, "shapeLayer");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setFillColor:", v56);

    -[_UIShapeView shapeLayer](v29, "shapeLayer");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setStrokeColor:", v56);

    -[_UIFocusHaloView gapWidth](self, "gapWidth");
    v60 = v59 + v59;
    -[_UIShapeView shapeLayer](v29, "shapeLayer");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setLineWidth:", v60);

    v62 = *MEMORY[0x1E0CD2C50];
    -[_UIShapeView shapeLayer](v29, "shapeLayer");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setCompositingFilter:", v62);

    -[UIView bringSubviewToFront:](self, "bringSubviewToFront:", v29);
    -[UIView setMaskView:](self, "setMaskView:", 0);
  }

}

- (double)totalConsumedSpace
{
  double v3;
  double v4;
  double v5;

  -[_UIFocusHaloView thickness](self, "thickness");
  v4 = v3;
  -[_UIFocusHaloView gapWidth](self, "gapWidth");
  return v4 + v5 + v4 + v5;
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFocusHaloView;
  -[UIView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[_UIFocusHaloView _updateGapColor](self, "_updateGapColor");
}

- (void)tintColorDidChange
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIFocusHaloView;
  -[UIView tintColorDidChange](&v7, sel_tintColorDidChange);
  -[_UIFocusHaloView haloColor](self, "haloColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");
  -[_UIFocusHaloView haloView](self, "haloView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shapeLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStrokeColor:", v4);

}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (!-[_UIFocusHaloView geometryFrozen](self, "geometryFrozen"))
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIFocusHaloView;
    -[UIView setHidden:](&v5, sel_setHidden_, v3);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[_UIFocusHaloView geometryFrozen](self, "geometryFrozen"))
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIFocusHaloView;
    -[UIView setFrame:](&v8, sel_setFrame_, x, y, width, height);
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[_UIFocusHaloView geometryFrozen](self, "geometryFrozen"))
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIFocusHaloView;
    -[UIView setBounds:](&v8, sel_setBounds_, x, y, width, height);
  }
}

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  if (!-[_UIFocusHaloView geometryFrozen](self, "geometryFrozen"))
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIFocusHaloView;
    -[UIView setCenter:](&v6, sel_setCenter_, x, y);
  }
}

- (void)setThickness:(double)a3
{
  if (vabdd_f64(a3, self->_thickness) > 2.22044605e-16)
  {
    self->_thickness = a3;
    -[_UIFocusHaloView _updateHalo](self, "_updateHalo");
  }
}

- (void)setGapWidth:(double)a3
{
  if (vabdd_f64(a3, self->_gapWidth) > 2.22044605e-16)
  {
    self->_gapWidth = a3;
    -[_UIFocusHaloView _updateHalo](self, "_updateHalo");
  }
}

- (UIColor)haloColor
{
  void *v3;
  void *v4;
  void *v5;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedColorWithTraitCollection:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v5;
}

- (id)resolvedGapColor
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[_UIFocusHaloView gapSourceTraitCollection](self, "gapSourceTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UIView traitCollection](self, "traitCollection");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  -[_UIFocusHaloView gapColor](self, "gapColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resolvedColorWithTraitCollection:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_updateGapColor
{
  _UIFocusHaloView *v3;
  _UIFocusHaloView *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  _UIFocusHaloView *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _UIFocusHaloView *v17;
  _UIFocusHaloView *v18;

  -[UIView superview](self, "superview");
  v3 = (_UIFocusHaloView *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v17 = v3;
    if (-[_UIFocusHaloView position](self, "position") == 1)
    {
      v4 = v17;
      while (1)
      {
        v18 = v4;
        -[UIView backgroundColor](v4, "backgroundColor");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "_isOpaque");

        if ((v6 & 1) != 0)
          break;
        v4 = v18;
        if ((*(_QWORD *)&v18->super._viewFlags & 0x80000000) == 0)
        {
          -[UIView superview](v18, "superview");
          v7 = objc_claimAutoreleasedReturnValue();

          v4 = (_UIFocusHaloView *)v7;
          if (v7)
            continue;
        }
        goto LABEL_9;
      }
      v4 = v18;
LABEL_9:
      v17 = v4;
      -[UIView backgroundColor](v4, "backgroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "_isOpaque");

      if (v9)
      {
        -[UIView backgroundColor](v17, "backgroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v17;
      }
      else
      {
        +[UIColor clearColor](UIColor, "clearColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = self;
      }
      -[_UIFocusHaloView setGapColor:](self, "setGapColor:", v10);

      -[UIView traitCollection](v11, "traitCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFocusHaloView setGapSourceTraitCollection:](self, "setGapSourceTraitCollection:", v12);

      -[_UIFocusHaloView resolvedGapColor](self, "resolvedGapColor");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = objc_msgSend(v13, "CGColor");
      -[_UIFocusHaloView gapView](self, "gapView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shapeLayer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setStrokeColor:", v14);

    }
    v3 = v17;
  }

}

- (id)description
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  objc_super v10;

  if (os_variant_has_internal_diagnostics())
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIFocusHaloView;
    -[UIView description](&v10, sel_description);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v3, "replaceCharactersInRange:withString:", objc_msgSend(v3, "length") - 1, 1, CFSTR("; "));
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[_UIFocusHaloView shape](self, "shape");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("shape = %@; "), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v8);

    -[_UIFocusHaloView position](self, "position");
    objc_msgSend(v3, "appendString:", CFSTR("position = outside; "));
    if (-[_UIFocusHaloView geometryFrozen](self, "geometryFrozen"))
      objc_msgSend(v3, "appendString:", CFSTR("geometryFrozen = YES; "));
    objc_msgSend(v3, "appendString:", CFSTR(">"));
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIFocusHaloView;
    -[UIView description](&v9, sel_description);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (_UIShape)shape
{
  return self->_shape;
}

- (int64_t)position
{
  return self->_position;
}

- (double)thickness
{
  return self->_thickness;
}

- (double)gapWidth
{
  return self->_gapWidth;
}

- (BOOL)geometryFrozen
{
  return self->_geometryFrozen;
}

- (void)setGeometryFrozen:(BOOL)a3
{
  self->_geometryFrozen = a3;
}

- (_UIShapeView)haloView
{
  return self->_haloView;
}

- (void)setHaloView:(id)a3
{
  objc_storeStrong((id *)&self->_haloView, a3);
}

- (_UIShapeView)gapView
{
  return self->_gapView;
}

- (void)setGapView:(id)a3
{
  objc_storeStrong((id *)&self->_gapView, a3);
}

- (_UIShapeView)maskViewWhenInside
{
  return self->_maskViewWhenInside;
}

- (void)setMaskViewWhenInside:(id)a3
{
  objc_storeStrong((id *)&self->_maskViewWhenInside, a3);
}

- (UIColor)gapColor
{
  return self->_gapColor;
}

- (void)setGapColor:(id)a3
{
  objc_storeStrong((id *)&self->_gapColor, a3);
}

- (UITraitCollection)gapSourceTraitCollection
{
  return self->_gapSourceTraitCollection;
}

- (void)setGapSourceTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_gapSourceTraitCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gapSourceTraitCollection, 0);
  objc_storeStrong((id *)&self->_gapColor, 0);
  objc_storeStrong((id *)&self->_maskViewWhenInside, 0);
  objc_storeStrong((id *)&self->_gapView, 0);
  objc_storeStrong((id *)&self->_haloView, 0);
  objc_storeStrong((id *)&self->_shape, 0);
}

@end
