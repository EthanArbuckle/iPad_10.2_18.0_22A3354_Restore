@implementation DOCNavigationBar

- (UINavigationBarAppearance)scrollEdgeAppearance
{
  UINavigationBarAppearance *v3;
  _TtC5Files16DOCNavigationBar *v4;
  UINavigationBarAppearance *v5;
  _TtC5Files16DOCNavigationBar *v6;
  UINavigationBarAppearance *v7;
  objc_super v9;

  v3 = *(UINavigationBarAppearance **)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files16DOCNavigationBar_overrideScrollEdgeAppearance);
  if (v3)
  {
    v4 = self;
    v5 = v3;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)type metadata accessor for DOCNavigationBar();
    v6 = self;
    v5 = -[DOCNavigationBar scrollEdgeAppearance](&v9, "scrollEdgeAppearance");
  }
  v7 = v3;

  return v5;
}

- (_TtC5Files16DOCNavigationBar)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5Files16DOCNavigationBar_titlePositionAdjustment) = 0;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Files16DOCNavigationBar_chromelessAppearanceDisabled) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5Files16DOCNavigationBar_overrideScrollEdgeAppearance) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCNavigationBar();
  return -[DOCNavigationBar initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC5Files16DOCNavigationBar)initWithCoder:(id)a3
{
  id v4;
  _TtC5Files16DOCNavigationBar *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5Files16DOCNavigationBar_titlePositionAdjustment) = 0;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Files16DOCNavigationBar_chromelessAppearanceDisabled) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5Files16DOCNavigationBar_overrideScrollEdgeAppearance) = 0;
  v4 = a3;

  result = (_TtC5Files16DOCNavigationBar *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010050DA60, "Files/UIKit+DOCAdditions.swift", 30, 2, 157, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCNavigationBar();
  v2 = v4.receiver;
  -[DOCNavigationBar layoutSubviews](&v4, "layoutSubviews");
  v3 = objc_msgSend(v2, "doc_nearestAncestorViewController", v4.receiver, v4.super_class);
  objc_msgSend(v3, "doc_updateBarButtonTrackingViewsIfNecessary");

}

- (void)setScrollEdgeAppearance:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCNavigationBar();
  -[DOCNavigationBar setScrollEdgeAppearance:](&v4, "setScrollEdgeAppearance:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files16DOCNavigationBar_overrideScrollEdgeAppearance));
}

@end
