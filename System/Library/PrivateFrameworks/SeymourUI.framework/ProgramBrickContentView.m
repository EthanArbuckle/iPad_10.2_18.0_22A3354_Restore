@implementation ProgramBrickContentView

- (_TtC9SeymourUI23ProgramBrickContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B880570();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC9SeymourUI23ProgramBrickContentView *v6;

  v5 = a3;
  v6 = self;
  sub_22B87EAE8(a3);

}

- (void)layoutSubviews
{
  _TtC9SeymourUI23ProgramBrickContentView *v2;
  objc_super v3;

  v2 = self;
  sub_22B87F66C();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for ProgramBrickContentView();
  -[ProgramBrickContentView layoutSubviews](&v3, sel_layoutSubviews);

}

- (_TtC9SeymourUI23ProgramBrickContentView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI23ProgramBrickContentView *result;

  result = (_TtC9SeymourUI23ProgramBrickContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23ProgramBrickContentView_bottomStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23ProgramBrickContentView_bottomTextStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23ProgramBrickContentView_footnoteLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23ProgramBrickContentView_modalitiesStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23ProgramBrickContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23ProgramBrickContentView_recencyIconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23ProgramBrickContentView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23ProgramBrickContentView_contentLayoutGuide));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23ProgramBrickContentView_titleLabelWidthConstraint));
}

@end
