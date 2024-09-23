@implementation FMTableView

- (_TtC6FindMy11FMTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  char *v10;
  uint64_t v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = (char *)self + OBJC_IVAR____TtC6FindMy11FMTableView_newIndexPath;
  v11 = type metadata accessor for IndexPath(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for FMTableView(0);
  return -[FMTableView initWithFrame:style:](&v13, "initWithFrame:style:", a4, x, y, width, height);
}

- (void).cxx_destruct
{
  sub_10002F6A0((uint64_t)self + OBJC_IVAR____TtC6FindMy11FMTableView_newIndexPath);
}

- (_TtC6FindMy11FMTableView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  objc_super v8;

  v5 = (char *)self + OBJC_IVAR____TtC6FindMy11FMTableView_newIndexPath;
  v6 = type metadata accessor for IndexPath(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FMTableView(0);
  return -[FMTableView initWithCoder:](&v8, "initWithCoder:", a3);
}

@end
