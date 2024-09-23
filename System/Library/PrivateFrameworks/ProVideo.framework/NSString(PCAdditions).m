@implementation NSString(PCAdditions)

- (uint64_t)composedCharacterCount
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v2 = objc_msgSend(a1, "length");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__NSString_PCAdditions__composedCharacterCount__block_invoke;
  v5[3] = &unk_1E65138B0;
  v5[4] = &v6;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v2, 2, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (CFIndex)glyphCount
{
  const __CFAttributedString *v1;
  const __CTLine *v2;
  CFIndex GlyphCount;

  v1 = (const __CFAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", a1);
  v2 = CTLineCreateWithAttributedString(v1);

  GlyphCount = CTLineGetGlyphCount(v2);
  CFRelease(v2);
  return GlyphCount;
}

- (unint64_t)UTF32CharacterCount
{
  return (unint64_t)objc_msgSend(a1, "lengthOfBytesUsingEncoding:", 2348810496) >> 2;
}

- (BOOL)isAllWhitespace
{
  return objc_msgSend((id)objc_msgSend(a1, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet")), "length") == 0;
}

- (BOOL)isAllWhitespaceAndNewline
{
  return objc_msgSend((id)objc_msgSend(a1, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet")), "length") == 0;
}

- (BOOL)isNewline
{
  return objc_msgSend((id)objc_msgSend(a1, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet")), "length") == 0;
}

- (uint64_t)stringByRemovingCharactersInSet:()PCAdditions
{
  return objc_msgSend((id)objc_msgSend(a1, "componentsSeparatedByCharactersInSet:"), "componentsJoinedByString:", &stru_1E65EDDA0);
}

- (const)stringByTrimmingLeadingCharactersInSet:()PCAdditions
{
  uint64_t v4;

  v4 = objc_msgSend(a1, "rangeOfCharacterFromSet:", objc_msgSend(a3, "invertedSet"));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return &stru_1E65EDDA0;
  else
    return (const __CFString *)objc_msgSend(a1, "substringFromIndex:", v4);
}

- (uint64_t)stringByTrimmingLeadingWhitespace
{
  return objc_msgSend(a1, "stringByTrimmingLeadingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet"));
}

@end
