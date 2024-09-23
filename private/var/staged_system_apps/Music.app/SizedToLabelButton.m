@implementation SizedToLabelButton

- (CGSize)intrinsicContentSize
{
  _TtC5MusicP33_B29993BA797B47F8C660EB2DB95D08BA18SizedToLabelButton *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v2 = self;
  v3 = -[SizedToLabelButton titleLabel](v2, "titleLabel");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "intrinsicContentSize");
    v6 = v5;
    v8 = v7;

  }
  else
  {

    v8 = 0.0;
    v6 = 0.0;
  }
  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC5MusicP33_B29993BA797B47F8C660EB2DB95D08BA18SizedToLabelButton)initWithFrame:(CGRect)a3
{
  return (_TtC5MusicP33_B29993BA797B47F8C660EB2DB95D08BA18SizedToLabelButton *)sub_100138520(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for SizedToLabelButton);
}

- (_TtC5MusicP33_B29993BA797B47F8C660EB2DB95D08BA18SizedToLabelButton)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SizedToLabelButton();
  return -[SizedToLabelButton initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
