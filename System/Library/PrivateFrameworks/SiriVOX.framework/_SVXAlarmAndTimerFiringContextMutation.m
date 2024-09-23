@implementation _SVXAlarmAndTimerFiringContextMutation

- (_SVXAlarmAndTimerFiringContextMutation)init
{
  return -[_SVXAlarmAndTimerFiringContextMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXAlarmAndTimerFiringContextMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXAlarmAndTimerFiringContextMutation *v6;
  _SVXAlarmAndTimerFiringContextMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXAlarmAndTimerFiringContextMutation;
  v6 = -[_SVXAlarmAndTimerFiringContextMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setOrderedFiringAlarms:(id)a3
{
  objc_storeStrong((id *)&self->_orderedFiringAlarms, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setOrderedFiringTimers:(id)a3
{
  objc_storeStrong((id *)&self->_orderedFiringTimers, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void)setHasOtherRunningTimers:(BOOL)a3
{
  self->_hasOtherRunningTimers = a3;
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (id)generate
{
  SVXAlarmAndTimerFiringContext *baseModel;
  SVXAlarmAndTimerFiringContext *v4;
  SVXAlarmAndTimerFiringContext *v5;
  NSOrderedSet *v6;
  NSOrderedSet *v7;
  NSOrderedSet *v8;
  NSOrderedSet *v9;
  _BOOL8 hasOtherRunningTimers;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = -[SVXAlarmAndTimerFiringContext initWithOrderedFiringAlarms:orderedFiringTimers:hasOtherRunningTimers:]([SVXAlarmAndTimerFiringContext alloc], "initWithOrderedFiringAlarms:orderedFiringTimers:hasOtherRunningTimers:", self->_orderedFiringAlarms, self->_orderedFiringTimers, self->_hasOtherRunningTimers);
    goto LABEL_5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 1) == 0)
  {
    v4 = (SVXAlarmAndTimerFiringContext *)-[SVXAlarmAndTimerFiringContext copy](baseModel, "copy");
LABEL_5:
    v5 = v4;
    return v5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v6 = self->_orderedFiringAlarms;
  }
  else
  {
    -[SVXAlarmAndTimerFiringContext orderedFiringAlarms](baseModel, "orderedFiringAlarms");
    v6 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v8 = self->_orderedFiringTimers;
  }
  else
  {
    -[SVXAlarmAndTimerFiringContext orderedFiringTimers](self->_baseModel, "orderedFiringTimers");
    v8 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
    hasOtherRunningTimers = self->_hasOtherRunningTimers;
  else
    hasOtherRunningTimers = -[SVXAlarmAndTimerFiringContext hasOtherRunningTimers](self->_baseModel, "hasOtherRunningTimers");
  v5 = -[SVXAlarmAndTimerFiringContext initWithOrderedFiringAlarms:orderedFiringTimers:hasOtherRunningTimers:]([SVXAlarmAndTimerFiringContext alloc], "initWithOrderedFiringAlarms:orderedFiringTimers:hasOtherRunningTimers:", v7, v9, hasOtherRunningTimers);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedFiringTimers, 0);
  objc_storeStrong((id *)&self->_orderedFiringAlarms, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
