@implementation SFAirDropUserDefaults_objc

+ (BOOL)moveToAppEnabled
{
  void *v2;
  char v3;

  +[SFAirDropUserDefaults shared](SFAirDropUserDefaults, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "objcMoveToAppEnabled");

  return v3;
}

+ (BOOL)systemLevelProgressEnabled
{
  void *v2;
  char v3;

  +[SFAirDropUserDefaults shared](SFAirDropUserDefaults, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "objcSystemLevelProgressEnabled");

  return v3;
}

+ (BOOL)privateContactDiscoveryEnabled
{
  void *v2;
  char v3;

  +[SFAirDropUserDefaults shared](SFAirDropUserDefaults, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "objcPrivateContactDiscoveryEnabled");

  return v3;
}

+ (BOOL)askToAirdropEnabled
{
  void *v2;
  char v3;

  +[SFAirDropUserDefaults shared](SFAirDropUserDefaults, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "objcAskToAirDropEnabled");

  return v3;
}

+ (BOOL)nearFieldSharingEnabled
{
  void *v2;
  char v3;

  +[SFAirDropUserDefaults shared](SFAirDropUserDefaults, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "objcNearFieldSharingEnabled");

  return v3;
}

+ (void)setNearFieldSharingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[SFAirDropUserDefaults shared](SFAirDropUserDefaults, "shared");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObjcNearFieldSharingEnabled:", v3);

}

+ (BOOL)cellularUsageEnabled
{
  void *v2;
  char v3;

  +[SFAirDropUserDefaults shared](SFAirDropUserDefaults, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "objcCellularUsageEnabled");

  return v3;
}

+ (void)setCellularUsageEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[SFAirDropUserDefaults shared](SFAirDropUserDefaults, "shared");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObjcCellularUsageEnabled:", v3);

}

@end
