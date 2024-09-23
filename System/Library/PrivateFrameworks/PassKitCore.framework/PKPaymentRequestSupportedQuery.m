@implementation PKPaymentRequestSupportedQuery

+ (id)webQueryWithSupportedNetworkIDs:(id)a3 merchantCapabilities:(unint64_t)a4 merchantCountryCode:(id)a5 paymentMode:(int64_t)a6 paymentApplicationStates:(id)a7 isMultiTokensRequest:(BOOL)a8 webService:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v22;

  v16 = a9;
  v17 = a7;
  v18 = a5;
  v19 = a3;
  LOBYTE(v22) = a8;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIssuedOnTheWeb:supportedNetworkIDs:merchantCapabilities:merchantCountryCode:paymentMode:paymentApplicationStates:paymentRequestType:isMultiTokensRequest:webService:", 1, v19, a4, v18, a6, v17, 0, v22, v16);

  return v20;
}

+ (id)inAppQueryWithSupportedNetworkIDs:(id)a3 merchantCapabilities:(unint64_t)a4 merchantCountryCode:(id)a5 paymentMode:(int64_t)a6 paymentApplicationStates:(id)a7 paymentRequestType:(id)a8 isMultiTokensRequest:(BOOL)a9 webService:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v24;

  v17 = a10;
  v18 = a8;
  v19 = a7;
  v20 = a5;
  v21 = a3;
  LOBYTE(v24) = a9;
  v22 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIssuedOnTheWeb:supportedNetworkIDs:merchantCapabilities:merchantCountryCode:paymentMode:paymentApplicationStates:paymentRequestType:isMultiTokensRequest:webService:", 0, v21, a4, v20, a6, v19, v18, v24, v17);

  return v22;
}

- (PKPaymentRequestSupportedQuery)initWithIssuedOnTheWeb:(BOOL)a3 supportedNetworkIDs:(id)a4 merchantCapabilities:(unint64_t)a5 merchantCountryCode:(id)a6 paymentMode:(int64_t)a7 paymentApplicationStates:(id)a8 paymentRequestType:(id)a9 isMultiTokensRequest:(BOOL)a10 webService:(id)a11
{
  id v18;
  NSString *v19;
  id v20;
  NSNumber *v21;
  PKPaymentRequestSupportedQuery *v22;
  PKPaymentRequestSupportedQuery *v23;
  id v25;
  objc_super v26;

  v18 = a4;
  v19 = (NSString *)a6;
  v20 = a8;
  v21 = (NSNumber *)a9;
  v25 = a11;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E2C3EAD0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26.receiver = self;
  v26.super_class = (Class)PKPaymentRequestSupportedQuery;
  v22 = -[PKPaymentRequestSupportedQuery init](&v26, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->_issuedOnTheWeb = a3;
    objc_storeStrong((id *)&v22->_supportedNetworkIDs, a4);
    v23->_merchantCapabilities = a5;
    v23->_merchantCountryCode = v19;
    v23->_paymentMode = a7;
    objc_storeStrong((id *)&v23->_paymentApplicationStates, v20);
    v23->_paymentRequestType = v21;
    v23->_isMultiTokensRequest = a10;
    objc_storeStrong((id *)&v23->_webService, a11);
  }

  return v23;
}

- (BOOL)issuedOnTheWeb
{
  return self->_issuedOnTheWeb;
}

- (NSArray)supportedNetworkIDs
{
  return self->_supportedNetworkIDs;
}

- (unint64_t)merchantCapabilities
{
  return self->_merchantCapabilities;
}

- (NSString)merchantCountryCode
{
  return self->_merchantCountryCode;
}

- (int64_t)paymentMode
{
  return self->_paymentMode;
}

- (NSSet)paymentApplicationStates
{
  return self->_paymentApplicationStates;
}

- (NSNumber)paymentRequestType
{
  return self->_paymentRequestType;
}

- (BOOL)isMultiTokensRequest
{
  return self->_isMultiTokensRequest;
}

- (PKPaymentWebService)webService
{
  return self->_webService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_paymentApplicationStates, 0);
  objc_storeStrong((id *)&self->_supportedNetworkIDs, 0);
}

@end
