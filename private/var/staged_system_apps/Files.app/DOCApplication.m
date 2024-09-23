@implementation DOCApplication

- (_TtC5Files14DOCApplication)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files14DOCApplication_currentTestName);
  *v2 = 0;
  v2[1] = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files14DOCApplication_finishedLaunchTest) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files14DOCApplication_localDomainRootForQLTests) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files14DOCApplication_loadedTabs) = (Class)_swiftEmptyArrayStorage;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCApplication();
  return -[DOCApplication init](&v4, "init");
}

- (id)_extendLaunchTest
{
  return String._bridgeToObjectiveC()();
}

- (void)tabbedBrowserViewController:(id)a3 didFinishInitialLoad:(BOOL)a4 ofTab:(unint64_t)a5
{
  id v8;
  _TtC5Files14DOCApplication *v9;

  v8 = a3;
  v9 = self;
  sub_100107D38(a4, a5);

}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v4;
  uint64_t v6;
  void *v7;
  void *v8;
  _TtC5Files14DOCApplication *v9;
  char v10;

  v4 = a4;
  if (!a3)
  {
    v6 = 0;
    v8 = 0;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  if (v4)
LABEL_3:
    v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
LABEL_4:
  v9 = self;
  v10 = sub_1000FC72C(v6, v8, (uint64_t)v4);

  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v8);
  return v10 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->currentTestName[OBJC_IVAR____TtC5Files14DOCApplication_currentTestName]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files14DOCApplication_localDomainRootForQLTests));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Files14DOCApplication_loadedTabs));
}

@end
