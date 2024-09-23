@implementation POConstantCoreUtil

+ (id)stringForSEPBiometricPolicy:(unint64_t)a3
{
  BOOL v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  if (!a3)
  {
    v5 = CFSTR("None");
    goto LABEL_19;
  }
  v4 = (a3 & 1) == 0;
  if ((a3 & 1) != 0)
  {
    objc_msgSend(&stru_251503878, "stringByAppendingString:", CFSTR("TouchIDOrWatchCurrentSet"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v5 = v7;
    if ((a3 & 2) != 0)
    {
      -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", CFSTR(","));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
LABEL_7:
    if ((a3 & 4) == 0)
      goto LABEL_15;
    if ((a3 & 1) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
  v5 = &stru_251503878;
  v6 = &stru_251503878;
  if ((a3 & 2) == 0)
    goto LABEL_7;
LABEL_11:
  -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", CFSTR("TouchIDOrWatchAny"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if ((a3 & 4) == 0)
  {
    v4 = 0;
    goto LABEL_15;
  }
LABEL_13:
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR(","));
  v8 = objc_claimAutoreleasedReturnValue();

  v5 = (__CFString *)v8;
LABEL_14:
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR("ReuseDuringUnlock"));
  v9 = objc_claimAutoreleasedReturnValue();

  v4 = 0;
  v5 = (__CFString *)v9;
LABEL_15:
  if ((a3 & 8) != 0)
  {
    if (!v4)
    {
      -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR(","));
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = (__CFString *)v10;
    }
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR("PasswordFallback"));
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v11;
  }
LABEL_19:
  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ (%@)"), v5, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)stringForLoginType:(unint64_t)a3
{
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  switch(a3)
  {
    case 0uLL:
      v3 = CFSTR("POLoginTypeNone");
      break;
    case 1uLL:
      v3 = CFSTR("POLoginTypePassword");
      break;
    case 2uLL:
      v3 = CFSTR("POLoginTypeUserSecureEnclaveKey");
      break;
    case 3uLL:
      v3 = CFSTR("POLoginTypeSmartCard");
      break;
    default:
      v4 = CFSTR("POLoginTypePlatformSSOToken");
      if (a3 != 101)
        v4 = 0;
      if (a3 == 100)
        v3 = CFSTR("POLoginTypeRefresh");
      else
        v3 = v4;
      break;
  }
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (%@)"), v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)stringForUserState:(int64_t)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;

  if ((unint64_t)a3 > 6)
    v3 = 0;
  else
    v3 = off_2515000D0[a3];
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (%@)"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)stringForLoginResult:(unint64_t)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a3 > 6)
    v3 = 0;
  else
    v3 = off_251500108[a3];
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (%@)"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)stringForKeyType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x13)
    return 0;
  else
    return off_251500140[a3 - 1];
}

+ (__CFString)algorithmForString:(id)a3
{
  id v3;
  __CFString **v4;
  __CFString *v5;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("ECIESEncryptionStandardX963SHA512AESGCM")))
  {
    v4 = (__CFString **)MEMORY[0x24BDE9308];
LABEL_5:
    v5 = *v4;
    goto LABEL_9;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("ECIESEncryptionStandardX963SHA384AESGCM")))
  {
    v4 = (__CFString **)MEMORY[0x24BDE9300];
    goto LABEL_5;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("ECIESEncryptionStandardX963SHA256AESGCM")))
    v5 = (__CFString *)*MEMORY[0x24BDE92F8];
  else
    v5 = 0;
LABEL_9:

  return v5;
}

+ (int64_t)userAuthorizationModeWithString:(id)a3
{
  id v3;
  void *v4;
  char v5;
  int64_t v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  int v12;

  v3 = a3;
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("none"));

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("standard"));

    if ((v8 & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v3, "lowercaseString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("admin"));

      if ((v10 & 1) != 0)
      {
        v6 = 2;
      }
      else
      {
        objc_msgSend(v3, "lowercaseString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("groups"));

        if (v12)
          v6 = 3;
        else
          v6 = 0;
      }
    }
  }

  return v6;
}

+ (id)stringForUserAuthorizationMode:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  else
    return off_2515001E0[a3];
}

+ (id)stringForSigningAlgorithm:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToNumber:", 0x251520F48) & 1) != 0)
  {
    v4 = CFSTR("ES256");
  }
  else if ((objc_msgSend(v3, "isEqualToNumber:", 0x251520F60) & 1) != 0)
  {
    v4 = CFSTR("ES384");
  }
  else if ((objc_msgSend(v3, "isEqualToNumber:", 0x251520F78) & 1) != 0)
  {
    v4 = CFSTR("Ed25519");
  }
  else if (v3)
  {
    v4 = CFSTR("unknown signing algorithm");
  }
  else
  {
    v4 = CFSTR("none");
  }

  return (id)v4;
}

+ (id)stringForEncryptionAlgorithm:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToNumber:", 0x251520F48) & 1) != 0)
  {
    v4 = CFSTR("ECDHE_A256GCM");
  }
  else if ((objc_msgSend(v3, "isEqualToNumber:", 0x251520F60) & 1) != 0)
  {
    v4 = CFSTR("kHPKE_P256_SHA256_AES_GCM_256");
  }
  else if ((objc_msgSend(v3, "isEqualToNumber:", 0x251520F78) & 1) != 0)
  {
    v4 = CFSTR("kHPKE_P384_SHA384_AES_GCM_256");
  }
  else if ((objc_msgSend(v3, "isEqualToNumber:", 0x251520F90) & 1) != 0)
  {
    v4 = CFSTR("kHPKE_Curve25519_SHA256_ChachaPoly");
  }
  else if (v3)
  {
    v4 = CFSTR("unknown encryption algorithm");
  }
  else
  {
    v4 = CFSTR("none");
  }

  return (id)v4;
}

+ (id)stringForLoginPolicy:(unint64_t)a3
{
  BOOL v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  if (!a3)
  {
    v5 = CFSTR("None");
    goto LABEL_24;
  }
  v4 = (a3 & 1) == 0;
  if ((a3 & 1) != 0)
  {
    objc_msgSend(&stru_251503878, "stringByAppendingString:", CFSTR("AttemptAuthentication"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v5 = v7;
    if ((a3 & 2) != 0)
    {
      -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", CFSTR(","));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
  }
  else
  {
    v5 = &stru_251503878;
    v6 = &stru_251503878;
    if ((a3 & 2) != 0)
    {
LABEL_11:
      -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", CFSTR("RequireAuthentication"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if ((a3 & 4) == 0)
      {
        v4 = 0;
LABEL_13:
        if ((a3 & 8) == 0)
          goto LABEL_14;
        goto LABEL_19;
      }
LABEL_17:
      -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR(","));
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (__CFString *)v8;
      goto LABEL_18;
    }
  }
  if ((a3 & 4) == 0)
    goto LABEL_13;
  if ((a3 & 1) != 0)
    goto LABEL_17;
LABEL_18:
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR("AllowOfflineGracePeriod"));
  v9 = objc_claimAutoreleasedReturnValue();

  v4 = 0;
  v5 = (__CFString *)v9;
  if ((a3 & 8) == 0)
  {
LABEL_14:
    if ((a3 & 0x10) != 0)
    {
      if (v4)
        goto LABEL_23;
      goto LABEL_22;
    }
    goto LABEL_24;
  }
LABEL_19:
  if (!v4)
  {
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR(","));
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v10;
  }
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR("AllowAuthenticationGracePeriod"));
  v11 = objc_claimAutoreleasedReturnValue();

  v5 = (__CFString *)v11;
  if ((a3 & 0x10) != 0)
  {
LABEL_22:
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR(","));
    v12 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v12;
LABEL_23:
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR("AllowTouchIDOrWatchForUnlock"));
    v13 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v13;
  }
LABEL_24:
  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ (%@)"), v5, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)stringForLoginPolicyState:(unint64_t)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a3 > 2)
    v3 = 0;
  else
    v3 = off_251500200[a3];
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (%@)"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
