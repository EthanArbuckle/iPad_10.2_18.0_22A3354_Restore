@implementation PosterSectionHeaderView

- (NSString)title
{
  void *v2;

  if (*(_QWORD *)((char *)&self->super.super.super._responderFlags
                 + OBJC_IVAR____TtC11PosterBoard23PosterSectionHeaderView_title))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1CBB824A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC11PosterBoard23PosterSectionHeaderView *v9;

  if (a3)
  {
    v4 = sub_1CBB824CC();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11PosterBoard23PosterSectionHeaderView_title);
  v7 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC11PosterBoard23PosterSectionHeaderView_title);
  v8 = *(_QWORD *)((char *)&self->super.super.super._responderFlags
                 + OBJC_IVAR____TtC11PosterBoard23PosterSectionHeaderView_title);
  *v6 = v4;
  v6[1] = v5;
  v9 = self;
  sub_1CBB2A8C4(v7, v8);

  swift_bridgeObjectRelease();
}

- (void)prepareForReuse
{
  char *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PosterSectionHeaderView();
  v2 = (char *)v6.receiver;
  -[PosterSectionHeaderView prepareForReuse](&v6, sel_prepareForReuse);
  v3 = &v2[OBJC_IVAR____TtC11PosterBoard23PosterSectionHeaderView_title];
  v4 = *(_QWORD *)&v2[OBJC_IVAR____TtC11PosterBoard23PosterSectionHeaderView_title];
  v5 = *(_QWORD *)&v2[OBJC_IVAR____TtC11PosterBoard23PosterSectionHeaderView_title + 8];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  sub_1CBB2A8C4(v4, v5);

  swift_bridgeObjectRelease();
}

- (_TtC11PosterBoard23PosterSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC11PosterBoard23PosterSectionHeaderView *)sub_1CBB2AA30(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11PosterBoard23PosterSectionHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1CBB2B100();
}

- (void)layoutSubviews
{
  _TtC11PosterBoard23PosterSectionHeaderView *v2;

  v2 = self;
  sub_1CBB2AD74();

}

- (void)posterPairDidUpdateLocalizedTitle:(id)a3
{
  id v4;
  _TtC11PosterBoard23PosterSectionHeaderView *v5;

  v4 = a3;
  v5 = self;
  sub_1CBB2AF6C((uint64_t)v4);

}

- (void).cxx_destruct
{
  sub_1CBAEE45C((uint64_t)self + OBJC_IVAR____TtC11PosterBoard23PosterSectionHeaderView_delegate);
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard23PosterSectionHeaderView_titleLabel));
}

@end
