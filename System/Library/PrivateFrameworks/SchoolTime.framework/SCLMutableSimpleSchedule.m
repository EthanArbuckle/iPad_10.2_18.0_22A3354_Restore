@implementation SCLMutableSimpleSchedule

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SCLSimpleSchedule initWithSimpleSchedule:]([SCLSimpleSchedule alloc], "initWithSimpleSchedule:", self);
}

- (void)setStartTime:(id)a3
{
  SCLScheduleTime *v4;
  SCLScheduleTime *startTime;

  v4 = (SCLScheduleTime *)objc_msgSend(a3, "copy");
  startTime = self->super._startTime;
  self->super._startTime = v4;

}

- (void)setEndTime:(id)a3
{
  SCLScheduleTime *v4;
  SCLScheduleTime *endTime;

  v4 = (SCLScheduleTime *)objc_msgSend(a3, "copy");
  endTime = self->super._endTime;
  self->super._endTime = v4;

}

- (void)setRepeatSchedule:(int64_t)a3
{
  self->super._repeatSchedule = a3;
}

@end
