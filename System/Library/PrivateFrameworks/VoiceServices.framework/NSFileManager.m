@implementation NSFileManager

uint64_t __60__NSFileManager_VoiceServices__cleanDirectory_withLRULimit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v9;
  id v10;

  v10 = 0;
  v4 = *MEMORY[0x1E0C998D0];
  v5 = a3;
  objc_msgSend(a2, "getResourceValue:forKey:error:", &v10, v4, 0);
  v9 = 0;
  v6 = v10;
  objc_msgSend(v5, "getResourceValue:forKey:error:", &v9, v4, 0);

  v7 = objc_msgSend(v6, "compare:", v9);
  return v7;
}

@end
