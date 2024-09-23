@implementation NSHashTable(WBSNSHashTableExtras)

- (BOOL)safari_isEmpty
{
  _OWORD v2[4];
  _BYTE v3[128];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  memset(v2, 0, sizeof(v2));
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", v2, v3, 16) == 0;
}

@end
