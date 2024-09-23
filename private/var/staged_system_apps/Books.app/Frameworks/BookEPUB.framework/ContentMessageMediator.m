@implementation ContentMessageMediator

- (_TtC8BookEPUB22ContentMessageMediator)init
{
  return (_TtC8BookEPUB22ContentMessageMediator *)ContentMessageMediator.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_47418((uint64_t)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_webMessageHandler);
  sub_47418((uint64_t)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_eventHandler);
  sub_47418((uint64_t)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_navigationEventHandler);
  sub_47418((uint64_t)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_citationHandler);
  sub_47418((uint64_t)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_alertHandler);
}

- (void)handler:(id)a3 presentAlertController:(id)a4 completion:(id)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t (*v10)();
  char *v11;
  uint64_t Strong;
  uint64_t v13;
  uint64_t v14;
  uint64_t ObjectType;
  void (*v16)(_TtC8BookEPUB22ContentMessageMediator *, id, uint64_t (*)(), uint64_t, uint64_t, uint64_t);
  id v17;
  id v18;
  id v19;
  _TtC8BookEPUB22ContentMessageMediator *v20;

  v7 = _Block_copy(a5);
  if (v7)
  {
    v8 = v7;
    v9 = swift_allocObject(&unk_382598, 24);
    *(_QWORD *)(v9 + 16) = v8;
    v10 = sub_119EC0;
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  v11 = (char *)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_alertHandler;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_alertHandler);
  if (Strong)
  {
    v13 = Strong;
    v14 = *((_QWORD *)v11 + 1);
    ObjectType = swift_getObjectType(Strong);
    v16 = *(void (**)(_TtC8BookEPUB22ContentMessageMediator *, id, uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v14 + 8);
    v17 = a3;
    v16(self, a4, v10, v9, ObjectType, v14);
    swift_unknownObjectRelease(v13);
  }
  else
  {
    v18 = a3;
    v19 = a4;
    v20 = self;
  }
  sub_7241C((uint64_t)v10, v9);

}

- (void)handler:(id)a3 webView:(id)a4 didNotHandleTapAsClickAtPoint:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  id v10;
  _TtC8BookEPUB22ContentMessageMediator *v11;

  y = a5.y;
  x = a5.x;
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_1193FC(v10, x, y);

}

- (id)handler:(id)a3 citationForText:(id)a4 webView:(id)a5
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  id v12;
  _TtC8BookEPUB22ContentMessageMediator *v13;
  uint64_t v14;
  uint64_t v15;
  NSString v16;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;
  v11 = a3;
  v12 = a5;
  v13 = self;
  sub_1194A0(v8, v10, v12);
  v15 = v14;

  swift_bridgeObjectRelease(v10);
  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v15);
  return v16;
}

- (id)adjustedItemProvidersWithCitation:(id)a3 withExcerptString:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _TtC8BookEPUB22ContentMessageMediator *v12;
  _QWORD *v13;
  Class isa;

  v7 = sub_34450(0, (unint64_t *)&unk_3BD300, NSItemProvider_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  v12 = self;
  v13 = ContentMessageMediator.adjustedItemProviders(withCitation:withExcerptString:)(v8, v9, v11);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v11);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v13);
  return isa;
}

- (void)buildMenuWithBuilder:(id)a3 inWebView:(id)a4 atPoint:(CGPoint)a5
{
  char *v8;
  uint64_t Strong;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(void);
  id v13;
  _TtC8BookEPUB22ContentMessageMediator *v14;

  v8 = (char *)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_eventHandler;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_eventHandler);
  if (Strong)
  {
    v10 = Strong;
    v11 = *((_QWORD *)v8 + 1);
    swift_getObjectType(Strong);
    v12 = *(void (**)(void))(v11 + 64);
    swift_unknownObjectRetain(a3);
    v13 = a4;
    v14 = self;
    v12();
    swift_unknownObjectRelease(a3);

    swift_unknownObjectRelease(v10);
  }
}

- (void)webViewDidEnterFullscreen:(id)a3
{
  char *v5;
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void);
  id v10;
  _TtC8BookEPUB22ContentMessageMediator *v11;

  v5 = (char *)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_eventHandler;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_eventHandler);
  if (Strong)
  {
    v7 = Strong;
    v8 = *((_QWORD *)v5 + 1);
    swift_getObjectType(Strong);
    v9 = *(void (**)(void))(v8 + 72);
    v10 = a3;
    v11 = self;
    v9();

    swift_unknownObjectRelease(v7);
  }
}

- (void)webViewFullscreenMayReturnToInline:(id)a3
{
  char *v5;
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void);
  id v10;
  _TtC8BookEPUB22ContentMessageMediator *v11;

  v5 = (char *)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_eventHandler;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_eventHandler);
  if (Strong)
  {
    v7 = Strong;
    v8 = *((_QWORD *)v5 + 1);
    swift_getObjectType(Strong);
    v9 = *(void (**)(void))(v8 + 80);
    v10 = a3;
    v11 = self;
    v9();

    swift_unknownObjectRelease(v7);
  }
}

- (void)webViewDidExitFullscreen:(id)a3
{
  char *v5;
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void);
  id v10;
  _TtC8BookEPUB22ContentMessageMediator *v11;

  v5 = (char *)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_eventHandler;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_eventHandler);
  if (Strong)
  {
    v7 = Strong;
    v8 = *((_QWORD *)v5 + 1);
    swift_getObjectType(Strong);
    v9 = *(void (**)(void))(v8 + 88);
    v10 = a3;
    v11 = self;
    v9();

    swift_unknownObjectRelease(v7);
  }
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v6;
  id v7;
  _TtC8BookEPUB22ContentMessageMediator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_119820(v7);

}

@end
