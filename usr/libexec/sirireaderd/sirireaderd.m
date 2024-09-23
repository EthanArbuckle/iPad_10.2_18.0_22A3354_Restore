int main(int argc, const char **argv, const char **envp)
{
  FILE *v3;
  id v4;

  v3 = (FILE *)stdout.getter(*(_QWORD *)&argc, argv, envp);
  setlinebuf(v3);
  qword_100019710 = (uint64_t)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SiriReaderDaemonServer()), "init");
  v4 = objc_msgSend((id)objc_opt_self(NSRunLoop), "mainRunLoop");
  objc_msgSend(v4, "run");

  return 0;
}

uint64_t sub_100001D84(uint64_t a1, uint64_t a2)
{
  return sub_100001E60(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100001D9C(uint64_t a1, uint64_t a2)
{
  return sub_100001E60(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100001DB0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100001DF0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  _QWORD v8[9];

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_100001E60(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  v7 = v6;
  v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_100001E9C(uint64_t a1, id *a2)
{
  uint64_t result;
  uint64_t v5;
  NSString v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  v5 = v8;
  if (v8)
  {
    v6 = String._bridgeToObjectiveC()();
    result = swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return result;
}

uint64_t sub_100001F10(uint64_t a1, id *a2)
{
  char v4;
  uint64_t v5;
  NSString v6;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  v5 = v9;
  if (v9)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_100001F8C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5;
  return result;
}

uint64_t sub_100001FD0(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    v10 = 1;
    v9 = v5;
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

uint64_t sub_10000205C@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100002084(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100002294(&qword_1000192B8, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_100010AEC);
  v3 = sub_100002294(&qword_1000192C0, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_100010A40);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100002108@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  NSString v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_10000214C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100002294(&qword_1000192C8, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_100010B30);
  v3 = sub_100002294(&qword_1000192D0, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_10001092C);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
  sub_1000021F8(a1, &qword_100019278, (uint64_t)&unk_100014900);
}

void type metadata accessor for NSKeyValueChangeKey(uint64_t a1)
{
  sub_1000021F8(a1, &qword_100019280, (uint64_t)&unk_100014928);
}

void sub_1000021F8(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v5;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, a3);
    if (!v5)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_10000223C()
{
  return sub_100002294(&qword_100019288, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_1000108F0);
}

uint64_t sub_100002268()
{
  return sub_100002294(&qword_100019290, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)"}@");
}

uint64_t sub_100002294(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000022D4()
{
  return sub_100002294(&qword_100019298, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_100010A04);
}

uint64_t sub_100002300()
{
  return sub_100002294(&qword_1000192A0, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_1000109D8);
}

uint64_t sub_10000232C()
{
  return sub_100002294(&qword_1000192A8, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_100010A74);
}

uint64_t sub_100002358()
{
  return sub_100002294(&qword_1000192B0, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_100010960);
}

id sub_10000238C()
{
  if (qword_100019208 != -1)
    swift_once(&qword_100019208, sub_10000E068);
  qword_1000192D8 = qword_100019738;
  return (id)qword_100019738;
}

uint64_t sub_1000023D4()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10000ADF8(v0, qword_1000192E0);
  sub_10000AD90(v0, (uint64_t)qword_1000192E0);
  if (qword_1000191D8 != -1)
    swift_once(&qword_1000191D8, sub_10000238C);
  return Logger.init(_:)((id)qword_1000192D8);
}

id sub_100002454()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)AVQueuePlayer), "init");
  qword_1000192F8 = (uint64_t)result;
  return result;
}

id sub_100002484()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DaemonSession(0)), "init");
  qword_100019300 = (uint64_t)result;
  return result;
}

uint64_t sub_1000024B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v0 = sub_10000AD08(&qword_100019478);
  v1 = swift_allocObject(v0, 80, 7);
  *(_OWORD *)(v1 + 16) = xmmword_100010B80;
  sub_10000DDA8(0, &qword_100019470, NSNumber_ptr);
  *(NSNumber *)(v1 + 32) = NSNumber.init(floatLiteral:)(0.75);
  *(NSNumber *)(v1 + 40) = NSNumber.init(floatLiteral:)(1.0);
  *(NSNumber *)(v1 + 48) = NSNumber.init(floatLiteral:)(1.25);
  *(NSNumber *)(v1 + 56) = NSNumber.init(floatLiteral:)(1.5);
  *(NSNumber *)(v1 + 64) = NSNumber.init(floatLiteral:)(1.75);
  *(NSNumber *)(v1 + 72) = NSNumber.init(floatLiteral:)(2.0);
  result = specialized Array._endMutation()();
  qword_100019718 = v1;
  return result;
}

void sub_100002578()
{
  qword_100019720 = 0x49746E6572727563;
  *(_QWORD *)algn_100019728 = 0xEB000000006D6574;
}

id sub_1000025A4()
{
  _BYTE *v0;
  _QWORD *v1;
  uint64_t v2;
  id v3;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  NSString v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  objc_super v25;

  v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isCurrentlySeeking] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_nowPlayingInfo] = &_swiftEmptyDictionarySingleton;
  v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_boostToken] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_idleTimer] = 0;
  v1 = &v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID];
  *v1 = 0;
  v1[1] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences] = &_swiftEmptyArrayStorage;
  v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isSessionActive] = 0;
  v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlayingStartingTone] = 0;
  v2 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_processMonitor;
  v3 = objc_allocWithZone((Class)RBSProcessMonitor);
  v4 = v0;
  *(_QWORD *)&v0[v2] = objc_msgSend(v3, "init");
  *(_QWORD *)&v4[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_startingTonePlayer] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_startingSentence] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentRequestStartTime] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_idleTimeTracker] = 0;
  v5 = &v4[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentContextId];
  v6 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = type metadata accessor for SiriReaderInstrumentationUtility();
  v8 = (_QWORD *)swift_allocObject(v7, 56, 7);
  v9 = type metadata accessor for SelfEmitter();
  v10 = swift_allocObject(v9, 16, 7);
  v8[5] = v9;
  v8[6] = &off_100014E50;
  v8[2] = v10;
  v11 = &v4[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_instrumentationUtil];
  *((_QWORD *)v11 + 3) = v7;
  *((_QWORD *)v11 + 4) = &off_100014E18;
  *(_QWORD *)v11 = v8;

  v25.receiver = v4;
  v25.super_class = (Class)type metadata accessor for SiriReaderDaemon(0);
  v12 = objc_msgSendSuper2(&v25, "init");
  v13 = qword_1000191E8;
  v14 = v12;
  if (v13 != -1)
    swift_once(&qword_1000191E8, sub_100002454);
  v15 = (void *)qword_1000192F8;
  v16 = qword_100019200;
  v17 = v14;
  v18 = v15;
  if (v16 != -1)
    swift_once(&qword_100019200, sub_100002578);
  v19 = String._bridgeToObjectiveC()();
  objc_msgSend(v18, "addObserver:forKeyPath:options:context:", v17, v19, 5, 0);

  sub_100008A34();
  sub_10000372C();
  v20 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  v21 = (void *)objc_opt_self(AVAudioSession);
  v22 = v17;
  v23 = objc_msgSend(v21, "sharedInstance");
  objc_msgSend(v20, "addObserver:selector:name:object:", v22, "handlePlaybackInterruptionWithNotification:", AVAudioSessionInterruptionNotification, v23);

  return v22;
}

unint64_t sub_1000029B4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000AD08(&qword_100019558);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_10000DDE0(v7, (uint64_t)&v14, &qword_100019560);
    v8 = v14;
    result = sub_10000B670(v14);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v4[6] + 8 * result) = v8;
    result = (unint64_t)sub_10000D1A4(&v15, (_OWORD *)(v4[7] + 32 * result));
    v11 = v4[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4[2] = v13;
    v7 += 40;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_100002BB0()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  NSString v3;
  id v4;
  NSString v5;
  id v6;
  id v7;
  uint64_t (**v8)();
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  NSString v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  NSString v23;
  NSString v24;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  _OWORD v32[2];
  uint64_t v33;
  _QWORD v34[3];

  v1 = v0;
  v2 = objc_allocWithZone((Class)NSUserDefaults);
  v3 = String._bridgeToObjectiveC()();
  v4 = objc_msgSend(v2, "initWithSuiteName:", v3);

  if (!v4)
    return 0;
  v5 = String._bridgeToObjectiveC()();
  v6 = objc_msgSend(v4, "objectForKey:", v5);

  if (v6)
  {
    _bridgeAnyObjectToAny(_:)(v32, v6);
    swift_unknownObjectRelease(v6);
  }
  else
  {
    memset(v32, 0, sizeof(v32));
  }
  sub_10000D4B4((uint64_t)v32, (uint64_t)&v33);
  v8 = &off_100019000;
  if (v34[2])
  {
    if ((swift_dynamicCast(&v30, &v33, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
    {
      v9 = v31;
      v10 = (_QWORD *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID);
      v11 = *(_QWORD *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
      if (v11)
      {
        if ((v12 = v30, v30 == *v10) && v11 == v31
          || (_stringCompareWithSmolCheck(_:_:expecting:)(v30, v31, *v10, v11, 0) & 1) != 0)
        {
          v29 = v12;
          v13 = String._bridgeToObjectiveC()();
          v7 = objc_msgSend(v4, "integerForKey:", v13);

          if (qword_1000191E0 != -1)
            swift_once(&qword_1000191E0, sub_1000023D4);
          v14 = type metadata accessor for Logger(0);
          sub_10000AD90(v14, (uint64_t)qword_1000192E0);
          v15 = swift_bridgeObjectRetain(v9);
          v16 = Logger.logObject.getter(v15);
          v17 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v16, v17))
          {
            v18 = (uint8_t *)swift_slowAlloc(12, -1);
            v19 = swift_slowAlloc(32, -1);
            v33 = v19;
            *(_DWORD *)v18 = 136315138;
            swift_bridgeObjectRetain(v9);
            *(_QWORD *)&v32[0] = sub_10000AFCC(v29, v9, &v33);
            v8 = &off_100019000;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(v32, (char *)v32 + 8, v18 + 4, v18 + 12);
            swift_bridgeObjectRelease_n(v9, 3);
            _os_log_impl((void *)&_mh_execute_header, v16, v17, "#sirireaderd previouslyInProgressUUID: %s", v18, 0xCu);
            swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v19, -1, -1);
            swift_slowDealloc(v18, -1, -1);

          }
          else
          {

            v20 = swift_bridgeObjectRelease_n(v9, 2);
          }
          v26 = Logger.logObject.getter(v20);
          v27 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v26, v27))
          {
            v28 = (uint8_t *)swift_slowAlloc(12, -1);
            *(_DWORD *)v28 = 134217984;
            v33 = (uint64_t)v7;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, v34, v28 + 4, v28 + 12);
            _os_log_impl((void *)&_mh_execute_header, v26, v27, "#sirireaderd previouslyInProgressSentence: %ld", v28, 0xCu);
            swift_slowDealloc(v28, -1, -1);
          }

          goto LABEL_19;
        }
      }
      swift_bridgeObjectRelease(v9);
    }
  }
  else
  {
    sub_10000D470((uint64_t)&v33, &qword_100019480);
  }
  v7 = 0;
LABEL_19:
  v21 = (char *)v8[103] + v1;
  v22 = *((_QWORD *)v21 + 1);
  if (v22)
  {
    swift_bridgeObjectRetain(*((_QWORD *)v21 + 1));
    v23 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v22);
  }
  else
  {
    v23 = 0;
  }
  v24 = String._bridgeToObjectiveC()();
  objc_msgSend(v4, "setObject:forKey:", v23, v24);

  swift_unknownObjectRelease(v23);
  return v7;
}

void sub_100003010()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  void (*v14)(char *, char *, uint64_t);
  id v15;
  NSURL *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  _QWORD aBlock[5];
  uint64_t v37;

  v1 = v0;
  v2 = sub_10000AD08(&qword_100019498);
  __chkstk_darwin(v2);
  v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)aBlock - v10;
  v12 = objc_msgSend((id)objc_opt_self(SiriReaderUtilities), "readerStartingToneAudioAssetURL");
  if (v12)
  {
    v13 = v12;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v14 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v14(v4, v9, v5);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
    {
      v14(v11, v4, v5);
      v15 = objc_allocWithZone((Class)AVPlayerItem);
      URL._bridgeToObjectiveC()(v16);
      v18 = v17;
      v19 = objc_msgSend(v15, "initWithURL:", v17);

      v20 = objc_msgSend(objc_allocWithZone((Class)AVPlayer), "initWithPlayerItem:", v19);
      v21 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_startingTonePlayer;
      v22 = *(void **)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_startingTonePlayer);
      *(_QWORD *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_startingTonePlayer) = v20;

      v23 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
      v24 = (void *)objc_opt_self(NSOperationQueue);
      v25 = v19;
      v26 = objc_msgSend(v24, "mainQueue");
      v27 = swift_allocObject(&unk_100014A90, 24, 7);
      swift_unknownObjectWeakInit(v27 + 16, v1);
      aBlock[4] = sub_10000D4AC;
      v37 = v27;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100003460;
      aBlock[3] = &unk_100014D28;
      v28 = _Block_copy(aBlock);
      swift_release(v37);
      v29 = objc_msgSend(v23, "addObserverForName:object:queue:usingBlock:", AVPlayerItemDidPlayToEndTimeNotification, v25, v26, v28);
      _Block_release(v28);
      swift_unknownObjectRelease(v29);

      *(_BYTE *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlayingStartingTone) = 1;
      v30 = *(void **)(v1 + v21);
      if (v30)
      {
        objc_msgSend(v30, "play");

        (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);

      }
      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  }
  sub_10000D470((uint64_t)v4, &qword_100019498);
  if (qword_1000191E0 != -1)
    swift_once(&qword_1000191E0, sub_1000023D4);
  v31 = type metadata accessor for Logger(0);
  v32 = sub_10000AD90(v31, (uint64_t)qword_1000192E0);
  v33 = Logger.logObject.getter(v32);
  v34 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v35 = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "#sirireaderd Starting tone file not found", v35, 2u);
    swift_slowDealloc(v35, -1, -1);
  }

}

void sub_100003414(uint64_t a1, uint64_t a2)
{
  uint64_t Strong;
  id v3;

  Strong = swift_unknownObjectWeakLoadStrong(a2 + 16);
  if (Strong)
  {
    v3 = (id)Strong;
    sub_100003504();

  }
}

uint64_t sub_100003460(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *);
  uint64_t v11;

  v4 = type metadata accessor for Notification(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void (**)(char *))(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a2);
  swift_retain(v8);
  v9(v7);
  swift_release(v8);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_100003504()
{
  _BYTE *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  NSObject *oslog;
  uint64_t v12;
  uint64_t v13;

  v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlayingStartingTone] = 0;
  v1 = *(void **)&v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_startingTonePlayer];
  *(_QWORD *)&v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_startingTonePlayer] = 0;

  if ((v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying] & 1) != 0)
  {
    if (qword_1000191E0 != -1)
      swift_once(&qword_1000191E0, sub_1000023D4);
    v2 = type metadata accessor for Logger(0);
    v3 = sub_10000AD90(v2, (uint64_t)qword_1000192E0);
    oslog = Logger.logObject.getter(v3);
    v4 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v4, "#sirireaderd Finished playing starting tone, but player is already playing!", v5, 2u);
      swift_slowDealloc(v5, -1, -1);
    }

  }
  else
  {
    if (qword_1000191E0 != -1)
      swift_once(&qword_1000191E0, sub_1000023D4);
    v6 = type metadata accessor for Logger(0);
    sub_10000AD90(v6, (uint64_t)qword_1000192E0);
    v7 = v0;
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v10 = 134217984;
      v12 = *(_QWORD *)&v7[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence];
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13, v10 + 4, v10 + 12);

      _os_log_impl((void *)&_mh_execute_header, v8, v9, "#sirireaderd Finished playing starting tone, enqueuing sentence %ld", v10, 0xCu);
      swift_slowDealloc(v10, -1, -1);

    }
    else
    {

    }
    sub_10000783C(*(_QWORD *)&v7[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence], 1);
  }
}

uint64_t sub_10000372C()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  char *v7;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v10[5];
  uint64_t v11;

  v1 = *(void **)&v0[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_processMonitor];
  v2 = swift_allocObject(&unk_100014C48, 24, 7);
  *(_QWORD *)(v2 + 16) = v0;
  v3 = swift_allocObject(&unk_100014C70, 32, 7);
  *(_QWORD *)(v3 + 16) = sub_10000D360;
  *(_QWORD *)(v3 + 24) = v2;
  v10[4] = sub_10000D378;
  v11 = v3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_10000426C;
  v10[3] = &unk_100014C88;
  v4 = _Block_copy(v10);
  v5 = v11;
  v6 = v1;
  v7 = v0;
  swift_retain(v3);
  swift_release(v5);
  objc_msgSend(v6, "updateConfiguration:", v4);

  _Block_release(v4);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(v3, "", 121, 221, 49, 1);
  swift_release(v2);
  result = swift_release(v3);
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

void sub_100003868(void *a1, uint64_t a2)
{
  NSString v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  Class isa;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;

  v4 = String._bridgeToObjectiveC()();
  v5 = objc_msgSend((id)objc_opt_self(RBSProcessPredicate), "predicateMatchingBundleIdentifier:", v4);

  v6 = sub_10000AD08(&qword_100019478);
  v7 = swift_allocObject(v6, 40, 7);
  *(_OWORD *)(v7 + 16) = xmmword_100010B90;
  *(_QWORD *)(v7 + 32) = v5;
  v13[0] = v7;
  specialized Array._endMutation()();
  sub_10000DDA8(0, &qword_100019518, RBSProcessPredicate_ptr);
  v8 = v5;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v13[0]);
  objc_msgSend(a1, "setPredicates:", isa);

  objc_msgSend(a1, "setServiceClass:", 25);
  objc_msgSend(a1, "setEvents:", 1);
  v10 = objc_msgSend(objc_allocWithZone((Class)RBSProcessStateDescriptor), "init");
  objc_msgSend(a1, "setStateDescriptor:", v10);

  v11 = swift_allocObject(&unk_100014A90, 24, 7);
  swift_unknownObjectWeakInit(v11 + 16, a2);
  v13[4] = sub_10000D398;
  v14 = v11;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_1000041E4;
  v13[3] = &unk_100014CB0;
  v12 = _Block_copy(v13);
  swift_release(v14);
  objc_msgSend(a1, "setUpdateHandler:", v12);
  _Block_release(v12);

}

uint64_t sub_100003A64(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  _QWORD *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[5];
  _QWORD *v27;

  v7 = type metadata accessor for DispatchWorkItemFlags(0);
  v25 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = type metadata accessor for DispatchQoS(0);
  v10 = *(_QWORD *)(v24 - 8);
  __chkstk_darwin(v24);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000DDA8(0, &qword_100019520, OS_dispatch_queue_ptr);
  v13 = (void *)static OS_dispatch_queue.main.getter();
  v14 = (_QWORD *)swift_allocObject(&unk_100014CE8, 40, 7);
  v14[2] = a4;
  v14[3] = a2;
  v14[4] = a3;
  aBlock[4] = sub_10000D3D4;
  v27 = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000041B8;
  aBlock[3] = &unk_100014D00;
  v15 = _Block_copy(aBlock);
  v16 = v27;
  swift_retain(a4);
  v17 = a2;
  v18 = a3;
  v19 = swift_release(v16);
  static DispatchQoS.unspecified.getter(v19);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v20 = sub_100002294(&qword_100019528, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v21 = sub_10000AD08(&qword_100019530);
  v22 = sub_10000D3E0();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v21, v22, v7, v20);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v12, v9, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v24);
}

void sub_100003C74(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  NSObject *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  _QWORD *v32;
  uint64_t v33;
  id Strong;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;

  Strong = (id)swift_unknownObjectWeakLoadStrong(a1 + 16);
  if (Strong)
  {
    v5 = objc_msgSend(a2, "currentState");
    if (v5)
    {
      v6 = v5;
      v7 = objc_msgSend(v5, "isRunning");

      if (v7)
      {
        if (qword_1000191E0 != -1)
          swift_once(&qword_1000191E0, sub_1000023D4);
        v8 = type metadata accessor for Logger(0);
        v9 = sub_10000AD90(v8, (uint64_t)qword_1000192E0);
        v10 = Logger.logObject.getter(v9);
        v11 = static os_log_type_t.default.getter();
        if (!os_log_type_enabled(v10, v11))
        {

          return;
        }
        v12 = (uint8_t *)swift_slowAlloc(12, -1);
        v13 = swift_slowAlloc(32, -1);
        v36 = v13;
        *(_DWORD *)v12 = 136315138;
        v35 = sub_10000AFCC(0xD000000000000016, 0x80000001000123A0, (uint64_t *)&v36);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36, v12 + 4, v12 + 12);
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "#sirireaderd %s is running", v12, 0xCu);
        swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v13, -1, -1);
        swift_slowDealloc(v12, -1, -1);

        goto LABEL_25;
      }
    }
    if (qword_1000191E0 != -1)
      swift_once(&qword_1000191E0, sub_1000023D4);
    v14 = type metadata accessor for Logger(0);
    v15 = sub_10000AD90(v14, (uint64_t)qword_1000192E0);
    v16 = Logger.logObject.getter(v15);
    v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc(12, -1);
      v19 = swift_slowAlloc(32, -1);
      v36 = v19;
      *(_DWORD *)v18 = 136315138;
      v35 = sub_10000AFCC(0xD000000000000016, 0x80000001000123A0, (uint64_t *)&v36);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36, v18 + 4, v18 + 12);
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "#sirireaderd %s stopped running", v18, 0xCu);
      swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v19, -1, -1);
      swift_slowDealloc(v18, -1, -1);
    }

    v20 = objc_msgSend(a3, "exitEvent");
    if (v20)
    {
      v21 = v20;
      v22 = objc_msgSend(v20, "context");

      if (v22)
      {
        v23 = objc_msgSend(v22, "status");

        if (v23)
        {
          v24 = objc_msgSend(v23, "isJetsam");
          if ((_DWORD)v24)
          {
            v25 = Logger.logObject.getter(v24);
            v26 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v25, v26))
            {
              v27 = (uint8_t *)swift_slowAlloc(2, -1);
              *(_WORD *)v27 = 0;
              _os_log_impl((void *)&_mh_execute_header, v25, v26, "#sirireaderd exitStatus is jetsam, don't tear down", v27, 2u);
              swift_slowDealloc(v27, -1, -1);

            }
            else
            {

            }
            goto LABEL_25;
          }
          v28 = v23;
          v29 = Logger.logObject.getter(v28);
          v30 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v29, v30))
          {
            v31 = (uint8_t *)swift_slowAlloc(12, -1);
            v32 = (_QWORD *)swift_slowAlloc(8, -1);
            *(_DWORD *)v31 = 138412290;
            v36 = v28;
            v28 = v28;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v31 + 4, v31 + 12);
            *v32 = v23;

            _os_log_impl((void *)&_mh_execute_header, v29, v30, "#sirireaderd exitStatus: %@", v31, 0xCu);
            v33 = sub_10000AD08(&qword_1000194B0);
            swift_arrayDestroy(v32, 1, v33);
            swift_slowDealloc(v32, -1, -1);
            swift_slowDealloc(v31, -1, -1);
          }
          else
          {

            v29 = v28;
          }

        }
      }
    }
    sub_1000046DC();
LABEL_25:

  }
}

uint64_t sub_1000041B8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

void sub_1000041E4(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7;
  void (*v8)(id, id, id);
  id v9;
  id v10;
  id v11;

  v8 = *(void (**)(id, id, id))(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  swift_retain(v7);
  v11 = a2;
  v9 = a3;
  v10 = a4;
  v8(v11, v9, v10);
  swift_release(v7);

}

uint64_t sub_10000426C(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain(a2);
  v3(a2);
  return swift_unknownObjectRelease(a2);
}

void sub_1000042A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  unsigned int v7;
  id v8;
  id v9;
  unsigned int v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  char *v36;
  id v37;
  id v38;
  uint64_t v39;

  v1 = v0;
  v2 = type metadata accessor for UUID(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend((id)objc_opt_self(AVAudioSession), "sharedInstance");
  v38 = 0;
  v7 = objc_msgSend(v6, "setCategory:mode:options:error:", AVAudioSessionCategoryPlayback, AVAudioSessionModeSpokenAudio, 0, &v38);
  v8 = v38;
  if (v7
    && (v38 = 0,
        v9 = v8,
        v10 = objc_msgSend(v6, "setActive:error:", 1, &v38),
        v8 = v38,
        v10))
  {
    v11 = qword_1000191E0;
    v12 = v38;
    if (v11 != -1)
      swift_once(&qword_1000191E0, sub_1000023D4);
    v13 = type metadata accessor for Logger(0);
    v14 = sub_10000AD90(v13, (uint64_t)qword_1000192E0);
    v15 = Logger.logObject.getter(v14);
    v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "#sirireaderd Successfully set up audioSession", v17, 2u);
      swift_slowDealloc(v17, -1, -1);
    }

    *(_BYTE *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isSessionActive) = 1;
  }
  else
  {
    v18 = v8;
    v19 = _convertNSErrorToError(_:)(v8);

    swift_willThrow();
    if (qword_1000191E0 != -1)
      swift_once(&qword_1000191E0, sub_1000023D4);
    v20 = type metadata accessor for Logger(0);
    sub_10000AD90(v20, (uint64_t)qword_1000192E0);
    swift_errorRetain(v19);
    v21 = swift_errorRetain(v19);
    v22 = Logger.logObject.getter(v21);
    v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc(12, -1);
      v25 = swift_slowAlloc(8, -1);
      v37 = v6;
      v35 = (_QWORD *)v25;
      v36 = v5;
      *(_DWORD *)v24 = 138412290;
      swift_errorRetain(v19);
      v26 = v3;
      v27 = v2;
      v28 = v1;
      v29 = (void *)_swift_stdlib_bridgeErrorToNSError(v19);
      v38 = v29;
      v5 = v36;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39, v24 + 4, v24 + 12);
      v30 = v35;
      *v35 = v29;
      v1 = v28;
      v2 = v27;
      v3 = v26;
      swift_errorRelease(v19);
      swift_errorRelease(v19);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "#sirireaderd Failed setting up audioSession: %@", v24, 0xCu);
      v31 = sub_10000AD08(&qword_1000194B0);
      swift_arrayDestroy(v30, 1, v31);
      v6 = v37;
      swift_slowDealloc(v30, -1, -1);
      swift_slowDealloc(v24, -1, -1);
    }
    else
    {
      swift_errorRelease(v19);
      swift_errorRelease(v19);
    }

    v32 = *(_QWORD *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID);
    v33 = *(_QWORD *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
    swift_bridgeObjectRetain(v33);
    sub_10000A390((uint64_t)v5);
    sub_10000E8F8(v32, v33, (uint64_t)v5, 0);
    swift_bridgeObjectRelease(v33);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v34 = v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentContextId;
    sub_10000D470(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentContextId, &qword_100019468);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v34, 1, 1, v2);
    swift_errorRelease(v19);

  }
}

void sub_1000046DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  unsigned int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  id v37;
  id v38;
  uint64_t v39;

  v1 = v0;
  v2 = type metadata accessor for UUID(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend((id)objc_opt_self(AVAudioSession), "sharedInstance");
  v38 = 0;
  v7 = objc_msgSend(v6, "setActive:error:", 0, &v38);
  v8 = v38;
  if (v7)
  {
    v9 = *(_QWORD *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID);
    v10 = *(_QWORD *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
    swift_bridgeObjectRetain(v10);
    v11 = v8;
    sub_10000A390((uint64_t)v5);
    sub_10000E5CC(v9, v10, *(float *)&dword_100019308, *(float *)&dword_100019308 + *(float *)&dword_10001930C);
    swift_bridgeObjectRelease(v10);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v12 = v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentContextId;
    sub_10000D470(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentContextId, &qword_100019468);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v12, 1, 1, v2);
    if (qword_1000191E0 != -1)
      swift_once(&qword_1000191E0, sub_1000023D4);
    v13 = type metadata accessor for Logger(0);
    v14 = sub_10000AD90(v13, (uint64_t)qword_1000192E0);
    v15 = Logger.logObject.getter(v14);
    v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "#sirireaderd Successfully tore down audioSession", v17, 2u);
      swift_slowDealloc(v17, -1, -1);
    }

    *(_BYTE *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isSessionActive) = 0;
    sub_10000A260();
    v18 = objc_msgSend((id)objc_opt_self(MPNowPlayingInfoCenter), "defaultCenter");
    objc_msgSend(v18, "setNowPlayingInfo:", 0);

    v6 = v18;
  }
  else
  {
    v19 = v38;
    v20 = _convertNSErrorToError(_:)(v8);

    swift_willThrow();
    if (qword_1000191E0 != -1)
      swift_once(&qword_1000191E0, sub_1000023D4);
    v21 = type metadata accessor for Logger(0);
    sub_10000AD90(v21, (uint64_t)qword_1000192E0);
    swift_errorRetain(v20);
    v22 = swift_errorRetain(v20);
    v23 = Logger.logObject.getter(v22);
    v24 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc(12, -1);
      v26 = swift_slowAlloc(8, -1);
      v37 = v6;
      v35 = (_QWORD *)v26;
      v36 = v1;
      *(_DWORD *)v25 = 138412290;
      swift_errorRetain(v20);
      v27 = v3;
      v28 = v2;
      v29 = (void *)_swift_stdlib_bridgeErrorToNSError(v20);
      v38 = v29;
      v1 = v36;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39, v25 + 4, v25 + 12);
      v30 = v35;
      *v35 = v29;
      v2 = v28;
      v3 = v27;
      swift_errorRelease(v20);
      swift_errorRelease(v20);
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "#sirireaderd Failed tearing down audioSession: %@", v25, 0xCu);
      v31 = sub_10000AD08(&qword_1000194B0);
      swift_arrayDestroy(v30, 1, v31);
      v6 = v37;
      swift_slowDealloc(v30, -1, -1);
      swift_slowDealloc(v25, -1, -1);
    }
    else
    {
      swift_errorRelease(v20);
      swift_errorRelease(v20);
    }

    v32 = *(_QWORD *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID);
    v33 = *(_QWORD *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
    swift_bridgeObjectRetain(v33);
    sub_10000A390((uint64_t)v5);
    sub_10000E8F8(v32, v33, (uint64_t)v5, 1u);
    swift_bridgeObjectRelease(v33);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v34 = v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentContextId;
    sub_10000D470(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentContextId, &qword_100019468);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v34, 1, 1, v2);
    swift_errorRelease(v20);
  }

}

void sub_100004C8C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v6;
  Class isa;
  uint64_t v8;
  char *v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  uint64_t v28;
  uint8_t *v29;
  objc_class *v30;
  os_log_t v31;
  uint64_t v32;
  uint64_t v33;

  v3 = v2;
  v6 = type metadata accessor for UUID(0);
  isa = v6[-1].isa;
  __chkstk_darwin(v6);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (uint64_t *)(v2 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID);
  v11 = *(_QWORD *)(v2 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
  if (v11
    && (*v10 == a1 ? (v12 = v11 == a2) : (v12 = 0),
        v12 || (_stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, *v10, v11, 0) & 1) != 0))
  {
    if (qword_1000191E0 != -1)
      swift_once(&qword_1000191E0, sub_1000023D4);
    v13 = type metadata accessor for Logger(0);
    sub_10000AD90(v13, (uint64_t)qword_1000192E0);
    v14 = swift_bridgeObjectRetain_n(a2, 2);
    v15 = Logger.logObject.getter(v14);
    v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = swift_slowAlloc(12, -1);
      v31 = v6;
      v18 = (uint8_t *)v17;
      v19 = swift_slowAlloc(32, -1);
      v33 = v19;
      v30 = isa;
      *(_DWORD *)v18 = 136315138;
      v29 = v18 + 4;
      swift_bridgeObjectRetain(a2);
      v32 = sub_10000AFCC(a1, a2, &v33);
      isa = v30;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v29, v18 + 12);
      swift_bridgeObjectRelease_n(a2, 3);
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "#sirireaderd received pause command for %s", v18, 0xCu);
      swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v19, -1, -1);
      v20 = v18;
      v6 = v31;
      swift_slowDealloc(v20, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(a2, 2);
    }
    *(CFAbsoluteTime *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_idleTimeTracker) = CFAbsoluteTimeGetCurrent();
    if (qword_1000191E8 != -1)
      swift_once(&qword_1000191E8, sub_100002454);
    objc_msgSend((id)qword_1000192F8, "pause");
    v25 = *v10;
    v26 = v10[1];
    swift_bridgeObjectRetain(v26);
    sub_10000A390((uint64_t)v9);
    objc_msgSend((id)qword_1000192F8, "volume");
    sub_10000F184(v25, v26, 0.0, v27, (uint64_t)v9, 2);
    swift_bridgeObjectRelease(v26);
    (*((void (**)(char *, NSObject *))isa + 1))(v9, v6);
    sub_100009F50();
    *(_BYTE *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying) = 0;
  }
  else
  {
    if (qword_1000191E0 != -1)
      swift_once(&qword_1000191E0, sub_1000023D4);
    v21 = type metadata accessor for Logger(0);
    v22 = sub_10000AD90(v21, (uint64_t)qword_1000192E0);
    v31 = (os_log_t)Logger.logObject.getter(v22);
    v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v31, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, v23, "#sirireaderd received pause command but identifiers did not match", v24, 2u);
      swift_slowDealloc(v24, -1, -1);
    }

  }
}

void sub_100005044(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  BOOL v5;
  float v6;
  uint64_t v7;
  uint64_t v8;
  os_log_type_t v9;
  uint8_t *v10;
  NSObject *oslog;

  v3 = (_QWORD *)(v2 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID);
  v4 = *(_QWORD *)(v2 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
  if (v4
    && (*v3 == a1 ? (v5 = v4 == a2) : (v5 = 0),
        v5 || (_stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, *v3, v4, 0) & 1) != 0))
  {
    v6 = CFAbsoluteTimeGetCurrent() - *(double *)(v2 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_idleTimeTracker);
    *(float *)&dword_10001930C = *(float *)&dword_10001930C + v6;
    sub_100005184();
  }
  else
  {
    if (qword_1000191E0 != -1)
      swift_once(&qword_1000191E0, sub_1000023D4);
    v7 = type metadata accessor for Logger(0);
    v8 = sub_10000AD90(v7, (uint64_t)qword_1000192E0);
    oslog = Logger.logObject.getter(v8);
    v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v9, "#sirireaderd received resume command but identifiers did not match", v10, 2u);
      swift_slowDealloc(v10, -1, -1);
    }

  }
}

void sub_100005184()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  float v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;

  v1 = type metadata accessor for UUID(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000191E8 != -1)
    swift_once(&qword_1000191E8, sub_100002454);
  objc_msgSend((id)qword_1000192F8, "rate");
  if (v5 == 0.0)
  {
    objc_msgSend((id)qword_1000192F8, "play");
    sub_10000A260();
    *(_BYTE *)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying) = 1;
    v6 = *(_QWORD *)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID);
    v7 = *(_QWORD *)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
    swift_bridgeObjectRetain(v7);
    sub_10000A390((uint64_t)v4);
    objc_msgSend((id)qword_1000192F8, "volume");
    sub_10000F184(v6, v7, 0.0, v8, (uint64_t)v4, 4);
    swift_bridgeObjectRelease(v7);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  else
  {
    v9 = *(_QWORD *)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID);
    v10 = *(_QWORD *)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
    swift_bridgeObjectRetain(v10);
    sub_10000A390((uint64_t)v4);
    sub_10000E8F8(v9, v10, (uint64_t)v4, 2u);
    swift_bridgeObjectRelease(v10);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    v11 = v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentContextId;
    sub_10000D470(v11, &qword_100019468);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 56))(v11, 1, 1, v1);
    if (qword_1000191E0 != -1)
      swift_once(&qword_1000191E0, sub_1000023D4);
    v12 = type metadata accessor for Logger(0);
    v13 = sub_10000AD90(v12, (uint64_t)qword_1000192E0);
    v14 = Logger.logObject.getter(v13);
    v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "#sirireaderd playCommand failed due to player rate being non zero", v16, 2u);
      swift_slowDealloc(v16, -1, -1);
    }

  }
}

void sub_1000053EC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v6;
  Class isa;
  uint64_t v8;
  char *v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  uint64_t v28;
  uint8_t *v29;
  objc_class *v30;
  os_log_t v31;
  uint64_t v32;
  uint64_t v33;

  v3 = v2;
  v6 = type metadata accessor for UUID(0);
  isa = v6[-1].isa;
  __chkstk_darwin(v6);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (uint64_t *)(v2 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID);
  v11 = *(_QWORD *)(v2 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
  if (v11
    && (*v10 == a1 ? (v12 = v11 == a2) : (v12 = 0),
        v12 || (_stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, *v10, v11, 0) & 1) != 0))
  {
    if (qword_1000191E0 != -1)
      swift_once(&qword_1000191E0, sub_1000023D4);
    v13 = type metadata accessor for Logger(0);
    sub_10000AD90(v13, (uint64_t)qword_1000192E0);
    v14 = swift_bridgeObjectRetain_n(a2, 2);
    v15 = Logger.logObject.getter(v14);
    v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = swift_slowAlloc(12, -1);
      v31 = v6;
      v18 = (uint8_t *)v17;
      v19 = swift_slowAlloc(32, -1);
      v33 = v19;
      v30 = isa;
      *(_DWORD *)v18 = 136315138;
      v29 = v18 + 4;
      swift_bridgeObjectRetain(a2);
      v32 = sub_10000AFCC(a1, a2, &v33);
      isa = v30;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v29, v18 + 12);
      swift_bridgeObjectRelease_n(a2, 3);
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "#sirireaderd received end media session command for %s", v18, 0xCu);
      swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v19, -1, -1);
      v20 = v18;
      v6 = v31;
      swift_slowDealloc(v20, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(a2, 2);
    }
    if (qword_1000191E8 != -1)
      swift_once(&qword_1000191E8, sub_100002454);
    objc_msgSend((id)qword_1000192F8, "pause");
    v25 = *v10;
    v26 = v10[1];
    swift_bridgeObjectRetain(v26);
    sub_10000A390((uint64_t)v9);
    objc_msgSend((id)qword_1000192F8, "volume");
    sub_10000F184(v25, v26, 0.0, v27, (uint64_t)v9, 2);
    swift_bridgeObjectRelease(v26);
    (*((void (**)(char *, NSObject *))isa + 1))(v9, v6);
    sub_100009F50();
    *(_BYTE *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying) = 0;
    sub_1000046DC();
  }
  else
  {
    if (qword_1000191E0 != -1)
      swift_once(&qword_1000191E0, sub_1000023D4);
    v21 = type metadata accessor for Logger(0);
    v22 = sub_10000AD90(v21, (uint64_t)qword_1000192E0);
    v31 = (os_log_t)Logger.logObject.getter(v22);
    v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v31, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, v23, "#sirireaderd received end media session command but identifiers did not match", v24, 2u);
      swift_slowDealloc(v24, -1, -1);
    }

  }
}

uint64_t sub_100005798(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = a1;
  a4(v6, v8);

  return swift_bridgeObjectRelease(v8);
}

void sub_1000057EC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  NSString v47;
  id v48;
  uint64_t v49;
  Class isa;
  __int128 v51;
  __int128 v52;
  id (*v53)();
  uint64_t v54;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(MPNowPlayingInfoPropertyExternalContentIdentifier);
  v9 = v8;
  v10 = *(_QWORD *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
  if (v10)
  {
    v11 = *(_QWORD *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID);
    *((_QWORD *)&v52 + 1) = &type metadata for String;
    *(_QWORD *)&v51 = v11;
    *((_QWORD *)&v51 + 1) = v10;
  }
  else
  {
    v51 = 0u;
    v52 = 0u;
  }
  v12 = (uint64_t *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_nowPlayingInfo);
  swift_bridgeObjectRetain(v10);
  sub_100005C3C((uint64_t)&v51, v7, v9);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(MPMediaItemPropertyTitle);
  v15 = v14;
  *((_QWORD *)&v52 + 1) = &type metadata for String;
  *(_QWORD *)&v51 = a1;
  *((_QWORD *)&v51 + 1) = a2;
  swift_bridgeObjectRetain(a2);
  sub_100005C3C((uint64_t)&v51, v13, v15);
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(MPMediaItemPropertyArtist);
  *((_QWORD *)&v52 + 1) = &type metadata for String;
  *(_QWORD *)&v51 = 32;
  *((_QWORD *)&v51 + 1) = 0xE100000000000000;
  sub_100005C3C((uint64_t)&v51, v16, v17);
  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(MPNowPlayingInfoPropertyPlaybackProgress);
  *((_QWORD *)&v52 + 1) = &type metadata for Double;
  *(_QWORD *)&v51 = 0;
  sub_100005C3C((uint64_t)&v51, v18, v19);
  v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(MPMediaItemPropertyPlaybackDuration);
  *((_QWORD *)&v52 + 1) = &type metadata for Double;
  *(_QWORD *)&v51 = 0;
  sub_100005C3C((uint64_t)&v51, v20, v21);
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(MPNowPlayingInfoPropertyPlaybackRate);
  v24 = v23;
  if (qword_1000191E8 != -1)
    swift_once(&qword_1000191E8, sub_100002454);
  objc_msgSend((id)qword_1000192F8, "defaultRate");
  *((_QWORD *)&v52 + 1) = &type metadata for Float;
  LODWORD(v51) = v25;
  sub_100005C3C((uint64_t)&v51, v22, v24);
  v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(MPNowPlayingInfoPropertyDefaultPlaybackRate);
  v28 = v27;
  objc_msgSend((id)qword_1000192F8, "defaultRate");
  *((_QWORD *)&v52 + 1) = &type metadata for Float;
  LODWORD(v51) = v29;
  sub_100005C3C((uint64_t)&v51, v26, v28);
  if (a3)
  {
    v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(MPMediaItemPropertyArtwork);
    v32 = v31;
    v33 = a3;
    objc_msgSend(v33, "size");
    v35 = v34;
    v37 = v36;
    v38 = swift_allocObject(&unk_100014BF8, 24, 7);
    *(_QWORD *)(v38 + 16) = v33;
    v39 = objc_allocWithZone((Class)MPMediaItemArtwork);
    v53 = sub_10000D358;
    v54 = v38;
    *(_QWORD *)&v51 = _NSConcreteStackBlock;
    *((_QWORD *)&v51 + 1) = 1107296256;
    *(_QWORD *)&v52 = sub_10000ADA8;
    *((_QWORD *)&v52 + 1) = &unk_100014C10;
    v40 = _Block_copy(&v51);
    v41 = v33;
    v42 = objc_msgSend(v39, "initWithBoundsSize:requestHandler:", v40, v35, v37);
    _Block_release(v40);
    swift_release(v54);
    *((_QWORD *)&v52 + 1) = sub_10000DDA8(0, &qword_1000194A8, MPMediaItemArtwork_ptr);
    *(_QWORD *)&v51 = v42;
    sub_100005C3C((uint64_t)&v51, v30, v32);

  }
  else
  {
    v43 = static String._unconditionallyBridgeFromObjectiveC(_:)(MPMediaItemPropertyArtwork);
    v51 = 0u;
    v52 = 0u;
    sub_100005C3C((uint64_t)&v51, v43, v44);
  }
  v45 = (void *)objc_opt_self(MPNowPlayingInfoCenter);
  v46 = objc_msgSend(v45, "defaultCenter");
  v47 = String._bridgeToObjectiveC()();
  objc_msgSend(v46, "setRepresentedApplicationBundleIdentifier:", v47);

  v48 = objc_msgSend(v45, "defaultCenter");
  v49 = *v12;
  swift_bridgeObjectRetain(v49);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v49);
  objc_msgSend(v48, "setNowPlayingInfo:", isa);

}

uint64_t sub_100005C3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v10;
  _OWORD v11[2];

  v4 = v3;
  if (*(_QWORD *)(a1 + 24))
  {
    sub_10000D1A4((_OWORD *)a1, v11);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v10 = *v3;
    *v3 = 0x8000000000000000;
    sub_10000C004(v11, a2, a3, isUniquelyReferenced_nonNull_native);
    v8 = *v3;
    *v4 = v10;
    swift_bridgeObjectRelease(a3);
    return swift_bridgeObjectRelease(v8);
  }
  else
  {
    sub_10000D470(a1, &qword_100019480);
    sub_10000BA44(a2, a3, v11);
    swift_bridgeObjectRelease(a3);
    return sub_10000D470((uint64_t)v11, &qword_100019480);
  }
}

void sub_100005D10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v3 = v2;
  v6 = type metadata accessor for UUID(0);
  v40 = *(_QWORD *)(v6 - 8);
  v41 = v6;
  __chkstk_darwin(v6);
  v39 = (uint64_t)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for SpeakableStringExtractor.InputType(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for String.Encoding(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(_QWORD *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences) = &_swiftEmptyArrayStorage;
  v17 = swift_bridgeObjectRelease(v16);
  static String.Encoding.utf8.getter(v17);
  v18 = String.data(using:allowLossyConversion:)(v15, 0, a1, a2);
  v20 = v19;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  if (v20 >> 60 == 15)
  {
    if (qword_1000191E0 != -1)
      swift_once(&qword_1000191E0, sub_1000023D4);
    v21 = type metadata accessor for Logger(0);
    v22 = sub_10000AD90(v21, (uint64_t)qword_1000192E0);
    v23 = Logger.logObject.getter(v22);
    v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "#sirireaderd failed to create sentence data from article body", v25, 2u);
      swift_slowDealloc(v25, -1, -1);
    }

    v26 = *(_QWORD *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID);
    v27 = *(_QWORD *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
    swift_bridgeObjectRetain(v27);
    v28 = v39;
    sub_10000A390(v39);
    sub_10000E8F8(v26, v27, v28, 3u);
    swift_bridgeObjectRelease(v27);
    v30 = v40;
    v29 = v41;
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v28, v41);
    v31 = v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentContextId;
    sub_10000D470(v31, &qword_100019468);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 56))(v31, 1, 1, v29);
  }
  else
  {
    v32 = sub_10000C4E4();
    v33 = dispatch thunk of SynthesisVoice.language.getter(v32);
    v35 = v34;
    (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, enum case for SpeakableStringExtractor.InputType.plainText(_:), v8);
    objc_allocWithZone((Class)type metadata accessor for SpeakableStringExtractor(0));
    v36 = sub_10000D290(v18, v20);
    v37 = (void *)SpeakableStringExtractor.init(language:data:inputType:)(v33, v35, v18, v20, v11, v36);
    __chkstk_darwin(v37);
    *(&v38 - 2) = v3;
    dispatch thunk of SpeakableStringExtractor.enumerate(_:)(sub_10000D2D4);
    sub_10000D2DC(v18, v20);

    *(_QWORD *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence) = *(_QWORD *)(v3
                                                                                                  + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_startingSentence);
  }
}

uint64_t sub_100006070(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v9;
  unint64_t v10;
  char *v11;

  v6 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences;
  v7 = *(char **)(a3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences);
  swift_bridgeObjectRetain(a2);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v7);
  *(_QWORD *)(a3 + v6) = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v7 = sub_10000AEA4(0, *((_QWORD *)v7 + 2) + 1, 1, v7);
    *(_QWORD *)(a3 + v6) = v7;
  }
  v10 = *((_QWORD *)v7 + 2);
  v9 = *((_QWORD *)v7 + 3);
  if (v10 >= v9 >> 1)
  {
    v7 = sub_10000AEA4((char *)(v9 > 1), v10 + 1, 1, v7);
    *(_QWORD *)(a3 + v6) = v7;
  }
  *((_QWORD *)v7 + 2) = v10 + 1;
  v11 = &v7[56 * v10];
  *((_QWORD *)v11 + 4) = a1;
  *((_QWORD *)v11 + 5) = a2;
  *((_QWORD *)v11 + 6) = 0;
  v11[56] = 1;
  *((_QWORD *)v11 + 8) = 0;
  *((_WORD *)v11 + 36) = 1;
  *((_QWORD *)v11 + 10) = 0;
  return 1;
}

uint64_t sub_100006154()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)(char *, char *);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __n128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  char isUniquelyReferenced_nonNull_native;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t (*v32)(char *, char *);
  char *v33;
  char *v34;
  __n128 v35;
  uint64_t v36;
  Class v37;
  uint64_t v38;
  char *v39;
  id v40;

  v1 = (char *)type metadata accessor for OSSignpostID(0);
  v2 = *((_QWORD *)v1 - 1);
  __chkstk_darwin(v1);
  v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = sub_10000C4E4();
  v5 = (void *)static os_signpost_type_t.begin.getter();
  if (qword_1000191D8 != -1)
    goto LABEL_15;
  while (1)
  {
    v6 = qword_1000192D8;
    static OSSignpostID.exclusive.getter();
    os_signpost(_:dso:log:name:signpostID:)(v5, &_mh_execute_header, v6, "roughSentenceDurationEstimation", 31, 2, v4);
    v7 = *(uint64_t (**)(char *, char *))(v2 + 8);
    v8 = v7(v4, v1);
    v9 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences;
    v10 = *(_QWORD *)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences);
    v39 = *(char **)(v10 + 16);
    if (!v39)
      break;
    v32 = v7;
    v33 = v4;
    v34 = v1;
    v38 = type metadata accessor for DurationEstimator(0);
    v37 = (Class)type metadata accessor for SynthesisRequest(0);
    v11 = swift_bridgeObjectRetain(v10);
    v12 = 0;
    v4 = 0;
    v11.n128_u64[0] = 134218240;
    v35 = v11;
    v36 = v10;
    while (1)
    {
      v13 = v0;
      v14 = v10 + v12;
      v15 = *(void **)(v10 + v12 + 80);
      v16 = *(_QWORD *)(v10 + v12 + 32);
      v2 = *(_QWORD *)(v14 + 40);
      v17 = objc_allocWithZone(v37);
      v18 = v15;
      v19 = v40;
      swift_bridgeObjectRetain_n(v2, 2);
      v5 = (void *)SynthesisRequest.init(text:voice:)(v16, v2, v19);
      v20 = static DurationEstimator.roughEstimation(request:)();
      if (qword_1000191E0 != -1)
        swift_once(&qword_1000191E0, sub_1000023D4);
      v21 = type metadata accessor for Logger(0);
      v22 = sub_10000AD90(v21, (uint64_t)qword_1000192E0);
      v23 = Logger.logObject.getter(v22);
      v24 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v23, v24))
      {
        v25 = swift_slowAlloc(22, -1);
        *(_DWORD *)v25 = v35.n128_u32[0];
        *(_QWORD *)(v25 + 4) = v4;
        *(_WORD *)(v25 + 12) = 2048;
        *(double *)(v25 + 14) = v20;
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "#sirireaderd estimated duration of sentence %ld is %f", (uint8_t *)v25, 0x16u);
        swift_slowDealloc(v25, -1, -1);
      }

      v0 = v13;
      v1 = *(char **)(v13 + v9);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v1);
      *(_QWORD *)(v13 + v9) = v1;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        v1 = sub_10000C380((uint64_t)v1);
      if ((unint64_t)v4 >= *((_QWORD *)v1 + 2))
        break;
      v27 = &v1[v12];
      *((double *)v27 + 6) = v20;
      ++v4;
      v27[56] = 0;
      *(_QWORD *)(v13 + v9) = v1;

      swift_bridgeObjectRelease(v2);
      v12 += 56;
      v10 = v36;
      if (v39 == v4)
      {
        v8 = swift_bridgeObjectRelease(v36);
        v4 = v33;
        v1 = v34;
        v7 = v32;
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_15:
    swift_once(&qword_1000191D8, sub_10000238C);
  }
LABEL_13:
  v28 = static os_signpost_type_t.end.getter(v8);
  v29 = qword_1000192D8;
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)(v28, &_mh_execute_header, v29, "roughSentenceDurationEstimation", 31, 2, v4);

  return v7(v4, v1);
}

uint64_t sub_1000064A0(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  double v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences);
  v3 = 0.0;
  if (*(_QWORD *)(v2 + 16) > result)
  {
    if (result < 0)
    {
LABEL_15:
      __break(1u);
      return result;
    }
    if (result)
    {
      v4 = (_BYTE *)(v2 + 72);
      v5 = 1 - result;
      do
      {
        if (*v4 == 1 && (*(v4 - 16) & 1) != 0)
        {
          v3 = v3 + 0.0;
          if (!v5)
            return result;
        }
        else
        {
          if (*v4)
            v6 = -24;
          else
            v6 = -8;
          v3 = v3 + *(double *)&v4[v6];
          if (!v5)
            return result;
        }
        v4 += 56;
        ++v5;
      }
      while (v5 != 1);
      __break(1u);
      goto LABEL_15;
    }
  }
  return result;
}

double sub_10000652C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  double result;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = (_BYTE *)(v1 + 72);
    v4 = 1;
    result = 0.0;
    do
    {
      if (*v3 == 1 && (*(v3 - 16) & 1) != 0)
      {
        result = result + 0.0;
        if (v2 == v4)
          return result;
      }
      else
      {
        if (*v3)
          v6 = -24;
        else
          v6 = -8;
        result = result + *(double *)&v3[v6];
        if (v2 == v4)
          return result;
      }
      v3 += 56;
    }
    while (!__OFADD__(v4++, 1));
    __break(1u);
  }
  return 0.0;
}

double sub_1000065B0(double result)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  double *v5;
  double v6;
  double v7;
  unint64_t v8;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences);
  v3 = *(_QWORD *)(v2 + 16);
  v4 = -1;
  if (v3 && result >= 0.0)
  {
    v5 = (double *)(v2 + 72);
    v6 = 0.0;
    do
    {
      if ((*(_BYTE *)v5 & 1) != 0)
      {
        v7 = *(v5 - 3);
        if (*((_BYTE *)v5 - 16))
          v7 = 0.0;
      }
      else
      {
        v7 = *(v5 - 1);
      }
      v8 = v4 + 2;
      ++v4;
      if (v8 >= v3)
        break;
      v6 = v6 + v7;
      v5 += 7;
    }
    while (v6 <= result);
  }
  return result;
}

void sub_100006620()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  float v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence);
  sub_100006B84(v1);
  if (__OFADD__(v1, 1))
  {
LABEL_17:
    __break(1u);
  }
  else
  {
    v2 = 56 * v1;
    v3 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences;
    v4 = v1 + 1;
    v5 = 0.0;
    while (1)
    {
      if (qword_1000191E8 != -1)
        swift_once(&qword_1000191E8, sub_100002454);
      objc_msgSend((id)qword_1000192F8, "defaultRate");
      if (v5 >= (float)(v7 * 15.0) || v4 >= *(_QWORD *)(*(_QWORD *)(v0 + v3) + 16))
        break;
      sub_100006B84(v4);
      if (v1 + 1 < 0)
      {
        __break(1u);
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
      v8 = *(_QWORD *)(v0 + v3);
      if ((unint64_t)v4 >= *(_QWORD *)(v8 + 16))
        goto LABEL_16;
      v9 = v8 + v2;
      if ((*(_BYTE *)(v9 + 128) & 1) != 0)
      {
        v6 = *(double *)(v9 + 104);
        if (*(_BYTE *)(v9 + 112))
          v6 = 0.0;
      }
      else
      {
        v6 = *(double *)(v9 + 120);
      }
      v5 = v5 + v6;
      ++v4;
      v2 += 56;
    }
  }
}

void sub_100006764()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t (**v10)();
  uint64_t (**v11)();
  uint64_t v12;
  uint64_t v13;
  uint64_t (**v14)();
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t (*v20)();
  NSObject *v21;
  uint64_t (*v22)();
  char *v23;
  char isUniquelyReferenced_nonNull_native;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;

  v1 = v0;
  if (qword_1000191E0 != -1)
    goto LABEL_21;
  while (1)
  {
    v2 = type metadata accessor for Logger(0);
    v29 = sub_10000AD90(v2, (uint64_t)qword_1000192E0);
    v3 = Logger.logObject.getter(v29);
    v4 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "#sirireaderd Canceling all TTS requests", v5, 2u);
      swift_slowDealloc(v5, -1, -1);
    }

    v6 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences;
    v7 = *(_QWORD *)(*(_QWORD *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences) + 16);
    if (!v7)
      break;
    v8 = 0;
    v9 = 80;
    v10 = &off_100019000;
    v11 = &off_100019000;
    while (1)
    {
      v18 = *(_QWORD *)(v1 + v6);
      if (v8 >= *(_QWORD *)(v18 + 16))
        break;
      v19 = *(void **)(v18 + v9);
      if (v19)
      {
        v20 = v10[62];
        v21 = v19;
        if (v20 != (uint64_t (*)())-1)
          swift_once(&qword_1000191F0, sub_100002484);
        v22 = v11[96];
        dispatch thunk of DaemonSession.cancel(request:)(v21);

        v23 = *(char **)(v1 + v6);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v23);
        *(_QWORD *)(v1 + v6) = v23;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v23 = sub_10000C380((uint64_t)v23);
          *(_QWORD *)(v1 + v6) = v23;
        }
        if (v8 >= *((_QWORD *)v23 + 2))
          goto LABEL_20;
        v25 = *(void **)&v23[v9];
        *(_QWORD *)&v23[v9] = 0;

        v27 = Logger.logObject.getter(v26);
        v28 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v27, v28))
        {
          v12 = v6;
          v13 = v1;
          v14 = v10;
          v15 = swift_slowAlloc(12, -1);
          *(_DWORD *)v15 = 134217984;
          *(_QWORD *)(v15 + 4) = v8;
          _os_log_impl((void *)&_mh_execute_header, v27, v28, "#sirireaderd Canceled TTS generation for sentence %ld", (uint8_t *)v15, 0xCu);
          v16 = v15;
          v10 = v14;
          v1 = v13;
          v6 = v12;
          v11 = &off_100019000;
          swift_slowDealloc(v16, -1, -1);
          v17 = v21;
        }
        else
        {
          v17 = v27;
          v27 = v21;
        }

      }
      ++v8;
      v9 += 56;
      if (v7 == v8)
        return;
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    swift_once(&qword_1000191E0, sub_1000023D4);
  }
}

void sub_1000069E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;

  *(_BYTE *)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying) = 0;
  if (qword_1000191E0 != -1)
    swift_once(&qword_1000191E0, sub_1000023D4);
  v1 = type metadata accessor for Logger(0);
  v2 = sub_10000AD90(v1, (uint64_t)qword_1000192E0);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "#sirireaderd Pausing player and calling removeAllItems", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

  if (qword_1000191E8 != -1)
    swift_once(&qword_1000191E8, sub_100002454);
  objc_msgSend((id)qword_1000192F8, "pause");
  v6 = Logger.logObject.getter(objc_msgSend((id)qword_1000192F8, "removeAllItems"));
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "#sirireaderd Buffering the first sentences", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  sub_100006620();
}

void sub_100006B84(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  os_log_type_t v21;
  uint8_t *v22;
  NSObject *v23;
  id v24;
  void *v25;
  os_log_t v26;
  void *v27;
  Swift::String v28;
  Swift::String v29;
  Swift::String v30;
  void *object;
  Swift::String v32;
  void *v33;
  unint64_t v34;
  Swift::String v35;
  unint64_t v36;
  id v37;
  id v38;
  void *v39;
  os_log_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  os_log_t v62;
  uint64_t v63;
  uint64_t v64;
  os_log_type_t v65;
  uint8_t *v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  char *v71;
  id v72;
  char isUniquelyReferenced_nonNull_native;
  char *v74;
  void *v75;
  uint64_t v76;
  os_log_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
  NSObject *v85;
  os_log_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10000AD08(&qword_100019498);
  __chkstk_darwin(v7);
  v9 = (char *)&v76 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for URL(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v86 = (os_log_t)((char *)&v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = sub_10000AD08(&qword_100019468);
  __chkstk_darwin(v13);
  v15 = (char *)&v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences;
  v17 = *(_QWORD *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences);
  if (*(_QWORD *)(v17 + 16) > a1)
  {
    if (a1 < 0)
    {
      __break(1u);
LABEL_30:
      swift_once(&qword_1000191E0, sub_1000023D4);
LABEL_5:
      v20 = sub_10000AD90(v3, (uint64_t)qword_1000192E0);
      v86 = (os_log_t)Logger.logObject.getter(v20);
      v21 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v86, v21))
      {
        v22 = (uint8_t *)swift_slowAlloc(12, -1);
        *(_DWORD *)v22 = 134217984;
        v88 = a1;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v88, &v89, v22 + 4, v22 + 12);
        _os_log_impl((void *)&_mh_execute_header, v86, v21, "#sirireaderd Sentence %ld has already been generated, not doing generation", v22, 0xCu);
        swift_slowDealloc(v22, -1, -1);

        return;
      }
      goto LABEL_19;
    }
    v18 = v17 + 32;
    v19 = v17 + 32 + 56 * a1;
    if (*(_BYTE *)(v19 + 41) == 3)
    {
      if (qword_1000191E0 == -1)
        goto LABEL_5;
      goto LABEL_30;
    }
    if (!*(_QWORD *)(v18 + 56 * a1 + 48))
    {
      v23 = *(NSObject **)(v19 + 8);
      v81 = *(_QWORD *)v19;
      v85 = v23;
      swift_bridgeObjectRetain(v23);
      v24 = sub_10000C4E4();
      v25 = *(void **)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
      v84 = v24;
      if (v25)
      {
        v78 = v4;
        v79 = v16;
        v80 = v1;
        v77 = *(os_log_t *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID);
        v26 = v77;
        v88 = 0x6E7568435354542FLL;
        v89 = 0xEA00000000002D6BLL;
        v27 = v25;
        swift_bridgeObjectRetain(v25);
        v82 = v11;
        v28._countAndFlagsBits = (uint64_t)v26;
        v28._object = v27;
        String.append(_:)(v28);
        v29._countAndFlagsBits = 45;
        v29._object = (void *)0xE100000000000000;
        String.append(_:)(v29);
        v87 = a1;
        v30._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
        v83 = v10;
        object = v30._object;
        String.append(_:)(v30);
        swift_bridgeObjectRelease(object);
        v32._countAndFlagsBits = v88;
        v33 = (void *)v89;
        v88 = 0xD00000000000001ALL;
        v89 = 0x80000001000120C0;
        v32._object = v33;
        String.append(_:)(v32);
        swift_bridgeObjectRelease(v33);
        v34 = v89;
        swift_bridgeObjectRetain(v89);
        v35._countAndFlagsBits = 1717658414;
        v35._object = (void *)0xE400000000000000;
        String.append(_:)(v35);
        swift_bridgeObjectRelease(v34);
        v36 = v89;
        v76 = v88;
        v37 = objc_allocWithZone((Class)type metadata accessor for SynthesisRequest(0));
        v38 = v84;
        v39 = (void *)SynthesisRequest.init(text:voice:)(v81, v85, v38);
        UUID.init(uuidString:)(v77, v27);
        swift_bridgeObjectRelease(v27);
        dispatch thunk of BaseRequest.logLinkId.setter(v15);
        v40 = v86;
        URL.init(fileURLWithPath:)(v76, v36);
        v41 = v36;
        v42 = v83;
        swift_bridgeObjectRelease(v41);
        v43 = v82;
        (*(void (**)(char *, os_log_t, uint64_t))(v82 + 16))(v9, v40, v42);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v43 + 56))(v9, 0, 1, v42);
        v44 = v39;
        dispatch thunk of BaseRequest.outputPath.setter(v9);

        if (qword_1000191E0 != -1)
          swift_once(&qword_1000191E0, sub_1000023D4);
        v45 = sub_10000AD90(v3, (uint64_t)qword_1000192E0);
        v46 = v78;
        (*(void (**)(char *, uint64_t, uint64_t))(v78 + 16))(v6, v45, v3);
        v85 = v38;
        v47 = Logger.logObject.getter(v85);
        v48 = static os_log_type_t.default.getter();
        v49 = v48;
        if (os_log_type_enabled(v47, v48))
        {
          v50 = swift_slowAlloc(32, -1);
          v84 = v44;
          v51 = v50;
          v52 = swift_slowAlloc(64, -1);
          v87 = a1;
          v88 = v52;
          *(_DWORD *)v51 = 134218498;
          v53 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, &v88, v51 + 4, v51 + 12);
          *(_WORD *)(v51 + 12) = 2080;
          v77 = v47;
          v54 = v85;
          LODWORD(v81) = v49;
          v55 = dispatch thunk of SynthesisVoice.language.getter(v53);
          v57 = v56;
          v87 = sub_10000AFCC(v55, v56, &v88);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, &v88, v51 + 14, v51 + 22);

          v58 = swift_bridgeObjectRelease(v57);
          *(_WORD *)(v51 + 22) = 2080;
          v59 = dispatch thunk of SynthesisVoice.name.getter(v58);
          if (v60)
          {
            v61 = v60;
          }
          else
          {
            v59 = 0x656D616E206C696ELL;
            v61 = 0xE800000000000000;
          }
          v87 = sub_10000AFCC(v59, v61, &v88);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, &v88, v51 + 24, v51 + 32);

          swift_bridgeObjectRelease(v61);
          v62 = v77;
          _os_log_impl((void *)&_mh_execute_header, v77, (os_log_type_t)v81, "#sirireaderd synthesizing sentence %ld with voice: %s named %s", (uint8_t *)v51, 0x20u);
          swift_arrayDestroy(v52, 2, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v52, -1, -1);
          v63 = v51;
          v44 = v84;
          swift_slowDealloc(v63, -1, -1);
        }
        else
        {

          v62 = v85;
        }

        (*(void (**)(char *, uint64_t))(v46 + 8))(v6, v3);
        v67 = v80;
        v68 = swift_allocObject(&unk_100014A90, 24, 7);
        swift_unknownObjectWeakInit(v68 + 16, v67);
        v3 = swift_allocObject(&unk_100014BD0, 32, 7);
        *(_QWORD *)(v3 + 16) = v68;
        *(_QWORD *)(v3 + 24) = a1;
        if (qword_1000191F0 != -1)
          swift_once(&qword_1000191F0, sub_100002484);
        v69 = (id)qword_100019300;
        dispatch thunk of DaemonSession.synthesize(request:didFinish:)(v44, sub_10000D288, v3);

        v70 = v79;
        v71 = *(char **)(v67 + v79);
        v72 = v44;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v71);
        *(_QWORD *)(v67 + v70) = v71;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v71 = sub_10000C380((uint64_t)v71);
          *(_QWORD *)(v67 + v70) = v71;
        }
        if (*((_QWORD *)v71 + 2) > (unint64_t)a1)
        {
          v74 = &v71[56 * a1];
          v75 = (void *)*((_QWORD *)v74 + 10);
          *((_QWORD *)v74 + 10) = v72;

          swift_release(v3);
          (*(void (**)(os_log_t, uint64_t))(v82 + 8))(v86, v83);
          return;
        }
        __break(1u);
      }
      else
      {
        swift_bridgeObjectRelease(v85);
        if (qword_1000191E0 == -1)
        {
LABEL_17:
          v64 = sub_10000AD90(v3, (uint64_t)qword_1000192E0);
          v86 = (os_log_t)Logger.logObject.getter(v64);
          v65 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v86, v65))
          {
            v66 = (uint8_t *)swift_slowAlloc(2, -1);
            *(_WORD *)v66 = 0;
            _os_log_impl((void *)&_mh_execute_header, v86, v65, "#sirireaderd No currently playing UUID", v66, 2u);
            swift_slowDealloc(v66, -1, -1);

LABEL_19:
            return;
          }

          return;
        }
      }
      swift_once(&qword_1000191E0, sub_1000023D4);
      goto LABEL_17;
    }
  }
}

void sub_1000073B4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t (**v5)();
  uint64_t v7;
  os_log_type_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t Strong;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  _QWORD v25[3];
  _BYTE v26[8];
  uint64_t v27;

  v4 = a2 + 16;
  v5 = &off_100019000;
  if (a1)
  {
    swift_errorRetain(a1);
    if (qword_1000191E0 != -1)
      swift_once(&qword_1000191E0, sub_1000023D4);
    v7 = type metadata accessor for Logger(0);
    sub_10000AD90(v7, (uint64_t)qword_1000192E0);
    v8 = static os_log_type_t.error.getter();
    swift_errorRetain(a1);
    v9 = swift_errorRetain(a1);
    v10 = Logger.logObject.getter(v9);
    v11 = v8;
    if (os_log_type_enabled(v10, v8))
    {
      v12 = (uint8_t *)swift_slowAlloc(12, -1);
      v13 = swift_slowAlloc(32, -1);
      v27 = v13;
      *(_DWORD *)v12 = 136315138;
      swift_getErrorValue(a1, v26, v25);
      v14 = Error.localizedDescription.getter(v25[1], v25[2]);
      v16 = v15;
      v24 = sub_10000AFCC(v14, v15, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, v25, v12 + 4, v12 + 12);
      swift_bridgeObjectRelease(v16);
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "#sirireaderd %s", v12, 0xCu);
      swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
      v17 = v13;
      v5 = &off_100019000;
      swift_slowDealloc(v17, -1, -1);
      swift_slowDealloc(v12, -1, -1);

      swift_errorRelease(a1);
    }
    else
    {
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      swift_errorRelease(a1);

    }
  }
  Strong = swift_unknownObjectWeakLoadStrong(v4);
  if (Strong)
  {
    v19 = Strong;
    sub_100007660(a3);
  }
  else
  {
    if (v5[60] != (uint64_t (*)())-1)
      swift_once(&qword_1000191E0, sub_1000023D4);
    v20 = type metadata accessor for Logger(0);
    v21 = sub_10000AD90(v20, (uint64_t)qword_1000192E0);
    v19 = Logger.logObject.getter(v21);
    v22 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v19, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v22, "#sirireaderd unexpectedly found nil self", v23, 2u);
      swift_slowDealloc(v23, -1, -1);
    }
  }

}

void sub_100007660(unint64_t a1)
{
  uint64_t v1;
  uint8_t *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  char isUniquelyReferenced_nonNull_native;
  NSObject *v11;
  Class isa;
  _BOOL4 v13;
  unint64_t v14;
  uint64_t v15;

  v3 = v1;
  if (qword_1000191E0 != -1)
    swift_once(&qword_1000191E0, sub_1000023D4);
  v5 = type metadata accessor for Logger(0);
  v6 = sub_10000AD90(v5, (uint64_t)qword_1000192E0);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  v9 = v8;
  if (os_log_type_enabled(v7, v8))
  {
    v2 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v2 = 134217984;
    v14 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15, v2 + 4, v2 + 12);
    _os_log_impl((void *)&_mh_execute_header, v7, (os_log_type_t)v9, "#sirireaderd Generation completed for sentence: %ld", v2, 0xCu);
    swift_slowDealloc(v2, -1, -1);
  }

  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v2 = (uint8_t *)OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences;
    v7 = *(NSObject **)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences);
    if (v7[2].isa > (Class)a1)
    {
      v9 = BYTE1(v7[7 * a1 + 9].isa);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*(_QWORD *)(v3
                                                                                                + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences));
      *(_QWORD *)&v2[v3] = v7;
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        goto LABEL_8;
      goto LABEL_18;
    }
  }
  __break(1u);
LABEL_18:
  v7 = sub_10000C380((uint64_t)v7);
LABEL_8:
  if (v7[2].isa <= (Class)a1)
  {
    __break(1u);
    return;
  }
  v11 = &v7[7 * a1];
  BYTE1(v11[9].isa) = 3;
  *(_QWORD *)&v2[v3] = v7;
  isa = v11[10].isa;
  v11[10].isa = 0;

  if (*(_QWORD *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_startingSentence) == a1
    && *(_BYTE *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlayingStartingTone) != 1)
  {
    v13 = 1;
  }
  else
  {
    if ((v9 - 1) > 1)
      return;
    v13 = v9 == 1;
  }
  sub_10000783C(a1, v13);
}

uint64_t sub_10000783C(unint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint8_t *v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  os_log_type_t v30;
  _BOOL4 v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  Swift::String v36;
  Swift::String v37;
  Swift::String v38;
  void *object;
  Swift::String v40;
  void *v41;
  unint64_t v42;
  Swift::String v43;
  unint64_t v44;
  id v45;
  NSURL *v46;
  void *v47;
  void *v48;
  id v49;
  NSString v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  id v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  float v59;
  float v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  os_log_type_t v64;
  uint8_t *v65;
  uint64_t result;
  uint8_t *v67;
  char *v68;
  char isUniquelyReferenced_nonNull_native;
  id v70;
  NSString v71;
  id v72;
  NSString v73;
  NSObject *v74;
  os_log_type_t v75;
  uint8_t *v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;

  v3 = v2;
  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v77 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for URL(0);
  v11 = __chkstk_darwin(v10);
  v14 = (uint64_t)&v77 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences;
  if (*(_QWORD *)(*(_QWORD *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences) + 16) <= (int64_t)a1)
  {
    if (qword_1000191E0 == -1)
    {
LABEL_23:
      v61 = type metadata accessor for Logger(0);
      v62 = sub_10000AD90(v61, (uint64_t)qword_1000192E0);
      v63 = Logger.logObject.getter(v62);
      v64 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v63, v64))
      {
        v65 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v65 = 0;
        _os_log_impl((void *)&_mh_execute_header, v63, v64, "#sirireaderd Playback complete, resetting to beginning of content", v65, 2u);
        swift_slowDealloc(v65, -1, -1);
      }

      *(_QWORD *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence) = 0;
      if (qword_1000191E8 != -1)
        swift_once(&qword_1000191E8, sub_100002454);
      objc_msgSend((id)qword_1000192F8, "removeAllItems");
      sub_1000046DC();
      return 0;
    }
LABEL_48:
    swift_once(&qword_1000191E0, sub_1000023D4);
    goto LABEL_23;
  }
  v83 = a2;
  v80 = v6;
  v81 = v12;
  v82 = v11;
  if (qword_1000191E0 != -1)
    swift_once(&qword_1000191E0, sub_1000023D4);
  v16 = type metadata accessor for Logger(0);
  v17 = sub_10000AD90(v16, (uint64_t)qword_1000192E0);
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.default.getter();
  v20 = os_log_type_enabled(v18, v19);
  v79 = v7;
  if (v20)
  {
    v21 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v21 = 134217984;
    v85 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, &v86, v21 + 4, v21 + 12);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "#sirireaderd Updating playback duration and position for sentence: %ld", v21, 0xCu);
    swift_slowDealloc(v21, -1, -1);
  }

  sub_100008204(a1);
  v23 = Logger.logObject.getter(v22);
  v24 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v25 = 134217984;
    v85 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, &v86, v25 + 4, v25 + 12);
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "#sirireaderd Attempting to add sentence to play queue: %ld", v25, 0xCu);
    swift_slowDealloc(v25, -1, -1);
  }

  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_47;
  }
  v27 = *(_QWORD *)(v3 + v15);
  if (*(_QWORD *)(v27 + 16) <= a1)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  v28 = *(unsigned __int8 *)(v27 + 56 * a1 + 73);
  v29 = Logger.logObject.getter(v26);
  v30 = static os_log_type_t.default.getter();
  v31 = os_log_type_enabled(v29, v30);
  if (v28 == 3)
  {
    if (v31)
    {
      v32 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v32 = 134217984;
      v85 = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, &v86, v32 + 4, v32 + 12);
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "#sirireaderd Validated sentence has been generated: %ld", v32, 0xCu);
      swift_slowDealloc(v32, -1, -1);
    }

    v34 = *(_QWORD *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8);
    if (v34)
    {
      v35 = *(_QWORD *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID);
      v85 = 0x6E7568435354542FLL;
      v86 = 0xEA00000000002D6BLL;
      swift_bridgeObjectRetain(v34);
      v77 = v35;
      v36._countAndFlagsBits = v35;
      v36._object = (void *)v34;
      String.append(_:)(v36);
      v37._countAndFlagsBits = 45;
      v37._object = (void *)0xE100000000000000;
      String.append(_:)(v37);
      v84 = a1;
      v38._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
      object = v38._object;
      String.append(_:)(v38);
      swift_bridgeObjectRelease(object);
      v40._countAndFlagsBits = v85;
      v41 = (void *)v86;
      v85 = 0xD00000000000001ALL;
      v86 = 0x80000001000120C0;
      v40._object = v41;
      String.append(_:)(v40);
      swift_bridgeObjectRelease(v41);
      v42 = v86;
      swift_bridgeObjectRetain(v86);
      v43._countAndFlagsBits = 1717658414;
      v43._object = (void *)0xE400000000000000;
      String.append(_:)(v43);
      swift_bridgeObjectRelease(v42);
      v44 = v86;
      URL.init(fileURLWithPath:)(v85, v86);
      swift_bridgeObjectRelease(v44);
      v45 = objc_allocWithZone((Class)AVPlayerItem);
      URL._bridgeToObjectiveC()(v46);
      v48 = v47;
      v49 = objc_msgSend(v45, "initWithURL:", v47);

      v50 = String._bridgeToObjectiveC()();
      v78 = v49;
      objc_msgSend(v49, "addObserver:forKeyPath:options:context:", v3, v50, 3, 0);

      v52 = Logger.logObject.getter(v51);
      v53 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v52, v53))
      {
        v54 = (uint8_t *)swift_slowAlloc(12, -1);
        *(_DWORD *)v54 = 134217984;
        v85 = a1;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, &v86, v54 + 4, v54 + 12);
        _os_log_impl((void *)&_mh_execute_header, v52, v53, "#sirireaderd Adding sentence to play queue: %ld", v54, 0xCu);
        swift_slowDealloc(v54, -1, -1);
      }

      if (qword_1000191E8 == -1)
        goto LABEL_17;
      goto LABEL_50;
    }
    v74 = Logger.logObject.getter(v33);
    v75 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v74, v75))
    {
      v76 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v76 = 0;
      _os_log_impl((void *)&_mh_execute_header, v74, v75, "#sirireaderd No currently playing UUID", v76, 2u);
      swift_slowDealloc(v76, -1, -1);
    }

    return 0;
  }
  if (v31)
  {
    v14 = 12;
    v67 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v67 = 134217984;
    v85 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, &v86, v67 + 4, v67 + 12);
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "#sirireaderd Sentence %ld has not been generated, will begin playback once generation is complete.", v67, 0xCu);
    swift_slowDealloc(v67, -1, -1);
  }

  if ((v83 & 1) != 0)
    v34 = 1;
  else
    v34 = 2;
  v68 = *(char **)(v3 + v15);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v68);
  *(_QWORD *)(v3 + v15) = v68;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    v68 = sub_10000C380((uint64_t)v68);
  if (*((_QWORD *)v68 + 2) > a1)
  {
    result = 0;
    v68[56 * a1 + 73] = v34;
    *(_QWORD *)(v3 + v15) = v68;
    return result;
  }
  __break(1u);
LABEL_50:
  swift_once(&qword_1000191E8, sub_100002454);
LABEL_17:
  v55 = objc_msgSend((id)qword_1000192F8, "insertItem:afterItem:", v78, 0);
  if ((v83 & 1) == 0)
    goto LABEL_38;
  v56 = Logger.logObject.getter(v55);
  v57 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v56, v57))
  {
    v58 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v58 = 134217984;
    v85 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, &v86, v58 + 4, v58 + 12);
    _os_log_impl((void *)&_mh_execute_header, v56, v57, "#sirireaderd Starting playback for sentence: %ld", v58, 0xCu);
    swift_slowDealloc(v58, -1, -1);
  }

  objc_msgSend((id)qword_1000192F8, "play");
  *(_BYTE *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying) = 1;
  if (*(_QWORD *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_startingSentence) == a1)
  {
    sub_10000A390((uint64_t)v9);
    v59 = CFAbsoluteTimeGetCurrent()
        - *(double *)(v3 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentRequestStartTime);
    objc_msgSend((id)qword_1000192F8, "volume");
    sub_10000F184(v77, v34, v59, v60, (uint64_t)v9, 1);
    swift_bridgeObjectRelease(v34);
    (*(void (**)(char *, uint64_t))(v79 + 8))(v9, v80);
  }
  else
  {
LABEL_38:
    swift_bridgeObjectRelease(v34);
  }
  v70 = objc_allocWithZone((Class)NSUserDefaults);
  v71 = String._bridgeToObjectiveC()();
  v72 = objc_msgSend(v70, "initWithSuiteName:", v71);

  if (v72)
  {
    v73 = String._bridgeToObjectiveC()();
    objc_msgSend(v72, "setInteger:forKey:", a1, v73);

  }
  else
  {

  }
  (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v14, v82);
  return 1;
}

void sub_100008204(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  double v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  Class isa;
  double v23;
  _BYTE v24[16];
  void *v25;

  v2 = v1;
  sub_1000064A0(a1);
  v4 = v3;
  if (qword_1000191E0 != -1)
    swift_once(&qword_1000191E0, sub_1000023D4);
  v5 = type metadata accessor for Logger(0);
  v6 = sub_10000AD90(v5, (uint64_t)qword_1000192E0);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v9 = 134217984;
    v23 = v4;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, v24, v9 + 4, v9 + 12);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "#sirireaderd calculated estimated playback position: %f", v9, 0xCu);
    swift_slowDealloc(v9, -1, -1);
  }

  v10 = sub_10000652C();
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v14 = 134217984;
    v23 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, v24, v14 + 4, v14 + 12);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "#sirireaderd calculated total playback duration of %f", v14, 0xCu);
    swift_slowDealloc(v14, -1, -1);
  }

  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(MPMediaItemPropertyPlaybackDuration);
  v25 = &type metadata for Double;
  v23 = v10;
  v16 = (uint64_t *)(v2 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_nowPlayingInfo);
  sub_100005C3C((uint64_t)&v23, v15, v17);
  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(MPNowPlayingInfoPropertyElapsedPlaybackTime);
  v25 = &type metadata for Double;
  v23 = v4;
  sub_100005C3C((uint64_t)&v23, v18, v19);
  v20 = objc_msgSend((id)objc_opt_self(MPNowPlayingInfoCenter), "defaultCenter");
  v21 = *v16;
  swift_bridgeObjectRetain(v21);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v21);
  objc_msgSend(v20, "setNowPlayingInfo:", isa);

}

void sub_1000085DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;

  v1 = v0;
  v2 = Notification.userInfo.getter();
  if (!v2)
    return;
  v3 = v2;
  v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(AVAudioSessionInterruptionTypeKey);
  v24 = v4;
  AnyHashable.init<A>(_:)(v25, &v23, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v3 + 16) && (v5 = sub_10000B6FC((uint64_t)v25), (v6 & 1) != 0))
  {
    sub_10000D1B4(*(_QWORD *)(v3 + 56) + 32 * v5, (uint64_t)&v26);
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
  }
  sub_10000D1F0((uint64_t)v25);
  if (!*((_QWORD *)&v27 + 1))
  {
    swift_bridgeObjectRelease(v3);
    goto LABEL_17;
  }
  if ((swift_dynamicCast(&v23, &v26, (char *)&type metadata for Any + 8, &type metadata for UInt, 6) & 1) == 0)
  {
LABEL_15:
    swift_bridgeObjectRelease(v3);
    return;
  }
  if (!v23)
  {
    *(_BYTE *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isSessionActive) = 1;
    v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(AVAudioSessionInterruptionOptionKey);
    v24 = v12;
    AnyHashable.init<A>(_:)(v25, &v23, &type metadata for String, &protocol witness table for String);
    if (*(_QWORD *)(v3 + 16) && (v13 = sub_10000B6FC((uint64_t)v25), (v14 & 1) != 0))
    {
      sub_10000D1B4(*(_QWORD *)(v3 + 56) + 32 * v13, (uint64_t)&v26);
    }
    else
    {
      v26 = 0u;
      v27 = 0u;
    }
    swift_bridgeObjectRelease(v3);
    sub_10000D1F0((uint64_t)v25);
    if (*((_QWORD *)&v27 + 1))
    {
      if ((swift_dynamicCast(&v23, &v26, (char *)&type metadata for Any + 8, &type metadata for UInt, 6) & 1) == 0)
        return;
      if ((v23 & 1) != 0)
      {
        sub_100005184();
        if (qword_1000191E0 != -1)
          swift_once(&qword_1000191E0, sub_1000023D4);
        v21 = type metadata accessor for Logger(0);
        v22 = sub_10000AD90(v21, (uint64_t)qword_1000192E0);
        v17 = Logger.logObject.getter(v22);
        v18 = static os_log_type_t.default.getter();
        if (!os_log_type_enabled(v17, v18))
          goto LABEL_35;
        v19 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v19 = 0;
        v20 = "#sirireaderd Audio session resumed";
      }
      else
      {
        if (qword_1000191E0 != -1)
          swift_once(&qword_1000191E0, sub_1000023D4);
        v15 = type metadata accessor for Logger(0);
        v16 = sub_10000AD90(v15, (uint64_t)qword_1000192E0);
        v17 = Logger.logObject.getter(v16);
        v18 = static os_log_type_t.default.getter();
        if (!os_log_type_enabled(v17, v18))
          goto LABEL_35;
        v19 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v19 = 0;
        v20 = "#sirireaderd Audio session ended and should not resume";
      }
      _os_log_impl((void *)&_mh_execute_header, v17, v18, v20, v19, 2u);
      swift_slowDealloc(v19, -1, -1);
LABEL_35:

      return;
    }
LABEL_17:
    sub_10000D470((uint64_t)&v26, &qword_100019480);
    return;
  }
  if (v23 != 1)
    goto LABEL_15;
  swift_bridgeObjectRelease(v3);
  if (qword_1000191E0 != -1)
    swift_once(&qword_1000191E0, sub_1000023D4);
  v7 = type metadata accessor for Logger(0);
  v8 = sub_10000AD90(v7, (uint64_t)qword_1000192E0);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "#sirireaderd Audio session interrupted", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  *(_BYTE *)(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isSessionActive) = 0;
}

uint64_t sub_100008A34()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  Class isa;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void **v20;
  Class v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void **v27;
  Class v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  void **aBlock;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, void *);
  void *v41;
  void *v42;
  uint64_t v43;

  v1 = v0;
  v2 = objc_msgSend((id)objc_opt_self(MPRemoteCommandCenter), "sharedCommandCenter");
  v3 = objc_msgSend(v2, "changePlaybackRateCommand");
  if (qword_1000191F8 != -1)
    swift_once(&qword_1000191F8, sub_1000024B4);
  sub_10000DDA8(0, &qword_100019470, NSNumber_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v3, "setSupportedPlaybackRates:", isa);

  v5 = objc_msgSend(v2, "changePlaybackRateCommand");
  v6 = swift_allocObject(&unk_100014A90, 24, 7);
  swift_unknownObjectWeakInit(v6 + 16, v1);
  v42 = sub_10000AE7C;
  v43 = v6;
  aBlock = _NSConcreteStackBlock;
  v39 = 1107296256;
  v40 = sub_1000095E8;
  v41 = &unk_100014AD0;
  v7 = _Block_copy(&aBlock);
  swift_release(v43);
  v8 = objc_msgSend(v5, "addTargetWithHandler:", v7);
  _Block_release(v7);

  _bridgeAnyObjectToAny(_:)(&aBlock, v8);
  swift_unknownObjectRelease(v8);
  sub_10000DE24(&aBlock);
  v9 = objc_msgSend(v2, "playCommand");
  v10 = swift_allocObject(&unk_100014A90, 24, 7);
  swift_unknownObjectWeakInit(v10 + 16, v1);
  v42 = sub_10000AE84;
  v43 = v10;
  aBlock = _NSConcreteStackBlock;
  v39 = 1107296256;
  v40 = sub_1000095E8;
  v41 = &unk_100014AF8;
  v11 = _Block_copy(&aBlock);
  swift_release(v43);
  v12 = objc_msgSend(v9, "addTargetWithHandler:", v11);
  _Block_release(v11);

  _bridgeAnyObjectToAny(_:)(&aBlock, v12);
  swift_unknownObjectRelease(v12);
  sub_10000DE24(&aBlock);
  v13 = objc_msgSend(v2, "pauseCommand");
  v14 = swift_allocObject(&unk_100014A90, 24, 7);
  swift_unknownObjectWeakInit(v14 + 16, v1);
  v42 = sub_10000AE8C;
  v43 = v14;
  aBlock = _NSConcreteStackBlock;
  v39 = 1107296256;
  v40 = sub_1000095E8;
  v41 = &unk_100014B20;
  v15 = _Block_copy(&aBlock);
  swift_release(v43);
  v16 = objc_msgSend(v13, "addTargetWithHandler:", v15);
  _Block_release(v15);

  _bridgeAnyObjectToAny(_:)(&aBlock, v16);
  swift_unknownObjectRelease(v16);
  sub_10000DE24(&aBlock);
  v17 = objc_msgSend(v2, "skipForwardCommand");
  v18 = sub_10000AD08(&qword_100019478);
  v19 = swift_allocObject(v18, 48, 7);
  *(_OWORD *)(v19 + 16) = xmmword_100010BA0;
  *(NSNumber *)(v19 + 32) = NSNumber.init(floatLiteral:)(1.0);
  *(NSNumber *)(v19 + 40) = NSNumber.init(floatLiteral:)(30.0);
  aBlock = (void **)v19;
  specialized Array._endMutation()();
  v20 = aBlock;
  v21 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v20);
  objc_msgSend(v17, "setPreferredIntervals:", v21);

  v22 = objc_msgSend(v2, "skipForwardCommand");
  v42 = sub_10000996C;
  v43 = 0;
  aBlock = _NSConcreteStackBlock;
  v39 = 1107296256;
  v40 = sub_1000095E8;
  v41 = &unk_100014B48;
  v23 = _Block_copy(&aBlock);
  v24 = objc_msgSend(v22, "addTargetWithHandler:", v23);
  _Block_release(v23);

  _bridgeAnyObjectToAny(_:)(&aBlock, v24);
  swift_unknownObjectRelease(v24);
  sub_10000DE24(&aBlock);
  v25 = objc_msgSend(v2, "skipBackwardCommand");
  v26 = swift_allocObject(v18, 48, 7);
  *(_OWORD *)(v26 + 16) = xmmword_100010BA0;
  *(NSNumber *)(v26 + 32) = NSNumber.init(floatLiteral:)(1.0);
  *(NSNumber *)(v26 + 40) = NSNumber.init(floatLiteral:)(30.0);
  aBlock = (void **)v26;
  specialized Array._endMutation()();
  v27 = aBlock;
  v28 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v27);
  objc_msgSend(v25, "setPreferredIntervals:", v28);

  v29 = objc_msgSend(v2, "skipBackwardCommand");
  v30 = swift_allocObject(&unk_100014A90, 24, 7);
  swift_unknownObjectWeakInit(v30 + 16, v1);
  v42 = sub_10000AE94;
  v43 = v30;
  aBlock = _NSConcreteStackBlock;
  v39 = 1107296256;
  v40 = sub_1000095E8;
  v41 = &unk_100014B70;
  v31 = _Block_copy(&aBlock);
  swift_release(v43);
  v32 = objc_msgSend(v29, "addTargetWithHandler:", v31);
  _Block_release(v31);

  _bridgeAnyObjectToAny(_:)(&aBlock, v32);
  swift_unknownObjectRelease(v32);
  sub_10000DE24(&aBlock);
  v33 = objc_msgSend(v2, "changePlaybackPositionCommand");
  v34 = swift_allocObject(&unk_100014A90, 24, 7);
  swift_unknownObjectWeakInit(v34 + 16, v1);
  v42 = sub_10000AE9C;
  v43 = v34;
  aBlock = _NSConcreteStackBlock;
  v39 = 1107296256;
  v40 = sub_1000095E8;
  v41 = &unk_100014B98;
  v35 = _Block_copy(&aBlock);
  swift_release(v43);
  v36 = objc_msgSend(v33, "addTargetWithHandler:", v35);
  _Block_release(v35);

  _bridgeAnyObjectToAny(_:)(&aBlock, v36);
  swift_unknownObjectRelease(v36);
  return sub_10000DE24(&aBlock);
}

uint64_t sub_1000090D0(void *a1, uint64_t a2)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  __objc2_meth_list *v11;
  float v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  float v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  float v25;
  id v26;
  uint64_t Strong;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  id v39;
  uint64_t v40;
  Class isa;
  uint64_t v42;
  unsigned __int8 *v43;
  int v44;
  id v45;
  uint64_t v46;
  void *v47;
  float v48;
  double v50;
  _BYTE v51[16];
  void *v52;

  if (qword_1000191E8 != -1)
    swift_once(&qword_1000191E8, sub_100002454);
  v4 = objc_msgSend((id)qword_1000192F8, "currentItem");
  if (!v4)
    return 200;
  v5 = v4;
  v6 = objc_msgSend(v4, "status");

  if (v6 != (id)1)
    return 200;
  v7 = objc_opt_self(MPChangePlaybackRateCommandEvent);
  v8 = swift_dynamicCastObjCClass(a1, v7);
  if (!v8)
    return 200;
  v9 = (void *)v8;
  v10 = a1;
  v11 = &OBJC_INSTANCE_METHODS_NSObject;
  objc_msgSend(v9, "playbackRate");
  if (v12 <= 0.0)
  {
    if (qword_1000191E0 != -1)
      swift_once(&qword_1000191E0, sub_1000023D4);
    v20 = type metadata accessor for Logger(0);
    sub_10000AD90(v20, (uint64_t)qword_1000192E0);
    v21 = v10;
    v22 = Logger.logObject.getter(v21);
    v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v24 = 134217984;
      objc_msgSend(v9, "playbackRate");
      v50 = v25;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, v51, v24 + 4, v24 + 12);

      _os_log_impl((void *)&_mh_execute_header, v22, v23, "#sirireaderd cannot play at negative rate %f", v24, 0xCu);
      swift_slowDealloc(v24, -1, -1);

    }
    else
    {

    }
    return 200;
  }
  v13 = a2 + 16;
  if (qword_1000191E0 != -1)
    swift_once(&qword_1000191E0, sub_1000023D4);
  v14 = type metadata accessor for Logger(0);
  sub_10000AD90(v14, (uint64_t)qword_1000192E0);
  v15 = v10;
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v18 = 134217984;
    objc_msgSend(v9, "playbackRate");
    v50 = v19;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, v51, v18 + 4, v18 + 12);

    v11 = &OBJC_INSTANCE_METHODS_NSObject;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "#sirireaderd changing playback rate to %f", v18, 0xCu);
    swift_slowDealloc(v18, -1, -1);

  }
  else
  {

  }
  v26 = (id)qword_1000192F8;
  objc_msgSend(v9, *(SEL *)&v11[326]);
  objc_msgSend(v26, "setDefaultRate:");

  Strong = swift_unknownObjectWeakLoadStrong(v13);
  if (Strong)
  {
    v28 = (void *)Strong;
    v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(MPNowPlayingInfoPropertyPlaybackRate);
    v31 = v30;
    objc_msgSend(v9, *(SEL *)&v11[326]);
    v52 = &type metadata for Float;
    LODWORD(v50) = v32;
    sub_100005C3C((uint64_t)&v50, v29, v31);

  }
  v33 = swift_unknownObjectWeakLoadStrong(v13);
  if (v33)
  {
    v34 = (void *)v33;
    v35 = static String._unconditionallyBridgeFromObjectiveC(_:)(MPNowPlayingInfoPropertyDefaultPlaybackRate);
    v37 = v36;
    objc_msgSend(v9, *(SEL *)&v11[326]);
    v52 = &type metadata for Float;
    LODWORD(v50) = v38;
    sub_100005C3C((uint64_t)&v50, v35, v37);

  }
  v39 = objc_msgSend((id)objc_opt_self(MPNowPlayingInfoCenter), "defaultCenter");
  v40 = swift_unknownObjectWeakLoadStrong(v13);
  isa = (Class)v40;
  if (v40)
  {
    v42 = *(_QWORD *)(v40 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_nowPlayingInfo);
    swift_bridgeObjectRetain(v42);

    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v42);
  }
  objc_msgSend(v39, "setNowPlayingInfo:", isa);

  v43 = (unsigned __int8 *)swift_unknownObjectWeakLoadStrong(v13);
  if (v43)
  {
    v44 = v43[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying];

    if (v44 == 1)
    {
      v45 = (id)qword_1000192F8;
      objc_msgSend(v9, "playbackRate");
      objc_msgSend(v45, "playImmediatelyAtRate:");

    }
  }
  v46 = swift_unknownObjectWeakLoadStrong(v13);
  if (v46)
  {
    v47 = (void *)v46;
    objc_msgSend(v9, "playbackRate");
    sub_10000D038(v48);

  }
  return 0;
}

uint64_t sub_1000095E8(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t (*v4)(void);
  id v5;
  uint64_t v6;

  v4 = *(uint64_t (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v6 = v4();
  swift_release(v3);

  return v6;
}

uint64_t sub_100009638(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  id v8;
  float v9;
  uint64_t v10;
  uint64_t Strong;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  os_log_type_t v16;
  uint8_t *v17;

  if (qword_1000191E0 != -1)
    swift_once(&qword_1000191E0, sub_1000023D4);
  v3 = type metadata accessor for Logger(0);
  v4 = sub_10000AD90(v3, (uint64_t)qword_1000192E0);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "#sirireaderd playCommand", v7, 2u);
    swift_slowDealloc(v7, -1, -1);
  }

  if (qword_1000191E8 != -1)
    swift_once(&qword_1000191E8, sub_100002454);
  v8 = objc_msgSend((id)qword_1000192F8, "rate");
  if (v9 == 0.0)
  {
    v10 = a2 + 16;
    objc_msgSend((id)qword_1000192F8, "play");
    Strong = swift_unknownObjectWeakLoadStrong(v10);
    if (Strong)
    {
      v12 = (void *)Strong;
      sub_10000A260();

    }
    v13 = swift_unknownObjectWeakLoadStrong(v10);
    if (!v13)
      return 0;
    v14 = v13;
    v15 = 0;
    *(_BYTE *)(v13 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying) = 1;
  }
  else
  {
    v14 = Logger.logObject.getter(v8);
    v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v16, "#sirireaderd playCommand failed due to player rate being non zero", v17, 2u);
      swift_slowDealloc(v17, -1, -1);
    }
    v15 = 200;
  }

  return v15;
}

uint64_t sub_100009824(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t Strong;
  void *v10;
  _BYTE *v11;

  if (qword_1000191E0 != -1)
    swift_once(&qword_1000191E0, sub_1000023D4);
  v3 = a2 + 16;
  v4 = type metadata accessor for Logger(0);
  v5 = sub_10000AD90(v4, (uint64_t)qword_1000192E0);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "#sirireaderd pauseCommand", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  if (qword_1000191E8 != -1)
    swift_once(&qword_1000191E8, sub_100002454);
  objc_msgSend((id)qword_1000192F8, "pause");
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v10 = (void *)Strong;
    sub_100009F50();

  }
  v11 = (_BYTE *)swift_unknownObjectWeakLoadStrong(v3);
  if (v11)
  {
    v11[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying] = 0;

  }
  return 0;
}

uint64_t sub_10000996C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;

  if (qword_1000191E0 != -1)
    swift_once(&qword_1000191E0, sub_1000023D4);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_10000AD90(v0, (uint64_t)qword_1000192E0);
  v2 = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "#sirireaderd skipForwardCommand", v4, 2u);
    swift_slowDealloc(v4, -1, -1);
  }

  if (qword_1000191E8 != -1)
    swift_once(&qword_1000191E8, sub_100002454);
  objc_msgSend((id)qword_1000192F8, "advanceToNextItem");
  return 0;
}

uint64_t sub_100009A78(uint64_t a1, uint64_t a2)
{
  uint64_t Strong;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;

  Strong = swift_unknownObjectWeakLoadStrong(a2 + 16);
  if (!Strong)
    return 200;
  v3 = (_BYTE *)Strong;
  if (qword_1000191E0 != -1)
    swift_once(&qword_1000191E0, sub_1000023D4);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_10000AD90(v4, (uint64_t)qword_1000192E0);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "#sirireaderd skipBackwardCommand", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  v3[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying] = 0;
  v10 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence;
  v11 = *(_QWORD *)&v3[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence];
  v12 = v11 < 1;
  v13 = v11 - 1;
  if (!v12)
    *(_QWORD *)&v3[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence] = v13;
  v14 = Logger.logObject.getter(v9);
  v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "#sirireaderd pausing player before skip backward", v16, 2u);
    swift_slowDealloc(v16, -1, -1);
  }

  if (qword_1000191E8 != -1)
    swift_once(&qword_1000191E8, sub_100002454);
  objc_msgSend((id)qword_1000192F8, "pause");
  objc_msgSend((id)qword_1000192F8, "removeAllItems");
  sub_100006620();
  sub_10000783C(*(_QWORD *)&v3[v10], 1);

  return 0;
}

uint64_t sub_100009C5C(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t Strong;
  _BYTE *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  id v16;
  double v17;
  double v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;

  v4 = objc_opt_self(MPChangePlaybackPositionCommandEvent);
  v5 = swift_dynamicCastObjCClass(a1, v4);
  if (!v5)
    return 200;
  v6 = (void *)v5;
  Strong = swift_unknownObjectWeakLoadStrong(a2 + 16);
  if (!Strong)
    return 200;
  v8 = (_BYTE *)Strong;
  v9 = qword_1000191E0;
  v10 = a1;
  if (v9 != -1)
    swift_once(&qword_1000191E0, sub_1000023D4);
  v11 = type metadata accessor for Logger(0);
  v12 = sub_10000AD90(v11, (uint64_t)qword_1000192E0);
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "#sirireaderd changePlaybackPositionCommand", v15, 2u);
    swift_slowDealloc(v15, -1, -1);
  }

  v16 = objc_msgSend(v6, "positionTime");
  v18 = v17;
  v19 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isCurrentlySeeking;
  v8[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isCurrentlySeeking] = 1;
  v20 = Logger.logObject.getter(v16);
  v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "#sirireaderd pausing player before changing playback position", v22, 2u);
    swift_slowDealloc(v22, -1, -1);
  }

  if (qword_1000191E8 != -1)
    swift_once(&qword_1000191E8, sub_100002454);
  objc_msgSend((id)qword_1000192F8, "pause");
  objc_msgSend((id)qword_1000192F8, "removeAllItems");
  sub_1000065B0(v18);
  v24 = v23;
  v25 = Logger.logObject.getter(v23);
  v26 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v27 = 134217984;
    v30 = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v27 + 4, v27 + 12);
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "#sirireaderd changePlaybackPositionCommand to sentence %ld", v27, 0xCu);
    swift_slowDealloc(v27, -1, -1);
  }

  v28 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence;
  *(_QWORD *)&v8[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence] = v24;
  sub_100006764();
  sub_100006620();
  sub_10000783C(*(_QWORD *)&v8[v28], 1);

  v8[v19] = 0;
  return 0;
}

void sub_100009F50()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD v12[5];
  uint64_t v13;

  v1 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_idleTimer;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_idleTimer))
    sub_10000A260();
  v2 = (void *)objc_opt_self(NSTimer);
  v3 = swift_allocObject(&unk_100014A90, 24, 7);
  swift_unknownObjectWeakInit(v3 + 16, v0);
  v12[4] = sub_10000AE5C;
  v13 = v3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_10000A210;
  v12[3] = &unk_100014AA8;
  v4 = _Block_copy(v12);
  swift_release(v13);
  v5 = objc_msgSend(v2, "scheduledTimerWithTimeInterval:repeats:block:", 0, v4, 420.0);
  _Block_release(v4);
  v6 = *(void **)(v0 + v1);
  *(_QWORD *)(v0 + v1) = v5;

  *(CFAbsoluteTime *)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_idleTimeTracker) = CFAbsoluteTimeGetCurrent();
  if (qword_1000191E0 != -1)
    swift_once(&qword_1000191E0, sub_1000023D4);
  v7 = type metadata accessor for Logger(0);
  v8 = sub_10000AD90(v7, (uint64_t)qword_1000192E0);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "#sirireaderd idle timer started", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

}

void sub_10000A10C(uint64_t a1, uint64_t a2)
{
  uint64_t Strong;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  id v8;

  Strong = swift_unknownObjectWeakLoadStrong(a2 + 16);
  if (Strong)
  {
    v8 = (id)Strong;
    if (qword_1000191E0 != -1)
      swift_once(&qword_1000191E0, sub_1000023D4);
    v3 = type metadata accessor for Logger(0);
    v4 = sub_10000AD90(v3, (uint64_t)qword_1000192E0);
    v5 = Logger.logObject.getter(v4);
    v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "#sirireaderd releasing audio session after idle", v7, 2u);
      swift_slowDealloc(v7, -1, -1);
    }

    sub_1000046DC();
  }
}

void sub_10000A210(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void);
  id v5;

  v4 = *(void (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4();
  swift_release(v3);

}

void sub_10000A260()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  float v5;
  uint64_t v6;
  os_log_type_t v7;
  uint8_t *v8;
  NSObject *oslog;

  v1 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_idleTimer;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_idleTimer);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v3, "invalidate");
    v4 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = 0;

    v5 = CFAbsoluteTimeGetCurrent() - *(double *)(v0 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_idleTimeTracker);
    *(float *)&dword_10001930C = *(float *)&dword_10001930C + v5;

  }
  if (qword_1000191E0 != -1)
    swift_once(&qword_1000191E0, sub_1000023D4);
  v6 = type metadata accessor for Logger(0);
  sub_10000AD90(v6, (uint64_t)qword_1000192E0);
  oslog = Logger.logObject.getter();
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v7, "#sirireaderd idle timer invalidated", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

}

uint64_t sub_10000A390@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v16;

  sub_10000AD08(&qword_100019468);
  v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __chkstk_darwin(v3);
  v8 = (char *)&v16 - v7;
  __chkstk_darwin(v6);
  v10 = (char *)&v16 - v9;
  v11 = v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentContextId;
  sub_10000DDE0(v1 + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentContextId, (uint64_t)v8, &qword_100019468);
  v12 = type metadata accessor for UUID(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  if (v14(v8, 1, v12) == 1)
  {
    UUID.init()();
    sub_10000D470((uint64_t)v8, &qword_100019468);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v8, v12);
  }
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  sub_10000AD48((uint64_t)v10, v11);
  sub_10000DDE0(v11, (uint64_t)v5, &qword_100019468);
  if (v14(v5, 1, v12) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(a1, v5, v12);
  UUID.init()();
  return sub_10000D470((uint64_t)v5, &qword_100019468);
}

id sub_10000A534()
{
  return sub_10000AA24(0, (uint64_t (*)(void))type metadata accessor for SiriReaderDaemon);
}

uint64_t sub_10000A5FC()
{
  return type metadata accessor for SiriReaderDaemon(0);
}

uint64_t type metadata accessor for SiriReaderDaemon(uint64_t a1)
{
  uint64_t result;

  result = qword_1000193B8;
  if (!qword_1000193B8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SiriReaderDaemon);
  return result;
}

void sub_10000A640(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[17];

  v4[0] = &unk_100010C38;
  v4[1] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[2] = &unk_100010C38;
  v4[3] = &unk_100010C50;
  v4[4] = &unk_100010C50;
  v4[5] = &unk_100010C68;
  v4[6] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[7] = &unk_100010C38;
  v4[8] = &unk_100010C38;
  v4[9] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[10] = &unk_100010C50;
  v4[11] = &unk_100010C80;
  v4[12] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[13] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[14] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[15] = (char *)&value witness table for Builtin.Int64 + 64;
  sub_10000A70C(319);
  if (v3 <= 0x3F)
  {
    v4[16] = *(_QWORD *)(v2 - 8) + 64;
    swift_updateClassMetadata2(a1, 256, 17, v4, a1 + 80);
  }
}

void sub_10000A70C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000193C8)
  {
    v2 = type metadata accessor for UUID(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000193C8);
  }
}

BOOL sub_10000A760(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000A774()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000A7B8()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000A7E0(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

id sub_10000A820()
{
  char *v0;
  uint64_t v1;
  id v2;
  char *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  NSString v8;
  id v9;
  objc_super v11;

  v1 = OBJC_IVAR____TtC11sirireaderd22SiriReaderDaemonServer_server;
  v2 = objc_allocWithZone((Class)type metadata accessor for SiriReaderDaemon(0));
  v3 = v0;
  *(_QWORD *)&v0[v1] = objc_msgSend(v2, "init");
  v4 = OBJC_IVAR____TtC11sirireaderd22SiriReaderDaemonServer_interface;
  *(_QWORD *)&v3[v4] = objc_msgSend((id)objc_opt_self(NSXPCInterface), "interfaceWithProtocol:", &OBJC_PROTOCOL____TtP11sirireaderd24SiriReaderDaemonProtocol_);

  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for SiriReaderDaemonServer();
  v5 = objc_msgSendSuper2(&v11, "init");
  v6 = objc_allocWithZone((Class)NSXPCListener);
  v7 = v5;
  v8 = String._bridgeToObjectiveC()();
  v9 = objc_msgSend(v6, "initWithMachServiceName:", v8);

  objc_msgSend(v9, "setDelegate:", v7);
  objc_msgSend(v9, "resume");

  return v7;
}

id sub_10000AA18(uint64_t a1)
{
  return sub_10000AA24(a1, type metadata accessor for SiriReaderDaemonServer);
}

id sub_10000AA24(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for SiriReaderDaemonServer()
{
  return objc_opt_self(_TtC11sirireaderd22SiriReaderDaemonServer);
}

uint64_t initializeBufferWithCopyOfBuffer for ArticleSentence(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

void destroy for ArticleSentence(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));

}

uint64_t initializeWithCopy for ArticleSentence(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  v4 = *(void **)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v4;
  swift_bridgeObjectRetain();
  v5 = v4;
  return a1;
}

uint64_t assignWithCopy for ArticleSentence(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v4);
  v5 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v5;
  v6 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v6;
  *(_BYTE *)(a1 + 41) = *(_BYTE *)(a2 + 41);
  v7 = *(void **)(a1 + 48);
  v8 = *(void **)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v8;
  v9 = v8;

  return a1;
}

__n128 initializeWithTake for ArticleSentence(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ArticleSentence(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  v6 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);

  return a1;
}

uint64_t getEnumTagSinglePayload for ArticleSentence(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ArticleSentence(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ArticleSentence()
{
  return &type metadata for ArticleSentence;
}

uint64_t sub_10000AD08(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000AD48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000AD08(&qword_100019468);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000AD90(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

id sub_10000ADA8(uint64_t a1, double a2, double a3)
{
  uint64_t (*v5)(double, double);
  uint64_t v6;
  void *v7;

  v5 = *(uint64_t (**)(double, double))(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  swift_retain(v6);
  v7 = (void *)v5(a2, a3);
  swift_release(v6);
  return v7;
}

uint64_t *sub_10000ADF8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

uint64_t sub_10000AE38()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000AE5C(uint64_t a1)
{
  uint64_t v1;

  sub_10000A10C(a1, v1);
}

double sub_10000AE64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  *(_QWORD *)&result = swift_retain(v2).n128_u64[0];
  return result;
}

uint64_t sub_10000AE74(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000AE7C(void *a1)
{
  uint64_t v1;

  return sub_1000090D0(a1, v1);
}

uint64_t sub_10000AE84(uint64_t a1)
{
  uint64_t v1;

  return sub_100009638(a1, v1);
}

uint64_t sub_10000AE8C(uint64_t a1)
{
  uint64_t v1;

  return sub_100009824(a1, v1);
}

uint64_t sub_10000AE94(uint64_t a1)
{
  uint64_t v1;

  return sub_100009A78(a1, v1);
}

uint64_t sub_10000AE9C(void *a1)
{
  uint64_t v1;

  return sub_100009C5C(a1, v1);
}

char *sub_10000AEA4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_10000AD08(&qword_100019490);
      v11 = (char *)swift_allocObject(v10, 56 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 56);
      v13 = v11 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[56 * v8 + 32])
          memmove(v13, a4 + 32, 56 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_10000C6E4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000AFCC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10000B09C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10000D1B4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_10000D1B4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000DE24(v12);
  return v7;
}

uint64_t sub_10000B09C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_10000B254(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000B254(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10000B2E8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10000B4C0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10000B4C0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10000B2E8(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_10000B45C(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_10000B45C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_10000AD08(&qword_1000194A0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000B4C0(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_10000AD08(&qword_1000194A0);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

unint64_t sub_10000B60C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10000B72C(a1, a2, v5);
}

unint64_t sub_10000B670(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::Int v7;
  _QWORD v9[9];

  v3 = *(_QWORD *)(v1 + 40);
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v6 = v5;
  Hasher.init(_seed:)(v9, v3);
  String.hash(into:)(v9, v4, v6);
  v7 = Hasher._finalize()();
  swift_bridgeObjectRelease(v6);
  return sub_10000B80C(a1, v7);
}

unint64_t sub_10000B6FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_10000B980(a1, v4);
}

unint64_t sub_10000B72C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = v10[1];
    v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0) & 1) == 0)
    {
      v13 = ~v5;
      do
      {
        v6 = (v6 + 1) & v13;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v14 = (_QWORD *)(v9 + 16 * v6);
        v15 = v14[1];
        v16 = *v14 == a1 && v15 == a2;
      }
      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0) & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10000B80C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  char v22;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5));
    v9 = v8;
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    if (v7 == v10 && v9 == v11)
    {
LABEL_16:
      swift_bridgeObjectRelease_n(v9, 2);
      return v5;
    }
    v13 = v11;
    v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) == 0)
    {
      v15 = ~v4;
      v5 = (v5 + 1) & v15;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5));
          v9 = v17;
          v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
          if (v16 == v18 && v9 == v19)
            break;
          v21 = v19;
          v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v9, v18, v19, 0);
          swift_bridgeObjectRelease(v9);
          swift_bridgeObjectRelease(v21);
          if ((v22 & 1) == 0)
          {
            v5 = (v5 + 1) & v15;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_10000B980(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_10000D224(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_10000D1F0((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

double sub_10000BA44@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  unint64_t v9;
  char v10;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v13;
  double result;
  uint64_t v15;

  v4 = v3;
  v8 = *v4;
  swift_bridgeObjectRetain(*v4);
  v9 = sub_10000B60C(a1, a2);
  LOBYTE(a2) = v10;
  swift_bridgeObjectRelease(v8);
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    v12 = *v4;
    v15 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_10000C19C();
      v12 = v15;
    }
    swift_bridgeObjectRelease(*(_QWORD *)(*(_QWORD *)(v12 + 48) + 16 * v9 + 8));
    sub_10000D1A4((_OWORD *)(*(_QWORD *)(v12 + 56) + 32 * v9), a3);
    sub_10000BE30(v9, v12);
    v13 = *v4;
    *v4 = v12;
    swift_bridgeObjectRelease(v13);
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

void sub_10000BB34(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  Swift::Int v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  _QWORD *v36;
  _QWORD v37[9];
  _OWORD v38[2];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_10000AD08(&qword_100019488);
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (*(_QWORD *)(v5 + 16))
  {
    v34 = v3;
    v9 = 1 << *(_BYTE *)(v5 + 32);
    v36 = (_QWORD *)(v5 + 64);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v35 = (unint64_t)(v9 + 63) >> 6;
    v12 = v7 + 64;
    swift_retain(v5);
    v13 = 0;
    while (1)
    {
      if (v11)
      {
        v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
          return;
        }
        if (v18 >= v35)
          goto LABEL_37;
        v19 = v36[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v35)
            goto LABEL_37;
          v19 = v36[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v35)
            {
LABEL_37:
              swift_release(v5);
              v3 = v34;
              if ((a2 & 1) != 0)
              {
                v33 = 1 << *(_BYTE *)(v5 + 32);
                if (v33 >= 64)
                  bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v36 = -1 << v33;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v36[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_44;
                if (v13 >= v35)
                  goto LABEL_37;
                v19 = v36[v13];
                ++v20;
                if (v19)
                  goto LABEL_24;
              }
            }
            v13 = v20;
          }
        }
LABEL_24:
        v11 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_10000D1A4(v24, v38);
      }
      else
      {
        sub_10000D1B4((uint64_t)v24, (uint64_t)v38);
        swift_bridgeObjectRetain(v22);
      }
      Hasher.init(_seed:)(v37, *(_QWORD *)(v8 + 40));
      String.hash(into:)(v37, v23, v22);
      v25 = Hasher._finalize()();
      v26 = -1 << *(_BYTE *)(v8 + 32);
      v27 = v25 & ~v26;
      v28 = v27 >> 6;
      if (((-1 << v27) & ~*(_QWORD *)(v12 + 8 * (v27 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v12 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v29 = 0;
        v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_43;
          }
          v31 = v28 == v30;
          if (v28 == v30)
            v28 = 0;
          v29 |= v31;
          v32 = *(_QWORD *)(v12 + 8 * v28);
        }
        while (v32 == -1);
        v14 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(_QWORD *)(v12 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      sub_10000D1A4(v38, (_OWORD *)(*(_QWORD *)(v8 + 56) + 32 * v14));
      ++*(_QWORD *)(v8 + 16);
    }
  }
  swift_release(v5);
  *v3 = v8;
}

unint64_t sub_10000BE30(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  Swift::Int v13;
  unint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t v18;
  _OWORD *v19;
  _OWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  _QWORD v27[9];

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v10 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v6);
        v11 = *v10;
        v12 = v10[1];
        Hasher.init(_seed:)(v27, *(_QWORD *)(a2 + 40));
        swift_bridgeObjectRetain(v12);
        String.hash(into:)(v27, v11, v12);
        v13 = Hasher._finalize()();
        result = swift_bridgeObjectRelease(v12);
        v14 = v13 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v14 < v8)
            goto LABEL_5;
        }
        else if (v14 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v14)
        {
LABEL_11:
          v15 = *(_QWORD *)(a2 + 48);
          v16 = (_OWORD *)(v15 + 16 * v3);
          v17 = (_OWORD *)(v15 + 16 * v6);
          if (v3 != v6 || v16 >= v17 + 1)
            *v16 = *v17;
          v18 = *(_QWORD *)(a2 + 56);
          v19 = (_OWORD *)(v18 + 32 * v3);
          v20 = (_OWORD *)(v18 + 32 * v6);
          if (v3 != v6 || (v3 = v6, v19 >= v20 + 2))
          {
            v9 = v20[1];
            *v19 = *v20;
            v19[1] = v9;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v22 = *v21;
    v23 = (-1 << v3) - 1;
  }
  else
  {
    v21 = (uint64_t *)(v4 + 8 * (result >> 6));
    v23 = *v21;
    v22 = (-1 << result) - 1;
  }
  *v21 = v23 & v22;
  v24 = *(_QWORD *)(a2 + 16);
  v25 = __OFSUB__(v24, 1);
  v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_10000C004(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_10000B60C(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = (_QWORD *)(v18[7] + 32 * v12);
        sub_10000DE24(v19);
        return sub_10000D1A4(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_10000C19C();
      goto LABEL_7;
    }
    sub_10000BB34(v15, a4 & 1);
    v21 = sub_10000B60C(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_10000C134(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain(a3);
    }
  }
  result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

_OWORD *sub_10000C134(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_10000D1A4(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

void *sub_10000C19C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _OWORD v26[2];

  v1 = v0;
  sub_10000AD08(&qword_100019488);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release(v2);
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    sub_10000D1B4(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_10000D1A4(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain(v18);
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release(v2);
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

char *sub_10000C380(uint64_t a1)
{
  return sub_10000AEA4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

float sub_10000C394()
{
  id v0;
  NSString v1;
  id v2;
  float v3;
  NSString v4;
  id v5;
  float v7;
  _OWORD v8[2];
  _BYTE v9[24];
  uint64_t v10;

  v0 = objc_allocWithZone((Class)NSUserDefaults);
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "initWithSuiteName:", v1);

  v3 = 1.0;
  if (v2)
  {
    v4 = String._bridgeToObjectiveC()();
    v5 = objc_msgSend(v2, "objectForKey:", v4);

    if (v5)
    {
      _bridgeAnyObjectToAny(_:)(v8, v5);

      swift_unknownObjectRelease(v5);
    }
    else
    {

      memset(v8, 0, sizeof(v8));
    }
    sub_10000D4B4((uint64_t)v8, (uint64_t)v9);
    if (v10)
    {
      if (swift_dynamicCast(&v7, v9, (char *)&type metadata for Any + 8, &type metadata for Float, 6))
        return v7;
    }
    else
    {
      sub_10000D470((uint64_t)v9, &qword_100019480);
    }
  }
  return v3;
}

id sub_10000C4E4()
{
  objc_class *v0;
  id v1;
  uint64_t v2;
  id v3;
  id v4;
  id result;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  id v20;
  uint64_t v21;

  v0 = (objc_class *)type metadata accessor for SynthesisVoice(0);
  v1 = objc_allocWithZone(v0);
  v2 = SynthesisVoice.init(language:name:)(0x73752D6E65, 0xE500000000000000, 0, 0);
  v3 = objc_msgSend((id)objc_opt_self(AFPreferences), "sharedPreferences");
  v4 = objc_msgSend(v3, "outputVoice");

  if (!v4)
  {
    if (qword_1000191E0 != -1)
      swift_once(&qword_1000191E0, sub_1000023D4);
    v15 = type metadata accessor for Logger(0);
    v16 = sub_10000AD90(v15, (uint64_t)qword_1000192E0);
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "#sirireaderd Unable to retrieve outputVoice, falling back to en-us", v19, 2u);
      swift_slowDealloc(v19, -1, -1);
    }
    goto LABEL_11;
  }
  result = objc_msgSend(v4, "languageCode");
  if (result)
  {
    v6 = result;
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(result);
    v9 = v8;

    v10 = objc_msgSend(v4, "name");
    if (v10)
    {
      v11 = v10;
      v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
      v14 = v13;

    }
    else
    {
      v12 = 0;
      v14 = 0;
    }
    v20 = objc_allocWithZone(v0);
    v21 = SynthesisVoice.init(language:name:)(v7, v9, v12, v14);

    v17 = v2;
    v2 = v21;
LABEL_11:

    return (id)v2;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000C6E4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v5 = a4 + 56 * a1 + 32;
  v6 = a3 + 56 * v4;
  if (v5 >= v6 || v5 + 56 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v6;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10000C7D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, void *a7, unint64_t a8)
{
  char *v8;
  char *v9;
  CFAbsoluteTime Current;
  uint64_t v14;
  id v15;
  uint64_t v16;
  char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  NSString v35;
  uint64_t v36;
  uint64_t inited;
  NSString *v38;
  unint64_t v39;
  Class isa;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  int v47;
  uint8_t *v48;
  _QWORD *v49;
  void *v50;
  uint64_t v51;
  id v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  __n128 v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  float v60;
  uint64_t result;
  void *v62;
  uint64_t v68;
  uint64_t v69;
  id v70;
  _BYTE v71[72];

  v9 = v8;
  Current = CFAbsoluteTimeGetCurrent();
  v14 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentRequestStartTime;
  *(CFAbsoluteTime *)&v8[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentRequestStartTime] = Current;
  if (v8[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isSessionActive] == 1)
    sub_1000046DC();
  sub_1000042A8();
  if (qword_1000191F0 != -1)
    swift_once(&qword_1000191F0, sub_100002484);
  v15 = (id)qword_100019300;
  dispatch thunk of DaemonSession.keepActive.setter(1);

  if (qword_1000191E0 != -1)
    swift_once(&qword_1000191E0, sub_1000023D4);
  v16 = type metadata accessor for Logger(0);
  sub_10000AD90(v16, (uint64_t)qword_1000192E0);
  swift_bridgeObjectRetain_n(a6, 2);
  v17 = v9;
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = swift_slowAlloc(22, -1);
    v62 = (void *)swift_slowAlloc(32, -1);
    v70 = v62;
    *(_DWORD *)v20 = 136315394;
    swift_bridgeObjectRetain(a6);
    v68 = sub_10000AFCC(a5, a6, (uint64_t *)&v70);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, &v69, v20 + 4, v20 + 12);
    swift_bridgeObjectRelease_n(a6, 3);
    *(_WORD *)(v20 + 12) = 2048;
    v68 = *(_QWORD *)&v9[v14];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, &v69, v20 + 14, v20 + 22);

    _os_log_impl((void *)&_mh_execute_header, v18, v19, "#sirireaderd new UUID now playing: %s started at %f", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy(v62, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v62, -1, -1);
    swift_slowDealloc(v20, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a6, 2);
  }
  v21 = (uint64_t *)&v17[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID];
  v22 = *(_QWORD *)&v17[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID + 8];
  *v21 = a5;
  v21[1] = a6;
  swift_bridgeObjectRetain(a6);
  swift_bridgeObjectRelease(v22);
  dword_100019308 = 0;
  dword_10001930C = 0;
  *(_QWORD *)&v17[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_idleTimeTracker] = 0;
  sub_10000A260();
  v24 = 0;
  if (a8 <= 2)
    v24 = dword_100010D4C[a8];
  v25 = Logger.logObject.getter(v23);
  v26 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc(12, -1);
    v28 = (void *)swift_slowAlloc(32, -1);
    v70 = v28;
    *(_DWORD *)v27 = 136315138;
    v29 = READSchemaREADRequestTrigger.description.getter(v24);
    v31 = v30;
    v68 = sub_10000AFCC(v29, v30, (uint64_t *)&v70);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, &v69, v27 + 4, v27 + 12);
    swift_bridgeObjectRelease(v31);
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "#sirireaderd logging trigger as: %s", v27, 0xCu);
    swift_arrayDestroy(v28, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v28, -1, -1);
    swift_slowDealloc(v27, -1, -1);
  }

  v32 = *v21;
  v33 = v21[1];
  swift_bridgeObjectRetain(v33);
  sub_10000EC0C(v32, v33, v24);
  swift_bridgeObjectRelease(v33);
  *(_QWORD *)&v17[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_startingSentence] = sub_100002BB0();
  sub_100003010();
  v34 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  v35 = String._bridgeToObjectiveC()();
  v36 = sub_10000AD08(&qword_100019550);
  inited = swift_initStackObject(v36, v71);
  *(_OWORD *)(inited + 16) = xmmword_100010BB0;
  *(_QWORD *)(inited + 64) = &type metadata for String;
  *(_QWORD *)(inited + 32) = NSFileOwnerAccountName;
  *(_QWORD *)(inited + 40) = 0x656C69626F6DLL;
  *(_QWORD *)(inited + 48) = 0xE600000000000000;
  v38 = NSFileOwnerAccountName;
  v39 = sub_1000029B4(inited);
  type metadata accessor for FileAttributeKey(0);
  sub_100002294(&qword_1000192B8, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_100010AEC);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v39);
  v70 = 0;
  LODWORD(v39) = objc_msgSend(v34, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v35, 0, isa, &v70);

  v41 = v70;
  if ((_DWORD)v39)
  {
    v42 = v70;
  }
  else
  {
    v43 = v70;
    v44 = _convertNSErrorToError(_:)(v41);

    swift_willThrow();
    swift_errorRetain(v44);
    v45 = swift_errorRetain(v44);
    v46 = Logger.logObject.getter(v45);
    v47 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v46, (os_log_type_t)v47))
    {
      v48 = (uint8_t *)swift_slowAlloc(12, -1);
      v49 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v48 = 138412290;
      swift_errorRetain(v44);
      v50 = (void *)_swift_stdlib_bridgeErrorToNSError(v44);
      v70 = v50;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, v71, v48 + 4, v48 + 12);
      *v49 = v50;
      swift_errorRelease(v44);
      swift_errorRelease(v44);
      _os_log_impl((void *)&_mh_execute_header, v46, (os_log_type_t)v47, "#sirireaderd error creating TTS generation directory: %@", v48, 0xCu);
      v51 = sub_10000AD08(&qword_1000194B0);
      swift_arrayDestroy(v49, 1, v51);
      swift_slowDealloc(v49, -1, -1);
      swift_slowDealloc(v48, -1, -1);

      swift_errorRelease(v44);
    }
    else
    {
      swift_errorRelease(v44);
      swift_errorRelease(v44);
      swift_errorRelease(v44);

    }
  }
  if (qword_1000191E8 != -1)
    swift_once(&qword_1000191E8, sub_100002454);
  v52 = (id)qword_1000192F8;
  *(float *)&v53 = sub_10000C394();
  objc_msgSend(v52, "setDefaultRate:", v53);

  sub_1000057EC(a1, a2, a7);
  sub_100005D10(a3, a4);
  sub_100006154();
  sub_1000069E8();
  v55 = *v21;
  v54 = v21[1];
  v56 = swift_bridgeObjectRetain(v54);
  v57 = String.count.getter(a3, a4, v56);
  if ((v57 & 0x8000000000000000) != 0)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Negative value is not representable", 35, 2, "Swift/Integers.swift", 20, 2, 3451, 0);
  }
  else
  {
    v58 = v57;
    if (!HIDWORD(v57))
    {
      v59 = *(_QWORD *)(*(_QWORD *)&v17[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences] + 16);
      if (!HIDWORD(v59))
      {
        v60 = sub_10000652C();
        sub_10000EEAC(v55, v54, v58, v59, v60);
        return swift_bridgeObjectRelease(v54);
      }
    }
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Not enough bits to represent the passed value", 45, 2, "Swift/Integers.swift", 20, 2, 3455, 0);
  }
  __break(1u);
  return result;
}

void sub_10000D038(float a1)
{
  id v2;
  NSString v3;
  id v4;
  NSObject *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  os_log_type_t v9;
  uint8_t *v10;
  NSObject *oslog;

  v2 = objc_allocWithZone((Class)NSUserDefaults);
  v3 = String._bridgeToObjectiveC()();
  v4 = objc_msgSend(v2, "initWithSuiteName:", v3);

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    *(float *)&v6 = a1;
    oslog = v5;
    objc_msgSend(v4, "setFloat:forKey:", v6);

  }
  else
  {
    if (qword_1000191E0 != -1)
      swift_once(&qword_1000191E0, sub_1000023D4);
    v7 = type metadata accessor for Logger(0);
    v8 = sub_10000AD90(v7, (uint64_t)qword_1000192E0);
    oslog = Logger.logObject.getter(v8);
    v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v9, "#sirireaderd failed to fetch user defaults", v10, 2u);
      swift_slowDealloc(v10, -1, -1);
    }
  }

}

_OWORD *sub_10000D1A4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000D1B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000D1F0(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_10000D224(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_10000D264()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 32, 7);
}

void sub_10000D288(uint64_t a1)
{
  uint64_t v1;

  sub_1000073B4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

double sub_10000D290(uint64_t a1, unint64_t a2)
{
  double result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(a1);
  }
  *(_QWORD *)&result = swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL).n128_u64[0];
  return result;
}

uint64_t sub_10000D2D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100006070(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_10000D2DC(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_10000D2F0(result, a2);
  return result;
}

uint64_t sub_10000D2F0(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000D334()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

id sub_10000D358()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

void sub_10000D360(void *a1)
{
  uint64_t v1;

  sub_100003868(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_10000D368()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000D378()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000D398(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;

  return sub_100003A64(a1, a2, a3, v3);
}

uint64_t sub_10000D3A0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 40, 7);
}

void sub_10000D3D4()
{
  uint64_t v0;

  sub_100003C74(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32));
}

unint64_t sub_10000D3E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019538;
  if (!qword_100019538)
  {
    v1 = sub_10000D42C(&qword_100019530);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100019538);
  }
  return result;
}

uint64_t sub_10000D42C(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000D470(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_10000AD08(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_10000D4AC(uint64_t a1)
{
  uint64_t v1;

  sub_100003414(a1, v1);
}

uint64_t sub_10000D4B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000AD08(&qword_100019480);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_10000D4FC(uint64_t a1, char *a2, id a3, _QWORD *a4)
{
  _BYTE *v4;
  uint64_t v5;
  _BYTE *v6;
  char *v9;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  float v25;
  NSString *v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  Float64 Seconds;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  char isUniquelyReferenced_nonNull_native;
  char *v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  id v44;
  id v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  NSObject *v58;
  uint64_t v59;
  id v60;
  _BYTE time[32];

  v6 = v4;
  v9 = a2;
  if (qword_100019200 == -1)
  {
    if (!a2)
      return;
  }
  else
  {
    swift_once(&qword_100019200, sub_100002578);
    if (!v9)
      return;
  }
  v11 = qword_100019720 == a1 && *(_QWORD *)algn_100019728 == (_QWORD)v9;
  if (!v11
    && (_stringCompareWithSmolCheck(_:_:expecting:)(a1, v9, qword_100019720, *(_QWORD *)algn_100019728, 0) & 1) == 0)
  {
    goto LABEL_28;
  }
  sub_10000DDE0((uint64_t)a3, (uint64_t)time, &qword_100019480);
  if (!*(_QWORD *)&time[24])
  {
    sub_10000D470((uint64_t)time, &qword_100019480);
    goto LABEL_28;
  }
  v12 = sub_10000DDA8(0, &qword_100019548, AVPlayer_ptr);
  if ((swift_dynamicCast(&v60, time, (char *)&type metadata for Any + 8, v12, 6) & 1) == 0)
    goto LABEL_28;
  v13 = (uint64_t)v60;
  v14 = objc_msgSend(v60, "currentItem");

  if (v14)
    goto LABEL_27;
  if ((v6[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying] & 1) == 0)
    goto LABEL_27;
  if ((v6[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isCurrentlySeeking] & 1) != 0)
    goto LABEL_27;
  v5 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence;
  if (*(_QWORD *)&v6[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence] >= *(_QWORD *)(*(_QWORD *)&v6[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences] + 16))
    goto LABEL_27;
  v59 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences;
  if (qword_1000191E0 != -1)
    goto LABEL_79;
  while (1)
  {
    v15 = type metadata accessor for Logger(0);
    sub_10000AD90(v15, (uint64_t)qword_1000192E0);
    v16 = v6;
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v58 = v16;
      v19 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v19 = 134217984;
      *(_QWORD *)time = *(_QWORD *)&v6[v5];
      UnsafeMutableRawBufferPointer.copyMemory(from:)(time, &time[8], v19 + 4, v19 + 12);

      _os_log_impl((void *)&_mh_execute_header, v17, v18, "#sirireaderd Marking playback as complete for sentence: %ld", v19, 0xCu);
      swift_slowDealloc(v19, -1, -1);
    }
    else
    {

      v17 = v16;
    }

    v20 = *(_QWORD *)&v6[v5];
    if ((v20 & 0x8000000000000000) != 0)
    {
      __break(1u);
LABEL_81:
      __break(1u);
      return;
    }
    v21 = *(_QWORD *)&v6[v59];
    if (v20 >= *(_QWORD *)(v21 + 16))
      goto LABEL_81;
    v22 = v21 + 32;
    if ((*(_BYTE *)(v22 + 56 * v20 + 40) & 1) != 0)
    {
      v23 = v22 + 56 * v20;
      v24 = *(double *)(v23 + 16);
      if (*(_BYTE *)(v23 + 24))
        v24 = 0.0;
    }
    else
    {
      v24 = *(double *)(v22 + 56 * v20 + 32);
    }
    v25 = v24;
    *(float *)&dword_100019308 = *(float *)&dword_100019308 + v25;
    *(_QWORD *)&v6[v5] = v20 + 1;
    sub_10000783C(v20 + 1, 0);
    sub_100006620();
LABEL_27:

LABEL_28:
    if ((a1 != 0x737574617473 || v9 != (char *)0xE600000000000000)
      && (_stringCompareWithSmolCheck(_:_:expecting:)(a1, v9, 0x737574617473, 0xE600000000000000, 0) & 1) == 0)
    {
      return;
    }
    if (!a4 || !a4[2])
    {
      memset(time, 0, sizeof(time));
LABEL_36:
      sub_10000D470((uint64_t)time, &qword_100019480);
LABEL_37:
      a4 = 0;
      goto LABEL_38;
    }
    v26 = NSKeyValueChangeNewKey;
    v27 = sub_10000B670((uint64_t)v26);
    if ((v28 & 1) != 0)
      sub_10000D1B4(a4[7] + 32 * v27, (uint64_t)time);
    else
      memset(time, 0, sizeof(time));

    if (!*(_QWORD *)&time[24])
      goto LABEL_36;
    v39 = sub_10000DDA8(0, &qword_100019470, NSNumber_ptr);
    if ((swift_dynamicCast(&v60, time, (char *)&type metadata for Any + 8, v39, 6) & 1) == 0)
      goto LABEL_37;
    v40 = v60;
    a4 = objc_msgSend(v60, "integerValue");

LABEL_38:
    sub_10000DDE0((uint64_t)a3, (uint64_t)time, &qword_100019480);
    if (!*(_QWORD *)&time[24])
    {
      sub_10000D470((uint64_t)time, &qword_100019480);
      if (a4 != (_QWORD *)2)
        return;
      goto LABEL_65;
    }
    v29 = sub_10000DDA8(0, &qword_100019540, AVPlayerItem_ptr);
    if ((swift_dynamicCast(&v60, time, (char *)&type metadata for Any + 8, v29, 6) & 1) == 0)
      goto LABEL_64;
    a3 = v60;
    objc_msgSend(v60, "duration");
    Seconds = CMTimeGetSeconds((CMTime *)time);
    if (qword_1000191E0 != -1)
      swift_once(&qword_1000191E0, sub_1000023D4);
    v31 = type metadata accessor for Logger(0);
    v32 = sub_10000AD90(v31, (uint64_t)qword_1000192E0);
    v33 = Logger.logObject.getter(v32);
    v34 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v33, v34))
    {
      v5 = 12;
      v35 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v35 = 134217984;
      *(Float64 *)time = Seconds;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(time, &time[8], v35 + 4, v35 + 12);
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "#sirireaderd playerItem.duration in seconds : %f", v35, 0xCu);
      swift_slowDealloc(v35, -1, -1);
    }

    if ((~*(_QWORD *)&Seconds & 0x7FF0000000000000) == 0 && (*(_QWORD *)&Seconds & 0xFFFFFFFFFFFFFLL) != 0)
      goto LABEL_60;
    v13 = *(_QWORD *)&v6[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentSentence];
    a1 = OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences;
    v9 = *(char **)&v6[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences];
    if (v13 >= *((_QWORD *)v9 + 2))
      break;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*(_QWORD *)&v6[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences]);
    *(_QWORD *)&v6[a1] = v9;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      if (v13 < 0)
        goto LABEL_77;
    }
    else
    {
      v9 = sub_10000C380((uint64_t)v9);
      if (v13 < 0)
      {
LABEL_77:
        __break(1u);
        goto LABEL_78;
      }
    }
    if ((unint64_t)v13 < *((_QWORD *)v9 + 2))
    {
      v38 = &v9[56 * v13];
      *((Float64 *)v38 + 8) = Seconds;
      v38[72] = 0;
      *(_QWORD *)&v6[a1] = v9;
      goto LABEL_60;
    }
LABEL_78:
    __break(1u);
LABEL_79:
    swift_once(&qword_1000191E0, sub_1000023D4);
  }
  v41 = Logger.logObject.getter(v36);
  v42 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v41, v42))
  {
    v43 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v43 = 0;
    _os_log_impl((void *)&_mh_execute_header, v41, v42, "#sirireaderd attempting to save duration for sentence outside bounds", v43, 2u);
    swift_slowDealloc(v43, -1, -1);
  }

LABEL_60:
  v44 = objc_msgSend(a3, "error");
  if (!v44)
  {

LABEL_64:
    if (a4 != (_QWORD *)2)
      return;
    goto LABEL_65;
  }
  v45 = v44;
  v46 = Logger.logObject.getter(v45);
  v47 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = (uint8_t *)swift_slowAlloc(12, -1);
    v49 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v48 = 138412290;
    v50 = v45;
    v51 = _swift_stdlib_bridgeErrorToNSError(v50);
    *(_QWORD *)time = v51;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(time, &time[8], v48 + 4, v48 + 12);
    *v49 = v51;

    _os_log_impl((void *)&_mh_execute_header, v46, v47, "#sirireaderd playerItem error: %@", v48, 0xCu);
    v52 = sub_10000AD08(&qword_1000194B0);
    swift_arrayDestroy(v49, 1, v52);
    swift_slowDealloc(v49, -1, -1);
    swift_slowDealloc(v48, -1, -1);

  }
  else
  {

  }
  if (a4 != (_QWORD *)2)
    return;
LABEL_65:
  if (qword_1000191E0 != -1)
    swift_once(&qword_1000191E0, sub_1000023D4);
  v53 = type metadata accessor for Logger(0);
  v54 = sub_10000AD90(v53, (uint64_t)qword_1000192E0);
  v55 = Logger.logObject.getter(v54);
  v56 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v55, v56))
  {
    v57 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v57 = 0;
    _os_log_impl((void *)&_mh_execute_header, v55, v56, "#sirireaderd AVPlayerItem failure has occured", v57, 2u);
    swift_slowDealloc(v57, -1, -1);
  }

}

uint64_t sub_10000DDA8(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_10000DDE0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10000AD08(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000DE24(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_BYTE *initializeBufferWithCopyOfBuffer for GenerationState(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GenerationState(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for GenerationState(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_10000DF30 + 4 * byte_100010C05[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_10000DF64 + 4 * byte_100010C00[v4]))();
}

uint64_t sub_10000DF64(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000DF6C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000DF74);
  return result;
}

uint64_t sub_10000DF80(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000DF88);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_10000DF8C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000DF94(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000DFA0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000DFAC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for GenerationState()
{
  return &type metadata for GenerationState;
}

unint64_t sub_10000DFC8()
{
  unint64_t result;

  result = qword_100019568;
  if (!qword_100019568)
  {
    result = swift_getWitnessTable(&unk_100010D20, &type metadata for GenerationState);
    atomic_store(result, (unint64_t *)&qword_100019568);
  }
  return result;
}

uint64_t sub_10000E068()
{
  uint64_t result;

  sub_10000E0D0();
  result = OS_os_log.init(subsystem:category:)(0xD00000000000001ALL, 0x8000000100012010, 0xD000000000000010, 0x8000000100012640);
  qword_100019738 = result;
  return result;
}

unint64_t sub_10000E0D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019570;
  if (!qword_100019570)
  {
    v1 = objc_opt_self(OS_os_log);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100019570);
  }
  return result;
}

uint64_t sub_10000E10C()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10000ADF8(v0, qword_100019578);
  sub_10000AD90(v0, (uint64_t)qword_100019578);
  if (qword_100019208 != -1)
    swift_once(&qword_100019208, sub_10000E068);
  return Logger.init(_:)((id)qword_100019738);
}

uint64_t sub_10000E18C()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for SelfEmitter()
{
  return objc_opt_self(_TtC11sirireaderd11SelfEmitter);
}

uint64_t sub_10000E1BC()
{
  uint64_t v0;

  sub_10000DE24((_QWORD *)(v0 + 16));
  return swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for SiriReaderInstrumentationUtility()
{
  return objc_opt_self(_TtC11sirireaderd32SiriReaderInstrumentationUtility);
}

void *sub_10000E200(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  Class isa;
  id v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v29;

  v2 = sub_10000AD08(&qword_100019468);
  __chkstk_darwin(v2);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000F510(a1, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_10000F4D0((uint64_t)v4);
    if (qword_100019210 != -1)
      swift_once(&qword_100019210, sub_10000E10C);
    v9 = type metadata accessor for Logger(0);
    sub_10000AD90(v9, (uint64_t)qword_100019578);
    v10 = Logger.logObject.getter();
    v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "cannot generate READClient event with nil readId", v12, 2u);
      swift_slowDealloc(v12, -1, -1);
    }

    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  v13 = objc_msgSend(objc_allocWithZone((Class)READSchemaREADClientEvent), "init");
  if (!v13)
  {
    if (qword_100019210 != -1)
      swift_once(&qword_100019210, sub_10000E10C);
    v20 = type metadata accessor for Logger(0);
    sub_10000AD90(v20, (uint64_t)qword_100019578);
    v21 = Logger.logObject.getter();
    v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "error initializing READSchemaREADClientEvent", v23, 2u);
      swift_slowDealloc(v23, -1, -1);
    }

    goto LABEL_20;
  }
  v14 = v13;
  v15 = objc_msgSend(objc_allocWithZone((Class)READSchemaREADClientEventMetadata), "init");
  if (!v15)
  {
    if (qword_100019210 != -1)
      swift_once(&qword_100019210, sub_10000E10C);
    v24 = type metadata accessor for Logger(0);
    sub_10000AD90(v24, (uint64_t)qword_100019578);
    v25 = Logger.logObject.getter();
    v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "error initializing READSchemaREADClientEventMetadata", v27, 2u);
      swift_slowDealloc(v27, -1, -1);
    }

LABEL_20:
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return 0;
  }
  v16 = v15;
  v17 = objc_allocWithZone((Class)SISchemaUUID);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  v19 = objc_msgSend(v17, "initWithNSUUID:", isa);

  objc_msgSend(v16, "setReadId:", v19);
  objc_msgSend(v14, "setEventMetadata:", v16);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v14;
}

void sub_10000E5CC(uint64_t a1, uint64_t a2, float a3, float a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  double v15;
  double v16;
  id v17;
  id v18;
  id v19;
  Class isa;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;

  v8 = sub_10000AD08(&qword_100019468);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v31 - v12;
  v14 = objc_msgSend(objc_allocWithZone((Class)READSchemaREADPlaybackSessionEnded), "init");
  *(float *)&v15 = a3;
  objc_msgSend(v14, "setPlayedAudioDuration:", v15);
  *(float *)&v16 = a4;
  objc_msgSend(v14, "setTotalDuration:", v16);
  v17 = objc_msgSend(objc_allocWithZone((Class)READSchemaREADPlaybackSessionContext), "init");
  if (v17)
  {
    v18 = objc_allocWithZone((Class)SISchemaUUID);
    v19 = v17;
    isa = UUID._bridgeToObjectiveC()().super.isa;
    v21 = objc_msgSend(v18, "initWithNSUUID:", isa);

    objc_msgSend(v19, "setContextId:", v21);
  }
  objc_msgSend(v17, "setEnded:", v14);
  if (!a2)
    goto LABEL_9;
  UUID.init(uuidString:)(a1, a2);
  v22 = type metadata accessor for UUID(0);
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v11, 1, v22) == 1)
  {
    sub_10000F4D0((uint64_t)v11);
    v24 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v13, v11, v22);
    v24 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v13, v24, 1, v22);
  v25 = sub_10000E200((uint64_t)v13);
  sub_10000F4D0((uint64_t)v13);
  if (v25)
  {
    objc_msgSend(v25, "setPlaybackSessionContext:", v17);
    v26 = objc_msgSend((id)objc_opt_self(AssistantSiriAnalytics), "sharedStream");
    objc_msgSend(v26, "emitMessage:", v25);

    swift_unknownObjectRelease(v26);
  }
  else
  {
LABEL_9:
    if (qword_100019210 != -1)
      swift_once(&qword_100019210, sub_10000E10C);
    v27 = type metadata accessor for Logger(0);
    sub_10000AD90(v27, (uint64_t)qword_100019578);
    v28 = Logger.logObject.getter();
    v29 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "error generating READClient Event", v30, 2u);
      swift_slowDealloc(v30, -1, -1);

    }
    else
    {

    }
  }
}

void sub_10000E8F8(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  Class isa;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;

  v7 = sub_10000AD08(&qword_100019468);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v29 - v11;
  v13 = objc_msgSend(objc_allocWithZone((Class)READSchemaREADPlaybackSessionFailed), "init");
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "setErrorCodes:", a4);
  v15 = objc_msgSend(objc_allocWithZone((Class)READSchemaREADPlaybackSessionContext), "init");
  if (v15)
  {
    v16 = objc_allocWithZone((Class)SISchemaUUID);
    v17 = v15;
    isa = UUID._bridgeToObjectiveC()().super.isa;
    v19 = objc_msgSend(v16, "initWithNSUUID:", isa);

    objc_msgSend(v17, "setContextId:", v19);
  }
  objc_msgSend(v15, "setFailed:", v14);
  if (!a2)
    goto LABEL_11;
  UUID.init(uuidString:)(a1, a2);
  v20 = type metadata accessor for UUID(0);
  v21 = *(_QWORD *)(v20 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v10, 1, v20) == 1)
  {
    sub_10000F4D0((uint64_t)v10);
    v22 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v12, v10, v20);
    v22 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56))(v12, v22, 1, v20);
  v23 = sub_10000E200((uint64_t)v12);
  sub_10000F4D0((uint64_t)v12);
  if (v23)
  {
    objc_msgSend(v23, "setPlaybackSessionContext:", v15);
    v24 = objc_msgSend((id)objc_opt_self(AssistantSiriAnalytics), "sharedStream");
    objc_msgSend(v24, "emitMessage:", v23);

    swift_unknownObjectRelease(v24);
  }
  else
  {
LABEL_11:
    if (qword_100019210 != -1)
      swift_once(&qword_100019210, sub_10000E10C);
    v25 = type metadata accessor for Logger(0);
    sub_10000AD90(v25, (uint64_t)qword_100019578);
    v26 = Logger.logObject.getter();
    v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "error generating READClient Event", v28, 2u);
      swift_slowDealloc(v28, -1, -1);

    }
    else
    {

    }
  }
}

void sub_10000EC0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;

  v6 = sub_10000AD08(&qword_100019468);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v24 - v10;
  v12 = objc_msgSend(objc_allocWithZone((Class)READSchemaREADRequestStarted), "init");
  objc_msgSend(v12, "setTrigger:", a3);
  v13 = objc_msgSend(objc_allocWithZone((Class)READSchemaREADRequestContext), "init");
  objc_msgSend(v13, "setStartedOrChanged:", v12);
  if (!a2)
    goto LABEL_7;
  UUID.init(uuidString:)(a1, a2);
  v14 = type metadata accessor for UUID(0);
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v9, 1, v14) == 1)
  {
    sub_10000F4D0((uint64_t)v9);
    v16 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v11, v9, v14);
    v16 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v11, v16, 1, v14);
  v17 = sub_10000E200((uint64_t)v11);
  sub_10000F4D0((uint64_t)v11);
  if (v17)
  {
    objc_msgSend(v17, "setReadThisRequestContext:", v13);
    v18 = objc_msgSend((id)objc_opt_self(AssistantSiriAnalytics), "sharedStream");
    objc_msgSend(v18, "emitMessage:", v17);

    swift_unknownObjectRelease(v18);
  }
  else
  {
LABEL_7:
    if (qword_100019210 != -1)
      swift_once(&qword_100019210, sub_10000E10C);
    v19 = type metadata accessor for Logger(0);
    v20 = sub_10000AD90(v19, (uint64_t)qword_100019578);
    v21 = Logger.logObject.getter(v20);
    v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "error generating READClient Event", v23, 2u);
      swift_slowDealloc(v23, -1, -1);

    }
    else
    {

    }
  }
}

void sub_10000EEAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, float a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  double v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;

  v10 = sub_10000AD08(&qword_100019468);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v29 - v14;
  v16 = objc_msgSend(objc_allocWithZone((Class)READSchemaREADRequestPreprocessingEnded), "init");
  objc_msgSend(v16, "setUtteranceCount:", a4);
  objc_msgSend(v16, "setArticleTextLength:", a3);
  *(float *)&v17 = a5;
  objc_msgSend(v16, "setEstimatedDuration:", v17);
  v18 = objc_msgSend(objc_allocWithZone((Class)READSchemaREADRequestPreprocessingContext), "init");
  objc_msgSend(v18, "setEnded:", v16);
  if (!a2)
    goto LABEL_7;
  UUID.init(uuidString:)(a1, a2);
  v19 = type metadata accessor for UUID(0);
  v20 = *(_QWORD *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v13, 1, v19) == 1)
  {
    sub_10000F4D0((uint64_t)v13);
    v21 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v15, v13, v19);
    v21 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v15, v21, 1, v19);
  v22 = sub_10000E200((uint64_t)v15);
  sub_10000F4D0((uint64_t)v15);
  if (v22)
  {
    objc_msgSend(v22, "setReadsThisRequestPreprocessingContext:", v18);
    v23 = objc_msgSend((id)objc_opt_self(AssistantSiriAnalytics), "sharedStream");
    objc_msgSend(v23, "emitMessage:", v22);

    swift_unknownObjectRelease(v23);
  }
  else
  {
LABEL_7:
    if (qword_100019210 != -1)
      swift_once(&qword_100019210, sub_10000E10C);
    v24 = type metadata accessor for Logger(0);
    v25 = sub_10000AD90(v24, (uint64_t)qword_100019578);
    v26 = Logger.logObject.getter(v25);
    v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "error generating READClient Event", v28, 2u);
      swift_slowDealloc(v28, -1, -1);

    }
    else
    {

    }
  }
}

void sub_10000F184(uint64_t a1, uint64_t a2, float a3, float a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  id v17;
  double v18;
  double v19;
  id v20;
  id v21;
  id v22;
  Class isa;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;

  v11 = sub_10000AD08(&qword_100019468);
  v12 = __chkstk_darwin(v11);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v35 - v15;
  v17 = objc_msgSend(objc_allocWithZone((Class)READSchemaREADPlaybackSessionStartedOrChanged), "init");
  objc_msgSend(v17, "setPlaybackStateChange:", a6);
  *(float *)&v18 = a4;
  objc_msgSend(v17, "setVolume:", v18);
  if (a3 > 0.0)
  {
    *(float *)&v19 = a3;
    objc_msgSend(v17, "setCustomerPerceivedLatency:", v19);
  }
  v20 = objc_msgSend(objc_allocWithZone((Class)READSchemaREADPlaybackSessionContext), "init");
  if (v20)
  {
    v21 = objc_allocWithZone((Class)SISchemaUUID);
    v22 = v20;
    isa = UUID._bridgeToObjectiveC()().super.isa;
    v24 = objc_msgSend(v21, "initWithNSUUID:", isa);

    objc_msgSend(v22, "setContextId:", v24);
  }
  objc_msgSend(v20, "setStartedOrChanged:", v17);
  if (!a2)
    goto LABEL_11;
  UUID.init(uuidString:)(a1, a2);
  v25 = type metadata accessor for UUID(0);
  v26 = *(_QWORD *)(v25 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v14, 1, v25) == 1)
  {
    sub_10000F4D0((uint64_t)v14);
    v27 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v16, v14, v25);
    v27 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56))(v16, v27, 1, v25);
  v28 = sub_10000E200((uint64_t)v16);
  sub_10000F4D0((uint64_t)v16);
  if (v28)
  {
    objc_msgSend(v28, "setPlaybackSessionContext:", v20);
    v29 = objc_msgSend((id)objc_opt_self(AssistantSiriAnalytics), "sharedStream");
    objc_msgSend(v29, "emitMessage:", v28);

    swift_unknownObjectRelease(v29);
  }
  else
  {
LABEL_11:
    if (qword_100019210 != -1)
      swift_once(&qword_100019210, sub_10000E10C);
    v30 = type metadata accessor for Logger(0);
    v31 = sub_10000AD90(v30, (uint64_t)qword_100019578);
    v32 = Logger.logObject.getter(v31);
    v33 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "error generating READClient Event", v34, 2u);
      swift_slowDealloc(v34, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_10000F4D0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000AD08(&qword_100019468);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000F510(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000AD08(&qword_100019468);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}
