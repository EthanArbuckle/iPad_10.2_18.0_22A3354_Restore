@implementation UGCErrorStringBuilder

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
      v4 = CFSTR("UGC [General Error]");
      goto LABEL_19;
    case 1:
      v5 = MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0);
      switch(v5)
      {
        case 3:
          v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v3 = v2;
          v4 = CFSTR("Error_AirplaneMode_iPad [UGC]");
          break;
        case 2:
          v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v3 = v2;
          v4 = CFSTR("Error_AirplaneMode_iPod [UGC]");
          break;
        case 1:
          v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v3 = v2;
          v4 = CFSTR("Error_AirplaneMode_iPhone [UGC]");
          break;
        default:
          v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v3 = v2;
          v4 = CFSTR("Error_AirplaneMode_Device [UGC]");
          break;
      }
      goto LABEL_19;
    case 2:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = v2;
      v4 = CFSTR("Enable Cellular Data [UGC]");
      goto LABEL_19;
    case 3:
      v6 = MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0);
      switch(v6)
      {
        case 3:
          v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v3 = v2;
          v4 = CFSTR("Error_NoNetworkConnection_iPad [UGC]");
          break;
        case 2:
          v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v3 = v2;
          v4 = CFSTR("Error_NoNetworkConnection_iPod [UGC]");
          break;
        case 1:
          v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v3 = v2;
          v4 = CFSTR("Error_NoNetworkConnection_iPhone [UGC]");
          break;
        default:
          v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v3 = v2;
          v4 = CFSTR("Error_NoNetworkConnection_Device [UGC]");
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

+ (id)buildFailToSubmitErrorTitle
{
  unint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = MKCurrentNetworkConnectionFailureDiagnosis(a1, a2) - 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2 >= 3)
    v5 = CFSTR("Submission Generic Failure Title [UGC]");
  else
    v5 = CFSTR("Submission Internet Failure Title [UGC]");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

  return v6;
}

+ (id)buildFailToSubmitErrorDescription
{
  unint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = MKCurrentNetworkConnectionFailureDiagnosis(a1, a2) - 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2 >= 3)
    v5 = CFSTR("Submission Generic Failure Description [UGC]");
  else
    v5 = CFSTR("Submission Internet Failure Description [UGC]");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

  return v6;
}

@end
