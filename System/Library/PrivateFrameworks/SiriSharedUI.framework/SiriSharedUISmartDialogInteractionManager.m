@implementation SiriSharedUISmartDialogInteractionManager

- (void)performAceCommand:(id)a3
{
  id v5;
  _TtC12SiriSharedUI41SiriSharedUISmartDialogInteractionManager *v6;

  swift_getObjectType();
  v5 = a3;
  v6 = self;
  sub_1DE11AF04(v5, (uint64_t)v6);

}

- (void)performSFCommand:(id)a3
{
  id v4;
  _TtC12SiriSharedUI41SiriSharedUISmartDialogInteractionManager *v5;

  v4 = a3;
  v5 = self;
  sub_1DE118FC0(v4);

}

- (void)performShowResponse:(id)a3
{
  sub_1DE11A844(self, (uint64_t)a2, a3, (void (*)(uint64_t, unint64_t))sub_1DE119C50);
}

- (void)submitIFMessagePayload:(id)a3
{
  sub_1DE11A844(self, (uint64_t)a2, a3, (void (*)(uint64_t, unint64_t))sub_1DE119F24);
}

- (void)navigateWithResponseData:(id)a3
{
  sub_1DE11A844(self, (uint64_t)a2, a3, (void (*)(uint64_t, unint64_t))sub_1DE11A670);
}

- (void)navigateWithPluginModelData:(id)a3 bundleName:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC12SiriSharedUI41SiriSharedUISmartDialogInteractionManager *v11;

  v6 = a3;
  v7 = a4;
  v11 = self;
  v8 = sub_1DE12FE58();
  v10 = v9;

  sub_1DE13095C();
  sub_1DE11A8C4();
  swift_bridgeObjectRelease();
  sub_1DE0ED888(v8, v10);

}

- (void)informHostOfViewResize:(CGSize)a3
{
  double height;
  double width;
  _TtC12SiriSharedUI41SiriSharedUISmartDialogInteractionManager *v5;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_1DE11AAC8(width, height);

}

- (void)willBeginEditing
{
  sub_1DE11AC7C((char *)self, (uint64_t)a2, 1);
}

- (void)didEndEditing
{
  sub_1DE11AC7C((char *)self, (uint64_t)a2, 0);
}

- (id)presentingViewController
{
  id v2;

  v2 = (id)MEMORY[0x1DF0E8588]((char *)self+ OBJC_IVAR____TtC12SiriSharedUI41SiriSharedUISmartDialogInteractionManager_popoverViewController, a2);
  if (!v2)
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F20]), sel_init);
  return v2;
}

- (_TtC12SiriSharedUI41SiriSharedUISmartDialogInteractionManager)init
{
  objc_super v4;

  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SiriSharedUISmartDialogInteractionManager();
  return -[SiriSharedUISmartDialogInteractionManager init](&v4, sel_init);
}

- (void).cxx_destruct
{
  sub_1DE0F92C8((uint64_t)self + OBJC_IVAR____TtC12SiriSharedUI41SiriSharedUISmartDialogInteractionManager_delegate);
  swift_unknownObjectWeakDestroy();
}

@end
