@implementation TSDCanvasAnimation

- (TSDCanvasAnimation)initWithAnimationID:(id)a3 interactiveCanvasController:(id)a4 context:(void *)a5
{
  TSDCanvasAnimation *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSDCanvasAnimation;
  v8 = -[TSDCanvasAnimation init](&v10, sel_init);
  if (v8)
  {
    v8->_animationID = (NSString *)a3;
    v8->_context = a5;
    v8->_duration = 0.2;
    v8->_timingFunction = (CAMediaTimingFunction *)(id)objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
    v8->_allAnimationsFinishedBeforeStopping = 1;
    v8->_interactiveCanvasController = (TSDInteractiveCanvasController *)a4;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDCanvasAnimation;
  -[TSDCanvasAnimation dealloc](&v3, sel_dealloc);
}

- (double)beginTime
{
  NSDate *startDate;
  double v4;

  startDate = self->_startDate;
  if (startDate)
    -[NSDate timeIntervalSinceReferenceDate](startDate, "timeIntervalSinceReferenceDate");
  else
    v4 = 0.0;
  return v4 + self->_delay;
}

- (NSString)beginTimeMode
{
  NSString **v2;

  if (self->_startDate)
    v2 = (NSString **)MEMORY[0x24BDE5828];
  else
    v2 = (NSString **)MEMORY[0x24BDE5858];
  return *v2;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t (**filterBlock)(id, TSDCanvasAnimation *, id, id);
  BOOL v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  BOOL v18;
  BOOL v19;
  double v20;

  if (self->_firstAnimationDidStart)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCanvasAnimation actionForLayer:forKey:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasAnimation.m"), 116, CFSTR("shouldn't be adding animations after we've started showing them"));
  }
  v9 = (void *)objc_msgSend((id)-[TSUNoCopyDictionary objectForKeyedSubscript:](self->_animationDictionariesForLayers, "objectForKeyedSubscript:", a3), "objectForKeyedSubscript:", a4);
  filterBlock = (uint64_t (**)(id, TSDCanvasAnimation *, id, id))self->_filterBlock;
  if (filterBlock)
    v11 = v9 == 0;
  else
    v11 = 0;
  if (v11)
    v9 = (void *)filterBlock[2](filterBlock, self, a3, a4);
  if (v9)
    goto LABEL_35;
  if (self->_useRepFiltering && a3)
  {
    v12 = a3;
    while (1)
    {
      v13 = -[TSDInteractiveCanvasController repForLayer:](self->_interactiveCanvasController, "repForLayer:", v12);
      if (v13)
        break;
      v13 = -[TSDInteractiveCanvasController repForContainerLayer:](self->_interactiveCanvasController, "repForContainerLayer:", v12);
      if (v13)
        break;
      v12 = (id)objc_msgSend(v12, "superlayer");
      if (!v12)
        goto LABEL_34;
    }
    v14 = v13;
    v15 = v13;
    while (1)
    {
      v16 = (void *)TSUProtocolCast();
      v17 = v16;
      if (v16)
        v18 = v15 == v14;
      else
        v18 = 0;
      if (v18)
        v9 = (void *)objc_msgSend(v16, "animationForRepLayer:withEvent:", a3, a4);
      else
        v9 = 0;
      if (v17)
        v19 = v9 == 0;
      else
        v19 = 0;
      if (!v19)
        goto LABEL_32;
      if (v15 != v14 && (objc_opt_respondsToSelector() & 1) != 0)
        break;
LABEL_33:
      v15 = (id)objc_msgSend(v15, "parentRep");
      if (!v15)
        goto LABEL_34;
    }
    v9 = (void *)objc_msgSend(v17, "animationForChildRep:layer:withEvent:", v14, a3, a4);
LABEL_32:
    if (v9)
      goto LABEL_35;
    goto LABEL_33;
  }
LABEL_34:
  v9 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", a4);
  objc_msgSend(v9, "setDuration:", self->_duration);
  -[TSDCanvasAnimation beginTime](self, "beginTime");
  objc_msgSend(v9, "setBeginTime:");
  objc_msgSend(v9, "setBeginTimeMode:", -[TSDCanvasAnimation beginTimeMode](self, "beginTimeMode"));
  objc_msgSend(v9, "setTimingFunction:", self->_timingFunction);
  *(float *)&v20 = self->_repeatCount;
  objc_msgSend(v9, "setRepeatCount:", v20);
  objc_msgSend(v9, "setAutoreverses:", self->_repeatAutoreverses);
  objc_msgSend(v9, "setFillMode:", *MEMORY[0x24BDE5970]);
  if (v9)
  {
LABEL_35:
    objc_opt_class();
    if (TSUDynamicCast())
    {
      objc_msgSend(v9, "setDelegate:", self);
      ++self->_outstandingAnimationCount;
    }
  }
  return v9;
}

- (void)setAnimation:(id)a3 forLayer:(id)a4 forKey:(id)a5
{
  TSUNoCopyDictionary *animationDictionariesForLayers;
  void *v10;

  animationDictionariesForLayers = self->_animationDictionariesForLayers;
  if (!animationDictionariesForLayers)
  {
    animationDictionariesForLayers = (TSUNoCopyDictionary *)objc_alloc_init(MEMORY[0x24BEB3CB8]);
    self->_animationDictionariesForLayers = animationDictionariesForLayers;
  }
  v10 = (void *)-[TSUNoCopyDictionary objectForKeyedSubscript:](animationDictionariesForLayers, "objectForKeyedSubscript:", a4);
  if (!v10)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    -[TSUNoCopyDictionary setObject:forUncopiedKey:](self->_animationDictionariesForLayers, "setObject:forUncopiedKey:", v10, a4);
  }
  objc_msgSend(v10, "setObject:forKeyedSubscript:", a3, a5);
}

- (void)animationDidStart:(id)a3
{
  void *v4;
  uint64_t v5;
  const char *willStartSelector;

  if (!self->_outstandingAnimationCount)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCanvasAnimation animationDidStart:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasAnimation.m"), 219, CFSTR("unexpected animation started"));
  }
  if (!self->_firstAnimationDidStart)
  {
    self->_firstAnimationDidStart = 1;
    willStartSelector = self->_willStartSelector;
    if (willStartSelector)
      objc_msgSend(self->_delegate, willStartSelector, self->_animationID, self->_context);
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unsigned int outstandingAnimationCount;
  BOOL v11;
  unsigned int v12;
  const char *didStopSelector;
  void (**completionBlock)(void);

  if (!self->_outstandingAnimationCount)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCanvasAnimation animationDidStop:finished:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasAnimation.m"), 234, CFSTR("unexpected animation stopped"));
  }
  if (!self->_firstAnimationDidStart)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCanvasAnimation animationDidStop:finished:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasAnimation.m"), 235, CFSTR("animation stopped before starting"));
  }
  outstandingAnimationCount = self->_outstandingAnimationCount;
  v11 = self->_allAnimationsFinishedBeforeStopping || a4;
  self->_allAnimationsFinishedBeforeStopping = v11;
  v12 = outstandingAnimationCount - 1;
  self->_outstandingAnimationCount = v12;
  if (!v12)
  {
    didStopSelector = self->_didStopSelector;
    if (didStopSelector)
      objc_msgSend(self->_delegate, didStopSelector, self->_animationID, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:"), self->_context);
    completionBlock = (void (**)(void))self->_completionBlock;
    if (completionBlock)
      completionBlock[2]();
  }
}

- (NSString)animationID
{
  return self->_animationID;
}

- (void)context
{
  return self->_context;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (SEL)willStartSelector
{
  return self->_willStartSelector;
}

- (void)setWillStartSelector:(SEL)a3
{
  self->_willStartSelector = a3;
}

- (SEL)didStopSelector
{
  return self->_didStopSelector;
}

- (void)setDidStopSelector:(SEL)a3
{
  self->_didStopSelector = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (float)repeatCount
{
  return self->_repeatCount;
}

- (void)setRepeatCount:(float)a3
{
  self->_repeatCount = a3;
}

- (BOOL)repeatAutoreverses
{
  return self->_repeatAutoreverses;
}

- (void)setRepeatAutoreverses:(BOOL)a3
{
  self->_repeatAutoreverses = a3;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)filterBlock
{
  return self->_filterBlock;
}

- (void)setFilterBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)useRepFiltering
{
  return self->_useRepFiltering;
}

- (void)setUseRepFiltering:(BOOL)a3
{
  self->_useRepFiltering = a3;
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

@end
