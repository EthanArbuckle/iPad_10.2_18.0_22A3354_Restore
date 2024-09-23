@implementation UIDictationConnectionFilterState

- (__CFString)transform
{
  return self->_transform;
}

- (void)setTransform:(__CFString *)a3
{
  self->_transform = a3;
}

- (id)pendingDictationCommand
{
  return self->_pendingDictationCommand;
}

- (void)setPendingDictationCommand:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingDictationCommand, 0);
}

@end
