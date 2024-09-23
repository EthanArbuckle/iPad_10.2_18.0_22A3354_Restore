@implementation CRLWPSelectionHighlightLayer

- (void)renderInContext:(CGContext *)a3
{
  CGColor *v5;
  CGColor *v6;
  CGFloat v7;
  CGFloat v8;
  CGLineCap v9;
  void *v10;
  CGLineJoin v11;
  void *v12;
  id v13;
  CGFloat *v14;
  void *i;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  unsigned __int8 v20;
  CGPathDrawingMode v21;
  id v22;

  if ((-[CRLWPSelectionHighlightLayer isHidden](self, "isHidden") & 1) == 0)
  {
    CGContextSaveGState(a3);
    v5 = (CGColor *)-[CRLWPSelectionHighlightLayer fillColor](self, "fillColor");
    if (v5)
      CGContextSetFillColorWithColor(a3, v5);
    v6 = (CGColor *)-[CRLWPSelectionHighlightLayer strokeColor](self, "strokeColor");
    if (v6)
      CGContextSetStrokeColorWithColor(a3, v6);
    -[CRLWPSelectionHighlightLayer lineWidth](self, "lineWidth");
    CGContextSetLineWidth(a3, v7);
    -[CRLWPSelectionHighlightLayer miterLimit](self, "miterLimit");
    CGContextSetMiterLimit(a3, v8);
    v22 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPSelectionHighlightLayer lineCap](self, "lineCap"));
    if ((objc_msgSend(v22, "isEqualToString:", kCALineCapButt) & 1) != 0)
    {
      v9 = kCGLineCapButt;
    }
    else if ((objc_msgSend(v22, "isEqualToString:", kCALineCapRound) & 1) != 0)
    {
      v9 = kCGLineCapRound;
    }
    else
    {
      if (!objc_msgSend(v22, "isEqualToString:", kCALineCapSquare))
        goto LABEL_13;
      v9 = kCGLineCapSquare;
    }
    CGContextSetLineCap(a3, v9);
LABEL_13:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSelectionHighlightLayer lineJoin](self, "lineJoin"));
    if ((objc_msgSend(v10, "isEqualToString:", kCALineJoinMiter) & 1) != 0)
    {
      v11 = kCGLineJoinMiter;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", kCALineJoinRound) & 1) != 0)
    {
      v11 = kCGLineJoinRound;
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", kCALineJoinBevel))
        goto LABEL_20;
      v11 = kCGLineJoinBevel;
    }
    CGContextSetLineJoin(a3, v11);
LABEL_20:
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSelectionHighlightLayer lineDashPattern](self, "lineDashPattern"));
    v13 = objc_msgSend(v12, "count");
    v14 = (CGFloat *)malloc_type_calloc((size_t)v13, 8uLL, 0x100004000313F17uLL);
    if (v13)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", i));
        objc_msgSend(v16, "doubleValue");
        v14[(_QWORD)i] = v17;

      }
    }
    -[CRLWPSelectionHighlightLayer lineDashPhase](self, "lineDashPhase");
    CGContextSetLineDash(a3, v18, v14, (size_t)v13);
    free(v14);
    CGContextAddPath(a3, (CGPathRef)-[CRLWPSelectionHighlightLayer path](self, "path"));
    if (!v5)
    {
      if (v6)
        CGContextDrawPath(a3, kCGPathStroke);
      goto LABEL_37;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSelectionHighlightLayer fillRule](self, "fillRule"));
    v20 = objc_msgSend(v19, "isEqualToString:", kCAFillRuleNonZero);
    if (v6)
    {
      if ((v20 & 1) != 0)
      {
        v21 = kCGPathFillStroke;
LABEL_35:
        CGContextDrawPath(a3, v21);
        goto LABEL_36;
      }
      if ((objc_msgSend(v19, "isEqualToString:", kCAFillRuleEvenOdd) & 1) != 0)
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
      if (objc_msgSend(v19, "isEqualToString:", kCAFillRuleEvenOdd))
      {
        v21 = kCGPathEOFill;
        goto LABEL_35;
      }
    }
LABEL_36:

LABEL_37:
    CGContextRestoreGState(a3);

  }
}

@end
