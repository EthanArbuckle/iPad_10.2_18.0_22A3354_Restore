@implementation MusicVideoVerticalLockupCollectionViewCell

- (void)layoutSubviews
{
  _TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell *v2;

  v2 = self;
  sub_660414();

}

- (_TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  uint64_t v9;
  void *v10;
  _TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell *v11;
  id v12;
  void *v13;
  uint64_t v14;
  objc_super v16;
  __int128 v17[2];
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  __int128 v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell_duration;
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  v9 = OBJC_IVAR____TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell_textComponents;
  v10 = (void *)objc_opt_self(UIFont);
  v11 = self;
  v12 = objc_msgSend(v10, "preferredFontForTextStyle:", UIFontTextStyleBody);
  v13 = (void *)objc_opt_self(UIColor);
  *(_QWORD *)&v17[0] = objc_msgSend(v13, "whiteColor");
  *((_QWORD *)&v17[0] + 1) = objc_msgSend(v13, "clearColor");
  v17[1] = xmmword_1063CD0;
  v18 = 0;
  v19 = 0;
  v20 = v12;
  v21 = 1;
  v22 = xmmword_1075610;
  v14 = type metadata accessor for TextStackView.Component();
  swift_allocObject(v14, 264, 7);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v9) = (Class)TextStackView.Component.init(identifier:labelProperties:)(0x6E6F697461727564, 0xE800000000000000, v17);
  *(Class *)((char *)&v11->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell_durationTextStackView) = 0;
  *(Class *)((char *)&v11->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell_gradientView) = 0;
  *((_BYTE *)&v11->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell_isGradientViewHidden) = 1;

  v16.receiver = v11;
  v16.super_class = (Class)type metadata accessor for MusicVideoVerticalLockupCollectionViewCell(0);
  return -[VerticalLockupCollectionViewCell initWithFrame:](&v16, "initWithFrame:", x, y, width, height);
}

- (_TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3;
  _TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell *v4;

  v3 = a3;
  v4 = (_TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell *)sub_660D20((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell_textComponents));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell_durationTextStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell_gradientView));
}

@end
