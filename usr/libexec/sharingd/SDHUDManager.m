@implementation SDHUDManager

+ (SDHUDManager)shared
{
  if (qword_1007B3FB0 != -1)
    swift_once(&qword_1007B3FB0, sub_10037C2E8);
  return (SDHUDManager *)(id)qword_1007D8408;
}

- (SDHUDManager)init
{
  return (SDHUDManager *)sub_10037C488();
}

- (void)start
{
  SDHUDManager *v2;

  v2 = self;
  sub_10037D60C((uint64_t)&unk_100724FD8, (uint64_t)sub_1003806B4, (uint64_t)&unk_100724FF0);

}

- (void)postPairedUnlockBannerFor:(id)a3 needsLockButton:(BOOL)a4 needsUpdate:(BOOL)a5
{
  uint64_t v8;
  const char *v9;
  const char *v10;
  SDHUDManager *v11;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  v11 = self;
  sub_10037C87C(v8, v10, a4, a5);

  swift_bridgeObjectRelease(v10);
}

- (void)updatePairedUnlockBannerToUnlocked
{
  SDHUDManager *v2;

  v2 = self;
  sub_10037D60C((uint64_t)&unk_100724F38, (uint64_t)sub_10038066C, (uint64_t)&unk_100724F50);

}

- (void)dismissPairedUnlockBanner
{
  SDHUDManager *v2;

  v2 = self;
  sub_10037D60C((uint64_t)&unk_100724EE8, (uint64_t)sub_100380664, (uint64_t)&unk_100724F00);

}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___SDHUDManager_requests));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  SDHUDManager *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10037FD48(v7);

  return v9 & 1;
}

- (void)currentBannerRequestWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  SDHUDManager *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_100724D80, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_10037EDC0((uint64_t)sub_1003805C8, v5);

  swift_release(v5);
}

- (void)bannerDidDismissWithType:(int64_t)a3
{
  SDHUDManager *v4;

  v4 = self;
  sub_10037F618(a3);

}

- (void)bannerButtonTappedWithType:(int64_t)a3
{
  sub_100380018(a3);
}

@end
