@implementation RKTextAnnotation

- (RKTextAnnotation)init
{
  -[RKTextAnnotation doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return self;
}

- (RKTextAnnotation)initWithRange:(_NSRange)a3 andType:(unint64_t)a4 machineGenerated:(BOOL)a5
{
  NSUInteger length;
  NSUInteger location;
  RKTextAnnotation *result;
  objc_super v10;

  length = a3.length;
  location = a3.location;
  v10.receiver = self;
  v10.super_class = (Class)RKTextAnnotation;
  result = -[RKTextAnnotation init](&v10, sel_init);
  if (result)
  {
    result->_range.location = location;
    result->_range.length = length;
    result->_type = a4;
    result->_machineGenerated = a5;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unint64_t v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[RKTextAnnotation range](self, "range");
    v8 = v7;
    v10 = 0;
    if (v6 == objc_msgSend(v5, "range") && v8 == v9)
    {
      v11 = -[RKTextAnnotation type](self, "type");
      v10 = v11 == objc_msgSend(v5, "type");
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[RKTextAnnotation range](self, "range");
  -[RKTextAnnotation range](self, "range");
  return v4 ^ v3 ^ -[RKTextAnnotation type](self, "type");
}

- (_NSRange)range
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  _NSRange v3;

  v3 = a3;
  objc_copyStruct(&self->_range, &v3, 16, 1, 0);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)machineGenerated
{
  return self->_machineGenerated;
}

- (void)setMachineGenerated:(BOOL)a3
{
  self->_machineGenerated = a3;
}

@end
