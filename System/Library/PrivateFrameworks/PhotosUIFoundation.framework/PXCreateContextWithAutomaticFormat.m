@implementation PXCreateContextWithAutomaticFormat

uint64_t __PXCreateContextWithAutomaticFormat_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v4;
  unsigned int v5;
  uint64_t result;

  if (*(_BYTE *)(a1 + 32))
    v4 = (a3 & 0x10000000000) == 0;
  else
    v4 = 1;
  if (v4)
    return 1;
  v5 = *(_DWORD *)(a4 + 44) - 2;
  if (v5 > 2)
    return 1;
  result = 0;
  *(_DWORD *)(a4 + 44) = dword_24438B780[v5];
  *(_BYTE *)(a4 + 64) = 0;
  return result;
}

void __PXCreateContextWithAutomaticFormat_block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  PFUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_24430E000, v3, OS_LOG_TYPE_ERROR, "PXCreateContextWithAutomaticFormat failed with error:%@", (uint8_t *)&v4, 0xCu);
  }

}

@end
