@implementation NSBundle(PDUExtras)

- (id)pdu_aboutPrivacyBundleID
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  objc_msgSend(a1, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("NSRegulatoryPrivacyDisclosure"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NSRegulatoryPrivacyDisclosureOBKPrivacyBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v3 = 0;
  }
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "isEqualToString:", v3) & 1) == 0)
    {
      v6 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureUI();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[NSBundle(PDUExtras) pdu_aboutPrivacyBundleID].cold.1((uint64_t)v3, v6);
    }
  }

  return v5;
}

- (void)pdu_aboutPrivacyBundleID
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_244A07000, a2, OS_LOG_TYPE_ERROR, "OnBoardingKit bundle '%@' should be lower case only, please file a radar.", (uint8_t *)&v2, 0xCu);
}

@end
