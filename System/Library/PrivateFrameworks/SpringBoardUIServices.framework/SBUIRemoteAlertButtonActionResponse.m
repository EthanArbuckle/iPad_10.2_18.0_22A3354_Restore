@implementation SBUIRemoteAlertButtonActionResponse

- (SBUIRemoteAlertButtonActionResponse)initWithUnHandledEvents:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBUIRemoteAlertButtonActionResponse;
  return -[SBUIButtonActionResponse initWithUnHandledButtonEvents:](&v4, sel_initWithUnHandledButtonEvents_, a3);
}

- (unint64_t)unHandledEvents
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBUIRemoteAlertButtonActionResponse;
  return -[SBUIButtonActionResponse unHandledButtonEvents](&v3, sel_unHandledButtonEvents);
}

@end
