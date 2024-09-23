@implementation PlaybackContinuityActivityDelegate

- (void)userActivityWasContinued:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC8Podcasts34PlaybackContinuityActivityDelegate *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;

  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a3;
  v10 = self;
  v11 = static Logger.userActivity.getter();
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter(v12);
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Activity was continued", v14, 2u);
    swift_slowDealloc(v14, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)userActivityWillSave:(id)a3
{
  id v4;
  _TtC8Podcasts34PlaybackContinuityActivityDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1002373E0(v4);

}

- (void)userActivity:(id)a3 didReceiveInputStream:(id)a4 outputStream:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC8Podcasts34PlaybackContinuityActivityDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100239858(v10);

}

- (_TtC8Podcasts34PlaybackContinuityActivityDelegate)init
{
  _TtC8Podcasts34PlaybackContinuityActivityDelegate *result;

  result = (_TtC8Podcasts34PlaybackContinuityActivityDelegate *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.PlaybackContinuityActivityDelegate", 43, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC8Podcasts34PlaybackContinuityActivityDelegate_playbackController);
}

@end
