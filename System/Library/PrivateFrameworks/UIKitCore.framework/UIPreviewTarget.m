@implementation UIPreviewTarget

- (UIPreviewTarget)initWithContainer:(UIView *)container center:(CGPoint)center transform:(CGAffineTransform *)transform
{
  CGFloat y;
  CGFloat x;
  UIView *v10;
  UIPreviewTarget *v11;
  __int128 v12;
  UIView *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v25;
  void *v26;
  CGAffineTransform m;
  CATransform3D v28;
  objc_super v29;
  CGRect v30;
  CGRect v31;

  y = center.y;
  x = center.x;
  v10 = container;
  v29.receiver = self;
  v29.super_class = (Class)UIPreviewTarget;
  v11 = -[UIPreviewTarget init](&v29, sel_init);
  if (v11)
  {
    v12 = *(_OWORD *)&transform->c;
    *(_OWORD *)&m.a = *(_OWORD *)&transform->a;
    *(_OWORD *)&m.c = v12;
    *(_OWORD *)&m.tx = *(_OWORD *)&transform->tx;
    CATransform3DMakeAffineTransform(&v28, &m);
    v13 = v10;
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", sel__commonInitWithContainer_center_transform_, v11, CFSTR("UITargetedPreview.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("container != nil"));

    }
    -[UIView frame](v13, "frame");
    if (CGRectIsNull(v30) || (-[UIView frame](v13, "frame"), CGRectIsInfinite(v31)))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", sel__commonInitWithContainer_center_transform_, v11, CFSTR("UITargetedPreview.m"), 46, CFSTR("Attempting to create a UIPreviewTarget with an invalid container: %@"), v13);

    }
    if (dyld_program_sdk_at_least())
    {
      -[UIView _window](v13, "_window");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_opt_class();
        -[UIView _conciseParentDescription](v13, "_conciseParentDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel__commonInitWithContainer_center_transform_, v11, CFSTR("UITargetedPreview.m"), 51, CFSTR("%@ requires that the container view is in a window, but it is not. (container: %@)"), v16, v17);

      }
    }
    objc_storeStrong((id *)&v11->_container, container);
    v11->_center3D.x = x;
    v11->_center3D.y = y;
    v11->_center3D.z = 0.0;
    v19 = *(_OWORD *)&v28.m41;
    v18 = *(_OWORD *)&v28.m43;
    v20 = *(_OWORD *)&v28.m33;
    *(_OWORD *)&v11->_transform3D.m31 = *(_OWORD *)&v28.m31;
    *(_OWORD *)&v11->_transform3D.m33 = v20;
    *(_OWORD *)&v11->_transform3D.m41 = v19;
    *(_OWORD *)&v11->_transform3D.m43 = v18;
    v22 = *(_OWORD *)&v28.m21;
    v21 = *(_OWORD *)&v28.m23;
    v23 = *(_OWORD *)&v28.m13;
    *(_OWORD *)&v11->_transform3D.m11 = *(_OWORD *)&v28.m11;
    *(_OWORD *)&v11->_transform3D.m13 = v23;
    *(_OWORD *)&v11->_transform3D.m21 = v22;
    *(_OWORD *)&v11->_transform3D.m23 = v21;

  }
  return v11;
}

- (UIPreviewTarget)initWithContainer:(UIView *)container center:(CGPoint)center
{
  __int128 v4;
  _OWORD v6[3];

  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v6[0] = *MEMORY[0x1E0C9BAA8];
  v6[1] = v4;
  v6[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return -[UIPreviewTarget initWithContainer:center:transform:](self, "initWithContainer:center:transform:", container, v6, center.x, center.y);
}

+ (id)_targetWithContainer:(id)a3 center:(CGPoint)a4 transform3D:(CATransform3D *)a5
{
  double y;
  double x;
  id v9;
  _OWORD *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = (_OWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithContainer:center:", v9, x, y);

  v11 = *(_OWORD *)&a5->m11;
  v12 = *(_OWORD *)&a5->m13;
  v13 = *(_OWORD *)&a5->m23;
  v10[4] = *(_OWORD *)&a5->m21;
  v10[5] = v13;
  v10[2] = v11;
  v10[3] = v12;
  v14 = *(_OWORD *)&a5->m31;
  v15 = *(_OWORD *)&a5->m33;
  v16 = *(_OWORD *)&a5->m43;
  v10[8] = *(_OWORD *)&a5->m41;
  v10[9] = v16;
  v10[6] = v14;
  v10[7] = v15;
  return v10;
}

- (UIPreviewTarget)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITargetedPreview.m"), 82, CFSTR("not implemented"));

  return 0;
}

+ (UIPreviewTarget)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UITargetedPreview.m"), 88, CFSTR("not implemented"));

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _OWORD *v5;
  void *v6;
  void *v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CATransform3D v24;
  CATransform3D a;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "container");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPreviewTarget container](self, "container");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      objc_msgSend(v5, "center");
      v10 = v9;
      v12 = v11;
      -[UIPreviewTarget center](self, "center");
      v8 = 0;
      if (v10 == v14 && v12 == v13)
      {
        v15 = v5[7];
        *(_OWORD *)&a.m31 = v5[6];
        *(_OWORD *)&a.m33 = v15;
        v16 = v5[9];
        *(_OWORD *)&a.m41 = v5[8];
        *(_OWORD *)&a.m43 = v16;
        v17 = v5[3];
        *(_OWORD *)&a.m11 = v5[2];
        *(_OWORD *)&a.m13 = v17;
        v18 = v5[5];
        *(_OWORD *)&a.m21 = v5[4];
        *(_OWORD *)&a.m23 = v18;
        v19 = *(_OWORD *)&self->_transform3D.m33;
        *(_OWORD *)&v24.m31 = *(_OWORD *)&self->_transform3D.m31;
        *(_OWORD *)&v24.m33 = v19;
        v20 = *(_OWORD *)&self->_transform3D.m43;
        *(_OWORD *)&v24.m41 = *(_OWORD *)&self->_transform3D.m41;
        *(_OWORD *)&v24.m43 = v20;
        v21 = *(_OWORD *)&self->_transform3D.m13;
        *(_OWORD *)&v24.m11 = *(_OWORD *)&self->_transform3D.m11;
        *(_OWORD *)&v24.m13 = v21;
        v22 = *(_OWORD *)&self->_transform3D.m23;
        *(_OWORD *)&v24.m21 = *(_OWORD *)&self->_transform3D.m21;
        *(_OWORD *)&v24.m23 = v22;
        v8 = CATransform3DEqualToTransform(&a, &v24);
      }
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  CGAffineTransform transform;
  CGAffineTransform v17;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = objc_opt_class();
  -[UIPreviewTarget container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p>"), v8, v5);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = CFSTR("(nil)");
  }
  -[UIPreviewTarget center](self, "center");
  v11 = v10;
  -[UIPreviewTarget center](self, "center");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; container = %@; center = (%g %g)"), v4, self, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPreviewTarget transform](self, "transform");
  if (!CGAffineTransformIsIdentity(&v17))
  {
    -[UIPreviewTarget transform](self, "transform");
    NSStringFromCGAffineTransform(&transform);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendFormat:", CFSTR("; transform = %@"), v14);

  }
  objc_msgSend(v13, "appendString:", CFSTR(">"));
  return v13;
}

- (CGPoint)center
{
  double x;
  double y;
  CGPoint result;

  x = self->_center3D.x;
  y = self->_center3D.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGAffineTransform)transform
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  CATransform3D v8;

  v3 = *(_OWORD *)&self->_transform3D.m33;
  *(_OWORD *)&v8.m31 = *(_OWORD *)&self->_transform3D.m31;
  *(_OWORD *)&v8.m33 = v3;
  v4 = *(_OWORD *)&self->_transform3D.m43;
  *(_OWORD *)&v8.m41 = *(_OWORD *)&self->_transform3D.m41;
  *(_OWORD *)&v8.m43 = v4;
  v5 = *(_OWORD *)&self->_transform3D.m13;
  *(_OWORD *)&v8.m11 = *(_OWORD *)&self->_transform3D.m11;
  *(_OWORD *)&v8.m13 = v5;
  v6 = *(_OWORD *)&self->_transform3D.m23;
  *(_OWORD *)&v8.m21 = *(_OWORD *)&self->_transform3D.m21;
  *(_OWORD *)&v8.m23 = v6;
  return CATransform3DGetAffineTransform(retstr, &v8);
}

- (CATransform3D)_transform3D
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self->m43;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self->m41;
  *(_OWORD *)&retstr->m33 = v3;
  v4 = *(_OWORD *)&self[1].m13;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[1].m11;
  *(_OWORD *)&retstr->m43 = v4;
  v5 = *(_OWORD *)&self->m23;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m21;
  *(_OWORD *)&retstr->m13 = v5;
  v6 = *(_OWORD *)&self->m33;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self->m31;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (UIView)container
{
  return self->_container;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
}

@end
