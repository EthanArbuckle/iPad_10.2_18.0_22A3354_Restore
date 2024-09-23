@implementation TIPointError

- (TIPointError)initWithErrorVector:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  TIPointError *result;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)TIPointError;
  result = -[TIPointError init](&v6, sel_init);
  if (result)
  {
    result->_errorVector.x = x;
    result->_errorVector.y = y;
  }
  return result;
}

- (TIPointError)initWithCoder:(id)a3
{
  id v4;
  TIPointError *v5;
  float v6;
  float v7;
  float v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TIPointError;
  v5 = -[TIPointError init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("TIPointErrorX"));
    v7 = v6;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("TIPointErrorY"));
    v5->_errorVector.x = v7;
    v5->_errorVector.y = v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CGFloat x;
  CGFloat y;
  id v7;

  v4 = a3;
  x = self->_errorVector.x;
  *(float *)&x = x;
  v7 = v4;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("TIPointErrorX"), x);
  y = self->_errorVector.y;
  *(float *)&y = y;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("TIPointErrorY"), y);

}

- (CGPoint)applyToPoint:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = a3.x + self->_errorVector.x;
  v4 = a3.y + self->_errorVector.y;
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TIPointError:<%f,%f>"), *(_QWORD *)&self->_errorVector.x, *(_QWORD *)&self->_errorVector.y);
}

- (CGPoint)errorVector
{
  double x;
  double y;
  CGPoint result;

  x = self->_errorVector.x;
  y = self->_errorVector.y;
  result.y = y;
  result.x = x;
  return result;
}

+ (TIPointError)errorWithErrorVector:(CGPoint)a3
{
  return -[TIPointError initWithErrorVector:]([TIPointError alloc], "initWithErrorVector:", a3.x, a3.y);
}

@end
