@implementation NSUserDefaults._Observer

- (_TtCE14MusicUtilitiesCSo14NSUserDefaultsP33_0EE8F48931DDE162065F15584D7CE3A39_Observer)init
{
  uint64_t v3;
  _TtCE14MusicUtilitiesCSo14NSUserDefaultsP33_0EE8F48931DDE162065F15584D7CE3A39_Observer *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  objc_super v10;

  v3 = OBJC_IVAR____TtCE14MusicUtilitiesCSo14NSUserDefaultsP33_0EE8F48931DDE162065F15584D7CE3A39_Observer_registeredSuites;
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_100B722EC((uint64_t)_swiftEmptyArrayStorage);
  v5 = OBJC_IVAR____TtCE14MusicUtilitiesCSo14NSUserDefaultsP33_0EE8F48931DDE162065F15584D7CE3A39_Observer_lock;
  v6 = type metadata accessor for UnfairLock();
  v7 = swift_allocObject(v6, 24, 7);
  v8 = (_DWORD *)swift_slowAlloc(4, -1);
  *(_QWORD *)(v7 + 16) = v8;
  *v8 = 0;
  *(Class *)((char *)&v4->super.isa + v5) = (Class)v7;

  v10.receiver = v4;
  v10.super_class = (Class)_s9_ObserverCMa();
  return -[NSUserDefaults._Observer init](&v10, "init");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v10;
  char *v11;
  id v12;
  _TtCE14MusicUtilitiesCSo14NSUserDefaultsP33_0EE8F48931DDE162065F15584D7CE3A39_Observer *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  objc_class *v17;
  id v18;
  _TtCE14MusicUtilitiesCSo14NSUserDefaultsP33_0EE8F48931DDE162065F15584D7CE3A39_Observer *v19;
  _OWORD v20[2];

  if (a3)
  {
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v11 = (char *)a2;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v20, 0, sizeof(v20));
    v18 = a5;
    v19 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
  v10 = 0;
  v11 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain(a4, a2);
  v12 = a5;
  v13 = self;
  _bridgeAnyObjectToAny(_:)(v20, a4);
  swift_unknownObjectRelease(a4);
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  v15 = v14;
  v16 = sub_100BA13AC();
  v17 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v15, (char *)&type metadata for Any + 8, v16);

LABEL_8:
  sub_100B9D3C0(v10, v11, (uint64_t)v20, v17, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100B76AB0((uint64_t)v20);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtCE14MusicUtilitiesCSo14NSUserDefaultsP33_0EE8F48931DDE162065F15584D7CE3A39_Observer_registeredSuites));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCE14MusicUtilitiesCSo14NSUserDefaultsP33_0EE8F48931DDE162065F15584D7CE3A39_Observer_lock));
}

@end
