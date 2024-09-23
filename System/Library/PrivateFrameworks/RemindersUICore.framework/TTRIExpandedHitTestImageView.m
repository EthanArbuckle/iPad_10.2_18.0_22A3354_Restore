@implementation TTRIExpandedHitTestImageView

- (void)layoutSubviews
{
  _TtC15RemindersUICore28TTRIExpandedHitTestImageView *v2;

  v2 = self;
  TTRIExpandedHitTestImageView.layoutSubviews()();

}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = sub_1B44CA714(self, (uint64_t)a2, type metadata accessor for TTRIExpandedHitTestImageView);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setAccessibilityFrame:(CGRect)a3
{
  sub_1B44CA7F8(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, type metadata accessor for TTRIExpandedHitTestImageView);
}

- (_TtC15RemindersUICore28TTRIExpandedHitTestImageView)initWithImage:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TTRIExpandedHitTestImageView();
  return -[TTRIExpandedHitTestImageView initWithImage:](&v5, sel_initWithImage_, a3);
}

- (_TtC15RemindersUICore28TTRIExpandedHitTestImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TTRIExpandedHitTestImageView();
  return -[TTRIExpandedHitTestImageView initWithImage:highlightedImage:](&v7, sel_initWithImage_highlightedImage_, a3, a4);
}

- (_TtC15RemindersUICore28TTRIExpandedHitTestImageView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore28TTRIExpandedHitTestImageView *)sub_1B44CAB24(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, type metadata accessor for TTRIExpandedHitTestImageView);
}

- (_TtC15RemindersUICore28TTRIExpandedHitTestImageView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore28TTRIExpandedHitTestImageView *)sub_1B42FB42C(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for TTRIExpandedHitTestImageView);
}

@end
