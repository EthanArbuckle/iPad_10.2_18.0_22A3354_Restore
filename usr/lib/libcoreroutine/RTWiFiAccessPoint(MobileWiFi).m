@implementation RTWiFiAccessPoint(MobileWiFi)

- (id)initWithWiFiNetwork:()MobileWiFi
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  void *v12;

  if (a3)
  {
    WiFiNetworkGetProperty();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v4 = 0;
    }
    WiFiNetworkGetProperty();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!v5)
      {
        v6 = 0x8000000000000000;
LABEL_11:
        WiFiNetworkGetProperty();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v8)
          {
            v9 = 0x8000000000000000;
LABEL_17:
            WiFiNetworkGetProperty();
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (!v10)
              {
                v11 = INFINITY;
                goto LABEL_23;
              }
              v11 = (double)objc_msgSend(v10, "integerValue") / 1000.0;
            }
            else
            {
              v11 = INFINITY;
            }

LABEL_23:
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            a1 = (id)objc_msgSend(a1, "initWithMac:rssi:channel:age:date:", v4, v6, v9, v12, v11);

            v7 = a1;
            goto LABEL_24;
          }
          v9 = objc_msgSend(v8, "integerValue");
        }
        else
        {
          v9 = 0x8000000000000000;
        }

        goto LABEL_17;
      }
      v6 = objc_msgSend(v5, "integerValue");
    }
    else
    {
      v6 = 0x8000000000000000;
    }

    goto LABEL_11;
  }
  v7 = 0;
LABEL_24:

  return v7;
}

@end
