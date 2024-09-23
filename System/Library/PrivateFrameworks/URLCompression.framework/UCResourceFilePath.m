@implementation UCResourceFilePath

+ (id)_bundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

+ (id)hostFilePathForSegmentedURLCoderVersion0
{
  id v2;
  id v3;

  v2 = (id)objc_msgSend(a1, "_bundle");
  v3 = (id)objc_msgSend(v2, "pathForResource:ofType:", CFSTR("h"), CFSTR("data"));

  return v3;
}

+ (id)segmentedPathAndQueryFilePathForSegmentedURLCoderVersion0
{
  id v2;
  id v3;

  v2 = (id)objc_msgSend(a1, "_bundle");
  v3 = (id)objc_msgSend(v2, "pathForResource:ofType:", CFSTR("spq"), CFSTR("data"));

  return v3;
}

+ (id)combinedPathAndQueryFilePathForSegmentedURLCoderVersion0
{
  id v2;
  id v3;

  v2 = (id)objc_msgSend(a1, "_bundle");
  v3 = (id)objc_msgSend(v2, "pathForResource:ofType:", CFSTR("cpq"), CFSTR("data"));

  return v3;
}

@end
