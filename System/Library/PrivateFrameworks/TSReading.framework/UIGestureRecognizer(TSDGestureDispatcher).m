@implementation UIGestureRecognizer(TSDGestureDispatcher)

- (void)initWithGestureDispatcher:()TSDGestureDispatcher gestureKind:
{
  void *v6;
  void *v7;

  v6 = (void *)objc_msgSend(a1, "initWithTarget:action:", a3, sel_handleGesture_);
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setGestureDelegate:", a3);
    objc_msgSend(v7, "setGestureKind:", a4);
  }
  return v7;
}

- (void)setGestureKind:()TSDGestureDispatcher
{
  objc_setAssociatedObject(a1, &gestureKindKey, a3, (void *)0x301);
}

- (const)gestureKind
{
  const __CFString *result;

  result = (const __CFString *)objc_getAssociatedObject(a1, &gestureKindKey);
  if (!result)
    return CFSTR("TSWPUndefinedGestureKind");
  return result;
}

- (void)setCachedGestureTarget:()TSDGestureDispatcher
{
  objc_setAssociatedObject(a1, &gestureTargetCacheKey, a3, (void *)0x301);
}

- (id)cachedGestureTarget
{
  return objc_getAssociatedObject(a1, &gestureTargetCacheKey);
}

- (void)setTargetRep:()TSDGestureDispatcher
{
  objc_setAssociatedObject(a1, &targetRepKey, a3, (void *)0x301);
}

- (id)targetRep
{
  return objc_getAssociatedObject(a1, &targetRepKey);
}

- (uint64_t)unscaledLocationForICC:()TSDGestureDispatcher
{
  objc_msgSend(a1, "locationInView:", objc_msgSend(a3, "canvasView"));
  return objc_msgSend(a3, "convertBoundsToUnscaledPoint:");
}

- (uint64_t)boundsLocationForICC:()TSDGestureDispatcher
{
  objc_msgSend(a1, "unscaledLocationForICC:");
  return objc_msgSend(a3, "convertUnscaledToBoundsPoint:");
}

- (uint64_t)naturalLocationForRep:()TSDGestureDispatcher
{
  objc_msgSend(a1, "unscaledLocationForICC:", objc_msgSend(a3, "interactiveCanvasController"));
  return objc_msgSend(a3, "convertNaturalPointFromUnscaledCanvas:");
}

- (uint64_t)gestureDelegate
{
  objc_msgSend(a1, "delegate");
  return TSUProtocolCast();
}

- (uint64_t)setGestureDelegate:()TSDGestureDispatcher
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = TSUProtocolCast();
  if (!v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[UIGestureRecognizer(TSDGestureDispatcher) setGestureDelegate:]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGestureDispatcher.m"), 136, CFSTR("invalid nil value for '%s'"), "grDelegate");
  }
  return objc_msgSend(a1, "setDelegate:", v2);
}

- (uint64_t)gestureState
{
  return objc_msgSend(a1, "state");
}

- (BOOL)isDone
{
  return objc_msgSend(a1, "gestureState") - 3 < 3;
}

@end
