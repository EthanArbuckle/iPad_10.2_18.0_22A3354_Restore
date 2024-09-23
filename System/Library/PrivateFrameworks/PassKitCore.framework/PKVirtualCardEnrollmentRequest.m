@implementation PKVirtualCardEnrollmentRequest

- (PKVirtualCardEnrollmentRequest)initWithPaymentPass:(id)a3
{
  id v4;
  PKVirtualCardEnrollmentRequest *v5;
  PKVirtualCardEnrollmentRequest *v6;
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
  objc_super v22;
  _QWORD v23[2];
  _QWORD v24[2];
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKVirtualCardEnrollmentRequest;
  v5 = -[PKPaymentRequest init](&v22, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PKPaymentRequest setRequestType:](v5, "setRequestType:", 12);
    objc_msgSend(v4, "devicePrimaryInAppPaymentApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedVirtualCardString(CFSTR("VIRTUAL_CARD_SET_UP_SUMMARY_ITEM"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("0"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPaymentSummaryItem summaryItemWithLabel:amount:type:](PKPaymentSummaryItem, "summaryItemWithLabel:amount:type:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest setPaymentSummaryItems:](v6, "setPaymentSummaryItems:", v11);

    -[PKPaymentRequest setCurrencyCode:](v6, "setCurrencyCode:", CFSTR("USD"));
    -[PKPaymentRequest setCountryCode:](v6, "setCountryCode:", CFSTR("US"));
    PKPaymentNetworkNameForPaymentCredentialType(objc_msgSend(v7, "paymentNetworkIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest setSupportedNetworks:](v6, "setSupportedNetworks:", v13);

    +[PKPaymentWebService sharedService](PKPaymentWebService, "sharedService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKWebServiceVirtualCardFeature virtualCardFeatureWithWebService:](PKWebServiceVirtualCardFeature, "virtualCardFeatureWithWebService:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "merchantId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest setMerchantIdentifier:](v6, "setMerchantIdentifier:", v16);

    -[PKPaymentRequest setMerchantCapabilities:](v6, "setMerchantCapabilities:", 1);
    PKLocalizedVirtualCardString(CFSTR("VIRTUAL_CARD_SET_UP_ERROR"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest setLocalizedErrorMessage:](v6, "setLocalizedErrorMessage:", v17);

    -[PKPaymentRequest setConfirmationStyle:](v6, "setConfirmationStyle:", 1);
    objc_msgSend(v4, "serialNumber");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest setPassSerialNumber:](v6, "setPassSerialNumber:", v18);

    objc_msgSend(v4, "passTypeIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest setPassTypeIdentifier:](v6, "setPassTypeIdentifier:", v19);

    v23[0] = CFSTR("subject");
    v23[1] = CFSTR("pageTag");
    v24[0] = CFSTR("passManagement");
    v24[1] = CFSTR("virtualNumberAuthorization");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest setClientAnalyticsParameters:](v6, "setClientAnalyticsParameters:", v20);

    -[PKPaymentRequest setUseLocationBasedAuthorization:](v6, "setUseLocationBasedAuthorization:", 1);
    v6->_isPeerPaymentPass = objc_msgSend(v4, "isPeerPaymentPass");

  }
  return v6;
}

- (id)initRefreshRequestWithPaymentPass:(id)a3
{
  PKVirtualCardEnrollmentRequest *v3;
  PKVirtualCardEnrollmentRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = -[PKVirtualCardEnrollmentRequest initWithPaymentPass:](self, "initWithPaymentPass:", a3);
  v4 = v3;
  if (v3)
  {
    -[PKPaymentRequest setRequestType:](v3, "setRequestType:", 14);
    PKLocalizedVirtualCardString(CFSTR("VIRTUAL_CARD_REFRESH_SUMMARY_ITEM"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("0"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPaymentSummaryItem summaryItemWithLabel:amount:type:](PKPaymentSummaryItem, "summaryItemWithLabel:amount:type:", v5, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest setPaymentSummaryItems:](v4, "setPaymentSummaryItems:", v8);

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKVirtualCardEnrollmentRequest *v4;
  PKVirtualCardEnrollmentRequest *v5;
  _BOOL4 isPeerPaymentPass;
  BOOL v7;
  objc_super v9;

  v4 = (PKVirtualCardEnrollmentRequest *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
         && (v9.receiver = self,
             v9.super_class = (Class)PKVirtualCardEnrollmentRequest,
             -[PKPaymentRequest isEqual:](&v9, sel_isEqual_, v5)))
  {
    isPeerPaymentPass = self->_isPeerPaymentPass;
    v7 = isPeerPaymentPass == -[PKVirtualCardEnrollmentRequest isPeerPaymentPass](v5, "isPeerPaymentPass");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PKCombinedHash(17, v3);
  v5 = self->_isPeerPaymentPass - v4 + 32 * v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKVirtualCardEnrollmentRequest)initWithCoder:(id)a3
{
  id v4;
  PKVirtualCardEnrollmentRequest *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKVirtualCardEnrollmentRequest;
  v5 = -[PKPaymentRequest initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_isPeerPaymentPass = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPeerPaymentPass"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKVirtualCardEnrollmentRequest;
  v4 = a3;
  -[PKPaymentRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_isPeerPaymentPass, CFSTR("isPeerPaymentPass"), v5.receiver, v5.super_class);

}

- (BOOL)isPeerPaymentPass
{
  return self->_isPeerPaymentPass;
}

@end
