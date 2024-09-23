@implementation DMDFetchSecurityInformationOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFFetchSecurityInformationRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2D78;
}

- (void)runWithRequest:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v17;

  v17 = (id)objc_claimAutoreleasedReturnValue(+[MCDeviceCapabilities currentDevice](MCDeviceCapabilities, "currentDevice", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v4 = objc_alloc((Class)DMFSecurityInformation);
  v5 = objc_msgSend(v17, "supportsBlockLevelEncryption");
  v6 = objc_msgSend(v17, "supportsFileLevelEncryption");
  v7 = objc_msgSend(v3, "isPasscodeSet");
  v8 = objc_msgSend(v3, "currentPasscodeIsCompliantWithGlobalRestrictionsOutError:", 0);
  v9 = objc_msgSend(v3, "currentPasscodeIsCompliantWithProfileRestrictionsOutError:", 0);
  v10 = MCFeaturePasscodeLockGraceTime;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "effectiveValueForSetting:", MCFeaturePasscodeLockGraceTime));
  v12 = objc_msgSend(v11, "unsignedIntegerValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userValueForSetting:", v10));
  v14 = objc_msgSend(v4, "initWithSupportsBlockLevelEncryption:supportsFileLevelEncryption:passcodeIsSet:passcodeIsCompliantWithGlobalRestrictions:passcodeIsCompliantWithProfileRestrictions:passcodeLockGracePeriodEnforced:passcodeLockGracePeriod:", v5, v6, v7, v8, v9, v12, objc_msgSend(v13, "unsignedIntegerValue"));

  v15 = objc_msgSend(objc_alloc((Class)DMFFetchSecurityInformationResultObject), "initWithSecurityInformation:", v14);
  -[DMDFetchSecurityInformationOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v15);

}

@end
