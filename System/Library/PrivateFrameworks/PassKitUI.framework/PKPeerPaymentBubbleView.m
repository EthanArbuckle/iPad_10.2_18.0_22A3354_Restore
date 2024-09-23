@implementation PKPeerPaymentBubbleView

+ (id)applePayLogo
{
  if (_MergedGlobals_3_11 != -1)
    dispatch_once(&_MergedGlobals_3_11, &__block_literal_global_150);
  return (id)qword_1EE4F9310;
}

void __39__PKPeerPaymentBubbleView_applePayLogo__block_invoke()
{
  double v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = PKUIScreenScale();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  PKUIApplePayLogo(v3, 36.0, 10.0, v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1EE4F9310;
  qword_1EE4F9310 = v1;

}

+ (CGSize)referenceSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(a1, "referenceSizeForState:", 4);
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)referenceSizeForState:(unint64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(a1, "referenceSizeForState:andAction:", a3, a3 == 1);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)referenceSizeForState:(unint64_t)a3 andAction:(unint64_t)a4
{
  BOOL v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v4 = a4 == 1 && a3 == 1;
  v5 = 174.0;
  if (v4)
    v5 = 157.0;
  v6 = 130.0;
  if (a4)
    v6 = v5;
  v7 = 186.0;
  result.height = v6;
  result.width = v7;
  return result;
}

+ (CGSize)referenceSizeForPeerPaymentStatusResponse:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  CGSize result;

  v4 = a3;
  v5 = objc_msgSend(v4, "status") + 1;
  if (v5 > 8)
    v6 = 0;
  else
    v6 = qword_19DF16CD8[v5];
  objc_msgSend(v4, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "containsObject:", *MEMORY[0x1E0D6B0E8]))
    v8 = 2;
  else
    v8 = 0;

  objc_msgSend(a1, "referenceSizeForState:andAction:", v6, v8);
  result.height = v10;
  result.width = v9;
  return result;
}

+ (id)referenceBackgroundColor
{
  return (id)objc_msgSend(a1, "referenceBackgroundColorForState:", 4);
}

+ (id)referenceBackgroundColorForState:(unint64_t)a3
{
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", dbl_19DF16CB0[a3 - 6 < 4], 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)referenceWatchBackgroundColorForState:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", a3, 0.188235294, 0.188235294, 0.196078431, 1.0);
}

- (PKPeerPaymentBubbleView)init
{
  double v3;
  double v4;

  objc_msgSend((id)objc_opt_class(), "referenceSize");
  return -[PKPeerPaymentBubbleView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, v3, v4);
}

- (id)initForSnapshotting
{
  double v3;
  double v4;
  id result;

  objc_msgSend((id)objc_opt_class(), "referenceSize");
  result = -[PKPeerPaymentBubbleView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, v3, v4);
  *((_BYTE *)result + 426) = 1;
  return result;
}

- (PKPeerPaymentBubbleView)initWithCurrencyAmount:(id)a3 state:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  PKPeerPaymentBubbleView *v9;

  v6 = a3;
  objc_msgSend(v6, "amount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currency");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PKPeerPaymentBubbleView initWithAmount:currency:state:](self, "initWithAmount:currency:state:", v7, v8, a4);
  return v9;
}

- (PKPeerPaymentBubbleView)initWithAmount:(id)a3 currency:(id)a4 state:(unint64_t)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  PKPeerPaymentBubbleView *v12;
  PKPeerPaymentBubbleView *v13;
  uint64_t v14;
  NSDecimalNumber *amount;
  uint64_t v16;
  NSString *currency;

  v8 = a3;
  v9 = a4;
  objc_msgSend((id)objc_opt_class(), "referenceSizeForState:", a5);
  v12 = -[PKPeerPaymentBubbleView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, v10, v11);
  v13 = v12;
  if (v12)
  {
    v12->_state = a5;
    v14 = objc_msgSend(v8, "copy");
    amount = v13->_amount;
    v13->_amount = (NSDecimalNumber *)v14;

    v16 = objc_msgSend(v9, "copy");
    currency = v13->_currency;
    v13->_currency = (NSString *)v16;

    -[PKPeerPaymentBubbleView _updateContent](v13, "_updateContent");
  }

  return v13;
}

- (PKPeerPaymentBubbleView)initWithFrame:(CGRect)a3
{
  PKPeerPaymentBubbleView *v3;
  PKPeerPaymentBubbleView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentBubbleView;
  v3 = -[PKPeerPaymentBubbleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PKPeerPaymentBubbleView _commonInit](v3, "_commonInit");
  return v4;
}

- (PKPeerPaymentBubbleView)initWithCoder:(id)a3
{
  PKPeerPaymentBubbleView *v3;
  PKPeerPaymentBubbleView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentBubbleView;
  v3 = -[PKPeerPaymentBubbleView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PKPeerPaymentBubbleView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentBubbleView;
  -[PKPeerPaymentBubbleView awakeFromNib](&v3, sel_awakeFromNib);
  self->_liveRenderingEnabled = 1;
  -[PKPeerPaymentBubbleView _updateContent](self, "_updateContent");
}

- (void)_commonInit
{
  void *v3;
  UILabel *v4;
  UILabel *messageLabel;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  UILabel *secondaryMessageLabel;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  UILabel *v16;
  UILabel *imageLabel;
  void *v18;
  void *v19;
  UILabel *v20;
  UILabel *statusLabel;
  UILabel *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  PKContinuousButton *v26;
  PKContinuousButton *actionButton;
  PKContinuousButton *v28;
  void *v29;
  PKContinuousButton *v30;
  void *v31;
  void *v32;
  void *v33;
  UIActivityIndicatorView *v34;
  UIActivityIndicatorView *actionSpinner;
  UIActivityIndicatorView *v36;
  void *v37;

  -[PKPeerPaymentBubbleView _backgroundColor](self, "_backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentBubbleView setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  messageLabel = self->_messageLabel;
  self->_messageLabel = v4;

  v6 = self->_messageLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "pk_peerPaymentChiseledCashFontOfSize:", 69.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v6, "setFont:", v7);

  v8 = self->_messageLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v8, "setTextColor:", v9);

  -[UILabel setTextAlignment:](self->_messageLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_messageLabel, "setNumberOfLines:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_messageLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setMinimumScaleFactor:](self->_messageLabel, "setMinimumScaleFactor:", 0.5);
  -[UILabel setBaselineAdjustment:](self->_messageLabel, "setBaselineAdjustment:", 1);
  -[PKPeerPaymentBubbleView addSubview:](self, "addSubview:", self->_messageLabel);
  v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  secondaryMessageLabel = self->_secondaryMessageLabel;
  self->_secondaryMessageLabel = v10;

  v12 = self->_secondaryMessageLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v12, "setFont:", v13);

  v14 = self->_secondaryMessageLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v14, "setTextColor:", v15);

  -[UILabel setTextAlignment:](self->_secondaryMessageLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_secondaryMessageLabel, "setNumberOfLines:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_secondaryMessageLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setMinimumScaleFactor:](self->_secondaryMessageLabel, "setMinimumScaleFactor:", 0.5);
  -[UILabel setBaselineAdjustment:](self->_secondaryMessageLabel, "setBaselineAdjustment:", 1);
  -[PKPeerPaymentBubbleView addSubview:](self, "addSubview:", self->_secondaryMessageLabel);
  v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  imageLabel = self->_imageLabel;
  self->_imageLabel = v16;

  -[UILabel setTextAlignment:](self->_imageLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_imageLabel, "setNumberOfLines:", 1);
  -[UILabel layer](self->_imageLabel, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCornerRadius:", 10.0);

  -[UILabel layer](self->_imageLabel, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setMasksToBounds:", 1);

  -[PKPeerPaymentBubbleView addSubview:](self, "addSubview:", self->_imageLabel);
  v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  statusLabel = self->_statusLabel;
  self->_statusLabel = v20;

  v22 = self->_statusLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v22, "setFont:", v23);

  v24 = self->_statusLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v24, "setTextColor:", v25);

  -[UILabel setTextAlignment:](self->_statusLabel, "setTextAlignment:", 4);
  -[UILabel setNumberOfLines:](self->_statusLabel, "setNumberOfLines:", 1);
  -[PKPeerPaymentBubbleView addSubview:](self, "addSubview:", self->_statusLabel);
  v26 = -[PKContinuousButton initWithCornerRadius:effect:]([PKContinuousButton alloc], "initWithCornerRadius:effect:", 2, 20.0);
  actionButton = self->_actionButton;
  self->_actionButton = v26;

  -[PKContinuousButton addTarget:action:forControlEvents:](self->_actionButton, "addTarget:action:forControlEvents:", self, sel__actionButtonTapped_, 64);
  v28 = self->_actionButton;
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKContinuousButton updateTitleColorWithColor:](v28, "updateTitleColorWithColor:", v29);

  v30 = self->_actionButton;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKContinuousButton setTintColor:](v30, "setTintColor:", v31);

  -[PKContinuousButton setContentEdgeInsets:](self->_actionButton, "setContentEdgeInsets:", 0.0, 26.5, 0.0, 26.5);
  -[PKContinuousButton titleLabel](self->_actionButton, "titleLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setAdjustsFontSizeToFitWidth:", 1);

  -[PKContinuousButton titleLabel](self->_actionButton, "titleLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setMinimumScaleFactor:", 0.5);

  -[PKContinuousButton setAccessibilityIdentifier:](self->_actionButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67830]);
  -[PKPeerPaymentBubbleView addSubview:](self, "addSubview:", self->_actionButton);
  v34 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  actionSpinner = self->_actionSpinner;
  self->_actionSpinner = v34;

  v36 = self->_actionSpinner;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityIndicatorView setColor:](v36, "setColor:", v37);

  -[UIActivityIndicatorView setHidesWhenStopped:](self->_actionSpinner, "setHidesWhenStopped:", 1);
  -[UIActivityIndicatorView stopAnimating](self->_actionSpinner, "stopAnimating");
  -[PKPeerPaymentBubbleView addSubview:](self, "addSubview:", self->_actionSpinner);
  -[PKPeerPaymentBubbleView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", *MEMORY[0x1E0D678B8]);
}

- (void)layoutSubviews
{
  UIEdgeInsets *p_contentInset;
  double top;
  double left;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double Height;
  double Width;
  double MinX;
  double v29;
  double v30;
  CGFloat v31;
  PKContinuousButton *actionButton;
  UIActivityIndicatorView *actionSpinner;
  UIImageView *applePayLogoImageView;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  void *v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  _BOOL4 v65;
  UILabel *imageLabel;
  CGRectEdge v67;
  CGFloat x;
  CGFloat y;
  CGFloat v70;
  CGFloat v71;
  uint64_t v72;
  void *v73;
  double v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  double v79;
  CGFloat v80;
  double v81;
  CGFloat v82;
  double v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  _BOOL4 v89;
  UILabel *messageLabel;
  uint64_t v91;
  CGFloat v92;
  CGFloat v93;
  CGFloat v94;
  CGFloat v95;
  UILabel *secondaryMessageLabel;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  void *v117;
  CAShapeLayer *maskLayer;
  id v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  CGRect slice;
  CGRect remainder;
  objc_super v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;

  v127.receiver = self;
  v127.super_class = (Class)PKPeerPaymentBubbleView;
  -[PKPeerPaymentBubbleView layoutSubviews](&v127, sel_layoutSubviews);
  -[PKPeerPaymentBubbleView bounds](self, "bounds");
  p_contentInset = &self->_contentInset;
  top = self->_contentInset.top;
  left = self->_contentInset.left;
  v10 = v6 + left + 14.0;
  v11 = v7 + top + 12.0;
  v12 = v8 - (left + self->_contentInset.right) + -28.0;
  v13 = v9 - (top + self->_contentInset.bottom) + -24.0;
  v14 = -[PKPeerPaymentBubbleView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[PKPeerPaymentBubbleView referenceBounds](self, "referenceBounds");
  v15 = self->_contentInset.left;
  v123 = v16 + v15;
  v18 = self->_contentInset.top + v17;
  v20 = v19 - (v15 + self->_contentInset.right);
  v22 = v21 - (self->_contentInset.top + self->_contentInset.bottom);
  -[UILabel sizeThatFits:](self->_statusLabel, "sizeThatFits:", v12, v13);
  v24 = v23;
  v128.origin.x = v10;
  v128.origin.y = v11;
  v128.size.width = v12;
  v128.size.height = v13;
  if (v24 >= CGRectGetHeight(v128))
  {
    v129.origin.x = v10;
    v129.origin.y = v11;
    v129.size.width = v12;
    v129.size.height = v13;
    Height = CGRectGetHeight(v129);
  }
  else
  {
    -[UILabel sizeThatFits:](self->_statusLabel, "sizeThatFits:", v12, v13);
    Height = v25;
  }
  v122 = v20 + -28.0;
  v124 = v123 + 14.0;
  v120 = v18 + 12.0;
  v121 = v22 + -24.0;
  v130.origin.x = v10;
  v130.origin.y = v11;
  v130.size.width = v12;
  v130.size.height = v13;
  Width = CGRectGetWidth(v130);
  v131.origin.x = v10;
  v131.origin.y = v11;
  v131.size.width = v12;
  v131.size.height = v13;
  MinX = CGRectGetMinX(v131);
  v132.origin.x = v10;
  v132.origin.y = v11;
  v132.size.width = v12;
  v132.size.height = v13;
  -[UILabel setFrame:](self->_statusLabel, "setFrame:", MinX, CGRectGetMaxY(v132) - Height + -1.0, Width, Height);
  -[PKContinuousButton sizeThatFits:](self->_actionButton, "sizeThatFits:", v12, v13);
  v30 = v29;
  v133.origin.x = v10;
  v133.origin.y = v11;
  v133.size.width = v12;
  v133.size.height = v13;
  v31 = v10;
  if (v30 >= CGRectGetWidth(v133))
  {
    v134.origin.x = v10;
    v134.origin.y = v11;
    v134.size.width = v12;
    v134.size.height = v13;
    CGRectGetWidth(v134);
  }
  else
  {
    -[PKContinuousButton sizeThatFits:](self->_actionButton, "sizeThatFits:", v12, v13);
  }
  v135.origin.x = v10;
  v135.origin.y = v11;
  v135.size.width = v12;
  v135.size.height = v13;
  CGRectGetMinX(v135);
  v136.origin.x = v10;
  v136.origin.y = v11;
  v136.size.width = v12;
  v136.size.height = v13;
  CGRectGetWidth(v136);
  v137.size.width = v122;
  v137.origin.x = v124;
  v137.origin.y = v18 + 12.0;
  v137.size.height = v121;
  CGRectGetMaxY(v137);
  actionButton = self->_actionButton;
  PKRectRoundToPixel();
  -[PKContinuousButton setFrame:](actionButton, "setFrame:");
  actionSpinner = self->_actionSpinner;
  -[PKContinuousButton center](self->_actionButton, "center");
  -[UIActivityIndicatorView setCenter:](actionSpinner, "setCenter:");
  applePayLogoImageView = self->_applePayLogoImageView;
  if (applePayLogoImageView)
  {
    -[UIImageView sizeThatFits:](applePayLogoImageView, "sizeThatFits:", v12, v13);
    v36 = v35;
    v38 = v37;
    v39 = v10;
    v40 = v11;
    v41 = v12;
    v42 = v13;
    if (v14)
      v43 = CGRectGetMaxX(*(CGRect *)&v39) - v36;
    else
      v43 = CGRectGetMinX(*(CGRect *)&v39);
    -[UIImageView setFrame:](self->_applePayLogoImageView, "setFrame:", v43, v11, v36, v38);
  }
  -[PKPeerPaymentBubbleView _imageText](self, "_imageText");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    v45 = v10;
    v46 = v11;
    v47 = v12;
    v48 = v13;
    if (v14)
      CGRectGetMaxX(*(CGRect *)&v45);
    else
      CGRectGetMinX(*(CGRect *)&v45);
    -[PKPeerPaymentBubbleView _actionTitle](self, "_actionTitle");
    v51 = objc_claimAutoreleasedReturnValue();
    if (!v51)
      goto LABEL_20;
    v52 = (void *)v51;
    -[PKPeerPaymentBubbleView bounds](self, "bounds");
    v54 = v53;
    v56 = v55;
    v58 = v57;
    v60 = v59;
    -[PKPeerPaymentBubbleView referenceBounds](self, "referenceBounds");
    v150.origin.x = v61;
    v150.origin.y = v62;
    v150.size.width = v63;
    v150.size.height = v64;
    v138.origin.x = v54;
    v138.origin.y = v56;
    v138.size.width = v58;
    v138.size.height = v60;
    v65 = CGRectEqualToRect(v138, v150);

    if (v65)
    {
      v31 = v10;
      v139.origin.x = v10;
      v139.origin.y = v11;
      v139.size.width = v12;
      v139.size.height = v13;
      CGRectGetMinY(v139);
      v140.origin.x = v10;
      v140.origin.y = v11;
      v140.size.width = v12;
      v140.size.height = v13;
      CGRectGetHeight(v140);
    }
    else
    {
LABEL_20:
      v141.origin.x = v124;
      v141.origin.y = v120;
      v141.size.width = v122;
      v141.size.height = v121;
      CGRectGetMinY(v141);
      v142.origin.x = v124;
      v142.origin.y = v120;
      v142.size.width = v122;
      v142.size.height = v121;
      CGRectGetHeight(v142);
      v31 = v10;
    }
    imageLabel = self->_imageLabel;
    PKRectRoundToPixel();
    -[UILabel setFrame:](imageLabel, "setFrame:");
    remainder.origin.x = v31;
    remainder.origin.y = v11;
    remainder.size.width = v12;
    remainder.size.height = v13;
    memset(&slice, 0, sizeof(slice));
    if (v14)
      v67 = CGRectMaxXEdge;
    else
      v67 = CGRectMinXEdge;
    v143.origin.x = v31;
    v143.origin.y = v11;
    v143.size.width = v12;
    v143.size.height = v13;
    CGRectDivide(v143, &slice, &remainder, 52.0, v67);
    v49 = remainder.size.width;
    v50 = remainder.size.height;
  }
  else
  {
    remainder.origin.x = v10;
    remainder.origin.y = v11;
    remainder.size.width = v12;
    remainder.size.height = v13;
    memset(&slice, 0, sizeof(slice));
    v49 = v12;
    v50 = v13;
  }
  -[UILabel pkui_sizeThatFits:](self->_messageLabel, "pkui_sizeThatFits:", v49, v50);
  -[UILabel pkui_sizeThatFits:](self->_secondaryMessageLabel, "pkui_sizeThatFits:", remainder.size.width, remainder.size.height);
  x = remainder.origin.x;
  y = remainder.origin.y;
  v70 = remainder.size.width;
  v71 = remainder.size.height;
  if (v44)
  {
    if (v14)
      CGRectGetMaxX(*(CGRect *)&x);
    else
      CGRectGetMinX(*(CGRect *)&x);
  }
  else
  {
    CGRectGetMinX(*(CGRect *)&x);
    CGRectGetWidth(remainder);
  }
  -[PKPeerPaymentBubbleView _actionTitle](self, "_actionTitle");
  v72 = objc_claimAutoreleasedReturnValue();
  if (!v72)
    goto LABEL_33;
  v73 = (void *)v72;
  -[PKPeerPaymentBubbleView bounds](self, "bounds");
  v75 = v74;
  v76 = v12;
  v77 = v11;
  v78 = v31;
  v80 = v79;
  v82 = v81;
  v84 = v83;
  -[PKPeerPaymentBubbleView referenceBounds](self, "referenceBounds");
  v151.origin.x = v85;
  v151.origin.y = v86;
  v151.size.width = v87;
  v151.size.height = v88;
  v144.origin.x = v75;
  v144.origin.y = v80;
  v144.size.width = v82;
  v144.size.height = v84;
  v89 = CGRectEqualToRect(v144, v151);

  if (v89)
  {
    v145.origin.x = v78;
    v145.origin.y = v77;
    v145.size.width = v76;
    v145.size.height = v13;
    CGRectGetMinY(v145);
    v146.origin.x = v78;
    v146.origin.y = v77;
    v146.size.width = v76;
    v146.size.height = v13;
    CGRectGetHeight(v146);
  }
  else
  {
LABEL_33:
    v147.origin.x = v124;
    v147.origin.y = v120;
    v147.size.width = v122;
    v147.size.height = v121;
    CGRectGetMinY(v147);
    v148.origin.x = v124;
    v148.origin.y = v120;
    v148.size.width = v122;
    v148.size.height = v121;
    CGRectGetHeight(v148);
  }
  messageLabel = self->_messageLabel;
  PKRectRoundToPixel();
  -[UILabel setFrame:](messageLabel, "setFrame:");
  if (v44)
    v91 = 4;
  else
    v91 = 1;
  -[UILabel setTextAlignment:](self->_messageLabel, "setTextAlignment:", v91);
  v92 = remainder.origin.x;
  v93 = remainder.origin.y;
  v94 = remainder.size.width;
  v95 = remainder.size.height;
  if (v44)
  {
    if (v14)
      CGRectGetMaxX(*(CGRect *)&v92);
    else
      CGRectGetMinX(*(CGRect *)&v92);
  }
  else
  {
    CGRectGetMinX(*(CGRect *)&v92);
    CGRectGetWidth(remainder);
  }
  secondaryMessageLabel = self->_secondaryMessageLabel;
  PKRectRoundToPixel();
  -[UILabel setFrame:](secondaryMessageLabel, "setFrame:");
  -[UILabel setTextAlignment:](self->_secondaryMessageLabel, "setTextAlignment:", v91);
  -[PKPeerPaymentBubbleView bounds](self, "bounds");
  v97 = self->_contentInset.left;
  v100 = p_contentInset->top + v99;
  v102 = v101 - (v97 + self->_contentInset.right);
  v104 = v103 - (p_contentInset->top + self->_contentInset.bottom);
  v105 = v98 + v97 + -1.0;
  objc_msgSend((id)objc_opt_class(), "referenceSize");
  if (v104 >= v106)
  {
    objc_msgSend((id)objc_opt_class(), "referenceSize");
    v104 = v107;
  }
  -[PKPeerPayment3DTextView setFrame:](self->_renderView, "setFrame:", v105, v100, v102, v104);
  -[PKPeerPaymentBubbleView bounds](self, "bounds");
  v108 = self->_contentInset.left;
  v110 = v109 + v108;
  v112 = p_contentInset->top + v111;
  v114 = v113 - (v108 + self->_contentInset.right);
  v116 = v115 - (self->_contentInset.top + self->_contentInset.bottom);
  v149.origin.x = v109 + v108;
  v149.origin.y = v112;
  v149.size.width = v114;
  v149.size.height = v116;
  if (!CGRectEqualToRect(v149, self->_lastBoundsForRoundedCornerLayout) && self->_hasRoundedCorners)
  {
    self->_lastBoundsForRoundedCornerLayout.origin.x = v110;
    self->_lastBoundsForRoundedCornerLayout.origin.y = v112;
    self->_lastBoundsForRoundedCornerLayout.size.width = v114;
    self->_lastBoundsForRoundedCornerLayout.size.height = v116;
    objc_msgSend(MEMORY[0x1E0DC3508], "_bezierPathWithPillRect:cornerRadius:", v110, v112, v114, v116, 20.0);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    maskLayer = self->_maskLayer;
    v119 = objc_retainAutorelease(v117);
    -[CAShapeLayer setPath:](maskLayer, "setPath:", objc_msgSend(v119, "CGPath"));

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "referenceSizeForState:andAction:", self->_state, self->_action);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setState:(unint64_t)a3
{
  -[PKPeerPaymentBubbleView setState:animated:](self, "setState:animated:", a3, 1);
}

- (void)setState:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD v6[5];

  if (self->_state != a3)
  {
    v4 = a4;
    self->_state = a3;
    -[PKPeerPaymentBubbleView _updateContent](self, "_updateContent");
    if (v4)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __45__PKPeerPaymentBubbleView_setState_animated___block_invoke;
      v6[3] = &unk_1E3E612E8;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "transitionWithView:duration:options:animations:completion:", self, 5242880, v6, 0, 0.300000012);
    }
  }
}

void __45__PKPeerPaymentBubbleView_setState_animated___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayIfNeeded");

}

- (void)setAction:(unint64_t)a3
{
  -[PKPeerPaymentBubbleView setAction:animated:](self, "setAction:animated:", a3, 1);
}

- (void)setAction:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD v6[5];

  if (self->_action != a3)
  {
    v4 = a4;
    self->_action = a3;
    -[PKPeerPaymentBubbleView _updateContent](self, "_updateContent");
    if (v4)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __46__PKPeerPaymentBubbleView_setAction_animated___block_invoke;
      v6[3] = &unk_1E3E612E8;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "transitionWithView:duration:options:animations:completion:", self, 5242880, v6, 0, 0.300000012);
    }
  }
}

void __46__PKPeerPaymentBubbleView_setAction_animated___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayIfNeeded");

}

- (void)setAmount:(id)a3
{
  NSDecimalNumber *v4;
  NSDecimalNumber *amount;

  if (self->_amount != a3)
  {
    v4 = (NSDecimalNumber *)objc_msgSend(a3, "copy");
    amount = self->_amount;
    self->_amount = v4;

    -[PKPeerPaymentBubbleView _updateContent](self, "_updateContent");
  }
}

- (void)setCurrency:(id)a3
{
  NSString *v4;
  NSString *currency;

  if (self->_currency != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    currency = self->_currency;
    self->_currency = v4;

    -[PKPeerPaymentBubbleView _updateContent](self, "_updateContent");
  }
}

- (void)setRecurringPaymentMemo:(id)a3
{
  PKPeerPaymentRecurringPaymentMemo *v5;
  PKPeerPaymentRecurringPaymentMemo *v6;

  v5 = (PKPeerPaymentRecurringPaymentMemo *)a3;
  if (self->_recurringPaymentMemo != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_recurringPaymentMemo, a3);
    -[PKPeerPaymentBubbleView _updateContent](self, "_updateContent");
    v5 = v6;
  }

}

- (void)setRecurringPaymentStartDate:(id)a3
{
  NSDate *v5;
  NSDate *v6;

  v5 = (NSDate *)a3;
  if (self->_recurringPaymentStartDate != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_recurringPaymentStartDate, a3);
    -[PKPeerPaymentBubbleView _updateContent](self, "_updateContent");
    v5 = v6;
  }

}

- (void)setRecurringPaymentFrequency:(unint64_t)a3
{
  if (self->_recurringPaymentFrequency != a3)
  {
    self->_recurringPaymentFrequency = a3;
    -[PKPeerPaymentBubbleView _updateContent](self, "_updateContent");
  }
}

- (void)setHasRoundedCorners:(BOOL)a3
{
  CGSize v4;
  CAShapeLayer *v5;
  CAShapeLayer *maskLayer;
  void *v7;
  void *v8;
  CAShapeLayer *v9;
  CAShapeLayer *v10;

  if (self->_hasRoundedCorners != a3)
  {
    self->_hasRoundedCorners = a3;
    v4 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    self->_lastBoundsForRoundedCornerLayout.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    self->_lastBoundsForRoundedCornerLayout.size = v4;
    if (a3)
    {
      v5 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
      maskLayer = self->_maskLayer;
      self->_maskLayer = v5;

      -[PKPeerPaymentBubbleView layer](self, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = self->_maskLayer;
    }
    else
    {
      v10 = self->_maskLayer;
      self->_maskLayer = 0;

      -[PKPeerPaymentBubbleView layer](self, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 0;
    }
    objc_msgSend(v7, "setMask:", v9);

    -[PKPeerPaymentBubbleView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDisplaysApplePayLogo:(BOOL)a3
{
  id v4;
  void *v5;
  UIImageView *v6;
  UIImageView *applePayLogoImageView;
  UIImageView *v8;

  if (self->_displaysApplePayLogo != a3)
  {
    self->_displaysApplePayLogo = a3;
    if (a3)
    {
      v4 = objc_alloc(MEMORY[0x1E0DC3890]);
      objc_msgSend((id)objc_opt_class(), "applePayLogo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (UIImageView *)objc_msgSend(v4, "initWithImage:", v5);
      applePayLogoImageView = self->_applePayLogoImageView;
      self->_applePayLogoImageView = v6;

      -[UIImageView setContentMode:](self->_applePayLogoImageView, "setContentMode:", 4);
      -[PKPeerPaymentBubbleView addSubview:](self, "addSubview:", self->_applePayLogoImageView);
    }
    else
    {
      -[UIImageView removeFromSuperview](self->_applePayLogoImageView, "removeFromSuperview");
      v8 = self->_applePayLogoImageView;
      self->_applePayLogoImageView = 0;

    }
    -[PKPeerPaymentBubbleView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLiveRenderingEnabled:(BOOL)a3
{
  if (self->_liveRenderingEnabled != a3)
  {
    self->_liveRenderingEnabled = a3;
    -[PKPeerPaymentBubbleView _updateContent](self, "_updateContent");
  }
}

- (void)setShowsActionSpinner:(BOOL)a3
{
  if (self->_showsActionSpinner != a3)
  {
    self->_showsActionSpinner = a3;
    -[PKPeerPaymentBubbleView _updateContent](self, "_updateContent");
  }
}

- (CGRect)referenceBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[PKPeerPaymentBubbleView referenceSize](self, "referenceSize");
  v3 = v2;
  v5 = v4;
  v6 = 0.0;
  v7 = 0.0;
  result.size.height = v5;
  result.size.width = v3;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGSize)referenceSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "referenceSizeForState:andAction:", self->_state, self->_action);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setTestTransition:(BOOL)a3
{
  NSTimer *v4;
  NSTimer *testTimer;
  NSTimer *v6;
  _QWORD v7[5];

  if (a3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__PKPeerPaymentBubbleView_setTestTransition___block_invoke;
    v7[3] = &unk_1E3E6B958;
    v7[4] = self;
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 1, v7, 2.0);
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    testTimer = self->_testTimer;
    self->_testTimer = v4;

  }
  else
  {
    -[NSTimer invalidate](self->_testTimer, "invalidate");
    v6 = self->_testTimer;
    self->_testTimer = 0;

  }
}

uint64_t __45__PKPeerPaymentBubbleView_setTestTransition___block_invoke(uint64_t a1)
{
  uint64_t v2;

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 5)
    v2 = 2;
  else
    v2 = 5;
  return objc_msgSend(*(id *)(a1 + 32), "setState:animated:", v2, 1);
}

- (void)_updateContent
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PKPeerPayment3DTextView *v13;
  id v14;
  PKPeerPayment3DTextView *v15;
  PKPeerPayment3DTextView *v16;
  NSObject *v17;
  PKPeerPayment3DTextView *v18;
  uint64_t v19;
  int v20;
  PKPeerPayment3DTextView *renderView;
  PKPeerPayment3DTextView *v22;
  UILabel *messageLabel;
  id v24;
  void *v25;
  void *v26;
  UILabel *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  UILabel *imageLabel;
  void *v35;
  void *v36;
  uint64_t v37;
  UILabel *statusLabel;
  UILabel *v39;
  void *v40;
  PKContinuousButton *actionButton;
  UIActivityIndicatorView *actionSpinner;
  PKContinuousButton *v43;
  double v44;
  NSObject *v45;
  int v46;
  PKPeerPaymentBubbleView *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[PKPeerPaymentBubbleView _backgroundColor](self, "_backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentBubbleView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[PKPeerPaymentBubbleView _messageText](self, "_messageText");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1E3E7D690;
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  -[PKPeerPaymentBubbleView _secondaryMessageText](self, "_secondaryMessageText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentBubbleView _imageText](self, "_imageText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_liveRenderingEnabled)
    goto LABEL_19;
  -[PKPeerPaymentBubbleView window](self, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10 && !self->_snapshotInProgress && !self->_usedForSnapshotting || self->_state != 5)
  {

    goto LABEL_19;
  }
  v12 = -[__CFString length](v7, "length");

  if (!v12)
  {
LABEL_19:
    renderView = self->_renderView;
    if (!renderView)
    {
LABEL_22:
      v20 = 0;
      goto LABEL_23;
    }
    -[PKPeerPayment3DTextView removeFromSuperview](renderView, "removeFromSuperview");
    v22 = self->_renderView;
    self->_renderView = 0;
LABEL_21:

    goto LABEL_22;
  }
  v13 = self->_renderView;
  if (!v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0D6C018]);
    -[PKPeerPaymentBubbleView bounds](self, "bounds");
    v15 = (PKPeerPayment3DTextView *)objc_msgSend(v14, "initWithFrame:renderStyle:usedForSnapshotting:", 0, self->_usedForSnapshotting);
    v16 = self->_renderView;
    self->_renderView = v15;

    -[PKPeerPaymentBubbleView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_renderView, 0);
    v13 = self->_renderView;
  }
  if ((-[PKPeerPayment3DTextView setText:](v13, "setText:", v7) & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = 138412290;
      v47 = (PKPeerPaymentBubbleView *)v7;
      _os_log_impl(&dword_19D178000, v45, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentBubbleView: Render View unable to display text: '%@'. Falling back to regular label.", (uint8_t *)&v46, 0xCu);
    }

    -[PKPeerPayment3DTextView removeFromSuperview](self->_renderView, "removeFromSuperview");
    v22 = self->_renderView;
    self->_renderView = 0;
    goto LABEL_21;
  }
  if (self->_renderViewRemovedByLossOfWindow || self->_usedForSnapshotting)
  {
    PKLogFacilityTypeGetObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v46 = 134217984;
      v47 = self;
      _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentBubbleView %p: Bubble views render view had been removed due to loss of window. Recreated render view.", (uint8_t *)&v46, 0xCu);
    }

    v18 = self->_renderView;
    v19 = 0;
  }
  else
  {
    v18 = self->_renderView;
    v19 = 1;
  }
  -[PKPeerPayment3DTextView setMotionEffectEnabled:animated:](v18, "setMotionEffectEnabled:animated:", 1, v19);
  self->_renderViewRemovedByLossOfWindow = 0;
  v20 = 1;
LABEL_23:
  if (self->_state == 11)
  {
    -[UILabel setNumberOfLines:](self->_messageLabel, "setNumberOfLines:", 2);
    -[UILabel setAdjustsFontSizeToFitWidth:](self->_messageLabel, "setAdjustsFontSizeToFitWidth:", 0);
    -[UILabel setNumberOfLines:](self->_secondaryMessageLabel, "setNumberOfLines:", 2);
    -[UILabel setAdjustsFontSizeToFitWidth:](self->_secondaryMessageLabel, "setAdjustsFontSizeToFitWidth:", 0);
  }
  messageLabel = self->_messageLabel;
  if (v20)
  {
    -[UILabel setHidden:](messageLabel, "setHidden:", 1);
    -[UILabel setHidden:](self->_secondaryMessageLabel, "setHidden:", 1);
    -[UILabel setHidden:](self->_imageLabel, "setHidden:", 1);
  }
  else
  {
    -[UILabel setHidden:](messageLabel, "setHidden:", 0);
    v24 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[PKPeerPaymentBubbleView _messageTextAttributes](self, "_messageTextAttributes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithString:attributes:", v7, v25);

    -[UILabel setAttributedText:](self->_messageLabel, "setAttributedText:", v26);
    v27 = self->_messageLabel;
    -[PKPeerPaymentBubbleView _messageAlpha](self, "_messageAlpha");
    -[UILabel setAlpha:](v27, "setAlpha:");

    if (v8)
    {
      -[UILabel setHidden:](self->_secondaryMessageLabel, "setHidden:", 0);
      v28 = objc_alloc(MEMORY[0x1E0CB3498]);
      -[PKPeerPaymentBubbleView _secondaryMessageTextAttributes](self, "_secondaryMessageTextAttributes");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v28, "initWithString:attributes:", v8, v29);

      -[UILabel setAttributedText:](self->_secondaryMessageLabel, "setAttributedText:", v30);
    }
    if (v9)
    {
      -[UILabel setHidden:](self->_imageLabel, "setHidden:", 0);
      v31 = objc_alloc(MEMORY[0x1E0CB3498]);
      -[PKPeerPaymentBubbleView _imageTextAttributes](self, "_imageTextAttributes");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v31, "initWithString:attributes:", v9, v32);

      -[UILabel setAttributedText:](self->_imageLabel, "setAttributedText:", v33);
      imageLabel = self->_imageLabel;
      -[PKPeerPaymentBubbleView _imageLabelBackgroundColor](self, "_imageLabelBackgroundColor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](imageLabel, "setBackgroundColor:", v35);

    }
  }
  -[PKPeerPaymentBubbleView _statusText](self, "_statusText");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "length");
  statusLabel = self->_statusLabel;
  if (v37)
  {
    -[UILabel setHidden:](statusLabel, "setHidden:", 0);
    -[UILabel setText:](self->_statusLabel, "setText:", v36);
    v39 = self->_statusLabel;
    -[PKPeerPaymentBubbleView _statusAlpha](self, "_statusAlpha");
    -[UILabel setAlpha:](v39, "setAlpha:");
  }
  else
  {
    -[UILabel setHidden:](statusLabel, "setHidden:", 1);
    -[UILabel setText:](self->_statusLabel, "setText:", &stru_1E3E7D690);
  }
  -[PKPeerPaymentBubbleView _actionTitle](self, "_actionTitle");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  actionButton = self->_actionButton;
  if (v40)
  {
    -[PKContinuousButton setTitle:forState:](actionButton, "setTitle:forState:", v40, 0);
    actionSpinner = self->_actionSpinner;
    if (self->_showsActionSpinner)
    {
      -[UIActivityIndicatorView startAnimating](actionSpinner, "startAnimating");
      v43 = self->_actionButton;
      v44 = 0.0;
    }
    else
    {
      -[UIActivityIndicatorView stopAnimating](actionSpinner, "stopAnimating");
      v43 = self->_actionButton;
      v44 = 1.0;
    }
    -[PKContinuousButton setAlpha:](v43, "setAlpha:", v44);
  }
  else
  {
    -[PKContinuousButton setAlpha:](actionButton, "setAlpha:", 0.0);
    -[PKContinuousButton setTitle:forState:](self->_actionButton, "setTitle:forState:", &stru_1E3E7D690, 0);
    -[UIActivityIndicatorView stopAnimating](self->_actionSpinner, "stopAnimating");
  }
  -[PKPeerPaymentBubbleView setNeedsLayout](self, "setNeedsLayout");

}

- (id)_backgroundColor
{
  return (id)objc_msgSend((id)objc_opt_class(), "referenceWatchBackgroundColorForState:", self->_state);
}

- (id)_imageLabelBackgroundColor
{
  return PKPeerPaymentMessageColorFromSemanticColor(-[PKPeerPaymentRecurringPaymentMemo color](self->_recurringPaymentMemo, "color"));
}

- (double)_messageAlpha
{
  double result;

  result = 0.2;
  if (self->_state - 6 >= 5)
    return 1.0;
  return result;
}

- (double)_statusAlpha
{
  double result;

  result = 1.0;
  if (self->_state == 11)
    return 0.5;
  return result;
}

- (id)_messageText
{
  void *v3;
  void *v4;
  unint64_t state;
  void *v6;
  uint64_t v8;
  void *v9;

  if (!self->_amount || !self->_currency)
    return 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C88]), "initWithAmount:currency:exponent:", self->_amount, self->_currency, 0);
  v4 = v3;
  state = self->_state;
  if (state == 11)
  {
    objc_msgSend(v3, "minimalFormattedStringValue");
    v8 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v8;
    switch(self->_recurringPaymentFrequency)
    {
      case 1uLL:
        PKLocalizedPeerPaymentRecurringString(CFSTR("RECURRING_PAYMENT_BUBBLE_MESSAGE_WEEKLY"), CFSTR("%@"), v8);
        goto LABEL_14;
      case 2uLL:
        PKLocalizedPeerPaymentRecurringString(CFSTR("RECURRING_PAYMENT_BUBBLE_MESSAGE_BIWEEKLY"), CFSTR("%@"), v8);
        goto LABEL_14;
      case 3uLL:
        PKLocalizedPeerPaymentRecurringString(CFSTR("RECURRING_PAYMENT_BUBBLE_MESSAGE_MONTHLY"), CFSTR("%@"), v8);
        goto LABEL_14;
      case 4uLL:
        PKLocalizedPeerPaymentRecurringString(CFSTR("RECURRING_PAYMENT_BUBBLE_MESSAGE_DAILY"), CFSTR("%@"), v8);
        goto LABEL_14;
      default:
        v9 = 0;
        break;
    }
  }
  else
  {
    if (state == 1)
    {
      objc_msgSend(v3, "minimalFormattedStringValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_BUBBLE_PENDING_REQUEST_FORMAT"), CFSTR("%@"), v6);
    }
    else
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US"));
      objc_msgSend(v4, "minimalFormattedStringValueInLocale:", v6);
    }
LABEL_14:
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_secondaryMessageText
{
  void *v2;

  if (self->_state == 11)
  {
    -[PKPeerPaymentRecurringPaymentMemo text](self->_recurringPaymentMemo, "text");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_imageText
{
  void *v2;

  if (self->_state == 11)
  {
    -[PKPeerPaymentRecurringPaymentMemo emoji](self->_recurringPaymentMemo, "emoji");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_messageTextAttributes
{
  void *v3;
  void *v4;
  unint64_t state;
  uint64_t v6;
  double *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0DC1140]);

  state = self->_state;
  if (state == 11)
  {
    v6 = *MEMORY[0x1E0DC4A98];
    v7 = (double *)MEMORY[0x1E0DC1448];
  }
  else
  {
    if (state != 1)
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "pk_peerPaymentChiseledCashFontOfSize:", 69.0);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v6 = *MEMORY[0x1E0DC4A88];
    v7 = (double *)MEMORY[0x1E0DC1440];
  }
  PKDefaultSystemFontWithPreferredSizeForTextStyleAndWeight(v6, *v7);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v9 = (void *)v8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0DC1138]);

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (id)_secondaryMessageTextAttributes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0DC1140]);

  PKDefaultSystemFontWithPreferredSizeForTextStyleAndWeight(*MEMORY[0x1E0DC4A98], *MEMORY[0x1E0DC1440]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0DC1138]);

  v5 = (void *)objc_msgSend(v2, "copy");
  return v5;
}

- (id)_imageTextAttributes
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKDefaultSystemFontOfSizeAndWeight(24.0, *MEMORY[0x1E0DC1440]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0DC1138]);

  v4 = (void *)objc_msgSend(v2, "copy");
  return v4;
}

- (id)_statusText
{
  void *v2;
  __CFString *v4;
  uint64_t v5;
  void *v7;
  int v8;
  void *v9;

  if (self->_action)
  {
    v2 = 0;
  }
  else
  {
    v2 = 0;
    switch(self->_state)
    {
      case 4uLL:
        v4 = CFSTR("PEER_PAYMENT_BUBBLE_STATUS_PENDING");
        goto LABEL_9;
      case 6uLL:
        v4 = CFSTR("PEER_PAYMENT_BUBBLE_STATUS_EXPIRED");
        goto LABEL_9;
      case 7uLL:
        v4 = CFSTR("PEER_PAYMENT_BUBBLE_STATUS_REJECTED");
        goto LABEL_9;
      case 8uLL:
        v4 = CFSTR("PEER_PAYMENT_BUBBLE_STATUS_CANCELED");
        goto LABEL_9;
      case 9uLL:
        v4 = CFSTR("PEER_PAYMENT_BUBBLE_STATUS_INVALID");
LABEL_9:
        PKLocalizedPeerPaymentString(&v4->isa);
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 0xBuLL:
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isDateInToday:", self->_recurringPaymentStartDate);

        if (v8)
        {
          PKLocalizedPeerPaymentRecurringString(CFSTR("RECURRING_PAYMENT_BUBBLE_STATUS_STARTS_TODAY"));
          v5 = objc_claimAutoreleasedReturnValue();
LABEL_10:
          v2 = (void *)v5;
        }
        else
        {
          PKMediumDateString();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedPeerPaymentRecurringString(CFSTR("RECURRING_PAYMENT_BUBBLE_STATUS"), CFSTR("%@"), v9);
          v2 = (void *)objc_claimAutoreleasedReturnValue();

        }
        break;
      default:
        return v2;
    }
  }
  return v2;
}

- (id)_actionTitle
{
  unint64_t action;
  __CFString *v3;
  void *v4;

  action = self->_action;
  if (action == 2)
  {
    if (self->_state == 4)
    {
      v3 = CFSTR("PEER_PAYMENT_BUBBLE_ACTION_ACCEPT");
      goto LABEL_7;
    }
LABEL_8:
    v4 = 0;
    return v4;
  }
  if (action != 1 || self->_state != 1)
    goto LABEL_8;
  v3 = CFSTR("PEER_PAYMENT_BUBBLE_ACTION_PAY");
LABEL_7:
  PKLocalizedPeerPaymentString(&v3->isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (void)_actionButtonTapped:(id)a3
{
  id v4;
  void (**actionHandler)(id, PKPeerPaymentBubbleView *, unint64_t);
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  actionHandler = (void (**)(id, PKPeerPaymentBubbleView *, unint64_t))self->_actionHandler;
  if (actionHandler)
  {
    actionHandler[2](actionHandler, self, self->_action);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentBubbleView: Unable to perform action. No action handler specified.", v7, 2u);
    }

  }
}

- (void)updateWithPeerPaymentStatus:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  char v6;
  uint64_t v7;

  v4 = a4;
  v6 = 0;
  v7 = 4;
  switch(a3)
  {
    case -1:
      v6 = 0;
      v7 = 10;
      break;
    case 0:
      break;
    case 1:
      v6 = 0;
      v7 = 5;
      break;
    case 4:
      v6 = 0;
      v7 = 9;
      break;
    case 5:
      v6 = 0;
      v7 = 8;
      break;
    case 6:
      v6 = 0;
      v7 = 7;
      break;
    case 7:
      v6 = 0;
      v7 = 6;
      break;
    default:
      v7 = 0;
      v6 = 1;
      break;
  }
  if (v7 != self->_state)
  {
    -[PKPeerPaymentBubbleView setAction:](self, "setAction:", 0);
    if ((v6 & 1) == 0)
      -[PKPeerPaymentBubbleView setState:animated:](self, "setState:animated:", v7, v4);
  }
}

- (void)updateWithPeerPaymentStatusResponse:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  char v11;
  void *v12;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v12 = v6;
    -[PKPeerPaymentBubbleView updateWithPeerPaymentStatus:animated:](self, "updateWithPeerPaymentStatus:animated:", objc_msgSend(v6, "status"), v4);
    objc_msgSend(v12, "actions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", *MEMORY[0x1E0D6B0E8]);

    if (v9)
      v10 = 2;
    else
      v10 = 0;
    -[PKPeerPaymentBubbleView setAction:animated:](self, "setAction:animated:", v10, v4);
    v11 = objc_msgSend(v12, "amountHashIsValidForAmount:andCurrency:", self->_amount, self->_currency);
    v7 = v12;
    if ((v11 & 1) == 0)
    {
      -[PKPeerPaymentBubbleView setState:animated:](self, "setState:animated:", 9, v4);
      v7 = v12;
    }
  }

}

- (void)updateWithPaymentTransaction:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v12 = v6;
    objc_msgSend(v6, "currencyCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "amount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "transactionType") == 3)
    {
      objc_msgSend(v12, "subtotalAmount");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v12, "subtotalAmount");
        v10 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v10;
      }
    }
    if (v7 && v8)
    {
      -[PKPeerPaymentBubbleView setAmount:](self, "setAmount:", v8);
      -[PKPeerPaymentBubbleView setCurrency:](self, "setCurrency:", v7);
    }
    v11 = objc_msgSend(v12, "peerPaymentStatus");
    if (v11 != -1)
      -[PKPeerPaymentBubbleView updateWithPeerPaymentStatus:animated:](self, "updateWithPeerPaymentStatus:animated:", v11, v4);

    v6 = v12;
  }

}

- (void)updateWithPeerPaymentMessage:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  int v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PKPeerPaymentBubbleView *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v20 = v6;
    v7 = objc_msgSend(v6, "isFromMe");
    v8 = (_QWORD *)MEMORY[0x1E0D68020];
    if (!v7)
      v8 = (_QWORD *)MEMORY[0x1E0D67F28];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), *MEMORY[0x1E0D678B8], *v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentBubbleView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v9);
    objc_msgSend(v20, "amount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentBubbleView setAmount:](self, "setAmount:", v10);

    objc_msgSend(v20, "currency");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentBubbleView setCurrency:](self, "setCurrency:", v11);

    v12 = objc_msgSend(v20, "type");
    if (v12 != 1)
    {
      if (v12 == 3)
      {
        -[PKPeerPaymentBubbleView setState:animated:](self, "setState:animated:", 11, v4);
        objc_msgSend(v20, "recurringPaymentMemo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPeerPaymentBubbleView setRecurringPaymentMemo:](self, "setRecurringPaymentMemo:", v18);

        objc_msgSend(v20, "recurringPaymentStartDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPeerPaymentBubbleView setRecurringPaymentStartDate:](self, "setRecurringPaymentStartDate:", v19);

        -[PKPeerPaymentBubbleView setRecurringPaymentFrequency:](self, "setRecurringPaymentFrequency:", objc_msgSend(v20, "recurringPaymentFrequency"));
      }
      else if (v12 == 2)
      {
        v13 = self;
        v14 = 1;
LABEL_15:
        -[PKPeerPaymentBubbleView setState:animated:](v13, "setState:animated:", v14, v4);
      }

      v6 = v20;
      goto LABEL_17;
    }
    if ((objc_msgSend(v20, "hasBeenSent") & 1) != 0)
    {
      objc_msgSend(v20, "transactionIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15
        && (v16 = (void *)v15,
            objc_msgSend(v20, "paymentIdentifier"),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            v17,
            v16,
            v17))
      {
        v13 = self;
        v14 = 3;
      }
      else
      {
        v13 = self;
        v14 = 9;
      }
    }
    else
    {
      v13 = self;
      v14 = 2;
    }
    goto LABEL_15;
  }
LABEL_17:

}

- (id)generatedSnapshot
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  void *v9;
  void *v10;
  CGSize v12;

  self->_snapshotInProgress = 1;
  -[PKPeerPaymentBubbleView _updateContent](self, "_updateContent");
  v3 = -[PKContinuousButton isEnabled](self->_actionButton, "isEnabled");
  -[PKContinuousButton setEnabled:](self->_actionButton, "setEnabled:", 0);
  v4 = -[UILabel isHidden](self->_statusLabel, "isHidden");
  if (self->_state - 3 < 2)
    v5 = 1;
  else
    v5 = v4;
  -[UILabel setHidden:](self->_statusLabel, "setHidden:", v5);
  -[PKPeerPaymentBubbleView setNeedsLayout](self, "setNeedsLayout");
  -[PKPeerPaymentBubbleView layoutIfNeeded](self, "layoutIfNeeded");
  -[PKPeerPaymentBubbleView bounds](self, "bounds");
  v12.width = v6;
  v12.height = v7;
  UIGraphicsBeginImageContextWithOptions(v12, 1, 0.0);
  -[PKPeerPaymentBubbleView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "renderInContext:", UIGraphicsGetCurrentContext());

  -[PKPeerPayment3DTextView generatedSnapshot](self->_renderView, "generatedSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPayment3DTextView frame](self->_renderView, "frame");
  objc_msgSend(v9, "drawInRect:");

  UIGraphicsGetImageFromCurrentImageContext();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  -[PKContinuousButton setEnabled:](self->_actionButton, "setEnabled:", v3);
  -[UILabel setHidden:](self->_statusLabel, "setHidden:", v4);
  self->_snapshotInProgress = 0;
  -[PKPeerPaymentBubbleView _updateContent](self, "_updateContent");
  return v10;
}

+ (id)generatedSnapshotForDataURL:(id)a3 contentInset:(UIEdgeInsets)a4 isFromMe:(BOOL)a5
{
  double right;
  double bottom;
  double left;
  double top;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v10 = a3;
  if (v10)
  {
    PKProtobufForDataURL();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKPeerPaymentMessageCurrencyAmountFromProtobuf();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "currency");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (id)v14;
        objc_msgSend(v13, "currency");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "length") != 3
          || (objc_msgSend(v13, "amount"), (v17 = objc_claimAutoreleasedReturnValue()) == 0))
        {

          v25 = 0;
LABEL_15:

          goto LABEL_16;
        }
        v18 = (void *)v17;
        objc_msgSend(v13, "amount");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "compare:", v20);

        if (v21 == 1)
        {
          v15 = -[PKPeerPaymentBubbleView initForSnapshotting]([PKPeerPaymentBubbleView alloc], "initForSnapshotting");
          objc_msgSend(v15, "setDisplaysApplePayLogo:", 1);
          objc_msgSend(v15, "setContentInset:", top, left, bottom, right);
          objc_msgSend(v13, "currency");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setCurrency:", v22);

          objc_msgSend(v13, "amount");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setAmount:", v23);

          objc_msgSend(v15, "setLiveRenderingEnabled:", 1);
          v24 = PKPeerPaymentMessageTypeFromProtobuf();
          switch(v24)
          {
            case 1:
              objc_msgSend(v15, "setState:animated:", 5, 0);
              break;
            case 3:
              objc_msgSend(v15, "setState:animated:", 11, 0);
              objc_msgSend(v15, "setRecurringPaymentFrequency:", PKPeerPaymentMessageRecurringPaymentFrequencyFromProtobuf());
              PKPeerPaymentMessageRecurringPaymentStartDateFromProtobuf();
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setRecurringPaymentStartDate:", v27);

              PKPeerPaymentMessageMemoFromDataURL();
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              PKPeerPaymentMessageRecurringPaymentEmojiFromProtobuf();
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = PKPeerPaymentMessageRecurringPaymentColorFromProtobuf();
              v31 = v30;
              if (v28 || v29 && v30)
              {
                v32 = objc_alloc_init(MEMORY[0x1E0D67458]);
                objc_msgSend(v32, "setText:", v28);
                objc_msgSend(v32, "setEmoji:", v29);
                objc_msgSend(v32, "setColor:", v31);
                objc_msgSend(v15, "setRecurringPaymentMemo:", v32);

              }
              break;
            case 2:
              objc_msgSend(v15, "setState:animated:", 1, 0);
              if (!a5)
                objc_msgSend(v15, "setAction:animated:", 1, 0);
              break;
          }
          objc_msgSend(v15, "sizeToFit");
          objc_msgSend(v15, "generatedSnapshot");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
      }
    }
    v25 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v25 = 0;
LABEL_17:

  return v25;
}

- (void)performPostRender:(id)a3
{
  id v4;
  PKPeerPayment3DTextView *renderView;
  _QWORD block[4];
  id v7;

  v4 = a3;
  renderView = self->_renderView;
  if (renderView)
  {
    -[PKPeerPayment3DTextView performPostRender:](renderView, "performPostRender:", v4);
  }
  else
  {
    -[PKPeerPaymentBubbleView setNeedsDisplay](self, "setNeedsDisplay");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PKPeerPaymentBubbleView_performPostRender___block_invoke;
    block[3] = &unk_1E3E61590;
    v7 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __45__PKPeerPaymentBubbleView_performPostRender___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)didMoveToWindow
{
  void *v3;
  dispatch_time_t v4;
  _QWORD v5[5];
  _QWORD block[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPeerPaymentBubbleView;
  -[PKPeerPaymentBubbleView didMoveToWindow](&v7, sel_didMoveToWindow);
  -[PKPeerPaymentBubbleView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__PKPeerPaymentBubbleView_didMoveToWindow__block_invoke;
    block[3] = &unk_1E3E612E8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v4 = dispatch_time(0, 3000000000);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __42__PKPeerPaymentBubbleView_didMoveToWindow__block_invoke_2;
    v5[3] = &unk_1E3E612E8;
    v5[4] = self;
    dispatch_after(v4, MEMORY[0x1E0C80D38], v5);
  }
}

uint64_t __42__PKPeerPaymentBubbleView_didMoveToWindow__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateContent");
}

uint64_t __42__PKPeerPaymentBubbleView_didMoveToWindow__block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 416))
  {
    v2 = result;
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 134217984;
      v5 = v1;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentBubbleView %p: Bubble view no longer has a window and we have a render view. Discarding render view.", (uint8_t *)&v4, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(v2 + 32) + 424) = 1;
    return objc_msgSend(*(id *)(v2 + 32), "_updateContent");
  }
  return result;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (NSString)currency
{
  return self->_currency;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (BOOL)testTransition
{
  return self->_testTransition;
}

- (PKPeerPaymentRecurringPaymentMemo)recurringPaymentMemo
{
  return self->_recurringPaymentMemo;
}

- (NSDate)recurringPaymentStartDate
{
  return self->_recurringPaymentStartDate;
}

- (unint64_t)recurringPaymentFrequency
{
  return self->_recurringPaymentFrequency;
}

- (unint64_t)action
{
  return self->_action;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 592);
}

- (BOOL)showsActionSpinner
{
  return self->_showsActionSpinner;
}

- (PKContinuousButton)actionButton
{
  return self->_actionButton;
}

- (BOOL)hasRoundedCorners
{
  return self->_hasRoundedCorners;
}

- (BOOL)usesWatchColors
{
  return self->_usesWatchColors;
}

- (void)setUsesWatchColors:(BOOL)a3
{
  self->_usesWatchColors = a3;
}

- (BOOL)displaysApplePayLogo
{
  return self->_displaysApplePayLogo;
}

- (BOOL)isLiveRenderingEnabled
{
  return self->_liveRenderingEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_recurringPaymentStartDate, 0);
  objc_storeStrong((id *)&self->_recurringPaymentMemo, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_testTimer, 0);
  objc_storeStrong((id *)&self->_applePayLogoImageView, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_actionSpinner, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_imageLabel, 0);
  objc_storeStrong((id *)&self->_secondaryMessageLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_renderView, 0);
}

- (id)interactiveViews
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[PKPeerPaymentBubbleView actionButton](self, "actionButton");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
