@implementation NSAttributedString(UIF_BreakIteratorTesting)

+ (unint64_t)UIF_copyBreakIteratorWithLocale:()UIF_BreakIteratorTesting characters:length:flags:lineBreakStrategy:
{
  return _NSCopyBreakIterator(a3, a4, a5, a6);
}

+ (void)UIF_disposeBreakIterator:()UIF_BreakIteratorTesting withLocale:flags:
{
  _NSDisposeBreakIterator(a3, a4, a5);
}

@end
