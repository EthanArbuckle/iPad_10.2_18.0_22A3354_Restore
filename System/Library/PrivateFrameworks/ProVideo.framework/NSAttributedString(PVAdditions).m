@implementation NSAttributedString(PVAdditions)

- (uint64_t)pv_isRightToLeft
{
  const __CTLine *v1;
  const __CFArray *GlyphRuns;
  CFIndex Count;
  CFIndex v4;
  CFIndex v5;
  const __CTRun *ValueAtIndex;
  uint64_t v7;

  v1 = CTLineCreateWithAttributedString(a1);
  GlyphRuns = CTLineGetGlyphRuns(v1);
  Count = CFArrayGetCount(GlyphRuns);
  if (Count < 1)
  {
LABEL_5:
    v7 = 0;
  }
  else
  {
    v4 = Count;
    v5 = 0;
    while (1)
    {
      ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, v5);
      if (!(unint64_t)CTRunGetStringRange(ValueAtIndex).location)
        break;
      if (v4 == ++v5)
        goto LABEL_5;
    }
    v7 = CTRunGetStatus(ValueAtIndex) & 1;
  }
  CFRelease(v1);
  return v7;
}

@end
