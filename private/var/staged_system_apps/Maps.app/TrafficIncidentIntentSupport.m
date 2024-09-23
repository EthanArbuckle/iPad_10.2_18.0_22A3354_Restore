@implementation TrafficIncidentIntentSupport

+ (int)incidentTypeForINTrafficIncidentType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return 0;
  else
    return dword_100E39408[a3 - 1];
}

+ (int64_t)INTrafficIncidentTypeForincidentType:(int)a3
{
  if (a3 > 6)
  {
    if (a3 != 7)
    {
      if (a3 == 16)
        return 3;
      return 0;
    }
    return 5;
  }
  else
  {
    if (a3 != 5)
    {
      if (a3 == 6)
        return 2;
      return 0;
    }
    return 1;
  }
}

+ (id)localizedTitleForIncidentType:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 1:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Crash [Report Incident]");
      break;
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Hazard [Report Incident]");
      break;
    case 3:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Speed Check [Nav Tray, Report Incident]");
      break;
    case 4:
    case 5:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Roadwork [Report Incident]");
      break;
    default:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Incident [Report Incident]");
      break;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

  return v6;
}

@end
