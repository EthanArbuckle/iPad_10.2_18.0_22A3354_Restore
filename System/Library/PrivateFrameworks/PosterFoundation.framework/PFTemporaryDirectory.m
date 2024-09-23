@implementation PFTemporaryDirectory

void __PFTemporaryDirectory_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  NSTemporaryDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("PFTemporaryDirectory"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)PFTemporaryDirectory_pfProcessTempDirectory;
  PFTemporaryDirectory_pfProcessTempDirectory = v1;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PFTemporaryDirectory_pfProcessTempDirectory;
  PFFileProtectionNoneAttributes();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, v5, &v7);
  v6 = v7;

  if (v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __PFTemporaryDirectory_block_invoke_cold_1((uint64_t)v6);

}

void __PFTemporaryDirectory_block_invoke_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138543362;
  v2 = a1;
  _os_log_error_impl(&dword_24462A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ERROR CREATING POSTERBOARD TEMPORARY DIRECTORY: %{public}@", (uint8_t *)&v1, 0xCu);
}

@end
