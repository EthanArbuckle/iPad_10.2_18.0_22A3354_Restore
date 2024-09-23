@implementation BYCapabilities

- (BOOL)supportsTouchID
{
  return MGGetBoolAnswer();
}

- (BOOL)isTouchIDEnrolled
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  if (!-[BYCapabilities supportsTouchID](self, "supportsTouchID"))
    return 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v2 = (void *)getBiometricKitClass_softClass;
  v12 = getBiometricKitClass_softClass;
  if (!getBiometricKitClass_softClass)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getBiometricKitClass_block_invoke;
    v8[3] = &unk_1E4E26900;
    v8[4] = &v9;
    __getBiometricKitClass_block_invoke((uint64_t)v8);
    v2 = (void *)v10[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v9, 8);
  objc_msgSend(v3, "manager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identities:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;

  return v6;
}

- (BOOL)supportsPearl
{
  return MGGetBoolAnswer();
}

- (BOOL)isPearlEnrolled
{
  id BKDeviceClass;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!-[BYCapabilities supportsPearl](self, "supportsPearl"))
    return 0;
  BKDeviceClass = getBKDeviceClass();
  objc_msgSend(getBKDeviceDescriptorClass(), "deviceDescriptorForType:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(BKDeviceClass, "deviceWithDescriptor:error:", v3, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;

  if (!v4 || v5)
  {
    _BYLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl(&dword_1A4E92000, v8, OS_LOG_TYPE_DEFAULT, "BYCapabilities: Failed to fetch BKDevice: %@", buf, 0xCu);
    }

    v7 = 0;
    v6 = v4;
  }
  else
  {
    v10 = 0;
    objc_msgSend(v4, "identitiesForUser:error:", getuid(), &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") != 0;
    v5 = v4;
  }

  return v7;
}

- (BOOL)supportsAppleWatch
{
  return MGGetBoolAnswer();
}

- (BOOL)supportsKappaDetection
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getSOSUtilitiesClass_softClass;
  v9 = getSOSUtilitiesClass_softClass;
  if (!getSOSUtilitiesClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getSOSUtilitiesClass_block_invoke;
    v5[3] = &unk_1E4E26900;
    v5[4] = &v6;
    __getSOSUtilitiesClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  return objc_msgSend(v3, "isKappaDetectionSupportedOnPhone");
}

- (BOOL)canShowSiriScreen
{
  _BOOL4 v3;

  if (+[BYManagedAppleIDBootstrap isMultiUser](BYManagedAppleIDBootstrap, "isMultiUser"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v3 = -[BYCapabilities mgHasSiriCapability](self, "mgHasSiriCapability");
    if (v3)
      LOBYTE(v3) = !-[BYCapabilities isSiriRestricted](self, "isSiriRestricted");
  }
  return v3;
}

- (BOOL)canShowPaymentScreen
{
  void *v3;
  BOOL v4;

  -[BYCapabilities _paymentScreenRequirements](self, "_paymentScreenRequirements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (!-[BYCapabilities _paymentScreenRequirementsIncludePasscode:](self, "_paymentScreenRequirementsIncludePasscode:", v3)|| -[BYCapabilities canShowPasscodeScreen](self, "canShowPasscodeScreen"))&& (!-[BYCapabilities _paymentScreenRequirementsIncludeiCloud:](self, "_paymentScreenRequirementsIncludeiCloud:", v3)|| -[BYCapabilities canShowAppleIDScreen](self, "canShowAppleIDScreen"))&& -[BYCapabilities mgHasSecureElement](self, "mgHasSecureElement");

  return v4;
}

- (id)_paymentScreenRequirements
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v2 = (void *)getPKSetupAssistantContextClass_softClass;
  v18 = getPKSetupAssistantContextClass_softClass;
  if (!getPKSetupAssistantContextClass_softClass)
  {
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __getPKSetupAssistantContextClass_block_invoke;
    v13 = &unk_1E4E26900;
    v14 = &v15;
    __getPKSetupAssistantContextClass_block_invoke((uint64_t)&v10);
    v2 = (void *)v16[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v15, 8);
  v4 = (void *)objc_msgSend([v3 alloc], "initWithSetupAssistantAsFollowupAction:", 1);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v5 = (void *)getPKPaymentSetupAssistantControllerClass_softClass;
  v18 = getPKPaymentSetupAssistantControllerClass_softClass;
  if (!getPKPaymentSetupAssistantControllerClass_softClass)
  {
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __getPKPaymentSetupAssistantControllerClass_block_invoke;
    v13 = &unk_1E4E26900;
    v14 = &v15;
    __getPKPaymentSetupAssistantControllerClass_block_invoke((uint64_t)&v10);
    v5 = (void *)v16[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v15, 8);
  v7 = (void *)objc_msgSend([v6 alloc], "initWithSetupAssistantContext:", v4);
  v10 = 0;
  objc_msgSend(v7, "setupAssistantNeedsToRunReturningRequirements:", &v10);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_paymentScreenRequirementsIncludePasscode:(id)a3
{
  return ((unint64_t)objc_msgSend(a3, "unsignedIntegerValue") >> 1) & 1;
}

- (BOOL)_paymentScreenRequirementsIncludeiCloud:(id)a3
{
  return objc_msgSend(a3, "unsignedIntegerValue") & 1;
}

- (BOOL)canShowTouchIDScreen
{
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47028]) == 2)
  {

    return 0;
  }
  v4 = +[BYManagedAppleIDBootstrap isMultiUser](BYManagedAppleIDBootstrap, "isMultiUser");

  if (v4)
    return 0;
  return -[BYCapabilities mgHasMesa](self, "mgHasMesa");
}

- (BOOL)canShowFaceIDScreen
{
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47028]) == 2)
  {

    return 0;
  }
  v4 = +[BYManagedAppleIDBootstrap isMultiUser](BYManagedAppleIDBootstrap, "isMultiUser");

  if (v4)
    return 0;
  return -[BYCapabilities supportsPearl](self, "supportsPearl");
}

- (BOOL)canShowPasscodeScreen
{
  void *v2;
  int v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47100]) == 2)
  {
    LOBYTE(v3) = 0;
LABEL_6:

    return v3;
  }
  v4 = +[BYManagedAppleIDBootstrap isMultiUser](BYManagedAppleIDBootstrap, "isMultiUser");

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isPasscodeSet") ^ 1;
    goto LABEL_6;
  }
  LOBYTE(v3) = 0;
  return v3;
}

- (BOOL)canShowAppleIDScreen
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46ED8]) != 2;

  return v3;
}

- (BOOL)isSiriRestricted
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F20]) == 2;

  return v3;
}

- (BOOL)isDeviceAnalyticsRestricted
{
  void *v2;
  char v3;
  void *v4;
  int v5;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x1E0D46FC0]);

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46FC8]);

  if (v5 == 2)
    return 1;
  else
    return v3;
}

- (BOOL)isAppAnalyticsRestricted
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x1E0D46EF0]);

  return v3;
}

- (BOOL)isCloudAnalyticsRestricted
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46ED8]) == 2;

  return v3;
}

- (BOOL)isScreenTimeRestricted
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46FD8]) == 2;

  return v3;
}

- (BOOL)mgHasSiriCapability
{
  return MGGetBoolAnswer();
}

- (BOOL)mgHasSecureElement
{
  return MGGetBoolAnswer();
}

- (BOOL)mgHasMesa
{
  return MGGetBoolAnswer();
}

- (BOOL)mgHasCellularData
{
  return MGGetBoolAnswer();
}

- (BOOL)mgHasCellularTelephony
{
  return MGGetBoolAnswer();
}

- (BOOL)mgHasGreenTea
{
  return MGGetBoolAnswer();
}

- (BOOL)mgSupportsSingleDisplayEnhancedMultitasking
{
  return MGGetBoolAnswer();
}

- (BOOL)mgIsHactivated
{
  return MGGetBoolAnswer();
}

- (BOOL)eligibleForChlorine
{
  uint64_t domain_answer;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  domain_answer = os_eligibility_get_domain_answer();
  _BYLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[BYCapabilities eligibleForChlorine].cold.1(domain_answer, v3, v4, v5, v6, v7, v8, v9);

  return 0;
}

- (void)eligibilitySetDeviceLocale:(id)a3
{
  xpc_object_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a3)
  {
    v3 = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
    v4 = os_eligibility_set_input();
    if ((_DWORD)v4)
    {
      v5 = v4;
      _BYLoggingFacility();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[BYCapabilities eligibilitySetDeviceLocale:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

    }
  }
}

- (BOOL)hasEligibleEnrolledIdentityForPeriocularFaceIDEnrollment
{
  id BKDeviceClass;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v12;
  id v13;
  uint8_t buf[4];
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  BKDeviceClass = getBKDeviceClass();
  objc_msgSend(getBKDeviceDescriptorClass(), "deviceDescriptorForType:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(BKDeviceClass, "deviceWithDescriptor:error:", v3, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;

  if (!v4 || v5)
  {
    _BYLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v5;
      _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "Failed to fetch BKDevice: %@", buf, 0xCu);
    }
    v10 = 0;
  }
  else
  {
    v12 = 0;
    objc_msgSend(v4, "identitiesForUser:error:", getuid(), &v12);
    v6 = objc_claimAutoreleasedReturnValue();
    v5 = v12;
    _BYLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_1A4E92000, v7, OS_LOG_TYPE_DEFAULT, "Periocular check identities: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject filteredArrayUsingPredicate:](v6, "filteredArrayUsingPredicate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count") != 0;

  }
  return v10;
}

uint64_t __74__BYCapabilities_hasEligibleEnrolledIdentityForPeriocularFaceIDEnrollment__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPeriocularEnrollment") ^ 1;
}

- (BOOL)supportsPeriocularFaceID
{
  id BKDeviceClass;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  char v9;
  id v11;
  id v12;
  uint8_t buf[4];
  NSObject *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  BKDeviceClass = getBKDeviceClass();
  objc_msgSend(getBKDeviceDescriptorClass(), "deviceDescriptorForType:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(BKDeviceClass, "deviceWithDescriptor:error:", v3, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;

  if (!v4 || v5)
  {
    _BYLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "Failed to fetch BKDevice: %@", buf, 0xCu);
    }
    v9 = 0;
  }
  else
  {
    v11 = 0;
    objc_msgSend(v4, "supportsPeriocularEnrollmentWithError:", &v11);
    v6 = objc_claimAutoreleasedReturnValue();
    v5 = v11;
    if (v5)
    {
      _BYLoggingFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v5;
        _os_log_impl(&dword_1A4E92000, v7, OS_LOG_TYPE_DEFAULT, "Failed to fetch device support for Periocular error:%@", buf, 0xCu);
      }

    }
    _BYLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_1A4E92000, v8, OS_LOG_TYPE_DEFAULT, "periocularSupported: %@", buf, 0xCu);
    }

    v9 = -[NSObject BOOLValue](v6, "BOOLValue");
  }

  return v9;
}

- (void)eligibleForChlorine
{
  OUTLINED_FUNCTION_0_1(&dword_1A4E92000, a2, a3, "Failed to get eligibility for chlorine with error %d", a5, a6, a7, a8, 0);
}

- (void)eligibilitySetDeviceLocale:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A4E92000, a2, a3, "Failed to set eligibility device locale with error %d", a5, a6, a7, a8, 0);
}

@end
