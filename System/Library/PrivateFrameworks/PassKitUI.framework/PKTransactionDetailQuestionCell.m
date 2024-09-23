@implementation PKTransactionDetailQuestionCell

- (PKTransactionDetailQuestionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKTransactionDetailQuestionCell *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  UIImageView *imageView;
  UILabel *v11;
  UILabel *title;
  UILabel *v13;
  NSString *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  UILabel *message;
  UILabel *v20;
  void *v21;
  UILabel *v22;
  void *v23;
  uint64_t v24;
  PKLegacyButtonInterface *leadingButton;
  uint64_t v26;
  PKLegacyButtonInterface *trailingButton;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)PKTransactionDetailQuestionCell;
  v4 = -[PKTransactionDetailQuestionCell initWithStyle:reuseIdentifier:](&v30, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v4->_smallDevice = PKUIGetMinScreenWidthType() == 0;
    -[PKTransactionDetailQuestionCell contentView](v4, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKPassKitUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLForResource:withExtension:", CFSTR("MessageAlert"), CFSTR("pdf"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = PKUIScreenScale();
    PKUIImageFromPDF(v29, 45.0, 45.0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v8);
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v9;

    objc_msgSend(v5, "addSubview:", v4->_imageView);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    title = v4->_title;
    v4->_title = v11;

    v13 = v4->_title;
    v14 = (NSString *)*MEMORY[0x1E0DC48D0];
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC48D0], 2, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v13, "setFont:", v15);

    -[UILabel setNumberOfLines:](v4->_title, "setNumberOfLines:", 2);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_title, "setAdjustsFontSizeToFitWidth:", 1);
    v16 = v4->_title;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v16, "setTextColor:", v17);

    -[UILabel setAccessibilityIdentifier:](v4->_title, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    objc_msgSend(v5, "addSubview:", v4->_title);
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    message = v4->_message;
    v4->_message = v18;

    v20 = v4->_message;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v20, "setFont:", v21);

    -[UILabel setNumberOfLines:](v4->_message, "setNumberOfLines:", 0);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_message, "setAdjustsFontSizeToFitWidth:", 1);
    v22 = v4->_message;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v22, "setTextColor:", v23);

    -[UILabel setAccessibilityIdentifier:](v4->_message, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
    -[UILabel setMinimumScaleFactor:](v4->_message, "setMinimumScaleFactor:", 0.8);
    objc_msgSend(v5, "addSubview:", v4->_message);
    -[PKTransactionDetailQuestionCell _createButton](v4, "_createButton");
    v24 = objc_claimAutoreleasedReturnValue();
    leadingButton = v4->_leadingButton;
    v4->_leadingButton = (PKLegacyButtonInterface *)v24;

    -[PKLegacyButtonInterface addTarget:action:forControlEvents:](v4->_leadingButton, "addTarget:action:forControlEvents:", v4, sel__leadingButtonTapped_, 64);
    -[PKLegacyButtonInterface setAccessibilityIdentifier:](v4->_leadingButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67CD8]);
    objc_msgSend(v5, "addSubview:", v4->_leadingButton);
    -[PKTransactionDetailQuestionCell _createButton](v4, "_createButton");
    v26 = objc_claimAutoreleasedReturnValue();
    trailingButton = v4->_trailingButton;
    v4->_trailingButton = (PKLegacyButtonInterface *)v26;

    -[PKLegacyButtonInterface addTarget:action:forControlEvents:](v4->_trailingButton, "addTarget:action:forControlEvents:", v4, sel__trailingButtonTapped_, 64);
    -[PKLegacyButtonInterface setAccessibilityIdentifier:](v4->_trailingButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68128]);
    objc_msgSend(v5, "addSubview:", v4->_trailingButton);

  }
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKTransactionDetailQuestionCell;
  -[PKTransactionDetailQuestionCell layoutSubviews](&v3, sel_layoutSubviews);
  -[PKTransactionDetailQuestionCell bounds](self, "bounds");
  -[PKTransactionDetailQuestionCell _layoutWithBounds:](self, "_layoutWithBounds:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UILabel text](self->_title, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self->_isTemplateLayout = 1;
    -[PKTransactionDetailQuestionCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, height);
    self->_isTemplateLayout = 0;
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D820];
    v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  CGFloat height;
  double width;
  CGFloat y;
  CGFloat x;
  void *v8;
  NSString *v9;
  _BOOL4 IsAccessibilityCategory;
  int v11;
  CGRectEdge v12;
  CGRectEdge v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect remainder;
  CGRect slice;
  CGSize result;
  CGRect v38;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  memset(&slice, 0, sizeof(slice));
  remainder = a3;
  -[PKTransactionDetailQuestionCell traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9);

  v11 = -[PKTransactionDetailQuestionCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (v11)
    v12 = CGRectMaxXEdge;
  else
    v12 = CGRectMinXEdge;
  if (v11)
    v13 = CGRectMinXEdge;
  else
    v13 = CGRectMaxXEdge;
  v14 = PKUIPixelLength() * 3.0;
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  CGRectDivide(v38, &slice, &remainder, v14, CGRectMinYEdge);
  v15 = PKUIPixelLength() * 3.0 + 0.0;
  CGRectDivide(remainder, &slice, &remainder, 16.0, CGRectMinXEdge);
  CGRectDivide(remainder, &slice, &remainder, 16.0, CGRectMaxXEdge);
  CGRectDivide(remainder, &slice, &remainder, 16.0, CGRectMinYEdge);
  v16 = v15 + 16.0;
  if (self->_smallDevice)
    v17 = 30.0;
  else
    v17 = 45.0;
  memset(&v34, 0, sizeof(v34));
  memset(&v33, 0, sizeof(v33));
  memset(&v32, 0, sizeof(v32));
  v18 = remainder.origin.x;
  v19 = remainder.origin.y;
  v20 = remainder.size.width;
  v21 = remainder.size.height;
  if (IsAccessibilityCategory)
  {
    CGRectDivide(*(CGRect *)&v18, &v34, &remainder, v17, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
    CGRectDivide(v34, &v34, &v33, v17, v12);
    v16 = v16 + v17 + 10.0;
  }
  else
  {
    CGRectDivide(*(CGRect *)&v18, &v32, &remainder, v17, v12);
    CGRectDivide(v32, &v34, &v33, 10.0, CGRectMinYEdge);
    CGRectDivide(v33, &v34, &v33, v17, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, 12.0, v12);
  }
  if (!self->_isTemplateLayout)
    -[UIImageView setFrame:](self->_imageView, "setFrame:", v34.origin.x, v34.origin.y, v34.size.width, v34.size.height);
  -[UILabel sizeThatFits:](self->_title, "sizeThatFits:", remainder.size.width, remainder.size.height);
  v23 = v22;
  CGRectDivide(remainder, &slice, &remainder, v22, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
    -[UILabel setFrame:](self->_title, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  CGRectDivide(remainder, &slice, &remainder, 6.0, CGRectMinYEdge);
  -[UILabel sizeThatFits:](self->_message, "sizeThatFits:", remainder.size.width, remainder.size.height);
  v25 = v24;
  CGRectDivide(remainder, &slice, &remainder, v24, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
    -[UILabel setFrame:](self->_message, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  CGRectDivide(remainder, &slice, &remainder, 16.0, CGRectMinYEdge);
  remainder.origin.x = 16.0;
  remainder.size.width = width + -32.0;
  -[PKLegacyButtonInterface sizeThatFits:](self->_leadingButton, "sizeThatFits:");
  v27 = v26;
  if (!self->_isTemplateLayout)
  {
    memset(&v31, 0, sizeof(v31));
    CGRectDivide(remainder, &v31, &remainder, v26, CGRectMinYEdge);
    PKFloatRoundToPixel();
    CGRectDivide(v31, &slice, &v31, v28, v12);
    -[PKLegacyButtonInterface setFrame:](self->_leadingButton, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    CGRectDivide(v31, &slice, &v31, v31.size.width + -10.0, v13);
    -[PKLegacyButtonInterface setFrame:](self->_trailingButton, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  v29 = v16 + v23 + 6.0 + v25 + 16.0 + v27 + 16.0;
  v30 = width;
  result.height = v29;
  result.width = v30;
  return result;
}

- (void)setTransaction:(id)a3 accountUserContact:(id)a4 submittingAnswer:(id)a5
{
  id v9;
  id v10;
  CNContact **p_accountUserContact;
  NSString **p_submittingAnswer;
  PKPaymentTransaction *transaction;
  uint64_t v14;
  void *v15;
  UILabel *title;
  void *v17;
  UILabel *message;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  PKLegacyButtonInterface *leadingButton;
  void *v24;
  PKLegacyButtonInterface *trailingButton;
  void *v26;
  NSString *v27;
  NSString *v28;
  NSString *v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  id v33;

  v33 = a3;
  v9 = a4;
  v10 = a5;
  objc_storeStrong((id *)&self->_transaction, a3);
  p_accountUserContact = &self->_accountUserContact;
  objc_storeStrong((id *)&self->_accountUserContact, a4);
  p_submittingAnswer = &self->_submittingAnswer;
  objc_storeStrong((id *)&self->_submittingAnswer, a5);
  transaction = self->_transaction;
  if (transaction)
  {
    v14 = -[PKPaymentTransaction effectiveTransactionSource](transaction, "effectiveTransactionSource");
    if (*p_accountUserContact)
    {
      -[CNContact givenName](*p_accountUserContact, "givenName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      title = self->_title;
      PKLocalizedMadisonString(CFSTR("PAYMENT_TRANSACTION_QUESTION_ACCOUNT_USER_TITLE"), CFSTR("%@"), v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](title, "setText:", v17);

      message = self->_message;
      if (v14 == 6)
        PKLocalizedMadisonString(CFSTR("PAYMENT_TRANSACTION_QUESTION_ACCOUNT_USER_MESSAGE_VPAN"), CFSTR("%@%@"), v15, v15);
      else
        PKLocalizedMadisonString(CFSTR("PAYMENT_TRANSACTION_QUESTION_ACCOUNT_USER_MESSAGE"), CFSTR("%@"), v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](message, "setText:", v22);

    }
    else
    {
      v19 = self->_title;
      PKLocalizedFeatureString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v19, "setText:", v20);

      v21 = self->_message;
      PKLocalizedFeatureString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v21, "setText:", v15);
    }

    leadingButton = self->_leadingButton;
    PKLocalizedFeatureString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKLegacyButtonInterface setTitle:forState:](leadingButton, "setTitle:forState:", v24, 0);

    trailingButton = self->_trailingButton;
    PKLocalizedFeatureString();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKLegacyButtonInterface setTitle:forState:](trailingButton, "setTitle:forState:", v26, 0);

  }
  else
  {
    -[UILabel setText:](self->_title, "setText:", 0);
    -[UILabel setText:](self->_message, "setText:", 0);
    -[PKLegacyButtonInterface setTitle:forState:](self->_leadingButton, "setTitle:forState:", 0, 0);
    -[PKLegacyButtonInterface setTitle:forState:](self->_trailingButton, "setTitle:forState:", 0, 0);
  }
  if (*p_submittingAnswer)
  {
    -[PKTransactionDetailQuestionCell _enableButtons:](self, "_enableButtons:", 0);
    v27 = (NSString *)*MEMORY[0x1E0D6B058];
    v28 = *p_submittingAnswer;
    if (v27 == v28)
    {

    }
    else
    {
      v29 = v28;
      if (!v27 || !v28)
      {

LABEL_20:
        v31 = 0;
        v32 = 1;
        goto LABEL_21;
      }
      v30 = -[NSString isEqualToString:](v27, "isEqualToString:", v28);

      if (!v30)
        goto LABEL_20;
    }
    v32 = 0;
    v31 = 1;
  }
  else
  {
    -[PKTransactionDetailQuestionCell _enableButtons:](self, "_enableButtons:", 1);
    v31 = 0;
    v32 = 0;
  }
LABEL_21:
  -[PKLegacyButtonInterface setShowSpinner:](self->_leadingButton, "setShowSpinner:", v31);
  -[PKLegacyButtonInterface setShowSpinner:](self->_trailingButton, "setShowSpinner:", v32);
  -[PKTransactionDetailQuestionCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)_trailingButtonTapped:(id)a3
{
  id WeakRetained;
  id v5;

  -[PKPaymentTransaction unansweredQuestions](self->_transaction, "unansweredQuestions", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[PKTransactionDetailQuestionCell _enableButtons:](self, "_enableButtons:", 0);
    -[PKLegacyButtonInterface setShowSpinner:](self->_trailingButton, "setShowSpinner:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_questionDelegate);
    objc_msgSend(WeakRetained, "submitAnswer:", *MEMORY[0x1E0D6B050]);

  }
}

- (void)_leadingButtonTapped:(id)a3
{
  id WeakRetained;
  id v5;

  -[PKPaymentTransaction unansweredQuestions](self->_transaction, "unansweredQuestions", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[PKTransactionDetailQuestionCell _enableButtons:](self, "_enableButtons:", 0);
    -[PKLegacyButtonInterface setShowSpinner:](self->_leadingButton, "setShowSpinner:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_questionDelegate);
    objc_msgSend(WeakRetained, "submitAnswer:", *MEMORY[0x1E0D6B058]);

  }
}

- (void)_enableButtons:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[PKLegacyButtonInterface setEnabled:](self->_leadingButton, "setEnabled:");
  -[PKLegacyButtonInterface setEnabled:](self->_trailingButton, "setEnabled:", v3);
}

- (id)_createButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  PKCreateLargeSolidButton();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContentEdgeInsets:", 12.0, 16.0, 12.0, 16.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateTitleColorWithColor:", v4);

  objc_msgSend(v2, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  objc_msgSend(v2, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAdjustsFontSizeToFitWidth:", 1);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateActivityIndicatorColorWithColor:", v8);

  return v2;
}

- (PKTransactionDetailQuestionCellDelegate)questionDelegate
{
  return (PKTransactionDetailQuestionCellDelegate *)objc_loadWeakRetained((id *)&self->_questionDelegate);
}

- (void)setQuestionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_questionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_questionDelegate);
  objc_storeStrong((id *)&self->_submittingAnswer, 0);
  objc_storeStrong((id *)&self->_accountUserContact, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_trailingButton, 0);
  objc_storeStrong((id *)&self->_leadingButton, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
