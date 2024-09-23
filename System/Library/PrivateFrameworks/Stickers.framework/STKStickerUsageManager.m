@implementation STKStickerUsageManager

- (STKStickerUsageManager)init
{
  return (STKStickerUsageManager *)sub_247A17058();
}

+ (STKStickerUsageManager)sharedManager
{
  if (qword_254450450 != -1)
    swift_once();
  return (STKStickerUsageManager *)(id)qword_254450448;
}

- (void)logStickerWithStickerIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  STKStickerUsageManager *v11;

  v5 = sub_247A1AEE4();
  v7 = v6;
  v8 = sub_247A1AEE4();
  v10 = v9;
  v11 = self;
  sub_247A177C0(v5, v7, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (unint64_t)stickerCountsForBundleIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  STKStickerUsageManager *v7;
  unint64_t v8;

  v4 = sub_247A1AEE4();
  v6 = v5;
  v7 = self;
  v8 = sub_247A17CAC(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR___STKStickerUsageManager_dictionary;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254450480);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___STKStickerUsageManager_serializationLocation;
  v6 = sub_247A1AB9C();
  v7 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR___STKStickerUsageManager_serializationContextLocation, v6);
}

@end
