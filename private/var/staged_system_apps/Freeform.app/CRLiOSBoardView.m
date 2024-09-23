@implementation CRLiOSBoardView

- (void)didMoveToWindow
{
  char *v2;
  uint64_t Strong;
  uint64_t v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CRLiOSBoardView();
  v2 = (char *)v6.receiver;
  -[CRLiOSBoardView didMoveToWindow](&v6, "didMoveToWindow");
  Strong = swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtC8Freeform15CRLiOSBoardView_delegate]);
  if (Strong)
  {
    v4 = Strong;
    v5 = objc_msgSend(v2, "window", v6.receiver, v6.super_class);
    sub_100C4A700(v5);

    swift_unknownObjectRelease(v4);
  }
  else
  {

  }
}

- (_TtC8Freeform15CRLiOSBoardView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC8Freeform15CRLiOSBoardView_delegate;
  *((_QWORD *)v8 + 1) = 0;
  swift_unknownObjectWeakInit(v8);
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CRLiOSBoardView();
  return -[CRLiOSBoardView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC8Freeform15CRLiOSBoardView)initWithCoder:(id)a3
{
  char *v5;
  objc_super v7;

  v5 = (char *)self + OBJC_IVAR____TtC8Freeform15CRLiOSBoardView_delegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRLiOSBoardView();
  return -[CRLiOSBoardView initWithCoder:](&v7, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform15CRLiOSBoardView_delegate);
}

@end
