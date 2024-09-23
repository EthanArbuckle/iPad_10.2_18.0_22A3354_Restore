@implementation PIDisparitySampleRequest

- (PIDisparitySampleRequest)initWithComposition:(id)a3 time:(id *)a4 sampleRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  PIDisparitySampleRequest *v10;
  PIDisparitySampleRequest *v11;
  void *v12;
  void *v13;
  __int128 v15;
  int64_t var3;
  objc_super v17;
  _QWORD v18[2];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v18[1] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)PIDisparitySampleRequest;
  v10 = -[NURenderRequest initWithComposition:](&v17, sel_initWithComposition_, a3);
  v11 = v10;
  if (v10)
  {
    v15 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    -[PIDisparitySampleRequest setSampleTime:](v10, "setSampleTime:", &v15);
    -[PIDisparitySampleRequest setSampleRect:](v11, "setSampleRect:", x, y, width, height);
    +[PIPipelineFilters sourceFilterNoOrientation](PIPipelineFilters, "sourceFilterNoOrientation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderRequest setPipelineFilters:](v11, "setPipelineFilters:", v13);

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PIDisparitySampleRequest;
  v4 = -[NURenderRequest copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[PIDisparitySampleRequest sampleTime](self, "sampleTime");
  v6 = v8;
  v7 = v9;
  objc_msgSend(v4, "setSampleTime:", &v6);
  -[PIDisparitySampleRequest sampleRect](self, "sampleRect");
  objc_msgSend(v4, "setSampleRect:");
  return v4;
}

- (id)newRenderJob
{
  PIDisparitySampleJob *v3;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v3 = -[NURenderJob initWithRequest:]([PIDisparitySampleJob alloc], "initWithRequest:", self);
  -[PIDisparitySampleRequest sampleTime](self, "sampleTime");
  v5 = v7;
  v6 = v8;
  -[PIDisparitySampleJob setSampleTime:](v3, "setSampleTime:", &v5);
  -[PIDisparitySampleRequest sampleRect](self, "sampleRect");
  -[PIDisparitySampleJob setSampleRect:](v3, "setSampleRect:");
  return v3;
}

- (int64_t)mediaComponentType
{
  return 2;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sampleTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 152);
  return self;
}

- (void)setSampleTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_sampleTime.value = *(_OWORD *)&a3->var0;
  self->_sampleTime.epoch = var3;
}

- (CGRect)sampleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sampleRect.origin.x;
  y = self->_sampleRect.origin.y;
  width = self->_sampleRect.size.width;
  height = self->_sampleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSampleRect:(CGRect)a3
{
  self->_sampleRect = a3;
}

@end
