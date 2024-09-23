@implementation PXUserPromptCoordinator

+ (void)schedulePromptWithIdentifier:(id)a3 action:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[8];

  v4 = _Block_copy(a4);
  v5 = sub_1A7AE3764();
  v7 = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v4;
  sub_1A7AE3B9C();
  v9[2] = v5;
  v9[3] = v7;
  v9[4] = sub_1A6A1BDDC;
  v9[5] = v8;
  sub_1A69C9194((void (*)(void))sub_1A6A1C2F4, (uint64_t)v9);
  swift_bridgeObjectRelease();
  swift_release();
}

- (PXUserPromptCoordinator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXUserPromptCoordinator;
  return -[PXUserPromptCoordinator init](&v3, sel_init);
}

@end
