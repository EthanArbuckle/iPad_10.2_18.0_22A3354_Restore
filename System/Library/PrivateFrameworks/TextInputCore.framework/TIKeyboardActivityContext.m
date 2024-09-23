@implementation TIKeyboardActivityContext

- (unint64_t)fromState
{
  return self->_fromState;
}

- (unint64_t)toState
{
  return self->_toState;
}

- (void)setExcessMemoryInBytes:(unint64_t)a3
{
  self->_excessMemoryInBytes = a3;
}

+ (id)contextFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  id v6;

  v6 = objc_alloc_init((Class)a1);
  objc_msgSend(v6, "setFromState:", a3);
  objc_msgSend(v6, "setToState:", a4);
  return v6;
}

- (void)setToState:(unint64_t)a3
{
  self->_toState = a3;
}

- (void)setFromState:(unint64_t)a3
{
  self->_fromState = a3;
}

- (unint64_t)excessMemoryInBytes
{
  return self->_excessMemoryInBytes;
}

@end
