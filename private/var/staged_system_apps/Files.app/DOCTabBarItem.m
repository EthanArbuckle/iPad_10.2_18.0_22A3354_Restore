@implementation DOCTabBarItem

- (unint64_t)tab
{
  unint64_t *v2;
  _BYTE v4[24];

  v2 = (unint64_t *)((char *)self + OBJC_IVAR____TtC5Files13DOCTabBarItem_tab);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files13DOCTabBarItem_tab, v4, 0, 0);
  return *v2;
}

- (void)setTab:(unint64_t)a3
{
  unint64_t *v4;
  _BYTE v5[24];

  v4 = (unint64_t *)((char *)self + OBJC_IVAR____TtC5Files13DOCTabBarItem_tab);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files13DOCTabBarItem_tab, v5, 1, 0);
  *v4 = a3;
}

- (NSString)tabIdentifier
{
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  NSString v6;
  NSString *result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC5Files13DOCTabBarItem *v11;
  uint64_t v12;
  _BYTE v13[24];

  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Files13DOCTabBarItem_tab);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files13DOCTabBarItem_tab, v13, 0, 0);
  v4 = *v3;
  if (!*v3)
  {
    v5 = 0xE700000000000000;
    goto LABEL_7;
  }
  if (v4 == 2)
  {
    v5 = 0xE600000000000000;
LABEL_7:
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
    return (NSString *)v6;
  }
  if (v4 == 1)
  {
    v5 = 0xE600000000000000;
    goto LABEL_7;
  }
  v8 = *v3;
  type metadata accessor for DOCTab(0);
  v10 = v9;
  v12 = v8;
  v11 = self;
  result = (NSString *)_diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)(v10, &v12, v10, &type metadata for UInt);
  __break(1u);
  return result;
}

+ (id)tabIdentifierForTab:(unint64_t)a3
{
  unint64_t v4;
  NSString v5;
  id result;
  uint64_t v7;
  unint64_t v8;

  switch(a3)
  {
    case 0uLL:
      v4 = 0xE700000000000000;
      goto LABEL_7;
    case 2uLL:
      v4 = 0xE600000000000000;
LABEL_7:
      v5 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v4);
      return v5;
    case 1uLL:
      v4 = 0xE600000000000000;
      goto LABEL_7;
  }
  type metadata accessor for DOCTab(0);
  v8 = a3;
  result = (id)_diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)(v7, &v8, v7, &type metadata for UInt);
  __break(1u);
  return result;
}

+ (id)itemWithTab:(unint64_t)a3
{
  return (id)_s5Files13DOCTabBarItemC4item3tabACSo0B0V_tFZ_0(a3);
}

- (id)floatingSwitcherActionRepresentationWithHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC5Files13DOCTabBarItem *v6;
  id result;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __n128 v13;
  void *v14;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1005D4028, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  result = -[DOCTabBarItem _internalTitle](v6, "_internalTitle");
  if (result)
  {
    v8 = result;
    sub_10004F2F0(0, (unint64_t *)&qword_1006424C0, UIAction_ptr);
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
    v11 = v10;

    v12 = swift_allocObject(&unk_1005D4050, 32, 7);
    *(_QWORD *)(v12 + 16) = sub_1000E62C0;
    *(_QWORD *)(v12 + 24) = v5;
    v14 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(v9, v11, 0, 0, 0, 0, 0, 0, v13, 0, 0, 0, sub_100066584, v12);

    return v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSString)description
{
  _TtC5Files13DOCTabBarItem *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  DOCTabBarItem.description.getter();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSString)displayTitle
{
  _TtC5Files13DOCTabBarItem *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;

  v2 = self;
  v3 = -[DOCTabBarItem _internalTitle](v2, "_internalTitle");
  if (v3)
  {
    v4 = v3;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    v6 = v5;

    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
  }
  else
  {

    v7 = 0;
  }
  return (NSString *)v7;
}

- (_TtC5Files13DOCTabBarItem)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files13DOCTabBarItem_tab) = (Class)2;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCTabBarItem();
  return -[DOCTabBarItem init](&v3, "init");
}

- (_TtC5Files13DOCTabBarItem)initWithCoder:(id)a3
{
  _TtC5Files13DOCTabBarItem *result;

  result = (_TtC5Files13DOCTabBarItem *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010050DA60, "Files/UIKit+DOCAdditionsCore.swift", 34, 2, 12, 0);
  __break(1u);
  return result;
}

- (BOOL)includeSidebarInCollapsedNavStack
{
  uint64_t *v3;
  BOOL result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC5Files13DOCTabBarItem *v8;
  uint64_t v9;
  _BYTE v10[24];

  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Files13DOCTabBarItem_tab);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files13DOCTabBarItem_tab, v10, 0, 0);
  if ((unint64_t)*v3 < 3)
    return (*v3 & 7) == 2;
  v5 = *v3;
  type metadata accessor for DOCTab(0);
  v7 = v6;
  v9 = v5;
  v8 = self;
  result = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)(v7, &v9, v7, &type metadata for UInt);
  __break(1u);
  return result;
}

@end
