@implementation QuoteDetailColumnAccessibilityElement

- (NSArray)accessibilityElements
{
  _TtC8StocksUI37QuoteDetailColumnAccessibilityElement *v2;
  id v3;
  void *v4;

  v2 = self;
  v3 = sub_1DC25208C();

  if (v3)
  {
    v4 = (void *)sub_1DC408CC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)setAccessibilityElements:(id)a3
{
  objc_class *ObjectType;
  _TtC8StocksUI37QuoteDetailColumnAccessibilityElement *v6;
  _TtC8StocksUI37QuoteDetailColumnAccessibilityElement *v7;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1DC408CD4();
    v6 = self;
    a3 = (id)sub_1DC408CC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  -[QuoteDetailColumnAccessibilityElement setAccessibilityElements:](&v8, sel_setAccessibilityElements_, a3);

}

- (_TtC8StocksUI37QuoteDetailColumnAccessibilityElement)initWithAccessibilityContainer:(id)a3
{
  objc_class *ObjectType;
  uint64_t v5;
  _TtC8StocksUI37QuoteDetailColumnAccessibilityElement *v6;
  objc_super v8;
  _QWORD v9[4];

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectRetain();
  sub_1DC409634();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  v5 = sub_1DC4099D0();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = -[QuoteDetailColumnAccessibilityElement initWithAccessibilityContainer:](&v8, sel_initWithAccessibilityContainer_, v5);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v6;
}

- (_TtC8StocksUI37QuoteDetailColumnAccessibilityElement)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[QuoteDetailColumnAccessibilityElement init](&v3, sel_init);
}

@end
