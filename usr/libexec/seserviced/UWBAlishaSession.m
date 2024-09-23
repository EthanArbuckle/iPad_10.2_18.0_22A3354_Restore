@implementation UWBAlishaSession

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC10seserviced16UWBAlishaSession_onOutgoingMessage]);
  swift_release(*(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC10seserviced16UWBAlishaSession_onSessionHealthUpdate]);
}

- (void)session:(id)a3 relayDCKMessage:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC10seserviced16UWBAlishaSession *v11;

  v6 = a3;
  v7 = a4;
  v11 = self;
  v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;

  sub_1001998E0(v8, v10);
  sub_100063CD0(v8, v10);

}

- (void)session:(id)a3 didUpdateHealthStatus:(int64_t)a4
{
  id v6;
  _TtC10seserviced16UWBAlishaSession *v7;

  v6 = a3;
  v7 = self;
  sub_100199A1C(a4);

}

@end
