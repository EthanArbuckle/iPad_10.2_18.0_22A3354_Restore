@implementation RUIScriptingStaticValue

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p '%s'>"), objc_opt_class(), self, -[RUIScriptingStaticValue identifier](self, "identifier"));
}

- (const)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(const char *)a3
{
  self->_identifier = a3;
}

- (void)getter
{
  return self->_getter;
}

- (void)setGetter:(void *)a3
{
  self->_getter = a3;
}

- (void)setter
{
  return self->_setter;
}

- (void)setSetter:(void *)a3
{
  self->_setter = a3;
}

- (int)JSPropertyAttributes
{
  return self->_JSPropertyAttributes;
}

- (void)setJSPropertyAttributes:(int)a3
{
  self->_JSPropertyAttributes = a3;
}

@end
