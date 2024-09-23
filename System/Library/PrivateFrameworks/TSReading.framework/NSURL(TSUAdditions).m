@implementation NSURL(TSUAdditions)

+ (id)tsu_fileURLWithPath:()TSUAdditions
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
