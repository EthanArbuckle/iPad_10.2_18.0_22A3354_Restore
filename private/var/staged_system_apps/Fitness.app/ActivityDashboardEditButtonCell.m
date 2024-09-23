@implementation ActivityDashboardEditButtonCell

- (void)prepareForReuse
{
  id v2;
  _OWORD v3[2];
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ActivityDashboardEditButtonCell();
  v2 = v5.receiver;
  -[ActivityDashboardEditButtonCell prepareForReuse](&v5, "prepareForReuse");
  v4 = 0;
  memset(v3, 0, sizeof(v3));
  UICollectionViewCell.contentConfiguration.setter(v3);

}

- (_TtC10FitnessApp31ActivityDashboardEditButtonCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ActivityDashboardEditButtonCell();
  return -[ActivityDashboardEditButtonCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC10FitnessApp31ActivityDashboardEditButtonCell)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ActivityDashboardEditButtonCell();
  return -[ActivityDashboardEditButtonCell initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
