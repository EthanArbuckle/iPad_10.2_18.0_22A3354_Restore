@implementation PXDisplayAssetVideoContentDeliveryStrategy

- (PXDisplayAssetVideoContentDeliveryStrategy)init
{
  PXDisplayAssetVideoContentDeliveryStrategy *result;
  uint64_t v3;
  __int128 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXDisplayAssetVideoContentDeliveryStrategy;
  result = -[PXDisplayAssetVideoContentDeliveryStrategy init](&v5, sel_init);
  if (result)
  {
    v3 = MEMORY[0x1E0CA2E40];
    v4 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    *(_OWORD *)&result->_segmentTimeRange.start.value = *MEMORY[0x1E0CA2E40];
    *(_OWORD *)&result->_segmentTimeRange.start.epoch = v4;
    *(_OWORD *)&result->_segmentTimeRange.duration.timescale = *(_OWORD *)(v3 + 32);
    *(_WORD *)&result->_isNetworkAccessAllowed = 257;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  _OWORD v6[6];

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[PXDisplayAssetVideoContentDeliveryStrategy segmentTimeRange](self, "segmentTimeRange");
  v6[0] = v6[3];
  v6[1] = v6[4];
  v6[2] = v6[5];
  objc_msgSend(v4, "setSegmentTimeRange:", v6);
  objc_msgSend(v4, "setIsStreamingAllowed:", -[PXDisplayAssetVideoContentDeliveryStrategy isStreamingAllowed](self, "isStreamingAllowed"));
  objc_msgSend(v4, "setIsNetworkAccessAllowed:", -[PXDisplayAssetVideoContentDeliveryStrategy isNetworkAccessAllowed](self, "isNetworkAccessAllowed"));
  objc_msgSend(v4, "setQuality:", -[PXDisplayAssetVideoContentDeliveryStrategy quality](self, "quality"));
  objc_msgSend(v4, "setIsAudioAllowed:", -[PXDisplayAssetVideoContentDeliveryStrategy isAudioAllowed](self, "isAudioAllowed"));
  -[PXDisplayAssetVideoContentDeliveryStrategy targetSize](self, "targetSize");
  objc_msgSend(v4, "setTargetSize:");
  return v4;
}

- (NSString)identifier
{
  __CFString *v3;
  id v5;
  void *v6;
  _BYTE v7[48];
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;

  -[PXDisplayAssetVideoContentDeliveryStrategy segmentTimeRange](self, "segmentTimeRange");
  if ((v11 & 1) == 0
    || (-[PXDisplayAssetVideoContentDeliveryStrategy segmentTimeRange](self, "segmentTimeRange"), (v10 & 1) == 0)
    || (-[PXDisplayAssetVideoContentDeliveryStrategy segmentTimeRange](self, "segmentTimeRange"), v9)
    || (-[PXDisplayAssetVideoContentDeliveryStrategy segmentTimeRange](self, "segmentTimeRange"), v8 < 0))
  {
    v3 = CFSTR("All");
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[PXDisplayAssetVideoContentDeliveryStrategy segmentTimeRange](self, "segmentTimeRange");
    PXCMTimeRangeDescription((uint64_t)v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (__CFString *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@"), v6);

  }
  return (NSString *)v3;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  _BYTE v18[48];
  objc_super v19;
  NSSize v20;

  v19.receiver = self;
  v19.super_class = (Class)PXDisplayAssetVideoContentDeliveryStrategy;
  -[PXDisplayAssetVideoContentDeliveryStrategy description](&v19, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXDisplayAssetVideoContentDeliveryStrategy quality](self, "quality");
  if (v4 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *PXVideoContentDeliveryQualityDescription(PXVideoContentDeliveryQuality)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXDisplayAssetVideoContentProvider.m"), 688, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v5 = off_1E5115898[v4];
  -[PXDisplayAssetVideoContentDeliveryStrategy segmentTimeRange](self, "segmentTimeRange");
  PXCMTimeRangeDescription((uint64_t)v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXDisplayAssetVideoContentDeliveryStrategy isStreamingAllowed](self, "isStreamingAllowed"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = v7;
  if (-[PXDisplayAssetVideoContentDeliveryStrategy isNetworkAccessAllowed](self, "isNetworkAccessAllowed"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v10 = v9;
  if (-[PXDisplayAssetVideoContentDeliveryStrategy isAudioAllowed](self, "isAudioAllowed"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v12 = v11;
  -[PXDisplayAssetVideoContentDeliveryStrategy targetSize](self, "targetSize");
  NSStringFromSize(v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("quality: %@, segment:%@, streaming:%@, network:%@, audio:%@, targetSize:%@"), v5, v6, v8, v10, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (int64_t)quality
{
  return self->_quality;
}

- (void)setQuality:(int64_t)a3
{
  self->_quality = a3;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)segmentTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var0;
  return self;
}

- (void)setSegmentTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_segmentTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_segmentTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_segmentTimeRange.start.value = v3;
}

- (BOOL)isStreamingAllowed
{
  return self->_isStreamingAllowed;
}

- (void)setIsStreamingAllowed:(BOOL)a3
{
  self->_isStreamingAllowed = a3;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_isNetworkAccessAllowed;
}

- (void)setIsNetworkAccessAllowed:(BOOL)a3
{
  self->_isNetworkAccessAllowed = a3;
}

- (BOOL)isAudioAllowed
{
  return self->_isAudioAllowed;
}

- (void)setIsAudioAllowed:(BOOL)a3
{
  self->_isAudioAllowed = a3;
}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

+ (id)defaultStreamingMediumQualityStrategy
{
  PXDisplayAssetVideoContentDeliveryStrategy *v2;

  v2 = objc_alloc_init(PXDisplayAssetVideoContentDeliveryStrategy);
  -[PXDisplayAssetVideoContentDeliveryStrategy setIsStreamingAllowed:](v2, "setIsStreamingAllowed:", 1);
  -[PXDisplayAssetVideoContentDeliveryStrategy setQuality:](v2, "setQuality:", 3);
  return v2;
}

@end
