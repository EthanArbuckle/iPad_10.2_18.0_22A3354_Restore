@implementation RatingControlViewController.RatingControl

- (_TtCC16MusicApplication27RatingControlViewControllerP33_3D7C238718D271985528E75C9B517C0913RatingControl)initWithCoder:(id)a3
{
  id v4;
  _TtCC16MusicApplication27RatingControlViewControllerP33_3D7C238718D271985528E75C9B517C0913RatingControl *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication27RatingControlViewControllerP33_3D7C238718D271985528E75C9B517C0913RatingControl_starButtons) = (Class)_swiftEmptyArrayStorage;
  v4 = a3;

  result = (_TtCC16MusicApplication27RatingControlViewControllerP33_3D7C238718D271985528E75C9B517C0913RatingControl *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/RatingControlViewController.swift", 50, 2, 88, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtCC16MusicApplication27RatingControlViewControllerP33_3D7C238718D271985528E75C9B517C0913RatingControl *v2;

  v2 = self;
  sub_53BF88();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtCC16MusicApplication27RatingControlViewControllerP33_3D7C238718D271985528E75C9B517C0913RatingControl *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = sub_53CFDC();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _TtCC16MusicApplication27RatingControlViewControllerP33_3D7C238718D271985528E75C9B517C0913RatingControl *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  CGPoint v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  -[RatingControlViewController.RatingControl bounds](v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  if (qword_14AB408 != -1)
    swift_once(&qword_14AB408, sub_53CDCC);
  v20.origin.x = UIEdgeInsetsInsetRect(v10, v12, v14, v16, *(double *)&qword_14D2310, *(double *)algn_14D2318);
  v19.x = x;
  v19.y = y;
  v17 = CGRectContainsPoint(v20, v19);

  return v17;
}

- (void)panGestureRecognized:(void *)a3
{
  id v4;
  CGFloat v5;
  id v6;

  v4 = a3;
  v6 = a1;
  if (objc_msgSend(v4, "state") == (char *)&dword_0 + 3)
  {
    objc_msgSend(v4, "locationInView:", v6);
    sub_53C8A0(v5);
  }

}

- (_TtCC16MusicApplication27RatingControlViewControllerP33_3D7C238718D271985528E75C9B517C0913RatingControl)initWithFrame:(CGRect)a3
{
  _TtCC16MusicApplication27RatingControlViewControllerP33_3D7C238718D271985528E75C9B517C0913RatingControl *result;

  result = (_TtCC16MusicApplication27RatingControlViewControllerP33_3D7C238718D271985528E75C9B517C0913RatingControl *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.RatingControl", 30, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication27RatingControlViewControllerP33_3D7C238718D271985528E75C9B517C0913RatingControl_panGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication27RatingControlViewControllerP33_3D7C238718D271985528E75C9B517C0913RatingControl_tapGestureRecognizer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtCC16MusicApplication27RatingControlViewControllerP33_3D7C238718D271985528E75C9B517C0913RatingControl_starButtons));
}

@end
