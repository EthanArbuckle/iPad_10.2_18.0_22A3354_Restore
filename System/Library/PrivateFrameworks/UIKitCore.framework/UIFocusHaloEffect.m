@implementation UIFocusHaloEffect

- (void)setPosition:(UIFocusHaloEffectPosition)position
{
  self->_position = position;
}

+ (UIFocusHaloEffect)effectWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius curve:(CALayerCornerCurve)curve
{
  void *v6;
  void *v7;

  +[_UIShape shapeWithRoundedRect:cornerRadius:cornerCurve:](_UIShape, "shapeWithRoundedRect:cornerRadius:cornerCurve:", curve, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, cornerRadius);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_effectWithUIShape:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFocusHaloEffect *)v7;
}

+ (id)_effectWithUIShape:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "effect");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5[5];
  v5[5] = v4;

  return v5;
}

- (void)setContainerView:(UIView *)containerView
{
  objc_storeWeak((id *)&self->_containerView, containerView);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__shapeCoordinateSpace, 0);
  objc_storeStrong((id *)&self->__shape, 0);
  objc_destroyWeak((id *)&self->_referenceView);
  objc_destroyWeak((id *)&self->_containerView);
}

+ (UIFocusHaloEffect)effectWithRect:(CGRect)rect
{
  return +[UIFocusHaloEffect effectWithRoundedRect:cornerRadius:curve:](UIFocusHaloEffect, "effectWithRoundedRect:cornerRadius:curve:", *MEMORY[0x1E0CD2A60], rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, 0.0);
}

+ (UIFocusHaloEffect)effectWithPath:(UIBezierPath *)bezierPath
{
  void *v4;
  void *v5;

  +[_UIShape shapeWithPath:](_UIShape, "shapeWithPath:", bezierPath);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_effectWithUIShape:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFocusHaloEffect *)v5;
}

- (BOOL)isEqual:(id)a3
{
  UIFocusHaloEffect *v4;
  UIFocusHaloEffect *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  void *v22;
  id v23;

  v4 = (UIFocusHaloEffect *)a3;
  if (v4 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[UIFocusHaloEffect _shape](v5, "_shape");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIFocusHaloEffect _shape](self, "_shape");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {

      }
      else
      {
        LOBYTE(v11) = 0;
        v12 = v9;
        v13 = v8;
        if (!v8 || !v9)
          goto LABEL_26;
        v14 = objc_msgSend(v8, "isEqual:", v9);

        if (!v14)
        {
          LOBYTE(v11) = 0;
LABEL_27:

          goto LABEL_28;
        }
      }
      -[UIFocusHaloEffect containerView](v5, "containerView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIFocusHaloEffect containerView](self, "containerView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v15;
      v17 = v16;
      v12 = v17;
      if (v13 == v17)
      {

      }
      else
      {
        LOBYTE(v11) = 0;
        v18 = v17;
        v19 = v13;
        if (!v13 || !v17)
          goto LABEL_25;
        v20 = objc_msgSend(v13, "isEqual:", v17);

        if (!v20)
        {
          LOBYTE(v11) = 0;
LABEL_26:

          goto LABEL_27;
        }
      }
      -[UIFocusHaloEffect referenceView](v5, "referenceView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIFocusHaloEffect referenceView](self, "referenceView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v21;
      v23 = v22;
      v18 = v23;
      if (v19 == v23)
      {

      }
      else
      {
        if (!v19 || !v23)
        {

          LOBYTE(v11) = 0;
          goto LABEL_25;
        }
        LODWORD(v11) = objc_msgSend(v19, "isEqual:", v23);

        if (!(_DWORD)v11)
          goto LABEL_25;
      }
      v11 = -[UIFocusHaloEffect position](v5, "position");
      LOBYTE(v11) = v11 == -[UIFocusHaloEffect position](self, "position");
LABEL_25:

      goto LABEL_26;
    }
    LOBYTE(v11) = 0;
  }
LABEL_28:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIFocusHaloEffect;
  v4 = -[UIFocusEffect copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[UIFocusHaloEffect _shape](self, "_shape");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[5];
  v4[5] = v5;

  -[UIFocusHaloEffect containerView](self, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContainerView:", v7);

  -[UIFocusHaloEffect referenceView](self, "referenceView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReferenceView:", v8);

  objc_msgSend(v4, "setPosition:", -[UIFocusHaloEffect position](self, "position"));
  return v4;
}

- (id)_resolvedEffectForItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  UIFocusHaloEffect *v9;
  _UIShape *v10;
  UICoordinateSpace *v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  _UIShape *shape;
  _UIShape *v26;
  UICoordinateSpace *shapeCoordinateSpace;
  id v28;

  v4 = a3;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v9 = self;
  }
  else
  {
    -[UIFocusHaloEffect containerView](self, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      _UIFocusEnvironmentContainingView(v4);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6 == v4)
      {
        objc_msgSend(v4, "superview");
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = v6;
      }
      v5 = v8;

    }
    v10 = self->__shape;
    v11 = self->__shapeCoordinateSpace;
    v12 = v11;
    if (v10)
    {
      if (!v11)
      {
        _UIFocusEnvironmentContainingView(v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      if (_IsKindOfUIView((uint64_t)v4))
      {
        v13 = v4;
        objc_msgSend(v13, "bounds");
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v21 = v20;
        objc_msgSend(v13, "_cornerRadius");
        v23 = v22;
        objc_msgSend(v13, "_cornerCurve");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIShape shapeWithRoundedRect:cornerRadius:cornerCurve:](_UIShape, "shapeWithRoundedRect:cornerRadius:cornerCurve:", v24, v15, v17, v19, v21, v23);
        v10 = (_UIShape *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v4, "frame");
        +[_UIShape shapeWithRoundedRect:cornerRadius:cornerCurve:](_UIShape, "shapeWithRoundedRect:cornerRadius:cornerCurve:", *MEMORY[0x1E0CD2A60]);
        v10 = (_UIShape *)objc_claimAutoreleasedReturnValue();
        _UIParentCoordinateSpaceForFocusItem(v4);
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }

      v12 = v13;
    }
    v9 = (UIFocusHaloEffect *)-[UIFocusHaloEffect copy](self, "copy");
    *(_BYTE *)&v9->_flags |= 1u;
    shape = v9->__shape;
    v9->__shape = v10;
    v26 = v10;

    shapeCoordinateSpace = v9->__shapeCoordinateSpace;
    v9->__shapeCoordinateSpace = (UICoordinateSpace *)v12;
    v28 = v12;

    objc_storeWeak((id *)&v9->_containerView, v5);
  }

  return v9;
}

- (UIView)containerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_containerView);
}

- (UIView)referenceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_referenceView);
}

- (void)setReferenceView:(UIView *)referenceView
{
  objc_storeWeak((id *)&self->_referenceView, referenceView);
}

- (UIFocusHaloEffectPosition)position
{
  return self->_position;
}

- (_UIShape)_shape
{
  return self->__shape;
}

- (UICoordinateSpace)_shapeCoordinateSpace
{
  return self->__shapeCoordinateSpace;
}

@end
