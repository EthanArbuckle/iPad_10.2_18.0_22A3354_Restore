@implementation RMStoreUtility

+ (id)filterForUserEnrollmentWithDeclaration:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[RMStoreUtility _passcodeSettingsForUserEnrollmentWithDeclaration:](RMStoreUtility, "_passcodeSettingsForUserEnrollmentWithDeclaration:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_passcodeSettingsForUserEnrollmentWithDeclaration:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BE7EBE8];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadMaximumInactivityInMinutes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = &unk_251635DA8;
  if (!v7)
    v8 = 0;
  objc_msgSend(v3, "buildWithIdentifier:requirePasscode:requireAlphanumericPasscode:requireComplexPasscode:minimumLength:minimumComplexCharacters:maximumFailedAttempts:failedAttemptsResetInMinutes:maximumGracePeriodInMinutes:maximumInactivityInMinutes:maximumPasscodeAgeInDays:passcodeReuseLimit:changeAtNextAuth:customRegex:", v6, &unk_251635D60, 0, &unk_251635D60, &unk_251635D78, &unk_251635D90, 0, 0, 0, v8, 0, 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)isValidURL:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  BOOL v10;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("https"));

  if (!v5)
    goto LABEL_6;
  if (!objc_msgSend(MEMORY[0x24BE7EB10], "permissiveURLSchemes"))
    goto LABEL_5;
  objc_msgSend(v3, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("http"));

  if (!v7)
    goto LABEL_6;
  objc_msgSend(v3, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("file"));

  if (v9)
LABEL_5:
    v10 = 0;
  else
LABEL_6:
    v10 = 1;

  return v10;
}

@end
