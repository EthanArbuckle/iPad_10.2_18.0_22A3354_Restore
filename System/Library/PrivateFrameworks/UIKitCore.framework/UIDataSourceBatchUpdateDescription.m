@implementation UIDataSourceBatchUpdateDescription

void ___UIDataSourceBatchUpdateDescription_block_invoke(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  void *v5;
  const __CFString *v6;
  unsigned int v7;
  unsigned int v8;

  v5 = *(void **)(a1 + 32);
  v6 = CFSTR("s");
  if (*a3 == 1)
    v6 = &stru_1E16EDF20;
  objc_msgSend(v5, "appendFormat:", CFSTR("Data source %@ updates = { %lu section%@ with item counts: ["), a2, *a3, v6);
  if (*a3)
  {
    v7 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%lu"), (*(unsigned int (**)(void))(*((_QWORD *)a3 + 2) + 16))());
      v8 = *a3;
      if (v7 < *a3 - 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
        v8 = *a3;
      }
      ++v7;
    }
    while (v7 < v8);
  }
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("] }\n"));

}

@end
