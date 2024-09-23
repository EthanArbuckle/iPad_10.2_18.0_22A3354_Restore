@implementation PassThroughStackView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC5MusicP33_B29993BA797B47F8C660EB2DB95D08BA20PassThroughStackView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_1001383D0((uint64_t)a4, x, y);

  return v10;
}

- (_TtC5MusicP33_B29993BA797B47F8C660EB2DB95D08BA20PassThroughStackView)initWithFrame:(CGRect)a3
{
  return (_TtC5MusicP33_B29993BA797B47F8C660EB2DB95D08BA20PassThroughStackView *)sub_100138520(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for PassThroughStackView);
}

- (_TtC5MusicP33_B29993BA797B47F8C660EB2DB95D08BA20PassThroughStackView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PassThroughStackView();
  return -[PassThroughStackView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
