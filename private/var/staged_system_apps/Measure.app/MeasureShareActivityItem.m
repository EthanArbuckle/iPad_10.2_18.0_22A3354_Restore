@implementation MeasureShareActivityItem

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure24MeasureShareActivityItem_entriesToShare);
  v5 = v4[3];
  v6 = sub_10000F66C(v4, v5);
  return (id)_bridgeAnythingToObjectiveC<A>(_:)(v6, v5);
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure24MeasureShareActivityItem_entriesToShare);
  v4 = v3[3];
  v5 = sub_10000F66C(v3, v4);
  return (id)_bridgeAnythingToObjectiveC<A>(_:)(v5, v4);
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  void *v7;
  id v8;
  id v9;
  _TtC7Measure24MeasureShareActivityItem *v10;
  id v11;
  Swift::String v12;
  Swift::String v13;
  void *object;
  NSString v15;
  Swift::String v17;

  v7 = (void *)objc_opt_self(NSBundle);
  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = objc_msgSend(v7, "mainBundle");
  v12._countAndFlagsBits = 0xD00000000000002DLL;
  v17._object = (void *)0x80000001003D7B90;
  v12._object = (void *)0x80000001003D7B60;
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  v17._countAndFlagsBits = 0xD00000000000001BLL;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v12, (Swift::String_optional)0, (NSBundle)v11, v13, v17)._object;

  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  return v15;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v5;
  id v6;
  _TtC7Measure24MeasureShareActivityItem *v7;
  id v8;
  NSString v9;

  v5 = objc_allocWithZone((Class)LPLinkMetadata);
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, "init");
  v9 = String._bridgeToObjectiveC()();
  objc_msgSend(v8, "setTitle:", v9);

  return v8;
}

- (_TtC7Measure24MeasureShareActivityItem)init
{
  _TtC7Measure24MeasureShareActivityItem *result;

  result = (_TtC7Measure24MeasureShareActivityItem *)_swift_stdlib_reportUnimplementedInitializer("Measure.MeasureShareActivityItem", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000F690((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure24MeasureShareActivityItem_entriesToShare));
}

@end
