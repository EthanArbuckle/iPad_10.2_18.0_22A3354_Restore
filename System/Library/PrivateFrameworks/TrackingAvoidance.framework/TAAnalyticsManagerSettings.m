@implementation TAAnalyticsManagerSettings

- (TAAnalyticsManagerSettings)init
{
  return -[TAAnalyticsManagerSettings initWithEnableSubmissionOrDefault:andSettingsVersion:](self, "initWithEnableSubmissionOrDefault:andSettingsVersion:", 0, 1);
}

- (TAAnalyticsManagerSettings)initWithEnableSubmissionOrDefault:(id)a3 andSettingsVersion:(unint64_t)a4
{
  id v6;
  TAAnalyticsManagerSettings *v7;
  char v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TAAnalyticsManagerSettings;
  v7 = -[TAAnalyticsManagerSettings init](&v10, sel_init);
  if (v7)
  {
    if (v6)
      v8 = objc_msgSend(v6, "BOOLValue");
    else
      v8 = 1;
    v7->_enableSubmission = v8;
    v7->_settingsVersion = a4;
  }

  return v7;
}

- (BOOL)enableSubmission
{
  return self->_enableSubmission;
}

- (void)setEnableSubmission:(BOOL)a3
{
  self->_enableSubmission = a3;
}

- (unint64_t)settingsVersion
{
  return self->_settingsVersion;
}

- (void)setSettingsVersion:(unint64_t)a3
{
  self->_settingsVersion = a3;
}

@end
