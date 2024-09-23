@implementation STKCarrierSubscriptionInfo

- (STKCarrierSubscriptionInfo)initWithShowClass0SMSFromField:(BOOL)a3 canShowClass0SMSOverInCallAlerts:(BOOL)a4 ussdAlwaysFilteredPatterns:(id)a5 ussdSometimesFilteredPatterns:(id)a6
{
  id v10;
  id v11;
  STKCarrierSubscriptionInfo *v12;
  STKCarrierSubscriptionInfo *v13;
  uint64_t v14;
  NSArray *ussdAlwaysFilteredPatterns;
  uint64_t v16;
  NSArray *ussdSometimesFilteredPatterns;
  STKUSSDFilter *v18;
  STKUSSDFilter *ussdFilter;
  objc_super v21;

  v10 = a5;
  v11 = a6;
  v21.receiver = self;
  v21.super_class = (Class)STKCarrierSubscriptionInfo;
  v12 = -[STKCarrierSubscriptionInfo init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_canShowClass0SMSOverInCallAlerts = a4;
    v12->_showClass0SMSFromField = a3;
    v14 = -[NSArray copy](v12->_ussdAlwaysFilteredPatterns, "copy");
    ussdAlwaysFilteredPatterns = v13->_ussdAlwaysFilteredPatterns;
    v13->_ussdAlwaysFilteredPatterns = (NSArray *)v14;

    v16 = -[NSArray copy](v13->_ussdSometimesFilteredPatterns, "copy");
    ussdSometimesFilteredPatterns = v13->_ussdSometimesFilteredPatterns;
    v13->_ussdSometimesFilteredPatterns = (NSArray *)v16;

    v18 = -[STKUSSDFilter initWithAlwaysFilteredPatterns:sometimesFilteredPatterns:]([STKUSSDFilter alloc], "initWithAlwaysFilteredPatterns:sometimesFilteredPatterns:", v10, v11);
    ussdFilter = v13->_ussdFilter;
    v13->_ussdFilter = v18;

  }
  return v13;
}

- (BOOL)canShowClass0SMSOverInCallAlerts
{
  return self->_canShowClass0SMSOverInCallAlerts;
}

- (BOOL)showClass0SMSFromField
{
  return self->_showClass0SMSFromField;
}

- (NSArray)ussdAlwaysFilteredPatterns
{
  return self->_ussdAlwaysFilteredPatterns;
}

- (NSArray)ussdSometimesFilteredPatterns
{
  return self->_ussdSometimesFilteredPatterns;
}

- (STKUSSDFilter)ussdFilter
{
  return self->_ussdFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ussdFilter, 0);
  objc_storeStrong((id *)&self->_ussdSometimesFilteredPatterns, 0);
  objc_storeStrong((id *)&self->_ussdAlwaysFilteredPatterns, 0);
}

@end
