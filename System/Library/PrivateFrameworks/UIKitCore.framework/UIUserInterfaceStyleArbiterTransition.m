@implementation UIUserInterfaceStyleArbiterTransition

- (id)description
{
  int64_t v3;
  __CFString *v4;
  void *v5;

  v3 = -[UIUserInterfaceStyleArbiterTransition type](self, "type");
  if (v3 == 2)
  {
    v4 = CFSTR("Sunset");
  }
  else if (v3 == 1)
  {
    v4 = CFSTR("Sunrise");
  }
  else if (v3)
  {
    v4 = CFSTR("Unknown");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Time: %02ld:%02ld"), -[UIUserInterfaceStyleArbiterTransition hour](self, "hour"), -[UIUserInterfaceStyleArbiterTransition minute](self, "minute"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p: %@>"), objc_opt_class(), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)hour
{
  return self->_hour;
}

- (void)setHour:(int64_t)a3
{
  self->_hour = a3;
}

- (int64_t)minute
{
  return self->_minute;
}

- (void)setMinute:(int64_t)a3
{
  self->_minute = a3;
}

@end
