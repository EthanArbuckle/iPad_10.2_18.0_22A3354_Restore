@implementation NSString(SCRCComposedCharacterStringExtras)

- (SCRCComposedCharacter)scrc_composedCharacterAtIndex:()SCRCComposedCharacterStringExtras
{
  CFRange RangeOfComposedCharactersAtIndex;
  SCRCComposedCharacter *v6;
  CFStringRef v7;

  if (CFStringGetLength(a1) <= a3)
  {
    v6 = 0;
  }
  else
  {
    RangeOfComposedCharactersAtIndex = CFStringGetRangeOfComposedCharactersAtIndex(a1, a3);
    if (RangeOfComposedCharactersAtIndex.length == 1)
    {
      v6 = -[SCRCComposedCharacter initWithCharacter:]([SCRCComposedCharacter alloc], "initWithCharacter:", CFStringGetCharacterAtIndex(a1, a3));
    }
    else
    {
      v7 = CFStringCreateWithSubstring(0, a1, RangeOfComposedCharactersAtIndex);
      v6 = -[SCRCComposedCharacter _initWithComposedCharacter:]([SCRCComposedCharacter alloc], "_initWithComposedCharacter:", v7);
      if (v7)
        CFRelease(v7);
    }
  }
  return v6;
}

- (BOOL)scrc_containsOnlyOneGlyph
{
  CFIndex Length;

  Length = CFStringGetLength(a1);
  return Length >= 1 && Length == CFStringGetRangeOfComposedCharactersAtIndex(a1, 0).length;
}

- (uint64_t)scrc_countNumberOfGlyphs
{
  return objc_msgSend(a1, "_countNumberOfGlyphs:", 5);
}

- (uint64_t)_countNumberOfGlyphs:()SCRCComposedCharacterStringExtras
{
  CFIndex Length;
  CFIndex v6;
  unsigned int v7;
  unsigned int v8;
  CFRange RangeOfComposedCharactersAtIndex;

  Length = CFStringGetLength(a1);
  v6 = 0;
  v7 = 0;
  do
  {
    v8 = v7;
    if (v6 >= Length)
      break;
    if (v7 >= a3)
      break;
    RangeOfComposedCharactersAtIndex = CFStringGetRangeOfComposedCharactersAtIndex(a1, v6);
    v7 = v8 + 1;
    v6 = RangeOfComposedCharactersAtIndex.location + RangeOfComposedCharactersAtIndex.length;
  }
  while (RangeOfComposedCharactersAtIndex.length);
  return v8;
}

- (BOOL)scrc_containsNumberOfGlyphs:()SCRCComposedCharacterStringExtras
{
  return a3 <= 5 && objc_msgSend(a1, "_countNumberOfGlyphs:", (a3 + 1)) == a3;
}

- (__CFString)scrc_encodeUnicodeForKVO
{
  CFMutableStringRef MutableCopy;
  __CFString *Mutable;
  UInt8 *v3;
  const __CFString *v4;
  unint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unint64_t v10;

  MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  Mutable = CFStringCreateMutable(0, 0);
  CFStringNormalize(MutableCopy, kCFStringNormalizationFormD);
  v10 = 0;
  v3 = SCRCCopyStringToUniCharArray(MutableCopy, &v10);
  v4 = CFStringCreateWithFormat(0, 0, CFSTR("%%0%lux"), 4);
  v5 = v10;
  if (v10)
  {
    v6 = 0;
    v7 = 1;
    do
    {
      CFStringAppendFormat(Mutable, 0, v4, *(unsigned __int16 *)&v3[2 * v6]);
      v6 = v7;
    }
    while (v5 > v7++);
  }
  if (MutableCopy)
    CFRelease(MutableCopy);
  if (v4)
    CFRelease(v4);
  free(v3);
  return Mutable;
}

- (CFMutableStringRef)scrc_decodeUnicodeForKVO
{
  CFIndex Length;
  CFMutableStringRef Mutable;
  CFIndex i;
  uint64_t v6;
  unsigned __int16 v7;
  int v8;
  __int16 v9;
  UniChar buffer[4];
  uint64_t v11;
  CFRange v12;

  v11 = *MEMORY[0x24BDAC8D0];
  Length = CFStringGetLength(a1);
  Mutable = CFStringCreateMutable(0, 0);
  if ((Length & 3) != 0)
  {
LABEL_2:
    if (Mutable)
    {
      CFRelease(Mutable);
      return (CFMutableStringRef)0;
    }
  }
  else if (Length >= 1)
  {
    for (i = 0; i < Length; i += 4)
    {
      v12.location = i;
      v12.length = 4;
      CFStringGetCharacters(a1, v12, buffer);
      v6 = 0;
      v7 = 0;
      do
      {
        v8 = buffer[v6];
        v9 = v8 - 48;
        if ((v8 - 48) >= 0xA)
        {
          if ((v8 - 97) > 5 && (v8 - 65) > 5)
            goto LABEL_2;
          v9 = v8 - 87;
        }
        ++v6;
        v7 = v9 | (16 * v7);
      }
      while (v6 != 4);
      CFStringAppendFormat(Mutable, 0, CFSTR("%C"), v7);
    }
  }
  return Mutable;
}

- (SCRCComposedCharEnumerator)scrc_composedCharacterEnumerator
{
  __CFString *v1;
  SCRCComposedCharEnumerator *v2;

  v1 = (__CFString *)objc_msgSend(a1, "mutableCopy");
  CFStringNormalize(v1, kCFStringNormalizationFormD);
  v2 = -[SCRCComposedCharEnumerator initWithString:]([SCRCComposedCharEnumerator alloc], "initWithString:", v1);

  return v2;
}

@end
