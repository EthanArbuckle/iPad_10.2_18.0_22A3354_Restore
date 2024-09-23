@implementation NCMutableDigestInfo

- (void)setScheduleTime:(id)a3
{
  objc_storeStrong((id *)&self->super._scheduleTime, a3);
}

- (void)setScheduleDate:(id)a3
{
  objc_storeStrong((id *)&self->super._scheduleDate, a3);
}

- (void)setTitleString:(id)a3
{
  objc_storeStrong((id *)&self->super._titleString, a3);
}

- (void)setHeaderString:(id)a3
{
  objc_storeStrong((id *)&self->super._headerString, a3);
}

- (void)setDeliveryOrder:(int64_t)a3
{
  self->super._deliveryOrder = a3;
}

@end
