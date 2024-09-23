@implementation ExpandableFollowButton

- (_TtC23ShelfKitCollectionViews22ExpandableFollowButton)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews22ExpandableFollowButton *)sub_1F9B44(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews22ExpandableFollowButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1FB3E0();
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v2 = 28.0;
  if (*((_BYTE *)&self->super.super.super.super.super.isa
       + OBJC_IVAR____TtC23ShelfKitCollectionViews22ExpandableFollowButton_followState) == 4)
  {
    v4.receiver = self;
    v4.super_class = (Class)type metadata accessor for ExpandableFollowButton();
    -[ExpandableFollowButton intrinsicContentSize](&v4, "intrinsicContentSize");
  }
  v3 = 28.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ExpandableFollowButton();
  return -[ExpandableFollowButton isHighlighted](&v3, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ExpandableFollowButton();
  v4 = v5.receiver;
  -[ExpandableFollowButton setHighlighted:](&v5, "setHighlighted:", v3);
  sub_1FA564();

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtC23ShelfKitCollectionViews22ExpandableFollowButton *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_1FB4B4();

  return v7;
}

- (BOOL)_supportsMacIdiom
{
  return 0;
}

- (void)didTapButton
{
  _TtC23ShelfKitCollectionViews22ExpandableFollowButton *v2;

  v2 = self;
  sub_1FA6A4();

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews22ExpandableFollowButton_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews22ExpandableFollowButton_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews22ExpandableFollowButton____lazy_storage___loadingIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews22ExpandableFollowButton____lazy_storage___overlayGlyphView));
}

- (NSString)accessibilityLabel
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  sub_1008B0(*((_BYTE *)&self->super.super.super.super.super.isa
             + OBJC_IVAR____TtC23ShelfKitCollectionViews22ExpandableFollowButton_followState));
  if (v2)
  {
    v3 = v2;
    v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

@end
