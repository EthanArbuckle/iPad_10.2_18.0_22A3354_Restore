@implementation QuoteDetailViewLabelAccessibilityElement

- (CGRect)accessibilityFrame
{
  _TtC8StocksUI40QuoteDetailViewLabelAccessibilityElement *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v2 = self;
  v3 = sub_1DC2D0B3C();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)setAccessibilityFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  -[QuoteDetailViewLabelAccessibilityElement setAccessibilityFrame:](&v7, sel_setAccessibilityFrame_, x, y, width, height);
}

- (void)accessibilityElementDidBecomeFocused
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  -[QuoteDetailViewLabelAccessibilityElement accessibilityElementDidBecomeFocused](&v3, sel_accessibilityElementDidBecomeFocused);
  if (MEMORY[0x1DF0CAD78](&v2[OBJC_IVAR____TtC8StocksUI40QuoteDetailViewLabelAccessibilityElement_delegate]))
  {
    sub_1DC225584(v2);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  _TtC8StocksUI40QuoteDetailViewLabelAccessibilityElement *v7;
  _TtC8StocksUI40QuoteDetailViewLabelAccessibilityElement *v8;
  unsigned __int8 v9;
  BOOL v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = MEMORY[0x1DF0CAD78]((char *)self + OBJC_IVAR____TtC8StocksUI40QuoteDetailViewLabelAccessibilityElement_delegate);
  v7 = self;
  v8 = v7;
  if (v6 && (v9 = sub_1DC2257B0((uint64_t)v7, a3), swift_unknownObjectRelease(), (v9 & 1) != 0))
  {

    return 1;
  }
  else
  {
    v12.receiver = v8;
    v12.super_class = ObjectType;
    v10 = -[QuoteDetailViewLabelAccessibilityElement accessibilityScroll:](&v12, sel_accessibilityScroll_, a3);

  }
  return v10;
}

- (_TtC8StocksUI40QuoteDetailViewLabelAccessibilityElement)initWithAccessibilityContainer:(id)a3
{
  objc_class *ObjectType;
  uint64_t v5;
  _TtC8StocksUI40QuoteDetailViewLabelAccessibilityElement *v6;
  objc_super v8;
  _QWORD v9[4];

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectRetain();
  sub_1DC409634();
  swift_unknownObjectRelease();
  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC8StocksUI40QuoteDetailViewLabelAccessibilityElement_delegate) = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  v5 = sub_1DC4099D0();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = -[QuoteDetailViewLabelAccessibilityElement initWithAccessibilityContainer:](&v8, sel_initWithAccessibilityContainer_, v5);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v6;
}

- (_TtC8StocksUI40QuoteDetailViewLabelAccessibilityElement)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC8StocksUI40QuoteDetailViewLabelAccessibilityElement_delegate) = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[QuoteDetailViewLabelAccessibilityElement init](&v5, sel_init);
}

- (void).cxx_destruct
{
  sub_1DC148A20((uint64_t)self + OBJC_IVAR____TtC8StocksUI40QuoteDetailViewLabelAccessibilityElement_delegate);
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
}

@end
