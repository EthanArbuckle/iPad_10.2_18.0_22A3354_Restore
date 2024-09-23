@implementation MCPasscodeAnalytics

+ (void)sendPasscodeChangedEventWithChangeType:(int64_t)a3 oldPasscodeExists:(BOOL)a4 isClearingPasscode:(BOOL)a5 newPasscodeUnlockScreenType:(int)a6 newPasscodeSimpleType:(int)a7 passcodeRecoverySupported:(BOOL)a8 passcodeRecoveryRestricted:(BOOL)a9 recoverySkipped:(BOOL)a10 senderBundleID:(id)a11
{
  id v12;
  _QWORD v13[4];
  id v14;
  int64_t v15;
  int v16;
  int v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10008FA44;
  v13[3] = &unk_1000E4518;
  v18 = a5;
  v16 = a6;
  v17 = a7;
  v19 = a4;
  v20 = a9;
  v21 = a8;
  v22 = a10;
  v14 = a11;
  v15 = a3;
  v12 = v14;
  AnalyticsSendEventLazy(CFSTR("com.apple.managedconfiguration.passcode.changed"), v13);

}

+ (void)sendRecoveryPasscodeClearedEventWithReason:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10008FC84;
  v3[3] = &unk_1000E4538;
  v3[4] = a3;
  AnalyticsSendEventLazy(CFSTR("com.apple.managedconfiguration.passcode.recoveryPasscodeCleared"), v3);
}

@end
