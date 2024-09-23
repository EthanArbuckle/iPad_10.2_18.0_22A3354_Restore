@implementation PKObjectDescription

void __PKObjectDescription_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  __CFString *v6;
  id v7;
  const __CFString *v8;
  __CFString *v9;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0C99E38];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "null");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("(null)");
  if (v9 != v6)
    v8 = v6;
  objc_msgSend(v4, "appendFormat:", CFSTR("; %@: %@"), v7, v8);

}

@end
