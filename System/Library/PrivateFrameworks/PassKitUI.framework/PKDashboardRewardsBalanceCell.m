@implementation PKDashboardRewardsBalanceCell

- (void)configureWithRewardsBalanceItem:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC9PassKitUI29PKDashboardRewardsBalanceCell *v12;

  v4 = *MEMORY[0x1E0DC3298];
  v5 = *(double *)(MEMORY[0x1E0DC3298] + 8);
  v6 = *(double *)(MEMORY[0x1E0DC3298] + 16);
  v7 = *(double *)(MEMORY[0x1E0DC3298] + 24);
  v8 = a3;
  v12 = self;
  -[PKDashboardRewardsBalanceCell setDirectionalLayoutMargins:](v12, sel_setDirectionalLayoutMargins_, v4, v5, v6, v7);
  v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = v8;
  v11 = v8;
  sub_19DE88290();
  -[PKDashboardRewardsBalanceCell setNeedsUpdateConfiguration](v12, sel_setNeedsUpdateConfiguration);

}

- (_TtC9PassKitUI29PKDashboardRewardsBalanceCell)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for PKDashboardRewardsBalanceCell();
  return -[PKDashboardCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9PassKitUI29PKDashboardRewardsBalanceCell)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PKDashboardRewardsBalanceCell();
  return -[PKDashboardRewardsBalanceCell initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
