@implementation UIIndexBarDisplayEntry_LegacyIOS

- (void)setTypeBounds:(CGRect)a3
{
  self->_typeBounds = a3;
}

- (void)setLine:(id)a3
{
  objc_storeStrong(&self->_line, a3);
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (id)line
{
  return self->_line;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIImage)image
{
  return self->_image;
}

- (CGRect)typeBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_typeBounds.origin.x;
  y = self->_typeBounds.origin.y;
  width = self->_typeBounds.size.width;
  height = self->_typeBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_line, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGPoint v10;
  CGRect v11;
  CGRect v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p"), v5, self);

  -[UIIndexBarDisplayEntry_LegacyIOS bounds](self, "bounds");
  NSStringFromCGRect(v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", bounds:%@"), v6);

  -[UIIndexBarDisplayEntry_LegacyIOS typeBounds](self, "typeBounds");
  NSStringFromCGRect(v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", typeBounds:%@"), v7);

  -[UIIndexBarDisplayEntry_LegacyIOS baselinePoint](self, "baselinePoint");
  NSStringFromCGPoint(v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", baselinePoint:%@"), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (CGPoint)baselinePoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_baselinePoint.x;
  y = self->_baselinePoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setBaselinePoint:(CGPoint)a3
{
  self->_baselinePoint = a3;
}

@end
