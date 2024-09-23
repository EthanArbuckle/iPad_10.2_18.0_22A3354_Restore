@implementation PassThroughStackView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC16MusicApplicationP33_DAB54CA7D29920EBBFDD710D11133BE820PassThroughStackView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_6F9B58((uint64_t)a4, x, y);

  return v10;
}

- (_TtC16MusicApplicationP33_DAB54CA7D29920EBBFDD710D11133BE820PassThroughStackView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplicationP33_DAB54CA7D29920EBBFDD710D11133BE820PassThroughStackView *)sub_6F9CA8(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for PassThroughStackView);
}

- (_TtC16MusicApplicationP33_DAB54CA7D29920EBBFDD710D11133BE820PassThroughStackView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PassThroughStackView();
  return -[PassThroughStackView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
