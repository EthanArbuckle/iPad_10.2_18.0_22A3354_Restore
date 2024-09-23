@implementation TTRIQuickBarQuickPickButton

- (_TtC15RemindersUICore27TTRIQuickBarQuickPickButton)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore27TTRIQuickBarQuickPickButton *)sub_1B43FFC8C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICore27TTRIQuickBarQuickPickButton)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore27TTRIQuickBarQuickPickButton *)sub_1B43FFE04(a3);
}

- (BOOL)isHighlighted
{
  return sub_1B44001C4(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC15RemindersUICore27TTRIQuickBarQuickPickButton *v4;

  v4 = self;
  sub_1B43FFFB8(a3);

}

- (BOOL)isSelected
{
  return sub_1B44001C4(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[TTRIQuickBarQuickPickButton setSelected:](&v5, sel_setSelected_, v3);
  v4[OBJC_IVAR____TtC15RemindersUICore27TTRIQuickBarQuickPickButton_colorsAreDirty] = 1;
  objc_msgSend(v4, sel_setNeedsLayout, v5.receiver, v5.super_class);

}

- (void)layoutSubviews
{
  _TtC15RemindersUICore27TTRIQuickBarQuickPickButton *v2;

  v2 = self;
  sub_1B440027C();

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 44.0;
  v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

@end
