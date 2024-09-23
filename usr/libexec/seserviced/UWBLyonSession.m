@implementation UWBLyonSession

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC10seserviced14UWBLyonSession_onM2Message]);
  swift_release(*(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC10seserviced14UWBLyonSession_onM4Message]);
  swift_release(*(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC10seserviced14UWBLyonSession_onResumeResponse]);
  swift_release(*(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC10seserviced14UWBLyonSession_onTimeSync]);
  swift_release(*(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC10seserviced14UWBLyonSession_onPauseRequest]);
  swift_release(*(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC10seserviced14UWBLyonSession_onResumeRequest]);
  swift_release(*(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC10seserviced14UWBLyonSession_onRangingStart]);
  swift_release(*(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC10seserviced14UWBLyonSession_onRangingPause]);
  swift_release(*(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC10seserviced14UWBLyonSession_onURSKPrefetch]);
}

- (void)session:(id)a3 didProcessAcwgM1MsgWithResponse:(id)a4 error:(id)a5
{
  sub_10018707C(self, (uint64_t)a2, a3, a4, a5, &OBJC_IVAR____TtC10seserviced14UWBLyonSession_onM2Message);
}

- (void)session:(id)a3 didProcessAcwgM3MsgWithResponse:(id)a4 error:(id)a5
{
  sub_10018707C(self, (uint64_t)a2, a3, a4, a5, &OBJC_IVAR____TtC10seserviced14UWBLyonSession_onM4Message);
}

- (void)session:(id)a3 didProcessAcwgRangingSessionResumeRequestMsgWithResponse:(id)a4 error:(id)a5
{
  sub_10018707C(self, (uint64_t)a2, a3, a4, a5, &OBJC_IVAR____TtC10seserviced14UWBLyonSession_onResumeResponse);
}

- (void)session:(id)a3 requestAcwgRangingSessionSuspend:(unsigned int)a4 withSuspendTriggerReason:(int64_t)a5
{
  uint64_t v6;
  id v8;
  _TtC10seserviced14UWBLyonSession *v9;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = self;
  sub_100199B64(v6, a5, &OBJC_IVAR____TtC10seserviced14UWBLyonSession_onPauseRequest);

}

- (void)session:(id)a3 requestAcwgRangingSessionResume:(unsigned int)a4 withSessionTriggerReason:(int64_t)a5
{
  uint64_t v6;
  id v8;
  _TtC10seserviced14UWBLyonSession *v9;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = self;
  sub_100199B64(v6, a5, &OBJC_IVAR____TtC10seserviced14UWBLyonSession_onResumeRequest);

}

- (void)session:(id)a3 didStartAcwgRanging:(int64_t)a4
{
  id v6;
  _TtC10seserviced14UWBLyonSession *v7;

  v6 = a3;
  v7 = self;
  sub_100199C90(a4, &OBJC_IVAR____TtC10seserviced14UWBLyonSession_onRangingStart);

}

- (void)session:(id)a3 didSuspendAcwgRanging:(int64_t)a4
{
  void (*v6)(int64_t, uint64_t);
  uint64_t v7;
  id v8;
  _TtC10seserviced14UWBLyonSession *v9;

  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC10seserviced10UWBSession_state) = 4;
  v6 = *(void (**)(int64_t, uint64_t))((char *)&self->super.super.isa
                                                      + OBJC_IVAR____TtC10seserviced14UWBLyonSession_onRangingPause);
  v7 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10seserviced10UWBSession_peer);
  v8 = a3;
  v9 = self;
  swift_retain(v7);
  v6(a4, v7);

  swift_release(v7);
}

- (void)session:(id)a3 didProcessBluetoothHostTimeSyncWithResponse:(id)a4 error:(id)a5
{
  sub_10018707C(self, (uint64_t)a2, a3, a4, a5, &OBJC_IVAR____TtC10seserviced14UWBLyonSession_onTimeSync);
}

- (void)session:(id)a3 didPrefetchAcwgUrsk:(unsigned int)a4 error:(id)a5
{
  id v7;
  _TtC10seserviced14UWBLyonSession *v8;
  id v9;

  v7 = a3;
  v8 = self;
  v9 = a5;
  sub_100199C90((uint64_t)a5, &OBJC_IVAR____TtC10seserviced14UWBLyonSession_onURSKPrefetch);

}

@end
