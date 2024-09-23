@implementation ICQAppLaunchLinkTracker

+ (int64_t)neverShown
{
  return -1;
}

+ (ICQAppLaunchLinkTracker)shared
{
  if (qword_1ED2B9C98 != -1)
    swift_once();
  return (ICQAppLaunchLinkTracker *)(id)qword_1ED2B9C90;
}

- (id)lastShownDateForBundleID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  ICQAppLaunchLinkTracker *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5ADB0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1CDF32D24();
  v9 = v8;
  v10 = self;
  sub_1CDF2786C(v7, v9, (uint64_t)v6);

  swift_bridgeObjectRelease();
  v11 = sub_1CDF32A78();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v11) != 1)
  {
    v13 = (void *)sub_1CDF32A3C();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v11);
  }
  return v13;
}

- (int64_t)daysSinceLastShownForBundleID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  ICQAppLaunchLinkTracker *v7;
  int64_t v8;

  v4 = sub_1CDF32D24();
  v6 = v5;
  v7 = self;
  v8 = sub_1CDF27E80(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)allDaysSinceLastShown
{
  ICQAppLaunchLinkTracker *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1CDF284B8();

  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFA5B0A0);
    v4 = (void *)sub_1CDF32D6C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)osUpgradeSinceLastShownForBundleID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  ICQAppLaunchLinkTracker *v7;

  v4 = sub_1CDF32D24();
  v6 = v5;
  v7 = self;
  LOBYTE(v4) = sub_1CDF28ECC(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (void)setLastShownDate:(id)a3 forBundleID:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  ICQAppLaunchLinkTracker *v12;
  uint64_t v13;

  v5 = sub_1CDF32A78();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CDF32A54();
  v9 = sub_1CDF32D24();
  v11 = v10;
  v12 = self;
  sub_1CDF2926C((uint64_t)v8, v9, v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (ICQAppLaunchLinkTracker)init
{
  ICQAppLaunchLinkTracker *result;

  result = (ICQAppLaunchLinkTracker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
