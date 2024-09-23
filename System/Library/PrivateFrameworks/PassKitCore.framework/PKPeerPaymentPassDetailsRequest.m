@implementation PKPeerPaymentPassDetailsRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4 deviceIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  objc_class *v18;
  _QWORD v20[3];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v8)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v16;
    v23 = 2082;
    v24 = "url";
LABEL_11:
    _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_12;
  }
  if (!v9)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v16;
    v23 = 2082;
    v24 = "appleAccountInformation";
    goto LABEL_11;
  }
  if (!v10)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v16;
      v23 = 2082;
      v24 = "deviceIdentifier";
      goto LABEL_11;
    }
LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  v20[0] = CFSTR("devices");
  v20[1] = v10;
  v20[2] = CFSTR("pass");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v8, v12, 0, v9);
  v13 = objc_claimAutoreleasedReturnValue();

  -[NSObject setHTTPMethod:](v13, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(MEMORY[0x1E0C92C78], "setProperty:forKey:inRequest:", &unk_1E2C3F820, CFSTR("PKPeerPaymentEndPointKey"), v13);
  v14 = -[NSObject copy](v13, "copy");
LABEL_13:

  return v14;
}

@end
