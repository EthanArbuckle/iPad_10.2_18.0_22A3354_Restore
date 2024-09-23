@implementation UberNavigationTitleView

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews23UberNavigationTitleView *v2;

  v2 = self;
  sub_265CF8();

}

- (void)contentDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[UberNavigationTitleView contentDidChange](&v3, "contentDidChange");
  objc_msgSend(v2, "setNeedsLayout", v3.receiver, v3.super_class);

}

- (_TtC23ShelfKitCollectionViews23UberNavigationTitleView)initWithFrame:(CGRect)a3
{
  sub_266440();
}

- (_TtC23ShelfKitCollectionViews23UberNavigationTitleView)initWithCoder:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews23UberNavigationTitleView *result;

  self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC23ShelfKitCollectionViews23UberNavigationTitleView_backButtonStyle] = 0;
  *(_QWORD *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC23ShelfKitCollectionViews23UberNavigationTitleView_customBackButton] = 0;
  v4 = a3;

  result = (_TtC23ShelfKitCollectionViews23UberNavigationTitleView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/UberNavigationBarTitleView.swift", 56, 2, 131, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
