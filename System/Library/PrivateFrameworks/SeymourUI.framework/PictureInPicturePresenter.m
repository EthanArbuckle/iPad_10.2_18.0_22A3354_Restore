@implementation PictureInPicturePresenter

- (_TtC9SeymourUI25PictureInPicturePresenter)init
{
  _TtC9SeymourUI25PictureInPicturePresenter *result;

  result = (_TtC9SeymourUI25PictureInPicturePresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25PictureInPicturePresenter_sessionClient);
  swift_unknownObjectRelease();
  swift_release();

  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25PictureInPicturePresenter_display);
}

- (void)playerViewControllerDidStartPictureInPicture:(id)a3
{
  sub_22B7B2814(self, (uint64_t)a2, a3, 0xD000000000000030, 0x800000022BAD98F0, (void (*)(uint64_t))sub_22B7B1864);
}

- (void)playerViewControllerWillStopPictureInPicture:(id)a3
{
  id v4;
  _TtC9SeymourUI25PictureInPicturePresenter *v5;

  v4 = a3;
  v5 = self;
  _s9SeymourUI09PictureInC9PresenterC028playerViewControllerWillStopcdC0yySo08AVPlayergH0CF_0();

}

- (void)playerViewControllerDidStopPictureInPicture:(id)a3
{
  sub_22B7B2814(self, (uint64_t)a2, a3, 0xD00000000000002FLL, 0x800000022BAD97C0, (void (*)(uint64_t))sub_22B7B0EE0);
}

- (void)playerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  id v12;
  _TtC9SeymourUI25PictureInPicturePresenter *v13;
  uint64_t v14;

  v7 = sub_22BA7FE00();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  _Block_copy(v11);
  v12 = a3;
  v13 = self;
  sub_22BA7FA40();
  sub_22BA7FDE8();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_22B7B3080(v12, (char *)v13, (uint8_t *)v11);
  _Block_release(v11);
  _Block_release(v11);

}

@end
