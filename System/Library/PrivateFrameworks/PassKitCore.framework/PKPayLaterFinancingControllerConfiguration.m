@implementation PKPayLaterFinancingControllerConfiguration

- (PKPayLaterFinancingControllerConfiguration)initWithCurrencyCode:(id)a3 channel:(unint64_t)a4
{
  id v7;
  PKPayLaterFinancingControllerConfiguration *v8;
  PKPayLaterFinancingControllerConfiguration *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterFinancingControllerConfiguration;
  v8 = -[PKPayLaterFinancingControllerConfiguration init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_currencyCode, a3);
    v9->_channel = a4;
  }

  return v9;
}

- (PKPayLaterFinancingControllerConfiguration)initWithTransactionAmount:(id)a3 currencyCode:(id)a4 merchantCountryCode:(id)a5 merchantIdentifier:(id)a6 originURL:(id)a7 webMerchantIdentifier:(id)a8 webMerchantName:(id)a9 merchantName:(id)a10 adamIdentifier:(id)a11 isMerchantTokenRequest:(BOOL)a12 isMultiTokenRequest:(BOOL)a13 channel:(unint64_t)a14 channelType:(unint64_t)a15 supportedNetworks:(id)a16 suppressionMode:(int64_t)a17
{
  id v22;
  id v23;
  id v24;
  id v25;
  PKPayLaterFinancingControllerConfiguration *v26;
  PKPayLaterFinancingControllerConfiguration *v27;
  id v29;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;

  v36 = a3;
  v35 = a5;
  v34 = a6;
  v29 = a7;
  v33 = a7;
  v22 = a8;
  v32 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a16;
  v26 = -[PKPayLaterFinancingControllerConfiguration initWithCurrencyCode:channel:](self, "initWithCurrencyCode:channel:", a4, a14);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_transactionAmount, a3);
    objc_storeStrong((id *)&v27->_merchantIdentifier, a6);
    objc_storeStrong((id *)&v27->_originURL, v29);
    objc_storeStrong((id *)&v27->_webMerchantName, a9);
    objc_storeStrong((id *)&v27->_merchantName, a10);
    objc_storeStrong((id *)&v27->_merchantCountryCode, a5);
    objc_storeStrong((id *)&v27->_webMerchantIdentifier, a8);
    objc_storeStrong((id *)&v27->_adamIdentifier, a11);
    v27->_isMerchantTokenRequest = a12;
    v27->_isMultiTokenRequest = a13;
    v27->_channelType = a15;
    objc_storeStrong((id *)&v27->_supportedNetworks, a16);
    v27->_suppressionMode = a17;
  }

  return v27;
}

- (void)updateTransactionAmount:(id)a3
{
  objc_storeStrong((id *)&self->_transactionAmount, a3);
}

- (void)updateMerchantIdentifier:(id)a3 originURL:(id)a4 webMerchantIdentifier:(id)a5 webMerchantName:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSString *v13;
  NSString *merchantIdentifier;
  NSString *v15;
  NSString *originURL;
  NSString *v17;
  NSString *webMerchantIdentifier;
  NSString *v19;
  NSString *webMerchantName;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (NSString *)objc_msgSend(a3, "copy");
  merchantIdentifier = self->_merchantIdentifier;
  self->_merchantIdentifier = v13;

  v15 = (NSString *)objc_msgSend(v12, "copy");
  originURL = self->_originURL;
  self->_originURL = v15;

  v17 = (NSString *)objc_msgSend(v11, "copy");
  webMerchantIdentifier = self->_webMerchantIdentifier;
  self->_webMerchantIdentifier = v17;

  v19 = (NSString *)objc_msgSend(v10, "copy");
  webMerchantName = self->_webMerchantName;
  self->_webMerchantName = v19;

}

- (unint64_t)channel
{
  return self->_channel;
}

- (unint64_t)channelType
{
  return self->_channelType;
}

- (NSDecimalNumber)transactionAmount
{
  return self->_transactionAmount;
}

- (void)setTransactionAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)merchantCountryCode
{
  return self->_merchantCountryCode;
}

- (void)setMerchantCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)originURL
{
  return self->_originURL;
}

- (void)setOriginURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)webMerchantIdentifier
{
  return self->_webMerchantIdentifier;
}

- (void)setWebMerchantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)webMerchantName
{
  return self->_webMerchantName;
}

- (void)setWebMerchantName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)merchantName
{
  return self->_merchantName;
}

- (void)setMerchantName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)adamIdentifier
{
  return self->_adamIdentifier;
}

- (void)setAdamIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)isMerchantTokenRequest
{
  return self->_isMerchantTokenRequest;
}

- (void)setIsMerchantTokenRequest:(BOOL)a3
{
  self->_isMerchantTokenRequest = a3;
}

- (BOOL)isMultiTokenRequest
{
  return self->_isMultiTokenRequest;
}

- (void)setIsMultiTokenRequest:(BOOL)a3
{
  self->_isMultiTokenRequest = a3;
}

- (NSArray)supportedNetworks
{
  return self->_supportedNetworks;
}

- (void)setSupportedNetworks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (int64_t)suppressionMode
{
  return self->_suppressionMode;
}

- (void)setSuppressionMode:(int64_t)a3
{
  self->_suppressionMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedNetworks, 0);
  objc_storeStrong((id *)&self->_adamIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantName, 0);
  objc_storeStrong((id *)&self->_webMerchantName, 0);
  objc_storeStrong((id *)&self->_webMerchantIdentifier, 0);
  objc_storeStrong((id *)&self->_originURL, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantCountryCode, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_transactionAmount, 0);
}

@end
