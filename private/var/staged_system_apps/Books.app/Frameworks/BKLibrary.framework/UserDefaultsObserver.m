@implementation UserDefaultsObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  SEL v9;
  id v10;
  _TtC9BKLibraryP33_84E4C0E1EA001C26EA74B9C51B2F995820UserDefaultsObserver *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  _TtC9BKLibraryP33_84E4C0E1EA001C26EA74B9C51B2F995820UserDefaultsObserver *v17;
  _OWORD v18[2];

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = a2;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v18, 0, sizeof(v18));
    v16 = a5;
    v17 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v9 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain(a4, a2);
  v10 = a5;
  v11 = self;
  _bridgeAnyObjectToAny(_:)(v18, a4);
  swift_unknownObjectRelease(a4);
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  v13 = v12;
  v14 = sub_7F3C8();
  v15 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v13, (char *)&type metadata for Any + 8, v14);

LABEL_8:
  sub_7F24C((uint64_t)v18, v15);

  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v15);
  sub_7CA84((uint64_t)v18);
}

- (_TtC9BKLibraryP33_84E4C0E1EA001C26EA74B9C51B2F995820UserDefaultsObserver)init
{
  _TtC9BKLibraryP33_84E4C0E1EA001C26EA74B9C51B2F995820UserDefaultsObserver *result;

  result = (_TtC9BKLibraryP33_84E4C0E1EA001C26EA74B9C51B2F995820UserDefaultsObserver *)_swift_stdlib_reportUnimplementedInitializer("BKLibrary.UserDefaultsObserver", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC9BKLibraryP33_84E4C0E1EA001C26EA74B9C51B2F995820UserDefaultsObserver_continuation;
  v3 = sub_6A50C(&qword_DE370);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
