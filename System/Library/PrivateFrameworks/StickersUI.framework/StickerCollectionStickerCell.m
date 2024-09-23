@implementation StickerCollectionStickerCell

- (_TtC10StickersUI28StickerCollectionStickerCell)initWithFrame:(CGRect)a3
{
  return (_TtC10StickersUI28StickerCollectionStickerCell *)sub_247A654C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10StickersUI28StickerCollectionStickerCell)initWithCoder:(id)a3
{
  return (_TtC10StickersUI28StickerCollectionStickerCell *)sub_247A6575C(a3);
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StickerCollectionStickerCell();
  v2 = (char *)v5.receiver;
  -[StickerCollectionStickerCell layoutSubviews](&v5, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC10StickersUI28StickerCollectionStickerCell_stickerView];
  objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setFrame_);
  v4 = sub_247A64BAC();
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v4, sel_setFrame_);

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC10StickersUI28StickerCollectionStickerCell *v8;
  uint64_t v9;

  v4 = sub_247A80794();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247A80788();
  v8 = self;
  sub_247A659FC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)prepareForReuse
{
  _TtC10StickersUI28StickerCollectionStickerCell *v2;

  v2 = self;
  sub_247A65E28();

}

- (void)handleDelete:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t ObjectType;
  void (*v11)(void);
  id v12;
  _TtC10StickersUI28StickerCollectionStickerCell *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576D6D40);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (char *)self + OBJC_IVAR____TtC10StickersUI28StickerCollectionStickerCell_delegate;
  if (MEMORY[0x2495899B8]((char *)self + OBJC_IVAR____TtC10StickersUI28StickerCollectionStickerCell_delegate))
  {
    v9 = *((_QWORD *)v8 + 1);
    ObjectType = swift_getObjectType();
    v11 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.super.super.super.super.isa) + 0xA8);
    v12 = a3;
    v13 = self;
    v11();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(v7, ObjectType, v9);
    swift_unknownObjectRelease();
    sub_247A343F8((uint64_t)v7, &qword_2576D6D40);

  }
}

- (void).cxx_destruct
{
  sub_247A343F8((uint64_t)self + OBJC_IVAR____TtC10StickersUI28StickerCollectionStickerCell_stickerIdentifier, &qword_2576D6D40);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI28StickerCollectionStickerCell_msSticker));
  sub_247A314B0((uint64_t)self + OBJC_IVAR____TtC10StickersUI28StickerCollectionStickerCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI28StickerCollectionStickerCell_stickerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI28StickerCollectionStickerCell____lazy_storage___rearrangingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI28StickerCollectionStickerCell____lazy_storage___deleteButton));
}

- (BOOL)canHandleTap
{
  char *v3;
  uint64_t v4;
  uint64_t ObjectType;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtC10StickersUI28StickerCollectionStickerCell *v7;
  char v8;

  v3 = (char *)self + OBJC_IVAR____TtC10StickersUI28StickerCollectionStickerCell_delegate;
  if (MEMORY[0x2495899B8]((char *)self + OBJC_IVAR____TtC10StickersUI28StickerCollectionStickerCell_delegate, a2))
  {
    v4 = *((_QWORD *)v3 + 1);
    ObjectType = swift_getObjectType();
    v6 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 96);
    v7 = self;
    v8 = v6(ObjectType, v4);

    swift_unknownObjectRelease();
  }
  else
  {
    v8 = 1;
  }
  return v8 & 1;
}

- (void)handleTap:(id)a3 recognizer:(id)a4
{
  char *v7;
  uint64_t v8;
  void (*v9)(void);
  id v10;
  id v11;
  _TtC10StickersUI28StickerCollectionStickerCell *v12;

  v7 = (char *)self + OBJC_IVAR____TtC10StickersUI28StickerCollectionStickerCell_delegate;
  if (MEMORY[0x2495899B8]((char *)self + OBJC_IVAR____TtC10StickersUI28StickerCollectionStickerCell_delegate, a2))
  {
    v8 = *((_QWORD *)v7 + 1);
    swift_getObjectType();
    v9 = *(void (**)(void))(v8 + 64);
    v10 = a3;
    v11 = a4;
    v12 = self;
    v9();

    swift_unknownObjectRelease();
  }
}

- (void)handleWillTap:(id)a3
{
  id v4;
  _TtC10StickersUI28StickerCollectionStickerCell *v5;

  v4 = a3;
  v5 = self;
  sub_247A67EA8(v4);

}

- (void)handleLongPress:(id)a3 recognizer:(id)a4
{
  id v6;
  id v7;
  _TtC10StickersUI28StickerCollectionStickerCell *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_247A69090(v7);

}

@end
