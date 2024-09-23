@implementation SBDisplayItemGridLayoutRestrictionsDescription

void __SBDisplayItemGridLayoutRestrictionsDescription_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  const __CFString *v3;
  void *v4;
  id v5;

  switch(a2)
  {
    case 8:
      v2 = *(void **)(a1 + 32);
      v3 = CFSTR("no orthogonal resizes");
      goto LABEL_7;
    case 4:
      v2 = *(void **)(a1 + 32);
      v3 = CFSTR("always maximized");
      goto LABEL_7;
    case 2:
      v2 = *(void **)(a1 + 32);
      v3 = CFSTR("non-resizable scene");
LABEL_7:
      objc_msgSend(v2, "addObject:", v3);
      return;
  }
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown (%lu)"), a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

@end
