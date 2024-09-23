@implementation BRCFSDownloaderUtil

+ (int)downloadKindWithEtagIfLoser:(id)a3 options:(unint64_t)a4
{
  int v4;
  int v5;

  if ((a4 & 0x20) != 0)
    v4 = 3;
  else
    v4 = 0;
  if ((a4 & 0x14) != 0)
    v5 = 1;
  else
    v5 = v4;
  if (a3)
    return 2;
  else
    return v5;
}

@end
