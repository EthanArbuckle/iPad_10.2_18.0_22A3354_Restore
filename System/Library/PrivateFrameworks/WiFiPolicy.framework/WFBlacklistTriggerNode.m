@implementation WFBlacklistTriggerNode

- (WFBlacklistTriggerNode)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFBlacklistTriggerNode;
  return -[WFBlacklistTriggerNode init](&v3, sel_init);
}

- (unint64_t)triggerReason
{
  return self->_triggerReason;
}

- (void)setTriggerReason:(unint64_t)a3
{
  self->_triggerReason = a3;
}

- (int64_t)triggerReasonData
{
  return self->_triggerReasonData;
}

- (void)setTriggerReasonData:(int64_t)a3
{
  self->_triggerReasonData = a3;
}

- (NSString)triggerReasonString
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTriggerReasonString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (double)triggerReasonTimestamp
{
  return self->_triggerReasonTimestamp;
}

- (void)setTriggerReasonTimestamp:(double)a3
{
  self->_triggerReasonTimestamp = a3;
}

- (NSString)bssid
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBssid:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bssid, 0);
  objc_storeStrong((id *)&self->_triggerReasonString, 0);
}

@end
