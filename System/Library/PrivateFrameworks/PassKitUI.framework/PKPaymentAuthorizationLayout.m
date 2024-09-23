@implementation PKPaymentAuthorizationLayout

- (PKPaymentAuthorizationLayout)initWithStyle:(int64_t)a3 paymentRequest:(id)a4
{
  id v6;
  PKPaymentAuthorizationLayout *v7;
  PKPaymentAuthorizationLayout *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  NSString *localizedNavigationTitle;
  unint64_t requestType;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentAuthorizationLayout;
  v7 = -[PKPaymentAuthorizationLayout init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_style = a3;
    v7->_contentHorizontalMargin = 16.0;
    if (PKUserInterfaceIdiomSupportsLargeLayouts())
      v9 = 0x405E000000000000;
    else
      v9 = PKUIGetMinScreenWidthType() ? 0x405BC00000000000 : 0x4058000000000000;
    *(_QWORD *)&v8->_valueLeftMargin = v9;
    v10 = 62.0;
    if (a3 == 1)
      v10 = 43.0;
    v8->_glyphDimension = v10;
    v8->_requestType = objc_msgSend(v6, "requestType");
    v8->_requestor = objc_msgSend(v6, "requestor");
    objc_msgSend(v6, "localizedNavigationTitle");
    v11 = objc_claimAutoreleasedReturnValue();
    localizedNavigationTitle = v8->_localizedNavigationTitle;
    v8->_localizedNavigationTitle = (NSString *)v11;

    v8->_isAMPPayment = objc_msgSend(v6, "_isAMPPayment");
    v8->_isInstallment = objc_msgSend(v6, "requestType") == 5;
    if (v8->_requestType || v8->_isAMPPayment)
    {
      v8->_isPaymentSummaryPinned = objc_msgSend(v6, "isPaymentSummaryPinned");
      requestType = v8->_requestType;
      if (requestType <= 0xD)
      {
        if (((1 << requestType) & 0x2094) != 0)
          goto LABEL_13;
        if (requestType == 6)
        {
LABEL_16:
          v8->_shouldSuppressTotal = 1;
          goto LABEL_17;
        }
      }
      if (!v8->_isAMPPayment)
        goto LABEL_17;
LABEL_13:
      if (!objc_msgSend(v6, "suppressTotal"))
        goto LABEL_17;
      goto LABEL_16;
    }
  }
LABEL_17:

  return v8;
}

- (int64_t)style
{
  return self->_style;
}

- (double)contentHorizontalMargin
{
  return self->_contentHorizontalMargin;
}

- (double)valueLeftMargin
{
  return self->_valueLeftMargin;
}

- (double)glyphDimension
{
  return self->_glyphDimension;
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (unint64_t)requestor
{
  return self->_requestor;
}

- (BOOL)isAMPPayment
{
  return self->_isAMPPayment;
}

- (BOOL)isInstallment
{
  return self->_isInstallment;
}

- (BOOL)isPaymentSummaryPinned
{
  return self->_isPaymentSummaryPinned;
}

- (NSString)localizedNavigationTitle
{
  return self->_localizedNavigationTitle;
}

- (BOOL)shouldSuppressTotal
{
  return self->_shouldSuppressTotal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedNavigationTitle, 0);
}

@end
