@implementation HDSPSleepAlarmDismissedIDSMessage

- (unint64_t)destinations
{
  return 2;
}

- (id)dateDescription
{
  return CFSTR("dismissedDate");
}

@end
