@implementation DragPlatformProvider_iOS

- (_TtC13EnsembleAgent24DragPlatformProvider_iOS)init
{
  DragPlatformProvider_iOS.init()();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13EnsembleAgent24DragPlatformProvider_iOS_druidConnection));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13EnsembleAgent24DragPlatformProvider_iOS_druidEnsembleProxyObject));
  sub_1000956F4(OBJC_IVAR____TtC13EnsembleAgent24DragPlatformProvider_iOS_druidSource);
  sub_1000956F4(OBJC_IVAR____TtC13EnsembleAgent24DragPlatformProvider_iOS_druidSink);
  sub_1000956F4(OBJC_IVAR____TtC13EnsembleAgent24DragPlatformProvider_iOS_dragController);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13EnsembleAgent24DragPlatformProvider_iOS_displayController));
  swift_release();
  sub_100025A28((uint64_t)self + OBJC_IVAR____TtC13EnsembleAgent24DragPlatformProvider_iOS_secureLayerHost, &qword_1002AAF30);
  sub_1000050D4();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC13EnsembleAgent24DragPlatformProvider_iOS *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  DragPlatformProvider_iOS.listener(_:shouldAcceptNewConnection:)((NSXPCListener)v8, (NSXPCConnection)v7);

  return 1;
}

- (void)dragDidBeginWithSession:(_DUIServerSessionEnsembleApp *)a3 identifier:(unsigned int)a4 reply:(id)a5
{
  void *v8;
  uint64_t v9;
  _TtC13EnsembleAgent24DragPlatformProvider_iOS *v10;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_1002866C8, 48, 7);
  *(_QWORD *)(v9 + 16) = a3;
  *(_DWORD *)(v9 + 24) = a4;
  *(_QWORD *)(v9 + 32) = v8;
  *(_QWORD *)(v9 + 40) = self;
  swift_unknownObjectRetain(a3);
  v10 = self;
  sub_10008CEBC((uint64_t)&unk_1002ADD80, v9);
}

- (void)dragDidEndWithSession:(id)a3
{
  _TtC13EnsembleAgent24DragPlatformProvider_iOS *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  DragPlatformProvider_iOS.dragDidEnd(withSession:)();
  swift_unknownObjectRelease(a3);

}

@end
