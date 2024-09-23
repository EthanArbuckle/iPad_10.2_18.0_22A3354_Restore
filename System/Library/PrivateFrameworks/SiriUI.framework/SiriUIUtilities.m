@implementation SiriUIUtilities

+ (id)stringForSiriUIBackgroundBlurReason:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return CFSTR("SiriUIBackgroundBlurReasonForceDismissal");
  else
    return off_24D7D9DD0[a3 - 1];
}

+ (id)stringForDeviceType
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)deviceSpecificKeyForDefaultKey:(id)a3
{
  id v3;
  void *v4;
  const __CFString *v5;
  id v6;
  void *v7;

  v3 = a3;
  +[SiriUIUtilities stringForDeviceType](SiriUIUtilities, "stringForDeviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsString:", CFSTR("iPhone")))
  {
    v5 = CFSTR("_IPHONE");
  }
  else if (objc_msgSend(v4, "containsString:", CFSTR("iPad")))
  {
    v5 = CFSTR("_IPAD");
  }
  else
  {
    if (!objc_msgSend(v4, "containsString:", CFSTR("iPod")))
    {
      v6 = v3;
      goto LABEL_8;
    }
    v5 = CFSTR("_IPOD");
  }
  objc_msgSend(v3, "stringByAppendingString:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v7 = v6;

  return v7;
}

+ (BOOL)string:(id)a3 isSameAsUserUtterance:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a1, "_normalizeTextString:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bestTextInterpretation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_normalizeTextString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v7, "localizedStandardCompare:", v9) == 0;

  return (char)v6;
}

+ (id)_normalizeTextString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("“"), CFSTR("\"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)defaultBrowserBundleIdentifier
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
  v2 = (void *)getSearchUIDefaultBrowserAppIconImageClass_softClass;
  v9 = getSearchUIDefaultBrowserAppIconImageClass_softClass;
  if (!getSearchUIDefaultBrowserAppIconImageClass_softClass)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getSearchUIDefaultBrowserAppIconImageClass_block_invoke;
    v5[3] = &unk_24D7D9460;
    v5[4] = &v6;
    __getSearchUIDefaultBrowserAppIconImageClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v3, "defaultBrowserBundleIdentifier");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)shouldShowHeaderForDirectActionEvent:(int64_t)a3
{
  return ((unint64_t)a3 < 0x12) & (0x3803Eu >> a3);
}

+ (id)descriptionForDialog:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BEA8690], "descriptionForDialog:", a3);
}

+ (id)descriptionForAceView:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BEA8690], "descriptionForAceView:", a3);
}

+ (id)descriptionForSayIt:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BEA8690], "descriptionForSayIt:", a3);
}

+ (BOOL)string:(id)a3 equalToString:(id)a4
{
  return objc_msgSend(MEMORY[0x24BEA8690], "string:equalToString:", a3, a4);
}

@end
