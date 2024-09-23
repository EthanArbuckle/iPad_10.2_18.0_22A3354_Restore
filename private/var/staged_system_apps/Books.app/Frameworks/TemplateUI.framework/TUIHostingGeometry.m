@implementation TUIHostingGeometry

- (TUIHostingGeometry)initWithRequestedSize:(CGSize)a3 layoutSize:(CGSize)a4 erasableInsets:(UIEdgeInsets)a5
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  CGFloat height;
  CGFloat width;
  CGFloat v11;
  CGFloat v12;
  TUIHostingGeometry *result;
  objc_super v14;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  height = a4.height;
  width = a4.width;
  v11 = a3.height;
  v12 = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)TUIHostingGeometry;
  result = -[TUIHostingGeometry init](&v14, "init");
  if (result)
  {
    result->_requestedSize.width = v12;
    result->_requestedSize.height = v11;
    result->_layoutSize.width = width;
    result->_layoutSize.height = height;
    result->_erasableInsets.top = top;
    result->_erasableInsets.left = left;
    result->_erasableInsets.bottom = bottom;
    result->_erasableInsets.right = right;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v7;

  v4 = a3;
  v5 = objc_opt_class(v4);
  if (v5 != objc_opt_class(TUIHostingGeometry) || v4 == 0)
    v7 = 0;
  else
    v7 = -[TUIHostingGeometry isEqualToGeometry:](self, "isEqualToGeometry:", v4);

  return v7;
}

- (BOOL)isEqualToGeometry:(id)a3
{
  id v4;
  double v5;
  double v6;
  BOOL v7;
  double v8;
  double v9;
  BOOL v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  double v16;

  v4 = a3;
  objc_msgSend(v4, "requestedSize");
  v7 = self->_requestedSize.width == v6 && self->_requestedSize.height == v5;
  if (v7
    && ((objc_msgSend(v4, "layoutSize"), self->_layoutSize.width == v9)
      ? (v10 = self->_layoutSize.height == v8)
      : (v10 = 0),
        v10))
  {
    objc_msgSend(v4, "erasableInsets");
    v15 = self->_erasableInsets.left == v14;
    if (self->_erasableInsets.top != v16)
      v15 = 0;
    if (self->_erasableInsets.right != v13)
      v15 = 0;
    v11 = self->_erasableInsets.bottom == v12 && v15;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = NSStringFromCGSize(self->_requestedSize);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = NSStringFromCGSize(self->_layoutSize);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = NSStringFromUIEdgeInsets(self->_erasableInsets);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p requestedSize=%@ layoutSize=%@ erasableInsets=%@>"), v5, self, v7, v9, v11));

  return v12;
}

- (CGSize)requestedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_requestedSize.width;
  height = self->_requestedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)layoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_layoutSize.width;
  height = self->_layoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)erasableInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_erasableInsets.top;
  left = self->_erasableInsets.left;
  bottom = self->_erasableInsets.bottom;
  right = self->_erasableInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

@end
