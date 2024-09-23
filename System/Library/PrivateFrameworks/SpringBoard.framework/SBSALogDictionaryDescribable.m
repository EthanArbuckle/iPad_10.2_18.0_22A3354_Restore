@implementation SBSALogDictionaryDescribable

uint64_t ___SBSALogDictionaryDescribable_block_invoke(uint64_t a1, void *a2)
{
  const __CFString *v2;

  if (*(_QWORD *)(a1 + 32) >= *(_QWORD *)(a1 + 40))
    v2 = CFSTR(">");
  else
    v2 = CFSTR("; ");
  return objc_msgSend(a2, "appendString:", v2);
}

@end
