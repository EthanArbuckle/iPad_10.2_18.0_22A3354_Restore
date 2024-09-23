@implementation RTNetworkOfInterestManagerCellLinkQualityChangedNotification

- (RTNetworkOfInterestManagerCellLinkQualityChangedNotification)initWithLinkQuality:(unint64_t)a3
{
  RTNetworkOfInterestManagerCellLinkQualityChangedNotification *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTNetworkOfInterestManagerCellLinkQualityChangedNotification;
  result = -[RTNotification init](&v5, sel_init);
  if (result)
    result->_linkQuality = a3;
  return result;
}

- (unint64_t)linkQuality
{
  return self->_linkQuality;
}

@end
