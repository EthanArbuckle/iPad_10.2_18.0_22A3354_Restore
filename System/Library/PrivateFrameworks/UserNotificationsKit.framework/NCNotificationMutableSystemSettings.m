@implementation NCNotificationMutableSystemSettings

- (void)setScheduledDeliveryEnabled:(BOOL)a3
{
  self->super._scheduledDeliveryEnabled = a3;
}

- (void)setScheduledDeliveryUninitialized:(BOOL)a3
{
  self->super._scheduledDeliveryUninitialized = a3;
}

- (void)setScheduledDeliveryShowNextSummary:(BOOL)a3
{
  self->super._scheduledDeliveryShowNextSummary = a3;
}

- (void)setScheduledDeliveryTimes:(id)a3
{
  NSArray *v4;
  NSArray *scheduledDeliveryTimes;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  scheduledDeliveryTimes = self->super._scheduledDeliveryTimes;
  self->super._scheduledDeliveryTimes = v4;

}

- (void)setListDisplayStyleSetting:(int64_t)a3
{
  self->super._listDisplayStyleSetting = a3;
}

- (void)setSummarizationEnabled:(BOOL)a3
{
  self->super._summarizationEnabled = a3;
}

- (void)setHighlightsEnabled:(BOOL)a3
{
  self->super._highlightsEnabled = a3;
}

@end
