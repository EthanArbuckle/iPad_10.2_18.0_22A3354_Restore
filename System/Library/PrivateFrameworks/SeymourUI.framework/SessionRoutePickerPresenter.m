@implementation SessionRoutePickerPresenter

- (_TtC9SeymourUI27SessionRoutePickerPresenter)init
{
  _TtC9SeymourUI27SessionRoutePickerPresenter *result;

  result = (_TtC9SeymourUI27SessionRoutePickerPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27SessionRoutePickerPresenter_sessionClient);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27SessionRoutePickerPresenter_remoteParticipantClient);
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_22B119E2C((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27SessionRoutePickerPresenter_sessionOrigin, (uint64_t (*)(_QWORD))MEMORY[0x24BE86C50]);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9SeymourUI27SessionRoutePickerPresenter_passwordController));
  sub_22B119E2C((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27SessionRoutePickerPresenter_currentSelection, type metadata accessor for SessionRoutePickerPresenter.SelectionState);
  sub_22B119E2C((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27SessionRoutePickerPresenter_targetSelection, type metadata accessor for SessionRoutePickerPresenter.SelectionState);
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27SessionRoutePickerPresenter_display);
}

- (void)routingControllerAvailableRoutesDidChange:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC9SeymourUI27SessionRoutePickerPresenter *v10;
  uint64_t v11;

  v5 = sub_22BA7FE00();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a3;
  v10 = self;
  sub_22BA7F9B0();
  sub_22BA7FDE8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_22B5FFD2C();

}

- (void)routingController:(id)a3 didFailToPickRouteWithError:(id)a4
{
  id v6;
  _TtC9SeymourUI27SessionRoutePickerPresenter *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_22B606138();

}

@end
