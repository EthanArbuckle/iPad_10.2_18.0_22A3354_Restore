@implementation RTTimerManager

- (id)timerWithIdentifier:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  RTTimer *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[RTTimer initWithIdentifier:queue:handler:]([RTTimer alloc], "initWithIdentifier:queue:handler:", v9, v8, v7);

  return v10;
}

- (id)xpcTimerAlarmWithIdentifier:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  RTXPCTimerAlarm *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[RTXPCTimerAlarm initWithIdentifier:queue:handler:]([RTXPCTimerAlarm alloc], "initWithIdentifier:queue:handler:", v9, v8, v7);

  return v10;
}

@end
