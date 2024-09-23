@implementation RemoteDisplayPresenter

- (_TtC9SeymourUI22RemoteDisplayPresenter)init
{
  _TtC9SeymourUI22RemoteDisplayPresenter *result;

  result = (_TtC9SeymourUI22RemoteDisplayPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22B119E2C((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22RemoteDisplayPresenter_state, type metadata accessor for RemoteDisplayPresenter.State);
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22RemoteDisplayPresenter_sessionClient);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22RemoteDisplayPresenter_storefrontLocalizer);
  swift_release();
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22RemoteDisplayPresenter_display);
}

- (void)playerViewControllerDidStartPictureInPicture:(id)a3
{
  id v4;
  _TtC9SeymourUI22RemoteDisplayPresenter *v5;

  v4 = a3;
  v5 = self;
  _s9SeymourUI22RemoteDisplayPresenterC037playerViewControllerDidStartPictureInK0yySo08AVPlayergH0CF_0();

}

- (void)playerViewControllerWillStopPictureInPicture:(id)a3
{
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC9SeymourUI22RemoteDisplayPresenter *v15;
  uint64_t v16;

  v5 = sub_22BA7D6E8();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BE8DE68];
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_22BA7FE00();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a3;
  v15 = self;
  sub_22BA7FA40();
  sub_22BA7FDE8();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  swift_getObjectType();
  sub_22BA7D6DC();
  sub_22B0F3C60((unint64_t *)&unk_255BACCC0, v6, MEMORY[0x24BE8DE58]);
  sub_22BA7EFF0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);

}

- (void)playerViewControllerDidStopPictureInPicture:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC9SeymourUI22RemoteDisplayPresenter *v10;
  uint64_t v11;

  v5 = sub_22BA7FE00();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a3;
  v10 = self;
  sub_22BA7FA40();
  sub_22BA7FDE8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_22B46FBE4();

}

- (void)playerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  void *v6;
  id v7;
  _TtC9SeymourUI22RemoteDisplayPresenter *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_22B4746A4((uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

@end
