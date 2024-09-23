@implementation NSNull(TSDMixingAdditions)

- (uint64_t)mixingTypeWithObject:()TSDMixingAdditions
{
  void *v3;
  uint64_t v4;

  if (objc_msgSend(MEMORY[0x24BDBCEF8], "null") != a3)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSNull(TSDMixingAdditions) mixingTypeWithObject:]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 283, CFSTR("other object isn't NSNull!"));
  }
  return 5;
}

- (uint64_t)mixedObjectWithFraction:()TSDMixingAdditions ofObject:
{
  if ((void *)objc_msgSend(MEMORY[0x24BDBCEF8], "null") == a4)
    return a1;
  else
    return objc_msgSend(a4, "mixedObjectWithFraction:ofObject:", a1, 1.0 - a2);
}

@end
