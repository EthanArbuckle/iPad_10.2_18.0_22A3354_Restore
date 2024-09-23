@implementation DOCServiceTransitionController

- (void)setHasProgress:(BOOL)a3 loadingFractionCompleted:(double)a4 setIsIndeterminate:(BOOL)a5
{
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _TtC5Files30DOCServiceTransitionController *v12;
  _QWORD v13[5];
  uint64_t v14;

  v9 = swift_allocObject(&unk_1005D3560, 40, 7);
  *(_QWORD *)(v9 + 16) = self;
  *(_BYTE *)(v9 + 24) = a3;
  *(_BYTE *)(v9 + 25) = a5;
  *(double *)(v9 + 32) = a4;
  v13[4] = sub_100222F3C;
  v14 = v9;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_10004A82C;
  v13[3] = &unk_1005D3578;
  v10 = _Block_copy(v13);
  v11 = v14;
  v12 = self;
  swift_release(v11);
  DOCRunInMainThread(v10);
  _Block_release(v10);

}

- (void)getDisplayInformation:(BOOL)a3 withCompletionBlock:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _TtC5Files30DOCServiceTransitionController *v11;
  _QWORD v12[5];
  uint64_t v13;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1005D34E8, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = swift_allocObject(&unk_1005D3510, 41, 7);
  *(_QWORD *)(v8 + 16) = self;
  *(_QWORD *)(v8 + 24) = sub_100222EEC;
  *(_QWORD *)(v8 + 32) = v7;
  *(_BYTE *)(v8 + 40) = a3;
  v12[4] = sub_100222F08;
  v13 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_10004A82C;
  v12[3] = &unk_1005D3528;
  v9 = _Block_copy(v12);
  v10 = v13;
  v11 = self;
  swift_retain();
  swift_release(v10);
  DOCRunInMainThread(v9);
  _Block_release(v9);

  swift_release(v7);
}

- (void)startTransition
{
  sub_100222D48(self, (uint64_t)a2, (uint64_t)&unk_1005D3498, (uint64_t)sub_100222EC0, (uint64_t)&unk_1005D34B0);
}

- (void)endTransition
{
  sub_100222D48(self, (uint64_t)a2, (uint64_t)&unk_1005D3448, (uint64_t)sub_100222EB8, (uint64_t)&unk_1005D3460);
}

- (_TtC5Files30DOCServiceTransitionController)init
{
  _TtC5Files30DOCServiceTransitionController *result;

  result = (_TtC5Files30DOCServiceTransitionController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCServiceTransitionController", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files30DOCServiceTransitionController_itemCollection);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Files30DOCServiceTransitionController_node));
  swift_bridgeObjectRelease(*(_QWORD *)&self->itemCollection[OBJC_IVAR____TtC5Files30DOCServiceTransitionController_sceneIdentifier]);
}

@end
