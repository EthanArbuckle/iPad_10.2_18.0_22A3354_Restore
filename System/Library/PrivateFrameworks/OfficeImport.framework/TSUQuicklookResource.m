@implementation TSUQuicklookResource

+ (id)imagePathForQuicklookResource:(id)a3
{
  void *v4;
  id result;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.iwork.iWorkImport"));
  result = (id)objc_msgSend(v4, "pathForResource:ofType:", a3, CFSTR("png"));
  if (!result)
  {
    result = (id)objc_msgSend(v4, "pathForResource:ofType:", objc_msgSend(a3, "stringByAppendingString:", CFSTR("@2x")), CFSTR("png"));
    if (!result)
      return (id)objc_msgSend(v4, "pathForResource:ofType:", objc_msgSend(a3, "stringByAppendingString:", CFSTR("@3x")), CFSTR("png"));
  }
  return result;
}

@end
