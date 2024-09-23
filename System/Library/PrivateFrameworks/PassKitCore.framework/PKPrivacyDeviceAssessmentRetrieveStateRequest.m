@implementation PKPrivacyDeviceAssessmentRetrieveStateRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  void *v5;
  void *v6;

  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", a3, &unk_1E2C3E350, 0, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHTTPMethod:", CFSTR("GET"));
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

@end
