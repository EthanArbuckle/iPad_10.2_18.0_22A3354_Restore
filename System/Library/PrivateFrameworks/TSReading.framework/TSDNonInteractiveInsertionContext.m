@implementation TSDNonInteractiveInsertionContext

- (BOOL)hasPreferredCenter
{
  return 0;
}

- (BOOL)isPreferredCenterRequired
{
  return 0;
}

- (BOOL)shouldEndEditing
{
  return 1;
}

- (BOOL)insertFloating
{
  return 0;
}

- (BOOL)insertFromDrag
{
  return 0;
}

- (BOOL)fromDragToInsertController
{
  return 0;
}

- (BOOL)insertWillBeDiscarded
{
  return 0;
}

- (CGPoint)preferredCenter
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  CGPoint result;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDNonInteractiveInsertionContext preferredCenter]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInsertionContext.m"), 175, CFSTR("The preferred center is not applicable for a noninteractive insertion context."));
  v4 = *MEMORY[0x24BDBEFB0];
  v5 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  result.y = v5;
  result.x = v4;
  return result;
}

- (BOOL)isInteractive
{
  return 0;
}

@end
