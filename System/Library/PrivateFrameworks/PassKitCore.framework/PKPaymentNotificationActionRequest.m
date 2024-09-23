@implementation PKPaymentNotificationActionRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *action;
  NSString *requestID;
  void *v18;
  void *v19;
  const __CFString *v21;
  id v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v21 = CFSTR("devices");
  v22 = v8;
  v23 = CFSTR("notificationAction");
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "arrayWithObjects:count:", &v21, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v11, v12, 0, v10, v21, v22, v23, v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  action = self->_action;
  if (action)
    objc_msgSend(v14, "setObject:forKey:", action, CFSTR("action"));
  requestID = self->_requestID;
  if (requestID)
    objc_msgSend(v15, "setObject:forKey:", requestID, CFSTR("requestId"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHTTPBody:", v18);

  objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
  v19 = (void *)objc_msgSend(v13, "copy");

  return v19;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

@end
