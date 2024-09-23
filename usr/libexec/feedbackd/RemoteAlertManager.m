@implementation RemoteAlertManager

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  _TtC9feedbackdP33_109D9EA95C5E46A2F39C291451DCB14618RemoteAlertManager *v5;

  v4 = a3;
  v5 = self;
  sub_1000381AC(v4);

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  _TtC9feedbackdP33_109D9EA95C5E46A2F39C291451DCB14618RemoteAlertManager *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_100038528(v6, (uint64_t)a4);

}

- (_TtC9feedbackdP33_109D9EA95C5E46A2F39C291451DCB14618RemoteAlertManager)init
{
  char *v3;
  uint64_t v4;
  objc_super v6;

  v3 = (char *)self
     + OBJC_IVAR____TtC9feedbackdP33_109D9EA95C5E46A2F39C291451DCB14618RemoteAlertManager_checkedThrowingContinuation;
  v4 = sub_100005D4C(&qword_10006FFB0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC9feedbackdP33_109D9EA95C5E46A2F39C291451DCB14618RemoteAlertManager_remoteAlertHandle) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for RemoteAlertManager(0);
  return -[RemoteAlertManager init](&v6, "init");
}

- (void).cxx_destruct
{
  sub_100009730((uint64_t)self+ OBJC_IVAR____TtC9feedbackdP33_109D9EA95C5E46A2F39C291451DCB14618RemoteAlertManager_checkedThrowingContinuation, &qword_100070028);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9feedbackdP33_109D9EA95C5E46A2F39C291451DCB14618RemoteAlertManager_remoteAlertHandle));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC9feedbackdP33_109D9EA95C5E46A2F39C291451DCB14618RemoteAlertManager *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100039D90(v7);

  return v9 & 1;
}

- (void)remoteViewControllerDidLaunchWhileLockedWithCompletion:(id)a3
{
  void *v4;
  _TtC9feedbackdP33_109D9EA95C5E46A2F39C291451DCB14618RemoteAlertManager *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_100039EE4((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)remoteAlertHandleDidActivate:
{
  uint64_t v0;
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  NSObject *oslog;
  uint64_t v6;
  uint64_t v7;

  if (qword_10006EE58 != -1)
    swift_once(&qword_10006EE58, sub_100037278);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_1000097B4(v0, (uint64_t)qword_10006FE10);
  oslog = Logger.logObject.getter(v1);
  v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc(12, -1);
    v4 = swift_slowAlloc(32, -1);
    v7 = v4;
    *(_DWORD *)v3 = 136446210;
    v6 = sub_1000572F8(0xD000000000000020, 0x800000010005BE50, &v7);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v6, &v7);
    _os_log_impl((void *)&_mh_execute_header, oslog, v2, "%{public}s", v3, 0xCu);
    swift_arrayDestroy(v4, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v4, -1, -1);
    swift_slowDealloc(v3, -1, -1);

  }
  else
  {

  }
}

@end
