@implementation SUPreferencesChanged

uint64_t ____SUPreferencesChanged_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  uint64_t result;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v9 = *(void **)(a1 + 32);
  SULogInfo(CFSTR("%s: Reloading the current preferences now"), a2, a3, a4, a5, a6, a7, a8, (uint64_t)"void __SUPreferencesChanged(CFNotificationCenterRef, void *, CFStringRef, const void *, CFDictionaryRef)_block_invoke");
  objc_msgSend(*(id *)(a1 + 32), "_loadPreferences");
  result = objc_msgSend(v9, "observers");
  if (result)
  {
    result = objc_msgSend((id)objc_msgSend(v9, "observers"), "count");
    if (result)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v11 = (void *)objc_msgSend(v9, "observers");
      result = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (result)
      {
        v12 = result;
        v13 = *(_QWORD *)v16;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v16 != v13)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "preferences:didChangePreference:toValue:", v9, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
          }
          while (v12 != v14);
          result = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          v12 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

@end
