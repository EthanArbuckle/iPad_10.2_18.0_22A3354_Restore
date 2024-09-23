@implementation NSBundle(ISAdditions)

+ (uint64_t)pathForITunesStoreResource:()ISAdditions ofType:
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "pathForResource:ofType:", a3, a4);
  if (!result)
    return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", a3, a4);
  return result;
}

@end
