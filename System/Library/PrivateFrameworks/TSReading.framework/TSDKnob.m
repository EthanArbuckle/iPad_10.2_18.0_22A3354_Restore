@implementation TSDKnob

- (TSDKnob)initWithType:(int)a3 position:(CGPoint)a4 radius:(double)a5 tag:(unint64_t)a6 onRep:(id)a7
{
  CGFloat y;
  CGFloat x;
  char *v13;
  TSDKnob *v14;
  _OWORD *v15;
  void *v16;
  uint64_t v17;
  objc_super v19;

  y = a4.y;
  x = a4.x;
  v19.receiver = self;
  v19.super_class = (Class)TSDKnob;
  v13 = -[TSDKnob init](&v19, sel_init);
  v14 = (TSDKnob *)v13;
  if (v13)
  {
    *((_DWORD *)v13 + 2) = a3;
    v15 = (_OWORD *)MEMORY[0x24BDBEFB0];
    *((CGFloat *)v13 + 2) = x;
    *((CGFloat *)v13 + 3) = y;
    *(_OWORD *)(v13 + 40) = *v15;
    v13[32] = 0;
    *((double *)v13 + 7) = a5;
    *((_QWORD *)v13 + 8) = a6;
    if (!a7)
    {
      v16 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDKnob initWithType:position:radius:tag:onRep:]");
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnob.m"), 294, CFSTR("invalid nil value for '%s'"), "rep");
    }
    v14->mRep = (TSDRep *)a7;
  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDKnob;
  -[TSDKnob dealloc](&v3, sel_dealloc);
}

- (TSDKnob)init
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDKnob init]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnob.m"), 312, CFSTR("Please use designated initializers on knobs, not this"));
  return 0;
}

- (BOOL)isHitByUnscaledPoint:(CGPoint)a3 andRep:(id)a4
{
  return -[TSDKnob isHitByUnscaledPoint:andRep:returningDistance:](self, "isHitByUnscaledPoint:andRep:returningDistance:", a4, 0, a3.x, a3.y);
}

- (BOOL)isHitByUnscaledPoint:(CGPoint)a3 andRep:(id)a4 returningDistance:(double *)a5
{
  double y;
  double x;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  TSDBezierPath *mHitRegionPath;
  double v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  id v23;
  id v24;
  BOOL v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  y = a3.y;
  x = a3.x;
  v40 = *MEMORY[0x24BDAC8D0];
  if (self->mRep != a4)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDKnob isHitByUnscaledPoint:andRep:returningDistance:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnob.m"), 335, CFSTR("wrong rep for hit testing knob"));
  }
  v12 = (void *)objc_msgSend(a4, "interactiveCanvasController");
  if (!-[TSDKnob worksWhenRepLocked](self, "worksWhenRepLocked") && (objc_msgSend(a4, "isLocked") & 1) != 0
    || !-[TSDKnob worksWhenInVersionBrowsingMode](self, "worksWhenInVersionBrowsingMode")
    && (objc_msgSend(v12, "inVersionBrowsingMode") & 1) != 0)
  {
    return 0;
  }
  -[TSDKnob position](self, "position");
  objc_msgSend(a4, "convertNaturalPointToUnscaledCanvas:");
  v14 = v13;
  v16 = v15;
  mHitRegionPath = self->mHitRegionPath;
  if (!mHitRegionPath)
  {
    -[TSDKnob updateHitRegionPathForRep:](self, "updateHitRegionPathForRep:", a4);
    mHitRegionPath = self->mHitRegionPath;
  }
  v18 = TSDSubtractPoints(x, y, v14);
  v20 = v19;
  objc_msgSend((id)objc_msgSend(a4, "interactiveCanvasController"), "viewScale");
  v22 = -[TSDBezierPath containsPoint:](mHitRegionPath, "containsPoint:", TSDMultiplyPointScalar(v18, v20, v21));
  if (a5)
    *a5 = TSDDistanceSquared(v14, v16, x, y);
  if (!v22)
    return 0;
  if (!-[TSDKnob shouldDisplayDirectlyOverRep](self, "shouldDisplayDirectlyOverRep"))
    return 1;
  v23 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "interactiveCanvasController"), "hitRep:", x, y), "repForSelecting");
  v24 = v23;
  v25 = v23 == 0;
  if (v23 && v23 != a4)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v26 = (void *)objc_msgSend(a4, "interactiveCanvasController", 0);
    v27 = (void *)objc_msgSend(v26, "topLevelZOrderedSiblingsOfInfos:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_msgSend(v24, "info")));
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v36;
LABEL_17:
      v31 = 0;
      while (1)
      {
        if (*(_QWORD *)v36 != v30)
          objc_enumerationMutation(v27);
        v32 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v31);
        v33 = objc_msgSend(v24, "info");
        v25 = v32 == v33;
        if (v32 == v33
          || v32 == objc_msgSend(a4, "info")
          || v32 == objc_msgSend((id)objc_msgSend(a4, "repForSelecting"), "info"))
        {
          break;
        }
        if (v29 == ++v31)
        {
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          v25 = 0;
          if (v29)
            goto LABEL_17;
          return v24 == a4 || v25;
        }
      }
    }
    else
    {
      v25 = 0;
    }
  }
  return v24 == a4 || v25;
}

- (int)dragType
{
  return 2;
}

- (id)knobImage
{
  void *v2;
  uint64_t v3;
  const __CFString *v4;
  unint64_t v5;

  switch(self->mType)
  {
    case 1:
    case 5:
      v2 = (void *)MEMORY[0x24BEB3C90];
      v3 = TSDBundle();
      v4 = CFSTR("sf-ios-canvas-knob-yellow");
      break;
    case 3:
      v2 = (void *)MEMORY[0x24BEB3C90];
      v3 = TSDBundle();
      v4 = CFSTR("sf-ios-canvas-knob-text");
      break;
    case 4:
      v2 = (void *)MEMORY[0x24BEB3C90];
      v3 = TSDBundle();
      v4 = CFSTR("sf-ios-canvas-knob-locked");
      break;
    default:
      v5 = self->mTag - 12;
      v2 = (void *)MEMORY[0x24BEB3C90];
      v3 = TSDBundle();
      if (v5 > 4)
        v4 = CFSTR("sf-ios-canvas-knob-blue");
      else
        v4 = CFSTR("sf-ios-canvas-knob-green");
      break;
  }
  return (id)objc_msgSend(v2, "imageNamed:inBundle:", v4, v3);
}

- (CALayer)layer
{
  CALayer *result;
  id v4;
  void *v5;
  CALayer *v6;
  CGPath *Mutable;
  double v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  CGRect v13;

  result = self->mLayer;
  if (!result)
  {
    v4 = -[TSDKnob knobImage](self, "knobImage");
    if (v4)
    {
      v5 = v4;
      self->mLayer = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
      objc_msgSend(v5, "size");
      -[CALayer setBounds:](self->mLayer, "setBounds:", TSDRectWithSize());
      -[TSDCanvas contentsScale](-[TSDRep canvas](self->mRep, "canvas"), "contentsScale");
      -[CALayer setContents:](self->mLayer, "setContents:", objc_msgSend(v5, "CGImageForContentsScale:"));
    }
    else
    {
      v6 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
      self->mLayer = v6;
      Mutable = CGPathCreateMutable();
      -[TSDKnob radius](self, "radius");
      v9 = v8 + v8;
      v10 = *MEMORY[0x24BDBEFB0];
      v11 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      -[CALayer setBounds:](v6, "setBounds:", *MEMORY[0x24BDBEFB0], v11, v9, v9);
      v13.origin.x = v10;
      v13.origin.y = v11;
      v13.size.width = v9;
      v13.size.height = v9;
      CGPathAddEllipseInRect(Mutable, 0, v13);
      -[CALayer setPath:](v6, "setPath:", Mutable);
      CGPathRelease(Mutable);
      -[CALayer setFillColor:](v6, "setFillColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "whiteColor"), "CGColor"));
      -[CALayer setStrokeColor:](v6, "setStrokeColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "blackColor"), "CGColor"));
    }
    result = self->mLayer;
    if (self->mTag - 12 <= 4)
    {
      -[CALayer zPosition](result, "zPosition");
      -[CALayer setZPosition:](self->mLayer, "setZPosition:", v12 + 1.0);
      return self->mLayer;
    }
  }
  return result;
}

- (id)hitRegionLayerForRep:(id)a3
{
  void *v5;
  uint64_t v6;
  id result;
  TSDBezierPath *mHitRegionPath;

  if (self->mRep != a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDKnob hitRegionLayerForRep:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnob.m"), 488, CFSTR("wrong rep for hit region"));
  }
  result = self->mHitRegionLayer;
  if (!result)
  {
    self->mHitRegionLayer = (CAShapeLayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
    -[CAShapeLayer setFillColor:](self->mHitRegionLayer, "setFillColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.7, 0.1, 0.1, 0.3), "CGColor"));
    mHitRegionPath = self->mHitRegionPath;
    if (!mHitRegionPath)
    {
      -[TSDKnob updateHitRegionPathForRep:](self, "updateHitRegionPathForRep:", a3);
      mHitRegionPath = self->mHitRegionPath;
    }
    -[CAShapeLayer setPath:](self->mHitRegionLayer, "setPath:", -[TSDBezierPath CGPath](mHitRegionPath, "CGPath"));
    return self->mHitRegionLayer;
  }
  return result;
}

- (CGRect)boundingBoxOfHitRegionForRep:(id)a3 scale:(double)a4
{
  void *v7;
  uint64_t v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGAffineTransform v23;
  CGRect v24;
  CGRect v25;

  if (self->mRep != a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDKnob boundingBoxOfHitRegionForRep:scale:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnob.m"), 503, CFSTR("wrong rep for bounding box"));
  }
  if (!self->mHitRegionPath)
    -[TSDKnob updateHitRegionPathForRep:](self, "updateHitRegionPathForRep:", a3);
  -[TSDKnob position](self, "position");
  objc_msgSend(a3, "convertNaturalPointToUnscaledCanvas:");
  v10 = v9;
  v12 = v11;
  objc_msgSend((id)objc_msgSend(a3, "interactiveCanvasController"), "viewScale");
  v14 = 1.0 / v13 * a4;
  -[TSDBezierPath bounds](self->mHitRegionPath, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  CGAffineTransformMakeScale(&v23, v14, v14);
  v24.origin.x = v16;
  v24.origin.y = v18;
  v24.size.width = v20;
  v24.size.height = v22;
  v25 = CGRectApplyAffineTransform(v24, &v23);
  return CGRectOffset(v25, v10, v12);
}

- (double)i_rotationInDegreesForKnobOnRep:(id)a3
{
  unint64_t v4;
  void *v5;
  double v6;
  double v7;
  double result;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v4 = -[TSDKnob tag](self, "tag");
  v5 = (void *)objc_msgSend(a3, "layout");
  if (v5)
  {
    objc_msgSend(v5, "transformInRoot");
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    v9 = 0u;
  }
  if (TSDIsTransformFlipped((double *)&v9))
    v4 = TSDKnobTagWithFlip(v4);
  v6 = 0.0;
  if (v4 - 1 <= 0xB)
    v6 = dbl_217C29700[v4 - 1];
  objc_msgSend(a3, "additionalRotationForKnobOrientation", v9, v10, v11);
  TSDNormalizeAngleInDegrees(v6 + v7);
  return result;
}

- (void)updateHitRegionPathForRep:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float v22;
  float v23;
  double v24;
  double v25;
  TSDBezierPath *mHitRegionPath;
  CGAffineTransform *v27;
  TSDBezierPath *v28;
  double v30;
  TSDBezierPath *v31;
  CGAffineTransform v32;
  CGAffineTransform t1;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;

  self->mHitRegionPath = 0;
  -[TSDKnob radius](self, "radius");
  v6 = v5;
  if ((objc_msgSend(a3, "canUseSpecializedHitRegionForKnob:", self) & 1) == 0)
    goto LABEL_26;
  objc_msgSend(a3, "boundsForStandardKnobs");
  v8 = v7;
  v10 = v9;
  objc_msgSend((id)objc_msgSend(a3, "interactiveCanvasController"), "viewScale");
  v12 = v11;
  objc_msgSend((id)objc_msgSend(a3, "interactiveCanvasController"), "viewScale");
  v14 = v6 / v13 * 10.0;
  if (-[TSDKnob tag](self, "tag") >= 0xC && -[TSDKnob tag](self, "tag") <= 0x10)
  {
    if (v8 < v14 || v10 < v14)
    {
      v16 = -15.0;
      v17 = -15.0;
      v18 = 30.0;
      v19 = 30.0;
LABEL_27:
      self->mHitRegionPath = +[TSDBezierPath bezierPathWithOvalInRect:](TSDBezierPath, "bezierPathWithOvalInRect:", v16, v17, v18, v19);
      goto LABEL_28;
    }
LABEL_26:
    v16 = -(v6 + v6);
    v18 = v6 + v6 + v6 + v6;
    v17 = v16;
    v19 = v18;
    goto LABEL_27;
  }
  v20 = v6 / v12 + v6 / v12;
  if (v8 < v20 || v10 < v20)
  {
    self->mHitRegionPath = +[TSDBezierPath bezierPathWithOvalInRect:](TSDBezierPath, "bezierPathWithOvalInRect:", -15.0, -15.0, 30.0, 45.0);
    v22 = v8;
    v23 = v10;
    memset(&v36.c, 0, 32);
    if (fminf(v22, v23) >= 30.0)
      v24 = 3.75;
    else
      v24 = 7.5;
    *(_OWORD *)&v36.a = 0uLL;
    -[TSDKnob i_rotationInDegreesForKnobOnRep:](self, "i_rotationInDegreesForKnobOnRep:", a3);
    CGAffineTransformMakeRotation(&v36, v25 * 0.0174532925);
    memset(&v35, 0, sizeof(v35));
    CGAffineTransformMakeTranslation(&v35, v36.tx + v24 * v36.c + v36.a * 0.0, v36.ty + v24 * v36.d + v36.b * 0.0);
    mHitRegionPath = self->mHitRegionPath;
    t1 = v36;
    v32 = v35;
    CGAffineTransformConcat(&v34, &t1, &v32);
    v27 = &v34;
    v28 = mHitRegionPath;
  }
  else
  {
    if (v8 >= v14 && v10 >= v14)
      goto LABEL_26;
    self->mHitRegionPath = +[TSDBezierPath bezierPathWithOvalInRect:](TSDBezierPath, "bezierPathWithOvalInRect:", -v6, -v6, v6 + v6, v6 * 3.0);
    memset(&v36, 0, sizeof(v36));
    -[TSDKnob i_rotationInDegreesForKnobOnRep:](self, "i_rotationInDegreesForKnobOnRep:", a3);
    CGAffineTransformMakeRotation(&v36, v30 * 0.0174532925);
    v28 = self->mHitRegionPath;
    v35 = v36;
    v27 = &v35;
  }
  -[TSDBezierPath transformUsingAffineTransform:](v28, "transformUsingAffineTransform:", v27);
LABEL_28:
  v31 = self->mHitRegionPath;
}

- (BOOL)overlapsWithKnob:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGRect v17;
  CGRect v18;

  -[CALayer frame](-[TSDKnob layer](self, "layer"), "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend((id)objc_msgSend(a3, "layer"), "frame");
  v18.origin.x = v12;
  v18.origin.y = v13;
  v18.size.width = v14;
  v18.size.height = v15;
  v17.origin.x = v5;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v11;
  return CGRectIntersectsRect(v17, v18);
}

- (BOOL)obscuresKnob:(id)a3
{
  double v4;
  double v5;
  double v6;

  -[CALayer zPosition](-[TSDKnob layer](self, "layer"), "zPosition");
  v5 = v4;
  objc_msgSend((id)objc_msgSend(a3, "layer"), "zPosition");
  return v5 > v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  CGPoint v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = -[TSDKnob tag](self, "tag");
  -[TSDKnob position](self, "position");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p tag=%lu position=%@>"), v4, self, v5, NSStringFromCGPoint(v7));
}

- (int)type
{
  return self->mType;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (CGPoint)position
{
  double x;
  double y;
  CGPoint result;

  x = self->mPosition.x;
  y = self->mPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->mPosition = a3;
}

- (BOOL)offsetValid
{
  return self->mOffsetValid;
}

- (void)setOffsetValid:(BOOL)a3
{
  self->mOffsetValid = a3;
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->mOffset.x;
  y = self->mOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->mOffset = a3;
}

- (double)radius
{
  return self->mRadius;
}

- (void)setRadius:(double)a3
{
  self->mRadius = a3;
}

- (unint64_t)tag
{
  return self->mTag;
}

- (void)setTag:(unint64_t)a3
{
  self->mTag = a3;
}

- (BOOL)worksWhenRepLocked
{
  return self->mWorksWhenRepLocked;
}

- (void)setWorksWhenRepLocked:(BOOL)a3
{
  self->mWorksWhenRepLocked = a3;
}

- (BOOL)worksWhenInVersionBrowsingMode
{
  return self->mWorksWhenInVersionBrowsingMode;
}

- (void)setWorksWhenInVersionBrowsingMode:(BOOL)a3
{
  self->mWorksWhenInVersionBrowsingMode = a3;
}

- (BOOL)shouldDisplayDirectlyOverRep
{
  return self->mShouldDisplayDirectlyOverRep;
}

- (void)setShouldDisplayDirectlyOverRep:(BOOL)a3
{
  self->mShouldDisplayDirectlyOverRep = a3;
}

- (TSDBezierPath)hitRegionPath
{
  return self->mHitRegionPath;
}

- (void)setHitRegionPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (TSDRep)rep
{
  return self->mRep;
}

@end
