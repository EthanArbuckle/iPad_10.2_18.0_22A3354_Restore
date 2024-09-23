@implementation TMLRect

- (TMLRect)initWithRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  TMLRect *result;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)TMLRect;
  result = -[TMLRect init](&v8, sel_init);
  if (result)
  {
    result->_rect.origin.x = x;
    result->_rect.origin.y = y;
    result->_rect.size.width = width;
    result->_rect.size.height = height;
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
  return (id)objc_msgSend_initWithRect_(v8, v9, self->_rect.origin.x, self->_rect.origin.y, self->_rect.size.width, self->_rect.size.height);
}

- (id)CGRectValue
{
  return (id)objc_msgSend_valueWithCGRect_(MEMORY[0x24BDD1968], a2, self->_rect.origin.x, self->_rect.origin.y, self->_rect.size.width, self->_rect.size.height);
}

+ (void)initializeJSContext:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  double v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  const char *v20;
  double v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  void *v30;
  const char *v31;
  double v32;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v7 = (void *)objc_msgSend_initWithRect_(v5, v6, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, v9, v7, CFSTR("CGRectZero"));

  v10 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = sub_22AD1F5C4;
  v36[3] = &unk_24F4FD468;
  v36[4] = a1;
  v11 = (void *)MEMORY[0x22E2E7E44](v36);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v12, v13, v11, CFSTR("rect"));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, v15, v11, CFSTR("CGRectMake"));

  objc_msgSend_setObject_forKeyedSubscript_(v4, v16, v17, &unk_24F4FD4A8, CFSTR("CGRectEqualToRect"));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v18, v19, &unk_24F4FD4C8, CFSTR("CGRectIntersectsRect"));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v20, v21, &unk_24F4FD4E8, CFSTR("CGRectContainsRect"));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v22, v23, &unk_24F4FD528, CFSTR("CGRectContainsPoint"));
  v35[0] = v10;
  v35[1] = 3221225472;
  v35[2] = sub_22AD1F858;
  v35[3] = &unk_24F4FD548;
  v35[4] = a1;
  v24 = (void *)MEMORY[0x22E2E7E44](v35);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v25, v26, v24, CFSTR("CGRectIntersection"));

  v34[0] = v10;
  v34[1] = 3221225472;
  v34[2] = sub_22AD1F920;
  v34[3] = &unk_24F4FD568;
  v34[4] = a1;
  v27 = (void *)MEMORY[0x22E2E7E44](v34);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v28, v29, v27, CFSTR("CGRectInset"));

  v33[0] = v10;
  v33[1] = 3221225472;
  v33[2] = sub_22AD1F9B0;
  v33[3] = &unk_24F4FD588;
  v33[4] = a1;
  v30 = (void *)MEMORY[0x22E2E7E44](v33);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v31, v32, v30, CFSTR("toRect"));

}

- (double)x
{
  return self->_rect.origin.x;
}

- (double)y
{
  return self->_rect.origin.y;
}

- (double)width
{
  return self->_rect.size.width;
}

- (double)height
{
  return self->_rect.size.height;
}

- (TMLPoint)origin
{
  TMLPoint *v3;
  const char *v4;

  v3 = [TMLPoint alloc];
  return (TMLPoint *)(id)objc_msgSend_initWithPoint_(v3, v4, self->_rect.origin.x, self->_rect.origin.y);
}

- (TMLSize)size
{
  TMLSize *v3;
  const char *v4;

  v3 = [TMLSize alloc];
  return (TMLSize *)(id)objc_msgSend_initWithSize_(v3, v4, self->_rect.size.width, self->_rect.size.height);
}

- (id)inset:(double)a3 :(double)a4
{
  id v7;
  const char *v8;
  CGRect v10;

  v7 = objc_alloc((Class)objc_opt_class());
  v10 = CGRectInset(self->_rect, a3, a4);
  return (id)objc_msgSend_initWithRect_(v7, v8, v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
}

- (id)originInset:(double)a3 :(double)a4
{
  id v7;
  const char *v8;

  v7 = objc_alloc((Class)objc_opt_class());
  return (id)objc_msgSend_initWithRect_(v7, v8, self->_rect.origin.x + a3, self->_rect.origin.y + a4, self->_rect.size.width - a3, self->_rect.size.height - a4);
}

- (id)offset:(double)a3 :(double)a4
{
  id v7;
  const char *v8;
  CGRect v10;

  v7 = objc_alloc((Class)objc_opt_class());
  v10 = CGRectOffset(self->_rect, a3, a4);
  return (id)objc_msgSend_initWithRect_(v7, v8, v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
}

- (id)withWidth:(double)a3
{
  double x;
  double y;
  double height;
  id v7;
  const char *v8;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  height = self->_rect.size.height;
  v7 = objc_alloc((Class)objc_opt_class());
  return (id)objc_msgSend_initWithRect_(v7, v8, x, y, a3, height);
}

- (id)withHeight:(double)a3
{
  double x;
  double y;
  double width;
  id v7;
  const char *v8;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  v7 = objc_alloc((Class)objc_opt_class());
  return (id)objc_msgSend_initWithRect_(v7, v8, x, y, width, a3);
}

- (id)atOriginX:(double)a3 y:(double)a4
{
  double width;
  double height;
  id v8;
  const char *v9;

  width = self->_rect.size.width;
  height = self->_rect.size.height;
  v8 = objc_alloc((Class)objc_opt_class());
  return (id)objc_msgSend_initWithRect_(v8, v9, a3, a4, width, height);
}

- (id)atOrigin:(id)a3
{
  double v3;
  double width;
  double height;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  const char *v11;

  width = self->_rect.size.width;
  height = self->_rect.size.height;
  objc_msgSend_point(a3, a2, v3);
  v7 = v6;
  v9 = v8;
  v10 = objc_alloc((Class)objc_opt_class());
  return (id)objc_msgSend_initWithRect_(v10, v11, v7, v9, width, height);
}

- (double)minx
{
  return CGRectGetMinX(self->_rect);
}

- (double)midx
{
  return CGRectGetMidX(self->_rect);
}

- (double)maxx
{
  return CGRectGetMaxX(self->_rect);
}

- (double)miny
{
  return CGRectGetMinY(self->_rect);
}

- (double)midy
{
  return CGRectGetMidY(self->_rect);
}

- (double)maxy
{
  return CGRectGetMaxY(self->_rect);
}

- (TMLPoint)minpoint
{
  TMLPoint *v3;
  const char *v4;
  double v5;
  double v6;
  double v7;
  const char *v8;
  const char *v9;
  double v10;

  v3 = [TMLPoint alloc];
  objc_msgSend_minx(self, v4, v5);
  v7 = v6;
  objc_msgSend_miny(self, v8, v6);
  return (TMLPoint *)(id)objc_msgSend_initWithPoint_(v3, v9, v7, v10);
}

- (TMLPoint)midpoint
{
  TMLPoint *v3;
  const char *v4;
  double v5;
  double v6;
  double v7;
  const char *v8;
  const char *v9;
  double v10;

  v3 = [TMLPoint alloc];
  objc_msgSend_midx(self, v4, v5);
  v7 = v6;
  objc_msgSend_midy(self, v8, v6);
  return (TMLPoint *)(id)objc_msgSend_initWithPoint_(v3, v9, v7, v10);
}

- (TMLPoint)maxpoint
{
  TMLPoint *v3;
  const char *v4;
  double v5;
  double v6;
  double v7;
  const char *v8;
  const char *v9;
  double v10;

  v3 = [TMLPoint alloc];
  objc_msgSend_maxx(self, v4, v5);
  v7 = v6;
  objc_msgSend_maxy(self, v8, v6);
  return (TMLPoint *)(id)objc_msgSend_initWithPoint_(v3, v9, v7, v10);
}

- (id)applyAffineTransform:(id)a3
{
  id v4;
  const char *v5;
  id v6;
  double v7;
  const char *v8;
  void *v9;
  CGAffineTransform v11;
  CGRect v12;

  v4 = a3;
  v6 = objc_alloc((Class)objc_opt_class());
  if (v4)
    objc_msgSend_transform(v4, v5, v7);
  else
    memset(&v11, 0, sizeof(v11));
  v12 = CGRectApplyAffineTransform(self->_rect, &v11);
  v9 = (void *)objc_msgSend_initWithRect_(v6, v8, v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);

  return v9;
}

- (id)integral
{
  id v3;
  const char *v4;
  CGRect v6;

  v3 = objc_alloc((Class)objc_opt_class());
  v6 = CGRectIntegral(self->_rect);
  return (id)objc_msgSend_initWithRect_(v3, v4, v6.origin.x, v6.origin.y, v6.size.width, v6.size.height);
}

- (id)min:(double)a3 :(double)a4
{
  id v7;
  const char *v8;
  double width;
  double height;

  v7 = objc_alloc((Class)objc_opt_class());
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  if (width <= a3)
    width = a3;
  if (height <= a4)
    height = a4;
  return (id)objc_msgSend_initWithRect_(v7, v8, self->_rect.origin.x, self->_rect.origin.y, width, height);
}

- (id)max:(double)a3 :(double)a4
{
  id v7;
  const char *v8;
  double width;
  double height;

  v7 = objc_alloc((Class)objc_opt_class());
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  if (width >= a3)
    width = a3;
  if (height >= a4)
    height = a4;
  return (id)objc_msgSend_initWithRect_(v7, v8, self->_rect.origin.x, self->_rect.origin.y, width, height);
}

- (id)applyScale:(double)a3
{
  id v5;
  const char *v6;
  void *v7;

  v5 = objc_alloc((Class)objc_opt_class());
  if (a3 <= 0.0)
    v7 = (void *)objc_msgSend_initWithRect_(v5, v6, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  else
    v7 = (void *)objc_msgSend_initWithRect_(v5, v6, self->_rect.origin.x * a3, self->_rect.origin.y * a3, self->_rect.size.width * a3, self->_rect.size.height * a3);
  return v7;
}

- (id)description
{
  return NSStringFromCGRect(self->_rect);
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
