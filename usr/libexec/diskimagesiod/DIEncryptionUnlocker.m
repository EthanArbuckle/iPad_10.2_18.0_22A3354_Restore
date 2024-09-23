@implementation DIEncryptionUnlocker

- (id)GUIPassphrasePrompt
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "inputURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Enter password to access “%@”"), v4));

  return v5;
}

- (id)GUIPassphraseLabel
{
  return CFSTR("Password");
}

- (id)CLIPassphrasePrompt
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "inputURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Enter password to access “%@”: "), v4));

  return v5;
}

- (BOOL)keychainUnlockWithIsSystemKeychain:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  const __CFDictionary *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  char *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  OSStatus v20;
  OSStatus v21;
  int v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  char *v26;
  int v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  unsigned __int8 v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  NSObject *v55;
  const char *v57;
  const char *v58;
  id v59;
  uint64_t v60;
  CFTypeRef result;
  uint8_t buf[4];
  int v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  const char *v67;
  _QWORD v68[4];
  _QWORD v69[4];

  v5 = a3;
  result = 0;
  v69[0] = kSecClassGenericPassword;
  v68[0] = kSecClass;
  v68[1] = kSecAttrAccount;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend encryptionUUID](self, "encryptionUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
  v69[1] = v8;
  v69[2] = kSecAttrSynchronizableAny;
  v68[2] = kSecAttrSynchronizable;
  v68[3] = kSecReturnData;
  v69[3] = &__kCFBooleanTrue;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v69, v68, 4));
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v9));

  if (v5
    && !+[DIEncryptionFrontend updateSystemKeychainAttrWithDict:isStoring:error:](DIEncryptionFrontend, "updateSystemKeychainAttrWithDict:isStoring:error:", v10, 0, 0))
  {
    goto LABEL_65;
  }
  v11 = *__error();
  if (sub_1000BF0BC())
  {
    v60 = 0;
    v12 = sub_1000BF044();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      v14 = 3;
    else
      v14 = 2;
    v15 = "iCloud";
    *(_DWORD *)buf = 68158210;
    v63 = 65;
    v65 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
    v64 = 2080;
    if (v5)
      v15 = "system";
    v66 = 2080;
    v67 = v15;
    LODWORD(v57) = 28;
    v16 = (char *)_os_log_send_and_compose_impl(v14, &v60, 0, 0, &_mh_execute_header, v13, 0, "%.*s: Looking for encrypted image passphrase in the %s keychain", (int)buf, v57, v58);

    if (v16)
    {
      fprintf(__stderrp, "%s\n", v16);
      free(v16);
    }
  }
  else
  {
    v17 = sub_1000BF044();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = "iCloud";
      *(_DWORD *)buf = 68158210;
      v63 = 65;
      v65 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
      v64 = 2080;
      if (v5)
        v19 = "system";
      v66 = 2080;
      v67 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%.*s: Looking for encrypted image passphrase in the %s keychain", buf, 0x1Cu);
    }

  }
  *__error() = v11;
  v20 = SecItemCopyMatching(v10, &result);
  v21 = v20;
  if (v20 == -25308)
  {
    v22 = *__error();
    if (!sub_1000BF0BC())
    {
      v52 = sub_1000BF044();
      v53 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        v63 = 65;
        v64 = 2080;
        v65 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%.*s: Keychain item requires ACL upgrade", buf, 0x12u);
      }

      goto LABEL_60;
    }
    v60 = 0;
    v32 = sub_1000BF044();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      v34 = 3;
    else
      v34 = 2;
    *(_DWORD *)buf = 68157954;
    v63 = 65;
    v64 = 2080;
    v65 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
    LODWORD(v57) = 18;
    v26 = (char *)_os_log_send_and_compose_impl(v34, &v60, 0, 0, &_mh_execute_header, v33, 0, "%.*s: Keychain item requires ACL upgrade", (int)buf, v57);

    if (v26)
    {
LABEL_36:
      fprintf(__stderrp, "%s\n", v26);
      free(v26);
    }
LABEL_60:
    *__error() = v22;
    v49 = 1;
    -[DIEncryptionFrontend setAllowStoringInKeychain:](self, "setAllowStoringInKeychain:", 1);
    goto LABEL_66;
  }
  if (v20)
  {
    if (v20 == -25300)
    {
      v22 = *__error();
      if (!sub_1000BF0BC())
      {
        v50 = sub_1000BF044();
        v51 = objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          v63 = 65;
          v64 = 2080;
          v65 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%.*s: No matching item found in keychain", buf, 0x12u);
        }

        goto LABEL_60;
      }
      v60 = 0;
      v23 = sub_1000BF044();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        v25 = 3;
      else
        v25 = 2;
      *(_DWORD *)buf = 68157954;
      v63 = 65;
      v64 = 2080;
      v65 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
      LODWORD(v57) = 18;
      v26 = (char *)_os_log_send_and_compose_impl(v25, &v60, 0, 0, &_mh_execute_header, v24, 0, "%.*s: No matching item found in keychain", (int)buf, v57);

      if (v26)
        goto LABEL_36;
      goto LABEL_60;
    }
    v35 = *__error();
    if (sub_1000BF0BC())
    {
      v60 = 0;
      v36 = sub_1000BF044();
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        v38 = 3;
      else
        v38 = 2;
      *(_DWORD *)buf = 68158210;
      v63 = 65;
      v64 = 2080;
      v65 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
      v66 = 1024;
      LODWORD(v67) = v21;
      LODWORD(v57) = 24;
      v39 = (char *)_os_log_send_and_compose_impl(v38, &v60, 0, 0, &_mh_execute_header, v37, 0, "%.*s: Keychain lookup returned %d", (int)buf, v57, (_DWORD)v58);

      if (v39)
      {
        fprintf(__stderrp, "%s\n", v39);
        free(v39);
      }
    }
    else
    {
      v54 = sub_1000BF044();
      v55 = objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        v63 = 65;
        v64 = 2080;
        v65 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
        v66 = 1024;
        LODWORD(v67) = v21;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%.*s: Keychain lookup returned %d", buf, 0x18u);
      }

    }
    *__error() = v35;
LABEL_65:
    v49 = 1;
    goto LABEL_66;
  }
  v27 = *__error();
  if (sub_1000BF0BC())
  {
    v60 = 0;
    v28 = sub_1000BF044();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      v30 = 3;
    else
      v30 = 2;
    *(_DWORD *)buf = 68157954;
    v63 = 65;
    v64 = 2080;
    v65 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
    LODWORD(v57) = 18;
    v31 = (char *)_os_log_send_and_compose_impl(v30, &v60, 0, 0, &_mh_execute_header, v29, 0, "%.*s: Passphrase found in keychain, unlocking the image", (int)buf, v57);

    if (v31)
    {
      fprintf(__stderrp, "%s\n", v31);
      free(v31);
    }
  }
  else
  {
    v40 = sub_1000BF044();
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      v63 = 65;
      v64 = 2080;
      v65 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%.*s: Passphrase found in keychain, unlocking the image", buf, 0x12u);
    }

  }
  *__error() = v27;
  v42 = (void *)result;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
  v44 = objc_retainAutorelease(v42);
  v59 = 0;
  v45 = objc_msgSend(v43, "setPassphrase:error:", objc_msgSend(v44, "bytes"), &v59);
  v46 = v59;

  if ((v45 & 1) != 0 || ((v47 = (uint64_t)objc_msgSend(v46, "code"), v47 >= 0) ? (v48 = v47) : (v48 = -v47), v48 == 80))
  {
    v49 = 1;
  }
  else
  {
    v49 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v46);
  }

LABEL_66:
  return v49;
}

- (BOOL)keychainUnlockWithError:(id *)a3
{
  unsigned int v5;
  BOOL result;
  unsigned int v7;
  char v8;

  v8 = 0;
  v5 = -[DIEncryptionFrontend checkWithHasIcloudKeychain:error:](self, "checkWithHasIcloudKeychain:error:", &v8, a3);
  result = 0;
  if (v5)
  {
    if (!v8)
      return 1;
    v7 = -[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:](self, "keychainUnlockWithIsSystemKeychain:error:", 0, a3);
    result = 0;
    if (v7)
      return 1;
  }
  return result;
}

- (BOOL)lookupLegacyKeychainWithXpcHandler:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)tryUnlockUsingSaksWithHasSaksKey:(BOOL *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  unsigned __int8 v12;
  _OWORD v14[6];

  memset(v14, 0, 89);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "diskImageParamsXPC"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "backendXPC"));
  v10 = +[DICryptoHelper getPassphraseUsingSaksWithBackendXPC:passPhrase:error:](DICryptoHelper, "getPassphraseUsingSaksWithBackendXPC:passPhrase:error:", v9, v14, a4);

  if ((v10 & 1) == 0)
    return 0;
  if (!LOBYTE(v14[0]))
    return 1;
  if (a3)
    *a3 = 1;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
  v12 = objc_msgSend(v11, "setPassphrase:error:", v14, a4);

  return v12;
}

- (BOOL)unlockWithXpcHandler:(id)a3 error:(id *)a4
{
  id v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  unsigned __int8 v17;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  void *v25;
  unsigned __int8 v26;
  id v27;
  char v28;
  id v29;

  v6 = a3;
  v7 = -[DIEncryptionFrontend flags](self, "flags");
  v8 = v7;
  if ((v7 & 8) != 0)
  {
    v10 = -[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:](self, "consoleAskForPassphraseWithUseStdin:error:", 1, a4);
LABEL_7:
    v9 = v10;
    goto LABEL_23;
  }
  if ((v7 & 1) == 0)
  {
LABEL_3:
    v28 = 0;
    if (-[DIEncryptionUnlocker tryUnlockUsingSaksWithHasSaksKey:error:](self, "tryUnlockUsingSaksWithHasSaksKey:error:", &v28, a4))
    {
      if (v28)
      {
LABEL_5:
        v9 = 1;
LABEL_23:
        v13 = 0;
        goto LABEL_24;
      }
      if ((v8 & 2) == 0)
        goto LABEL_14;
      if (-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:](self, "consoleAskForPassphraseWithUseStdin:error:", 0, a4))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
        v17 = objc_msgSend(v16, "hasUnlockedBackend");

        if ((v17 & 1) != 0)
          goto LABEL_5;
LABEL_14:
        if ((v8 & 4) != 0)
        {
          v19 = 0;
          v20 = 2;
          while (1)
          {
            v27 = v19;
            v9 = objc_msgSend(v6, "GUIAskForPassphraseWithEncryptionFrontend:error:", self, &v27);
            v21 = v27;

            if ((v9 & 1) != 0)
              break;
            v22 = (uint64_t)objc_msgSend(v21, "code");
            if (v22 >= 0)
              v23 = v22;
            else
              v23 = -v22;
            v24 = v23 != 80 || v20-- == 0;
            v19 = v21;
            if (v24)
            {
              if (a4)
                *a4 = objc_retainAutorelease(v21);
              break;
            }
          }

          goto LABEL_23;
        }
        v10 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 25, CFSTR("Cannot retrieve passphrase from user via TTY or GUI"), a4);
        goto LABEL_7;
      }
    }
    v9 = 0;
    goto LABEL_23;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
  v29 = 0;
  v12 = objc_msgSend(v11, "tryUnlockUsingKeychainCertificateWithError:", &v29);
  v13 = v29;

  if ((v12 & 1) != 0)
    goto LABEL_9;
  if (v13)
  {
    if (a4)
    {
      v13 = objc_retainAutorelease(v13);
      v9 = 0;
      *a4 = v13;
      goto LABEL_24;
    }
LABEL_43:
    v9 = 0;
    goto LABEL_24;
  }
  if (!objc_msgSend(v6, "keychainUnlockWithEncryptionUnlocker:error:", self, a4))
    goto LABEL_42;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
  v15 = objc_msgSend(v14, "hasUnlockedBackend");

  if ((v15 & 1) == 0)
  {
    if (!-[DIEncryptionFrontend allowStoringInKeychain](self, "allowStoringInKeychain"))
      goto LABEL_3;
    if (-[DIEncryptionUnlocker lookupLegacyKeychainWithXpcHandler:error:](self, "lookupLegacyKeychainWithXpcHandler:error:", v6, a4))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
      v26 = objc_msgSend(v25, "hasUnlockedBackend");

      if ((v26 & 1) == 0)
        goto LABEL_3;
      goto LABEL_18;
    }
LABEL_42:
    v13 = 0;
    goto LABEL_43;
  }
LABEL_18:
  v13 = 0;
LABEL_9:
  v9 = 1;
LABEL_24:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
