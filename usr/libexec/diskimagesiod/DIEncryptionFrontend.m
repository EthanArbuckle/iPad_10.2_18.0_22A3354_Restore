@implementation DIEncryptionFrontend

- (DIEncryptionFrontend)initWithParams:(id)a3
{
  id v5;
  DIEncryptionFrontend *v6;
  DIEncryptionFrontend *v7;
  uint64_t v8;
  NSUUID *encryptionUUID;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DIEncryptionFrontend;
  v6 = -[DIEncryptionFrontend init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_diParams, a3);
    if (-[DIEncryptionFrontend validateDeserializationWithError:](v7, "validateDeserializationWithError:", 0))
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "encryptionUUID"));
      encryptionUUID = v7->_encryptionUUID;
      v7->_encryptionUUID = (NSUUID *)v8;

    }
  }

  return v7;
}

- (unint64_t)flags
{
  void *v2;
  unint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
  v3 = (unint64_t)objc_msgSend(v2, "readPassphraseFlags");

  v4 = isatty(0);
  v5 = 2;
  if (!v4)
    v5 = 8;
  v6 = v3 & 0xFFFFFFFFFFFFFFFDLL;
  if (v4)
    v6 = v3;
  if ((v3 & 8) != 0)
    v7 = v5;
  else
    v7 = v6;
  if (+[DIEncryptionFrontend hasGUIaccess](DIEncryptionFrontend, "hasGUIaccess"))
    return v7;
  else
    return v7 & 0xFFFFFFFFFFFFFFFBLL;
}

- (id)getCertificateWithCertificatePath:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", a3));
  if (!v5)
  {
    v6 = +[DIError nilWithPOSIXCode:description:error:](DIError, "nilWithPOSIXCode:description:error:", *__error(), CFSTR("Failed to read from certificate file "), a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }
  return v5;
}

- (id)getCertificateWithPublicKey:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  const __CFDictionary *v7;
  uint64_t v8;
  void *v9;
  CFTypeRef v11;
  _QWORD v12[3];
  _QWORD v13[3];

  v5 = a3;
  v11 = 0;
  v12[0] = kSecClass;
  v12[1] = kSecAttrPublicKeyHash;
  v13[0] = kSecClassCertificate;
  v13[1] = v5;
  v12[2] = kSecReturnData;
  v13[2] = &__kCFBooleanTrue;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 3));
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v6));

  v8 = SecItemCopyMatching(v7, &v11);
  if ((_DWORD)v8)
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[DIError nilWithOSStatus:verboseInfo:error:](DIError, "nilWithOSStatus:verboseInfo:error:", v8, CFSTR("Failed to find keychain item using hashed key"), a4));
  else
    v9 = (void *)v11;

  return v9;
}

- (BOOL)consoleAskForPassphraseWithUseStdin:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  int v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  const char *v15;
  int v16;
  char *v17;
  void *v18;
  BOOL v19;
  id v20;
  char *v21;
  void *v23;
  unsigned __int8 v24;
  int v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  NSObject *v31;
  const char *v33;
  uint64_t v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  char __s1[258];

  v5 = a3;
  v7 = *__error();
  if (sub_1000BF0BC())
  {
    v34 = 0;
    v8 = sub_1000BF044();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      v10 = 3;
    else
      v10 = 2;
    *(_DWORD *)buf = 68157954;
    v36 = 66;
    v37 = 2080;
    v38 = "-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]";
    LODWORD(v33) = 18;
    v11 = (char *)_os_log_send_and_compose_impl(v10, &v34, 0, 0, &_mh_execute_header, v9, 0, "%.*s: Asking for passphrase using readpassphrase", (int)buf, v33);

    if (v11)
    {
      fprintf(__stderrp, "%s\n", v11);
      free(v11);
    }
  }
  else
  {
    v12 = sub_1000BF044();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      v36 = 66;
      v37 = 2080;
      v38 = "-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%.*s: Asking for passphrase using readpassphrase", buf, 0x12u);
    }

  }
  *__error() = v7;
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend CLIPassphrasePrompt](self, "CLIPassphrasePrompt")));
  v15 = (const char *)objc_msgSend(v14, "UTF8String");
  if (v5)
    v16 = 32;
  else
    v16 = 2;
  v17 = readpassphrase(v15, __s1, 0x102uLL, v16);

  if (v17)
  {
    if (!v5)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend CLIVerifyPassphrasePrompt](self, "CLIVerifyPassphrasePrompt"));
      v19 = v18 == 0;

      if (!v19)
      {
        v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend CLIVerifyPassphrasePrompt](self, "CLIVerifyPassphrasePrompt")));
        v21 = readpassphrase((const char *)objc_msgSend(v20, "UTF8String"), (char *)buf, 0x102uLL, 2);

        if (!v21)
          return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 25, CFSTR("Failed to read passphrase"), a4);
        if (strncmp(__s1, (const char *)buf, 0x101uLL))
          return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 80, CFSTR("Passphrases doesn't match"), a4);
      }
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
    v24 = objc_msgSend(v23, "setPassphrase:error:", __s1, a4);

  }
  else
  {
    if (v5)
      return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 25, CFSTR("Failed to read passphrase from stdin"), a4);
    v25 = *__error();
    if (sub_1000BF0BC())
    {
      v34 = 0;
      v26 = sub_1000BF044();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        v28 = 3;
      else
        v28 = 2;
      *(_DWORD *)buf = 68157954;
      v36 = 66;
      v37 = 2080;
      v38 = "-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]";
      LODWORD(v33) = 18;
      v29 = (char *)_os_log_send_and_compose_impl(v28, &v34, 0, 0, &_mh_execute_header, v27, 0, "%.*s: Failed to read passphrase from TTY", (int)buf, v33);

      if (v29)
      {
        fprintf(__stderrp, "%s\n", v29);
        free(v29);
      }
    }
    else
    {
      v30 = sub_1000BF044();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        v36 = 66;
        v37 = 2080;
        v38 = "-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]";
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%.*s: Failed to read passphrase from TTY", buf, 0x12u);
      }

    }
    *__error() = v25;
    return 1;
  }
  return v24;
}

- (BOOL)checkWithHasIcloudKeychain:(BOOL *)a3 error:(id *)a4
{
  *a3 = 1;
  return 1;
}

+ (BOOL)updateSystemKeychainAttrWithDict:(id)a3 isStoring:(BOOL)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)storeInKeychainWithPassphrase:(id)a3 forceSystemKeychain:(BOOL)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  const char *v24;
  char *v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  const char *v31;
  const char *v32;
  id v33;
  uint64_t v34;
  char v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  _QWORD v42[7];
  _QWORD v43[7];

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "inputURL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));

  v13 = objc_retainAutorelease(v8);
  v14 = (const char *)objc_msgSend(v13, "UTF8String");
  if (v14 && *v14)
  {
    v33 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v14, strlen(v14));
    v43[0] = kSecClassGenericPassword;
    v42[0] = kSecClass;
    v42[1] = kSecAttrAccount;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend encryptionUUID](self, "encryptionUUID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
    v43[1] = v16;
    v43[2] = CFSTR("disk image password");
    v42[2] = kSecAttrDescription;
    v42[3] = kSecAttrLabel;
    v43[3] = v12;
    v43[4] = v12;
    v42[4] = kSecAttrService;
    v42[5] = kSecAttrSynchronizable;
    v42[6] = kSecValueData;
    v43[5] = &__kCFBooleanTrue;
    v43[6] = v33;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 7));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v17));

    v35 = 0;
    if (a4)
      goto LABEL_31;
    if (!-[DIEncryptionFrontend checkWithHasIcloudKeychain:error:](self, "checkWithHasIcloudKeychain:error:", &v35, a5))
    {
LABEL_17:
      v19 = 0;
LABEL_27:

      goto LABEL_28;
    }
    if (!v35)
    {
LABEL_31:
      if (!+[DIEncryptionFrontend updateSystemKeychainAttrWithDict:isStoring:error:](DIEncryptionFrontend, "updateSystemKeychainAttrWithDict:isStoring:error:", v18, 1, a5))goto LABEL_17;
    }
    v20 = *__error();
    if (sub_1000BF0BC())
    {
      v34 = 0;
      v21 = sub_1000BF044();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        v23 = 3;
      else
        v23 = 2;
      v24 = "iCloud";
      *(_DWORD *)buf = 68158210;
      v37 = 80;
      v39 = "-[DIEncryptionFrontend storeInKeychainWithPassphrase:forceSystemKeychain:error:]";
      v38 = 2080;
      if (!v35)
        v24 = "system";
      v40 = 2080;
      v41 = v24;
      LODWORD(v31) = 28;
      v25 = (char *)_os_log_send_and_compose_impl(v23, &v34, 0, 0, &_mh_execute_header, v22, 0, "%.*s: Storing passphrase in the %s keychain", (int)buf, v31, v32);

      if (v25)
      {
        fprintf(__stderrp, "%s\n", v25);
        free(v25);
      }
    }
    else
    {
      v26 = sub_1000BF044();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        if (v35)
          v28 = "iCloud";
        else
          v28 = "system";
        *(_DWORD *)buf = 68158210;
        v37 = 80;
        v38 = 2080;
        v39 = "-[DIEncryptionFrontend storeInKeychainWithPassphrase:forceSystemKeychain:error:]";
        v40 = 2080;
        v41 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%.*s: Storing passphrase in the %s keychain", buf, 0x1Cu);
      }

    }
    *__error() = v20;
    v29 = SecItemAdd((CFDictionaryRef)v18, 0);
    if ((_DWORD)v29)
      v19 = +[DIError failWithOSStatus:description:error:](DIError, "failWithOSStatus:description:error:", v29, CFSTR("Failed to store the passphrase in the keychain"), a5);
    else
      v19 = 1;
    goto LABEL_27;
  }
  v19 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 154, CFSTR("Cannot store an empty passphrase"), a5);
LABEL_28:

  return v19;
}

- (BOOL)askPermissionWithRememberPassword:(BOOL *)a3 error:(id *)a4
{
  int v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  const __CFDictionary *v13;
  __CFUserNotification *v14;
  __CFUserNotification *v15;
  unsigned __int8 v16;
  BOOL v17;
  void *v18;
  const char *v20;
  SInt32 error[2];
  _QWORD v22[4];
  _QWORD v23[4];
  uint8_t buf[8];
  __int16 v25;
  const char *v26;

  if (!-[DIEncryptionFrontend allowStoringInKeychain](self, "allowStoringInKeychain"))
    return 1;
  v6 = *__error();
  if (sub_1000BF0BC())
  {
    *(_QWORD *)error = 0;
    v7 = sub_1000BF044();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      v9 = 3;
    else
      v9 = 2;
    *(_DWORD *)buf = 68157954;
    *(_DWORD *)&buf[4] = 64;
    v25 = 2080;
    v26 = "-[DIEncryptionFrontend askPermissionWithRememberPassword:error:]";
    LODWORD(v20) = 18;
    v10 = (char *)_os_log_send_and_compose_impl(v9, error, 0, 0, &_mh_execute_header, v8, 0, "%.*s: Asking user permission to store the passphrase in the keychain", (int)buf, v20);

    if (v10)
    {
      fprintf(__stderrp, "%s\n", v10);
      free(v10);
    }
  }
  else
  {
    v11 = sub_1000BF044();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      *(_DWORD *)&buf[4] = 64;
      v25 = 2080;
      v26 = "-[DIEncryptionFrontend askPermissionWithRememberPassword:error:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%.*s: Asking user permission to store the passphrase in the keychain", buf, 0x12u);
    }

  }
  *__error() = v6;
  error[0] = 0;
  v22[0] = kCFUserNotificationAlertHeaderKey;
  v22[1] = kCFUserNotificationDefaultButtonTitleKey;
  v23[0] = CFSTR("Remember password in my keychain?");
  v23[1] = CFSTR("Yes");
  v22[2] = kCFUserNotificationOtherButtonTitleKey;
  v22[3] = kCFUserNotificationAlternateButtonTitleKey;
  v23[2] = CFSTR("No");
  v23[3] = CFSTR("Cancel");
  v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 4));
  v14 = CFUserNotificationCreate(0, 0.0, 3uLL, error, v13);
  v15 = v14;
  if (!v14)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CFUserNotificationCreate failed, error code %d"), error[0]));
    v17 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 154, v18, a4);

    return v17;
  }
  *(_QWORD *)buf = 0;
  if (!CFUserNotificationReceiveResponse(v14, 0.0, (CFOptionFlags *)buf))
  {
    if (*(_QWORD *)buf != 2)
    {
      if (*(_QWORD *)buf)
      {
        v16 = +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", 89, CFSTR("The operation was cancelled by the user"), a4);
        goto LABEL_14;
      }
      *a3 = 1;
    }

    return 1;
  }
  v16 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 154, CFSTR("CFUserNotificationReceiveResponse failed"), a4);
LABEL_14:
  v17 = v16;

  return v17;
}

- (BOOL)GUIAskForPassphraseWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  CFOptionFlags v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFDictionary *v12;
  __CFUserNotification *v13;
  __CFUserNotification *v14;
  BOOL v15;
  void *v16;
  id v17;
  unsigned __int8 v18;
  CFStringRef ResponseValue;
  CFStringRef v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  unsigned int v24;
  unsigned int v25;
  char v27;
  CFOptionFlags responseFlags;
  SInt32 error;
  _QWORD v30[4];
  _QWORD v31[4];

  error = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend GUIPassphraseLabel](self, "GUIPassphraseLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend GUIVerifyPassphraseLabel](self, "GUIVerifyPassphraseLabel"));
  v8 = 65539;

  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend GUIVerifyPassphraseLabel](self, "GUIVerifyPassphraseLabel"));
    objc_msgSend(v6, "addObject:", v9);

    v8 = 196611;
  }
  v30[0] = kCFUserNotificationAlertHeaderKey;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend GUIPassphrasePrompt](self, "GUIPassphrasePrompt"));
  v31[0] = v10;
  v31[1] = CFSTR("OK");
  v30[1] = kCFUserNotificationDefaultButtonTitleKey;
  v30[2] = kCFUserNotificationAlternateButtonTitleKey;
  v30[3] = kCFUserNotificationTextFieldTitlesKey;
  v31[2] = CFSTR("Cancel");
  v31[3] = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 4));
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v11));

  v13 = CFUserNotificationCreate(0, 0.0, v8, &error, v12);
  v14 = v13;
  if (!v13)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CFUserNotificationCreate failed, error code %d"), error));
    v15 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 154, v16, a3);

    goto LABEL_24;
  }
  responseFlags = 0;
  if (!CFUserNotificationReceiveResponse(v13, 0.0, &responseFlags))
  {
    v27 = BYTE1(responseFlags) & 1;
    if ((responseFlags & 3) != 0)
    {
      v17 = 0;
      v18 = +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", 89, CFSTR("The operation was cancelled by the user"), a3);
    }
    else
    {
      ResponseValue = CFUserNotificationGetResponseValue(v14, kCFUserNotificationTextFieldValuesKey, 0);
      v17 = (id)objc_claimAutoreleasedReturnValue(ResponseValue);
      if (v7)
      {
        v20 = CFUserNotificationGetResponseValue(v14, kCFUserNotificationTextFieldValuesKey, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        if (!objc_msgSend(v17, "isEqualToString:", v21))
        {
          v15 = +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", 80, CFSTR("Passwords don’t match"), a3);

          goto LABEL_23;
        }

      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
      v17 = objc_retainAutorelease(v17);
      v23 = objc_msgSend(v22, "setPassphrase:error:", objc_msgSend(v17, "UTF8String"), a3);

      if ((v23 & 1) == 0
        || !-[DIEncryptionFrontend askPermissionWithRememberPassword:error:](self, "askPermissionWithRememberPassword:error:", &v27, a3))
      {
        v15 = 0;
        goto LABEL_23;
      }
      v24 = -[DIEncryptionFrontend allowStoringInKeychain](self, "allowStoringInKeychain");
      if (v27)
        v25 = v24;
      else
        v25 = 0;
      if (v25 != 1)
      {
        v15 = 1;
        goto LABEL_23;
      }
      v18 = -[DIEncryptionFrontend storeInKeychainWithPassphrase:forceSystemKeychain:error:](self, "storeInKeychainWithPassphrase:forceSystemKeychain:error:", v17, 0, a3);
    }
    v15 = v18;
LABEL_23:

    goto LABEL_24;
  }
  v15 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 154, CFSTR("CFUserNotificationReceiveResponse failed"), a3);
LABEL_24:

  return v15;
}

+ (BOOL)hasGUIaccess
{
  return 1;
}

- (BOOL)updateDiskImageParamsWithFrontend:(id)a3 error:(id *)a4
{
  id v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = objc_msgSend(v6, "validateDeserializationWithError:", a4);
  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "diParams"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "diskImageParamsXPC"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
    objc_msgSend(v10, "setDiskImageParamsXPC:", v9);

    -[DIEncryptionFrontend setAllowStoringInKeychain:](self, "setAllowStoringInKeychain:", objc_msgSend(v6, "allowStoringInKeychain"));
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIEncryptionFrontend)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  DIEncryptionFrontend *v8;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(DIBaseParams, v5), CFSTR("diParams"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = -[DIEncryptionFrontend initWithParams:](self, "initWithParams:", v7);
  if (v8)
    v8->_allowStoringInKeychain = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowStoringInKeychain"));

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("diParams"));

  objc_msgSend(v5, "encodeBool:forKey:", -[DIEncryptionFrontend allowStoringInKeychain](self, "allowStoringInKeychain"), CFSTR("allowStoringInKeychain"));
}

- (BOOL)validateDeserializationWithError:(id *)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
  LOBYTE(a3) = objc_msgSend(v4, "validateDeserializationWithError:", a3);

  return (char)a3;
}

- (NSString)GUIPassphrasePrompt
{
  return self->_GUIPassphrasePrompt;
}

- (NSString)GUIPassphraseLabel
{
  return self->_GUIPassphraseLabel;
}

- (NSString)GUIVerifyPassphraseLabel
{
  return self->_GUIVerifyPassphraseLabel;
}

- (NSString)CLIPassphrasePrompt
{
  return self->_CLIPassphrasePrompt;
}

- (NSString)CLIVerifyPassphrasePrompt
{
  return self->_CLIVerifyPassphrasePrompt;
}

- (DIBaseParams)diParams
{
  return self->_diParams;
}

- (NSUUID)encryptionUUID
{
  return self->_encryptionUUID;
}

- (BOOL)allowStoringInKeychain
{
  return self->_allowStoringInKeychain;
}

- (void)setAllowStoringInKeychain:(BOOL)a3
{
  self->_allowStoringInKeychain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionUUID, 0);
  objc_storeStrong((id *)&self->_diParams, 0);
  objc_storeStrong((id *)&self->_CLIVerifyPassphrasePrompt, 0);
  objc_storeStrong((id *)&self->_CLIPassphrasePrompt, 0);
  objc_storeStrong((id *)&self->_GUIVerifyPassphraseLabel, 0);
  objc_storeStrong((id *)&self->_GUIPassphraseLabel, 0);
  objc_storeStrong((id *)&self->_GUIPassphrasePrompt, 0);
}

@end
