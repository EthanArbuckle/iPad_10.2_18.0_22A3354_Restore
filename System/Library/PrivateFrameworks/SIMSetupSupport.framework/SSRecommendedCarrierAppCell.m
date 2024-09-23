@implementation SSRecommendedCarrierAppCell

+ (id)sharedLockupViewGroup
{
  if (sharedLockupViewGroup_onceToken != -1)
    dispatch_once(&sharedLockupViewGroup_onceToken, &__block_literal_global_20);
  return (id)sharedLockupViewGroup_group;
}

void __52__SSRecommendedCarrierAppCell_sharedLockupViewGroup__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BE04488]), "initWithName:", CFSTR("SimSetupSupport"));
  v1 = (void *)sharedLockupViewGroup_group;
  sharedLockupViewGroup_group = v0;

}

- (SSRecommendedCarrierAppCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SSRecommendedCarrierAppCell *v4;
  SSRecommendedCarrierAppCell *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SSRecommendedCarrierAppCell;
  v4 = -[SSRecommendedCarrierAppCell initWithStyle:reuseIdentifier:](&v18, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SSRecommendedCarrierAppCell setBackgroundView:](v4, "setBackgroundView:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSRecommendedCarrierAppCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v7 = objc_alloc(MEMORY[0x24BE04480]);
    -[SSRecommendedCarrierAppCell contentView](v5, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v9 = (void *)objc_msgSend(v7, "initWithFrame:");

    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend((id)objc_opt_class(), "sharedLockupViewGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setGroup:", v10);

    -[SSRecommendedCarrierAppCell contentView](v5, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v9);

    -[SSRecommendedCarrierAppCell setLockupView:](v5, "setLockupView:", v9);
    v12 = (void *)MEMORY[0x24BDD1628];
    -[SSRecommendedCarrierAppCell contentView](v5, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = 1148846080;
    objc_msgSend(v9, "_maps_constraintsEqualToEdgesOfView:insets:priority:", v13, 10.0, 16.0, 10.0, 16.0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allConstraints");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activateConstraints:", v16);

  }
  return v5;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  -[SSRecommendedCarrierAppCell lockupView](self, "lockupView", a3.width, a3.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", width, 1.79769313e308);
  v8 = v7;

  v9 = v8 + 20.0;
  v10 = width;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)prepareForReuse
{
  ASCLockupRequest *request;
  void *v4;
  objc_super v5;

  request = self->_request;
  self->_request = 0;

  -[ASCLockupView setRequest:](self->_lockupView, "setRequest:", 0);
  -[SSRecommendedCarrierAppCell _dummyLockup](self, "_dummyLockup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupView setLockup:](self->_lockupView, "setLockup:", v4);

  -[ASCLockupView setAutomaticallyPresentsProductDetails:](self->_lockupView, "setAutomaticallyPresentsProductDetails:", 0);
  v5.receiver = self;
  v5.super_class = (Class)SSRecommendedCarrierAppCell;
  -[SSRecommendedCarrierAppCell prepareForReuse](&v5, sel_prepareForReuse);
}

- (void)setLockupRequest:(id)a3 withDelegate:(id)a4
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  if (v7)
  {
    v9 = v7;
    objc_storeStrong((id *)&self->_request, a3);
    v8 = a4;
    -[ASCLockupView setRequest:](self->_lockupView, "setRequest:", self->_request);
    -[ASCLockupView setAutomaticallyPresentsProductDetails:](self->_lockupView, "setAutomaticallyPresentsProductDetails:", 1);
    -[ASCLockupView setDelegate:](self->_lockupView, "setDelegate:", v8);

    v7 = v9;
  }

}

- (id)_dummyLockup
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BE04470]);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04450]), "initWithInt64:", 0);
  v5 = *MEMORY[0x24BE04430];
  -[SSRecommendedCarrierAppCell _dummyArtwork](self, "_dummyArtwork");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:", v4, v5, 0, v6, 0, 0, 0, 0, 0);

  return v7;
}

- (id)_dummyArtwork
{
  id v2;

  v2 = objc_alloc(MEMORY[0x24BE04458]);
  return (id)objc_msgSend(v2, "initWithURLTemplate:width:height:decoration:preferredCrop:preferredFormat:", &stru_24DEF4290, *MEMORY[0x24BE043F8], *MEMORY[0x24BE043F0], *MEMORY[0x24BE04400], 0.0, 0.0);
}

- (ASCLockupView)lockupView
{
  return self->_lockupView;
}

- (void)setLockupView:(id)a3
{
  objc_storeStrong((id *)&self->_lockupView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockupView, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
