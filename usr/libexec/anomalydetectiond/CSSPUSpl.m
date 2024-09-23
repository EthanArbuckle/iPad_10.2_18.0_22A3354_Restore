@implementation CSSPUSpl

- (CSSPUSpl)initWithTimestamp:(unint64_t)a3 rms:(float)a4
{
  CSSPUSpl *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSSPUSpl;
  result = -[CSSPUSpl init](&v7, "init");
  if (result)
  {
    result->_c_struct.timestamp = a3;
    result->_c_struct.rms = a4;
  }
  return result;
}

- (unint64_t)timestamp
{
  return self->_c_struct.timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_c_struct.timestamp = a3;
}

- (CSSPUSpl_Struct)c_struct
{
  return &self->_c_struct;
}

@end
