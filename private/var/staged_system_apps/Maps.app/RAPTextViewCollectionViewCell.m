@implementation RAPTextViewCollectionViewCell

+ (NSString)reuseIdentifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t v7;

  v7 = type metadata accessor for RAPTextViewCollectionViewCell();
  v2 = sub_100008B04(&qword_101493078);
  String.init<A>(describing:)(&v7, v2);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (TextViewWithPlaceholderText)textView
{
  return (TextViewWithPlaceholderText *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super
                                                                                + OBJC_IVAR____TtC4Maps29RAPTextViewCollectionViewCell_textView));
}

- (_TtP4Maps37RAPTextViewCollectionViewCellDelegate_)delegate
{
  return (_TtP4Maps37RAPTextViewCollectionViewCellDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC4Maps29RAPTextViewCollectionViewCell_delegate);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC4Maps29RAPTextViewCollectionViewCell_delegate, a3);
}

- (_TtC4Maps29RAPTextViewCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id v9;
  _TtC4Maps29RAPTextViewCollectionViewCell *v10;
  _TtC4Maps29RAPTextViewCollectionViewCell *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC4Maps29RAPTextViewCollectionViewCell_textView;
  v9 = objc_allocWithZone((Class)TextViewWithPlaceholderText);
  v10 = self;
  *(MapsThemeCollectionViewListCell *)((char *)&self->super + v8) = (MapsThemeCollectionViewListCell)objc_msgSend(v9, "init");
  swift_unknownObjectWeakInit((char *)v10 + OBJC_IVAR____TtC4Maps29RAPTextViewCollectionViewCell_delegate, 0);

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for RAPTextViewCollectionViewCell();
  v11 = -[RAPTextViewCollectionViewCell initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  sub_100016BBC();
  sub_100016D2C();

  return v11;
}

- (_TtC4Maps29RAPTextViewCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC4Maps29RAPTextViewCollectionViewCell *result;

  v5 = OBJC_IVAR____TtC4Maps29RAPTextViewCollectionViewCell_textView;
  v6 = objc_allocWithZone((Class)TextViewWithPlaceholderText);
  v7 = a3;
  *(MapsThemeCollectionViewListCell *)((char *)&self->super + v5) = (MapsThemeCollectionViewListCell)objc_msgSend(v6, "init");
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC4Maps29RAPTextViewCollectionViewCell_delegate, 0);

  result = (_TtC4Maps29RAPTextViewCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E41970, "Maps/RAPTextViewCollectionViewCell.swift", 40, 2, 33, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_100017510((uint64_t)self + OBJC_IVAR____TtC4Maps29RAPTextViewCollectionViewCell_delegate);
}

- (double)preferredHeight
{
  void *v2;
  _TtC4Maps29RAPTextViewCollectionViewCell *v3;
  _TtC4Maps29RAPTextViewCollectionViewCell *v4;
  _TtC4Maps29RAPTextViewCollectionViewCell *v5;
  double v6;
  double v7;

  v2 = *(void **)((char *)&self->super + OBJC_IVAR____TtC4Maps29RAPTextViewCollectionViewCell_textView);
  v3 = self;
  v4 = (_TtC4Maps29RAPTextViewCollectionViewCell *)objc_msgSend(v2, "font");
  if (v4)
  {
    v5 = v4;
    -[RAPTextViewCollectionViewCell _mapkit_scaledValueForValue:](v4, "_mapkit_scaledValueForValue:", 100.0);
    v7 = v6;

    v3 = v5;
  }
  else
  {
    v7 = 100.0;
  }

  return v7;
}

- (CGSize)intrinsicContentSize
{
  _TtC4Maps29RAPTextViewCollectionViewCell *v2;
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat Width;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;
  CGRect v18;

  v2 = self;
  v3 = -[RAPTextViewCollectionViewCell contentView](v2, "contentView");
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  Width = CGRectGetWidth(v18);
  -[RAPTextViewCollectionViewCell preferredHeight](v2, "preferredHeight");
  v14 = v13;

  v15 = Width;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  -[RAPTextViewCollectionViewCell intrinsicContentSize](self, "intrinsicContentSize", a3.width, a3.height);
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)textViewDidChange:(id)a3
{
  id v4;
  _TtC4Maps29RAPTextViewCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_100017398(v4);

}

@end
