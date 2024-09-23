@implementation TMLPoint

- (TMLPoint)initWithPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  TMLPoint *result;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)TMLPoint;
  result = -[TMLPoint init](&v6, sel_init);
  if (result)
  {
    result->_point.x = x;
    result->_point.y = y;
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
  return (id)objc_msgSend_initWithPoint_(v8, v9, self->_point.x, self->_point.y);
}

- (id)CGPointValue
{
  return (id)objc_msgSend_valueWithCGPoint_(MEMORY[0x24BDD1968], a2, self->_point.x, self->_point.y);
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
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v7 = (void *)objc_msgSend_initWithPoint_(v5, v6, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, v9, v7, CFSTR("CGPointZero"));

  v10 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_22AD56330;
  v26[3] = &unk_24F501938;
  v26[4] = a1;
  v11 = (void *)MEMORY[0x22E2E7E44](v26);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v12, v13, v11, CFSTR("point"));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, v15, v11, CFSTR("CGPointMake"));

  objc_msgSend_setObject_forKeyedSubscript_(v4, v16, v17, &unk_24F501978, CFSTR("CGPointEqualToPoint"));
  v25[0] = v10;
  v25[1] = 3221225472;
  v25[2] = sub_22AD563CC;
  v25[3] = &unk_24F501998;
  v25[4] = a1;
  v18 = (void *)MEMORY[0x22E2E7E44](v25);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v19, v20, v18, CFSTR("CGPointApplyAffineTransform"));

  v24[0] = v10;
  v24[1] = 3221225472;
  v24[2] = sub_22AD56488;
  v24[3] = &unk_24F5019B8;
  v24[4] = a1;
  v21 = (void *)MEMORY[0x22E2E7E44](v24);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v22, v23, v21, CFSTR("CGPointMakeWithDictionaryRepresentation"));

}

- (double)x
{
  return self->_point.x;
}

- (double)y
{
  return self->_point.y;
}

- (id)description
{
  return NSStringFromCGPoint(self->_point);
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

@end
