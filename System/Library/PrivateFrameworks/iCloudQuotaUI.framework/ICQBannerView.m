@implementation ICQBannerView

+ (BOOL)shouldShowForOffer:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "level");
  objc_msgSend(v3, "bannerSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  return !v6;
}

+ (BOOL)shouldShowForDismissibleOffer:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  int v16;
  NSObject *v17;
  BOOL v18;
  BOOL v19;
  _DWORD v21[2];
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "level");
  objc_msgSend(v3, "recommendationSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recommendationSpecification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEC7300], "sharedOfferManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "didDismissRecommendationForBundleId:", v10);

  objc_msgSend(v3, "recommendationSpecification");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "supressUntil");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  v16 = objc_msgSend(MEMORY[0x24BEC7350], "shouldDisplay:forReason:dismissedInSession:supressUntil:", v6, v8, v11, v15);
  _ICQBannerLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v21[0] = 67110658;
    v21[1] = v16;
    v22 = 1024;
    v23 = v4 != 0;
    v24 = 1024;
    v25 = v5 != 0;
    v26 = 2112;
    v27 = v8;
    v28 = 1024;
    v29 = v11;
    v30 = 2112;
    v31 = v6;
    v32 = 2048;
    v33 = v15;
    _os_log_impl(&dword_21F2CC000, v17, OS_LOG_TYPE_DEFAULT, "shouldShowBanner: %d considering needsBanner: %d hasBanner: %d specReason: %@ didDismissInSession: %d currentDate: %@ supressInterval: %f", (uint8_t *)v21, 0x38u);
  }

  if (v4)
    v18 = v5 == 0;
  else
    v18 = 1;
  if (v18)
    v19 = 0;
  else
    v19 = v16;

  return v19;
}

- (ICQBannerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  ICQBannerView *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x24BEC7300], "sharedOfferManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentOffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ICQBannerView _initWithFrame:offer:dismissibility:](self, "_initWithFrame:offer:dismissibility:", v9, 0, x, y, width, height);
  return v10;
}

- (ICQBannerView)initWithOffer:(id)a3
{
  return (ICQBannerView *)-[ICQBannerView _initWithFrame:offer:dismissibility:](self, "_initWithFrame:offer:dismissibility:", a3, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (ICQBannerView)initWithDismissibleOffer:(id)a3
{
  return (ICQBannerView *)-[ICQBannerView _initWithFrame:offer:dismissibility:](self, "_initWithFrame:offer:dismissibility:", a3, 1, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (id)_initWithFrame:(CGRect)a3 offer:(id)a4 dismissibility:(BOOL)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  ICQBannerView *v13;
  ICQBannerView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void **v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  objc_super v77;
  void *v78;
  void *v79;
  _QWORD v80[2];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v80[1] = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v77.receiver = self;
  v77.super_class = (Class)ICQBannerView;
  v13 = -[ICQBannerView initWithFrame:](&v77, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_offer, a4);
    v14->_isDismissible = a5;
    -[ICQBannerView _registerForDarwinNotifications](v14, "_registerForDarwinNotifications");
    if (!v14->_isDismissible)
      goto LABEL_6;
    objc_msgSend(v12, "recommendationSpecification");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14->_isLegacy = 0;
      -[ICQBannerView dismissibleBubbleBanner](v14, "dismissibleBubbleBanner");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[ICQBannerView dismissibleBubbleBanner](v14, "dismissibleBubbleBanner");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQBannerView addSubview:](v14, "addSubview:", v17);

      -[ICQBannerView dismissibleBubbleBanner](v14, "dismissibleBubbleBanner");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "topAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQBannerView topAnchor](v14, "topAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setActive:", 1);

      -[ICQBannerView dismissibleBubbleBanner](v14, "dismissibleBubbleBanner");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bottomAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQBannerView bottomAnchor](v14, "bottomAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setActive:", 1);

      -[ICQBannerView dismissibleBubbleBanner](v14, "dismissibleBubbleBanner");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "leadingAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQBannerView leadingAnchor](v14, "leadingAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintEqualToAnchor:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setActive:", 1);

      -[ICQBannerView dismissibleBubbleBanner](v14, "dismissibleBubbleBanner");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "trailingAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQBannerView trailingAnchor](v14, "trailingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setActive:", 1);

      -[ICQBannerView dismissibleBubbleBanner](v14, "dismissibleBubbleBanner");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v80[0] = v34;
      v35 = (void **)v80;
LABEL_9:
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQBannerView setAccessibilityElements:](v14, "setAccessibilityElements:", v75);

      -[ICQBannerView setIsAccessibilityElement:](v14, "setIsAccessibilityElement:", 0);
      -[ICQBannerView sizeToFit](v14, "sizeToFit");
      goto LABEL_10;
    }
    if (!v14->_isDismissible)
    {
LABEL_6:
      objc_msgSend(v12, "bannerSpecification");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "bannerSource");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)*MEMORY[0x24BEC71F0];

      if (v37 == v38)
      {
        v14->_isLegacy = 0;
        -[ICQBannerView bubbleBanner](v14, "bubbleBanner");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        -[ICQBannerView bubbleBanner](v14, "bubbleBanner");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICQBannerView addSubview:](v14, "addSubview:", v58);

        -[ICQBannerView bubbleBanner](v14, "bubbleBanner");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "topAnchor");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICQBannerView topAnchor](v14, "topAnchor");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "constraintEqualToAnchor:", v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setActive:", 1);

        -[ICQBannerView bubbleBanner](v14, "bubbleBanner");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "bottomAnchor");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICQBannerView bottomAnchor](v14, "bottomAnchor");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "constraintEqualToAnchor:", v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setActive:", 1);

        -[ICQBannerView bubbleBanner](v14, "bubbleBanner");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "leadingAnchor");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICQBannerView leadingAnchor](v14, "leadingAnchor");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "constraintEqualToAnchor:", v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "setActive:", 1);

        -[ICQBannerView bubbleBanner](v14, "bubbleBanner");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "trailingAnchor");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICQBannerView trailingAnchor](v14, "trailingAnchor");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "constraintEqualToAnchor:", v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "setActive:", 1);

        -[ICQBannerView bubbleBanner](v14, "bubbleBanner");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v34;
        v35 = &v79;
        goto LABEL_9;
      }
    }
    v14->_isLegacy = 1;
    -[ICQBannerView legacyBanner](v14, "legacyBanner");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[ICQBannerView legacyBanner](v14, "legacyBanner");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQBannerView addSubview:](v14, "addSubview:", v40);

    -[ICQBannerView legacyBanner](v14, "legacyBanner");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQBannerView topAnchor](v14, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setActive:", 1);

    -[ICQBannerView legacyBanner](v14, "legacyBanner");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQBannerView bottomAnchor](v14, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setActive:", 1);

    -[ICQBannerView legacyBanner](v14, "legacyBanner");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQBannerView leadingAnchor](v14, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setActive:", 1);

    -[ICQBannerView legacyBanner](v14, "legacyBanner");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "trailingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQBannerView trailingAnchor](v14, "trailingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setActive:", 1);

    -[ICQBannerView legacyBanner](v14, "legacyBanner");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v34;
    v35 = &v78;
    goto LABEL_9;
  }
LABEL_10:

  return v14;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (-[ICQBannerView isLegacy](self, "isLegacy"))
  {
    -[ICQBannerView legacyBanner](self, "legacyBanner");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sizeThatFits:", width, height);
    v10 = v9;
    v12 = v11;

    v13 = v10;
    v14 = v12;
  }
  else
  {
    LODWORD(v6) = 1148846080;
    LODWORD(v7) = 1112014848;
    -[ICQBannerView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v6, v7);
    v13 = width;
  }
  result.height = v14;
  result.width = v13;
  return result;
}

- (ICQLegacyBannerView)legacyBanner
{
  ICQLegacyBannerView *legacyBanner;
  ICQLegacyBannerView *v4;
  void *v5;
  ICQLegacyBannerView *v6;
  ICQLegacyBannerView *v7;

  legacyBanner = self->_legacyBanner;
  if (!legacyBanner)
  {
    v4 = [ICQLegacyBannerView alloc];
    -[ICQBannerView offer](self, "offer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ICQLegacyBannerView initWithOffer:](v4, "initWithOffer:", v5);
    v7 = self->_legacyBanner;
    self->_legacyBanner = v6;

    -[ICQLegacyBannerView setDelegate:](self->_legacyBanner, "setDelegate:", self);
    legacyBanner = self->_legacyBanner;
  }
  return legacyBanner;
}

- (_TtC13iCloudQuotaUI19ICQBubbleBannerView)bubbleBanner
{
  _TtC13iCloudQuotaUI19ICQBubbleBannerView *bubbleBanner;
  _TtC13iCloudQuotaUI19ICQBubbleBannerView *v4;
  void *v5;
  void *v6;
  void *v7;
  _TtC13iCloudQuotaUI19ICQBubbleBannerView *v8;
  _TtC13iCloudQuotaUI19ICQBubbleBannerView *v9;

  bubbleBanner = self->_bubbleBanner;
  if (!bubbleBanner)
  {
    v4 = [_TtC13iCloudQuotaUI19ICQBubbleBannerView alloc];
    -[ICQBannerView offer](self, "offer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQBannerView offer](self, "offer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bannerSpecification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ICQBubbleBannerView initWithOffer:bannerSpecification:](v4, "initWithOffer:bannerSpecification:", v5, v7);
    v9 = self->_bubbleBanner;
    self->_bubbleBanner = v8;

    -[ICQBubbleBannerView setDelegate:](self->_bubbleBanner, "setDelegate:", self);
    -[ICQBubbleBannerView setTranslatesAutoresizingMaskIntoConstraints:](self->_bubbleBanner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    bubbleBanner = self->_bubbleBanner;
  }
  return bubbleBanner;
}

- (_TtC13iCloudQuotaUI19ICQBubbleBannerView)dismissibleBubbleBanner
{
  _TtC13iCloudQuotaUI19ICQBubbleBannerView *dismissibleBubbleBanner;
  _TtC13iCloudQuotaUI19ICQBubbleBannerView *v4;
  void *v5;
  void *v6;
  void *v7;
  _TtC13iCloudQuotaUI19ICQBubbleBannerView *v8;
  _TtC13iCloudQuotaUI19ICQBubbleBannerView *v9;

  dismissibleBubbleBanner = self->_dismissibleBubbleBanner;
  if (!dismissibleBubbleBanner)
  {
    v4 = [_TtC13iCloudQuotaUI19ICQBubbleBannerView alloc];
    -[ICQBannerView offer](self, "offer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQBannerView offer](self, "offer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recommendationSpecification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ICQBubbleBannerView initWithOffer:bannerSpecification:](v4, "initWithOffer:bannerSpecification:", v5, v7);
    v9 = self->_dismissibleBubbleBanner;
    self->_dismissibleBubbleBanner = v8;

    -[ICQBubbleBannerView setDelegate:](self->_dismissibleBubbleBanner, "setDelegate:", self);
    -[ICQBubbleBannerView setTranslatesAutoresizingMaskIntoConstraints:](self->_dismissibleBubbleBanner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    dismissibleBubbleBanner = self->_dismissibleBubbleBanner;
  }
  return dismissibleBubbleBanner;
}

- (BOOL)performActionWith:(id)a3
{
  id v4;
  unint64_t v5;
  char v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "action");
  switch(v5)
  {
    case 'd':
    case 'h':
    case 'm':
    case '{':
    case '|':
      goto LABEL_10;
    case 'e':
    case 'g':
    case 'o':
    case 'q':
    case 'r':
    case 'w':
    case 'z':
    case '~':
      goto LABEL_5;
    case 'f':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'n':
    case 'p':
    case 's':
    case 't':
    case 'u':
    case 'v':
    case 'x':
    case 'y':
    case '\x7F':
      goto LABEL_2;
    case '}':
      -[ICQBannerView handleBannerDismiss:](self, "handleBannerDismiss:", v4);
      goto LABEL_8;
    default:
      if (v5 > 6)
        goto LABEL_8;
      if (((1 << v5) & 0x37) != 0)
      {
LABEL_5:
        _ICQGetLogSystem();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "action");
          _ICQStringForAction();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 138543362;
          v14 = v8;
          _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "ICQ Banner: unimplemented action %{public}@", (uint8_t *)&v13, 0xCu);

        }
LABEL_8:
        v9 = 0;
      }
      else
      {
        if (v5 == 3)
        {
LABEL_2:
          v6 = -[ICQBannerView _launchFlowManagerWithLink:](self, "_launchFlowManagerWithLink:", v4);
        }
        else
        {
LABEL_10:
          _ICQGetLogSystem();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v4, "action");
            _ICQStringForAction();
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = 138543362;
            v14 = v11;
            _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "ICQ Banner: perform action %{public}@", (uint8_t *)&v13, 0xCu);

          }
          v6 = objc_msgSend(v4, "performAction");
        }
        v9 = v6;
      }

      return v9;
  }
}

- (BOOL)_launchFlowManagerWithLink:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  ICQUpgradeFlowManager *localFlowManager;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  const char *v13;
  void *v14;
  BOOL v15;
  void *v17;
  void *v18;
  ICQUpgradeFlowManager *v19;
  void *v20;
  ICQUpgradeFlowManager *v21;
  ICQUpgradeFlowManager *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ICQBannerView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
  {
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "action");
      _ICQStringForAction();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v14;
      _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "ICQ Banner: not performing action %{public}@ since ICQBannerViewDelegate did not provide presentingViewController", (uint8_t *)&v24, 0xCu);

    }
    goto LABEL_12;
  }
  -[ICQBannerView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentingViewControllerForBannerView:", self);
  v8 = objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    _ICQGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "action");
      _ICQStringForAction();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v12;
      v13 = "ICQ Banner: not performing action %{public}@ since ICQBannerViewDelegate did not provide presentingViewController";
      goto LABEL_10;
    }
LABEL_11:

LABEL_12:
    v15 = 0;
    goto LABEL_13;
  }
  localFlowManager = self->_localFlowManager;
  _ICQGetLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (localFlowManager)
  {
    if (v11)
    {
      objc_msgSend(v4, "action");
      _ICQStringForAction();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v12;
      v13 = "ICQ Banner: existing _localFlowManager not completed or cancelled yet, skipping action %{public}@";
LABEL_10:
      _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v24, 0xCu);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (v11)
  {
    objc_msgSend(v4, "action");
    _ICQStringForAction();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543362;
    v25 = v17;
    _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "ICQ Banner: perform action %{public}@", (uint8_t *)&v24, 0xCu);

  }
  -[ICQBannerView offer](self, "offer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updateOfferWithAction:", objc_msgSend(v4, "action"));

  v19 = [ICQUpgradeFlowManager alloc];
  -[ICQBannerView offer](self, "offer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[ICQUpgradeFlowManager initWithOffer:](v19, "initWithOffer:", v20);
  v22 = self->_localFlowManager;
  self->_localFlowManager = v21;

  -[ICQUpgradeFlowManager setIcqLink:](self->_localFlowManager, "setIcqLink:", v4);
  -[ICQUpgradeFlowManager setDelegate:](self->_localFlowManager, "setDelegate:", self);
  -[ICQBannerView flowOptions](self, "flowOptions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUpgradeFlowManager setFlowOptions:](self->_localFlowManager, "setFlowOptions:", v23);

  -[ICQUpgradeFlowManager beginFlowWithPresentingViewController:](self->_localFlowManager, "beginFlowWithPresentingViewController:", v8);
  v15 = 1;
LABEL_13:

  return v15;
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  ICQUpgradeFlowManager *v4;
  ICQUpgradeFlowManager *localFlowManager;
  NSObject *p_super;
  _BOOL4 v7;
  void *v8;
  ICQUpgradeFlowManager *v9;
  id v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  ICQUpgradeFlowManager *v15;
  __int16 v16;
  ICQUpgradeFlowManager *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (ICQUpgradeFlowManager *)a3;
  localFlowManager = self->_localFlowManager;
  _ICQGetLogSystem();
  p_super = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
  if (localFlowManager == v4)
  {
    if (v7)
    {
      v12 = 138543362;
      v13 = (id)objc_opt_class();
      v11 = v13;
      _os_log_impl(&dword_21F2CC000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@ UpgradeFlowManager did cancel", (uint8_t *)&v12, 0xCu);

    }
    -[ICQUpgradeFlowManager setDelegate:](self->_localFlowManager, "setDelegate:", 0);
    p_super = &self->_localFlowManager->super;
    self->_localFlowManager = 0;
  }
  else if (v7)
  {
    v8 = (void *)objc_opt_class();
    v9 = self->_localFlowManager;
    v12 = 138543874;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    v16 = 2112;
    v17 = v9;
    v10 = v8;
    _os_log_impl(&dword_21F2CC000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@ UpgradeFlowManager did cancel for manager %@ instead of %@", (uint8_t *)&v12, 0x20u);

  }
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  ICQUpgradeFlowManager *v4;
  ICQUpgradeFlowManager *localFlowManager;
  NSObject *p_super;
  _BOOL4 v7;
  void *v8;
  ICQUpgradeFlowManager *v9;
  id v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  ICQUpgradeFlowManager *v15;
  __int16 v16;
  ICQUpgradeFlowManager *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (ICQUpgradeFlowManager *)a3;
  localFlowManager = self->_localFlowManager;
  _ICQGetLogSystem();
  p_super = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
  if (localFlowManager == v4)
  {
    if (v7)
    {
      v12 = 138543362;
      v13 = (id)objc_opt_class();
      v11 = v13;
      _os_log_impl(&dword_21F2CC000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@ UpgradeFlowManager did complete", (uint8_t *)&v12, 0xCu);

    }
    p_super = &self->_localFlowManager->super;
    self->_localFlowManager = 0;
  }
  else if (v7)
  {
    v8 = (void *)objc_opt_class();
    v9 = self->_localFlowManager;
    v12 = 138543874;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    v16 = 2112;
    v17 = v9;
    v10 = v8;
    _os_log_impl(&dword_21F2CC000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@ UpgradeFlowManager did complete for manager %@ instead of %@", (uint8_t *)&v12, 0x20u);

  }
}

- (void)_handlePushReceivedDarwinNotification
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "push received updating count", buf, 2u);
  }

  v4 = (void *)MEMORY[0x24BEC7340];
  -[ICQBannerView offer](self, "offer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__ICQBannerView__handlePushReceivedDarwinNotification__block_invoke;
  v7[3] = &unk_24E3F3F18;
  v7[4] = self;
  objc_msgSend(v4, "getInfoWithBundleId:completion:", v6, v7);

}

void __54__ICQBannerView__handlePushReceivedDarwinNotification__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  _QWORD block[5];

  if (a2)
  {
    if (!a3)
    {
      v4 = *(void **)(a1 + 32);
      v5 = a2;
      objc_msgSend(v4, "offer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDeviceInfo:", v5);

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __54__ICQBannerView__handlePushReceivedDarwinNotification__block_invoke_2;
      block[3] = &unk_24E3F3610;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }
}

uint64_t __54__ICQBannerView__handlePushReceivedDarwinNotification__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateBannerView");
}

- (void)_registerForDarwinNotifications
{
  void *v3;
  int v4;
  NSObject *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[ICQBannerView offer](self, "offer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showsPhotoVideoCounts");

  if (v4)
  {
    _ICQGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = CFSTR("com.apple.mobileslideshow.cpl.currenttransferprogresschange");
      _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "registering for darwin notification %@", (uint8_t *)&v7, 0xCu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handlePushReceivedDarwinNotification, CFSTR("com.apple.mobileslideshow.cpl.currenttransferprogresschange"), 0, (CFNotificationSuspensionBehavior)1024);
  }
}

- (void)updateBannerView
{
  id v3;

  if (-[ICQBannerView isLegacy](self, "isLegacy"))
    -[ICQBannerView legacyBanner](self, "legacyBanner");
  else
    -[ICQBannerView bubbleBanner](self, "bubbleBanner");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateBannerView");

}

- (void)handleBannerDismiss:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  _QWORD v24[5];
  _QWORD block[4];
  id v26;
  id v27;
  const __CFString *v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "action");
    _ICQStringForAction();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v6;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "ICQ Banner: perform action %{public}@", buf, 0xCu);

  }
  v7 = (void *)MEMORY[0x24BEC7350];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQBannerView offer](self, "offer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recommendationSpecification");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reason");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bubbleBannerTrackLastDismissed:forReason:", v8, v11);

  objc_msgSend(MEMORY[0x24BEC7300], "sharedOfferManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQBannerView offer](self, "offer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dismissRecommendationForBundleId:", v14);

  objc_msgSend(v4, "parameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BEC71D0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x24BDAC760];
  if (v16)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v16);
    v19 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v28 = CFSTR("com.apple.mobileslideshow-iCloudInAppRecommendations");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("recommendations"));

    objc_msgSend(v19, "setObject:forKeyedSubscript:", CFSTR("dismissed"), CFSTR("action"));
    dispatch_get_global_queue(0, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = v17;
    block[1] = 3221225472;
    block[2] = __37__ICQBannerView_handleBannerDismiss___block_invoke;
    block[3] = &unk_24E3F34D8;
    v26 = v18;
    v27 = v19;
    v22 = v19;
    v23 = v18;
    dispatch_async(v21, block);

  }
  else
  {
    _ICQGetLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v23, OS_LOG_TYPE_DEFAULT, "ICQLink: performAction: ICQActionDismiss not handled", buf, 2u);
    }
  }

  v24[0] = v17;
  v24[1] = 3221225472;
  v24[2] = __37__ICQBannerView_handleBannerDismiss___block_invoke_43;
  v24[3] = &unk_24E3F3610;
  v24[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], v24);

}

uint64_t __37__ICQBannerView_handleBannerDismiss___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BEC72E0], "performAsyncHTTPPostCallWithURL:parameters:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __37__ICQBannerView_handleBannerDismiss___block_invoke_43(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", *MEMORY[0x24BEC7218], *(_QWORD *)(a1 + 32));

}

- (void)setFont:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[ICQBannerView isLegacy](self, "isLegacy"))
  {
    -[ICQBannerView legacyBanner](self, "legacyBanner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFont:", v5);

  }
}

- (void)setTitleFont:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[ICQBannerView isLegacy](self, "isLegacy"))
  {
    -[ICQBannerView legacyBanner](self, "legacyBanner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitleFont:", v5);

  }
}

- (void)setDetailMessageFont:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[ICQBannerView isLegacy](self, "isLegacy"))
  {
    -[ICQBannerView legacyBanner](self, "legacyBanner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDetailMessageFont:", v5);

  }
}

- (void)setLinkMessageFont:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[ICQBannerView isLegacy](self, "isLegacy"))
  {
    -[ICQBannerView legacyBanner](self, "legacyBanner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLinkMessageFont:", v5);

  }
}

- (void)setTitleColor:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[ICQBannerView isLegacy](self, "isLegacy"))
  {
    -[ICQBannerView legacyBanner](self, "legacyBanner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitleColor:", v5);

  }
}

- (void)setDetailMessageColor:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[ICQBannerView isLegacy](self, "isLegacy"))
  {
    -[ICQBannerView legacyBanner](self, "legacyBanner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDetailMessageColor:", v5);

  }
}

- (void)setLinkMessageColor:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[ICQBannerView isLegacy](self, "isLegacy"))
  {
    -[ICQBannerView legacyBanner](self, "legacyBanner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLinkMessageColor:", v5);

  }
}

- (void)setTextColor:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[ICQBannerView isLegacy](self, "isLegacy"))
  {
    -[ICQBannerView legacyBanner](self, "legacyBanner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTextColor:", v5);

  }
}

- (void)setTextMargins:(NSDirectionalEdgeInsets)a3
{
  double trailing;
  double bottom;
  double leading;
  double top;
  id v8;

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  if (-[ICQBannerView isLegacy](self, "isLegacy"))
  {
    -[ICQBannerView legacyBanner](self, "legacyBanner");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextMargins:", top, leading, bottom, trailing);

  }
}

- (void)setTextAlignment:(int64_t)a3
{
  id v5;

  if (-[ICQBannerView isLegacy](self, "isLegacy"))
  {
    -[ICQBannerView legacyBanner](self, "legacyBanner");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextAlignment:", a3);

  }
}

- (void)setTextLineSpacing:(double)a3
{
  id v5;

  if (-[ICQBannerView isLegacy](self, "isLegacy"))
  {
    -[ICQBannerView legacyBanner](self, "legacyBanner");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextLineSpacing:", a3);

  }
}

- (void)setLinkTextFont:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[ICQBannerView isLegacy](self, "isLegacy"))
  {
    -[ICQBannerView legacyBanner](self, "legacyBanner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLinkTextFont:", v5);

  }
}

- (void)setLinkTextColor:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[ICQBannerView isLegacy](self, "isLegacy"))
  {
    -[ICQBannerView legacyBanner](self, "legacyBanner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLinkTextColor:", v5);

  }
}

- (void)setFlowOptions:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[ICQBannerView isLegacy](self, "isLegacy"))
  {
    -[ICQBannerView legacyBanner](self, "legacyBanner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFlowOptions:", v5);

  }
}

- (ICQOffer)offer
{
  return self->_offer;
}

- (void)setOffer:(id)a3
{
  objc_storeStrong((id *)&self->_offer, a3);
}

- (ICQBannerViewDelegate)delegate
{
  return (ICQBannerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIFont)font
{
  return self->_font;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIFont)detailMessageFont
{
  return self->_detailMessageFont;
}

- (UIFont)linkMessageFont
{
  return self->_linkMessageFont;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (UIColor)detailMessageColor
{
  return self->_detailMessageColor;
}

- (UIColor)linkMessageColor
{
  return self->_linkMessageColor;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (NSDirectionalEdgeInsets)textMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_textMargins.top;
  leading = self->_textMargins.leading;
  bottom = self->_textMargins.bottom;
  trailing = self->_textMargins.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (double)textLineSpacing
{
  return self->_textLineSpacing;
}

- (UIFont)linkTextFont
{
  return self->_linkTextFont;
}

- (UIColor)linkTextColor
{
  return self->_linkTextColor;
}

- (ICQUpgradeFlowOptions)flowOptions
{
  return self->_flowOptions;
}

- (void)setLegacyBanner:(id)a3
{
  objc_storeStrong((id *)&self->_legacyBanner, a3);
}

- (void)setBubbleBanner:(id)a3
{
  objc_storeStrong((id *)&self->_bubbleBanner, a3);
}

- (void)setDismissibleBubbleBanner:(id)a3
{
  objc_storeStrong((id *)&self->_dismissibleBubbleBanner, a3);
}

- (BOOL)isLegacy
{
  return self->_isLegacy;
}

- (void)setIsLegacy:(BOOL)a3
{
  self->_isLegacy = a3;
}

- (BOOL)isDismissible
{
  return self->_isDismissible;
}

- (void)setIsDismissible:(BOOL)a3
{
  self->_isDismissible = a3;
}

- (ICQUpgradeFlowManager)localFlowManager
{
  return self->_localFlowManager;
}

- (void)setLocalFlowManager:(id)a3
{
  objc_storeStrong((id *)&self->_localFlowManager, a3);
}

- (ICQPurchase)purchase
{
  return self->_purchase;
}

- (void)setPurchase:(id)a3
{
  objc_storeStrong((id *)&self->_purchase, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_localFlowManager, 0);
  objc_storeStrong((id *)&self->_dismissibleBubbleBanner, 0);
  objc_storeStrong((id *)&self->_bubbleBanner, 0);
  objc_storeStrong((id *)&self->_legacyBanner, 0);
  objc_storeStrong((id *)&self->_flowOptions, 0);
  objc_storeStrong((id *)&self->_linkTextColor, 0);
  objc_storeStrong((id *)&self->_linkTextFont, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_linkMessageColor, 0);
  objc_storeStrong((id *)&self->_detailMessageColor, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_linkMessageFont, 0);
  objc_storeStrong((id *)&self->_detailMessageFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_offer, 0);
}

@end
