@implementation InfoCardHeaderView

- (NSString)title
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->title[OBJC_IVAR____TtC4Maps18InfoCardHeaderView_title];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->title[OBJC_IVAR____TtC4Maps18InfoCardHeaderView_title]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC4Maps18InfoCardHeaderView *v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_1000B64DC(v4, v6);

}

- (NSArray)buttonConfigurations
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC4Maps18InfoCardHeaderView__buttonConfigurations);
  type metadata accessor for InfoCardButtonConfiguration();
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (void)setButtonConfigurations:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  _TtC4Maps18InfoCardHeaderView *v8;

  v5 = type metadata accessor for InfoCardButtonConfiguration();
  v6 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC4Maps18InfoCardHeaderView__buttonConfigurations);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps18InfoCardHeaderView__buttonConfigurations) = v6;
  v8 = self;
  swift_bridgeObjectRelease(v7);
  sub_1000B6630();

}

- (_TtP4Maps26InfoCardHeaderViewDelegate_)delegate
{
  return (_TtP4Maps26InfoCardHeaderViewDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC4Maps18InfoCardHeaderView_delegate);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_delegate, a3);
}

- (double)hairLineAlpha
{
  return *(double *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_hairLineAlpha);
}

- (void)setHairLineAlpha:(double)a3
{
  *(double *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_hairLineAlpha) = a3;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_bottomHairlineView), "setAlpha:");
}

- (BOOL)hideActionButtons
{
  return *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_hideActionButtons);
}

- (void)setHideActionButtons:(BOOL)a3
{
  _TtC4Maps18InfoCardHeaderView *v4;

  v4 = self;
  sub_1000B72A4(a3, &OBJC_IVAR____TtC4Maps18InfoCardHeaderView_hideActionButtons, (SEL *)&selRef_setHidden_);

}

- (BOOL)hideTitleLabel
{
  return *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_hideTitleLabel);
}

- (void)setHideTitleLabel:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  _TtC4Maps18InfoCardHeaderView *v5;

  v3 = a3;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_hideTitleLabel) = a3;
  v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_titleLabel);
  v5 = self;
  objc_msgSend(v4, "setHidden:", v3);
  sub_1000B6AB4();

}

- (double)titleLabelPointSize
{
  void *v2;
  _TtC4Maps18InfoCardHeaderView *v3;
  id v4;
  double result;
  void *v6;
  double v7;
  double v8;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_titleLabel);
  v3 = self;
  v4 = objc_msgSend(v2, "font");
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "pointSize");
    v8 = v7;

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (double)titleToEndTrailingConstant
{
  double v2;

  if ((self->title[OBJC_IVAR____TtC4Maps18InfoCardHeaderView_capturedTitleToEndTrailingConstant] & 1) == 0)
    return *(double *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_capturedTitleToEndTrailingConstant);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC4Maps18InfoCardHeaderView_actionButtonsLayoutGuide), "frame");
  return v2;
}

- (BOOL)blurButtons
{
  return *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_blurButtons);
}

- (void)setBlurButtons:(BOOL)a3
{
  _TtC4Maps18InfoCardHeaderView *v4;

  v4 = self;
  sub_1000B72A4(a3, &OBJC_IVAR____TtC4Maps18InfoCardHeaderView_blurButtons, (SEL *)&selRef_setBlurBackground_);

}

- (void)invalidateButtonMenus
{
  _TtC4Maps18InfoCardHeaderView *v2;

  v2 = self;
  sub_1000B73AC();

}

- (void)infoCardThemeChanged
{
  void *v2;
  _TtC4Maps18InfoCardHeaderView *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_bottomHairlineView);
  v3 = self;
  v4 = -[InfoCardHeaderView theme](v3, "theme");
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "hairlineColor");

    objc_msgSend(v2, "setBackgroundColor:", v6);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC4Maps18InfoCardHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC4Maps18InfoCardHeaderView *)sub_1000BBE80();
}

- (_TtC4Maps18InfoCardHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000BC084();
}

- (void)cardButtonTappedWithSender:(id)a3
{
  id v4;
  _TtC4Maps18InfoCardHeaderView *v5;

  v4 = a3;
  v5 = self;
  sub_1000B8544((uint64_t)v4);

}

- (void)layoutSubviews
{
  _TtC4Maps18InfoCardHeaderView *v2;

  v2 = self;
  sub_1000B90F4();

}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  uint64_t Strong;
  void *v6;
  id v7;
  _TtC4Maps18InfoCardHeaderView *v8;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_delegate);
  if (Strong)
  {
    v6 = (void *)Strong;
    v7 = a3;
    v8 = self;
    objc_msgSend(v6, "headerViewTapped:", v8);

    swift_unknownObjectRelease(v6);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC4Maps18InfoCardHeaderView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_1000B9290((uint64_t)a4, x, y);

  return v10;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC4Maps18InfoCardHeaderView *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1000B9528(v4);

  return self & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC4Maps18InfoCardHeaderView_title]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC4Maps18InfoCardHeaderView__buttonConfigurations));
  sub_100017510((uint64_t)self + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_actionButtonsTrailingToSuperViewTrailing));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_actionButtonsLeadingToSuperviewTrailing));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_actionButtons));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_actionButtonsLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_bottomHairlineView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_actionButtonConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_tapGestureRecognizer));
}

@end
