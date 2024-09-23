@implementation _PXStoryConcreteCompanionTimelineSegmentTransition

- (_PXStoryConcreteCompanionTimelineSegmentTransition)initWithTransitionInfo:(id *)a3
{
  _PXStoryConcreteCompanionTimelineSegmentTransition *result;
  __int128 v5;
  __int128 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_PXStoryConcreteCompanionTimelineSegmentTransition;
  result = -[_PXStoryConcreteCompanionTimelineSegmentTransition init](&v7, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)&a3->var0;
    v6 = *(_OWORD *)&a3->var2.var1;
    *(_QWORD *)&result->_transitionInfo.fallbackFromTransitionKind = *(_QWORD *)&a3->var3;
    *(_OWORD *)&result->_transitionInfo.duration.timescale = v6;
    *(_OWORD *)&result->_transitionInfo.orderOutTransition = v5;
  }
  return result;
}

- (int64_t)kind
{
  unsigned __int8 v3;

  -[_PXStoryConcreteCompanionTimelineSegmentTransition transitionInfo](self, "transitionInfo");
  if (v3 > 0xAuLL)
    return 0;
  else
    return qword_1A7C09B10[v3];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  result = -[_PXStoryConcreteCompanionTimelineSegmentTransition transitionInfo](self, "transitionInfo");
  *retstr = v5;
  return result;
}

- ($C63E51281545771083DD8F52DBD4F646)transitionInfo
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var2.var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var2.var0;
  *(_OWORD *)&retstr->var2.var1 = v3;
  *(double *)&retstr->var3 = self->var5.var0;
  return self;
}

@end
