@implementation DOCServiceItemPopoverTrackerController

- (void)getFrameForRegion:(unint64_t)a3 completionBlock:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC5Files38DOCServiceItemPopoverTrackerController *v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1005D3650, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = self;
  sub_100221CF4(a3, 1, (uint64_t)sub_100223008, v7);

  swift_release(v7);
}

- (void)getFrameForRegion:(unint64_t)a3 waitForNewThumbnail:(BOOL)a4 completionBlock:(id)a5
{
  void *v8;
  uint64_t v9;
  _TtC5Files38DOCServiceItemPopoverTrackerController *v10;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_1005D3628, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = self;
  sub_100221CF4(a3, a4, (uint64_t)sub_100222FA8, v9);

  swift_release(v9);
}

- (_TtC5Files38DOCServiceItemPopoverTrackerController)init
{
  _TtC5Files38DOCServiceItemPopoverTrackerController *result;

  result = (_TtC5Files38DOCServiceItemPopoverTrackerController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCServiceItemPopoverTrackerController", 44, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files38DOCServiceItemPopoverTrackerController_itemCollection);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Files38DOCServiceItemPopoverTrackerController_configuration));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Files38DOCServiceItemPopoverTrackerController_node));
}

@end
