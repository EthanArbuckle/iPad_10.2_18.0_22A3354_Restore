@implementation TSWPSelectionHighlightLayer

- (void)renderInContext:(CGContext *)a3
{
  CGColor *v5;
  CGColor *v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  CGLineCap v10;
  void *v11;
  CGLineJoin v12;
  void *v13;
  size_t v14;
  const CGFloat *v15;
  uint64_t i;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  char v20;
  CGPathDrawingMode v21;

  if ((-[TSWPSelectionHighlightLayer isHidden](self, "isHidden") & 1) == 0)
  {
    CGContextSaveGState(a3);
    v5 = (CGColor *)-[TSWPSelectionHighlightLayer fillColor](self, "fillColor");
    if (v5)
      CGContextSetFillColorWithColor(a3, v5);
    v6 = (CGColor *)-[TSWPSelectionHighlightLayer strokeColor](self, "strokeColor");
    if (v6)
      CGContextSetStrokeColorWithColor(a3, v6);
    -[TSWPSelectionHighlightLayer lineWidth](self, "lineWidth");
    CGContextSetLineWidth(a3, v7);
    -[TSWPSelectionHighlightLayer miterLimit](self, "miterLimit");
    CGContextSetMiterLimit(a3, v8);
    v9 = (void *)-[TSWPSelectionHighlightLayer lineCap](self, "lineCap");
    if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDE5CE0]) & 1) != 0)
    {
      v10 = kCGLineCapButt;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDE5CE8]) & 1) != 0)
    {
      v10 = kCGLineCapRound;
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDE5CF0]))
        goto LABEL_13;
      v10 = kCGLineCapSquare;
    }
    CGContextSetLineCap(a3, v10);
LABEL_13:
    v11 = (void *)-[TSWPSelectionHighlightLayer lineJoin](self, "lineJoin");
    if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDE5D00]) & 1) != 0)
    {
      v12 = kCGLineJoinMiter;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDE5D08]) & 1) != 0)
    {
      v12 = kCGLineJoinRound;
    }
    else
    {
      if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDE5CF8]))
        goto LABEL_20;
      v12 = kCGLineJoinBevel;
    }
    CGContextSetLineJoin(a3, v12);
LABEL_20:
    v13 = (void *)-[TSWPSelectionHighlightLayer lineDashPattern](self, "lineDashPattern");
    v14 = objc_msgSend(v13, "count");
    v15 = (const CGFloat *)operator new[]();
    if (v14)
    {
      for (i = 0; i != v14; ++i)
      {
        objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", i), "doubleValue");
        v15[i] = v17;
      }
    }
    -[TSWPSelectionHighlightLayer lineDashPhase](self, "lineDashPhase");
    CGContextSetLineDash(a3, v18, v15, v14);
    MEMORY[0x219A15394](v15, 0x1000C8000313F17);
    CGContextAddPath(a3, (CGPathRef)-[TSWPSelectionHighlightLayer path](self, "path"));
    if (v5)
    {
      v19 = (void *)-[TSWPSelectionHighlightLayer fillRule](self, "fillRule");
      v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x24BDE5990]);
      if (v6)
      {
        if ((v20 & 1) != 0)
        {
          v21 = kCGPathFillStroke;
LABEL_35:
          CGContextDrawPath(a3, v21);
          goto LABEL_36;
        }
        if ((objc_msgSend(v19, "isEqualToString:", *MEMORY[0x24BDE5988]) & 1) != 0)
        {
          v21 = kCGPathEOFillStroke;
          goto LABEL_35;
        }
      }
      else
      {
        if ((v20 & 1) != 0)
        {
          v21 = kCGPathFill;
          goto LABEL_35;
        }
        if ((objc_msgSend(v19, "isEqualToString:", *MEMORY[0x24BDE5988]) & 1) != 0)
        {
          v21 = kCGPathEOFill;
          goto LABEL_35;
        }
      }
    }
    else if (v6)
    {
      v21 = kCGPathStroke;
      goto LABEL_35;
    }
LABEL_36:
    CGContextRestoreGState(a3);
  }
}

@end
