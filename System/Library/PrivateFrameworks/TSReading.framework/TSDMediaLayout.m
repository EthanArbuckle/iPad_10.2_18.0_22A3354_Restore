@implementation TSDMediaLayout

- (CGRect)boundsForStandardKnobs
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mBoundsForStandardKnobs.origin.x;
  y = self->mBoundsForStandardKnobs.origin.y;
  width = self->mBoundsForStandardKnobs.size.width;
  height = self->mBoundsForStandardKnobs.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBoundsForStandardKnobs:(CGRect)a3
{
  self->mBoundsForStandardKnobs = a3;
}

- (BOOL)shouldRenderFrameStroke
{
  return self->mShouldRenderFrameStroke;
}

- (void)setShouldRenderFrameStroke:(BOOL)a3
{
  self->mShouldRenderFrameStroke = a3;
}

- (BOOL)supportsRotation
{
  return 0;
}

- (void)processChangedProperty:(int)a3
{
  TSDAbstractLayout *v5;
  TSDAbstractLayout *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDMediaLayout;
  -[TSDDrawableLayout processChangedProperty:](&v7, sel_processChangedProperty_);
  if (a3 == 517)
  {
    -[TSDLayout invalidateFrame](self, "invalidateFrame");
    -[TSDMediaLayout invalidateAlignmentFrame](self, "invalidateAlignmentFrame");
    if ((-[TSDInfo isInlineWithText](-[TSDLayout info](self, "info"), "isInlineWithText") & 1) != 0
      || -[TSDInfo isAnchoredToText](-[TSDLayout info](self, "info"), "isAnchoredToText"))
    {
      v5 = -[TSDAbstractLayout parent](self, "parent");
      if (v5)
      {
        v6 = v5;
        while ((objc_opt_respondsToSelector() & 1) == 0)
        {
          v6 = -[TSDAbstractLayout parent](v6, "parent");
          if (!v6)
            return;
        }
        -[TSDAbstractLayout wrappableChildInvalidated:](v6, "wrappableChildInvalidated:", self);
      }
    }
  }
}

- (TSDMediaLayout)initWithInfo:(id)a3
{
  TSDMediaLayout *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDMediaLayout;
  result = -[TSDLayout initWithInfo:](&v4, sel_initWithInfo_, a3);
  if (result)
    *(_BYTE *)&result->mMediaInvalidFlags |= 1u;
  return result;
}

- (id)mediaInfo
{
  objc_opt_class();
  -[TSDLayout info](self, "info");
  return (id)TSUDynamicCast();
}

- (BOOL)isStrokeBeingManipulated
{
  return self->mDynamicStroke != 0;
}

- (id)stroke
{
  if (self->mDynamicStroke)
    return self->mDynamicStroke;
  else
    return (id)objc_msgSend(-[TSDMediaLayout mediaInfo](self, "mediaInfo"), "stroke");
}

- (void)dynamicStrokeWidthChangeDidBegin
{
  self->mDynamicStroke = (TSDMutableStroke *)objc_msgSend((id)objc_msgSend(-[TSDMediaLayout mediaInfo](self, "mediaInfo"), "stroke"), "mutableCopy");
}

- (void)dynamicStrokeWidthUpdateToValue:(double)a3
{
  _BOOL4 v5;
  TSDMutableStroke *mDynamicStroke;

  v5 = -[TSDStroke isFrame](self->mDynamicStroke, "isFrame");
  mDynamicStroke = self->mDynamicStroke;
  if (v5)
    -[TSDMutableStroke setAssetScale:](mDynamicStroke, "setAssetScale:", a3);
  else
    -[TSDMutableStroke setWidth:](mDynamicStroke, "setWidth:", a3);
  -[TSDMediaLayout processChangedProperty:](self, "processChangedProperty:", 517);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "canvasController"), "repForLayout:", self), "processChangedProperty:", 517);
}

- (void)dynamicStrokeWidthChangeDidEnd
{

  self->mDynamicStroke = 0;
}

- (void)setGeometry:(id)a3
{
  TSDLayoutGeometry *v5;
  TSDLayoutGeometry *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  objc_super v15[4];
  __int128 v16;
  __int128 v17;
  __int128 v18;

  if ((*(_BYTE *)&self->mMediaInvalidFlags & 1) == 0)
  {
    v5 = -[TSDAbstractLayout geometry](self, "geometry");
    if (v5
      && (v6 = v5, !-[TSDLayoutGeometry differsInMoreThanTranslationFrom:](v5, "differsInMoreThanTranslationFrom:", a3)))
    {
      if (a3)
      {
        objc_msgSend(a3, "transform");
        v8 = *((double *)&v16 + 1);
        v7 = *(double *)&v16;
        v10 = *((double *)&v17 + 1);
        v9 = *(double *)&v17;
        v11 = *((double *)&v18 + 1);
        v12 = *(double *)&v18;
      }
      else
      {
        v17 = 0u;
        v18 = 0u;
        v16 = 0u;
        v11 = 0.0;
        v10 = 0.0;
        v8 = 0.0;
        v12 = 0.0;
        v9 = 0.0;
        v7 = 0.0;
      }
      -[TSDLayoutGeometry transform](v6, "transform");
      if ((*(_BYTE *)&self->mMediaInvalidFlags & 1) == 0)
      {
        v13 = TSDSubtractPoints(v12 + *(double *)(MEMORY[0x24BDBEFB0] + 8) * v9 + v7 * *MEMORY[0x24BDBEFB0], v11 + *(double *)(MEMORY[0x24BDBEFB0] + 8) * v10 + v8 * *MEMORY[0x24BDBEFB0], vaddq_f64((float64x2_t)v15[3], vmlaq_n_f64(vmulq_n_f64((float64x2_t)v15[2], *(double *)(MEMORY[0x24BDBEFB0] + 8)), (float64x2_t)v15[1], *MEMORY[0x24BDBEFB0])).f64[0]);
        self->mCachedAlignmentFrame.origin.x = TSDAddPoints(self->mCachedAlignmentFrame.origin.x, self->mCachedAlignmentFrame.origin.y, v13);
        self->mCachedAlignmentFrame.origin.y = v14;
      }
    }
    else
    {
      -[TSDMediaLayout invalidateAlignmentFrame](self, "invalidateAlignmentFrame");
    }
  }
  v15[0].receiver = self;
  v15[0].super_class = (Class)TSDMediaLayout;
  -[objc_super setGeometry:](v15, sel_setGeometry_, a3);
}

- (CGRect)computeAlignmentFrameInRoot:(BOOL)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMediaLayout computeAlignmentFrameInRoot:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMediaLayout.m"), 177, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSDMediaLayout computeAlignmentFrameInRoot:]"), 0));
}

- (CGRect)alignmentFrame
{
  CGRect *p_mCachedAlignmentFrame;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if ((*(_BYTE *)&self->mMediaInvalidFlags & 1) != 0)
  {
    p_mCachedAlignmentFrame = &self->mCachedAlignmentFrame;
    -[TSDMediaLayout computeAlignmentFrameInRoot:](self, "computeAlignmentFrameInRoot:", 0);
    p_mCachedAlignmentFrame->origin.x = v4;
    p_mCachedAlignmentFrame->origin.y = v5;
    p_mCachedAlignmentFrame->size.width = v6;
    p_mCachedAlignmentFrame->size.height = v7;
    *(_BYTE *)&self->mMediaInvalidFlags &= ~1u;
  }
  x = self->mCachedAlignmentFrame.origin.x;
  y = self->mCachedAlignmentFrame.origin.y;
  width = self->mCachedAlignmentFrame.size.width;
  height = self->mCachedAlignmentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)alignmentFrameInRoot
{
  TSDAbstractLayout *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  if (!-[TSDAbstractLayout parent](self, "parent")
    || (v3 = -[TSDAbstractLayout parent](self, "parent"),
        v3 == (TSDAbstractLayout *)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "rootLayout")))
  {
    -[TSDMediaLayout alignmentFrame](self, "alignmentFrame");
  }
  else
  {
    -[TSDMediaLayout computeAlignmentFrameInRoot:](self, "computeAlignmentFrameInRoot:", 1);
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)invalidateAlignmentFrame
{
  *(_BYTE *)&self->mMediaInvalidFlags |= 1u;
  -[TSDDrawableLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
}

@end
