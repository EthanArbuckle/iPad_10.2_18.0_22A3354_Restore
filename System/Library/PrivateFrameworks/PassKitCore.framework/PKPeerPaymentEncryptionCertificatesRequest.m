@implementation PKPeerPaymentEncryptionCertificatesRequest

- (PKPeerPaymentEncryptionCertificatesRequest)initWithEncryptionCertificateDestination:(unint64_t)a3
{
  PKPeerPaymentEncryptionCertificatesRequest *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentEncryptionCertificatesRequest;
  result = -[PKOverlayableWebServiceRequest init](&v5, sel_init);
  if (result)
    result->_destination = a3;
  return result;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t destination;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  objc_class *v18;
  const __CFString *v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v16;
    v24 = 2082;
    v25 = "url";
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
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v16;
    v24 = 2082;
    v25 = "appleAccountInformation";
    goto LABEL_12;
  }
  destination = self->_destination;
  if (!destination)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v16;
    v24 = 2082;
    v25 = "_destination";
    goto LABEL_12;
  }
  PKPeerPaymentEncryptionCertificateDestinationToString(destination);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
LABEL_13:
    v14 = 0;
    goto LABEL_14;
  }
  v20 = CFSTR("destination");
  v21 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v6, &unk_1E2C3E7A0, v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v13, "setCachePolicy:", 1);
  v14 = (void *)objc_msgSend(v13, "copy");

LABEL_14:
  return v14;
}

@end
