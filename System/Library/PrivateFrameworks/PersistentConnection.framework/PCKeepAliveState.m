@implementation PCKeepAliveState

- (unsigned)subState
{
  return self->_subState;
}

- (unsigned)state
{
  return self->_state;
}

- (PCKeepAliveState)initWithKeepAliveState:(unsigned __int8)a3 subState:(unsigned __int8)a4
{
  PCKeepAliveState *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PCKeepAliveState;
  result = -[PCKeepAliveState init](&v6, sel_init, a3, a4);
  if (result)
  {
    result->_state = a3;
    result->_subState = a3;
  }
  return result;
}

- (void)setState:(unsigned __int8)a3
{
  self->_state = a3;
}

- (void)setSubState:(unsigned __int8)a3
{
  self->_subState = a3;
}

@end
