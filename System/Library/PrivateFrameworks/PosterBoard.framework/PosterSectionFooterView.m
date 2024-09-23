@implementation PosterSectionFooterView

- (void)prepareForReuse
{
  char *v2;
  char *v3;
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PosterSectionFooterView();
  v2 = (char *)v5.receiver;
  -[PosterSectionFooterView prepareForReuse](&v5, sel_prepareForReuse);
  v3 = &v2[OBJC_IVAR____TtC11PosterBoard23PosterSectionFooterView_symbol];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  swift_bridgeObjectRelease();
  v4 = &v2[OBJC_IVAR____TtC11PosterBoard23PosterSectionFooterView_text];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;

  swift_bridgeObjectRelease();
}

- (_TtC11PosterBoard23PosterSectionFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC11PosterBoard23PosterSectionFooterView *)sub_1CBB16B0C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11PosterBoard23PosterSectionFooterView)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  _TtC11PosterBoard23PosterSectionFooterView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard23PosterSectionFooterView_titleLabel) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC11PosterBoard23PosterSectionFooterView_symbol);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11PosterBoard23PosterSectionFooterView_text);
  *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard23PosterSectionFooterView_titleLabelSpacingFromBottomEdge) = (Class)0x4024000000000000;
  v6 = a3;

  result = (_TtC11PosterBoard23PosterSectionFooterView *)sub_1CBB82ACC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC11PosterBoard23PosterSectionFooterView *v2;

  v2 = self;
  sub_1CBB16EB4();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard23PosterSectionFooterView_titleLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
