@implementation RMMediaSessionStatus

- (RMMediaSessionStatus)initWithInternal:(id *)a3
{
  RMMediaSessionStatus *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RMMediaSessionStatus;
  result = -[RMMediaSessionStatus init](&v5, sel_init);
  if (result)
    result->_internal.machAbsTimestamp = a3->var0;
  return result;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("State: %.0f"), *(_QWORD *)&self->_internal.machAbsTimestamp);
}

@end
