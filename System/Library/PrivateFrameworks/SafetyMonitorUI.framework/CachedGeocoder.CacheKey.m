@implementation CachedGeocoder.CacheKey

- (int64_t)hash
{
  _TtCC15SafetyMonitorUI14CachedGeocoder8CacheKey *v2;
  int64_t v3;

  v2 = self;
  v3 = CachedGeocoder.CacheKey.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtCC15SafetyMonitorUI14CachedGeocoder8CacheKey *v4;
  _TtCC15SafetyMonitorUI14CachedGeocoder8CacheKey *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2456FABAC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = CachedGeocoder.CacheKey.isEqual(_:)((uint64_t)v8);

  sub_2455C6BC0((uint64_t)v8, &qword_25748A4A0);
  return v6;
}

- (_TtCC15SafetyMonitorUI14CachedGeocoder8CacheKey)init
{
  _TtCC15SafetyMonitorUI14CachedGeocoder8CacheKey *result;

  result = (_TtCC15SafetyMonitorUI14CachedGeocoder8CacheKey *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
