@implementation KNAnimationPluginContext

- (void)dealloc
{
  objc_super v3;

  self->_metalContext = 0;
  v3.receiver = self;
  v3.super_class = (Class)KNAnimationPluginContext;
  -[KNAnimationPluginContext dealloc](&v3, "dealloc");
}

- (BOOL)isBuild
{
  int64_t v2;

  v2 = -[KNAnimationPluginContext rendererType](self, "rendererType");
  if ((unint64_t)(v2 - 1) < 2)
    return 1;
  if (v2)
  {
    if (v2 == 10)
      return 1;
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimationPluginContext isBuild]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimationPluginContext.m"), 52, CFSTR("Unknown type!"));
  }
  return 0;
}

- (BOOL)isTransition
{
  return !-[KNAnimationPluginContext isBuild](self, "isBuild");
}

- (BOOL)isMagicMove
{
  int64_t v2;

  v2 = -[KNAnimationPluginContext rendererType](self, "rendererType");
  if ((unint64_t)(v2 - 7) < 2)
    return 1;
  if (!v2)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimationPluginContext isMagicMove]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimationPluginContext.m"), 84, CFSTR("Unknown type!"));
  return 0;
}

- (BOOL)isFrameRenderer
{
  unint64_t v2;
  BOOL result;

  v2 = -[KNAnimationPluginContext rendererType](self, "rendererType");
  result = 0;
  if (v2 <= 0xA)
  {
    if (((1 << v2) & 0x754) != 0)
    {
      return 1;
    }
    else if (!v2)
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimationPluginContext isFrameRenderer]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimationPluginContext.m"), 111, CFSTR("Unknown type!"));
      return 0;
    }
  }
  return result;
}

- (BOOL)isMetalRenderer
{
  int64_t v2;

  v2 = -[KNAnimationPluginContext rendererType](self, "rendererType");
  if ((unint64_t)(v2 - 9) < 2)
    return 1;
  if (!v2)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimationPluginContext isMetalRenderer]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimationPluginContext.m"), 135, CFSTR("Unknown type!"));
  return 0;
}

- (NSString)description
{
  id v3;
  const __CFString *v4;
  NSArray *v5;
  const __CFString *v6;
  uint64_t v7;
  objc_super v9;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  if (-[KNAnimationPluginContext isBuild](self, "isBuild"))
    v4 = CFSTR("isBuild");
  else
    v4 = CFSTR("isTransition");
  objc_msgSend(v3, "addObject:", v4);
  if (-[KNAnimationPluginContext isMagicMove](self, "isMagicMove"))
    objc_msgSend(v3, "addObject:", CFSTR("isMagicMove"));
  if (-[KNAnimationPluginContext isMagicMove](self, "isMagicMove"))
  {
    v5 = -[KNAnimationPluginContext magicMoveMatches](self, "magicMoveMatches");
    v6 = CFSTR("magicMoveMatches:%ld");
  }
  else
  {
    v5 = -[KNAnimationPluginContext textures](self, "textures");
    v6 = CFSTR("textures:%ld");
  }
  objc_msgSend(v3, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, -[NSArray count](v5, "count")));
  if (-[KNAnimationPluginContext isFrameRenderer](self, "isFrameRenderer"))
  {
    -[KNAnimationPluginContext percent](self, "percent");
    objc_msgSend(v3, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("percent:%0.3f"), v7));
  }
  v9.receiver = self;
  v9.super_class = (Class)KNAnimationPluginContext;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: {%@}"), -[KNAnimationPluginContext description](&v9, "description"), objc_msgSend(v3, "componentsJoinedByString:", CFSTR(",")));
}

- (KNAnimationRandomGenerator)randomGenerator
{
  KNAnimationRandomGenerator *result;
  _QWORD block[5];

  if (qword_543158 != -1)
    dispatch_once(&qword_543158, &stru_4275C0);
  result = self->_randomGenerator;
  if (!result)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_2710C;
    block[3] = &unk_426DD0;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)qword_543150, block);
    result = self->_randomGenerator;
    if (!result)
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimationPluginContext randomGenerator]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimationPluginContext.m"), 222, CFSTR("invalid nil value for '%s'"), "_randomGenerator");
      return self->_randomGenerator;
    }
  }
  return result;
}

- (KNAnimatedBuild)animatedBuild
{
  return self->_animatedBuild;
}

- (void)setAnimatedBuild:(id)a3
{
  self->_animatedBuild = (KNAnimatedBuild *)a3;
}

- (NSArray)magicMoveMatches
{
  return self->_magicMoveMatches;
}

- (void)setMagicMoveMatches:(id)a3
{
  self->_magicMoveMatches = (NSArray *)a3;
}

- (double)percent
{
  return self->_percent;
}

- (void)setPercent:(double)a3
{
  self->_percent = a3;
}

- (NSArray)textures
{
  return self->_textures;
}

- (void)setTextures:(id)a3
{
  self->_textures = (NSArray *)a3;
}

- (NSDictionary)transitionAttributes
{
  return self->_transitionAttributes;
}

- (void)setTransitionAttributes:(id)a3
{
  self->_transitionAttributes = (NSDictionary *)a3;
}

- (BOOL)isMotionBlurred
{
  return self->_isMotionBlurred;
}

- (void)setIsMotionBlurred:(BOOL)a3
{
  self->_isMotionBlurred = a3;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(unint64_t)a3
{
  self->_direction = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)isWarmingUp
{
  return self->_isWarmingUp;
}

- (void)setIsWarmingUp:(BOOL)a3
{
  self->_isWarmingUp = a3;
}

- (TSDMetalContext)metalContext
{
  return self->_metalContext;
}

- (void)setMetalContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CGRect)drawableFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_drawableFrame.origin.x;
  y = self->_drawableFrame.origin.y;
  width = self->_drawableFrame.size.width;
  height = self->_drawableFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setDrawableFrame:(CGRect)a3
{
  self->_drawableFrame = a3;
}

- (CGRect)animationFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_animationFrame.origin.x;
  y = self->_animationFrame.origin.y;
  width = self->_animationFrame.size.width;
  height = self->_animationFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAnimationFrame:(CGRect)a3
{
  self->_animationFrame = a3;
}

- (int64_t)rendererType
{
  return self->_rendererType;
}

- (void)setRendererType:(int64_t)a3
{
  self->_rendererType = a3;
}

@end
