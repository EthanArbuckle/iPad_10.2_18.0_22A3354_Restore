@implementation InterruptionHandle

- (int64_t)interruptionKind
{
  return self->_interruptionKind;
}

- (void)setInterruptionKind:(int64_t)a3
{
  self->_interruptionKind = a3;
}

@end
