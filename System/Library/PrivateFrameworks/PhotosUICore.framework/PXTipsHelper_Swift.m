@implementation PXTipsHelper_Swift

- (PXTipsHelper_Swift)init
{
  _QWORD *v3;
  objc_super v5;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___PXTipsHelper_Swift_presentedTipID);
  *v3 = 0;
  v3[1] = 0;
  swift_unknownObjectWeakInit();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PXTipsHelper();
  return -[PXTipsHelper_Swift init](&v5, sel_init);
}

+ (BOOL)isTipInvalidated:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;

  v3 = sub_1A7AE3764();
  v5 = _s12PhotosUICore12PXTipsHelperC16isTipInvalidatedySbSSFZ_0(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

+ (NSDictionary)presentationDelegates
{
  void *v2;

  swift_beginAccess();
  if (!qword_1EE998778)
    return (NSDictionary *)0;
  sub_1A6847C64();
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  v2 = (void *)sub_1A7AE3578();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

+ (void)setPresentationDelegates:(id)a3
{
  uint64_t v3;

  v3 = (uint64_t)a3;
  if (a3)
  {
    sub_1A6847C64();
    v3 = sub_1A7AE3584();
  }
  swift_beginAccess();
  qword_1EE998778 = v3;
  swift_bridgeObjectRelease();
}

- (NSString)presentedTipID
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___PXTipsHelper_Swift_presentedTipID;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  v3 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setPresentedTipID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_1A7AE3764();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___PXTipsHelper_Swift_presentedTipID);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (UIViewController)tipPopover
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___PXTipsHelper_Swift_tipPopover;
  swift_beginAccess();
  return (UIViewController *)(id)MEMORY[0x1A85CED04](v2);
}

- (void)setTipPopover:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

+ (BOOL)isInitializingTips
{
  swift_beginAccess();
  return byte_1EE998730;
}

+ (void)setIsInitializingTips:(BOOL)a3
{
  swift_beginAccess();
  byte_1EE998730 = a3;
}

+ (BOOL)hasInitializedTips
{
  swift_beginAccess();
  return byte_1EE998821;
}

+ (void)setHasInitializedTips:(BOOL)a3
{
  swift_beginAccess();
  byte_1EE998821 = a3;
}

+ (void)setTip:(id)a3 presentationDelegate:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = sub_1A7AE3764();
  v7 = v6;
  swift_unknownObjectRetain();
  sub_1A67EC130(v5, v7, (uint64_t)a4);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
}

- (void)updatePopoverTip:(id)a3 sourceRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t (*v13)(void);
  PXTipsHelper_Swift *v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  uint64_t v19;
  void *v20;
  id v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = sub_1A7AE3764();
  v11 = v10;
  v12 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v13 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x60);
  v14 = self;
  v15 = v13();
  if (!v16)
    goto LABEL_7;
  if (v15 == v9 && v16 == v11)
  {
    v19 = swift_bridgeObjectRelease();
  }
  else
  {
    v18 = sub_1A7AE4DB4();
    v19 = swift_bridgeObjectRelease();
    if ((v18 & 1) == 0)
    {
LABEL_7:

      swift_bridgeObjectRelease();
      return;
    }
  }
  v20 = (void *)(*(uint64_t (**)(uint64_t))((*v12 & (uint64_t)v14->super.isa) + 0x78))(v19);
  v21 = objc_msgSend(v20, sel_popoverPresentationController);

  objc_msgSend(v21, sel_setSourceRect_, x, y, width, height);
  swift_bridgeObjectRelease();

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  PXTipsHelper_Swift *v5;

  v4 = a3;
  v5 = self;
  _s12PhotosUICore12PXTipsHelperC32presentationControllerDidDismissyySo014UIPresentationF0CF_0();

}

@end
