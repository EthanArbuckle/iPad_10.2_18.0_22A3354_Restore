@implementation MusicPageHeaderPlayButton

- (MusicPageHeaderPlayButton)initWithFrame:(CGRect)a3
{
  return (MusicPageHeaderPlayButton *)sub_E124C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MusicPageHeaderPlayButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_E1C64();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  MusicPageHeaderPlayButton *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_E14E4(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  MusicPageHeaderPlayButton *v2;

  v2 = self;
  sub_E15EC();

}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PageHeaderPlayButton();
  return -[MusicPageHeaderPlayButton isHighlighted](&v3, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  MusicPageHeaderPlayButton *v4;

  v4 = self;
  sub_E18D0(a3);

}

- (void).cxx_destruct
{

}

@end
