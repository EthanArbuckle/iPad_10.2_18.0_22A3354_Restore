@implementation PKPaymentInformationEventExtension

- (void)beginRequestWithExtensionContext:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKPaymentInformationEventExtension successfully initialized", v4, 2u);
  }

}

@end
