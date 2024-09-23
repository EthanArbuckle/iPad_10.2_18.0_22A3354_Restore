@implementation _PKProvisioningSEStorageSnapshot

- (BOOL)canFitWithAppletTypes:(id)a3
{
  return sub_18FE07F78(self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x1E0D89528]);
}

- (BOOL)addToSnapshotWithAppletTypes:(id)a3
{
  return sub_18FE07F78(self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x1E0D894B0]);
}

- (void)removeFromSnapshotWithAppletTypes:(id)a3
{
  uint64_t v4;
  _PKProvisioningSEStorageSnapshot *v5;

  v4 = sub_1903D0784();
  v5 = self;
  sub_18FE0801C(v4);

  swift_bridgeObjectRelease();
}

- (void)reset
{
  _PKProvisioningSEStorageSnapshot *v2;

  v2 = self;
  sub_1903D0430();

}

- (id)appletTypesForAppletIDs:(id)a3
{
  uint64_t v4;
  _PKProvisioningSEStorageSnapshot *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v4 = sub_1903D0784();
  v5 = self;
  v6 = sub_18FE097E0(v4);
  v7 = *(_QWORD *)(v4 + 16);
  if (v7 != v6[2])
  {
    swift_bridgeObjectRelease();
    sub_18FE1D840(0xD000000000000011, 0x8000000190457790, v7);
  }

  swift_bridgeObjectRelease();
  v8 = (void *)sub_1903D0778();
  swift_bridgeObjectRelease();
  return v8;
}

- (int64_t)totalUsageOfAppletType:(id)a3
{
  return sub_18FE08834(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_18FE086C4);
}

- (int64_t)usageOfAppletType:(id)a3
{
  return sub_18FE08834(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_18FE086DC);
}

- (int64_t)totalStorage
{
  _PKProvisioningSEStorageSnapshot *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_1903D0400();
  v4 = v3;

  return v4;
}

- (int64_t)totalUsage
{
  _PKProvisioningSEStorageSnapshot *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1903D0400();

  return v3;
}

- (int64_t)requiredStorageForAppletTypes:(id)a3
{
  uint64_t v4;
  _PKProvisioningSEStorageSnapshot *v5;
  int64_t v6;

  v4 = sub_1903D0784();
  v5 = self;
  v6 = sub_18FE08A04(v4);

  swift_bridgeObjectRelease();
  return v6;
}

+ (id)purpleTrustAirHomeAppletType
{
  return (id)sub_1903D05A4();
}

+ (id)purpleTrustAirAccessAppletType
{
  return (id)sub_1903D05A4();
}

+ (id)purpleTrustAirAliroAppletType
{
  return (id)sub_1903D05A4();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _PKProvisioningSEStorageSnapshot *v6;
  id v7;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____PKProvisioningSEStorageSnapshot_snapshot);
  v5 = a3;
  v6 = self;
  v7 = (id)sub_1903D05A4();
  objc_msgSend(v5, sel_encodeObject_forKey_, v4, v7);

}

- (_PKProvisioningSEStorageSnapshot)initWithCoder:(id)a3
{
  return (_PKProvisioningSEStorageSnapshot *)ProvisioningSEStorageSnapshot.init(coder:)(a3);
}

- (_PKProvisioningSEStorageSnapshot)init
{
  _PKProvisioningSEStorageSnapshot *result;

  result = (_PKProvisioningSEStorageSnapshot *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
