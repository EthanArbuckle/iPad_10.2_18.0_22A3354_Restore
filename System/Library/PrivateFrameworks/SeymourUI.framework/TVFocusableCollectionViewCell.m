@implementation TVFocusableCollectionViewCell

- (BOOL)canBecomeFocused
{
  return (*((_BYTE *)&self->super.super.super.super.super.isa
          + OBJC_IVAR____TtC9SeymourUI29TVFocusableCollectionViewCell_underlyingControlState) & 2) == 0;
}

- (void)prepareForReuse
{
  _QWORD *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TVFocusableCollectionViewCell();
  v2 = v3.receiver;
  -[TVFocusableCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  (*(void (**)(_QWORD, _QWORD))((*MEMORY[0x24BEE4EA0] & *v2) + 0x80))(0, 0);

}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC9SeymourUI29TVFocusableCollectionViewCell *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  sub_22B0F1718(0, &qword_255B8A790);
  sub_22B0F16D8((unint64_t *)&qword_255B8A798, &qword_255B8A790);
  v6 = sub_22BA80AF0();
  v7 = a4;
  v8 = self;
  if (sub_22B483E40(v6)
    && (v9 = *(uint64_t *)((char *)&v8->super.super.super.super.super.isa
                        + OBJC_IVAR____TtC9SeymourUI29TVFocusableCollectionViewCell_underlyingControlState),
        (v9 & 8) != 0))
  {
    (*(void (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & (uint64_t)v8->super.super.super.super.super.isa)
                                             + 0x80))(v9 | 1, 1);

    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = (void *)sub_22BA80AE4();
    v11.receiver = v8;
    v11.super_class = (Class)type metadata accessor for TVFocusableCollectionViewCell();
    -[TVFocusableCollectionViewCell pressesBegan:withEvent:](&v11, sel_pressesBegan_withEvent_, v10, v7);

    swift_bridgeObjectRelease();
  }

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  sub_22B5F6278(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_pressesCancelled_withEvent_);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  sub_22B5F6278(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_pressesEnded_withEvent_);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  _TtC9SeymourUI29TVFocusableCollectionViewCell *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22B5F63B4(v6, v7);

}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  void *v7;
  id v8;
  _TtC9SeymourUI29TVFocusableCollectionViewCell *v9;
  id v10;

  v7 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.super.super.super.super.isa) + 0x78))();
  v8 = a4;
  v9 = self;
  v10 = objc_msgSend(v7, sel__preferredConfigurationForFocusAnimation_inContext_, a3, v8);

  return v10;
}

- (_TtC9SeymourUI29TVFocusableCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI29TVFocusableCollectionViewCell_underlyingControlState) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TVFocusableCollectionViewCell();
  return -[TVFocusableCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9SeymourUI29TVFocusableCollectionViewCell)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI29TVFocusableCollectionViewCell_underlyingControlState) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVFocusableCollectionViewCell();
  return -[TVFocusableCollectionViewCell initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
