@implementation ASKCellularDataInquiry

- (ASKCellularDataInquiry)initWithBundle:(id)a3
{
  id v5;
  ASKCellularDataInquiry *v6;
  ASKCellularDataInquiry *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASKCellularDataInquiry;
  v6 = -[ASKCellularDataInquiry init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bundle, a3);

  return v7;
}

- (ASKCellularDataInquiry)init
{
  void *v3;
  ASKCellularDataInquiry *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = -[ASKCellularDataInquiry initWithBundle:](self, "initWithBundle:", v3);

  return v4;
}

+ (NSURL)settingsURL
{
  return (NSURL *)+[PSCellularDataSettingsDetail preferencesURL](PSCellularDataSettingsDetail, "preferencesURL");
}

- (BOOL)isSupported
{
  return MGGetBoolAnswer(CFSTR("cellular-data"), a2);
}

- (BOOL)isEnabledForDevice
{
  unsigned int v2;

  v2 = -[ASKCellularDataInquiry isSupported](self, "isSupported");
  if (v2)
    LOBYTE(v2) = +[PSCellularDataSettingsDetail isEnabled](PSCellularDataSettingsDetail, "isEnabled");
  return v2;
}

- (BOOL)isEnabledForBundle
{
  _BOOL4 v3;
  uint64_t v4;
  const void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  const __CFBoolean *Value;
  CFDictionaryRef theDict;

  v3 = -[ASKCellularDataInquiry isEnabledForDevice](self, "isEnabledForDevice");
  if (v3)
  {
    theDict = 0;
    v4 = _CTServerConnectionCreateOnTargetQueue(kCFAllocatorDefault, 0, &_dispatch_main_q, 0);
    if (!v4)
    {
LABEL_5:
      LOBYTE(v3) = 1;
      return v3;
    }
    v5 = (const void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASKCellularDataInquiry bundle](self, "bundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));

    v8 = _CTServerConnectionCopyCellularUsagePolicy(v5, v7, &theDict);
    CFRelease(v5);
    if ((_DWORD)v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not determine cellular usage policy, reason: CTError(domain: %d, error: %d)"), v8, HIDWORD(v8)));
      ASKLog(v9, OS_LOG_TYPE_ERROR);

      goto LABEL_5;
    }

    if (!theDict)
      goto LABEL_5;
    Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, kCTCellularDataUsagePolicy);
    CFRelease(theDict);
    if (!Value)
      goto LABEL_5;
    LOBYTE(v3) = CFBooleanGetValue(Value) != 0;
  }
  return v3;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
