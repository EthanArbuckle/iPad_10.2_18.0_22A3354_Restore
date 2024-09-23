@implementation NSError(TSKWarningAdditions)

+ (uint64_t)errorWithTSKWarning:()TSKWarningAdditions
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = objc_msgSend(a3, "kind");
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = objc_msgSend(a3, "message");
  return objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.iWork.TSKWarningErrorDomain"), v5, objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, *MEMORY[0x24BDD0FC8], 0));
}

@end
