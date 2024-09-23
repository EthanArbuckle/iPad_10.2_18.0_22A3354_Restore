@implementation AppleTypeCRetimerPanicStatus

- (AppleTypeCRetimerPanicStatus)initWithPanicState:(BOOL)a3 assertID:(unsigned int)a4
{
  AppleTypeCRetimerPanicStatus *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AppleTypeCRetimerPanicStatus;
  result = -[AppleTypeCRetimerPanicStatus init](&v7, sel_init);
  if (result)
  {
    result->_fwPanic = a3;
    result->_assertID = a4;
  }
  return result;
}

- (id)description
{
  const __CFString *v2;

  v2 = CFSTR("YES");
  if (!self->_fwPanic)
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("panicState=%@ assertID=%u"), v2, self->_assertID);
}

- (BOOL)fwPanic
{
  return self->_fwPanic;
}

- (void)setFwPanic:(BOOL)a3
{
  self->_fwPanic = a3;
}

- (unsigned)assertID
{
  return self->_assertID;
}

- (void)setAssertID:(unsigned int)a3
{
  self->_assertID = a3;
}

@end
