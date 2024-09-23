@implementation PXBarAnimationOptions

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  int64_t v5;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = -[PXBarAnimationOptions type](self, "type");
  -[PXBarAnimationOptions duration](self, "duration");
  return (id)objc_msgSend(v4, "initWithType:duration:", v5);
}

- (int64_t)type
{
  return self->_type;
}

- (double)duration
{
  return self->_duration;
}

- (PXBarAnimationOptions)initWithType:(int64_t)a3 duration:(double)a4
{
  PXBarAnimationOptions *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXBarAnimationOptions;
  result = -[PXBarAnimationOptions init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_duration = a4;
  }
  return result;
}

- (PXBarAnimationOptions)initWithType:(int64_t)a3
{
  double v3;

  v3 = *MEMORY[0x1E0DC51A0];
  if (!a3)
    v3 = 0.0;
  return -[PXBarAnimationOptions initWithType:duration:](self, "initWithType:duration:", v3);
}

- (PXBarAnimationOptions)init
{
  return -[PXBarAnimationOptions initWithType:](self, "initWithType:", 0);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p, type=%lu, duration=%f>"), objc_opt_class(), self, self->_type, *(_QWORD *)&self->_duration);
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

@end
