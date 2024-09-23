@implementation MockTITrialManager

- (id)encodedLMTrialParametersForLocale:(id)a3
{
  return 0;
}

- (id)encodedCATrialParametersForLocale:(id)a3
{
  return 0;
}

- (id)inputTranscoderAssetsDirectoryURLForLocale:(id)a3
{
  return 0;
}

- (id)isNegativeLearningEnabledForLocale:(id)a3
{
  return 0;
}

- (id)inlineCompletionOperatingPointOverrideForLocale:(id)a3
{
  return 0;
}

- (id)favoniusLanguagePowerOverrideForLocale:(id)a3
{
  return 0;
}

- (id)updateCallback
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setUpdateCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateCallback, 0);
}

@end
