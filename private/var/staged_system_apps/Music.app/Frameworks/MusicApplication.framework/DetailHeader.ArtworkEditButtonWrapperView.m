@implementation DetailHeader.ArtworkEditButtonWrapperView

- (_TtCC16MusicApplication12DetailHeaderP33_A13DD19D58D33EBE9EDF18CE691179B728ArtworkEditButtonWrapperView)initWithFrame:(CGRect)a3
{
  return (_TtCC16MusicApplication12DetailHeaderP33_A13DD19D58D33EBE9EDF18CE691179B728ArtworkEditButtonWrapperView *)sub_67E118(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC16MusicApplication12DetailHeaderP33_A13DD19D58D33EBE9EDF18CE691179B728ArtworkEditButtonWrapperView)initWithCoder:(id)a3
{
  _TtCC16MusicApplication12DetailHeaderP33_A13DD19D58D33EBE9EDF18CE691179B728ArtworkEditButtonWrapperView *result;

  result = (_TtCC16MusicApplication12DetailHeaderP33_A13DD19D58D33EBE9EDF18CE691179B728ArtworkEditButtonWrapperView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/DetailHeaderView.swift", 39, 2, 1775, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[DetailHeader.ArtworkEditButtonWrapperView intrinsicContentSize](self, "intrinsicContentSize");
  if (height >= width)
    v7 = width;
  else
    v7 = height;
  if (v5 < width && v6 < height)
  {
    v6 = v7;
    v5 = v7;
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtCC16MusicApplication12DetailHeaderP33_A13DD19D58D33EBE9EDF18CE691179B728ArtworkEditButtonWrapperView *v2;
  id v3;
  char *v4;
  double v5;
  double v6;
  CGSize result;

  v2 = self;
  v3 = -[DetailHeader.ArtworkEditButtonWrapperView traitCollection](v2, "traitCollection");
  v4 = (char *)objc_msgSend(v3, "horizontalSizeClass");

  v5 = 64.0;
  if (v4 == (_BYTE *)&dword_0 + 2)
    v5 = 80.0;
  v6 = v5;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  _TtCC16MusicApplication12DetailHeaderP33_A13DD19D58D33EBE9EDF18CE691179B728ArtworkEditButtonWrapperView *v2;

  v2 = self;
  sub_67E6AC();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  id v7;
  char *v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for DetailHeader.ArtworkEditButtonWrapperView();
  v4 = a3;
  v5 = (char *)v10.receiver;
  -[DetailHeader.ArtworkEditButtonWrapperView traitCollectionDidChange:](&v10, "traitCollectionDidChange:", v4);
  v6 = *(void **)&v5[OBJC_IVAR____TtCC16MusicApplication12DetailHeaderP33_A13DD19D58D33EBE9EDF18CE691179B728ArtworkEditButtonWrapperView_button];
  v7 = objc_msgSend(v5, "traitCollection", v10.receiver, v10.super_class);
  v8 = (char *)objc_msgSend(v7, "horizontalSizeClass");

  v9 = 12.0;
  if (v8 == (_BYTE *)&dword_0 + 2)
    v9 = 25.0;
  objc_msgSend(v6, "setImageEdgeInsets:", v9, v9, v9, v9);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication12DetailHeaderP33_A13DD19D58D33EBE9EDF18CE691179B728ArtworkEditButtonWrapperView_button));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication12DetailHeaderP33_A13DD19D58D33EBE9EDF18CE691179B728ArtworkEditButtonWrapperView_visualEffectView));
}

@end
