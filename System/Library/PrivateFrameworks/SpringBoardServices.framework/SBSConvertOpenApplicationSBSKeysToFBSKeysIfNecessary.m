@implementation SBSConvertOpenApplicationSBSKeysToFBSKeysIfNecessary

void __SBSConvertOpenApplicationSBSKeysToFBSKeysIfNecessary_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if ((objc_msgSend(v8, "isEqualToString:", v5) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v5);

    }
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v8);
  }

}

void __SBSConvertOpenApplicationSBSKeysToFBSKeysIfNecessary_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D22D00], CFSTR("launchSuspended"), *MEMORY[0x1E0D22CE8], CFSTR("launchInClassic"), *MEMORY[0x1E0D22DA8], CFSTR("unlockDevice"), *MEMORY[0x1E0D22DA8], CFSTR("unlockDevice"), *MEMORY[0x1E0D22D88], CFSTR("promptUnlock"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SBSConvertOpenApplicationSBSKeysToFBSKeysIfNecessary___oldToNewKeys;
  SBSConvertOpenApplicationSBSKeysToFBSKeysIfNecessary___oldToNewKeys = v0;

}

@end
