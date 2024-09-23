@implementation FMHelpFriendView

- (_TtC6FindMy16FMHelpFriendView)init
{
  return (_TtC6FindMy16FMHelpFriendView *)sub_10034E88C();
}

- (_TtC6FindMy16FMHelpFriendView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC6FindMy16FMHelpFriendView *result;

  v5 = OBJC_IVAR____TtC6FindMy16FMHelpFriendView_link;
  v6 = objc_allocWithZone((Class)UIButton);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  v8 = OBJC_IVAR____TtC6FindMy16FMHelpFriendView_message;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)UILabel), "init");

  result = (_TtC6FindMy16FMHelpFriendView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMHelpFriendView.swift", 29, 2, 31, 0);
  __break(1u);
  return result;
}

- (_TtC6FindMy16FMHelpFriendView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy16FMHelpFriendView *result;

  result = (_TtC6FindMy16FMHelpFriendView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMHelpFriendView", 23, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

- (void)handleLinkTap
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  id v17;
  NSURL *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  Class isa;
  uint64_t v23;

  v0 = sub_100053F2C((uint64_t *)&unk_1005D3470);
  __chkstk_darwin(v0);
  v2 = (char *)&v23 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for URL(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  URL.init(string:)(0xD00000000000001BLL, 0x80000001004C0920);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_10009ADFC((uint64_t)v2);
    if (qword_1005D1DE8 != -1)
      swift_once(&qword_1005D1DE8, sub_100005ADC);
    v7 = type metadata accessor for Logger(0);
    v8 = sub_100056D88(v7, (uint64_t)qword_1005F5748);
    v9 = Logger.logObject.getter(v8);
    v10 = static os_log_type_t.error.getter(v9);
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "FMHelpFriendView: Cannot go to icloud.com", v11, 2u);
      swift_slowDealloc(v11, -1, -1);
    }

  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
    if (qword_1005D1DE8 != -1)
      swift_once(&qword_1005D1DE8, sub_100005ADC);
    v12 = type metadata accessor for Logger(0);
    v13 = sub_100056D88(v12, (uint64_t)qword_1005F5748);
    v14 = Logger.logObject.getter(v13);
    v15 = static os_log_type_t.default.getter(v14);
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "FMHelpFriendView: User tapped help a friend", v16, 2u);
      swift_slowDealloc(v16, -1, -1);
    }

    v17 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
    URL._bridgeToObjectiveC()(v18);
    v20 = v19;
    v21 = sub_10011D84C((uint64_t)_swiftEmptyArrayStorage);
    type metadata accessor for OpenExternalURLOptionsKey(0);
    sub_1000E46C0();
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v17, "openURL:options:completionHandler:", v20, isa, 0, swift_bridgeObjectRelease(v21).n128_f64[0]);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

@end
