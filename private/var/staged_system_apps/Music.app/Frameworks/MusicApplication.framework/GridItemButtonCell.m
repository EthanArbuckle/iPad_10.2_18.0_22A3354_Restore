@implementation GridItemButtonCell

- (_TtC16MusicApplication18GridItemButtonCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication18GridItemButtonCell *)sub_5ACD70(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication18GridItemButtonCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_5AE11C();
}

- (NSString)buttonTitle
{
  return (NSString *)sub_1866A0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication18GridItemButtonCell_buttonTitle);
}

- (void)setButtonTitle:(id)a3
{
  sub_5AD218((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC16MusicApplication18GridItemButtonCell_buttonTitle, (void (*)(uint64_t, uint64_t))sub_5AD01C);
}

- (NSString)buttonSubtitle
{
  return (NSString *)sub_1866A0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication18GridItemButtonCell_buttonSubtitle);
}

- (void)setButtonSubtitle:(id)a3
{
  sub_5AD218((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC16MusicApplication18GridItemButtonCell_buttonSubtitle, (void (*)(uint64_t, uint64_t))sub_5AD2D4);
}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[GridItemButtonCell tintColorDidChange](&v3, "tintColorDidChange");
  sub_5ADEAC();

}

- (void)layoutSubviews
{
  _TtC16MusicApplication18GridItemButtonCell *v2;

  v2 = self;
  sub_5AD5C0();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  BOOL v7;
  double v8;
  double v9;
  objc_super v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v10.receiver = *(Class *)((char *)&self->super.super.super.super.super.isa
                          + OBJC_IVAR____TtC16MusicApplication18GridItemButtonCell_actionButton);
  v10.super_class = (Class)type metadata accessor for SubtitledButton();
  -[GridItemButtonCell sizeThatFits:](&v10, "sizeThatFits:", width, height);
  v6 = v5 + 24.0;
  v7 = v5 > 50.0;
  v8 = 74.0;
  if (v7)
    v8 = v6;
  v9 = width;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->buttonTitle[OBJC_IVAR____TtC16MusicApplication18GridItemButtonCell_buttonTitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->buttonTitle[OBJC_IVAR____TtC16MusicApplication18GridItemButtonCell_buttonSubtitle]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication18GridItemButtonCell_buttonHandler), *(_QWORD *)&self->buttonTitle[OBJC_IVAR____TtC16MusicApplication18GridItemButtonCell_buttonHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication18GridItemButtonCell_actionButton));
}

@end
