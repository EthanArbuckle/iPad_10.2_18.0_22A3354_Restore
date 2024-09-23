@implementation TUCloudCallingDevice(TelephonyPreferences)

- (const)tps_modelName
{
  void *v1;
  const __CFString *v2;

  objc_msgSend(a1, "modelIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "rangeOfString:", CFSTR("iPod")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = CFSTR("iPad");
    if (objc_msgSend(v1, "rangeOfString:", CFSTR("iPad")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v2 = CFSTR("iPhone");
      if (objc_msgSend(v1, "rangeOfString:", CFSTR("iPhone")) == 0x7FFFFFFFFFFFFFFFLL)
      {
        v2 = CFSTR("Mac");
        if (objc_msgSend(v1, "rangeOfString:", CFSTR("Mac")) == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (objc_msgSend(v1, "rangeOfString:", CFSTR("AppleTV")) == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (objc_msgSend(v1, "rangeOfString:", CFSTR("Watch")) == 0x7FFFFFFFFFFFFFFFLL)
            {
              if (objc_msgSend(v1, "rangeOfString:", CFSTR("AudioAccessory")) != 0x7FFFFFFFFFFFFFFFLL)
                v2 = CFSTR("HomePod");
            }
            else
            {
              v2 = CFSTR("Apple Watch");
            }
          }
          else
          {
            v2 = CFSTR("Apple TV");
          }
        }
      }
    }
  }
  else
  {
    v2 = CFSTR("iPod touch");
  }

  return v2;
}

@end
