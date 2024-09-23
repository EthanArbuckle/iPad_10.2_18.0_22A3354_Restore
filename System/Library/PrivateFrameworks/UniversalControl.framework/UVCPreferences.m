@implementation UVCPreferences

+ (UVCPreferences)sharedPreferences
{
  return (UVCPreferences *)static UniversalControlPreferences.shared.getter();
}

- (UVCPreferences)init
{
  return (UVCPreferences *)sub_24976DB70();
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = _sSo18UVCClientAssertiona16UniversalControlE11descriptionSSvg_0();
  v5 = v4;
  swift_getObjCClassMetadata();
  v6 = static UniversalControlPreferences.automaticallyNotifiesObservers(forKey:)(v3, v5);
  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (BOOL)automation
{
  UVCPreferences *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = UniversalControlPreferences.automation.getter();

  return v3 & 1;
}

- (void)setAutomation:(BOOL)a3
{
  UVCPreferences *v4;

  v4 = self;
  UniversalControlPreferences.automation.setter(a3);

}

- (BOOL)enabled
{
  UVCPreferences *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = UniversalControlPreferences.enabled.getter();

  return v3 & 1;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  UVCPreferences *v4;

  v3 = a3;
  v4 = self;
  UniversalControlPreferences.enabled.setter(v3);

}

- (BOOL)magicEdgesEnabled
{
  UVCPreferences *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = UniversalControlPreferences.magicEdgesEnabled.getter();

  return v3 & 1;
}

- (void)setMagicEdgesEnabled:(BOOL)a3
{
  _BOOL8 v3;
  UVCPreferences *v4;

  v3 = a3;
  v4 = self;
  UniversalControlPreferences.magicEdgesEnabled.setter(v3);

}

- (BOOL)isSupported
{
  UVCPreferences *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = UniversalControlPreferences.isSupported.getter();

  return v3 & 1;
}

- (BOOL)isBeta
{
  UVCPreferences *v2;
  char v3;

  v2 = self;
  v3 = UniversalControlPreferences.isBeta.getter();

  return v3 & 1;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  sub_24974C100(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___UVCPreferences_sink));
}

- (UVCPreferencesTestability)testabilityProxy
{
  return (UVCPreferencesTestability *)(id)sub_24976ECA8();
}

- (void)setTestabilityProxy:(id)a3
{
  UVCPreferences *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_24976ED04((uint64_t)a3);

}

- (void)testabilityProxyDidChange
{
  UVCPreferences *v2;

  v2 = self;
  sub_24976ED7C();

}

@end
