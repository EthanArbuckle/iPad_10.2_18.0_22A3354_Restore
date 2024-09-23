@implementation PXStoryTimeRangeValue

- (PXStoryTimeRangeValue)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTypes.m"), 87, CFSTR("%s is not available as initializer"), "-[PXStoryTimeRangeValue init]");

  abort();
}

- (PXStoryTimeRangeValue)initWithStoryTimeRange:(id *)a3
{
  PXStoryTimeRangeValue *result;
  __int128 v5;
  __int128 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXStoryTimeRangeValue;
  result = -[PXStoryTimeRangeValue init](&v7, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)&a3->var0.var0;
    v6 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&result->_storyTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&result->_storyTimeRange.start.epoch = v6;
    *(_OWORD *)&result->_storyTimeRange.start.value = v5;
  }
  return result;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)storyTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self->var1.var3;
  return self;
}

@end
