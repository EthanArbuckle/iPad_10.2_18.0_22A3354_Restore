@implementation PKAccountRewardsSummaryCollectionViewCell

- (void)configureWithRewardsTierSummary:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  PKAccountRewardsSummaryCollectionViewCell *v12;

  v4 = *MEMORY[0x1E0DC3298];
  v5 = *(double *)(MEMORY[0x1E0DC3298] + 8);
  v6 = *(double *)(MEMORY[0x1E0DC3298] + 16);
  v7 = *(double *)(MEMORY[0x1E0DC3298] + 24);
  v8 = a3;
  v12 = self;
  -[PKAccountRewardsSummaryCollectionViewCell setDirectionalLayoutMargins:](v12, sel_setDirectionalLayoutMargins_, v4, v5, v6, v7);
  v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = v8;
  v11 = v8;
  sub_19DE88290();
  -[PKAccountRewardsSummaryCollectionViewCell setNeedsUpdateConfiguration](v12, sel_setNeedsUpdateConfiguration);

}

- (PKAccountRewardsSummaryCollectionViewCell)initWithFrame:(CGRect)a3
{
  PKAccountRewardsSummaryCollectionViewCell *v3;
  PKAccountRewardsSummaryCollectionViewCell *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKAccountRewardsSummaryCollectionViewCell;
  v3 = -[PKAccountRewardsSummaryCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKAccountRewardsSummaryCollectionViewCell layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", 10.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountRewardsSummaryCollectionViewCell setBackgroundColor:](v4, "setBackgroundColor:", v6);

    -[PKAccountRewardsSummaryCollectionViewCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680E0]);
  }
  return v4;
}

@end
