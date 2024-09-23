@implementation BookmarkNavButton

- (_TtC23ShelfKitCollectionViews17BookmarkNavButton)initWithCoder:(id)a3
{
  uint64_t v4;
  _TtC23ShelfKitCollectionViews17BookmarkNavButton *result;

  v4 = static Glyph.HeaderButtons.bookmark.getter(a3);
  static Glyph.HeaderButtons.bookmarked.getter(v4);

  result = (_TtC23ShelfKitCollectionViews17BookmarkNavButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/BookmarkNavButton.swift", 47, 2, 51, 0);
  __break(1u);
  return result;
}

- (void)primaryActionTriggered
{
  _TtC23ShelfKitCollectionViews17BookmarkNavButton *v2;

  v2 = self;
  dispatch thunk of BookmarkButtonPresenter.performPrimaryAction()();

}

- (NSString)accessibilityLabel
{
  void *v3;
  _TtC23ShelfKitCollectionViews17BookmarkNavButton *v4;
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
  v6._object = (void *)0x8000000000316A30;
  v6._countAndFlagsBits = 0xD00000000000001CLL;
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
  sub_242F44(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAccessibilityLabel_);
}

- (NSString)accessibilityValue
{
  _TtC23ShelfKitCollectionViews17BookmarkNavButton *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_242E5C();
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
  sub_242F44(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAccessibilityValue_);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews17BookmarkNavButton_bookmarkGlyph;
  v4 = type metadata accessor for Glyph(0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews17BookmarkNavButton_bookmarkedGlyph, v4);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews17BookmarkNavButton_presenter));
}

@end
