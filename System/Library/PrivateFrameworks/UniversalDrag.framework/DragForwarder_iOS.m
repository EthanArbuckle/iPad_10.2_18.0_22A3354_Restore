@implementation DragForwarder_iOS

- (_TtC13UniversalDrag17DragForwarder_iOS)init
{
  sub_24985BD70();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  sub_249860C0C((uint64_t)self + OBJC_IVAR____TtC13UniversalDrag17DragForwarder_iOS_delegate);
  OUTLINED_FUNCTION_39_0();
  OUTLINED_FUNCTION_53_0(OBJC_IVAR____TtC13UniversalDrag17DragForwarder_iOS_druidSessionProxy);
  sub_24985F660(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13UniversalDrag17DragForwarder_iOS_pasteboardCompletion));
  OUTLINED_FUNCTION_39_0();
  v3 = (char *)self + OBJC_IVAR____TtC13UniversalDrag17DragForwarder_iOS_logger;
  v4 = OUTLINED_FUNCTION_31_0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)dragMonitorSession:(id)a3 didUpdateRegisteredItems:(id)a4
{
  sub_249860BD4(0, &qword_257891910);
  sub_2498ACC70();
  swift_bridgeObjectRelease();
}

- (void)dragMonitorSession:(id)a3 didUpdateDragPresentation:(id)a4
{
  id v6;
  id v7;
  _TtC13UniversalDrag17DragForwarder_iOS *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_24985C224();

}

- (void)dragMonitorSession:(id)a3 didAcceptDropRequestWithItems:(id)a4
{
  unint64_t v6;
  id v7;
  _TtC13UniversalDrag17DragForwarder_iOS *v8;

  sub_249860BD4(0, &qword_257891910);
  v6 = sub_2498ACC70();
  v7 = a3;
  v8 = self;
  sub_24985C778((uint64_t)v8, v6);

  swift_bridgeObjectRelease();
}

@end
