@implementation TTRListBadgeView.EmojiView

- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A49EmojiView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A49EmojiView *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TTRListBadgeView.EmojiView();
  v7 = -[TTRListBadgeView.EmojiView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  -[TTRListBadgeView.EmojiView setTextAlignment:](v7, sel_setTextAlignment_, 1);
  return v7;
}

- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A49EmojiView)initWithCoder:(id)a3
{
  _TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A49EmojiView *result;

  result = (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A49EmojiView *)sub_1B4908144();
  __break(1u);
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A49EmojiView *v11;
  objc_super v12;

  v4 = UIEdgeInsetsInsetRect_1(a3.origin.x);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for TTRListBadgeView.EmojiView();
  v11 = self;
  -[TTRListBadgeView.EmojiView drawTextInRect:](&v12, sel_drawTextInRect_, v4, v6, v8, v10);

}

@end
