@implementation TMLRange

- (TMLRange)initWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  TMLRange *result;
  objc_super v6;

  length = a3.length;
  location = a3.location;
  v6.receiver = self;
  v6.super_class = (Class)TMLRange;
  result = -[TMLRange init](&v6, sel_init);
  if (result)
  {
    result->_range.location = location;
    result->_range.length = length;
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
  double v10;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, v7, a3);
  return (id)objc_msgSend_initWithRange_(v8, v9, v10, self->_range.location, self->_range.length);
}

- (id)NSRangeValue
{
  double v2;

  return (id)objc_msgSend_valueWithRange_(MEMORY[0x24BDD1968], a2, v2, self->_range.location, self->_range.length);
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
  v9[2] = sub_22AD2015C;
  v9[3] = &unk_24F4FD5A8;
  v9[4] = a1;
  v3 = a3;
  v4 = (void *)MEMORY[0x22E2E7E44](v9);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v5, v6, v4, CFSTR("range"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, v8, v4, CFSTR("NSMakeRange"));

}

- (id)description
{
  return NSStringFromRange(self->_range);
}

- (unint64_t)location
{
  return self->_range.location;
}

- (unint64_t)length
{
  return self->_range.length;
}

@end
