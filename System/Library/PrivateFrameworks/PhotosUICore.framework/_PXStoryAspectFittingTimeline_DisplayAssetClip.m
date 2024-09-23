@implementation _PXStoryAspectFittingTimeline_DisplayAssetClip

- (unint64_t)orientation
{
  void *v2;
  double v3;
  uint64_t v4;
  unint64_t v5;

  -[_PXStoryAspectFittingTimeline_DisplayAssetClip displayAsset](self, "displayAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aspectRatio");
  v4 = 3;
  if (v3 < 1.0)
    v4 = 1;
  if (v3 <= 1.0)
    v5 = v4;
  else
    v5 = 2;

  return v5;
}

- (int64_t)compareByClipFrameOriginX:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  int64_t v8;
  double v9;
  double v10;
  double v11;

  v4 = a3;
  -[_PXStoryAspectFittingTimeline_DisplayAssetClip clipFrame](self, "clipFrame");
  v6 = v5;
  objc_msgSend(v4, "clipFrame");
  if (v6 >= v7)
  {
    -[_PXStoryAspectFittingTimeline_DisplayAssetClip clipFrame](self, "clipFrame");
    v10 = v9;
    objc_msgSend(v4, "clipFrame");
    v8 = v10 > v11;
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

- (int64_t)compareByClipFrameOriginY:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  int64_t v8;
  double v9;
  double v10;
  double v11;

  v4 = a3;
  -[_PXStoryAspectFittingTimeline_DisplayAssetClip clipFrame](self, "clipFrame");
  v6 = v5;
  objc_msgSend(v4, "clipFrame");
  if (v6 >= v7)
  {
    -[_PXStoryAspectFittingTimeline_DisplayAssetClip clipFrame](self, "clipFrame");
    v10 = v9;
    objc_msgSend(v4, "clipFrame");
    v8 = v10 > v11;
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)clipTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var1.var0;
  return self;
}

- (void)setClipTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_clipTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_clipTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_clipTimeRange.start.value = v3;
}

- (CGRect)clipFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clipFrame.origin.x;
  y = self->_clipFrame.origin.y;
  width = self->_clipFrame.size.width;
  height = self->_clipFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClipFrame:(CGRect)a3
{
  self->_clipFrame = a3;
}

- ($C99EDD0FAA5CC172DE20AC79C6A499CF)clipInfo
{
  return ($C99EDD0FAA5CC172DE20AC79C6A499CF *)memcpy(retstr, &self->_clipInfo, 0x300uLL);
}

- (void)setClipInfo:(id *)a3
{
  memcpy(&self->_clipInfo, a3, 0x300uLL);
}

- (PXDisplayAsset)displayAsset
{
  return self->_displayAsset;
}

- (void)setDisplayAsset:(id)a3
{
  objc_storeStrong((id *)&self->_displayAsset, a3);
}

- (CGRect)transformedFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_transformedFrame.origin.x;
  y = self->_transformedFrame.origin.y;
  width = self->_transformedFrame.size.width;
  height = self->_transformedFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTransformedFrame:(CGRect)a3
{
  self->_transformedFrame = a3;
}

- (double)weight
{
  return self->_weight;
}

- (void)setWeight:(double)a3
{
  self->_weight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayAsset, 0);
}

@end
