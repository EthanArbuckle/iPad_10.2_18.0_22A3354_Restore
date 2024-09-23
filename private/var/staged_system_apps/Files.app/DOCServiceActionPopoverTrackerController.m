@implementation DOCServiceActionPopoverTrackerController

- (void)getFrameForRegion:(unint64_t)a3 completionBlock:(id)a4
{
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  _QWORD *v9;
  _TtC5Files40DOCServiceActionPopoverTrackerController *v10;
  _QWORD v11[5];
  _QWORD *v12;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject(&unk_1005D36F0, 24, 7);
  *(_QWORD *)(v6 + 16) = v5;
  v7 = (_QWORD *)swift_allocObject(&unk_1005D3718, 40, 7);
  v7[2] = self;
  v7[3] = sub_100223008;
  v7[4] = v6;
  v11[4] = sub_100223048;
  v12 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_10004A82C;
  v11[3] = &unk_1005D3730;
  v8 = _Block_copy(v11);
  v9 = v12;
  v10 = self;
  swift_retain();
  swift_release(v9);
  DOCRunInMainThread(v8);
  _Block_release(v8);

  swift_release(v6);
}

- (void)getFrameForRegion:(unint64_t)a3 waitForNewThumbnail:(BOOL)a4 completionBlock:(id)a5
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  _TtC5Files40DOCServiceActionPopoverTrackerController *v11;
  _QWORD v12[5];
  _QWORD *v13;

  v6 = _Block_copy(a5);
  v7 = swift_allocObject(&unk_1005D3678, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (_QWORD *)swift_allocObject(&unk_1005D36A0, 40, 7);
  v8[2] = self;
  v8[3] = sub_100223008;
  v8[4] = v7;
  v12[4] = sub_100222FBC;
  v13 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_10004A82C;
  v12[3] = &unk_1005D36B8;
  v9 = _Block_copy(v12);
  v10 = v13;
  v11 = self;
  swift_retain();
  swift_release(v10);
  DOCRunInMainThread(v9);
  _Block_release(v9);

  swift_release(v7);
}

- (_TtC5Files40DOCServiceActionPopoverTrackerController)init
{
  _TtC5Files40DOCServiceActionPopoverTrackerController *result;

  result = (_TtC5Files40DOCServiceActionPopoverTrackerController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCServiceActionPopoverTrackerController", 46, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files40DOCServiceActionPopoverTrackerController_fullViewController);

}

@end
