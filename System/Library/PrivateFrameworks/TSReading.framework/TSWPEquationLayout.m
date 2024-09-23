@implementation TSWPEquationLayout

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_textColor);
  v3.receiver = self;
  v3.super_class = (Class)TSWPEquationLayout;
  -[TSDLayout dealloc](&v3, sel_dealloc);
}

- (void)validate
{
  void *v3;
  uint64_t v4;
  EQKitLayout *v5;
  double v6;
  double v7;
  BOOL v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  if (!self->_equationLayoutContext)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEquationLayout validate]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationLayout.m"), 61, CFSTR("willLayoutInlineWithTextAttributes:columnWidth: should have been called before validate"));
  }
  if (!self->_equationLayout && self->_equationLayoutContext)
  {
    v5 = (EQKitLayout *)objc_msgSend((id)-[TSDInfo equation](-[TSDLayout info](self, "info"), "equation"), "newLayout");
    self->_equationLayout = v5;
    -[EQKitLayout layoutWithContext:](v5, "layoutWithContext:", self->_equationLayoutContext);
    -[EQKitLayout width](self->_equationLayout, "width");
    if (v6 <= 0.0
      || (-[EQKitLayout vsize](self->_equationLayout, "vsize"), v7 <= 0.0)
      || (-[EQKitLayout erasableBounds](self->_equationLayout, "erasableBounds"), CGRectGetWidth(v10) <= 0.0))
    {
      v8 = 0;
    }
    else
    {
      -[EQKitLayout erasableBounds](self->_equationLayout, "erasableBounds");
      v8 = CGRectGetHeight(v11) > 0.0;
    }
    self->_equationIsValid = v8;
  }
  v9.receiver = self;
  v9.super_class = (Class)TSWPEquationLayout;
  -[TSDLayout validate](&v9, sel_validate);
}

- (id)computeLayoutGeometry
{
  EQKitLayoutContext *equationLayoutContext;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  TSDLayoutGeometry *v11;
  __int128 v12;
  _OWORD v14[3];

  if (!self->_equationLayout || (equationLayoutContext = self->_equationLayoutContext) == 0)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEquationLayout computeLayoutGeometry]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationLayout.m"), 86, CFSTR("can't compute layout geometry before being validated"));
    equationLayoutContext = self->_equationLayoutContext;
  }
  -[EQKitLayoutContext baseFontSize](equationLayoutContext, "baseFontSize");
  v7 = v6;
  -[EQKitLayoutContext baseFontSize](self->_equationLayoutContext, "baseFontSize");
  if (self->_equationIsValid)
  {
    -[EQKitLayout width](self->_equationLayout, "width");
    v7 = v9;
    -[EQKitLayout vsize](self->_equationLayout, "vsize");
  }
  v10 = v8;
  v11 = [TSDLayoutGeometry alloc];
  v12 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v14[0] = *MEMORY[0x24BDBD8B8];
  v14[1] = v12;
  v14[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  return -[TSDLayoutGeometry initWithSize:transform:](v11, "initWithSize:transform:", v14, v7, v10);
}

- (CGRect)frameForCulling
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double x;
  double y;
  double width;
  double height;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGAffineTransform v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  -[EQKitLayout erasableBounds](self->_equationLayout, "erasableBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TSDAbstractLayout transform](self, "transform");
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  v24 = CGRectApplyAffineTransform(v23, &v22);
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  -[EQKitLayout height](self->_equationLayout, "height");
  v15 = x + 0.0;
  v17 = y + v16;
  if (-[TSDShadow isEnabled](self->_textShadow, "isEnabled"))
  {
    -[TSDShadow shadowBoundsForRect:](self->_textShadow, "shadowBoundsForRect:", v15, v17, width, height);
    v15 = v18;
    v17 = v19;
    width = v20;
    height = v21;
  }
  v25.origin.x = v15;
  v25.origin.y = v17;
  v25.size.width = width;
  v25.size.height = height;
  return CGRectIntegral(v25);
}

- (double)inlineVerticalOffset
{
  void *v3;
  uint64_t v4;
  double result;

  if (!self->_equationLayout)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEquationLayout inlineVerticalOffset]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationLayout.m"), 117, CFSTR("can't compute vertical offset before being validated"));
  }
  if (!self->_equationIsValid)
    return 0.0;
  -[EQKitLayout depth](self->_equationLayout, "depth");
  return result;
}

- (double)inlineCenteredAlignmentOffset
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  if (!self->_equationLayout)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEquationLayout inlineCenteredAlignmentOffset]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationLayout.m"), 131, CFSTR("can't compute vertical offset before being validated"));
  }
  if (!self->_equationLayoutContext)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEquationLayout inlineCenteredAlignmentOffset]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationLayout.m"), 132, CFSTR("can't compute vertical offset without a layout context"));
  }
  if (!self->_equationIsValid)
    return 0.0;
  -[EQKitLayout naturalAlignmentOffset](self->_equationLayout, "naturalAlignmentOffset");
  v8 = v7;
  v9 = 0.0;
  if (v7 != 1.79769313e308)
  {
    -[EQKitLayout width](self->_equationLayout, "width");
    v9 = v10 * 0.5 - v8;
  }
  -[EQKitLayoutContext containerWidth](self->_equationLayoutContext, "containerWidth");
  v12 = v11;
  -[EQKitLayout width](self->_equationLayout, "width");
  if (fabs(v9) <= (v12 - v13) * 0.5)
    return v9;
  else
    return 0.0;
}

- (void)willLayoutInlineWithTextAttributes:(__CFDictionary *)a3 columnWidth:(double)a4
{
  CGColor *Value;
  TSDShadow *v7;
  TSWPEquationLayoutContext *v8;

  v8 = -[TSWPEquationLayoutContext initWithTextAttributes:columnWidth:]([TSWPEquationLayoutContext alloc], "initWithTextAttributes:columnWidth:", a3, a4);
  Value = (CGColor *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x24BDC4EE0]);
  v7 = (TSDShadow *)CFDictionaryGetValue(a3, CFSTR("TSWPShadow"));
  if (!-[TSWPEquationLayoutContext isEqual:](v8, "isEqual:", self->_equationLayoutContext))
  {

    self->_equationLayoutContext = (EQKitLayoutContext *)v8;
    self->_equationLayout = 0;
    -[TSDLayout invalidateSize](self, "invalidateSize");
    -[TSDLayout setNeedsDisplay](self, "setNeedsDisplay");
  }
  if (!CGColorEqualToColor(Value, self->_textColor))
  {
    CGColorRelease(self->_textColor);
    self->_textColor = CGColorRetain(Value);
    -[TSDLayout setNeedsDisplay](self, "setNeedsDisplay");
  }
  if (v7 != self->_textShadow && !-[TSDShadow isEqual:](v7, "isEqual:"))
  {

    self->_textShadow = v7;
    -[TSDLayout setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (BOOL)wantsRoundedInlinePosition
{
  return 0;
}

- (EQKitLayout)equationLayout
{
  return self->_equationLayout;
}

- (EQKitLayoutContext)equationLayoutContext
{
  return self->_equationLayoutContext;
}

- (void)setEquationLayoutContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 280);
}

- (BOOL)equationIsValid
{
  return self->_equationIsValid;
}

- (CGColor)textColor
{
  return self->_textColor;
}

- (TSDShadow)textShadow
{
  return self->_textShadow;
}

@end
