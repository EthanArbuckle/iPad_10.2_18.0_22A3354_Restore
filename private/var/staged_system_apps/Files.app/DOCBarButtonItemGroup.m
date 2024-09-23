@implementation DOCBarButtonItemGroup

- (_TtC5Files21DOCBarButtonItemGroup)initWithCoder:(id)a3
{
  id v4;
  _TtC5Files21DOCBarButtonItemGroup *result;

  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC5Files21DOCBarButtonItemGroup_autoHideIfItemsHidden) = 1;
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC5Files21DOCBarButtonItemGroup__isHiddenExternalClientSetting) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5Files21DOCBarButtonItemGroup_itemObservances) = (Class)_swiftEmptyArrayStorage;
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC5Files21DOCBarButtonItemGroup_hasVisibleItems) = 0;
  v4 = a3;

  result = (_TtC5Files21DOCBarButtonItemGroup *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010050DA60, "Files/UIKit+DOCAdditionsCore.swift", 34, 2, 12, 0);
  __break(1u);
  return result;
}

- (_TtC5Files21DOCBarButtonItemGroup)initWithBarButtonItems:(id)a3 representativeItem:(id)a4
{
  unint64_t v7;
  uint64_t v8;
  id v9;
  Class isa;
  _TtC5Files21DOCBarButtonItemGroup *v11;
  _TtC5Files21DOCBarButtonItemGroup *v12;
  objc_super v14;

  v7 = sub_10021D764();
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC5Files21DOCBarButtonItemGroup_autoHideIfItemsHidden) = 1;
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC5Files21DOCBarButtonItemGroup__isHiddenExternalClientSetting) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5Files21DOCBarButtonItemGroup_itemObservances) = (Class)_swiftEmptyArrayStorage;
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC5Files21DOCBarButtonItemGroup_hasVisibleItems) = 0;
  v9 = a4;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for DOCBarButtonItemGroup();
  v11 = -[DOCBarButtonItemGroup initWithBarButtonItems:representativeItem:](&v14, "initWithBarButtonItems:representativeItem:", isa, v9);

  v12 = v11;
  sub_10021D100();

  return v12;
}

- (NSArray)barButtonItems
{
  id v2;
  NSArray *v3;
  unint64_t v4;
  uint64_t v5;
  Class isa;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCBarButtonItemGroup();
  v2 = v8.receiver;
  v3 = -[DOCBarButtonItemGroup barButtonItems](&v8, "barButtonItems");
  v4 = sub_10021D764();
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  return (NSArray *)isa;
}

- (void)setBarButtonItems:(id)a3
{
  unint64_t v5;
  uint64_t v6;
  _TtC5Files21DOCBarButtonItemGroup *v7;
  Class isa;
  objc_super v9;

  v5 = sub_10021D764();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = self;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  v9.receiver = v7;
  v9.super_class = (Class)type metadata accessor for DOCBarButtonItemGroup();
  -[DOCBarButtonItemGroup setBarButtonItems:](&v9, "setBarButtonItems:", isa);

  sub_10021D100();
}

- (BOOL)isHidden
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCBarButtonItemGroup();
  return -[DOCBarButtonItemGroup isHidden](&v3, "isHidden");
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC5Files21DOCBarButtonItemGroup *v6;
  char v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for DOCBarButtonItemGroup();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[DOCBarButtonItemGroup isHidden](&v9, "isHidden");
  v8.receiver = v6;
  v8.super_class = v5;
  -[DOCBarButtonItemGroup setHidden:](&v8, "setHidden:", v3);
  sub_10021D02C(v7);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC5Files21DOCBarButtonItemGroup_itemObservances));
}

@end
