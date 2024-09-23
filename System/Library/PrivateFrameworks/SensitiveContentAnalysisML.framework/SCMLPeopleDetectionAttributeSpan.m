@implementation SCMLPeopleDetectionAttributeSpan

- (SCMLPeopleDetectionAttributeSpan)init
{
  SCMLPeopleDetectionAttributeSpan *v2;
  SCMLPeopleDetectionAttributeSpan *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCMLPeopleDetectionAttributeSpan;
  v2 = -[SCMLPeopleDetectionAttributeSpan init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SCMLPeopleDetectionAttributeSpan setRange:](v2, "setRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  return v3;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (unsigned)gender
{
  return self->_gender;
}

- (void)setGender:(unsigned int)a3
{
  self->_gender = a3;
}

@end
