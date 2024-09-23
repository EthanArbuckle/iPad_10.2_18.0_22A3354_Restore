@implementation WFBlacklistStateNode

- (WFBlacklistStateNode)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFBlacklistStateNode;
  return -[WFBlacklistStateNode init](&v3, sel_init);
}

- (unint64_t)blacklistedState
{
  return self->_blacklistedState;
}

- (void)setBlacklistedState:(unint64_t)a3
{
  self->_blacklistedState = a3;
}

- (NSString)blacklistedStateString
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBlacklistedStateString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (double)blacklistedStateTimestamp
{
  return self->_blacklistedStateTimestamp;
}

- (void)setBlacklistedStateTimestamp:(double)a3
{
  self->_blacklistedStateTimestamp = a3;
}

- (unint64_t)blacklistedReason
{
  return self->_blacklistedReason;
}

- (void)setBlacklistedReason:(unint64_t)a3
{
  self->_blacklistedReason = a3;
}

- (int64_t)blacklistedReasonData
{
  return self->_blacklistedReasonData;
}

- (void)setBlacklistedReasonData:(int64_t)a3
{
  self->_blacklistedReasonData = a3;
}

- (NSString)blacklistedReasonString
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBlacklistedReasonString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blacklistedReasonString, 0);
  objc_storeStrong((id *)&self->_blacklistedStateString, 0);
}

@end
