@implementation WFCurrentBundle

void __WFCurrentBundle_block_invoke()
{
  BOOL v0;
  NSObject *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  Dl_info v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  memset(&v5, 0, sizeof(v5));
  if (dladdr(WFCurrentBundle, &v5))
    v0 = v5.dli_fname == 0;
  else
    v0 = 1;
  if (v0)
  {
    getWFGeneralLogObject();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "WFCurrentBundle_block_invoke";
      _os_log_impl(&dword_20CE0F000, v1, OS_LOG_TYPE_ERROR, "%s WFLocalizedString failed to locate current bundle", buf, 0xCu);
    }
  }
  else
  {
    v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v5.dli_fname, 0, 0);
    v2 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)WFCurrentBundle_bundle;
    WFCurrentBundle_bundle = v3;

  }
}

@end
