@implementation HitView

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC17SequoiaTranslator7HitView *v7;
  uint64_t v8;
  _TtC17SequoiaTranslator7HitView *v9;
  char v10;
  _OWORD v12[2];

  if (a4)
  {
    v7 = self;
    v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v12, v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  v10 = sub_100010BE0((uint64_t)a3);

  sub_1000110E8((uint64_t)v12);
  return v10 & 1;
}

- (void)oneSelectedWithSender:(id)a3
{
  sub_10000F9B8(self, (uint64_t)a2, (uint64_t)a3, 0);
}

- (void)twoSelectedWithSender:(id)a3
{
  sub_10000F9B8(self, (uint64_t)a2, (uint64_t)a3, 1uLL);
}

- (void)threeSelectedWithSender:(id)a3
{
  sub_10000F9B8(self, (uint64_t)a2, (uint64_t)a3, 2uLL);
}

- (void)fourSelectedWithSender:(id)a3
{
  sub_10000F9B8(self, (uint64_t)a2, (uint64_t)a3, 3uLL);
}

- (_TtC17SequoiaTranslator7HitView)initWithFrame:(CGRect)a3
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
  v8 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator7HitView_delegate;
  *((_QWORD *)v8 + 1) = 0;
  swift_unknownObjectWeakInit(v8, 0);
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for HitView();
  return -[HitView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC17SequoiaTranslator7HitView)initWithCoder:(id)a3
{
  char *v5;
  objc_super v7;

  v5 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator7HitView_delegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for HitView();
  return -[HitView initWithCoder:](&v7, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_100011194((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator7HitView_delegate);
}

@end
