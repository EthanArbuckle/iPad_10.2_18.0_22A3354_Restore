@implementation UWBSession

- (_TtC10seserviced10UWBSession)init
{
  _TtC10seserviced10UWBSession *result;

  result = (_TtC10seserviced10UWBSession *)_swift_stdlib_reportUnimplementedInitializer("seserviced.UWBSession", 21, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->configuration[OBJC_IVAR____TtC10seserviced10UWBSession_onInvalidation]);
  swift_release(*(_QWORD *)&self->configuration[OBJC_IVAR____TtC10seserviced10UWBSession_onResumption]);
  swift_release(*(_QWORD *)&self->configuration[OBJC_IVAR____TtC10seserviced10UWBSession_onStart]);
  swift_release(*(_QWORD *)&self->configuration[OBJC_IVAR____TtC10seserviced10UWBSession_onSuspension]);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced10UWBSession_peer));

}

- (void)sessionDidStartRunning:(id)a3
{
  id v4;
  _TtC10seserviced10UWBSession *v5;

  v4 = a3;
  v5 = self;
  sub_10019922C();

}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  _TtC10seserviced10UWBSession *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_100199378((uint64_t)v8);

}

- (void)session:(id)a3 suspendedWithReason:(int64_t)a4
{
  id v6;
  _TtC10seserviced10UWBSession *v7;

  v6 = a3;
  v7 = self;
  sub_100199570(a4);

}

- (void)session:(id)a3 suspensionReasonEnded:(int64_t)a4 isNoLongerSuspended:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  _TtC10seserviced10UWBSession *v9;

  v5 = a5;
  v8 = a3;
  v9 = self;
  sub_1001996F0(a4, v5);

}

@end
