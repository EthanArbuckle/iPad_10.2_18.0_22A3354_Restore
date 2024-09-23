@implementation CSSPUMag

- (CSSPUMag)initWithStruct:(const MagSample *)a3
{
  CSSPUMag *result;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSSPUMag;
  result = -[CSSPUMag init](&v6, "init");
  if (result)
  {
    v5 = *(_OWORD *)&a3->x;
    result->_c_struct.timestamp = a3->timestamp;
    *(_OWORD *)&result->_c_struct.x = v5;
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

- (MagSample)c_struct
{
  return &self->_c_struct;
}

@end
