@implementation TransitPreferencesText

+ (id)headerTextForDisabledModes
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Prefer Trips Using"), CFSTR("localized string not found"), 0));

  return v3;
}

+ (id)footerTextForDisabledModes
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Prefer these vehicles when planning transit trips."), CFSTR("localized string not found"), 0));

  return v3;
}

+ (id)cellTextForICFares
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Transit Filter Picker, Fares] Transit Card Fares"), CFSTR("localized string not found"), 0));

  return v3;
}

+ (id)footerTextForICFares
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Transit Filter Picker, Fares] Transit Card Fares Footer"), CFSTR("localized string not found"), 0));

  return v3;
}

@end
