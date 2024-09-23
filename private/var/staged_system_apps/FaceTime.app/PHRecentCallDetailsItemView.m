@implementation PHRecentCallDetailsItemView

+ (id)_sharedTTYDirectImage
{
  if (qword_1000A36B8 != -1)
    dispatch_once(&qword_1000A36B8, &stru_100089A98);
  return (id)qword_1000A3698;
}

+ (id)_sharedTTYRelayImage
{
  if (qword_1000A36C0 != -1)
    dispatch_once(&qword_1000A36C0, &stru_100089AB8);
  return (id)qword_1000A36A0;
}

+ (id)_sharedDetailDisclosureImage
{
  if (qword_1000A36C8 != -1)
    dispatch_once(&qword_1000A36C8, &stru_100089AD8);
  return (id)qword_1000A36A8;
}

+ (id)_verifiedCheckmarkImage
{
  if (qword_1000A36D0 != -1)
    dispatch_once(&qword_1000A36D0, &stru_100089AF8);
  return (id)qword_1000A36B0;
}

- (PHRecentCallDetailsItemView)initWithFrame:(CGRect)a3 callUUID:(id)a4 ttyType:(int64_t)a5 timeLabel:(id)a6 statusLabel:(id)a7 durationAndDataText:(id)a8 emergencyItemsText:(id)a9 verified:(BOOL)a10
{
  double height;
  double width;
  double y;
  double x;
  id v20;
  id v21;
  id v22;
  id v23;
  PHRecentCallDetailsItemView *v24;
  PHRecentCallDetailsItemView *v25;
  id v28;
  objc_super v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20 = a4;
  v21 = a6;
  v22 = a7;
  v28 = a8;
  v23 = a9;
  v29.receiver = self;
  v29.super_class = (Class)PHRecentCallDetailsItemView;
  v24 = -[PHRecentCallDetailsItemView initWithFrame:](&v29, "initWithFrame:", x, y, width, height);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_callUUID, a4);
    v25->_ttyType = a5;
    objc_storeStrong((id *)&v25->_timeText, a6);
    objc_storeStrong((id *)&v25->_statusText, a7);
    objc_storeStrong((id *)&v25->_durationAndDataText, a8);
    objc_storeStrong((id *)&v25->_emergencyItemsText, a9);
    v25->_verified = a10;
    -[PHRecentCallDetailsItemView loadSubviews](v25, "loadSubviews");
  }

  return v25;
}

- (PHRecentCallDetailsItemView)initWithCoder:(id)a3
{
  PHRecentCallDetailsItemView *v3;
  PHRecentCallDetailsItemView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHRecentCallDetailsItemView;
  v3 = -[PHRecentCallDetailsItemView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[PHRecentCallDetailsItemView loadSubviews](v3, "loadSubviews");
  return v4;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView statusLabel](self, "statusLabel"));
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;

  if (self->_durationAndDataLabel)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView statusLabel](self, "statusLabel"));
    objc_msgSend(v6, "intrinsicContentSize");
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView durationAndDataLabel](self, "durationAndDataLabel"));
    objc_msgSend(v9, "intrinsicContentSize");
    v5 = v8 + v10;

  }
  v11 = UIViewNoIntrinsicMetric;
  v12 = v5;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)loadSubviews
{
  UILabel *v3;
  UILabel *timeLabel;
  void *v5;
  void *v6;
  double v7;
  UILabel *v8;
  UILabel *statusLabel;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  timeLabel = self->_timeLabel;
  self->_timeLabel = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredCaption1Font](UIFont, "preferredCaption1Font"));
  -[UILabel setFont:](self->_timeLabel, "setFont:", v5);

  -[UILabel setTextAlignment:](self->_timeLabel, "setTextAlignment:", 4);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_timeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setContentMode:](self->_timeLabel, "setContentMode:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView timeText](self, "timeText"));
  -[UILabel setText:](self->_timeLabel, "setText:", v6);

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_timeLabel, "setAdjustsFontForContentSizeCategory:", 1);
  LODWORD(v7) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_timeLabel, "setContentCompressionResistancePriority:forAxis:", 0, v7);
  -[PHRecentCallDetailsItemView addSubview:](self, "addSubview:", self->_timeLabel);
  v8 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  statusLabel = self->_statusLabel;
  self->_statusLabel = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredCaption1BoldFont](UIFont, "preferredCaption1BoldFont"));
  -[UILabel setFont:](self->_statusLabel, "setFont:", v10);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_statusLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setContentMode:](self->_statusLabel, "setContentMode:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView statusText](self, "statusText"));
  -[UILabel setText:](self->_statusLabel, "setText:", v11);

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_statusLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setNumberOfLines:](self->_statusLabel, "setNumberOfLines:", 0);
  -[PHRecentCallDetailsItemView addSubview:](self, "addSubview:", self->_statusLabel);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView emergencyItemsText](self, "emergencyItemsText"));

  if (v12)
    -[PHRecentCallDetailsItemView addEmergencyItemsSubview](self, "addEmergencyItemsSubview");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView durationAndDataText](self, "durationAndDataText"));

  if (v13)
    -[PHRecentCallDetailsItemView addDurationAndDataSubview](self, "addDurationAndDataSubview");
  if (-[PHRecentCallDetailsItemView verified](self, "verified"))
    -[PHRecentCallDetailsItemView addVerifiedBadge](self, "addVerifiedBadge");
  if (-[PHRecentCallDetailsItemView ttyType](self, "ttyType"))
    -[PHRecentCallDetailsItemView addRTTInfo](self, "addRTTInfo");
  -[PHRecentCallDetailsItemView loadSubviewsLayoutConstraints](self, "loadSubviewsLayoutConstraints");
}

- (void)loadSubviewsLayoutConstraints
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UILabel *durationAndDataLabel;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView timeLabel](self, "timeLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView leadingAnchor](self, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v5));
  objc_msgSend(v6, "setActive:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView statusLabel](self, "statusLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView timeLabel](self, "timeLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, 8.0));
  objc_msgSend(v11, "setActive:", 1);

  if (!-[PHRecentCallDetailsItemView verified](self, "verified")
    && !-[PHRecentCallDetailsItemView ttyType](self, "ttyType"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView statusLabel](self, "statusLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView trailingAnchor](self, "trailingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintLessThanOrEqualToAnchor:", v14));
    objc_msgSend(v15, "setActive:", 1);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView timeLabel](self, "timeLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView topAnchor](self, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
  objc_msgSend(v19, "setActive:", 1);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView statusLabel](self, "statusLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView topAnchor](self, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
  objc_msgSend(v23, "setActive:", 1);

  durationAndDataLabel = self->_durationAndDataLabel;
  v28 = (id)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView bottomAnchor](self, "bottomAnchor"));
  if (durationAndDataLabel)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_durationAndDataLabel, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v25));
    objc_msgSend(v26, "setActive:", 1);
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView statusLabel](self, "statusLabel"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v26));
    objc_msgSend(v27, "setActive:", 1);

  }
}

- (void)handleTTYTranscriptAction:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView delegate](self, "delegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView callUUID](self, "callUUID"));
  objc_msgSend(v5, "presentConversationForUUID:", v4);

}

- (void)addVerifiedBadge
{
  id v3;
  void *v4;
  UIImageView *v5;
  UIImageView *verifiedBadgeView;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = objc_alloc((Class)UIImageView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHRecentCallDetailsItemView _verifiedCheckmarkImage](PHRecentCallDetailsItemView, "_verifiedCheckmarkImage"));
  v5 = (UIImageView *)objc_msgSend(v3, "initWithImage:", v4);
  verifiedBadgeView = self->_verifiedBadgeView;
  self->_verifiedBadgeView = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicTertiaryLabelColor](UIColor, "dynamicTertiaryLabelColor"));
  -[UIImageView setTintColor:](self->_verifiedBadgeView, "setTintColor:", v7);

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_verifiedBadgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v8) = 1148846080;
  -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_verifiedBadgeView, "setContentCompressionResistancePriority:forAxis:", 0, v8);
  -[PHRecentCallDetailsItemView addSubview:](self, "addSubview:", self->_verifiedBadgeView);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_verifiedBadgeView, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView statusLabel](self, "statusLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, 4.0));
  objc_msgSend(v12, "setActive:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_verifiedBadgeView, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView trailingAnchor](self, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintLessThanOrEqualToAnchor:", v14));
  objc_msgSend(v15, "setActive:", 1);

  v19 = (id)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_verifiedBadgeView, "centerYAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView timeLabel](self, "timeLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerYAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v17));
  objc_msgSend(v18, "setActive:", 1);

}

- (void)addRTTInfo
{
  uint64_t v3;
  id v4;
  void *v5;
  double v6;
  id v7;
  void *v8;
  UIImageView *v9;
  UIImageView *ttyDetailDisclosureImageView;
  void *v11;
  double v12;
  void *v13;
  void *v14;
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
  id v33;
  id v34;

  if ((id)-[PHRecentCallDetailsItemView ttyType](self, "ttyType") == (id)1)
    v3 = objc_claimAutoreleasedReturnValue(+[PHRecentCallDetailsItemView _sharedTTYDirectImage](PHRecentCallDetailsItemView, "_sharedTTYDirectImage"));
  else
    v3 = objc_claimAutoreleasedReturnValue(+[PHRecentCallDetailsItemView _sharedTTYRelayImage](PHRecentCallDetailsItemView, "_sharedTTYRelayImage"));
  v34 = (id)v3;
  v4 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicTertiaryLabelColor](UIColor, "dynamicTertiaryLabelColor"));
  objc_msgSend(v4, "setTintColor:", v5);

  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v6) = 1148846080;
  objc_msgSend(v4, "setContentCompressionResistancePriority:forAxis:", 0, v6);
  -[PHRecentCallDetailsItemView addSubview:](self, "addSubview:", v4);
  v7 = objc_alloc((Class)UIImageView);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PHRecentCallDetailsItemView _sharedDetailDisclosureImage](PHRecentCallDetailsItemView, "_sharedDetailDisclosureImage"));
  v9 = (UIImageView *)objc_msgSend(v7, "initWithImage:", v8);
  ttyDetailDisclosureImageView = self->_ttyDetailDisclosureImageView;
  self->_ttyDetailDisclosureImageView = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicTertiaryLabelColor](UIColor, "dynamicTertiaryLabelColor"));
  -[UIImageView setTintColor:](self->_ttyDetailDisclosureImageView, "setTintColor:", v11);

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_ttyDetailDisclosureImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v12) = 1148846080;
  -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_ttyDetailDisclosureImageView, "setContentCompressionResistancePriority:forAxis:", 0, v12);
  -[PHRecentCallDetailsItemView addSubview:](self, "addSubview:", self->_ttyDetailDisclosureImageView);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_ttyDetailDisclosureImageView, "centerYAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView timeLabel](self, "timeLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerYAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  objc_msgSend(v16, "setActive:", 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerYAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView timeLabel](self, "timeLabel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "centerYAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));
  objc_msgSend(v20, "setActive:", 1);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_ttyDetailDisclosureImageView, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, -4.0));
  objc_msgSend(v23, "setActive:", 1);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_verifiedBadgeView, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintLessThanOrEqualToAnchor:", v25));
  objc_msgSend(v26, "setActive:", 1);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_statusLabel, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintLessThanOrEqualToAnchor:", v28));
  objc_msgSend(v29, "setActive:", 1);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_ttyDetailDisclosureImageView, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView trailingAnchor](self, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, -15.0));
  objc_msgSend(v32, "setActive:", 1);

  v33 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleTTYTranscriptAction:");
  objc_msgSend(v33, "setNumberOfTapsRequired:", 1);
  -[PHRecentCallDetailsItemView addGestureRecognizer:](self, "addGestureRecognizer:", v33);

}

- (void)addEmergencyItemsSubview
{
  UILabel *v3;
  UILabel *emergencyItemsLabel;
  void *v5;
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
  id v16;

  v3 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  emergencyItemsLabel = self->_emergencyItemsLabel;
  self->_emergencyItemsLabel = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredCaption1Font](UIFont, "preferredCaption1Font"));
  -[UILabel setFont:](self->_emergencyItemsLabel, "setFont:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicSecondaryLabelColor](UIColor, "dynamicSecondaryLabelColor"));
  -[UILabel setTextColor:](self->_emergencyItemsLabel, "setTextColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView emergencyItemsText](self, "emergencyItemsText"));
  -[UILabel setText:](self->_emergencyItemsLabel, "setText:", v7);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_emergencyItemsLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_emergencyItemsLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setNumberOfLines:](self->_emergencyItemsLabel, "setNumberOfLines:", 0);
  -[PHRecentCallDetailsItemView addSubview:](self, "addSubview:", self->_emergencyItemsLabel);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_emergencyItemsLabel, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_statusLabel, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  objc_msgSend(v10, "setActive:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_emergencyItemsLabel, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView trailingAnchor](self, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintLessThanOrEqualToAnchor:", v12));
  objc_msgSend(v13, "setActive:", 1);

  v16 = (id)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_emergencyItemsLabel, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_statusLabel, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v14, 4.0));
  objc_msgSend(v15, "setActive:", 1);

}

- (void)addDurationAndDataSubview
{
  UILabel *v3;
  UILabel *durationAndDataLabel;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UILabel *emergencyItemsLabel;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v3 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  durationAndDataLabel = self->_durationAndDataLabel;
  self->_durationAndDataLabel = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredCaption1Font](UIFont, "preferredCaption1Font"));
  -[UILabel setFont:](self->_durationAndDataLabel, "setFont:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicSecondaryLabelColor](UIColor, "dynamicSecondaryLabelColor"));
  -[UILabel setTextColor:](self->_durationAndDataLabel, "setTextColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView durationAndDataText](self, "durationAndDataText"));
  -[UILabel setText:](self->_durationAndDataLabel, "setText:", v7);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_durationAndDataLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_durationAndDataLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setNumberOfLines:](self->_durationAndDataLabel, "setNumberOfLines:", 0);
  -[PHRecentCallDetailsItemView addSubview:](self, "addSubview:", self->_durationAndDataLabel);
  v8 = 48;
  emergencyItemsLabel = self->_emergencyItemsLabel;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_durationAndDataLabel, "leadingAnchor"));
  if (!emergencyItemsLabel)
    v8 = 64;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v8), "leadingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  objc_msgSend(v12, "setActive:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_durationAndDataLabel, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v8), "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 4.0));
  objc_msgSend(v15, "setActive:", 1);

  v18 = (id)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_durationAndDataLabel, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView trailingAnchor](self, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintLessThanOrEqualToAnchor:", v16));
  objc_msgSend(v17, "setActive:", 1);

}

- (PHRecentCallDetailsItemViewDelegate)delegate
{
  return (PHRecentCallDetailsItemViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)callUUID
{
  return self->_callUUID;
}

- (void)setCallUUID:(id)a3
{
  objc_storeStrong((id *)&self->_callUUID, a3);
}

- (UILabel)durationAndDataLabel
{
  return self->_durationAndDataLabel;
}

- (void)setDurationAndDataLabel:(id)a3
{
  objc_storeStrong((id *)&self->_durationAndDataLabel, a3);
}

- (NSString)durationAndDataText
{
  return self->_durationAndDataText;
}

- (void)setDurationAndDataText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UILabel)emergencyItemsLabel
{
  return self->_emergencyItemsLabel;
}

- (void)setEmergencyItemsLabel:(id)a3
{
  objc_storeStrong((id *)&self->_emergencyItemsLabel, a3);
}

- (NSString)emergencyItemsText
{
  return self->_emergencyItemsText;
}

- (void)setEmergencyItemsText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
  objc_storeStrong((id *)&self->_statusLabel, a3);
}

- (NSString)statusText
{
  return self->_statusText;
}

- (void)setStatusText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabel, a3);
}

- (NSString)timeText
{
  return self->_timeText;
}

- (void)setTimeText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (UIImageView)ttyDetailDisclosureImageView
{
  return self->_ttyDetailDisclosureImageView;
}

- (void)setTtyDetailDisclosureImageView:(id)a3
{
  objc_storeStrong((id *)&self->_ttyDetailDisclosureImageView, a3);
}

- (UIImageView)verifiedBadgeView
{
  return self->_verifiedBadgeView;
}

- (void)setVerifiedBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_verifiedBadgeView, a3);
}

- (BOOL)verified
{
  return self->_verified;
}

- (void)setVerified:(BOOL)a3
{
  self->_verified = a3;
}

- (int64_t)ttyType
{
  return self->_ttyType;
}

- (void)setTtyType:(int64_t)a3
{
  self->_ttyType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verifiedBadgeView, 0);
  objc_storeStrong((id *)&self->_ttyDetailDisclosureImageView, 0);
  objc_storeStrong((id *)&self->_timeText, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_statusText, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_emergencyItemsText, 0);
  objc_storeStrong((id *)&self->_emergencyItemsLabel, 0);
  objc_storeStrong((id *)&self->_durationAndDataText, 0);
  objc_storeStrong((id *)&self->_durationAndDataLabel, 0);
  objc_storeStrong((id *)&self->_callUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
