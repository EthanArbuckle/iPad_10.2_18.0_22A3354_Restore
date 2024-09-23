@implementation UIUDedupeElement

- (UIUDedupeElement)initWithContents:(id)a3
{
  DedupeElementCompat *v4;
  UIUDedupeElement *v5;
  DedupeElementCompat *underlyingObject;
  objc_super v8;

  v4 = (DedupeElementCompat *)a3;
  v8.receiver = self;
  v8.super_class = (Class)UIUDedupeElement;
  v5 = -[UIUDedupeElement init](&v8, sel_init);
  underlyingObject = v5->_underlyingObject;
  v5->_underlyingObject = v4;

  return v5;
}

- (BOOL)isDuplicate
{
  void *v2;
  char v3;

  -[UIUDedupeElement underlyingObject](self, "underlyingObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDuplicate");

  return v3;
}

- (CGRect)rect
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[UIUDedupeElement underlyingObject](self, "underlyingObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uiObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "boundingBox");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)setIsDuplicate:(BOOL)a3
{
  self->_isDuplicate = a3;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (DedupeElementCompat)underlyingObject
{
  return (DedupeElementCompat *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
