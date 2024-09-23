@implementation SharedTranslationOptions

- (_TtC17SequoiaTranslator24SharedTranslationOptions)init
{
  return (_TtC17SequoiaTranslator24SharedTranslationOptions *)sub_10015ED60();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self
     + OBJC_IVAR____TtC17SequoiaTranslator24SharedTranslationOptions__genderDisambiguationUserSettingEnabled;
  v4 = sub_100006DF4((uint64_t *)&unk_1002987F0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC17SequoiaTranslator24SharedTranslationOptions__autodetectSpeechEnabled, v4);
  v5((char *)self + OBJC_IVAR____TtC17SequoiaTranslator24SharedTranslationOptions__autoTranslateEnabled, v4);
  v5((char *)self + OBJC_IVAR____TtC17SequoiaTranslator24SharedTranslationOptions__autoplayTTSEnabled, v4);
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC17SequoiaTranslator24SharedTranslationOptions *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;

  if (a4)
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v6 = qword_10028A468;
  v7 = a3;
  v8 = self;
  if (v6 != -1)
    swift_once(&qword_10028A468, sub_1001210B8);
  v9 = type metadata accessor for Logger(0);
  v10 = sub_10000F66C(v9, (uint64_t)qword_1002AA440);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.info.getter(v11);
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Notified of MCProfileConnection setting change, rechecking profanity filtering", v13, 2u);
    swift_slowDealloc(v13, -1, -1);
  }

  sub_10015F798();
  swift_bridgeObjectRelease();
}

@end
