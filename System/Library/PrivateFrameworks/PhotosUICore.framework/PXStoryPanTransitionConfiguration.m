@implementation PXStoryPanTransitionConfiguration

- (PXStoryPanTransitionConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTransition.m"), 562, CFSTR("%s is not available as initializer"), "-[PXStoryPanTransitionConfiguration init]");

  abort();
}

- (PXStoryPanTransitionConfiguration)initWithDuration:(id *)a3
{
  PXStoryPanTransitionConfiguration *result;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXStoryPanTransitionConfiguration;
  result = -[PXStoryPanTransitionConfiguration init](&v6, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)&a3->var0;
    result->_duration.epoch = a3->var3;
    *(_OWORD *)&result->_duration.value = v5;
  }
  return result;
}

- (NSString)identifier
{
  return (NSString *)_PXStoryIdentifierFromClipLayouts();
}

- (void)addClipLayout:(id)a3 sourceRect:(CGRect)a4 targetRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  id v14;
  NSMutableArray *clipLayouts;
  NSMutableArray *v16;
  NSMutableArray *v17;
  int64_t capacity;
  int64_t count;
  int v20;
  CGRect *targetRects;
  CGRect *v22;
  CGFloat *p_x;
  int64_t v24;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.size.height;
  v10 = a4.size.width;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  v14 = a3;
  clipLayouts = self->_clipLayouts;
  if (!clipLayouts)
  {
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = self->_clipLayouts;
    self->_clipLayouts = v16;

    clipLayouts = self->_clipLayouts;
  }
  -[NSMutableArray addObject:](clipLayouts, "addObject:", v14);
  capacity = self->_capacity;
  count = self->_count;
  self->_count = count + 1;
  v24 = capacity;
  v20 = _PXGArrayCapacityResizeToCount();
  self->_capacity = v24;
  if (v20)
  {
    _PXGArrayResize();
    _PXGArrayResize();
  }
  targetRects = self->_targetRects;
  v22 = &self->_sourceRects[count];
  v22->origin.x = v12;
  v22->origin.y = v11;
  v22->size.width = v10;
  v22->size.height = v9;
  p_x = &targetRects[count].origin.x;
  *p_x = x;
  p_x[1] = y;
  p_x[2] = width;
  p_x[3] = height;

}

- (void)enumerateLayoutsUsingBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *, double, double, double, double, double, double, double, double);
  uint64_t v5;
  int64_t v6;
  void *v7;
  CGRect *v8;
  char v9;

  v4 = (void (**)(id, void *, _BYTE *, double, double, double, double, double, double, double, double))a3;
  v9 = 0;
  if (self->_count >= 1)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_clipLayouts, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = &self->_sourceRects[v5];
      v4[2](v4, v7, &v9, v8->origin.x, v8->origin.y, v8->size.width, v8->size.height, self->_targetRects[v5].origin.x, self->_targetRects[v5].origin.y, self->_targetRects[v5].size.width, self->_targetRects[v5].size.height);

      if (v9)
        break;
      ++v6;
      ++v5;
    }
    while (v6 < self->_count);
  }

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipLayouts, 0);
}

@end
