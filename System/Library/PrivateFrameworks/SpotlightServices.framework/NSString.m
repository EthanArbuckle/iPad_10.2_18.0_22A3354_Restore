@implementation NSString

uint64_t __39__NSString_QueryParser__composedLength__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t __38__NSString_MatchScore__composedLength__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void __35__NSString_MatchScore__containsCJK__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(\\p{script=Han})|(\\p{script=Hangul})"), 1, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)containsCJK_sRegex;
  containsCJK_sRegex = v0;

}

void __57__NSString_ParsecExtras__prs_normalizedParsecInputString__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a3;
  if (objc_msgSend(a2, "characterIsMember:", *(unsigned __int16 *)(a1 + 48)))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v7);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

@end
