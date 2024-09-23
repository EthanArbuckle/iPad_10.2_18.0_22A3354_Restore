@implementation SWInteraction

- (SWInteraction)initWithType:(unint64_t)a3
{
  SWInteraction *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SWInteraction;
  result = -[SWInteraction init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  SWInteraction *v4;
  unint64_t v5;
  BOOL v6;

  v4 = (SWInteraction *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[SWInteraction type](self, "type");
      v6 = v5 == -[SWInteraction type](v4, "type");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (NSString)description
{
  const __CFString *v3;

  if (-[SWInteraction type](self, "type") == 1)
  {
    v3 = CFSTR("interactable");
  }
  else if (-[SWInteraction type](self, "type") == 2)
  {
    v3 = CFSTR("selectable");
  }
  else
  {
    v3 = CFSTR("none");
  }
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; type: %@>"),
                       objc_opt_class(),
                       self,
                       v3);
}

- (unint64_t)type
{
  return self->_type;
}

@end
