@implementation NSBundle(VG)

+ (id)vg_bundle
{
  if (+[NSBundle(VG) vg_bundle]::onceToken != -1)
    dispatch_once(&+[NSBundle(VG) vg_bundle]::onceToken, &__block_literal_global_5);
  return (id)+[NSBundle(VG) vg_bundle]::bundle;
}

+ (id)vg_bundleIdentifier
{
  if (+[NSBundle(VG) vg_bundleIdentifier]::onceToken != -1)
    dispatch_once(&+[NSBundle(VG) vg_bundleIdentifier]::onceToken, &__block_literal_global_2_0);
  return (id)+[NSBundle(VG) vg_bundleIdentifier]::bundleIdentifier;
}

+ (id)vg_resourcePath
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__NSBundle_VG__vg_resourcePath__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[NSBundle(VG) vg_resourcePath]::onceToken != -1)
    dispatch_once(&+[NSBundle(VG) vg_resourcePath]::onceToken, block);
  return (id)_s_vg_resourcePath;
}

+ (BOOL)vg_canSetResourcePath
{
  return _s_vg_resourcePath == 0;
}

+ (void)setVg_resourcePath:()VG
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v9 = v3;
  if (_s_vg_resourcePath)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v10 = CFSTR("value");
    v11[0] = _s_vg_resourcePath;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", CFSTR("Call Order Violation on vg_resourcePath."), CFSTR("Attempting to set vg_resourcePath after get method on vg_resourcePath was called."), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(objc_retainAutorelease(v8));
  }
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)_s_vg_setResourcePath;
  _s_vg_setResourcePath = v4;

}

+ (id)vg_packageBundle:()VG
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "vg_bundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForResource:ofType:", v3, CFSTR("bundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "vg_bundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundlePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByDeletingLastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "stringByAppendingPathExtension:", CFSTR("bundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingPathComponent:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v13);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

@end
