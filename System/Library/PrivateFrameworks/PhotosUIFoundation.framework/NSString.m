@implementation NSString

void __78__NSString_PhotosUIFoundation__px_endsWithFullStopOrEquivalentPunctuationMark__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(".!?…。"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)px_endsWithFullStopOrEquivalentPunctuationMark_fullStopPunctuationCharacterSet;
  px_endsWithFullStopOrEquivalentPunctuationMark_fullStopPunctuationCharacterSet = v0;

}

id __48__NSString_PhotosUIFoundation__px_integerValues__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = (void *)MEMORY[0x24BDD14A8];
  v3 = a2;
  objc_msgSend(v2, "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "hasSuffix:", CFSTR("k")) & 1) != 0 || (objc_msgSend(v5, "hasSuffix:", CFSTR("K")) & 1) != 0)
  {
    v6 = 1000;
  }
  else
  {
    v6 = 1000000;
    if ((objc_msgSend(v5, "hasSuffix:", CFSTR("m")) & 1) == 0
      && !objc_msgSend(v5, "hasSuffix:", CFSTR("M")))
    {
      v6 = 1;
      goto LABEL_5;
    }
  }
  objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - 1);
  v7 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)v7;
LABEL_5:
  v8 = objc_msgSend(v5, "integerValue");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8 * v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __51__NSString_PhotosUIFoundation__px_firstLetterRange__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t result;
  uint64_t v10;
  uint64_t v11;

  result = objc_msgSend(*(id *)(a1 + 32), "rangeOfComposedCharacterSequencesForRange:", a3, 1);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v10 + 32) = result;
  *(_QWORD *)(v10 + 40) = v11;
  *a7 = 1;
  return result;
}

void __64__NSString_PhotosUIFoundation___excessiveLineHeightCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
  v1 = (void *)_excessiveLineHeightCharacterSet_excessiveLineHeightCharacterSet;
  _excessiveLineHeightCharacterSet_excessiveLineHeightCharacterSet = v0;

}

@end
