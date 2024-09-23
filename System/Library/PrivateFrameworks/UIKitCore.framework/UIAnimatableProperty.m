@implementation UIAnimatableProperty

uint64_t __58__UIAnimatableProperty__performAnimationFromCurrentValue___block_invoke()
{
  return 0;
}

void __42__UIAnimatableProperty_setAnimationEntry___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
}

void __38__UIAnimatableProperty_animationEntry__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

- (id)presentationValue
{
  os_unfair_lock_s *p_valueLock;
  id presentationValue;
  id v5;

  p_valueLock = &self->_valueLock;
  os_unfair_lock_lock(&self->_valueLock);
  presentationValue = self->_presentationValue;
  if (!presentationValue)
    presentationValue = self->_value;
  v5 = presentationValue;
  os_unfair_lock_unlock(p_valueLock);
  return v5;
}

- (id)value
{
  os_unfair_lock_s *p_valueLock;
  id v4;

  p_valueLock = &self->_valueLock;
  os_unfair_lock_lock(&self->_valueLock);
  v4 = self->_value;
  os_unfair_lock_unlock(p_valueLock);
  return v4;
}

- (UIAnimatableProperty)initWithInvalidationCallback:(id)a3
{
  id v4;
  UIAnimatableProperty *v5;
  UIAnimatableProperty *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *animationEntryLockingQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *invalidationLockingQueue;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIAnimatableProperty;
  v5 = -[UIAnimatableProperty init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    -[UIAnimatableProperty setInvalidationCallback:](v5, "setInvalidationCallback:", v4);
    v7 = dispatch_queue_create("com.apple.UIKit.animatablePropertyStateAnimationEntryLockingQueue", 0);
    animationEntryLockingQueue = v6->_animationEntryLockingQueue;
    v6->_animationEntryLockingQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.UIKit.progressAnimatablePropertyInvalidationLockingQueue", MEMORY[0x1E0C80D50]);
    invalidationLockingQueue = v6->_invalidationLockingQueue;
    v6->_invalidationLockingQueue = (OS_dispatch_queue *)v9;

    v6->_valueLock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)setInvalidationCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setVelocityUsableForVFD:(BOOL)a3
{
  self->_velocityUsableForVFD = a3;
}

- (BOOL)animatePropertyWithCurrentValue:(id)a3 targetValue:(id)a4 preTickShouldRemoveCallback:(id)a5 newValueCallback:(id)a6 removedCallback:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (__currentViewAnimationState && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend((id)__currentViewAnimationState, "animatePropertyWithCurrentValue:targetValue:preTickShouldRemoveCallback:newValueCallback:removedCallback:animatableProperty:", v12, v13, v14, v15, v16, self);
    v17 = 1;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (UIViewInProcessAnimationState)animationState
{
  return (UIViewInProcessAnimationState *)objc_loadWeakRetained((id *)&self->_animationState);
}

- (void)setOwnershipCount:(int)a3
{
  self->_ownershipCount = a3;
}

- (int)ownershipCount
{
  return self->_ownershipCount;
}

- (void)setAnimationState:(id)a3
{
  objc_storeWeak((id *)&self->_animationState, a3);
}

void __58__UIAnimatableProperty__performAnimationFromCurrentValue___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setPresentationValue:", v3);

  objc_msgSend(WeakRetained, "transformer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationValueUpdatedForProgress:", WeakRetained);

}

- (void)setPresentationValue:(id)a3
{
  id v4;
  id presentationValue;

  v4 = a3;
  os_unfair_lock_lock(&self->_valueLock);
  presentationValue = self->_presentationValue;
  self->_presentationValue = v4;

  os_unfair_lock_unlock(&self->_valueLock);
}

- (id)transformer
{
  return self->_transformer;
}

- (UIViewRunningAnimationEntry)animationEntry
{
  NSObject *animationEntryLockingQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__231;
  v10 = __Block_byref_object_dispose__231;
  v11 = 0;
  animationEntryLockingQueue = self->_animationEntryLockingQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__UIAnimatableProperty_animationEntry__block_invoke;
  v5[3] = &unk_1E16BACE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(animationEntryLockingQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (UIViewRunningAnimationEntry *)v3;
}

- (void)setAnimationEntry:(id)a3
{
  id v4;
  NSObject *animationEntryLockingQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  animationEntryLockingQueue = self->_animationEntryLockingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__UIAnimatableProperty_setAnimationEntry___block_invoke;
  block[3] = &unk_1E16B1B50;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_sync(animationEntryLockingQueue, block);

}

- (UIViewAnimationComposing)composer
{
  return self->_composer;
}

- (void)setComposer:(id)a3
{
  objc_storeStrong((id *)&self->_composer, a3);
}

- (BOOL)isVelocityUsableForVFD
{
  return self->_velocityUsableForVFD;
}

void __58__UIAnimatableProperty__performAnimationFromCurrentValue___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "value");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setPresentationValue:", v1);

  objc_msgSend(WeakRetained, "transformer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationValueStabilizedForProgress:", WeakRetained);

}

- (void)invalidateAndStopImmediately:(BOOL)a3
{
  uint64_t v4;
  NSObject *invalidationLockingQueue;
  _QWORD v6[5];
  _QWORD v7[5];

  if (!self->_invalidated)
  {
    v4 = MEMORY[0x1E0C809B0];
    if (a3)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __53__UIAnimatableProperty_invalidateAndStopImmediately___block_invoke;
      v7[3] = &unk_1E16B1B28;
      v7[4] = self;
      +[UIView _performWithoutRetargetingAnimations:](UIView, "_performWithoutRetargetingAnimations:", v7);
    }
    invalidationLockingQueue = self->_invalidationLockingQueue;
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __53__UIAnimatableProperty_invalidateAndStopImmediately___block_invoke_2;
    v6[3] = &unk_1E16B1B28;
    v6[4] = self;
    dispatch_sync(invalidationLockingQueue, v6);
  }
}

- (void)invalidate
{
  -[UIAnimatableProperty invalidateAndStopImmediately:](self, "invalidateAndStopImmediately:", 1);
}

void __53__UIAnimatableProperty_invalidateAndStopImmediately___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "presentationValue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setValue:", v2);

}

- (void)invalidateIfPossible
{
  UIViewAnimationComposing *composer;
  void (**v4)(void);

  if (!self->_ownershipCount && !self->_animationEntry)
  {
    composer = self->_composer;
    if (!composer || (-[UIViewAnimationComposing isActive](composer, "isActive") & 1) == 0)
    {
      -[UIAnimatableProperty invalidationCallback](self, "invalidationCallback");
      v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v4[2]();

    }
  }
}

- (id)invalidationCallback
{
  return self->_invalidationCallback;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationCallback, 0);
  objc_destroyWeak((id *)&self->_animationState);
  objc_storeStrong((id *)&self->_composer, 0);
  objc_storeStrong(&self->_presentationValue, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_pendingVelocity, 0);
  objc_storeStrong((id *)&self->_pendingTargetVelocity, 0);
  objc_storeStrong((id *)&self->_animationEntry, 0);
  objc_storeStrong((id *)&self->_invalidationLockingQueue, 0);
  objc_storeStrong((id *)&self->_animationEntryLockingQueue, 0);
  objc_storeStrong((id *)&self->_transformer, 0);
}

- (void)setValue:(id)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[UIAnimatableProperty isInvalidated](self, "isInvalidated"))
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99768];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("%@ has been invalidated and can be no longer operated."), v8);

  }
  os_unfair_lock_lock(&self->_valueLock);
  if (self->_value)
  {
    v9 = self->_value;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "zeroCompatibleWithVector:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v10, "copy");

  }
  objc_storeStrong(&self->_value, a3);
  os_unfair_lock_unlock(&self->_valueLock);
  -[_UIViewAnimatablePropertyTransformer modelValueUpdatedForProgress:](self->_transformer, "modelValueUpdatedForProgress:", self);
  if (!-[UIAnimatableProperty _performAnimationFromCurrentValue:](self, "_performAnimationFromCurrentValue:", v9))
    -[UIAnimatableProperty setPresentationValue:](self, "setPresentationValue:", v11);

}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (BOOL)_performAnimationFromCurrentValue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[UIAnimatableProperty value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__UIAnimatableProperty__performAnimationFromCurrentValue___block_invoke_2;
  v10[3] = &unk_1E16E9F58;
  objc_copyWeak(&v11, &location);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __58__UIAnimatableProperty__performAnimationFromCurrentValue___block_invoke_3;
  v8[3] = &unk_1E16B3F40;
  objc_copyWeak(&v9, &location);
  LOBYTE(self) = -[UIAnimatableProperty animatePropertyWithCurrentValue:targetValue:preTickShouldRemoveCallback:newValueCallback:removedCallback:](self, "animatePropertyWithCurrentValue:targetValue:preTickShouldRemoveCallback:newValueCallback:removedCallback:", v4, v5, &__block_literal_global_13_9, v10, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
  return (char)self;
}

- (void)setTransformer:(id)a3
{
  objc_storeStrong((id *)&self->_transformer, a3);
}

void __53__UIAnimatableProperty_invalidateAndStopImmediately___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 76))
  {
    *(_BYTE *)(v1 + 76) = 1;
    objc_msgSend(*(id *)(a1 + 32), "transformer");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "progressInvalidated:", *(_QWORD *)(a1 + 32));

  }
}

- (void)setVelocity:(id)a3 target:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  UIAnimatableProperty *v13;
  BOOL v14;

  v4 = a4;
  v7 = a3;
  v8 = 7;
  if (v4)
    v8 = 6;
  objc_storeStrong((id *)((char *)&self->super.super.isa + OBJC_IVAR___UIAnimatableProperty__animationEntryLockingQueue[v8]), a3);
  v10[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__UIAnimatableProperty_setVelocity_target___block_invoke;
  v11[3] = &unk_1E16E9F08;
  v14 = v4;
  v12 = v7;
  v13 = self;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__UIAnimatableProperty_setVelocity_target___block_invoke_2;
  v10[3] = &unk_1E16B1B28;
  v9 = v7;
  +[UIView _animateWithAnimationAndComposerGetter:animations:completion:animationStateSetup:](UIView, "_animateWithAnimationAndComposerGetter:animations:completion:animationStateSetup:", v11, v10, 0, &__block_literal_global_633);

}

id __43__UIAnimatableProperty_setVelocity_target___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void **v21;
  void *v22;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  objc_msgSend(v9, "composer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = (id)objc_opt_new();
  v13 = v12;

  if (*(_BYTE *)(a1 + 48))
    v14 = 0;
  else
    v14 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
    v15 = *(_QWORD *)(a1 + 32);
  else
    v15 = 0;
  +[UIViewUpdateVelocityAnimationDescription descriptionWithVelocity:targetVelocity:](UIViewUpdateVelocityAnimationDescription, "descriptionWithVelocity:targetVelocity:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "animation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "composeAnimation:withNewAnimationDescription:interactive:currentValue:targetValue:", v17, v16, 0, v8, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
    v20 = 56;
  else
    v20 = 64;
  v21 = (void **)(*(_QWORD *)(a1 + 40) + v20);
  if (*v21 == v19)
  {
    *v21 = 0;

  }
  +[_UIViewAnimationWithComposerWrapper instanceWithAnimation:composer:](_UIViewAnimationWithComposerWrapper, "instanceWithAnimation:composer:", v18, v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

uint64_t __43__UIAnimatableProperty_setVelocity_target___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animatePropertyWithCurrentValue:targetValue:preTickShouldRemoveCallback:newValueCallback:removedCallback:", 0, 0, 0, 0, 0);
}

uint64_t __43__UIAnimatableProperty_setVelocity_target___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setType:", 3);
}

- (id)velocity
{
  return -[UIAnimatableProperty velocityTarget:](self, "velocityTarget:", 0);
}

- (void)setVelocity:(id)a3
{
  -[UIAnimatableProperty setVelocity:target:](self, "setVelocity:target:", a3, 0);
}

- (id)velocityTarget:(BOOL)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__231;
  v18 = __Block_byref_object_dispose__231;
  v19 = 0;
  if (a3)
    v5 = 56;
  else
    v5 = 64;
  v6 = *(Class *)((char *)&self->super.super.isa + v5);
  if (v6)
  {
    v7 = 0;
    v19 = v6;
  }
  else
  {
    -[UIAnimatableProperty animationEntry](self, "animationEntry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (!v8 || a3)
    {
      if (self->_composer)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[UIViewAnimationComposing targetVelocity](self->_composer, "targetVelocity");
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = (void *)v15[5];
          v15[5] = v9;

        }
      }
    }
    else
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __39__UIAnimatableProperty_velocityTarget___block_invoke;
      v13[3] = &unk_1E16E9F30;
      v13[4] = &v14;
      objc_msgSend(v8, "performWithoutLock:", v13);
    }
  }

  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __39__UIAnimatableProperty_velocityTarget___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "velocity");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  id value;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  value = self->_value;
  -[UIAnimatableProperty presentationValue](self, "presentationValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p value: %@; presentation: %@; velocity: %@; targetVelocity: %@; invalidated: %i; ownership: %i>"),
    v5,
    self,
    value,
    v7,
    self->_pendingVelocity,
    self->_pendingTargetVelocity,
    self->_invalidated,
    self->_ownershipCount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
