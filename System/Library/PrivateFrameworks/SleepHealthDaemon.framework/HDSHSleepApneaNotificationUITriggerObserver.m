@implementation HDSHSleepApneaNotificationUITriggerObserver

- (HDSHSleepApneaNotificationUITriggerObserver)initWithProfile:(id)a3
{
  id v4;
  HDSHSleepApneaNotificationUITriggerObserver *v5;
  HDSHSleepApneaNotificationUITriggerObserver *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDSHSleepApneaNotificationUITriggerObserver;
  v5 = -[HDSHSleepApneaNotificationUITriggerObserver init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    -[HDSHSleepApneaNotificationUITriggerObserver _registerUITriggers](v6, "_registerUITriggers");
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[HDSHSleepApneaNotificationUITriggerObserver _deregisterUITriggers](self, "_deregisterUITriggers");
  v3.receiver = self;
  v3.super_class = (Class)HDSHSleepApneaNotificationUITriggerObserver;
  -[HDSHSleepApneaNotificationUITriggerObserver dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
}

@end
