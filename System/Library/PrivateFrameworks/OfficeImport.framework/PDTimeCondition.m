@implementation PDTimeCondition

- (PDTimeCondition)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDTimeCondition;
  return -[PDTimeCondition init](&v3, sel_init);
}

- (void)setDelay:(int)a3
{
  self->mDelay = a3;
  self->mHasDelay = 1;
}

- (void)setTriggerEvent:(int)a3
{
  self->mHasTriggerEvent = 1;
  self->mTriggerEvent = a3;
}

- (void)setTarget:(id)a3
{
  objc_storeStrong((id *)&self->mTarget, a3);
}

- (BOOL)hasDelay
{
  return self->mHasDelay;
}

- (int)delay
{
  if (self->mDelay == -1)
    return 0;
  else
    return self->mDelay;
}

- (BOOL)hasTriggerEvent
{
  return self->mHasTriggerEvent;
}

- (int)triggerEvent
{
  return self->mTriggerEvent;
}

- (id)target
{
  return self->mTarget;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDTimeCondition;
  -[PDTimeCondition description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTarget, 0);
}

- (int)writeDelay
{
  return self->mDelay;
}

@end
