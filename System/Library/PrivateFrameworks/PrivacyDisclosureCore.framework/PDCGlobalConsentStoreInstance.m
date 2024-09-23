@implementation PDCGlobalConsentStoreInstance

void __PDCGlobalConsentStoreInstance_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a2, "consentRecordURLForBundleIdentifier:");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "stringWithUTF8String:", objc_msgSend(v4, "fileSystemRepresentation"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "backupFileAtPath:", v5);
}

@end
