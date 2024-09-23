@implementation SiriSharedUISmartDialogContainer

- (UIViewController)popoverViewController
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUISmartDialogContainer_popoverViewController;
  swift_beginAccess();
  return (UIViewController *)(id)MEMORY[0x1DF0E8588](v2);
}

- (void)setPopoverViewController:(id)a3
{
  _TtC12SiriSharedUI32SiriSharedUISmartDialogContainer *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1DE10C1B8();

}

- (BOOL)shouldBeHidden
{
  _TtC12SiriSharedUI32SiriSharedUISmartDialogContainer *v2;
  char v3;

  v2 = self;
  v3 = sub_1DE10A2E4();

  return v3 & 1;
}

- (_TtC12SiriSharedUI32SiriSharedUISmartDialogContainer)initWithDelegate:(id)a3
{
  _TtC12SiriSharedUI32SiriSharedUISmartDialogContainer *v3;

  swift_unknownObjectRetain();
  v3 = (_TtC12SiriSharedUI32SiriSharedUISmartDialogContainer *)sub_1DE10C2E0();
  swift_unknownObjectRelease();
  return v3;
}

- (id)view
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtC12SiriSharedUI32SiriSharedUISmartDialogContainer *v7;
  void *v8;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUISmartDialogContainer_hostingController);
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = self;
  v8 = (void *)v6(v4, v5);

  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC12SiriSharedUI32SiriSharedUISmartDialogContainer *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  if ((sub_1DE10A2E4() & 1) != 0)
  {

    v6 = 0.0;
    v7 = 0.0;
  }
  else
  {
    v8 = *(_QWORD *)&v5->hostingController[OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUISmartDialogContainer_hostingController
                                         + 8];
    v9 = *(_QWORD *)&v5->hostingController[OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUISmartDialogContainer_hostingController
                                         + 16];
    __swift_project_boxed_opaque_existential_1((Class *)((char *)&v5->super.isa+ OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUISmartDialogContainer_hostingController), v8);
    v6 = (*(double (**)(uint64_t, uint64_t, double, double))(v9 + 8))(v8, v9, width, height);
    v7 = v10;

  }
  v11 = v6;
  v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)updateHeaderWithText:(id)a3 color:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC12SiriSharedUI32SiriSharedUISmartDialogContainer *v10;
  uint64_t v11;

  v6 = sub_1DE13095C();
  v8 = v7;
  v9 = a4;
  v10 = self;
  v11 = MEMORY[0x1DF0E76A0](v9);
  sub_1DE10CD48(v6, v8, v11);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)updateBodyWithText:(id)a3
{
  sub_1DE13095C();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_1DE13020C();
}

- (void)updateWithSmartDialogCard:(id)a3
{
  uint64_t *v4;
  _TtC12SiriSharedUI32SiriSharedUISmartDialogContainer *v5;

  v4 = (uint64_t *)a3;
  v5 = self;
  sub_1DE10A8E0(v4);

}

- (void)updateWithSmartDialogPluginView:(id)a3
{
  id v4;

  swift_getKeyPath();
  swift_getKeyPath();
  v4 = a3;
  swift_retain();
  sub_1DE13020C();
}

- (void)setIsInAmbient:(BOOL)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_1DE13020C();
}

- (void)setInteractionDelegate:(id)a3
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUISmartDialogContainer_smartDialogInteractionManager))
    swift_unknownObjectWeakAssign();
}

- (void)triggerSmartDialogAnimationWithDelay:(double)a3
{
  _TtC12SiriSharedUI32SiriSharedUISmartDialogContainer *v4;

  v4 = self;
  sub_1DE10B5D8(a3);

}

- (_TtC12SiriSharedUI32SiriSharedUISmartDialogContainer)init
{
  _TtC12SiriSharedUI32SiriSharedUISmartDialogContainer *result;

  result = (_TtC12SiriSharedUI32SiriSharedUISmartDialogContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUISmartDialogContainer_hostingController);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUISmartDialogContainer_smartDialogInteractionManager));
  swift_unknownObjectWeakDestroy();
  sub_1DE0F92C8((uint64_t)self + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUISmartDialogContainer_delegate);
}

@end
