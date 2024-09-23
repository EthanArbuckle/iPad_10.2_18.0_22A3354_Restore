@implementation SBIdleTimerBehavior

uint64_t __52__SBIdleTimerBehavior_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_appendInnerDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

+ (id)disabledBehavior
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithDuration:mode:warnMode:", 14, 3, 1);
}

- (int64_t)idleTimerMode
{
  return self->_idleTimerMode;
}

- (id)_initWithBehaviorProvider:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = -[SBIdleTimerBehavior _initWithDuration:mode:warnMode:](self, "_initWithDuration:mode:warnMode:", objc_msgSend(v4, "idleTimerDuration"), objc_msgSend(v4, "idleTimerMode"), objc_msgSend(v4, "idleWarnMode"));
  v6 = objc_opt_respondsToSelector();
  v7 = 0;
  v8 = 0;
  if ((v6 & 1) != 0)
    objc_msgSend(v4, "customIdleWarningTimeout", 0.0);
  v5[4] = v8;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "customIdleExpirationTimeout");
    v7 = v9;
  }
  v5[5] = v7;

  return v5;
}

- (id)_initWithDuration:(int64_t)a3 mode:(int64_t)a4 warnMode:(int64_t)a5
{
  id result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBIdleTimerBehavior;
  result = -[SBIdleTimerBehavior init](&v9, sel_init);
  if (result)
  {
    *((_QWORD *)result + 2) = a4;
    *((_QWORD *)result + 3) = a3;
    *((_QWORD *)result + 1) = a5;
  }
  return result;
}

- (int64_t)idleWarnMode
{
  return self->_idleWarnMode;
}

- (int64_t)idleTimerDuration
{
  return self->_idleTimerDuration;
}

- (double)customIdleExpirationTimeout
{
  return self->_customIdleExpirationTimeout;
}

- (double)customIdleWarningTimeout
{
  return self->_customIdleWarningTimeout;
}

- (void)_appendInnerDescriptionToFormatter:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  NSStringFromIdleTimerDuration();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:withName:", v4, CFSTR("duration"));

  NSStringFromSBFIdleTimerMode();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:withName:", v5, CFSTR("mode"));

  NSStringFromIdleWarnMode();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:withName:", v6, CFSTR("warnMode"));

  if ((BSFloatIsZero() & 1) == 0)
    v7 = (id)objc_msgSend(v9, "appendTimeInterval:withName:decomposeUnits:", CFSTR("customIdleExpirationTimeout"), 0, self->_customIdleExpirationTimeout);
  if ((BSFloatIsZero() & 1) == 0)
    v8 = (id)objc_msgSend(v9, "appendTimeInterval:withName:decomposeUnits:", CFSTR("customIdleWarningTimeout"), 0, self->_customIdleWarningTimeout);

}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__SBIdleTimerBehavior_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E8E9E820;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", self, v6);

}

+ (id)behaviorForBehaviorProvider:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithBehaviorProvider:", v4);

  return v5;
}

+ (id)autoLockBehavior
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithDuration:mode:warnMode:", 12, 1, 2);
}

+ (id)defaultBehavior
{
  void *v3;
  void *v4;
  int v5;
  void *v6;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isUILocked"))
  {

  }
  else
  {
    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isVisible");

    if (!v5)
    {
      objc_msgSend(a1, "autoLockBehavior");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
  }
  objc_msgSend(a1, "lockScreenBehavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

+ (id)lockScreenBehavior
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lockScreenEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "idleTimerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "requestIdleTimerBehaviorForReason:", CFSTR("lockScreenIdleTimerDescriptor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "behaviorForBehaviorProvider:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithDuration:mode:warnMode:", 1, 1, 2);
  }

  return v7;
}

+ (id)behaviorWithDuration:(int64_t)a3 mode:(int64_t)a4 warnMode:(int64_t)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithDuration:mode:warnMode:", a3, a4, a5);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIdleTimerBehavior succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIdleTimerBehavior descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[SBIdleTimerBehavior succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__SBIdleTimerBehavior_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E8E9E820;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

uint64_t __61__SBIdleTimerBehavior_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_appendInnerDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

@end
