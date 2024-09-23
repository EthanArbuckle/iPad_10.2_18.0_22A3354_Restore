@implementation NSBundle

void __25__NSBundle_VG__vg_bundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[NSBundle(VG) vg_bundle]::bundle;
  +[NSBundle(VG) vg_bundle]::bundle = v0;

}

void __35__NSBundle_VG__vg_bundleIdentifier__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDD1488], "vg_bundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)+[NSBundle(VG) vg_bundleIdentifier]::bundleIdentifier;
  +[NSBundle(VG) vg_bundleIdentifier]::bundleIdentifier = v1;

  if (!+[NSBundle(VG) vg_bundleIdentifier]::bundleIdentifier)
  {
    +[NSBundle(VG) vg_bundleIdentifier]::bundleIdentifier = (uint64_t)CFSTR("com.apple.visage");

  }
}

void __31__NSBundle_VG__vg_resourcePath__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  if (_s_vg_setResourcePath)
  {
    v0 = (id)_s_vg_setResourcePath;
    v1 = (void *)_s_vg_resourcePath;
    _s_vg_resourcePath = (uint64_t)v0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "vg_bundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resourcePath");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "copy");
    v4 = (void *)_s_vg_resourcePath;
    _s_vg_resourcePath = v3;

    v1 = v5;
  }

}

@end
