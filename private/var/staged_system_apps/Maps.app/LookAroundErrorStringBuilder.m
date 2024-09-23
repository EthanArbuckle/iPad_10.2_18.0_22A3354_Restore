@implementation LookAroundErrorStringBuilder

+ (id)buildBestErrorStringForCurrentNetworkState
{
  void *v2;
  void *v3;
  const __CFString *v4;
  int v5;
  int v6;
  __CFString *v7;

  switch(MKCurrentNetworkConnectionFailureDiagnosis(a1, a2))
  {
    case 0:
    case 4:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = v2;
      v4 = CFSTR("LookAround PIP [General Error]");
      goto LABEL_19;
    case 1:
      v5 = MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0);
      switch(v5)
      {
        case 3:
          v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v3 = v2;
          v4 = CFSTR("Error_AirplaneMode_iPad [LookAround]");
          break;
        case 2:
          v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v3 = v2;
          v4 = CFSTR("Error_AirplaneMode_iPod [LookAround]");
          break;
        case 1:
          v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v3 = v2;
          v4 = CFSTR("Error_AirplaneMode_iPhone [LookAround]");
          break;
        default:
          v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v3 = v2;
          v4 = CFSTR("Error_AirplaneMode_Device [LookAround]");
          break;
      }
      goto LABEL_19;
    case 2:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = v2;
      v4 = CFSTR("Enable Cellular Data [LookAround]");
      goto LABEL_19;
    case 3:
      v6 = MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0);
      switch(v6)
      {
        case 3:
          v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v3 = v2;
          v4 = CFSTR("Error_NoNetworkConnection_iPad [LookAround]");
          break;
        case 2:
          v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v3 = v2;
          v4 = CFSTR("Error_NoNetworkConnection_iPod [LookAround]");
          break;
        case 1:
          v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v3 = v2;
          v4 = CFSTR("Error_NoNetworkConnection_iPhone [LookAround]");
          break;
        default:
          v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v3 = v2;
          v4 = CFSTR("Error_NoNetworkConnection_Device [LookAround]");
          break;
      }
LABEL_19:
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", v4, CFSTR("localized string not found"), 0));

      break;
    default:
      v7 = &stru_1011EB268;
      break;
  }
  return v7;
}

@end
