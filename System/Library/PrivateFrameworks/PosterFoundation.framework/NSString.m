@implementation NSString

void __55__NSString_PosterFoundation__pf_bootInstanceIdentifier__block_invoke()
{
  NSObject *v0;
  id v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  size_t v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5 = 37;
  if (sysctlbyname("kern.bootsessionuuid", &_block_invoke_uuid_str, &v5, 0, 0) < 0)
  {
    PFLogCommon();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      __55__NSString_PosterFoundation__pf_bootInstanceIdentifier__block_invoke_cold_1(v0);

  }
  v1 = objc_alloc(MEMORY[0x24BDD17C8]);
  v2 = objc_msgSend(v1, "initWithBytesNoCopy:length:encoding:freeWhenDone:", &_block_invoke_uuid_str, v5 - 1, 4, 0);
  v3 = (void *)pf_bootInstanceIdentifier_uuid;
  pf_bootInstanceIdentifier_uuid = v2;

  PFLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v7 = pf_bootInstanceIdentifier_uuid;
    _os_log_impl(&dword_24462A000, v4, OS_LOG_TYPE_INFO, "Got boot session uuid: %@", buf, 0xCu);
  }

}

void __55__NSString_PosterFoundation__pf_bootInstanceIdentifier__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24462A000, log, OS_LOG_TYPE_ERROR, "could not get kern.bootsessionuuid", v1, 2u);
}

@end
