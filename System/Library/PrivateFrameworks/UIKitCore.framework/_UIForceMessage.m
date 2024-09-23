@implementation _UIForceMessage

+ (id)observe:(id)a3
{
  void (**v3)(id, void *);
  void *v4;

  v3 = (void (**)(id, void *))a3;
  v4 = (void *)objc_opt_new();
  v3[2](v3, v4);

  return v4;
}

+ (id)reset
{
  _BYTE *v2;

  v2 = (_BYTE *)objc_opt_new();
  v2[8] = 1;
  return v2;
}

- (double)touchForce
{
  return self->touchForce;
}

- (void)setTouchForce:(double)a3
{
  self->touchForce = a3;
}

- (unint64_t)stage
{
  return self->stage;
}

- (void)setStage:(unint64_t)a3
{
  self->stage = a3;
}

- (double)timestamp
{
  return self->timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->timestamp = a3;
}

- (BOOL)isReset
{
  return self->_reset;
}

@end
