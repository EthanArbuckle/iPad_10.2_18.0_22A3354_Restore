@implementation NSLineMetrics

uint64_t __103___NSLineMetrics__calculatePositions_hasAdvanceAdjustment_withCapacity_forAttributedString_range_line___block_invoke(int a1, CTRunRef run, const __CTRun *a3)
{
  CFRange StringRange;
  CFRange v5;
  uint64_t v6;
  uint64_t v7;

  StringRange = CTRunGetStringRange(run);
  v5 = CTRunGetStringRange(a3);
  v6 = v5.location < StringRange.location;
  if (StringRange.location < v5.location)
    v6 = -1;
  v7 = v5.length < StringRange.length;
  if (StringRange.length < v5.length)
    v7 = -1;
  if (v6)
    return v6;
  else
    return v7;
}

void __29___NSLineMetrics__hasShaping__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(CFSTR("ja zh yue wuu"), "componentsSeparatedByString:", CFSTR(" "));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithArray:", v3);
  v2 = (void *)_hasShaping_cjShapingLanguages;
  _hasShaping_cjShapingLanguages = v1;

}

uint64_t __29___NSLineMetrics__hasShaping__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(a2, "compositionLanguage");
  if ((unint64_t)(result - 2) <= 2)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 1;
    *a5 = 1;
  }
  return result;
}

void __59___NSLineMetrics__initialAdvanceForCharacterAtIndex_range___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("「『（〔【〖〈《｛‘“"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_initialAdvanceForCharacterAtIndex_range__openingMarkCharacterSet;
  _initialAdvanceForCharacterAtIndex_range__openingMarkCharacterSet = v0;

}

void __57___NSLineMetrics__finalAdvanceForCharacterAtIndex_range___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("」』）〕】〗〉》｝’”。、\ff0c：；？！．"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_finalAdvanceForCharacterAtIndex_range__closingMarkCharacterSet;
  _finalAdvanceForCharacterAtIndex_range__closingMarkCharacterSet = v0;

}

@end
