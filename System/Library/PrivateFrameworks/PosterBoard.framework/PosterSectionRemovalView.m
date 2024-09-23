@implementation PosterSectionRemovalView

- (UIButton)deleteButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC11PosterBoard24PosterSectionRemovalView_deleteButton));
}

- (void)setDeleteButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11PosterBoard24PosterSectionRemovalView_deleteButton);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard24PosterSectionRemovalView_deleteButton) = (Class)a3;
  v3 = a3;

}

- (void)prepareForReuse
{
  char *v2;
  char *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PosterSectionRemovalView();
  v2 = (char *)v4.receiver;
  -[PosterSectionRemovalView prepareForReuse](&v4, sel_prepareForReuse);
  v3 = &v2[OBJC_IVAR____TtC11PosterBoard24PosterSectionRemovalView_posterID];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;

  swift_bridgeObjectRelease();
}

- (_TtC11PosterBoard24PosterSectionRemovalView)initWithFrame:(CGRect)a3
{
  return (_TtC11PosterBoard24PosterSectionRemovalView *)sub_1CBB01934(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11PosterBoard24PosterSectionRemovalView)initWithCoder:(id)a3
{
  _QWORD *v5;
  id v6;
  _TtC11PosterBoard24PosterSectionRemovalView *result;

  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC11PosterBoard24PosterSectionRemovalView_delegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC11PosterBoard24PosterSectionRemovalView_posterID);
  *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard24PosterSectionRemovalView_deleteButton) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard24PosterSectionRemovalView_deleteButtonDimension) = (Class)0x4051000000000000;
  v6 = a3;

  result = (_TtC11PosterBoard24PosterSectionRemovalView *)sub_1CBB82ACC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC11PosterBoard24PosterSectionRemovalView *v2;

  v2 = self;
  sub_1CBB01E9C();

}

- (void).cxx_destruct
{
  sub_1CBAEE45C((uint64_t)self + OBJC_IVAR____TtC11PosterBoard24PosterSectionRemovalView_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard24PosterSectionRemovalView_deleteButton));
}

@end
