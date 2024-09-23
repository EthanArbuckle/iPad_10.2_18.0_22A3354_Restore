@implementation _SBDMPolicyTestAppInfo

- (BOOL)isBlockedForScreenTimeExpiration
{
  objc_super v4;

  if (-[_SBDMPolicyTestAppInfo testAppBlocked](self, "testAppBlocked"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)_SBDMPolicyTestAppInfo;
  return -[_SBDMPolicyTestAppInfo isBlockedForScreenTimeExpiration](&v4, sel_isBlockedForScreenTimeExpiration);
}

- (int64_t)screenTimePolicy
{
  objc_super v4;

  if (-[_SBDMPolicyTestAppInfo testAppBlocked](self, "testAppBlocked"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)_SBDMPolicyTestAppInfo;
  return -[_SBDMPolicyTestAppInfo screenTimePolicy](&v4, sel_screenTimePolicy);
}

- (BOOL)testAppBlocked
{
  return self->_testAppBlocked;
}

- (void)setTestAppBlocked:(BOOL)a3
{
  self->_testAppBlocked = a3;
}

@end
