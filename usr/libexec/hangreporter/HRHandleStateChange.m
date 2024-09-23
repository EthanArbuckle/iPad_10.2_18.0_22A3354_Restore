@implementation HRHandleStateChange

- (HRHandleStateChange)initWithType:(int64_t)a3 andTimestamp:(unint64_t)a4 andName:(unint64_t)a5
{
  HRHandleStateChange *v8;
  HRHandleStateChange *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HRHandleStateChange;
  v8 = -[HRHandleStateChange init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[HRHandleStateChange setType:](v8, "setType:", a3);
    -[HRHandleStateChange setTimestamp:](v9, "setTimestamp:", a4);
    -[HRHandleStateChange setName:](v9, "setName:", a5);
  }
  return v9;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)name
{
  return self->_name;
}

- (void)setName:(unint64_t)a3
{
  self->_name = a3;
}

@end
