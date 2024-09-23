@implementation StickerCollectionBlankCell

- (_TtC10StickersUI26StickerCollectionBlankCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC10StickersUI26StickerCollectionBlankCell *v7;
  void *v8;
  _TtC10StickersUI26StickerCollectionBlankCell *v9;
  id v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for StickerCollectionBlankCell();
  v7 = -[StickerCollectionBlankCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  v8 = (void *)objc_opt_self();
  v9 = v7;
  v10 = objc_msgSend(v8, sel_clearColor);
  -[StickerCollectionBlankCell setBackgroundColor:](v9, sel_setBackgroundColor_, v10);

  return v9;
}

- (_TtC10StickersUI26StickerCollectionBlankCell)initWithCoder:(id)a3
{
  _TtC10StickersUI26StickerCollectionBlankCell *result;

  result = (_TtC10StickersUI26StickerCollectionBlankCell *)sub_247A81250();
  __break(1u);
  return result;
}

@end
