@implementation THWTransportControlRep

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWTransportControlRep;
  -[THWTransportControlRep dealloc](&v3, "dealloc");
}

- (void)wasAddedToParent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWTransportControlRep;
  -[THWTransportControlRep wasAddedToParent](&v3, "wasAddedToParent");
  -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, "transportControlCloneDidUpdateState:", CFSTR("kTSWTransportControlCloneDidUpdateNotification"), 0);
}

- (void)willBeRemovedFromParent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWTransportControlRep;
  -[THWTransportControlRep willBeRemovedFromParent](&v3, "willBeRemovedFromParent");
  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CFSTR("kTSWTransportControlCloneDidUpdateNotification"), 0);
}

- (void)updateFromLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWTransportControlRep;
  -[THWTransportControlRep updateFromLayout](&v3, "updateFromLayout");
  if (!self->_backgroundLayer)
  {
    self->_backgroundLayer = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    -[CALayer setDelegate:](self->_backgroundLayer, "setDelegate:", -[THWTransportControlRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(-[THWTransportControlRep canvas](self, "canvas"), "contentsScale");
    -[CALayer setContentsScale:](self->_backgroundLayer, "setContentsScale:");
    -[THWTransportControlRep p_updateBackgroundLayerContent](self, "p_updateBackgroundLayerContent");
  }
}

- (void)p_updateBackgroundLayerContent
{
  id v3;
  double v4;
  double v5;

  v3 = +[TSUImage imageNamed:inBundle:](TSUImage, "imageNamed:inBundle:", CFSTR("THKN_control_bg-fill"), THBundle());
  objc_msgSend(-[THWTransportControlRep canvas](self, "canvas"), "contentsScale");
  v5 = v4;
  -[CALayer setContents:](self->_backgroundLayer, "setContents:", objc_msgSend(v3, "CGImageForContentsScale:"));
  -[CALayer setContentsScale:](self->_backgroundLayer, "setContentsScale:", v5);
}

- (void)screenScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWTransportControlRep;
  -[THWTransportControlRep screenScaleDidChange](&v3, "screenScaleDidChange");
  -[THWTransportControlRep p_updateBackgroundLayerContent](self, "p_updateBackgroundLayerContent");
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  CALayer *backgroundLayer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THWTransportControlRep;
  -[THWTransportControlRep addAdditionalChildLayersToArray:](&v6, "addAdditionalChildLayersToArray:");
  -[THWTransportControlRep convertNaturalRectToLayerRelative:](self, "convertNaturalRectToLayerRelative:", TSDRectWithSize(objc_msgSend(-[THWTransportControlRep layout](self, "layout"), "frame")));
  backgroundLayer = self->_backgroundLayer;
  if (backgroundLayer)
  {
    -[CALayer setFrame:](backgroundLayer, "setFrame:");
    objc_msgSend(a3, "insertObject:atIndex:", self->_backgroundLayer, 0);
  }
}

- (void)buttonControlWasPressed:(id)a3
{
  char *v4;

  v4 = (char *)objc_msgSend(objc_msgSend(a3, "layout"), "tag");
  if (v4 == (_BYTE *)&dword_0 + 2)
  {
    -[TSWTransportControlClone transportControlCloneGotoNext](-[THWTransportControlRep clone](self, "clone"), "transportControlCloneGotoNext");
  }
  else if (v4 == (_BYTE *)&dword_0 + 1)
  {
    -[TSWTransportControlClone transportControlCloneGotoPrev](-[THWTransportControlRep clone](self, "clone"), "transportControlCloneGotoPrev");
  }
  else if (!v4)
  {
    -[TSWTransportControlClone transportControlCloneGotoFirst](-[THWTransportControlRep clone](self, "clone"), "transportControlCloneGotoFirst");
  }
}

- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  const __CFString *v8;
  id result;

  v5 = a5;
  v7 = objc_msgSend(objc_msgSend(a3, "layout"), "tag");
  if ((unint64_t)v7 > 2)
    goto LABEL_7;
  v8 = CFSTR("_N");
  if (v5)
    v8 = CFSTR("_P");
  if (a4 == 2)
    v8 = CFSTR("_D");
  result = +[TSUImage imageNamed:inBundle:](TSUImage, "imageNamed:inBundle:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), *(&off_42A4F0 + (_QWORD)v7), v8), THBundle());
  if (!result)
  {
LABEL_7:
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWTransportControlRep buttonControl:imageForState:highlighted:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/THWTransportControlRep.m"), 170, CFSTR("invalid nil value for '%s'"), "image");
    return 0;
  }
  return result;
}

- (int)buttonControlState:(id)a3
{
  char *v4;
  unsigned int v5;

  v4 = (char *)objc_msgSend(objc_msgSend(a3, "layout"), "tag");
  if (v4 == (_BYTE *)&dword_0 + 2)
  {
    v5 = -[TSWTransportControlClone transportControlCloneCanGotoNext](-[THWTransportControlRep clone](self, "clone"), "transportControlCloneCanGotoNext");
  }
  else if (v4 == (_BYTE *)&dword_0 + 1)
  {
    v5 = -[TSWTransportControlClone transportControlCloneCanGotoPrev](-[THWTransportControlRep clone](self, "clone"), "transportControlCloneCanGotoPrev");
  }
  else
  {
    if (v4)
      return 0;
    v5 = -[TSWTransportControlClone transportControlCloneCanGotoFirst](-[THWTransportControlRep clone](self, "clone"), "transportControlCloneCanGotoFirst");
  }
  if (v5)
    return 0;
  else
    return 2;
}

- (id)stringForLabelControl:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu/%lu"), (char *)-[TSWTransportControlClone transportControlCloneIndex](-[THWTransportControlRep clone](self, "clone", a3), "transportControlCloneIndex")+ 1, -[TSWTransportControlClone transportControlCloneCount](-[THWTransportControlRep clone](self, "clone"), "transportControlCloneCount"));
}

- (id)fontNameForLabelControl:(id)a3
{
  return objc_msgSend(+[TSUFont boldSystemFontOfSize:](TSUFont, "boldSystemFontOfSize:", a3, 12.0), "fontName");
}

- (double)fontSizeForLabelControl:(id)a3
{
  return 12.0;
}

- (id)textColorForLabelControl:(id)a3
{
  return +[TSUColor whiteColor](TSUColor, "whiteColor", a3);
}

- (int)horizontaAlignmentForLabelControl:(id)a3
{
  return 1;
}

- (int)verticalAlignmentForLabelControl:(id)a3
{
  return 1;
}

- (id)shadowForLabelControl:(id)a3
{
  return +[TSDShadow shadowWithAngle:offset:radius:opacity:color:enabled:](TSDShadow, "shadowWithAngle:offset:radius:opacity:color:enabled:", objc_msgSend(+[TSUColor blackColor](TSUColor, "blackColor", a3), "CGColor"), 1, -90.0, 1.0, 0.0, 1.0);
}

- (void)transportControlCloneDidUpdateState:(id)a3
{
  TSWTransportControlClone *v4;

  v4 = (TSWTransportControlClone *)objc_msgSend(a3, "object");
  if (v4 == -[THWTransportControlRep clone](self, "clone"))
    -[THWTransportControlRep p_updateControlStates](self, "p_updateControlStates");
}

- (TSWTransportControlClone)clone
{
  TSWTransportControlClone *v2;

  v2 = (TSWTransportControlClone *)objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___THWTransportControlParent, -[THWTransportControlRep parentRep](self, "parentRep")), "cloneForTransportControl:", self);
  if (!v2)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWTransportControlRep clone]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/THWTransportControlRep.m"), 260, CFSTR("invalid nil value for '%s'"), "clone");
  return v2;
}

- (void)p_updateControlStates
{
  objc_msgSend(-[THWTransportControlRep layout](self, "layout"), "invalidateControls");
}

- (CALayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 280);
}

@end
