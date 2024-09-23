@implementation TMLInsets

- (TMLInsets)initWithInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  TMLInsets *result;
  objc_super v8;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v8.receiver = self;
  v8.super_class = (Class)TMLInsets;
  result = -[TMLInsets init](&v8, sel_init);
  if (result)
  {
    result->_insets.top = top;
    result->_insets.left = left;
    result->_insets.bottom = bottom;
    result->_insets.right = right;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, v7, a3);
  return (id)objc_msgSend_initWithInsets_(v8, v9, self->_insets.top, self->_insets.left, self->_insets.bottom, self->_insets.right);
}

- (id)UIEdgeInsetsValue
{
  return (id)objc_msgSend_valueWithUIEdgeInsets_(MEMORY[0x24BDD1968], a2, self->_insets.top, self->_insets.left, self->_insets.bottom, self->_insets.right);
}

- (UIEdgeInsets)UIEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

+ (void)initializeJSContext:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  _QWORD v11[5];

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_22AD3C21C;
  v11[3] = &unk_24F4FE758;
  v11[4] = a1;
  v3 = a3;
  v4 = (void *)MEMORY[0x22E2E7E44](v11);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v5, v6, v4, CFSTR("insets"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, v8, v4, CFSTR("UIEdgeInsetsMake"));

  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, v10, &unk_24F4FE798, CFSTR("UIEdgeInsetsEqualToEdgeInsets"));
}

- (double)top
{
  return self->_insets.top;
}

- (double)left
{
  return self->_insets.left;
}

- (double)bottom
{
  return self->_insets.bottom;
}

- (double)right
{
  return self->_insets.right;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)TMLInsets;
  -[TMLInsets description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v5, self->_insets.top, CFSTR("%@{top: %.2f, left: %.2f, bottom: %.2f, right: %.2f"), v4, *(_QWORD *)&self->_insets.top, *(_QWORD *)&self->_insets.left, *(_QWORD *)&self->_insets.bottom, *(_QWORD *)&self->_insets.right);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
