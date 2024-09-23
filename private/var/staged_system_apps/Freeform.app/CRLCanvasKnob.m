@implementation CRLCanvasKnob

- (CRLCanvasKnob)initWithType:(unint64_t)a3 position:(CGPoint)a4 radius:(double)a5 tag:(unint64_t)a6 onRep:(id)a7
{
  CGFloat y;
  CGFloat x;
  id v13;
  CRLCanvasKnob *v14;
  CRLCanvasKnob *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  y = a4.y;
  x = a4.x;
  v13 = a7;
  v20.receiver = self;
  v20.super_class = (Class)CRLCanvasKnob;
  v14 = -[CRLCanvasKnob init](&v20, "init");
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    v14->_position.x = x;
    v14->_position.y = y;
    v14->_offset = CGPointZero;
    v14->_offsetValid = 0;
    v14->_radius = a5;
    v14->_tag = a6;
    if (!v13)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101248B70);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E13210();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101248B90);
      v16 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasKnob initWithType:position:radius:tag:onRep:]"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasKnob.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 313, 0, "invalid nil value for '%{public}s'", "rep");

    }
    objc_storeWeak((id *)&v15->_rep, v13);
    v15->_worksWithStylus = (a6 < 0x11) & (0x1FFDEu >> a6);
  }

  return v15;
}

- (void)dealloc
{
  CRLCanvasKnob *v3;
  objc_super v4;

  v3 = (CRLCanvasKnob *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable delegate](self->_renderable, "delegate"));

  if (v3 == self)
    -[CRLCanvasRenderable setDelegate:](self->_renderable, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)CRLCanvasKnob;
  -[CRLCanvasKnob dealloc](&v4, "dealloc");
}

- (BOOL)worksWhenDocumentIsSharedReadOnly
{
  return self->_worksWhenDocumentIsSharedReadOnly || self->_worksWhenEditingDisabled;
}

- (BOOL)isHitByUnscaledPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  return -[CRLCanvasKnob isHitByUnscaledPoint:inputType:returningDistance:](self, "isHitByUnscaledPoint:inputType:returningDistance:", a4, 0, a3.x, a3.y);
}

- (BOOL)isHitByUnscaledPoint:(CGPoint)a3 inputType:(int64_t)a4 returningDistance:(double *)a5
{
  double y;
  double x;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CRLBezierPath *hitRegionPath;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  unsigned int v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  id v27;
  BOOL v28;
  void *v29;
  void *v30;
  double v31;

  y = a3.y;
  x = a3.x;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob rep](self, "rep"));
  if (-[CRLCanvasKnob i_userInteractionAllowed](self, "i_userInteractionAllowed"))
  {
    -[CRLCanvasKnob position](self, "position");
    objc_msgSend(v10, "convertNaturalPointToUnscaledCanvas:");
    v12 = v11;
    v14 = v13;
    hitRegionPath = self->_hitRegionPath;
    if (!hitRegionPath)
    {
      -[CRLCanvasKnob updateHitRegionPath](self, "updateHitRegionPath");
      hitRegionPath = self->_hitRegionPath;
    }
    v16 = sub_1000603B8(x, y, v12);
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "interactiveCanvasController"));
    objc_msgSend(v19, "viewScale");
    v21 = -[CRLBezierPath containsPoint:](hitRegionPath, "containsPoint:", sub_1000603DC(v16, v18, v20));

    if (a5)
      *a5 = sub_10006010C(v12, v14, x, y);
    if (v21)
    {
      if (-[CRLCanvasKnob shouldDisplayDirectlyOverRep](self, "shouldDisplayDirectlyOverRep"))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "interactiveCanvasController"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "hitRep:", x, y));

        v24 = 1;
        if (v23 && v23 != v10)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "canvas"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "allRepsOrdered"));

          v27 = objc_msgSend(v26, "indexOfObject:", v23);
          v24 = v27 < objc_msgSend(v26, "indexOfObject:", v10);

        }
      }
      else
      {
        v24 = 1;
      }
      if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0 && v24)
      {
        if (objc_msgSend(v10, "canUseSpecializedHitRegionForKnob:", self))
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob p_scaledPreciseHitRegionForInputType:](self, "p_scaledPreciseHitRegionForInputType:", a4));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "interactiveCanvasController"));
          objc_msgSend(v30, "viewScale");
          v24 = objc_msgSend(v29, "containsPoint:", sub_1000603DC(v16, v18, v31));

        }
        else
        {
          v24 = 1;
        }
      }
    }
    else
    {
      v24 = 0;
    }
    v28 = v24 != 0;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (unint64_t)dragType
{
  return 2;
}

- (double)radiusForPreciseHitRegionWithInputType:(int64_t)a3
{
  return 15.0;
}

- (id)p_scaledPreciseHitRegionForInputType:(int64_t)a3
{
  double v3;

  -[CRLCanvasKnob radiusForPreciseHitRegionWithInputType:](self, "radiusForPreciseHitRegionWithInputType:", a3);
  return +[CRLBezierPath bezierPathWithOvalInRect:](CRLBezierPath, "bezierPathWithOvalInRect:", -v3, -v3, v3 + v3, v3 + v3);
}

- (CRLImage)knobImage
{
  return -[CRLCanvasKnob defaultKnobImage](self, "defaultKnobImage");
}

- (CRLImage)defaultKnobImage
{
  const __CFString *v2;
  void *v3;
  unint64_t v5;
  void *v6;
  double v7;

  switch(self->_type)
  {
    case 2uLL:
      v2 = CFSTR("sf-ios-canvas-knob-text");
      goto LABEL_6;
    case 3uLL:
      v2 = CFSTR("sf-ios-canvas-knob-green");
      goto LABEL_6;
    case 4uLL:
      v2 = CFSTR("sf-ios-canvas-knob-locked");
      goto LABEL_6;
    case 5uLL:
      v2 = CFSTR("sf-ios-canvas-knob-yellow");
LABEL_6:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageNamed:](CRLImage, "imageNamed:", v2));
      break;
    default:
      v5 = self->_tag - 12;
      *(_QWORD *)&v7 = objc_opt_class(self, a2).n128_u64[0];
      if (v5 > 4)
        v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "defaultSelectionKnobImage", v7));
      else
        v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "greenKnobImage", v7));
      break;
  }
  return (CRLImage *)v3;
}

+ (CRLImage)defaultSelectionKnobImage
{
  return (CRLImage *)+[CRLImage imageNamed:](CRLImage, "imageNamed:", CFSTR("sf-ios-canvas-knob-blue"));
}

+ (CRLImage)greenKnobImage
{
  return (CRLImage *)+[CRLImage imageNamed:](CRLImage, "imageNamed:", CFSTR("sf-ios-canvas-knob-green"));
}

- (CRLCanvasRenderable)renderable
{
  CRLCanvasRenderable *renderable;
  CRLCanvasRenderable *v4;
  CRLCanvasRenderable *v5;

  renderable = self->_renderable;
  if (!renderable)
  {
    v4 = (CRLCanvasRenderable *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob createKnobRenderable](self, "createKnobRenderable"));
    v5 = self->_renderable;
    self->_renderable = v4;

    -[CRLCanvasKnob didCreateKnobRenderable](self, "didCreateKnobRenderable");
    renderable = self->_renderable;
  }
  return renderable;
}

- (id)createKnobRenderable
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  CGPath *Mutable;
  double v8;
  CGFloat v9;
  double y;
  void *v11;
  double v12;
  CGRect v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob knobImage](self, "knobImage"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderable](CRLCanvasRenderable, "renderable"));
    objc_msgSend(v3, "size");
    objc_msgSend(v4, "setBounds:", sub_10005FDDC());
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob rep](self, "rep"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvas"));
    objc_msgSend(v6, "contentsScale");
    objc_msgSend(v4, "setContents:", objc_msgSend(v3, "CGImageForContentsScale:"));
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
    Mutable = CGPathCreateMutable();
    -[CRLCanvasKnob radius](self, "radius");
    v9 = v8 + v8;
    y = CGPointZero.y;
    objc_msgSend(v6, "setBounds:", CGPointZero.x, y, v9, v9);
    v14.origin.x = CGPointZero.x;
    v14.origin.y = y;
    v14.size.width = v9;
    v14.size.height = v9;
    CGPathAddEllipseInRect(Mutable, 0, v14);
    objc_msgSend(v6, "setPath:", Mutable);
    CGPathRelease(Mutable);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor whiteColor](CRLColor, "whiteColor"));
    objc_msgSend(v6, "setFillColor:", objc_msgSend(v11, "CGColor"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
    objc_msgSend(v6, "setStrokeColor:", objc_msgSend(v5, "CGColor"));
    v4 = v6;
  }

  if (self->_tag - 12 <= 4)
  {
    -[CRLCanvasRenderable zPosition](self->_renderable, "zPosition");
    objc_msgSend(v4, "setZPosition:", v12 + 1.0);
  }

  return v4;
}

- (CGRect)unscaledBoundingBoxOfHitRegionWithAdditionalScale:(double)a3
{
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
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
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v25;
  double v26;
  double v27;
  double v28;
  CGAffineTransform v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob rep](self, "rep"));
  if (!self->_hitRegionPath)
    -[CRLCanvasKnob updateHitRegionPath](self, "updateHitRegionPath");
  -[CRLCanvasKnob position](self, "position");
  objc_msgSend(v5, "convertNaturalPointToUnscaledCanvas:");
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvas"));
  objc_msgSend(v10, "viewScale");
  v12 = 1.0 / v11 * a3;

  -[CRLBezierPath bounds](self->_hitRegionPath, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  CGAffineTransformMakeScale(&v29, v12, v12);
  v30.origin.x = v14;
  v30.origin.y = v16;
  v30.size.width = v18;
  v30.size.height = v20;
  v31 = CGRectApplyAffineTransform(v30, &v29);
  v32 = CGRectOffset(v31, v7, v9);
  x = v32.origin.x;
  y = v32.origin.y;
  width = v32.size.width;
  height = v32.size.height;

  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (BOOL)i_userInteractionAllowed
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned int v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob rep](self, "rep"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "interactiveCanvasController"));
  if (-[CRLCanvasKnob worksWhenRepLocked](self, "worksWhenRepLocked")
    || (objc_msgSend(v3, "isLocked") & 1) == 0)
  {
    if (-[CRLCanvasKnob worksWhenDocumentIsSharedReadOnly](self, "worksWhenDocumentIsSharedReadOnly"))
      v5 = 1;
    else
      v5 = objc_msgSend(v4, "documentIsSharedReadOnly") ^ 1;
  }
  else
  {
    v5 = 0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layerHost"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asiOSCVC"));

  if (v5)
  {
    if (-[CRLCanvasKnob worksWhenInMediaBrowsingMode](self, "worksWhenInMediaBrowsingMode"))
      LOBYTE(v8) = 1;
    else
      v8 = objc_msgSend(v7, "inMediaBrowsingMode") ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (double)p_rotationInDegrees
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob rep](self, "rep"));
  v4 = -[CRLCanvasKnob tag](self, "tag");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layout"));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "transformInRoot");
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
  }
  v7 = sub_100079210((double *)&v13);

  if (v7)
    v4 = sub_100260F40(v4);
  v8 = 0.0;
  if (v4 - 1 <= 0xB)
    v8 = dbl_100EEE928[v4 - 1];
  objc_msgSend(v3, "additionalRotationForKnobOrientation", v13, v14, v15);
  sub_1000618C4(v8 + v9);
  v11 = v10;

  return v11;
}

- (void)updateHitRegionPath
{
  CRLBezierPath *hitRegionPath;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CRLBezierPath *v24;
  float v25;
  float v26;
  double v27;
  double v28;
  CGAffineTransform *v29;
  double v31;
  CRLBezierPath *v32;
  CGAffineTransform v33;
  CGAffineTransform t1;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform v37;

  hitRegionPath = self->_hitRegionPath;
  self->_hitRegionPath = 0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob rep](self, "rep"));
  -[CRLCanvasKnob radius](self, "radius");
  v6 = v5;
  if ((objc_msgSend(v4, "canUseSpecializedHitRegionForKnob:", self) & 1) == 0)
    goto LABEL_26;
  objc_msgSend(v4, "boundsForStandardKnobs");
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interactiveCanvasController"));
  objc_msgSend(v11, "viewScale");
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interactiveCanvasController"));
  objc_msgSend(v14, "viewScale");
  v16 = v6 / v15 * 10.0;

  if (-[CRLCanvasKnob tag](self, "tag") >= 0xC && -[CRLCanvasKnob tag](self, "tag") <= 0x10)
  {
    if (v8 < v16 || v10 < v16)
    {
      v18 = -15.0;
      v19 = -15.0;
      v20 = 30.0;
      v21 = 30.0;
LABEL_27:
      v24 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithOvalInRect:](CRLBezierPath, "bezierPathWithOvalInRect:", v18, v19, v20, v21));
      goto LABEL_28;
    }
LABEL_26:
    v18 = -(v6 + v6);
    v20 = v6 + v6 + v6 + v6;
    v19 = v18;
    v21 = v20;
    goto LABEL_27;
  }
  v22 = v6 / v13 + v6 / v13;
  if (v8 < v22 || v10 < v22)
  {
    v24 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithOvalInRect:](CRLBezierPath, "bezierPathWithOvalInRect:", -15.0, -15.0, 30.0, 45.0));
    v25 = v8;
    v26 = v10;
    memset(&v37.c, 0, 32);
    if (fminf(v25, v26) >= 30.0)
      v27 = 3.75;
    else
      v27 = 7.5;
    *(_OWORD *)&v37.a = 0uLL;
    -[CRLCanvasKnob p_rotationInDegrees](self, "p_rotationInDegrees");
    CGAffineTransformMakeRotation(&v37, v28 * 0.0174532925);
    memset(&v36, 0, sizeof(v36));
    CGAffineTransformMakeTranslation(&v36, v37.tx + v27 * v37.c + v37.a * 0.0, v37.ty + v27 * v37.d + v37.b * 0.0);
    t1 = v37;
    v33 = v36;
    CGAffineTransformConcat(&v35, &t1, &v33);
    v29 = &v35;
  }
  else
  {
    if (v8 >= v16 && v10 >= v16)
      goto LABEL_26;
    v24 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithOvalInRect:](CRLBezierPath, "bezierPathWithOvalInRect:", -v6, -v6, v6 + v6, v6 * 3.0));
    memset(&v37, 0, sizeof(v37));
    -[CRLCanvasKnob p_rotationInDegrees](self, "p_rotationInDegrees");
    CGAffineTransformMakeRotation(&v37, v31 * 0.0174532925);
    v36 = v37;
    v29 = &v36;
  }
  -[CRLBezierPath transformUsingAffineTransform:](v24, "transformUsingAffineTransform:", v29);
LABEL_28:
  v32 = self->_hitRegionPath;
  self->_hitRegionPath = v24;

}

- (void)setHitRegionPath:(id)a3
{
  CRLBezierPath *v4;
  CRLBezierPath *hitRegionPath;

  if (self->_hitRegionPath != a3)
  {
    v4 = (CRLBezierPath *)objc_msgSend(a3, "copy");
    hitRegionPath = self->_hitRegionPath;
    self->_hitRegionPath = v4;

  }
}

- (CRLCursor)resizeCursor
{
  double v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;

  -[CRLCanvasKnob p_rotationInDegrees](self, "p_rotationInDegrees");
  v4 = sub_100260C3C(v3) - 1;
  if (v4 <= 8 && ((0x1EFu >> v4) & 1) != 0)
  {
    v6 = qword_100EEE988[v4];
    -[CRLCanvasKnob cursorActiveScaledRect](self, "cursorActiveScaledRect");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCursor cursorForResizeType:activeScaledRect:](CRLCursor, "cursorForResizeType:activeScaledRect:", v6));
  }
  else
  {
    v5 = 0;
  }
  return (CRLCursor *)v5;
}

- (CGRect)cursorActiveScaledRect
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob rep](self, "rep"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob hitRegionPath](self, "hitRegionPath"));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  if (objc_msgSend(v3, "canUseSpecializedHitRegionForKnob:", self))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob p_scaledPreciseHitRegionForInputType:](self, "p_scaledPreciseHitRegionForInputType:", 0));
    objc_msgSend(v13, "bounds");
    v6 = v14;
    v8 = v15;
    v10 = v16;
    v12 = v17;

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "interactiveCanvasController"));
  -[CRLCanvasKnob position](self, "position");
  objc_msgSend(v3, "convertNaturalPointToUnscaledCanvas:");
  objc_msgSend(v18, "convertUnscaledToBoundsPoint:");
  v20 = sub_1000603D0(v6, v8, v19);
  v22 = v21;

  v23 = v20;
  v24 = v22;
  v25 = v10;
  v26 = v12;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (CRLCursor)rotateCursor
{
  double v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;

  -[CRLCanvasKnob p_rotationInDegrees](self, "p_rotationInDegrees");
  v4 = sub_100260C3C(v3) - 1;
  if (v4 <= 8 && ((0x1EFu >> v4) & 1) != 0)
  {
    v6 = qword_100EEE9D0[v4];
    -[CRLCanvasKnob cursorActiveScaledRect](self, "cursorActiveScaledRect");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCursor cursorForRotateType:activeScaledRect:](CRLCursor, "cursorForRotateType:activeScaledRect:", v6));
  }
  else
  {
    v5 = 0;
  }
  return (CRLCursor *)v5;
}

- (BOOL)transferCursorInsideStateIfDesiredFromKnob:(id)a3
{
  return 0;
}

- (CGRect)frameForIntersection
{
  void *v2;
  double v3;
  double v4;
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
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob renderable](self, "renderable"));
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)overlapsWithKnob:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
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
  CGRect v22;
  CGRect v23;

  v4 = a3;
  -[CRLCanvasKnob frameForIntersection](self, "frameForIntersection");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "frameForIntersection");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  v23.origin.x = v14;
  v23.origin.y = v16;
  v23.size.width = v18;
  v23.size.height = v20;
  return CGRectIntersectsRect(v22, v23);
}

- (BOOL)obscuresKnob:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  BOOL v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderable"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob renderable](self, "renderable"));
    objc_msgSend(v6, "zPosition");
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderable"));
    objc_msgSend(v9, "zPosition");
    v11 = v8 > v10;

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (id)description
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  NSString *v7;
  void *v8;
  void *v9;
  CGPoint v11;

  *(_QWORD *)&v3 = objc_opt_class(self, a2).n128_u64[0];
  v5 = v4;
  v6 = -[CRLCanvasKnob tag](self, "tag", v3);
  -[CRLCanvasKnob position](self, "position");
  v7 = NSStringFromCGPoint(v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p tag=%tu position=%@>"), v5, self, v6, v8));

  return v9;
}

- (CGPoint)pixelAlignedScaledCanvasCenterPositionFromKnobPosition:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob rep](self, "rep"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "interactiveCanvasController"));
  objc_msgSend(v6, "convertKnobPositionToUnscaledCanvas:", x, y);
  objc_msgSend(v7, "convertUnscaledToBoundsPoint:");
  v9 = v8;
  v11 = v10;
  if (-[CRLCanvasKnob shouldDisplayDirectlyOverRep](self, "shouldDisplayDirectlyOverRep"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob rep](self, "rep"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "parentRep"));
    objc_msgSend(v13, "layerFrameInScaledCanvas");
    v9 = sub_1000603B8(v9, v11, v14);
    v11 = v15;

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob renderable](self, "renderable"));
  objc_msgSend(v16, "bounds");
  v21 = sub_100061400(v17, v18, v19, v20);
  v22 = sub_1000603B8(v9, v11, v21);
  v24 = v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvas"));
  objc_msgSend(v25, "contentsScale");
  v27 = sub_1000630F8(v22, v24, v26);
  v29 = sub_1000603D0(v27, v28, v21);
  v31 = v30;

  v32 = v29;
  v33 = v31;
  result.y = v33;
  result.x = v32;
  return result;
}

- (CRLCanvasRep)rep
{
  return (CRLCanvasRep *)objc_loadWeakRetained((id *)&self->_rep);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (CGPoint)position
{
  double x;
  double y;
  CGPoint result;

  x = self->_position.x;
  y = self->_position.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->_position = a3;
}

- (BOOL)offsetValid
{
  return self->_offsetValid;
}

- (void)setOffsetValid:(BOOL)a3
{
  self->_offsetValid = a3;
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (unint64_t)tag
{
  return self->_tag;
}

- (void)setTag:(unint64_t)a3
{
  self->_tag = a3;
}

- (BOOL)worksWhenRepLocked
{
  return self->_worksWhenRepLocked;
}

- (void)setWorksWhenRepLocked:(BOOL)a3
{
  self->_worksWhenRepLocked = a3;
}

- (BOOL)worksWhenEditingDisabled
{
  return self->_worksWhenEditingDisabled;
}

- (void)setWorksWhenEditingDisabled:(BOOL)a3
{
  self->_worksWhenEditingDisabled = a3;
}

- (BOOL)worksWithStylus
{
  return self->_worksWithStylus;
}

- (void)setWorksWithStylus:(BOOL)a3
{
  self->_worksWithStylus = a3;
}

- (BOOL)worksWhenInMediaBrowsingMode
{
  return self->_worksWhenInMediaBrowsingMode;
}

- (void)setWorksWhenInMediaBrowsingMode:(BOOL)a3
{
  self->_worksWhenInMediaBrowsingMode = a3;
}

- (BOOL)worksWithMultipleTaps
{
  return self->_worksWithMultipleTaps;
}

- (void)setWorksWithMultipleTaps:(BOOL)a3
{
  self->_worksWithMultipleTaps = a3;
}

- (BOOL)shouldDisplayDirectlyOverRep
{
  return self->_shouldDisplayDirectlyOverRep;
}

- (void)setShouldDisplayDirectlyOverRep:(BOOL)a3
{
  self->_shouldDisplayDirectlyOverRep = a3;
}

- (BOOL)wantsToFadeDuringZoom
{
  return self->_wantsToFadeDuringZoom;
}

- (void)setWantsToFadeDuringZoom:(BOOL)a3
{
  self->_wantsToFadeDuringZoom = a3;
}

- (CRLBezierPath)hitRegionPath
{
  return self->_hitRegionPath;
}

- (void)setWorksWhenDocumentIsSharedReadOnly:(BOOL)a3
{
  self->_worksWhenDocumentIsSharedReadOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hitRegionPath, 0);
  objc_destroyWeak((id *)&self->_rep);
  objc_storeStrong((id *)&self->_renderable, 0);
}

@end
