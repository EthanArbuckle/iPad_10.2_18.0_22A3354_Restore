@implementation PKGetConstantStringNFSecureElementManagerSessionRSAACertificateKey

void __PKGetConstantStringNFSecureElementManagerSessionRSAACertificateKey_block_invoke()
{
  id *v0;
  void *v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (PKLoadNearField_loadPredicate != -1)
    dispatch_once(&PKLoadNearField_loadPredicate, &__block_literal_global_210);
  if (PKLoadNearField_frameworkLibrary)
  {
    v0 = (id *)dlsym((void *)PKLoadNearField_frameworkLibrary, "NFSecureElementManagerSessionRSAACertificateKey");
    objc_storeStrong((id *)&PKGetConstantStringNFSecureElementManagerSessionRSAACertificateKey_constant, *v0);
  }
  else
  {
    v1 = (void *)PKGetConstantStringNFSecureElementManagerSessionRSAACertificateKey_constant;
    PKGetConstantStringNFSecureElementManagerSessionRSAACertificateKey_constant = (uint64_t)CFSTR("RSA");

    PKLogFacilityTypeGetObject(6uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = PKGetConstantStringNFSecureElementManagerSessionRSAACertificateKey_constant;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "NearField not loaded.\n\tSynthesizing default RSA Certificate Key: %@", (uint8_t *)&v3, 0xCu);
    }

  }
}

@end
