@implementation RMMediaSessionStatus

- (RMMediaSessionStatus)initWithInternal:(id *)a3
{
  RMMediaSessionStatus *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RMMediaSessionStatus;
  result = -[RMMediaSessionStatus init](&v5, "init");
  if (result)
    result->_internal.machAbsTimestamp = a3->var0;
  return result;
}

- (NSString)shortDescription
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("State: %.0f"), *(_QWORD *)&self->_internal.machAbsTimestamp);
}

@end
