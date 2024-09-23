@implementation CSSignificantUserInteraction

- (CSSignificantUserInteraction)initWithTimestamp:(unint64_t)a3 type:(unsigned __int8)a4
{
  CSSignificantUserInteraction *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSSignificantUserInteraction;
  result = -[CSSignificantUserInteraction init](&v7, "init");
  if (result)
  {
    result->_timestamp = a3;
    result->_type = a4;
  }
  return result;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unsigned)type
{
  return self->_type;
}

@end
