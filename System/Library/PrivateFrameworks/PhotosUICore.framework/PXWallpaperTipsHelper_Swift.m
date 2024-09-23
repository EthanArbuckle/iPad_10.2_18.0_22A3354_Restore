@implementation PXWallpaperTipsHelper_Swift

+ (PXWallpaperTipsHelper_Swift)shared
{
  if (qword_1EE969AD0 != -1)
    swift_once();
  return (PXWallpaperTipsHelper_Swift *)(id)qword_1EE969AD8;
}

+ (void)removeAllPresentationDelegates
{
  uint64_t *v2;

  sub_1A691FB20(0);
  sub_1A691FD14(0);
  v2 = sub_1A6EE1B90();
  swift_beginAccess();
  if (*v2)
  {
    swift_bridgeObjectRelease();
    *v2 = MEMORY[0x1E0DEE9E0];
  }
}

+ (void)dismissTip:(id)a3
{
  void (**v3)(_QWORD);

  v3 = (void (**)(_QWORD))_Block_copy(a3);
  sub_1A6C9A8AC(v3);
  _Block_release(v3);
}

+ (void)presentTrySettlingEffectTip:(id)a3
{
  sub_1A6C9A520((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))static PXWallpaperTipsHelper.presentTrySettlingEffectTip(_:));
}

+ (void)presentFailedSettlingEffectTip:(id)a3
{
  sub_1A6C9A520((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))static PXWallpaperTipsHelper.presentFailedSettlingEffectTip(_:));
}

- (PXWallpaperTipsHelper_Swift)init
{
  _QWORD *v2;
  _QWORD *v3;
  objc_super v5;

  v2 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___PXWallpaperTipsHelper_Swift_trySettlingEffectTip);
  *v2 = 0;
  v2[1] = 0;
  v3 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___PXWallpaperTipsHelper_Swift_failedSettlingEffectTip);
  *v3 = 0;
  v3[1] = 0;
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR___PXWallpaperTipsHelper_Swift_hasStartedTips) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PXWallpaperTipsHelper();
  return -[PXTipsHelper_Swift init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (void)startObservingTips
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_1A689FC34();
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EE969AD0 != -1)
    swift_once();
  if ((*(_BYTE *)(qword_1EE969AD8 + OBJC_IVAR___PXWallpaperTipsHelper_Swift_hasStartedTips) & 1) == 0)
  {
    *(_BYTE *)(qword_1EE969AD8 + OBJC_IVAR___PXWallpaperTipsHelper_Swift_hasStartedTips) = 1;
    v3 = sub_1A7AE3BD8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
    sub_1A7AE3B9C();
    v4 = sub_1A7AE3B90();
    v5 = swift_allocObject();
    v6 = MEMORY[0x1E0DF06E8];
    *(_QWORD *)(v5 + 16) = v4;
    *(_QWORD *)(v5 + 24) = v6;
    sub_1A686089C((uint64_t)v2, (uint64_t)&unk_1EE8EF6C8, v5);
    swift_release();
  }
}

@end
