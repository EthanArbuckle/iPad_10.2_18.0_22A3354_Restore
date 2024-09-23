@implementation MarkupButtonContainerView

- (_TtC13AEBookPlugins25MarkupButtonContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10D6B8();
}

- (_TtC13AEBookPlugins25MarkupButtonContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC13AEBookPlugins25MarkupButtonContainerView *)sub_10C8F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtC13AEBookPlugins25MarkupButtonContainerView *v2;

  v2 = self;
  sub_10CE10();

}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  id v7;
  _TtC13AEBookPlugins25MarkupButtonContainerView *v8;
  _QWORD v9[4];

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  _bridgeAnyObjectToAny(_:)(v9);
  swift_unknownObjectRelease(a3);
  sub_10CFBC();

  sub_10D65C(v9);
}

- (void)updateForMiniBarState:(BOOL)a3
{
  _TtC13AEBookPlugins25MarkupButtonContainerView *v3;

  v3 = self;
  -[MarkupButtonContainerView setNeedsLayout](v3, "setNeedsLayout");
  -[MarkupButtonContainerView layoutIfNeeded](v3, "layoutIfNeeded");

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  _TtC13AEBookPlugins25MarkupButtonContainerView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13AEBookPlugins25MarkupButtonContainerView_button);
  v3 = self;
  objc_msgSend(v2, "intrinsicContentSize");
  v5 = v4
     + *(double *)((char *)&v3->super.super.super.isa
                 + OBJC_IVAR____TtC13AEBookPlugins25MarkupButtonContainerView_intrinsicWidthPadding);
  v6 = *(double *)((char *)&v3->super.super.super.isa
                 + OBJC_IVAR____TtC13AEBookPlugins25MarkupButtonContainerView_intrinsicHeight);

  v7 = v5;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[MarkupButtonContainerView intrinsicContentSize](self, "intrinsicContentSize", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13AEBookPlugins25MarkupButtonContainerView_compactImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13AEBookPlugins25MarkupButtonContainerView_regularImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13AEBookPlugins25MarkupButtonContainerView_button));
}

@end
