@implementation SIGeneralTrieSearch

void __SIGeneralTrieSearch_block_invoke(uint64_t a1, const void *a2, unsigned int a3, int a4, uint64_t a5, double a6)
{
  uint64_t v12;
  char *v13;
  unsigned int v14;
  size_t v15;
  size_t v16;
  unsigned int *v17;
  const __CFAllocator *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  MEMORY[0x1E0C80A78](a1);
  v13 = (char *)v19 - ((v12 + 15) & 0x1FFFFFFF0);
  v15 = v14;
  bzero(&v13[v14], v16);
  memcpy(v13, a2, v15);
  v17 = SITrieCompletionCreate((const unsigned __int8 *)v13, a3, a4, a6);
  v18 = (const __CFAllocator *)(*(uint64_t (**)(_QWORD, unsigned int *, uint64_t))(a1 + 32))(*(_QWORD *)(a1 + 40), v17, a5);
  if (v17)
    trieCompletionRelease(v18, v17);
}

@end
