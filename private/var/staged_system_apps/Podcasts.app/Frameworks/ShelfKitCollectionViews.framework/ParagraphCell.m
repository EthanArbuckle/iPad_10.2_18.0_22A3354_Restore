@implementation ParagraphCell

- (_TtC23ShelfKitCollectionViews13ParagraphCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews13ParagraphCell *)sub_269134(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews13ParagraphCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_26A5D0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v6.receiver;
  -[ParagraphCell traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_269B0C();
  objc_msgSend(v5, "setNeedsUpdateConstraints", v6.receiver, v6.super_class);

}

- (void)layoutSubviews
{
  char *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)swift_getObjectType();
  v2 = (char *)v16.receiver;
  -[ParagraphCell layoutSubviews](&v16, "layoutSubviews");
  objc_msgSend(v2, "bounds", v16.receiver, v16.super_class);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v2, "layoutMargins");
  v15 = UIEdgeInsetsInsetRect_1(v4, v6, v8, v10, v11, v12, v13, v14);
  if (*(double *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews13ParagraphCell_recordedWidth] != v15)
  {
    *(double *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews13ParagraphCell_recordedWidth] = v15;
    sub_269B0C();
  }

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  objc_class *ObjectType;
  id v6;
  _TtC23ShelfKitCollectionViews13ParagraphCell *v7;
  id v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = a3;
  v7 = self;
  -[ParagraphCell layoutIfNeeded](v7, "layoutIfNeeded");
  v10.receiver = v7;
  v10.super_class = ObjectType;
  v8 = -[ParagraphCell preferredLayoutAttributesFittingAttributes:](&v10, "preferredLayoutAttributesFittingAttributes:", v6);

  return v8;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13ParagraphCell_expandableTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13ParagraphCell____lazy_storage___heightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13ParagraphCell____lazy_storage___widthConstraint));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews13ParagraphCell_paragraph));
  sub_1D618(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews13ParagraphCell_cellReloadingHandler), *(_QWORD *)&self->expandableTextView[OBJC_IVAR____TtC23ShelfKitCollectionViews13ParagraphCell_cellReloadingHandler]);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews13ParagraphCell_objectGraph));
}

@end
