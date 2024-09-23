@implementation SFRemoteHotspotDevice(WiFiKit)

- (__CFString)cellularProtocolString
{
  int v1;
  __CFString *v2;
  uint64_t v3;
  void *v4;

  v1 = objc_msgSend(a1, "networkType");
  v2 = CFSTR("1x");
  switch(v1)
  {
    case 0:
      v2 = (__CFString *)wifikitBundle;
      if (wifikitBundle
        || (objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/WiFiKit.framework")), v3 = objc_claimAutoreleasedReturnValue(), v4 = (void *)wifikitBundle, wifikitBundle = v3, v4, (v2 = (__CFString *)wifikitBundle) != 0))
      {
        -[__CFString localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("kWFLocNoServiceHotspotTitle"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
        v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
    case 1:
      return v2;
    case 2:
      v2 = CFSTR("GPRS");
      break;
    case 3:
      v2 = CFSTR("EDGE");
      break;
    case 4:
      v2 = CFSTR("3G");
      break;
    case 6:
      v2 = CFSTR("4G");
      break;
    case 8:
      v2 = CFSTR("5G");
      break;
    default:
      v2 = CFSTR("LTE");
      break;
  }
  return v2;
}

@end
