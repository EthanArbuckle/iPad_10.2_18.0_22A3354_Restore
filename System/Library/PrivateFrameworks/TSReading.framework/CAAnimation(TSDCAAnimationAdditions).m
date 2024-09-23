@implementation CAAnimation(TSDCAAnimationAdditions)

+ (uint64_t)TSD_supportedKeyPaths
{
  if (TSD_supportedKeyPaths_onceToken != -1)
    dispatch_once(&TSD_supportedKeyPaths_onceToken, &__block_literal_global_53);
  return TSD_supportedKeyPaths_s_supportedKeyPaths;
}

- (uint64_t)p_getValue:()TSDCAAnimationAdditions animationPercent:atTime:initialValue:
{
  void *v0;
  uint64_t v1;

  v0 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v1 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CAAnimation(TSDCAAnimationAdditions) p_getValue:animationPercent:atTime:initialValue:]");
  return objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CAAnimationAdditions.m"), 169, CFSTR("Implement me in subclass!"));
}

- (uint64_t)TSD_valueForKeyPath:()TSDCAAnimationAdditions atTime:animationCache:
{
  void *v9;
  uint64_t v10;

  if ((objc_msgSend((id)objc_msgSend(a1, "keyPath"), "isEqualToString:", a4) & 1) == 0)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CAAnimation(TSDCAAnimationAdditions) TSD_valueForKeyPath:atTime:animationCache:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CAAnimationAdditions.m"), 174, CFSTR("Wrong keyPath for animation!"));
  }
  return objc_msgSend(a1, "TSD_valueAtTime:initialValue:", objc_msgSend((id)objc_msgSend(a5, "initialValues"), "objectForKey:", a4), a2);
}

- (uint64_t)TSD_valueForKeyPath:()TSDCAAnimationAdditions atTime:
{
  return objc_msgSend(a1, "TSD_valueForKeyPath:atTime:animationCache:", a3, 0);
}

- (uint64_t)TSD_valueAtTime:()TSDCAAnimationAdditions initialValue:
{
  void *v0;
  uint64_t v1;

  v0 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v1 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CAAnimation(TSDCAAnimationAdditions) TSD_valueAtTime:initialValue:]");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CAAnimationAdditions.m"), 188, CFSTR("Implement me in subclass!"));
  return 0;
}

- (double)TSD_animationPercentByApplyingTimingFunctionForKeyPath:()TSDCAAnimationAdditions atTime:
{
  void *v0;
  uint64_t v1;

  v0 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v1 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CAAnimation(TSDCAAnimationAdditions) TSD_animationPercentByApplyingTimingFunctionForKeyPath:atTime:]");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CAAnimationAdditions.m"), 194, CFSTR("Implement me in subclass!"));
  return 0.0;
}

- (uint64_t)TSD_containsAnimationForKeyPath:()TSDCAAnimationAdditions
{
  void *v0;
  uint64_t v1;

  v0 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v1 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CAAnimation(TSDCAAnimationAdditions) TSD_containsAnimationForKeyPath:]");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CAAnimationAdditions.m"), 200, CFSTR("Implement me in subclass!"));
  return 0;
}

- (uint64_t)TSD_animationForKeyPath:()TSDCAAnimationAdditions atTime:
{
  void *v0;
  uint64_t v1;

  v0 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v1 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CAAnimation(TSDCAAnimationAdditions) TSD_animationForKeyPath:atTime:]");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CAAnimationAdditions.m"), 206, CFSTR("Implement me in subclass!"));
  return 0;
}

@end
