@implementation RBProcessCPUMinimumLimits

- (RBProcessCPUMinimumLimits)initWithPercentage:(unint64_t)a3 duration:(unint64_t)a4
{
  RBProcessCPUMinimumLimits *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RBProcessCPUMinimumLimits;
  result = -[RBProcessCPUMinimumLimits init](&v7, sel_init);
  if (result)
  {
    result->_percentage = a3;
    result->_duration = a4;
  }
  return result;
}

- (id)unionLimit:(id)a3
{
  RBProcessCPUMinimumLimits *v4;
  RBProcessCPUMinimumLimits *v5;
  unint64_t duration;
  unint64_t v7;
  unint64_t percentage;
  unint64_t v9;
  RBProcessCPUMinimumLimits *v10;
  unint64_t v11;
  RBProcessCPUMinimumLimits *v12;

  v4 = (RBProcessCPUMinimumLimits *)a3;
  v5 = v4;
  if (v4
    && v4 != self
    && ((duration = self->_duration,
         v7 = -[RBProcessCPUMinimumLimits duration](v4, "duration"),
         percentage = self->_percentage,
         v9 = -[RBProcessCPUMinimumLimits percentage](v5, "percentage"),
         v9 > percentage)
     || v7 > duration))
  {
    if (v9 <= percentage)
      v11 = percentage;
    else
      v11 = v9;
    if (v7 <= duration)
      v7 = duration;
    v10 = -[RBProcessCPUMinimumLimits initWithPercentage:duration:]([RBProcessCPUMinimumLimits alloc], "initWithPercentage:duration:", v11, v7);
  }
  else
  {
    v10 = self;
  }
  v12 = v10;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  RBProcessCPUMinimumLimits *v4;
  RBProcessCPUMinimumLimits *v5;
  uint64_t v6;
  BOOL v7;

  v4 = (RBProcessCPUMinimumLimits *)a3;
  v5 = v4;
  v7 = 1;
  if (self != v4)
  {
    if (!v4
      || (v6 = objc_opt_class(), v6 == objc_opt_class())
      && (self->_percentage != v5->_percentage || self->_duration != v5->_duration))
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;

  v2 = 0xBF58476D1CE4E5B9 * (self->_percentage ^ (self->_percentage >> 30));
  v3 = 0xBF58476D1CE4E5B9 * (self->_duration ^ (self->_duration >> 30));
  return (0x94D049BB133111EBLL * (v2 ^ (v2 >> 27))) ^ (((0x94D049BB133111EBLL * (v3 ^ (v3 >> 27))) ^ (0x94D049BB133111EBLL * (v2 ^ (v2 >> 27)))) >> 31) ^ (0x94D049BB133111EBLL * (v3 ^ (v3 >> 27)));
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| percentage:%lu duration:%lu"), v4, self->_percentage, self->_duration);

  return v5;
}

- (unint64_t)percentage
{
  return self->_percentage;
}

- (unint64_t)duration
{
  return self->_duration;
}

@end
