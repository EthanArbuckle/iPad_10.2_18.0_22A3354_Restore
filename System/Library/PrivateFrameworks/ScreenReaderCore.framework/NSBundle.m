@implementation NSBundle

void __62__NSBundle_SCRCBundleExtras__preferredLocalizationsForLocale___block_invoke()
{
  id v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)preferredLocalizationsForLocale__preferredLocMap;
  preferredLocalizationsForLocale__preferredLocMap = (uint64_t)v0;

  v2 = dispatch_queue_create("com.apple.accessibility.VoiceOver.preferredLocalizationsQueue", 0);
  v3 = (void *)preferredLocalizationsForLocale__preferredLocQueue;
  preferredLocalizationsForLocale__preferredLocQueue = (uint64_t)v2;

}

void __62__NSBundle_SCRCBundleExtras__preferredLocalizationsForLocale___block_invoke_15(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend((id)preferredLocalizationsForLocale__preferredLocMap, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "availableLocaleIdentifiers");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", *(_QWORD *)(a1 + 32), 0);
    objc_msgSend(MEMORY[0x24BDD1488], "preferredLocalizationsFromArray:forPreferences:", v9, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      if (*(_QWORD *)(a1 + 32))
        objc_msgSend((id)preferredLocalizationsForLocale__preferredLocMap, "setObject:forKey:");
    }

  }
}

@end
