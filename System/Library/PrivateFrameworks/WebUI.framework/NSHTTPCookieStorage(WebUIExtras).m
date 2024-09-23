@implementation NSHTTPCookieStorage(WebUIExtras)

- (void)webui_applySafariCookieAcceptPolicy
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(a1, "webui_safariCookieAcceptPolicy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  if (v2 && (objc_msgSend(v2, "isEqualToString:", CFSTR("only from main document domain")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("always")) & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("never")))
        goto LABEL_5;
      v3 = 1;
    }
  }
  else
  {
    v3 = 2;
  }
  objc_msgSend(a1, "setCookieAcceptPolicy:", v3);
LABEL_5:

}

- (const)webui_safariCookieAcceptPolicy
{
  float v1;
  const __CFString *v2;
  const __CFString *v3;

  objc_msgSend(a1, "_safariCookieAcceptPolicyFloatValue");
  v2 = CFSTR("only from main document domain");
  v3 = CFSTR("never");
  if (v1 == 1.0)
    v3 = CFSTR("only from main document domain");
  if (v1 != 1.5)
    v2 = v3;
  if (v1 == 2.0)
    return CFSTR("always");
  else
    return v2;
}

- (BOOL)webui_trackerProtectionEnabled
{
  return objc_msgSend(a1, "webui_safariCookieAcceptPolicyEnumValue") != 0;
}

- (uint64_t)webui_safariCookieAcceptPolicyEnumValue
{
  float v1;
  uint64_t v3;

  objc_msgSend(a1, "_safariCookieAcceptPolicyFloatValue");
  if (v1 == 2.0)
    return 0;
  v3 = 2;
  if (v1 != 1.0)
    v3 = 1;
  if (v1 == 1.5)
    return 2;
  else
    return v3;
}

- (float)_safariCookieAcceptPolicyFloatValue
{
  void *v0;
  void *v1;
  void *v2;
  float v3;
  float v4;
  NSObject *v5;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "effectiveValueForSetting:", *MEMORY[0x24BE63A80]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "floatValue");
    v4 = v3;
  }
  else
  {
    v5 = WBS_LOG_CHANNEL_PREFIXCookiePolicy();
    v4 = 1.5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[NSHTTPCookieStorage(WebUIExtras) _safariCookieAcceptPolicyFloatValue].cold.1(v5);
  }

  return v4;
}

- (void)_safariCookieAcceptPolicyFloatValue
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2112D6000, log, OS_LOG_TYPE_ERROR, "Profile connection had no effective value for safariAcceptCookies setting; using default cookie accept policy",
    v1,
    2u);
}

@end
