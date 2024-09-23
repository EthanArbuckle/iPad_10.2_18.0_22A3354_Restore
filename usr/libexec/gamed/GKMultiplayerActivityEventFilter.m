@implementation GKMultiplayerActivityEventFilter

- (GKMultiplayerActivityEventFilter)init
{
  return (GKMultiplayerActivityEventFilter *)MultiplayerActivityEventFilter.init()();
}

- (void)filterEventWithMetricsFields:(NSDictionary *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  NSDictionary *v8;
  GKMultiplayerActivityEventFilter *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject(&unk_1002C85D0, 40, 7);
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_1001C15C4((uint64_t)&unk_100317118, (uint64_t)v7);
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___GKMultiplayerActivityEventFilter_trackedSessions), v3);
}

@end
