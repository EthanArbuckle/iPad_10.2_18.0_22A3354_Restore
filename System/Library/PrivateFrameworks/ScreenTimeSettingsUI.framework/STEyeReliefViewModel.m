@implementation STEyeReliefViewModel

- (BOOL)inDemoMode
{
  void *v2;
  char v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.EyeRelief"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("OnboardingDemoMode"));

  return v3;
}

- (BOOL)hasAcknowledgedIntroScreens
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ScreenTimeEyeReliefIntroAcknowledged"));

  return v3;
}

- (void)acknowledgeIntroScreens
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("ScreenTimeEyeReliefIntroAcknowledged"));

}

- (BOOL)isEyeReliefEnabled
{
  return self->_isEyeReliefEnabled;
}

- (void)setIsEyeReliefEnabled:(BOOL)a3
{
  self->_isEyeReliefEnabled = a3;
}

@end
