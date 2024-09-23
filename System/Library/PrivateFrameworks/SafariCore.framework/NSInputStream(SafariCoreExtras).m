@implementation NSInputStream(SafariCoreExtras)

- (BOOL)safari_readNetworkOrderUInt16:()SafariCoreExtras
{
  uint64_t v4;

  v4 = objc_msgSend(a1, "read:maxLength:", a3, 2);
  if (v4 == 2)
    *a3 = bswap32((unsigned __int16)*a3) >> 16;
  return v4 == 2;
}

- (BOOL)safari_readNetworkOrderUInt32:()SafariCoreExtras
{
  uint64_t v4;

  v4 = objc_msgSend(a1, "read:maxLength:", a3, 4);
  if (v4 == 4)
    *a3 = bswap32(*a3);
  return v4 == 4;
}

- (id)safari_readAllData
{
  void *v2;
  uint64_t v3;
  BOOL v4;
  WBSScopeExitHandler *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v10[6];
  BOOL v11;

  v2 = malloc_type_malloc(0x4000uLL, 0x2FB0159uLL);
  v3 = objc_msgSend(a1, "streamStatus");
  v4 = v3 == 0;
  if (!v3)
    objc_msgSend(a1, "open");
  v5 = objc_alloc_init(WBSScopeExitHandler);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__NSInputStream_SafariCoreExtras__safari_readAllData__block_invoke;
  v10[3] = &unk_1E649D110;
  v11 = v4;
  v10[4] = a1;
  v10[5] = v2;
  -[WBSScopeExitHandler setHandler:](v5, "setHandler:", v10);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  if (objc_msgSend(a1, "hasBytesAvailable"))
  {
    do
    {
      v7 = objc_msgSend(a1, "read:maxLength:", v2, 0x4000);
      if (!v7)
        break;
      if (v7 < 0)
      {
        v8 = 0;
        goto LABEL_8;
      }
      objc_msgSend(v6, "appendBytes:length:", v2, v7);
    }
    while ((objc_msgSend(a1, "hasBytesAvailable") & 1) != 0);
  }
  v8 = v6;
LABEL_8:

  return v8;
}

@end
