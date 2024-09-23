@implementation NSString

void __61__NSString_TSUNumberFormatStringUtilities__tsu_numberSymbols__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("0123456789#@"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)tsu_numberSymbols_symbols;
  tsu_numberSymbols_symbols = v0;

}

void __47__NSString_TSUAdditions__tsu_escapeForIcuRegex__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("*?+[(){}^$|\\./"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&tsu_escapeForIcuRegex_icuRegexCharSet, v2);
  if (!tsu_escapeForIcuRegex_icuRegexCharSet)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSUAdditions) tsu_escapeForIcuRegex]_block_invoke");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSString_TSUAdditions.m");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v0, v1, 381, 0, "invalid nil value for '%{public}s'", "icuRegexCharSet", v2);

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }

}

CFStringTokenizerTokenType __80__NSString_TSUAdditions__tsu_setOfContainedWordsIncludingPunctuationAndSymbols___block_invoke(uint64_t a1, CFStringTokenizerRef tokenizer)
{
  CFStringTokenizerTokenType Token;
  CFStringTokenizerTokenType v5;
  BOOL v6;

  do
  {
    while (1)
    {
      Token = CFStringTokenizerAdvanceToNextToken(tokenizer);
      v5 = Token;
      if (Token)
        break;
      if (CFStringTokenizerGetCurrentTokenRange(tokenizer).location == -1)
        return v5;
    }
    if (*(_BYTE *)(a1 + 32))
      v6 = 1;
    else
      v6 = (Token & 0x10) == 0;
  }
  while (!v6);
  return v5;
}

void __63__NSString_TSUAdditions__tsu_stringWithoutAttachmentCharacters__block_invoke()
{
  uint64_t v0;
  void *v1;
  __int16 v2;

  v2 = -4;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharacters:length:", &v2, 1);
  v1 = (void *)tsu_stringWithoutAttachmentCharacters_sAttachmentCharacter;
  tsu_stringWithoutAttachmentCharacters_sAttachmentCharacter = v0;

}

void __57__NSString_TSUAdditions__tsu_stringWithNormalizedHyphens__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("ـ‑-‐–—"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)tsu_stringWithNormalizedHyphens_hyphenSet;
  tsu_stringWithNormalizedHyphens_hyphenSet = v0;

}

void __64__NSString_TSUAdditions__tsu_stringWithNormalizedQuotationMarks__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("'\"’‘‚“”„«»‹›」「』『"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)tsu_stringWithNormalizedQuotationMarks_quotationSet;
  tsu_stringWithNormalizedQuotationMarks_quotationSet = v0;

}

void __86__NSString_TSUPersonNameComponents__tsu_localizedDisplayNameWithPersonNameComponents___block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __66__NSString_TSULogAdditions__tsu_initRedactedWithFormat_arguments___block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;

  v3 = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("<REDACT .*? REDACT>"), 8, &v3);
  v1 = v3;
  v2 = (void *)tsu_initRedactedWithFormat_arguments__redactRegex;
  tsu_initRedactedWithFormat_arguments__redactRegex = v0;

}

void __59__NSString_SFUJsonAdditions__sfu_appendJsonStringToString___block_invoke()
{
  void *v0;
  int v1;

  sfu_appendJsonStringToString__escapeCharacters = (uint64_t)(id)objc_msgSend(MEMORY[0x24BDD1690], "characterSetWithRange:", 0, 32);
  objc_msgSend((id)sfu_appendJsonStringToString__escapeCharacters, "addCharactersInString:", CFSTR("\"\\"));
  v1 = 539566120;
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharacters:length:", &v1, 2);
  objc_msgSend((id)sfu_appendJsonStringToString__escapeCharacters, "addCharactersInString:", v0);

}

void __86__NSString_TSWPAdditions__tswp_stringForValue_withListNumberFormat_includeFormatting___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1690]);
  objc_msgSend(v0, "addCharactersInRange:", 46, 1);
  objc_msgSend(v0, "addCharactersInRange:", 40, 1);
  objc_msgSend(v0, "addCharactersInRange:", 41, 1);
  v1 = (void *)+[NSString(TSWPAdditions) tswp_stringForValue:withListNumberFormat:includeFormatting:]::_formattingCharacterSet;
  +[NSString(TSWPAdditions) tswp_stringForValue:withListNumberFormat:includeFormatting:]::_formattingCharacterSet = (uint64_t)v0;

}

void __52__NSString_CSSEscaping__CM_stringByAddingCSSEscapes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("\n\r\f"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_54;
  _MergedGlobals_54 = v0;

}

@end
