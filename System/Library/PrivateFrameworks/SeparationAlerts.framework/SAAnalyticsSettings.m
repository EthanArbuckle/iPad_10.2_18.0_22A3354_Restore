@implementation SAAnalyticsSettings

- (SAAnalyticsSettings)init
{
  return -[SAAnalyticsSettings initWithEnableSubmission:](self, "initWithEnableSubmission:", 1);
}

- (SAAnalyticsSettings)initWithEnableSubmission:(BOOL)a3
{
  SAAnalyticsSettings *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SAAnalyticsSettings;
  result = -[SAAnalyticsSettings init](&v5, sel_init);
  if (result)
    result->_enableSubmission = a3;
  return result;
}

- (BOOL)enableSubmission
{
  return self->_enableSubmission;
}

- (void)setEnableSubmission:(BOOL)a3
{
  self->_enableSubmission = a3;
}

@end
