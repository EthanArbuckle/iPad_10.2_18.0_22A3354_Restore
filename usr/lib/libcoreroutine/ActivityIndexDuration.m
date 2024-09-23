@implementation ActivityIndexDuration

- (ActivityIndexDuration)initWithType:(unint64_t)a3 index:(unint64_t)a4 duration:(double)a5
{
  ActivityIndexDuration *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ActivityIndexDuration;
  result = -[ActivityIndexDuration init](&v9, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_index = a4;
    result->_duration = a5;
  }
  return result;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

@end
