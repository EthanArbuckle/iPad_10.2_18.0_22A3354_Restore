@implementation TVRCRMSDeviceManager

void __39___TVRCRMSDeviceManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_3;
  sharedInstance_sharedInstance_3 = (uint64_t)v1;

}

void __58___TVRCRMSDeviceManager__addOrUpdateRecordInUserDefaults___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("networkName"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 32), v5);

}

uint64_t __70___TVRCRMSDeviceManager__removeRecordWithNetworkNameFromUserDefaults___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
}

@end
