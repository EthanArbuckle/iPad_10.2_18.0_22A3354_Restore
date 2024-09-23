@implementation ProductReviewActionsCell

- (_TtC23ShelfKitCollectionViews24ProductReviewActionsCell)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews24ProductReviewActionsCell *result;

  sub_1AEAE8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (void)tintColorDidChange
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  -[ProductReviewActionsCell tintColorDidChange](&v5, "tintColorDidChange");
  v3 = *(void **)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews24ProductReviewActionsCell_writeReviewButton];
  v4 = objc_msgSend(v2, "tintColor", v5.receiver, v5.super_class);
  objc_msgSend(v3, "setTitleColor:forState:", v4, 0);

}

- (_TtC23ShelfKitCollectionViews24ProductReviewActionsCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B0038();
}

- (void)writeReviewWithSender:(id)a3
{
  sub_1AF428(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC23ShelfKitCollectionViews24ProductReviewActionsCell_writeReviewAction);
}

- (void)supportWithSender:(id)a3
{
  sub_1AF428(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC23ShelfKitCollectionViews24ProductReviewActionsCell_supportAction);
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews24ProductReviewActionsCell *v2;

  v2 = self;
  sub_1AF4A0();

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews24ProductReviewActionsCell_objectGraph));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews24ProductReviewActionsCell_writeReviewButton));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews24ProductReviewActionsCell_writeReviewAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews24ProductReviewActionsCell_supportButton));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews24ProductReviewActionsCell_supportAction));
}

@end
