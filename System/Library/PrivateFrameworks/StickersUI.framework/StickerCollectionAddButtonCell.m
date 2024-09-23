@implementation StickerCollectionAddButtonCell

- (_TtC10StickersUI30StickerCollectionAddButtonCell)initWithFrame:(CGRect)a3
{
  return (_TtC10StickersUI30StickerCollectionAddButtonCell *)sub_247A7FA20(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10StickersUI30StickerCollectionAddButtonCell)initWithCoder:(id)a3
{
  return (_TtC10StickersUI30StickerCollectionAddButtonCell *)sub_247A7FBA0(a3);
}

- (void)layoutSubviews
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StickerCollectionAddButtonCell();
  v2 = (char *)v3.receiver;
  -[StickerCollectionAddButtonCell layoutSubviews](&v3, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds, v3.receiver, v3.super_class);
  CGPointMake(objc_msgSend(v2, sel_bounds));
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC10StickersUI30StickerCollectionAddButtonCell_button], sel_setFrame_);

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC10StickersUI30StickerCollectionAddButtonCell *v8;
  uint64_t v9;

  v4 = sub_247A80794();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247A80788();
  v8 = self;
  sub_247A7FDC0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  sub_247A314B0((uint64_t)self + OBJC_IVAR____TtC10StickersUI30StickerCollectionAddButtonCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI30StickerCollectionAddButtonCell_button));
}

@end
