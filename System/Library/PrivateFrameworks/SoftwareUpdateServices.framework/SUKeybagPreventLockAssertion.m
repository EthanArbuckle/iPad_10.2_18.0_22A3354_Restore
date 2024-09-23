@implementation SUKeybagPreventLockAssertion

- (SUKeybagPreventLockAssertion)initWithKeybagAssertion:(__MKBAssertion *)a3
{
  SUKeybagPreventLockAssertion *v5;
  void *v8;
  objc_super v9;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUKeybagInterface.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assertion"));

  }
  v9.receiver = self;
  v9.super_class = (Class)SUKeybagPreventLockAssertion;
  v5 = -[SUKeybagPreventLockAssertion init](&v9, sel_init);
  if (v5)
  {
    CFRetain(a3);
    v5->_assertion = a3;
    v5->_invalidated = 0;
  }
  return v5;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  -[SUKeybagPreventLockAssertion invalidate](self, "invalidate");
  if (self->_assertion)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUKeybagInterface.m"), 58, CFSTR("MKBAssertion must be nil at this point in dealloc"));

  }
  v5.receiver = self;
  v5.super_class = (Class)SUKeybagPreventLockAssertion;
  -[SUKeybagPreventLockAssertion dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  __MKBAssertion *assertion;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    assertion = self->_assertion;
    if (assertion)
    {
      CFRelease(assertion);
      self->_assertion = 0;
    }
  }
}

@end
