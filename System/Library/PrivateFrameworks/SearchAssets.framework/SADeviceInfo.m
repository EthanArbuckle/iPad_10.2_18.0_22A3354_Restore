@implementation SADeviceInfo

- (id)systemLocale
{
  return sub_2459CA8FC(self, (uint64_t)a2, (void (*)(void))sub_2459CA7EC);
}

- (id)currentCountry
{
  return sub_2459CA8FC(self, (uint64_t)a2, sub_2459CA8B0);
}

- (id)build
{
  return sub_2459CA960(self, (uint64_t)a2, (void *)0x726556646C697542, 0xEC0000006E6F6973);
}

- (id)osType
{
  return sub_2459CA960(self, (uint64_t)a2, (void *)0x4E746375646F7250, 0xEB00000000656D61);
}

- (id)productType
{
  return sub_2459CA960(self, (uint64_t)a2, (void *)0x54746375646F7250, 0xEB00000000657079);
}

- (int)buildType
{
  SADeviceInfo *v2;
  int v3;

  v2 = self;
  v3 = sub_2459CAA70();

  return v3;
}

- (id)prefixStoreVersion
{
  SADeviceInfo *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_2459CAAF0();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_2459D971C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)trialExperiment
{
  void *v2;

  type metadata accessor for SATrialExperiment((uint64_t)self);
  v2 = (void *)sub_2459D9830();
  swift_bridgeObjectRelease();
  return v2;
}

- (SADeviceInfo)init
{
  return (SADeviceInfo *)SADeviceInfo.init()();
}

@end
