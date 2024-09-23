@implementation DragSurrogate_iOS

- (_TtC13UniversalDrag17DragSurrogate_iOS)init
{
  sub_24985DD14();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC13UniversalDrag17DragSurrogate_iOS_logger;
  v3 = OUTLINED_FUNCTION_31_0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  OUTLINED_FUNCTION_39_0();
  swift_unownedRelease();
  OUTLINED_FUNCTION_53_0(OBJC_IVAR____TtC13UniversalDrag17DragSurrogate_iOS_window);
  OUTLINED_FUNCTION_53_0(OBJC_IVAR____TtC13UniversalDrag17DragSurrogate_iOS_relaySession);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_39_0();
  swift_release();
}

- (void)dragRelaySessionDidBegin:(id)a3
{
  id v4;
  _TtC13UniversalDrag17DragSurrogate_iOS *v5;

  v4 = a3;
  v5 = self;
  sub_24985DF08();

}

- (void)dragRelaySession:(id)a3 didEndDragWithDrop:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _TtC13UniversalDrag17DragSurrogate_iOS *v7;

  v4 = a4;
  v6 = a3;
  v7 = self;
  sub_24985E03C((uint64_t)v7, (void *)v4);

}

- (void)dragRelaySessionDidFail:(id)a3
{
  id v4;
  _TtC13UniversalDrag17DragSurrogate_iOS *v5;

  v4 = a3;
  v5 = self;
  sub_24985E588();

}

- (void)dragRelaySessionDidEndDataTransfer:(id)a3
{
  id v4;
  _TtC13UniversalDrag17DragSurrogate_iOS *v5;

  v4 = a3;
  v5 = self;
  sub_24985E6F8();

}

- (void)dragRelaySession:(id)a3 didUpdateDragPresentation:(id)a4
{
  id v6;
  NSObject *v7;
  _TtC13UniversalDrag17DragSurrogate_iOS *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_24985E878((uint64_t)v8, v7);

}

@end
