@implementation PKPeerPaymentQuoteCertificatesRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t destination;
  const __CFString *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  const __CFString *v19;
  const __CFString *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v13;
    v23 = 2082;
    v24 = "url";
LABEL_12:
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_13;
  }
  if (!v7)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v13;
    v23 = 2082;
    v24 = "appleAccountInformation";
    goto LABEL_12;
  }
  destination = self->_destination;
  if (!destination)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v13;
      v23 = 2082;
      v24 = "_destination";
      goto LABEL_12;
    }
LABEL_13:
    v16 = 0;
    goto LABEL_16;
  }
  v19 = CFSTR("destination");
  if (destination > 5)
    v10 = CFSTR("unknown");
  else
    v10 = off_1E2ADC158[destination - 1];
  v20 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v11 = objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v6, &unk_1E2C3E698, v11, v8, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHTTPMethod:", CFSTR("GET"));
  v16 = (void *)objc_msgSend(v17, "copy");

LABEL_16:
  return v16;
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(unint64_t)a3
{
  self->_destination = a3;
}

@end
