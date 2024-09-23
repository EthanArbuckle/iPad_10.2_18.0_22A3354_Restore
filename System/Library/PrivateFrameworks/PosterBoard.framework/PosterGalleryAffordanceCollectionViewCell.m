@implementation PosterGalleryAffordanceCollectionViewCell

- (void)layoutSubviews
{
  _TtC11PosterBoard41PosterGalleryAffordanceCollectionViewCell *v2;

  v2 = self;
  sub_1CBB0C390();

}

- (_TtC11PosterBoard41PosterGalleryAffordanceCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  uint64_t v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(_QWORD *)((char *)&self->super.super.super.super.super._responderFlags
            + OBJC_IVAR____TtC11PosterBoard41PosterGalleryAffordanceCollectionViewCell_delegate) = 0;
  swift_unknownObjectWeakInit();
  v8 = (char *)self + OBJC_IVAR____TtC11PosterBoard41PosterGalleryAffordanceCollectionViewCell_displayDate;
  v9 = sub_1CBB82208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard41PosterGalleryAffordanceCollectionViewCell_prominentDisplayController) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard41PosterGalleryAffordanceCollectionViewCell_addButton) = 0;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for PosterGalleryAffordanceCollectionViewCell();
  return -[PosterCollectionViewCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11PosterBoard41PosterGalleryAffordanceCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC11PosterBoard41PosterGalleryAffordanceCollectionViewCell *)sub_1CBB0C664(a3);
}

- (void).cxx_destruct
{
  sub_1CBAEE45C((uint64_t)self + OBJC_IVAR____TtC11PosterBoard41PosterGalleryAffordanceCollectionViewCell_delegate);
  sub_1CBB0C938((uint64_t)self + OBJC_IVAR____TtC11PosterBoard41PosterGalleryAffordanceCollectionViewCell_displayDate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard41PosterGalleryAffordanceCollectionViewCell_prominentDisplayController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard41PosterGalleryAffordanceCollectionViewCell_addButton));
}

@end
