@implementation ExtendedUITabBarElement

- (BKRootBarItem)rootBarItem
{
  return (BKRootBarItem *)*(id *)&self->_UITabElement_opaque[OBJC_IVAR____TtC5Books23ExtendedUITabBarElement_rootBarItem];
}

- (void)setRootBarItem:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->_UITabElement_opaque[OBJC_IVAR____TtC5Books23ExtendedUITabBarElement_rootBarItem];
  *(_QWORD *)&self->_UITabElement_opaque[OBJC_IVAR____TtC5Books23ExtendedUITabBarElement_rootBarItem] = a3;
  v3 = a3;

}

- (NSString)shortTabBarTitle
{
  return (NSString *)sub_1001FE0E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5Books23ExtendedUITabBarElement_shortTabBarTitle);
}

- (void)setShortTabBarTitle:(id)a3
{
  sub_1001FE144((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5Books23ExtendedUITabBarElement_shortTabBarTitle);
}

- (NSString)automationID
{
  return (NSString *)sub_1001FE0E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5Books23ExtendedUITabBarElement_automationID);
}

- (void)setAutomationID:(id)a3
{
  sub_1001FE144((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5Books23ExtendedUITabBarElement_automationID);
}

- (_TtC5Books23ExtendedUITabBarElement)initWithIdentifier:(id)a3 title:(id)a4 image:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  id v14;
  NSString v15;
  NSString v16;
  _TtC5Books23ExtendedUITabBarElement *v17;
  objc_super v19;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  *(_QWORD *)&self->_UITabElement_opaque[OBJC_IVAR____TtC5Books23ExtendedUITabBarElement_rootBarItem] = 0;
  v12 = &self->_UITabElement_opaque[OBJC_IVAR____TtC5Books23ExtendedUITabBarElement_shortTabBarTitle];
  *(_QWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = 0;
  v13 = &self->_UITabElement_opaque[OBJC_IVAR____TtC5Books23ExtendedUITabBarElement_automationID];
  *(_QWORD *)v13 = 0;
  *((_QWORD *)v13 + 1) = 0;
  v14 = a5;
  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  v19.receiver = self;
  v19.super_class = (Class)type metadata accessor for ExtendedUITabBarElement();
  v17 = -[ExtendedUITabBarElement initWithIdentifier:title:image:](&v19, "initWithIdentifier:title:image:", v15, v16, v14);

  return v17;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->rootBarItem[OBJC_IVAR____TtC5Books23ExtendedUITabBarElement_shortTabBarTitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->rootBarItem[OBJC_IVAR____TtC5Books23ExtendedUITabBarElement_automationID]);
}

@end
