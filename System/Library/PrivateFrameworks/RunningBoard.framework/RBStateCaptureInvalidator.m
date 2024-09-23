@implementation RBStateCaptureInvalidator

- (id)initWithHandle:(id)result
{
  void *v3;
  void *v4;
  objc_super v5;

  if (result)
  {
    v3 = result;
    if (!a2)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithHandle_, v3, CFSTR("RBStateCaptureManager.m"), 69, CFSTR("Handle cannot be 0."));

    }
    v5.receiver = v3;
    v5.super_class = (Class)RBStateCaptureInvalidator;
    result = objc_msgSendSuper2(&v5, sel_init);
    if (result)
      *((_QWORD *)result + 1) = a2;
  }
  return result;
}

- (void)invalidate
{
  void *v3;
  void *v4;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    if (self->_handle)
    {
      os_state_remove_handler();
      os_unfair_lock_lock((os_unfair_lock_t)&_lock);
      v3 = (void *)_registeredStateCaptureBlocks;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_handle);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeObjectForKey:", v4);

      os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
    }
  }
}

@end
