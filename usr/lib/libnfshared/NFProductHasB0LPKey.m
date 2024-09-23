@implementation NFProductHasB0LPKey

void __NFProductHasB0LPKey_block_invoke()
{
  if (qword_1ECFF69B8 != -1)
    dispatch_once(&qword_1ECFF69B8, &__block_literal_global_15);
  if (!byte_1ECFF6982)
    byte_1ECFF6984 = 1;
  if (qword_1ECFF6A18 != -1)
    dispatch_once(&qword_1ECFF6A18, &__block_literal_global_73);
  if ((dword_1ECFF6990 - 5) <= 0x3E
    && ((1 << (dword_1ECFF6990 - 5)) & 0x4000003CFF0001FFLL) != 0)
  {
    byte_1ECFF6984 = 1;
  }
}

@end
