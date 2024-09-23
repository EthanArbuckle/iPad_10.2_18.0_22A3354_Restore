@implementation _TUIElementButtonStateInstantiatorObject

- (NSArray)states
{
  return self->_states;
}

- (void)setStates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_states, 0);
}

@end
