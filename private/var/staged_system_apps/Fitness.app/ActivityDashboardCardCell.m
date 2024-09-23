@implementation ActivityDashboardCardCell

- (void)prepareForReuse
{
  id v2;
  uint64_t v3;
  _OWORD v4[2];
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ActivityDashboardCardCell();
  v2 = v6.receiver;
  -[ActivityDashboardCardCell prepareForReuse](&v6, "prepareForReuse");
  v5 = 0;
  memset(v4, 0, sizeof(v4));
  UICollectionViewCell.contentConfiguration.setter(v4);
  v3 = OBJC_IVAR____TtC10FitnessApp25ActivityDashboardCardCell_isJiggling;
  if (*((_BYTE *)v2 + OBJC_IVAR____TtC10FitnessApp25ActivityDashboardCardCell_isJiggling) == 1)
  {
    sub_1005C34D8(0, v2);
    *((_BYTE *)v2 + v3) = 0;
  }

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  _TtC10FitnessApp25ActivityDashboardCardCell *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9 = self;
  v10 = sub_10056141C(width, height, a4, a5);
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ActivityDashboardCardCell();
  -[ActivityDashboardCardCell bounds](&v6, "bounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC10FitnessApp25ActivityDashboardCardCell *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_1005619A4(x, y, width, height);

}

- (_TtC10FitnessApp25ActivityDashboardCardCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  char *v9;
  objc_class *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp25ActivityDashboardCardCell_hostViewController) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC10FitnessApp25ActivityDashboardCardCell_summaryCoordinator;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp25ActivityDashboardCardCell_loadingCardHeightProvider) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC10FitnessApp25ActivityDashboardCardCell_isJiggling) = 0;
  v9 = (char *)self + OBJC_IVAR____TtC10FitnessApp25ActivityDashboardCardCell_card;
  v10 = (objc_class *)type metadata accessor for ActivityDashboardCardCell();
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((_QWORD *)v9 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v10;
  return -[ActivityDashboardCardCell initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
}

- (_TtC10FitnessApp25ActivityDashboardCardCell)initWithCoder:(id)a3
{
  return (_TtC10FitnessApp25ActivityDashboardCardCell *)sub_100561B64(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25ActivityDashboardCardCell_hostViewController));
  sub_10001BE90((uint64_t)self + OBJC_IVAR____TtC10FitnessApp25ActivityDashboardCardCell_summaryCoordinator, &qword_1008324B0);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC10FitnessApp25ActivityDashboardCardCell_loadingCardHeightProvider));
  sub_10001BE90((uint64_t)self + OBJC_IVAR____TtC10FitnessApp25ActivityDashboardCardCell_card, &qword_100832410);
}

@end
