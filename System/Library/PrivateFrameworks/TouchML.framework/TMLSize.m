@implementation TMLSize

- (TMLSize)initWithSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  TMLSize *result;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)TMLSize;
  result = -[TMLSize init](&v6, sel_init);
  if (result)
  {
    result->_size.width = width;
    result->_size.height = height;
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
  return (id)objc_msgSend_initWithSize_(v8, v9, self->_size.width, self->_size.height);
}

- (id)CGSizeValue
{
  return (id)objc_msgSend_valueWithCGSize_(MEMORY[0x24BDD1968], a2, self->_size.width, self->_size.height);
}

+ (void)initializeJSContext:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  _QWORD v17[5];

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v7 = (void *)objc_msgSend_initWithSize_(v5, v6, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, v9, v7, CFSTR("CGSizeZero"));

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_22AD25864;
  v17[3] = &unk_24F4FDB80;
  v17[4] = a1;
  v10 = (void *)MEMORY[0x22E2E7E44](v17);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v11, v12, v10, CFSTR("size"));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v13, v14, v10, CFSTR("CGSizeMake"));

  objc_msgSend_setObject_forKeyedSubscript_(v4, v15, v16, &unk_24F4FDBC0, CFSTR("CGSizeEqualToSize"));
}

- (double)width
{
  return self->_size.width;
}

- (double)height
{
  return self->_size.height;
}

- (id)extend:(double)a3 :(double)a4
{
  id v7;
  const char *v8;

  v7 = objc_alloc((Class)objc_opt_class());
  return (id)objc_msgSend_initWithSize_(v7, v8, self->_size.width + a3, self->_size.height + a4);
}

- (id)scale:(double)a3 :(double)a4
{
  id v7;
  const char *v8;

  v7 = objc_alloc((Class)objc_opt_class());
  return (id)objc_msgSend_initWithSize_(v7, v8, self->_size.width * a3, self->_size.height * a4);
}

- (id)asRect
{
  TMLRect *v3;
  const char *v4;

  v3 = [TMLRect alloc];
  return (id)objc_msgSend_initWithRect_(v3, v4, 0.0, 0.0, self->_size.width, self->_size.height);
}

- (id)min:(double)a3 :(double)a4
{
  id v7;
  const char *v8;
  double width;
  double height;

  v7 = objc_alloc((Class)objc_opt_class());
  width = self->_size.width;
  height = self->_size.height;
  if (width <= a3)
    width = a3;
  if (height <= a4)
    height = a4;
  return (id)objc_msgSend_initWithSize_(v7, v8, width, height);
}

- (id)max:(double)a3 :(double)a4
{
  id v7;
  const char *v8;
  double width;
  double height;

  v7 = objc_alloc((Class)objc_opt_class());
  width = self->_size.width;
  height = self->_size.height;
  if (width >= a3)
    width = a3;
  if (height >= a4)
    height = a4;
  return (id)objc_msgSend_initWithSize_(v7, v8, width, height);
}

- (id)description
{
  return NSStringFromCGSize(self->_size);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
