@implementation CSSPUTriad

- (CSSPUTriad)initWithTimestamp:(unint64_t)a3 x:(float)a4 y:(float)a5 z:(float)a6
{
  CSSPUTriad *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CSSPUTriad;
  result = -[CSSPUTriad init](&v11, "init");
  if (result)
  {
    result->_c_struct.timestamp = a3;
    result->_c_struct.x = a4;
    result->_c_struct.y = a5;
    result->_c_struct.z = a6;
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

- (CSSPUTriad_Struct)c_struct
{
  return &self->_c_struct;
}

@end
