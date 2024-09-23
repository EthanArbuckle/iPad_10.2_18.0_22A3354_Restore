@implementation SCLMutableScheduleSettings

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SCLScheduleSettings initWithSchoolModeScheduleSettings:]([SCLScheduleSettings alloc], "initWithSchoolModeScheduleSettings:", self);
}

- (void)setEnabled:(BOOL)a3
{
  self->super._enabled = a3;
}

- (void)setSchedule:(id)a3
{
  SCLSchedule *v4;
  SCLSchedule *schedule;

  v4 = (SCLSchedule *)a3;
  if (!v4)
    v4 = objc_alloc_init(SCLSchedule);
  schedule = self->super._schedule;
  self->super._schedule = v4;

}

@end
