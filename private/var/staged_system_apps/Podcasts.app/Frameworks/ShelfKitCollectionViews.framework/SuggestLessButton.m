@implementation SuggestLessButton

- (_TtC23ShelfKitCollectionViews17SuggestLessButton)initWithCoder:(id)a3
{
  _TtC23ShelfKitCollectionViews17SuggestLessButton *result;

  result = (_TtC23ShelfKitCollectionViews17SuggestLessButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/SuggestLessButton.swift", 47, 2, 70, 0);
  __break(1u);
  return result;
}

- (void)primaryActionTriggered
{
  _TtC23ShelfKitCollectionViews17SuggestLessButton *v2;

  v2 = self;
  sub_18203C();

}

- (NSString)accessibilityLabel
{
  void *v3;
  _TtC23ShelfKitCollectionViews17SuggestLessButton *v4;
  id v5;
  Swift::String v6;
  Swift::String v7;
  void *object;
  NSString v9;
  Swift::String v11;

  v3 = (void *)objc_opt_self(NSBundle);
  v4 = self;
  v5 = objc_msgSend(v3, "mainBundle");
  v11._object = (void *)0xE000000000000000;
  v6._object = (void *)0x8000000000311CD0;
  v6._countAndFlagsBits = 0xD000000000000020;
  v7._countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  v11._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v6, (Swift::String_optional)0, (NSBundle)v5, v7, v11)._object;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  return (NSString *)v9;
}

- (void)setAccessibilityLabel:(id)a3
{
  sub_5ABAC(self, (uint64_t)a2, a3, (SEL *)&selRef_setAccessibilityLabel_);
}

- (NSString)accessibilityValue
{
  _TtC23ShelfKitCollectionViews17SuggestLessButton *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1825A8();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setAccessibilityValue:(id)a3
{
  sub_5ABAC(self, (uint64_t)a2, a3, (SEL *)&selRef_setAccessibilityValue_);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews17SuggestLessButton_interestRepository));
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
                                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17SuggestLessButton_headerButtonTipProvider));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews17SuggestLessButton_metricsController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews17SuggestLessButton_stateMachine));
}

@end
