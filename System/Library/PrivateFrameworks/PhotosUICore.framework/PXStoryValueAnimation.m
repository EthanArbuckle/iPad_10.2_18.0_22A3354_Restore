@implementation PXStoryValueAnimation

- (PXStoryValueAnimation)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryValueAnimation.m"), 16, CFSTR("%s is not available as initializer"), "-[PXStoryValueAnimation init]");

  abort();
}

- (PXStoryValueAnimation)initWithIdentifier:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryValueAnimation.m"), 20, CFSTR("%s is not available as initializer"), "-[PXStoryValueAnimation initWithIdentifier:]");

  abort();
}

- (PXStoryValueAnimation)initWithDuration:(id *)a3 curveInfo:(id)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v5 = *a3;
  return -[PXStoryValueAnimation initWithIdentifier:duration:curveInfo:](self, "initWithIdentifier:duration:curveInfo:", 0, &v5, a4.var0, *(_QWORD *)&a4.var1.var0);
}

- (PXStoryValueAnimation)initWithIdentifier:(id)a3 duration:(id *)a4 curveInfo:(id)a5
{
  double var0;
  int64_t v6;
  PXStoryValueAnimation *result;
  int64_t var3;
  objc_super v10;

  var0 = a5.var1.var0;
  v6 = a5.var0;
  v10.receiver = self;
  v10.super_class = (Class)PXStoryValueAnimation;
  result = -[PXStoryAnimation initWithIdentifier:](&v10, sel_initWithIdentifier_, a3);
  if (result)
  {
    var3 = a4->var3;
    *(_OWORD *)&result->_duration.value = *(_OWORD *)&a4->var0;
    result->_duration.epoch = var3;
    result->_curveInfo.curve = v6;
    result->_curveInfo.var0.linearFraction = var0;
  }
  return result;
}

- (void)timeDidChange
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CMTime v6;
  CMTime v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXStoryValueAnimation;
  -[PXStoryAnimation timeDidChange](&v8, sel_timeDidChange);
  v3 = -[PXStoryValueAnimation curveInfo](self, "curveInfo");
  v5 = v4;
  -[PXStoryAnimation time](self, "time");
  -[PXStoryValueAnimation duration](self, "duration");
  -[PXStoryValueAnimation updateCurrentValueWithProgress:](self, "updateCurrentValueWithProgress:", PXStoryAnimationCurveGetProgress(v3, v5, &v7, &v6));
}

- (void)updateCurrentValueWithProgress:(double)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryValueAnimation.m"), 44, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXStoryValueAnimation updateCurrentValueWithProgress:]", v7);

  abort();
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[10];
  return self;
}

- ($254463E2FCBF5225EA52A947D3E781DA)curveInfo
{
  $2DF458573A8E2682920A9B23708C268E *p_curveInfo;
  int64_t curve;
  $E7D8D66E68FE3EA1565FCDA637AA70FF v4;
  $254463E2FCBF5225EA52A947D3E781DA result;

  p_curveInfo = &self->_curveInfo;
  curve = self->_curveInfo.curve;
  v4.var0 = p_curveInfo->var0.linearFraction;
  result.var1 = v4;
  result.var0 = curve;
  return result;
}

@end
