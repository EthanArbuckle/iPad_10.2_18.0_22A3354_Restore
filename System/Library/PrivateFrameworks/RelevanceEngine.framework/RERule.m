@implementation RERule

- (unint64_t)hash
{
  return (unint64_t)self->_priority;
}

- (RERule)init
{
  RERule *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RERule;
  result = -[RERule init](&v3, sel_init);
  if (result)
    result->_priority = 1000.0;
  return result;
}

- (float)priority
{
  return self->_priority;
}

- (void)setPriority:(float)a3
{
  self->_priority = a3;
}

- (BOOL)isEqual:(id)a3
{
  RERule *v4;
  BOOL v5;

  v4 = (RERule *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_priority == v4->_priority;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = LODWORD(self->_priority);
  return result;
}

@end
