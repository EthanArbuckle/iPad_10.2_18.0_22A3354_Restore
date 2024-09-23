@implementation SFAirDropUserDefaults

+ (SFAirDropUserDefaults)shared
{
  id v3;

  if (qword_1EE676418 != -1)
    swift_once();
  sub_1A2AE4120();
  return (SFAirDropUserDefaults *)v3;
}

- (BOOL)objcPrivateContactDiscoveryEnabled
{
  SFAirDropUserDefaults *v2;
  char v3;

  v2 = self;
  v3 = SFAirDropUserDefaults.privateContactDiscoveryEnabled.getter();

  return v3 & 1;
}

- (BOOL)objcSystemLevelProgressEnabled
{
  SFAirDropUserDefaults *v2;
  char v3;

  v2 = self;
  v3 = SFAirDropUserDefaults.systemLevelProgressEnabled.getter();

  return v3 & 1;
}

- (BOOL)objcMoveToAppEnabled
{
  SFAirDropUserDefaults *v2;
  char v3;

  v2 = self;
  v3 = SFAirDropUserDefaults.moveToAppEnabled.getter();

  return v3 & 1;
}

- (BOOL)objcAskToAirDropEnabled
{
  return sub_1A2A9E250(self);
}

- (BOOL)objcNearFieldSharingEnabled
{
  return sub_1A2A9E250(self);
}

- (void)setObjcNearFieldSharingEnabled:(BOOL)a3
{
  SFAirDropUserDefaults *v4;

  v4 = self;
  SFAirDropUserDefaults.objcNearFieldSharingEnabled.setter(a3);

}

- (BOOL)objcCellularUsageEnabled
{
  return sub_1A2A9E250(self);
}

- (void)setObjcCellularUsageEnabled:(BOOL)a3
{
  SFAirDropUserDefaults *v4;

  v4 = self;
  SFAirDropUserDefaults.objcCellularUsageEnabled.setter(a3);

}

- (SFAirDropUserDefaults)init
{
  return (SFAirDropUserDefaults *)SFAirDropUserDefaults.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (NSString)description
{
  void *v2;

  _s7Sharing21SFAirDropUserDefaultsC11descriptionSSvg_0();
  v2 = (void *)sub_1A2AE340C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

@end
