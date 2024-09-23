@implementation _UIWindowSceneActivationIdentifier

+ (id)identifierWithLocation:(CGPoint)a3 inView:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v6;
  uint64_t v7;

  y = a3.y;
  x = a3.x;
  v6 = a4;
  v7 = objc_opt_new();
  *(CGFloat *)(v7 + 16) = x;
  *(CGFloat *)(v7 + 24) = y;
  objc_storeWeak((id *)(v7 + 8), v6);

  return (id)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_opt_class();
  v4 = objc_opt_new();
  -[_UIWindowSceneActivationIdentifier location](self, "location");
  *(_QWORD *)(v4 + 16) = v5;
  *(_QWORD *)(v4 + 24) = v6;
  -[_UIWindowSceneActivationIdentifier view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)(v4 + 8), v7);

  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  _UIWindowSceneActivationIdentifier *v4;
  _UIWindowSceneActivationIdentifier *v5;
  void *v6;
  void *v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v4 = (_UIWindowSceneActivationIdentifier *)a3;
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
      -[_UIWindowSceneActivationIdentifier view](v5, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIWindowSceneActivationIdentifier view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        -[_UIWindowSceneActivationIdentifier location](v5, "location");
        v10 = v9;
        v12 = v11;
        -[_UIWindowSceneActivationIdentifier location](self, "location");
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
  double v3;
  int v4;
  double v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[_UIWindowSceneActivationIdentifier location](self, "location");
  v4 = (int)v3;
  -[_UIWindowSceneActivationIdentifier location](self, "location");
  v6 = (int)v5 ^ v4;
  -[_UIWindowSceneActivationIdentifier view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") ^ v6;

  return v8;
}

- (CGPoint)location
{
  double x;
  double y;
  CGPoint result;

  x = self->_location.x;
  y = self->_location.y;
  result.y = y;
  result.x = x;
  return result;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
}

@end
