@implementation CardCollectionViewCell

- (_TtC17SequoiaTranslator22CardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC17SequoiaTranslator22CardCollectionViewCell *)sub_100024030(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17SequoiaTranslator22CardCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100025118();
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CardCollectionViewCell();
  return -[CardCollectionViewCell preferredLayoutAttributesFittingAttributes:](&v5, "preferredLayoutAttributesFittingAttributes:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator22CardCollectionViewCell_minHeight));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator22CardCollectionViewCell_leadingPadding));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator22CardCollectionViewCell_trailingPadding));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator22CardCollectionViewCell_cardHeight));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator22CardCollectionViewCell____lazy_storage___containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator22CardCollectionViewCell____lazy_storage___cardView));
  sub_100025090((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator22CardCollectionViewCell_delegate);
}

@end
