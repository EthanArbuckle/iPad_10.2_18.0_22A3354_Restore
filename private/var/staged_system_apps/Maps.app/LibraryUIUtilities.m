@implementation LibraryUIUtilities

+ (BOOL)isMyPlacesEnabled
{
  if (qword_101490F30 != -1)
    swift_once(&qword_101490F30, sub_10012902C);
  return byte_1014D4C10;
}

+ (void)setIsMyPlacesEnabled:(BOOL)a3
{
  if (qword_101490F30 != -1)
    swift_once(&qword_101490F30, sub_10012902C);
  byte_1014D4C10 = a3;
}

+ (double)NavBarChromeHeaderTopYOffset
{
  return 4.0;
}

+ (id)addBarButtonItemWithTarget:(id)a3 action:(SEL)a4
{
  return sub_1001292B8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))sub_100129630);
}

+ (id)capsuleBarButtonItemWithTitle:(id)a3 systemImageName:(id)a4 target:(id)a5 action:(SEL)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = v13;
  swift_unknownObjectRetain(a5);
  v15 = sub_1001298D4(v9, v11, v12, v14, (uint64_t)a5, (uint64_t)a6);
  swift_unknownObjectRelease(a5);
  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v14);
  return v15;
}

+ (id)editBarButtonItemWithTarget:(id)a3 action:(SEL)a4
{
  return sub_1001292B8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))sub_100129AC4);
}

+ (id)threeDotsBarButtonItemWithMenuProvider:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject(&unk_1011A45D8, 24, 7);
  *(_QWORD *)(v4 + 16) = v3;
  v5 = sub_100129D34((uint64_t)sub_10012A448, v4);
  swift_release();
  return v5;
}

+ (id)closeButtonItemWithTarget:(id)a3 action:(SEL)a4
{
  return sub_1001292B8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))sub_10012A070);
}

+ (id)iOSNavbarTitleButtonItemWithTitle:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v4 = v3;
  v5 = sub_10012A31C();
  swift_bridgeObjectRelease(v4);
  return v5;
}

+ (id)createPlacedCardSavedButtonConfig
{
  objc_class *v2;
  _BYTE *v3;
  objc_super v5;

  v2 = (objc_class *)type metadata accessor for InfoCardButtonConfiguration();
  v3 = objc_allocWithZone(v2);
  *(_QWORD *)&v3[OBJC_IVAR____TtC4Maps27InfoCardButtonConfiguration_type] = 6;
  v3[OBJC_IVAR____TtC4Maps27InfoCardButtonConfiguration_shouldBlur] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC4Maps27InfoCardButtonConfiguration_tintColor] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC4Maps27InfoCardButtonConfiguration_visibility] = 0;
  v5.receiver = v3;
  v5.super_class = v2;
  return objc_msgSendSuper2(&v5, "init");
}

- (_TtC4Maps18LibraryUIUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LibraryUIUtilities();
  return -[LibraryUIUtilities init](&v3, "init");
}

@end
