@implementation TSWPUIGraphicalAttachment

- (int)elementKind
{
  return 16;
}

- (id)rendererForAttachment
{
  return (id)objc_opt_new();
}

- (void)invalidate
{
  -[TSWPStorage p_didChangeRange:delta:broadcastKind:](-[TSWPAttachment parentStorage](self, "parentStorage"), "p_didChangeRange:delta:broadcastKind:", -[TSWPAttachment findCharIndex](self, "findCharIndex"), 1, 0, 1);
}

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  v2 = 100.0;
  v3 = 30.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (double)baselineOffset
{
  return -15.0;
}

- (BOOL)wantsSelectionAtPoint:(CGPoint)a3
{
  return 1;
}

@end
