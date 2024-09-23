@implementation STSExpressEventInfo

- (STSExpressEventInfo)initWithState:(unsigned int)a3
{
  STSExpressEventInfo *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STSExpressEventInfo;
  result = -[STSExpressEventInfo init](&v5, sel_init);
  if (result)
    result->_state = a3;
  return result;
}

- (unsigned)state
{
  return self->_state;
}

@end
