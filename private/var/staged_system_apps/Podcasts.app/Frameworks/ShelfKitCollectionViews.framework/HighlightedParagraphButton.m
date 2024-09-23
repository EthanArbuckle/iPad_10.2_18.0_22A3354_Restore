@implementation HighlightedParagraphButton

- (_TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE26HighlightedParagraphButton)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE26HighlightedParagraphButton *)sub_C7144(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE26HighlightedParagraphButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_C9180();
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  char *v10;
  double v11;
  void (*v12)(__n128);
  uint64_t v13;
  __n128 v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v8 = a3;
  v9 = a4;
  v10 = (char *)v15.receiver;
  *(_QWORD *)&v11 = swift_unknownObjectRetain(a5).n128_u64[0];
  -[HighlightedParagraphButton contextMenuInteraction:willEndForConfiguration:animator:](&v15, "contextMenuInteraction:willEndForConfiguration:animator:", v8, v9, a5, v11);
  v12 = *(void (**)(__n128))&v10[OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE26HighlightedParagraphButton_onDismissMenu];
  if (v12)
  {
    v13 = *(_QWORD *)&v10[OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE26HighlightedParagraphButton_onDismissMenu
                        + 8];
    v14 = swift_retain(v13);
    v12(v14);
    sub_1D618((uint64_t)v12, v13);
  }
  swift_unknownObjectRelease(a5);

}

- (void).cxx_destruct
{
  sub_1D618(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE26HighlightedParagraphButton_onDismissMenu), *(_QWORD *)&self->onDismissMenu[OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE26HighlightedParagraphButton_onDismissMenu]);
}

@end
