@implementation UIAccessibilityLocationDescriptor

- (UIAccessibilityLocationDescriptor)initWithName:(NSString *)name view:(UIView *)view
{
  return -[UIAccessibilityLocationDescriptor initWithName:point:inView:](self, "initWithName:point:inView:", name, view, NAN, NAN);
}

- (UIAccessibilityLocationDescriptor)initWithName:(NSString *)name point:(CGPoint)point inView:(UIView *)view
{
  double y;
  double x;
  objc_class *v9;
  UIView *v10;
  NSString *v11;
  void *v12;
  UIAccessibilityLocationDescriptor *v13;

  y = point.y;
  x = point.x;
  v9 = (objc_class *)MEMORY[0x1E0CB3498];
  v10 = view;
  v11 = name;
  v12 = (void *)objc_msgSend([v9 alloc], "initWithString:", v11);

  v13 = -[UIAccessibilityLocationDescriptor initWithAttributedName:point:inView:](self, "initWithAttributedName:point:inView:", v12, v10, x, y);
  return v13;
}

- (UIAccessibilityLocationDescriptor)initWithAttributedName:(NSAttributedString *)attributedName point:(CGPoint)point inView:(UIView *)view
{
  CGFloat y;
  CGFloat x;
  NSAttributedString *v9;
  UIView *v10;
  UIAccessibilityLocationDescriptor *v11;
  UIAccessibilityLocationDescriptor *v12;
  uint64_t v13;
  NSAttributedString *v14;
  objc_super v16;

  y = point.y;
  x = point.x;
  v9 = attributedName;
  v10 = view;
  v16.receiver = self;
  v16.super_class = (Class)UIAccessibilityLocationDescriptor;
  v11 = -[UIAccessibilityLocationDescriptor init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_point.x = x;
    v11->_point.y = y;
    objc_storeWeak((id *)&v11->_view, v10);
    v13 = -[NSAttributedString copy](v9, "copy");
    v14 = v12->_attributedName;
    v12->_attributedName = (NSAttributedString *)v13;

  }
  return v12;
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

- (NSString)name
{
  void *v2;
  void *v3;

  -[UIAccessibilityLocationDescriptor attributedName](self, "attributedName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[UIAccessibilityLocationDescriptor attributedName](self, "attributedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (v8
      && (-[UIAccessibilityLocationDescriptor view](self, "view"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "view"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          v9 == v10))
    {
      -[UIAccessibilityLocationDescriptor point](self, "point");
      v13 = v12;
      v15 = v14;
      objc_msgSend(v5, "point");
      v11 = v15 == v17 && v13 == v16;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  -[UIAccessibilityLocationDescriptor view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = (void *)MEMORY[0x1E0CB3B18];
  -[UIAccessibilityLocationDescriptor point](self, "point");
  objc_msgSend(v5, "valueWithCGPoint:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[UIAccessibilityLocationDescriptor attributedName](self, "attributedName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ v4 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (NSAttributedString)attributedName
{
  return self->_attributedName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedName, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end
