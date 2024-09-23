@implementation TTRICompletedButton

- (_TtC15RemindersUICore19TTRICompletedButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC15RemindersUICore19TTRICompletedButton *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TTRICompletedButton();
  v7 = -[TTRIExpandedHitTestButton initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  TTRICompletedButton.commonInit()();

  return v7;
}

- (_TtC15RemindersUICore19TTRICompletedButton)initWithCoder:(id)a3
{
  id v4;
  _TtC15RemindersUICore19TTRICompletedButton *v5;
  _TtC15RemindersUICore19TTRICompletedButton *v6;
  _TtC15RemindersUICore19TTRICompletedButton *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TTRICompletedButton();
  v4 = a3;
  v5 = -[TTRIExpandedHitTestButton initWithCoder:](&v9, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    TTRICompletedButton.commonInit()();

  }
  return v6;
}

- (CGSize)intrinsicContentSize
{
  _TtC15RemindersUICore19TTRICompletedButton *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = TTRICompletedButton.intrinsicContentSize.getter();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

@end
