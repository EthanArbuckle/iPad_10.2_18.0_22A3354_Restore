@implementation PKPaymentAuthorizationContext

- (PKPaymentSheetExperiment)paymentSheetExperiment
{
  PKPaymentSheetExperiment *paymentSheetExperiment;
  PKPaymentSheetExperiment *v4;
  PKPaymentSheetExperiment *v5;

  paymentSheetExperiment = self->_paymentSheetExperiment;
  if (!paymentSheetExperiment)
  {
    v4 = (PKPaymentSheetExperiment *)objc_alloc_init(MEMORY[0x1E0D67348]);
    v5 = self->_paymentSheetExperiment;
    self->_paymentSheetExperiment = v4;

    paymentSheetExperiment = self->_paymentSheetExperiment;
  }
  return paymentSheetExperiment;
}

- (PKPaymentAuthorizationContext)initWithUserInfo:(id)a3
{
  id v4;
  PKPaymentAuthorizationContext *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  PKPaymentRequest *request;
  uint64_t v11;
  NSString *hostIdentifier;
  uint64_t v13;
  NSString *hostBundleIdentifier;
  uint64_t v15;
  NSString *hostLocalizedAppName;
  uint64_t v17;
  NSString *hostTeamID;
  void *v19;
  uint64_t v20;
  NSString *hostApplicationIdentifier;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentAuthorizationContext;
  v5 = -[PKPaymentAuthorizationContext init](&v23, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3710];
    v7 = objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("paymentRequest"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unarchivedObjectOfClass:fromData:error:", v7, v8, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    request = v5->_request;
    v5->_request = (PKPaymentRequest *)v9;

    v5->_awaitingRemoteNetworkPaymentRequest = objc_msgSend(v4, "PKBoolForKey:", CFSTR("awaitingRemoteNetworkPaymentRequest"));
    objc_msgSend(v4, "PKStringForKey:", CFSTR("hostIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    hostIdentifier = v5->_hostIdentifier;
    v5->_hostIdentifier = (NSString *)v11;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("hostBundleIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    hostBundleIdentifier = v5->_hostBundleIdentifier;
    v5->_hostBundleIdentifier = (NSString *)v13;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("hostLocalizedAppName"));
    v15 = objc_claimAutoreleasedReturnValue();
    hostLocalizedAppName = v5->_hostLocalizedAppName;
    v5->_hostLocalizedAppName = (NSString *)v15;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("hostTeamID"));
    v17 = objc_claimAutoreleasedReturnValue();
    hostTeamID = v5->_hostTeamID;
    v5->_hostTeamID = (NSString *)v17;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("hostApplicationIdentifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationContext sanitizeString:](v5, "sanitizeString:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    hostApplicationIdentifier = v5->_hostApplicationIdentifier;
    v5->_hostApplicationIdentifier = (NSString *)v20;

  }
  return v5;
}

- (id)sanitizeString:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)fulfillPromisedRemoteNetworkPaymentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
  self->_awaitingRemoteNetworkPaymentRequest = 0;
}

- (PKPaymentRequest)request
{
  return self->_request;
}

- (BOOL)awaitingRemoteNetworkPaymentRequest
{
  return self->_awaitingRemoteNetworkPaymentRequest;
}

- (NSString)hostIdentifier
{
  return self->_hostIdentifier;
}

- (NSString)hostBundleIdentifier
{
  return self->_hostBundleIdentifier;
}

- (NSString)hostLocalizedAppName
{
  return self->_hostLocalizedAppName;
}

- (NSString)hostTeamID
{
  return self->_hostTeamID;
}

- (NSString)hostApplicationIdentifier
{
  return self->_hostApplicationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_hostTeamID, 0);
  objc_storeStrong((id *)&self->_hostLocalizedAppName, 0);
  objc_storeStrong((id *)&self->_hostBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_paymentSheetExperiment, 0);
}

@end
