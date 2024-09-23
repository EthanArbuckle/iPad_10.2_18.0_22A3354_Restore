@implementation SelectedBackgroundView

- (void)layoutSubviews
{
  _TtC5TeaUI22SelectedBackgroundView *v2;

  v2 = self;
  SelectedBackgroundView.layoutSubviews()();

}

- (_TtC5TeaUI22SelectedBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI22SelectedBackgroundView *)SelectedBackgroundView.init(frame:)();
}

- (_TtC5TeaUI22SelectedBackgroundView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  SelectedBackgroundView.init(coder:)();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC5TeaUI22SelectedBackgroundView *v6;
  _TtC5TeaUI22SelectedBackgroundView *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  SelectedBackgroundView.traitCollectionDidChange(_:)(v8);

}

@end
