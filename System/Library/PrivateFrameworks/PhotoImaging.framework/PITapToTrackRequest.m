@implementation PITapToTrackRequest

- (PITapToTrackRequest)initWithComposition:(id)a3 startTime:(id *)a4 pointToTrack:(CGPoint)a5
{
  double y;
  double x;
  PITapToTrackRequest *v8;
  PITapToTrackRequest *v9;
  void *v10;
  void *v11;
  __int128 v13;
  int64_t var3;
  objc_super v15;
  _QWORD v16[2];

  y = a5.y;
  x = a5.x;
  v16[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)PITapToTrackRequest;
  v8 = -[NURenderRequest initWithComposition:](&v15, sel_initWithComposition_, a3);
  v9 = v8;
  if (v8)
  {
    v13 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    -[PITapToTrackRequest setStartTime:](v8, "setStartTime:", &v13);
    -[PITapToTrackRequest setNormalizedImagePoint:](v9, "setNormalizedImagePoint:", x, y);
    +[PIPipelineFilters sourceFilterNoOrientation](PIPipelineFilters, "sourceFilterNoOrientation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderRequest setPipelineFilters:](v9, "setPipelineFilters:", v11);

  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PITapToTrackRequest;
  v4 = -[NURenderRequest copyWithZone:](&v11, sel_copyWithZone_, a3);
  -[PITapToTrackRequest startTime](self, "startTime");
  v7 = v9;
  v8 = v10;
  objc_msgSend(v4, "setStartTime:", &v7);
  -[PITapToTrackRequest normalizedImagePoint](self, "normalizedImagePoint");
  objc_msgSend(v4, "setNormalizedImagePoint:");
  -[PITapToTrackRequest progressHandler](self, "progressHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProgressHandler:", v5);

  return v4;
}

- (id)newRenderJob
{
  PITapToTrackRenderJob *v3;
  void *v4;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v3 = -[NURenderJob initWithRequest:]([PITapToTrackRenderJob alloc], "initWithRequest:", self);
  -[PITapToTrackRequest startTime](self, "startTime");
  v6 = v8;
  v7 = v9;
  -[PITapToTrackRenderJob setStartTime:](v3, "setStartTime:", &v6);
  -[PITapToTrackRequest normalizedImagePoint](self, "normalizedImagePoint");
  -[PITapToTrackRenderJob setNormalizedImagePoint:](v3, "setNormalizedImagePoint:");
  -[PITapToTrackRequest progressHandler](self, "progressHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PITapToTrackRenderJob setProgressHandler:](v3, "setProgressHandler:", v4);

  return v3;
}

- (int64_t)mediaComponentType
{
  return 2;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 176);
  return self;
}

- (void)setStartTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_startTime.value = *(_OWORD *)&a3->var0;
  self->_startTime.epoch = var3;
}

- (CGPoint)normalizedImagePoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_normalizedImagePoint.x;
  y = self->_normalizedImagePoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setNormalizedImagePoint:(CGPoint)a3
{
  self->_normalizedImagePoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
}

@end
