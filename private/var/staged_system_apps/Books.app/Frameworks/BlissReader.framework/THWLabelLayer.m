@implementation THWLabelLayer

- (THWLabelLayer)init
{
  THWLabelLayer *v2;
  CALayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWLabelLayer;
  v2 = -[THWLabelLayer init](&v5, "init");
  if (v2)
  {
    v3 = (CALayer *)objc_alloc_init((Class)CALayer);
    v2->_renderLayer = v3;
    -[CALayer setDelegate:](v3, "setDelegate:", v2);
    -[THWLabelLayer addSublayer:](v2, "addSublayer:", v2->_renderLayer);
  }
  return v2;
}

- (void)dealloc
{
  __CTLine *line;
  objc_super v4;

  line = self->_line;
  if (line)
    CFRelease(line);
  v4.receiver = self;
  v4.super_class = (Class)THWLabelLayer;
  -[THWLabelLayer dealloc](&v4, "dealloc");
}

- (void)setString:(id)a3
{
  if (self->_string != a3 && (objc_msgSend(a3, "isEqualToString:") & 1) == 0)
  {

    self->_string = (NSString *)objc_msgSend(a3, "copy");
    -[THWLabelLayer p_invalidateText](self, "p_invalidateText");
  }
}

- (void)setFontName:(id)a3
{
  if (self->_fontName != a3 && (objc_msgSend(a3, "isEqualToString:") & 1) == 0)
  {

    self->_fontName = (NSString *)objc_msgSend(a3, "copy");
    -[THWLabelLayer p_invalidateText](self, "p_invalidateText");
  }
}

- (void)setFontSize:(double)a3
{
  if (self->_fontSize != a3)
  {
    self->_fontSize = a3;
    -[THWLabelLayer p_invalidateText](self, "p_invalidateText");
  }
}

- (void)setTextColor:(id)a3
{
  if (self->_textColor != a3 && (objc_msgSend(a3, "isEqual:") & 1) == 0)
  {

    self->_textColor = (TSUColor *)a3;
    -[THWLabelLayer p_invalidateText](self, "p_invalidateText");
  }
}

- (void)setHorizontalAlignment:(int)a3
{
  if (self->_horizontalAlignment != a3)
  {
    self->_horizontalAlignment = a3;
    -[THWLabelLayer p_invalidatePosition](self, "p_invalidatePosition");
  }
}

- (void)setVerticalAlignment:(int)a3
{
  if (self->_verticalAlignment != a3)
  {
    self->_verticalAlignment = a3;
    -[THWLabelLayer p_invalidatePosition](self, "p_invalidatePosition");
  }
}

- (void)setVerticalAlignmentRule:(int)a3
{
  if (self->_verticalAlignmentRule != a3)
  {
    self->_verticalAlignmentRule = a3;
    -[THWLabelLayer p_invalidatePosition](self, "p_invalidatePosition");
  }
}

- (void)setShadow:(id)a3
{
  if (self->_shadow != a3 && (objc_msgSend(a3, "isEqual:") & 1) == 0)
  {

    self->_shadow = (TSDShadow *)objc_msgSend(a3, "copy");
    -[THWLabelLayer p_invalidateText](self, "p_invalidateText");
  }
}

- (void)setShadowScale:(double)a3
{
  if (vabdd_f64(a3, self->_shadowScale) >= 0.00999999978)
  {
    self->_shadowScale = a3;
    -[THWLabelLayer p_invalidateText](self, "p_invalidateText");
  }
}

- (void)layoutSublayers
{
  CTFontRef v3;
  CTFontRef v4;
  id v5;
  const __CFAttributedString *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  CGFloat v14;
  uint64_t v15;
  CGFloat v16;
  CALayer *renderLayer;
  CATransform3D v18;
  CATransform3D v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)THWLabelLayer;
  -[THWLabelLayer layoutSublayers](&v20, "layoutSublayers");
  if (!self->_line)
  {
    if (self->_string)
    {
      v3 = CTFontCreateWithName((CFStringRef)self->_fontName, self->_fontSize, 0);
      if (v3)
      {
        v4 = v3;
        v5 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v3, kCTFontAttributeName, -[TSUColor CGColor](self->_textColor, "CGColor"), kCTForegroundColorAttributeName, 0);
        v6 = (const __CFAttributedString *)objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", self->_string, v5);
        self->_line = CTLineCreateWithAttributedString(v6);

        CFRelease(v4);
      }
    }
    -[THWLabelLayer p_erasableBounds](self, "p_erasableBounds");
    -[CALayer setBounds:](self->_renderLayer, "setBounds:");
    -[CALayer setAnchorPoint:](self->_renderLayer, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
    -[CALayer bounds](self->_renderLayer, "bounds");
    v8 = v7;
    -[CALayer bounds](self->_renderLayer, "bounds");
    -[CALayer setPosition:](self->_renderLayer, "setPosition:", v8);
    -[CALayer setNeedsDisplay](self->_renderLayer, "setNeedsDisplay");
  }
  -[THWLabelLayer p_xOffsetForHorizontalAlignment:](self, "p_xOffsetForHorizontalAlignment:", self->_horizontalAlignment);
  v10 = v9;
  v11 = -[THWLabelLayer p_yOffsetForVerticalAlignment:](self, "p_yOffsetForVerticalAlignment:", self->_verticalAlignment);
  v13 = v12;
  v14 = TSURound(v11, v10);
  v16 = TSURound(v15, v13);
  CATransform3DMakeTranslation(&v19, v14, v16, 0.0);
  renderLayer = self->_renderLayer;
  v18 = v19;
  -[CALayer setTransform:](renderLayer, "setTransform:", &v18);
}

- (void)drawInContext:(CGContext *)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWLabelLayer drawInContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWLabelLayer.m"), 204, CFSTR("all rendering should happen in the render layer"));
}

- (void)setContentsScale:(double)a3
{
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THWLabelLayer;
  -[THWLabelLayer setContentsScale:](&v6, "setContentsScale:");
  -[CALayer contentsScale](self->_renderLayer, "contentsScale");
  if (v5 != a3)
  {
    -[CALayer setContentsScale:](self->_renderLayer, "setContentsScale:", a3);
    -[CALayer setNeedsDisplay](self->_renderLayer, "setNeedsDisplay");
  }
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  CGAffineTransform v7;

  if (self->_renderLayer != a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWLabelLayer drawLayer:inContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWLabelLayer.m"), 221, CFSTR("unknown layer"));
  objc_msgSend(a3, "contentsScale");
  TSDSetCGContextInfo(a4, 0, 0, 1, 0);
  CGAffineTransformMakeScale(&v7, 1.0, -1.0);
  CGContextSetTextMatrix(a4, &v7);
  -[TSDShadow applyToContext:viewScale:flipped:](self->_shadow, "applyToContext:viewScale:flipped:", a4, 1, self->_shadowScale);
  CGContextSetTextPosition(a4, 0.0, 0.0);
  CGContextSetShouldSmoothFonts(a4, 0);
  CGContextSetShouldAntialias(a4, 1);
  CTLineDraw(self->_line, a4);
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  if (self->_renderLayer != a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWLabelLayer actionForLayer:forKey:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWLabelLayer.m"), 244, CFSTR("unknown layer"));
  return +[NSNull null](NSNull, "null");
}

- (void)p_invalidateText
{
  __CTLine *line;

  line = self->_line;
  if (line)
  {
    CFRelease(line);
    self->_line = 0;
  }
  -[THWLabelLayer setNeedsLayout](self, "setNeedsLayout");
}

- (CGRect)p_flippedImageBounds
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGAffineTransform v15;
  CGRect ImageBounds;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  if (self->_line)
  {
    if (qword_5432D0 != -1)
      dispatch_once(&qword_5432D0, &stru_42A5C0);
    ImageBounds = CTLineGetImageBounds(self->_line, (CGContextRef)qword_5432C8);
    v7 = ImageBounds.origin.x;
    v8 = ImageBounds.origin.y;
    v9 = ImageBounds.size.width;
    v10 = ImageBounds.size.height;
    if (!CGRectIsNull(ImageBounds))
    {
      CGAffineTransformMakeScale(&v15, 1.0, -1.0);
      v17.origin.x = v7;
      v17.origin.y = v8;
      v17.size.width = v9;
      v17.size.height = v10;
      v18 = CGRectApplyAffineTransform(v17, &v15);
      v19 = CGRectIntegral(v18);
      x = v19.origin.x;
      y = v19.origin.y;
      width = v19.size.width;
      height = v19.size.height;
    }
  }
  v11 = x;
  v12 = y;
  v13 = width;
  v14 = height;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)p_erasableBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  TSDShadow *shadow;
  CGRect result;

  -[THWLabelLayer p_flippedImageBounds](self, "p_flippedImageBounds");
  shadow = self->_shadow;
  if (shadow)
    -[TSDShadow shadowBoundsForRect:](shadow, "shadowBoundsForRect:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)p_xOffsetForHorizontalAlignment:(int)a3
{
  double v3;
  double v4;
  __CTLine *line;
  double v6;

  v3 = 0.0;
  if (a3 == 1)
    v3 = 0.5;
  if (a3 == 2)
    v4 = 1.0;
  else
    v4 = v3;
  line = self->_line;
  -[THWLabelLayer bounds](self, "bounds", v3);
  return CTLineGetPenOffsetForFlush(line, v4, v6);
}

- (double)p_yOffsetForVerticalAlignment:(int)a3
{
  double TypographicBounds;
  double v6;
  double result;
  int verticalAlignmentRule;
  double v9;
  double v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat ascent;

  v16 = 0.0;
  ascent = 0.0;
  TypographicBounds = CTLineGetTypographicBounds(self->_line, &ascent, &v16, 0);
  if (a3 == 2)
  {
    verticalAlignmentRule = self->_verticalAlignmentRule;
    -[THWLabelLayer bounds](self, "bounds", TypographicBounds);
    result = v9;
    if (!verticalAlignmentRule)
      return v9 - v16;
  }
  else
  {
    v6 = ascent;
    if (a3 == 1)
    {
      v10 = v16;
      v11 = self->_verticalAlignmentRule;
      -[THWLabelLayer bounds](self, "bounds", TypographicBounds);
      v13 = v12 * 0.5;
      if (v11)
      {
        v14 = ascent;
        v15 = v13 + ascent * -0.5;
      }
      else
      {
        v15 = v13 + (v6 + v10) * -0.5;
        v14 = ascent;
      }
      return v14 + v15;
    }
    else
    {
      result = 0.0;
      if (!a3)
        return ascent;
    }
  }
  return result;
}

- (NSString)string
{
  return self->_string;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (TSUColor)textColor
{
  return self->_textColor;
}

- (int)horizontalAlignment
{
  return self->_horizontalAlignment;
}

- (int)verticalAlignment
{
  return self->_verticalAlignment;
}

- (int)verticalAlignmentRule
{
  return self->_verticalAlignmentRule;
}

- (TSDShadow)shadow
{
  return self->_shadow;
}

- (double)shadowScale
{
  return self->_shadowScale;
}

- (CALayer)renderLayer
{
  return self->_renderLayer;
}

- (void)setRenderLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (__CTLine)line
{
  return self->_line;
}

- (void)setLine:(__CTLine *)a3
{
  self->_line = a3;
}

@end
