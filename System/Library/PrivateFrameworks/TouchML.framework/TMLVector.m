@implementation TMLVector

- (TMLVector)initWithVector:(CGVector)a3
{
  CGFloat dy;
  CGFloat dx;
  TMLVector *result;
  objc_super v6;

  dy = a3.dy;
  dx = a3.dx;
  v6.receiver = self;
  v6.super_class = (Class)TMLVector;
  result = -[TMLVector init](&v6, sel_init);
  if (result)
  {
    result->_vector.dx = dx;
    result->_vector.dy = dy;
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
  return (id)objc_msgSend_initWithVector_(v8, v9, self->_vector.dx, self->_vector.dy);
}

- (id)CGVectorValue
{
  double v2;

  return (id)objc_msgSend_value_withObjCType_(MEMORY[0x24BDD1968], a2, v2, &self->_vector, "{CGVector=dd}");
}

+ (void)initializeJSContext:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  _QWORD v9[5];

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_22AD781C8;
  v9[3] = &unk_24F503FB8;
  v9[4] = a1;
  v3 = a3;
  v4 = (void *)MEMORY[0x22E2E7E44](v9);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v5, v6, v4, CFSTR("vector"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, v8, v4, CFSTR("CGVectorMake"));

}

- (double)dx
{
  return self->_vector.dx;
}

- (double)dy
{
  return self->_vector.dy;
}

- (CGVector)vector
{
  double dx;
  double dy;
  CGVector result;

  dx = self->_vector.dx;
  dy = self->_vector.dy;
  result.dy = dy;
  result.dx = dx;
  return result;
}

@end
