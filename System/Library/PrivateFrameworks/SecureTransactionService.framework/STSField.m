@implementation STSField

- (unint64_t)fieldType
{
  return self->_fieldType;
}

- (unint64_t)terminalType
{
  return self->_terminalType;
}

- (BOOL)odaRequired
{
  return self->_odaRequired;
}

- (void)setFieldType:(unint64_t)a3
{
  self->_fieldType = a3;
}

- (void)setTerminalType:(unint64_t)a3
{
  self->_terminalType = a3;
}

- (void)setODARequired:(BOOL)a3
{
  self->_odaRequired = a3;
}

@end
