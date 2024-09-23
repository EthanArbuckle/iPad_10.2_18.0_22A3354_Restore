@implementation SpeechManager

- (void)handleAudioInterruptionWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC17SequoiaTranslator13SpeechManager *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10016D8F4((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC17SequoiaTranslator13SpeechManager)init
{
  _TtC17SequoiaTranslator13SpeechManager *result;

  result = (_TtC17SequoiaTranslator13SpeechManager *)_swift_stdlib_reportUnimplementedInitializer("SequoiaTranslator.SpeechManager", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17SequoiaTranslator13SpeechManager_resultContainer));
  sub_100011194((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator13SpeechManager_delegate);
}

- (void)languageDetectionResult:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator13SpeechManager *v5;

  v4 = a3;
  v5 = self;
  sub_10016E4DC(v4, (uint64_t)&unk_10026EDD8, (uint64_t)sub_100170798, (uint64_t)&unk_10026EDF0);

}

- (void)speechRecognitionResult:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator13SpeechManager *v5;

  v4 = a3;
  v5 = self;
  sub_10016E4DC(v4, (uint64_t)&unk_10026ED88, (uint64_t)sub_100170760, (uint64_t)&unk_10026EDA0);

}

- (void)translatorDidTranslate:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator13SpeechManager *v5;

  v4 = a3;
  v5 = self;
  sub_10016E4DC(v4, (uint64_t)&unk_10026ED38, (uint64_t)sub_1001702B4, (uint64_t)&unk_10026ED50);

}

- (void)translationDidFinishWithError:(id)a3
{
  _TtC17SequoiaTranslator13SpeechManager *v4;
  id v5;

  v4 = self;
  v5 = a3;
  sub_10016FA78((uint64_t)a3);

}

- (void)speechActivityDetected
{
  uint64_t v2;
  _TtC17SequoiaTranslator13SpeechManager *v3;
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  NSObject *oslog;

  v2 = qword_10028A468;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_10028A468, sub_1001210B8);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_10000F66C(v4, (uint64_t)qword_1002AA440);
  oslog = Logger.logObject.getter(v5);
  v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v6, "Speech activity detected", v7, 2u);
    swift_slowDealloc(v7, -1, -1);
  }

}

@end
