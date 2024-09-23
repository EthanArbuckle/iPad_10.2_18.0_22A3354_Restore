@implementation TrendListTableView

- (BOOL)touchesShouldCancelInContentView:(id)a3
{
  return 1;
}

- (_TtC10FitnessApp18TrendListTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TrendListTableView();
  return -[TrendListTableView initWithFrame:style:](&v10, "initWithFrame:style:", a4, x, y, width, height);
}

- (_TtC10FitnessApp18TrendListTableView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TrendListTableView();
  return -[TrendListTableView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
