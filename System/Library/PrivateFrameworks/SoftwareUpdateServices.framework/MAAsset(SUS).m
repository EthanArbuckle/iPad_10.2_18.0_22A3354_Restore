@implementation MAAsset(SUS)

- (BOOL)isDownloadingOrInstalled
{
  objc_msgSend(a1, "refreshState");
  return (unint64_t)(objc_msgSend(a1, "state") - 2) < 3;
}

- (BOOL)isDownloading
{
  objc_msgSend(a1, "refreshState");
  return objc_msgSend(a1, "state") == 4;
}

- (BOOL)isInstalled
{
  objc_msgSend(a1, "refreshState");
  return (objc_msgSend(a1, "state") & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (id)isEmergencyUpdate
{
  id result;
  id v3;
  id v4;
  void *v5;
  void *v6;

  result = +[SUUtility currentProductBuild](SUUtility, "currentProductBuild");
  if (result)
  {
    v3 = result;
    result = +[SUUtility currentProductVersion](SUUtility, "currentProductVersion");
    if (result)
    {
      v4 = result;
      result = (id)objc_msgSend(a1, "attributes");
      if (result)
      {
        v5 = (void *)objc_msgSend((id)objc_msgSend(a1, "attributes"), "safeObjectForKey:ofClass:", CFSTR("LastEmergencyBuild"), objc_opt_class());
        v6 = (void *)objc_msgSend((id)objc_msgSend(a1, "attributes"), "safeObjectForKey:ofClass:", CFSTR("LastEmergencyOSVersion"), objc_opt_class());
        result = 0;
        if (v5)
        {
          if (v6)
          {
            if (objc_msgSend(v6, "compare:options:", v4, 64) == -1)
              return 0;
            else
              return (id)(objc_msgSend(v5, "compare:options:", v3, 64) != -1);
          }
        }
      }
    }
  }
  return result;
}

- (uint64_t)cancelDownloadIfNecessary
{
  uint64_t result;

  result = objc_msgSend(a1, "isDownloading");
  if ((_DWORD)result)
    return objc_msgSend(a1, "cancelDownload:", &__block_literal_global_286);
  return result;
}

- (void)cleanupAsset
{
  NSObject *v2;
  _QWORD block[5];

  v2 = +[SUUtility taskQueue](SUUtility, "taskQueue");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__MAAsset_SUS__cleanupAsset__block_invoke;
  block[3] = &unk_24CE3BA38;
  block[4] = a1;
  dispatch_async(v2, block);
}

- (uint64_t)cancelDownload
{
  NSObject *v2;
  dispatch_time_t v3;
  uint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v2 = dispatch_semaphore_create(0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __30__MAAsset_SUS__cancelDownload__block_invoke;
  v6[3] = &unk_24CE3BAE8;
  v6[4] = v2;
  v6[5] = &v7;
  objc_msgSend(a1, "cancelDownload:", v6);
  v3 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v2, v3);
  dispatch_release(v2);
  v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (uint64_t)purge
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  dispatch_time_t v10;
  uint64_t v11;
  uint64_t v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v2 = dispatch_semaphore_create(0);
  if (objc_msgSend(a1, "isInstalled"))
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = (uint64_t)__21__MAAsset_SUS__purge__block_invoke;
    v13[3] = (uint64_t)&unk_24CE3BAE8;
    v13[4] = (uint64_t)v2;
    v13[5] = (uint64_t)&v14;
    objc_msgSend(a1, "purge:", v13);
    v10 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v2, v10);
  }
  else
  {
    SULogInfo(CFSTR("Failed to purge. Asset not installed"), v3, v4, v5, v6, v7, v8, v9, v13[0]);
  }
  dispatch_release(v2);
  v11 = *((unsigned __int8 *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v11;
}

@end
