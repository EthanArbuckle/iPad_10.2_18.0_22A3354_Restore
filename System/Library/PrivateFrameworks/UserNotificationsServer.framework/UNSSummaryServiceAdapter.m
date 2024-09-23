@implementation UNSSummaryServiceAdapter

- (UNSSummaryServiceAdapter)init
{
  return (UNSSummaryServiceAdapter *)UNSSummaryServiceAdapter.init()();
}

- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4
{
  sub_216DF984C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t, uint64_t))UNSSummaryServiceAdapter.add(_:forBundleIdentifier:));
}

- (void)removeObserver:(id)a3 forBundleIdentifier:(id)a4
{
  sub_216DF984C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t, uint64_t))UNSSummaryServiceAdapter.remove(_:forBundleIdentifier:));
}

- (id)groupSummariesForNotificationIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  UNSSummaryServiceAdapter *v5;
  void *v7;

  sub_216E02F88();
  sub_216E02F88();
  v5 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E784C0);
  sub_216E03084();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
