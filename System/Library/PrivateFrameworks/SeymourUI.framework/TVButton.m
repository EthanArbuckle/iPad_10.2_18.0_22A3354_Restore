@implementation TVButton

- (BOOL)canBecomeFocused
{
  return (*((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI8TVButton_underlyingControlState) & 2) == 0;
}

- (CGSize)intrinsicContentSize
{
  _TtC9SeymourUI8TVButton *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_22B4811E0();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC9SeymourUI8TVButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B483AA8();
}

- (void)layoutSubviews
{
  _TtC9SeymourUI8TVButton *v2;

  v2 = self;
  sub_22B481354();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC9SeymourUI8TVButton *v6;

  v5 = a3;
  v6 = self;
  sub_22B481548(a3);

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtC9SeymourUI8TVButton *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_22B483BFC();

  return v7;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  void (*v5)(uint64_t);
  id v8;
  id v9;
  uint64_t v10;
  _TtC9SeymourUI8TVButton *v11;

  v5 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC9SeymourUI8TVButton_onWillDisplayMenu);
  if (v5)
  {
    v8 = a3;
    v9 = a4;
    swift_unknownObjectRetain();
    v11 = self;
    v10 = sub_22B0FAA58((uint64_t)v5);
    v5(v10);
    sub_22B0FAA68((uint64_t)v5);

    swift_unknownObjectRelease();
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC9SeymourUI8TVButton *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  sub_22B0F1718(0, &qword_255B8A790);
  sub_22B483CF8();
  v6 = sub_22BA80AF0();
  v7 = a4;
  v8 = self;
  if (sub_22B483E40(v6)
    && (v9 = *(uint64_t *)((char *)&v8->super.super.super.super.isa
                        + OBJC_IVAR____TtC9SeymourUI8TVButton_underlyingControlState),
        (v9 & 8) != 0))
  {
    sub_22B481930(v9 | 1, 1);

    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = (void *)sub_22BA80AE4();
    v11.receiver = v8;
    v11.super_class = (Class)type metadata accessor for TVButton();
    -[TVButton pressesBegan:withEvent:](&v11, sel_pressesBegan_withEvent_, v10, v7);

    swift_bridgeObjectRelease();
  }

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC9SeymourUI8TVButton *v8;
  void *v9;
  objc_super v10;

  sub_22B0F1718(0, &qword_255B8A790);
  sub_22B483CF8();
  v6 = sub_22BA80AF0();
  v7 = a4;
  v8 = self;
  if (sub_22B483E40(v6))
  {
    sub_22B481930(*(unint64_t *)((_BYTE *)&v8->super.super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI8TVButton_underlyingControlState) & 0xFFFFFFFFFFFFFFFELL, 1);

    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = (void *)sub_22BA80AE4();
    v10.receiver = v8;
    v10.super_class = (Class)type metadata accessor for TVButton();
    -[TVButton pressesCancelled:withEvent:](&v10, sel_pressesCancelled_withEvent_, v9, v7);

    swift_bridgeObjectRelease();
  }

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC9SeymourUI8TVButton *v8;
  void *v9;
  objc_super v10;

  sub_22B0F1718(0, &qword_255B8A790);
  sub_22B483CF8();
  v6 = sub_22BA80AF0();
  v7 = a4;
  v8 = self;
  if (sub_22B483E40(v6))
  {
    sub_22B481930(*(unint64_t *)((_BYTE *)&v8->super.super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI8TVButton_underlyingControlState) & 0xFFFFFFFFFFFFFFFELL, 1);
    -[TVButton sendActionsForControlEvents:](v8, sel_sendActionsForControlEvents_, 0x2000);

    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = (void *)sub_22BA80AE4();
    v10.receiver = v8;
    v10.super_class = (Class)type metadata accessor for TVButton();
    -[TVButton pressesEnded:withEvent:](&v10, sel_pressesEnded_withEvent_, v9, v7);

    swift_bridgeObjectRelease();
  }

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  _TtC9SeymourUI8TVButton *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22B482258(v6, (uint64_t)v7);

}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI8TVButton_floatingView), sel__preferredConfigurationForFocusAnimation_inContext_, a3, a4);
}

- (_TtC9SeymourUI8TVButton)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI8TVButton *result;

  result = (_TtC9SeymourUI8TVButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI8TVButton_backgroundVisualEffectView));

  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI8TVButton_onWillDisplayMenu));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI8TVButton_leftPaddingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI8TVButton_rightPaddingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI8TVButton_topPaddingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI8TVButton_bottomPaddingConstraint));
}

@end
