@implementation _UIGravityWellEffectKey

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  -[_UIGravityWellEffectKey view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setView:", v5);

  -[_UIGravityWellEffectKey point](self, "point");
  objc_msgSend(v4, "setPoint:");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _UIGravityWellEffectKey *v4;
  _UIGravityWellEffectKey *v5;
  void *v6;
  void *v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v4 = (_UIGravityWellEffectKey *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[_UIGravityWellEffectKey view](v5, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIGravityWellEffectKey view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        -[_UIGravityWellEffectKey point](v5, "point");
        v10 = v9;
        v12 = v11;
        -[_UIGravityWellEffectKey point](self, "point");
        v8 = v12 == v14 && v10 == v13;
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
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  double v7;
  unint64_t v8;

  -[_UIGravityWellEffectKey view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_UIGravityWellEffectKey point](self, "point");
  v6 = v4 ^ (int)v5;
  -[_UIGravityWellEffectKey point](self, "point");
  v8 = v6 ^ (int)v7;

  return v8;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (CGPoint)point
{
  double x;
  double y;
  CGPoint result;

  x = self->_point.x;
  y = self->_point.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  self->_point = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
}

@end
