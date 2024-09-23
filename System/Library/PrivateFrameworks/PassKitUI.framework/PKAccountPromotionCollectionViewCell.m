@implementation PKAccountPromotionCollectionViewCell

- (BOOL)configureWithPromotion:(id)a3 remoteImagePreparer:(id)a4 actionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  PKAccountPromotionCollectionViewCell *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  LOBYTE(self) = PKAccountPromotionCollectionViewCell.configure(promotion:remoteImagePreparer:actionHandler:)(v10, (uint64_t)v11, (uint64_t)sub_19D5A56C0, v9);

  swift_release();
  return self & 1;
}

- (PKAccountPromotionCollectionViewCell)initWithFrame:(CGRect)a3
{
  PKAccountPromotionCollectionViewCell *v3;
  PKAccountPromotionCollectionViewCell *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKAccountPromotionCollectionViewCell;
  v3 = -[PKAccountPromotionCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKAccountPromotionCollectionViewCell layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", 10.0);

    PKRewardsHubCellBackgroundColor();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountPromotionCollectionViewCell setBackgroundColor:](v4, "setBackgroundColor:", v6);

    -[PKAccountPromotionCollectionViewCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67F18]);
  }
  return v4;
}

@end
