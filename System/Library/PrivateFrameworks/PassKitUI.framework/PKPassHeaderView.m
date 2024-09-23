@implementation PKPassHeaderView

- (PKPassHeaderView)initWithPass:(id)a3
{
  return -[PKPassHeaderView initWithPass:rendererState:](self, "initWithPass:rendererState:", a3, 0);
}

- (PKPassHeaderView)initWithPass:(id)a3 rendererState:(id)a4
{
  id v7;
  id v8;
  PKPassHeaderView *v9;
  PKPassHeaderView *v10;
  id *p_pass;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  UIView *v16;
  UIView *passMaskView;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  UIImageView *maskShadow;
  UILabel *v25;
  UILabel *title;
  UILabel *v27;
  void *v28;
  UILabel *v29;
  void *v30;
  UILabel *v31;
  UILabel *subtitle;
  UILabel *v33;
  void *v34;
  UILabel *v35;
  void *v36;
  id v38;
  objc_super v39;

  v7 = a3;
  v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)PKPassHeaderView;
  v9 = -[PKPassHeaderView initWithFrame:](&v39, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v10 = v9;
  if (v9)
  {
    v38 = v7;
    p_pass = (id *)&v9->_pass;
    objc_storeStrong((id *)&v9->_pass, a3);
    objc_storeStrong((id *)&v10->_rendererState, a4);
    *(_OWORD *)&v10->_contentInsets.top = StandardContentInsets;
    *(_OWORD *)&v10->_contentInsets.bottom = unk_19DF17868;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*p_pass, "isRemotePass"))
    {
      objc_msgSend(v12, "addObserver:selector:name:object:", v10, sel__passLibraryDidChange_, *MEMORY[0x1E0D6A788], 0);
    }
    else
    {
      objc_msgSend(*p_pass, "dataAccessor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_storeStrong((id *)&v10->_remoteDataAccessor, v13);
        v14 = *MEMORY[0x1E0D6A788];
        -[PKRemoteDataAccessor library](v10->_remoteDataAccessor, "library");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObserver:selector:name:object:", v10, sel__passLibraryDidChange_, v14, v15);

      }
    }
    v16 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    passMaskView = v10->_passMaskView;
    v10->_passMaskView = v16;

    v18 = (void *)MEMORY[0x1E0DC3870];
    PKPassKitUIBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "imageNamed:inBundle:", CFSTR("CardDetail_PassPocket"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "imageWithAlignmentRectInsets:", 0.0, 15.0, 0.0, 15.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "pkui_resizableImageByTilingCenterPixel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v22);
    maskShadow = v10->_maskShadow;
    v10->_maskShadow = (UIImageView *)v23;

    v25 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    title = v10->_title;
    v10->_title = v25;

    -[UILabel setNumberOfLines:](v10->_title, "setNumberOfLines:", 2);
    v27 = v10->_title;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v27, "setBackgroundColor:", v28);

    v29 = v10->_title;
    -[PKPassHeaderView _primaryTextColor](v10, "_primaryTextColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v29, "setTextColor:", v30);

    -[UILabel setMinimumScaleFactor:](v10->_title, "setMinimumScaleFactor:", 0.6);
    -[UILabel setAdjustsFontSizeToFitWidth:](v10->_title, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setLineBreakMode:](v10->_title, "setLineBreakMode:", 4);
    -[UILabel setTextAlignment:](v10->_title, "setTextAlignment:", 1);
    -[UILabel setAccessibilityIdentifier:](v10->_title, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    v31 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitle = v10->_subtitle;
    v10->_subtitle = v31;

    -[UILabel setMinimumScaleFactor:](v10->_subtitle, "setMinimumScaleFactor:", 0.6);
    -[UILabel setAdjustsFontSizeToFitWidth:](v10->_subtitle, "setAdjustsFontSizeToFitWidth:", 1);
    v33 = v10->_subtitle;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v33, "setBackgroundColor:", v34);

    v35 = v10->_subtitle;
    -[PKPassHeaderView _secondaryTextColor](v10, "_secondaryTextColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v35, "setTextColor:", v36);

    -[UILabel setAccessibilityIdentifier:](v10->_subtitle, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
    -[PKPassHeaderView _resetFonts](v10, "_resetFonts");
    -[UIView addSubview:](v10->_passMaskView, "addSubview:", v10->_maskShadow);
    -[PKPassHeaderView addSubview:](v10, "addSubview:", v10->_passMaskView);
    -[PKPassHeaderView addSubview:](v10, "addSubview:", v10->_title);
    -[PKPassHeaderView addSubview:](v10, "addSubview:", v10->_subtitle);
    -[PKPassHeaderView _updateContent](v10, "_updateContent");
    -[PKPassHeaderView setAccessibilityIdentifier:](v10, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C48]);

    v7 = v38;
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKPassHeaderView;
  -[PKPassHeaderView dealloc](&v4, sel_dealloc);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double top;
  double left;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  UILabel *title;
  void *v25;
  uint64_t v26;
  CGFloat v27;
  CGFloat v28;
  UILabel *subtitle;
  CGFloat v30;
  CATransform3D v31;
  __int128 v32;
  CGFloat amount[2];
  CGFloat sx;
  CGRect remainder;
  CGRect slice;
  objc_super v37;
  CGRect v38;

  v37.receiver = self;
  v37.super_class = (Class)PKPassHeaderView;
  -[PKPassHeaderView layoutSubviews](&v37, sel_layoutSubviews);
  -[PKPassHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  memset(&slice, 0, sizeof(slice));
  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  v11 = v3 + left;
  v12 = v6 + top;
  v13 = v8 - (left + self->_contentInsets.right);
  v15 = v14 - (top + self->_contentInsets.bottom);
  remainder.origin.x = v3 + left;
  remainder.origin.y = v6 + top;
  remainder.size.width = v13;
  remainder.size.height = v15;
  sx = 0.0;
  v32 = 0u;
  *(_OWORD *)amount = 0u;
  -[PKPassHeaderView passSizeInfoForHeight:](self, "passSizeInfoForHeight:", self->passImageHeight);
  -[UIView setFrame:](self->_passMaskView, "setFrame:", v4 + -44.0, v6 + -44.0, v8 + 88.0, self->_contentInsets.top + 44.0 + 0.0);
  if (-[UIView clipsToBounds](self->_passMaskView, "clipsToBounds", (unsigned __int128)0, 0.0, 0.0))
    -[UIView setClipsToBounds:](self->_passMaskView, "setClipsToBounds:", 0);
  -[UIImageView setAlpha:](self->_maskShadow, "setAlpha:", (double)0);
  -[PKPassView layer](self->_passView, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  CATransform3DMakeScale(&v31, sx, sx, 1.0);
  objc_msgSend(v16, "setTransform:", &v31);
  objc_msgSend(v16, "bounds");
  objc_msgSend(v16, "anchorPoint");
  v38.origin.x = v11;
  v38.origin.y = v12;
  v38.size.width = v13;
  v38.size.height = v15;
  CGRectDivide(v38, &slice, &remainder, amount[1], CGRectMinYEdge);
  PKSizeAlignedInRect();
  PKPointRoundToPixel();
  objc_msgSend(v16, "setPosition:");
  -[UIImageView pkui_alignmentRect](self->_maskShadow, "pkui_alignmentRect");
  PKRectRoundToPixel();
  PKSizeAlignedInRect();
  -[UIImageView pkui_setAlignmentRect:](self->_maskShadow, "pkui_setAlignmentRect:", v17 + 44.0, v18 + 44.0);
  -[UILabel font](self->_title, "font");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_bodyLeading");

  -[UILabel font](self->_subtitle, "font");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_bodyLeading");

  PKFloatFloorToPixel();
  CGRectDivide(remainder, &slice, &remainder, v21, CGRectMinYEdge);
  -[UILabel minimumScaleFactor](self->_title, "minimumScaleFactor");
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_title, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width / v22, remainder.size.height / v22);
  PKSizeCeilToPixel();
  CGRectDivide(remainder, &slice, &remainder, v23, CGRectMinYEdge);
  title = self->_title;
  PKSizeAlignedInRect();
  -[UILabel setFrame:](title, "setFrame:");
  -[UILabel text](self->_subtitle, "text");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "length");

  if (v26)
  {
    PKFloatFloorToPixel();
    CGRectDivide(remainder, &slice, &remainder, v27, CGRectMinYEdge);
    -[UILabel pkui_sizeThatFits:](self->_subtitle, "pkui_sizeThatFits:", remainder.size.width, remainder.size.height);
    CGRectDivide(remainder, &slice, &remainder, v28, CGRectMinYEdge);
    subtitle = self->_subtitle;
    PKSizeAlignedInRect();
    -[UILabel setFrame:](subtitle, "setFrame:");
  }
  PKFloatFloorToPixel();
  CGRectDivide(remainder, &slice, &remainder, v30, CGRectMinYEdge);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double bottom;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGSize result;

  height = a3.height;
  width = a3.width;
  self->passImageHeight = a3.height;
  -[PKPassHeaderView passSizeInfoForHeight:](self, "passSizeInfoForHeight:", a3.height, 0, 0, 0);
  -[UILabel font](self->_title, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_bodyLeading");

  -[UILabel font](self->_subtitle, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_bodyLeading");

  bottom = self->_contentInsets.bottom;
  v9 = width - self->_contentInsets.left - self->_contentInsets.right + -12.0;
  v10 = height - self->_contentInsets.top - bottom;
  v11 = self->_contentInsets.top + bottom + 0.0;
  PKFloatFloorToPixel();
  v13 = v11 + v12;
  -[UILabel minimumScaleFactor](self->_title, "minimumScaleFactor");
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_title, "pkui_sizeThatFits:forceWordWrap:", 1, v9 / v14, v10 / v14);
  PKSizeCeilToPixel();
  v16 = v13 + v15;
  -[UILabel text](self->_subtitle, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (v18)
  {
    PKFloatFloorToPixel();
    v20 = v16 + v19;
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_subtitle, "pkui_sizeThatFits:forceWordWrap:", 1, v9, v10);
    v16 = v20 + v21;
  }
  PKFloatFloorToPixel();
  v23 = self->_contentInsets.top + v16 + v22 + self->_contentInsets.bottom;
  v24 = width;
  result.height = v23;
  result.width = v24;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSComparisonResult v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassHeaderView;
  -[PKPassHeaderView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[PKPassHeaderView traitCollection](self, "traitCollection");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      objc_msgSend(v4, "preferredContentSizeCategory");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredContentSizeCategory");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9)
        -[PKPassHeaderView _resetFonts](self, "_resetFonts");
    }
  }

}

- (void)updateShadow:(double)a3
{
  double v4;
  id v5;

  -[PKPassView layer](self->_passView, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = fmin(fmax(a3, 0.0), 1.0) * 0.25;
  *(float *)&v4 = v4;
  objc_msgSend(v5, "setShadowOpacity:", v4);

}

- ($B75038A793E8936108FFEDE39FC44C1F)passSizeInfoForHeight:(SEL)a3
{
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  $B75038A793E8936108FFEDE39FC44C1F *result;
  double v17;
  CGRect v18;

  retstr->var2 = 0.0;
  retstr->var0 = 0u;
  retstr->var1 = 0u;
  -[PKPassView sizeOfFront](self->_passView, "sizeOfFront");
  v8 = v7;
  v10 = v9;
  v11 = -[UIView pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts");
  v12 = 98.0;
  if (v11)
    v12 = 128.0;
  v13 = v12 / v8;
  v14 = floor(v10 * v13);
  retstr->var0.width = v12;
  retstr->var0.height = v14;
  v15 = fmin(v14, a4);
  retstr->var1.width = v12;
  retstr->var1.height = v15;
  retstr->var2 = v13;
  -[PKPass thumbnailRect](self->_pass, "thumbnailRect");
  v17 = CGRectGetMaxY(v18) * v13 + 1.0;
  if (v15 < v17)
    retstr->var1.height = v17;
  return result;
}

- (void)_updateContent
{
  PKPassView *passView;
  void *v4;
  float v5;
  float v6;
  PKPassView *v7;
  PKPassView *v8;
  unint64_t suppressedContent;
  uint64_t v10;
  PKPassView *v11;
  PKPassView *v12;
  void *v13;
  id v14;
  double v15;
  PKPassView *v16;

  passView = self->_passView;
  if (passView)
  {
    -[PKPassView layer](passView, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shadowOpacity");
    v6 = v5;

    v7 = self->_passView;
    if (v7)
    {
      v16 = v7;
      -[PKPassView removeFromSuperview](self->_passView, "removeFromSuperview");
      v8 = self->_passView;
      self->_passView = 0;

    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
    v6 = 0.25;
  }
  suppressedContent = self->_suppressedContent;
  if (self->_rendererState && !PKIsLowEndDevice())
    v10 = 1527;
  else
    v10 = 2039;
  v11 = -[PKPassView initWithPass:content:suppressedContent:rendererState:]([PKPassView alloc], "initWithPass:content:suppressedContent:rendererState:", self->_pass, 4, suppressedContent | v10, self->_rendererState);
  v12 = self->_passView;
  self->_passView = v11;

  -[PKPassView setUserInteractionEnabled:](self->_passView, "setUserInteractionEnabled:", 0);
  -[PKPassView setModallyPresented:](self->_passView, "setModallyPresented:", 1);
  -[PKPassView setPaused:](self->_passView, "setPaused:", 1);
  -[PKPassView sizeToFit](self->_passView, "sizeToFit");
  -[PKPassView layer](self->_passView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShouldRasterize:", 1);
  objc_msgSend(v13, "setRasterizationScale:", PKUIScreenScale());
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v13, "setShadowColor:", objc_msgSend(v14, "CGColor"));

  *(float *)&v15 = v6;
  objc_msgSend(v13, "setShadowOpacity:", v15);
  objc_msgSend(v13, "setShadowOffset:", 0.0, 12.0);
  objc_msgSend(v13, "setShadowRadius:", 18.0);
  -[UIView insertSubview:belowSubview:](self->_passMaskView, "insertSubview:belowSubview:", self->_passView, self->_maskShadow);
  -[PKPassHeaderView _updateTextContent](self, "_updateTextContent");
  -[PKPassHeaderView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateTextContent
{
  PKPass *pass;
  UILabel *title;
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  UILabel *subtitle;
  void *v22;
  PKPass *v23;

  if (-[PKPass passType](self->_pass, "passType") == PKPassTypeSecureElement)
    pass = self->_pass;
  else
    pass = 0;
  v23 = pass;
  title = self->_title;
  -[PKPass localizedDescription](self->_pass, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](title, "setText:", v5);

  if (v23)
  {
    if (-[PKPass passType](self->_pass, "passType") == PKPassTypeSecureElement)
    {
      -[PKPass passLocalizedStringForKey:](v23, "passLocalizedStringForKey:", CFSTR("PASS_DETAIL_PASS_SUBTITLE_TEXT"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!PKEqualObjects())
      {
LABEL_31:
        -[UILabel setText:](self->_subtitle, "setText:", v6);
        subtitle = self->_subtitle;
        -[PKPassHeaderView _secondaryTextColor](self, "_secondaryTextColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](subtitle, "setTextColor:", v22);

        -[UILabel sizeToFit](self->_subtitle, "sizeToFit");
LABEL_32:

        goto LABEL_33;
      }
      if (-[PKPass isTransitPass](v23, "isTransitPass"))
      {
        v7 = CFSTR("TRANSIT_CARD");
LABEL_9:
        PKLocalizedPaymentString(&v7->isa);
        v8 = objc_claimAutoreleasedReturnValue();
LABEL_21:
        v17 = (void *)v8;

        v6 = v17;
        goto LABEL_31;
      }
      if (-[PKPass isIdentityPass](v23, "isIdentityPass"))
      {
        PKLocalizedIdentityString(CFSTR("GOVERNMENT_ID"));
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      if (-[PKPass supportsBarcodePayment](v23, "supportsBarcodePayment"))
      {
        PKLocalizedAquamanString(CFSTR("QR_PAYMENT_PASS"));
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      if (-[PKPass isAccessPass](v23, "isAccessPass"))
      {
        switch(-[PKPass accessType](v23, "accessType"))
        {
          case 0:
          case 2:
            v7 = CFSTR("ACCESS_BADGE");
            goto LABEL_9;
          case 1:
          case 3:
          case 6:
            v7 = CFSTR("GENERIC_KEY_PASS");
            goto LABEL_9;
          case 4:
            PKLocalizedCredentialString(CFSTR("CAR_KEY_PASS"));
            v8 = objc_claimAutoreleasedReturnValue();
            goto LABEL_21;
          case 5:
            v7 = CFSTR("RESIDENT_KEY_PASS");
            goto LABEL_9;
          default:
            goto LABEL_31;
        }
        goto LABEL_31;
      }
      if (-[PKPass isAppleBalancePass](v23, "isAppleBalancePass"))
      {
        objc_msgSend(MEMORY[0x1E0D66A68], "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "appleAccountInformation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "appleID");
        v20 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v20;
        if (!v20)
        {
          PKLocalizedPaymentString(CFSTR("PAYMENT_CARD"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_31;
      }
      if (!-[PKPass isPayLaterPass](v23, "isPayLaterPass"))
      {
        v7 = CFSTR("PAYMENT_CARD");
        goto LABEL_9;
      }

    }
    v6 = 0;
    goto LABEL_31;
  }
  if (self->_showModificationDate)
  {
    -[PKPass modifiedDate](self->_pass, "modifiedDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      PKRelativeDateString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedString(CFSTR("LAST_UPDATED_FORMAT"), CFSTR("%@"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
    -[UILabel setText:](self->_subtitle, "setText:", v10);
    v15 = self->_subtitle;
    -[PKPassHeaderView _secondaryTextColor](self, "_secondaryTextColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v15, "setTextColor:", v16);

    -[UILabel sizeToFit](self->_subtitle, "sizeToFit");
    goto LABEL_32;
  }
  if (self->_expiredPass)
  {
    v11 = self->_subtitle;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v11, "setTextColor:", v12);

    v13 = self->_subtitle;
    PKLocalizedString(CFSTR("NFC_PASS_EXPIRED"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v13, "setText:", v14);

    -[UILabel sizeToFit](self->_subtitle, "sizeToFit");
  }
LABEL_33:
  -[PKPassHeaderView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_resetFonts
{
  uint64_t v3;
  UILabel *title;
  void *v5;
  void *v6;
  UILabel *subtitle;
  void *v8;

  if (self->_small)
    v3 = 32770;
  else
    v3 = 0x8000;
  title = self->_title;
  v5 = (void *)*MEMORY[0x1E0DC48D0];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B50], (void *)*MEMORY[0x1E0DC48D0], v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](title, "setFont:", v6);

  subtitle = self->_subtitle;
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], v5, 0x8000, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](subtitle, "setFont:", v8);

  -[PKPassHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateModifiedDate
{
  void *v3;
  void *v4;
  id v5;

  if (self->_subtitle)
  {
    -[PKPass modifiedDate](self->_pass, "modifiedDate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      PKRelativeDateString();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedString(CFSTR("LAST_UPDATED_FORMAT"), CFSTR("%@"), v3, v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
    -[UILabel setText:](self->_subtitle, "setText:", v4);
    -[UILabel sizeToFit](self->_subtitle, "sizeToFit");
    -[PKPassHeaderView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)_passLibraryDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__PKPassHeaderView__passLibraryDidChange___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __42__PKPassHeaderView__passLibraryDidChange___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  void (**v8)(void *, void *);
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD aBlock[5];

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "isRemotePass");
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 504);
  if (v5)
    v6 = v2 == 0;
  else
    v6 = 1;
  if (v6)
  {
    if (!v5)
      return;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      return;
    v4 = *(_QWORD *)(a1 + 32);
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__PKPassHeaderView__passLibraryDidChange___block_invoke_2;
  aBlock[3] = &unk_1E3E76480;
  aBlock[4] = v4;
  v8 = (void (**)(void *, void *))_Block_copy(aBlock);
  v9 = *(_QWORD *)(a1 + 32);
  if (v3 && (v10 = *(void **)(v9 + 568)) != 0)
  {
    objc_msgSend(*(id *)(v9 + 504), "passTypeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "serialNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "passWithPassTypeIdentifier:serialNumber:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(v9 + 416), "library");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "passTypeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "serialNumber");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "passWithPassTypeIdentifier:serialNumber:", v12, v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v8[2](v8, v13);

}

void __42__PKPassHeaderView__passLibraryDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id WeakRetained;
  id v7;

  v4 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  if (!v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v5 + 560));
    objc_msgSend(WeakRetained, "passHeaderViewPassWasDeleted:", *(_QWORD *)(a1 + 32));
    goto LABEL_5;
  }
  if ((objc_msgSend(*(id *)(v5 + 504), "isEqualToPassIncludingMetadata:", v4) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 504), a2);
    objc_msgSend(*(id *)(a1 + 32), "_updateContent");
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 560));
    objc_msgSend(WeakRetained, "passHeaderViewDidChangePass:", *(_QWORD *)(a1 + 32));
LABEL_5:

  }
}

- (void)setPeerPaymentAccount:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_peerPaymentAccount, a3);
    -[PKPassHeaderView _updateTextContent](self, "_updateTextContent");
  }

}

- (void)setRendererState:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_rendererState, a3);
    -[PKPassHeaderView _updateContent](self, "_updateContent");
  }

}

- (void)setSuppressedContent:(unint64_t)a3
{
  if (self->_suppressedContent != a3)
  {
    self->_suppressedContent = a3;
    -[PKPassView setSuppressedContent:](self->_passView, "setSuppressedContent:", a3 | 0x7F7);
  }
}

- (void)setShowModificationDate:(BOOL)a3
{
  if (((!self->_showModificationDate ^ a3) & 1) == 0)
  {
    self->_showModificationDate = a3;
    -[PKPassHeaderView _updateTextContent](self, "_updateTextContent");
  }
}

- (void)setExpiredPass:(BOOL)a3
{
  if (((!self->_expiredPass ^ a3) & 1) == 0)
  {
    self->_expiredPass = a3;
    -[PKPassHeaderView _updateTextContent](self, "_updateTextContent");
  }
}

- (id)_primaryTextColor
{
  UIColor *primaryTextColor;

  primaryTextColor = self->_primaryTextColor;
  if (primaryTextColor)
    return primaryTextColor;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_secondaryTextColor
{
  UIColor *secondaryTextColor;

  secondaryTextColor = self->_secondaryTextColor;
  if (secondaryTextColor)
    return secondaryTextColor;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setPrimaryTextColor:(id)a3
{
  UIColor *v5;
  void *v6;
  UIColor *v7;

  v5 = (UIColor *)a3;
  if (self->_primaryTextColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_primaryTextColor, a3);
    -[PKPassHeaderView _primaryTextColor](self, "_primaryTextColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_title, "setTextColor:", v6);

    v5 = v7;
  }

}

- (void)setSecondaryTextColor:(id)a3
{
  UIColor *v5;
  void *v6;
  UIColor *v7;

  v5 = (UIColor *)a3;
  if (self->_secondaryTextColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_secondaryTextColor, a3);
    -[PKPassHeaderView _secondaryTextColor](self, "_secondaryTextColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_subtitle, "setTextColor:", v6);

    v5 = v7;
  }

}

- (void)setSmall:(BOOL)a3
{
  __int128 *v3;
  __int128 v4;

  if (((!self->_small ^ a3) & 1) == 0)
  {
    self->_small = a3;
    if (a3)
      v3 = &SmallContentInsets;
    else
      v3 = &StandardContentInsets;
    v4 = v3[1];
    *(_OWORD *)&self->_contentInsets.top = *v3;
    *(_OWORD *)&self->_contentInsets.bottom = v4;
    -[PKPassHeaderView _resetFonts](self, "_resetFonts");
  }
}

- (void)setPass:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToPassIncludingMetadata:", self->_pass) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_pass, a3);
    -[PKPassHeaderView _updateContent](self, "_updateContent");
  }

}

- (PKPass)pass
{
  return self->_pass;
}

- (PKPassView)passView
{
  return self->_passView;
}

- (BOOL)isSmall
{
  return self->_small;
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (PKPassFaceViewRendererState)rendererState
{
  return self->_rendererState;
}

- (unint64_t)suppressedContent
{
  return self->_suppressedContent;
}

- (BOOL)showModificationDate
{
  return self->_showModificationDate;
}

- (BOOL)expiredPass
{
  return self->_expiredPass;
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (PKPassHeaderViewDelegate)delegate
{
  return (PKPassHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPassLibraryDataProvider)passLibraryOverride
{
  return self->_passLibraryOverride;
}

- (void)setPassLibraryOverride:(id)a3
{
  objc_storeStrong((id *)&self->_passLibraryOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passLibraryOverride, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_rendererState, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_maskShadow, 0);
  objc_storeStrong((id *)&self->_passMaskView, 0);
  objc_storeStrong((id *)&self->_remoteDataAccessor, 0);
}

@end
