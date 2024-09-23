@implementation RDFeatureFlagsObjCWrapper

- (RDFeatureFlagsObjCWrapper)initWithRawValue:(id)a3
{
  id v5;
  RDFeatureFlagsObjCWrapper *v6;
  RDFeatureFlagsObjCWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RDFeatureFlagsObjCWrapper;
  v6 = -[RDFeatureFlagsObjCWrapper init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rawValue, a3);

  return v7;
}

- (NSString)rawValue
{
  return self->_rawValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawValue, 0);
}

+ (id)wrappedFeatureFlagsWithRawValue:(id)a3
{
  uint64_t v3;
  unint64_t v4;
  id v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = _sSo25RDFeatureFlagsObjCWrapperC7reminddE014wrappedFeatureB04withSo010REMFeaturebC9CWrapping_pSgSS_tFZ_0(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)temporaryOverrideWithEnabledFeatureFlags:(id)a3 disabledFeatureFlags:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = sub_10001A630(&qword_10084FB30);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v6);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v6);
  _sSo25RDFeatureFlagsObjCWrapperC7reminddE17temporaryOverride018withEnabledFeatureB008disabledjB0So010REMFeatureb9TemporaryG12ObjcWrapping_pSaySo0lbC9CWrapping_pG_AItFZ_0(v7, v8);
  v10 = v9;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

- (BOOL)isEnabled
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  RDFeatureFlagsObjCWrapper *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v12;

  v3 = sub_10001A630(&qword_10084FA98);
  __chkstk_darwin(v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_10056B110((uint64_t)v5);
  v7 = type metadata accessor for REMFeatureFlags(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7);
  if ((_DWORD)v9 == 1)
  {
    sub_10056C050((uint64_t)v5);
    v10 = 0;
  }
  else
  {
    v10 = REMFeatureFlags.isEnabled.getter(v9);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return v10 & 1;
}

@end
