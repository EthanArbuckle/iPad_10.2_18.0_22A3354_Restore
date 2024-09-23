@implementation MoreButton

- (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710MoreButton)init
{
  return (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710MoreButton *)sub_67DCA4();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double *v8;
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  id v18;
  _TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710MoreButton *v19;
  BOOL v20;
  CGPoint v22;
  CGRect v23;

  y = a3.y;
  x = a3.x;
  v8 = (double *)((char *)self
                + OBJC_IVAR____TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710MoreButton_hitArea);
  if ((self->hitArea[OBJC_IVAR____TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710MoreButton_hitArea + 24] & 1) != 0)
  {
    v9 = a4;
    -[MoreButton bounds](self, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
  }
  else
  {
    v15 = v8[2];
    v17 = v8[3];
    v11 = *v8;
    v13 = v8[1];
    v18 = a4;
    v19 = self;
  }
  v23.origin.x = v11;
  v23.origin.y = v13;
  v23.size.width = v15;
  v23.size.height = v17;
  v22.x = x;
  v22.y = y;
  v20 = CGRectContainsPoint(v23, v22);

  return v20;
}

- (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710MoreButton)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710MoreButton *result;

  v4 = (char *)self + OBJC_IVAR____TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710MoreButton_hitArea;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  v5 = a3;

  result = (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710MoreButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/DetailHeaderView.swift", 39, 2, 1738, 0);
  __break(1u);
  return result;
}

- (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710MoreButton)initWithFrame:(CGRect)a3
{
  sub_2EA80C((uint64_t)self, (uint64_t)a2, (uint64_t)"MusicApplication.MoreButton", 27);
}

@end
