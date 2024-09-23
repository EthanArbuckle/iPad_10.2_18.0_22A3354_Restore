@implementation SBDisabledIdleTimer

- (void)reset
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SBDisabledIdleTimer;
  -[SBIdleTimerBase reset](&v2, sel_reset);
}

- (BOOL)isEqual:(id)a3
{
  SBDisabledIdleTimer *v4;
  void *v5;
  char v6;

  v4 = (SBDisabledIdleTimer *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqual");

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (BOOL)isDisabled
{
  return 1;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
  if (a3)
    -[SBIdleTimerBase _logExpirationTimeout:](self, "_logExpirationTimeout:", -1.0);
}

@end
