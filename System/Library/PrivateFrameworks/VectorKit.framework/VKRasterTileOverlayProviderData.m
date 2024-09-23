@implementation VKRasterTileOverlayProviderData

- (VKRasterTileOverlayProviderData)initWithProviderID:(unsigned int)a3 tileSize:(unsigned int)a4 minimumZ:(unsigned int)a5 maximumZ:(unsigned int)a6 keyframesCount:(unsigned __int16)a7 duration:(double)a8 crossfadeKeyframes:(BOOL)a9
{
  char *v16;
  VKRasterTileOverlayProviderData *v17;
  VKRasterTileOverlayProviderData *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)VKRasterTileOverlayProviderData;
  v16 = -[VKRasterTileOverlayProviderData init](&v20, sel_init);
  v17 = (VKRasterTileOverlayProviderData *)v16;
  if (v16)
  {
    *((_DWORD *)v16 + 6) = a3;
    *((_DWORD *)v16 + 7) = a4;
    *((_DWORD *)v16 + 8) = a5;
    *((_DWORD *)v16 + 9) = a6;
    *((_WORD *)v16 + 20) = a7;
    *((double *)v16 + 6) = a8;
    v16[56] = a9;
    *(_QWORD *)(v16 + 60) = 0xFFFFFFFFLL;
    *((_QWORD *)v16 + 2) = 0x3FF0000000000000;
    *((_QWORD *)v16 + 12) = 0;
    *((_QWORD *)v16 + 9) = 0;
    *((_QWORD *)v16 + 10) = 0;
    *((_DWORD *)v16 + 22) = 0;
    *((_DWORD *)v16 + 26) = 1065353216;
    v16[108] = 0;
    objc_storeStrong((id *)v16 + 14, (id)*MEMORY[0x1E0CD2B68]);
    v18 = v17;
  }

  return v17;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_colorMap);
  v3.receiver = self;
  v3.super_class = (Class)VKRasterTileOverlayProviderData;
  -[VKRasterTileOverlayProviderData dealloc](&v3, sel_dealloc);
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  id WeakRetained;

  self->_alpha = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "rasterTileOverlayDidChangeAlpha:", self);

}

- (void)setColorMap:(CGImage *)a3
{
  CGImage *colorMap;
  id v6;

  colorMap = self->_colorMap;
  if (colorMap != a3)
  {
    CGImageRelease(colorMap);
    self->_colorMap = CGImageRetain(a3);
    -[VKRasterTileOverlayProviderData delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rasterTileOverlayNeedsInvalidate:", self);

  }
}

- (void)setKeyframeIndexOverride:(int)a3
{
  id WeakRetained;

  if (self->_keyframeIndexOverride != a3)
  {
    self->_keyframeIndexOverride = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "rasterTileOverlayNeedsDisplay:", self);

  }
}

- (VKRasterTileOverlayProviderDelegate)delegate
{
  return (VKRasterTileOverlayProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unsigned)providerID
{
  return self->_providerID;
}

- (unsigned)tileSize
{
  return self->_tileSize;
}

- (unsigned)minimumZ
{
  return self->_minimumZ;
}

- (unsigned)maximumZ
{
  return self->_maximumZ;
}

- (unsigned)keyframesCount
{
  return self->_keyframesCount;
}

- (void)setKeyframesCount:(unsigned __int16)a3
{
  self->_keyframesCount = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)crossfadeKeyframes
{
  return self->_crossfadeKeyframes;
}

- (int)keyframeIndexOverride
{
  return self->_keyframeIndexOverride;
}

- (unsigned)visibleKeyframeIndex
{
  return self->_visibleKeyframeIndex;
}

- (void)setVisibleKeyframeIndex:(unsigned int)a3
{
  self->_visibleKeyframeIndex = a3;
}

- (CGImage)colorMap
{
  return self->_colorMap;
}

- (double)beginTime
{
  return self->_beginTime;
}

- (void)setBeginTime:(double)a3
{
  self->_beginTime = a3;
}

- (double)timeOffset
{
  return self->_timeOffset;
}

- (void)setTimeOffset:(double)a3
{
  self->_timeOffset = a3;
}

- (float)repeatCount
{
  return self->_repeatCount;
}

- (void)setRepeatCount:(float)a3
{
  self->_repeatCount = a3;
}

- (double)repeatDuration
{
  return self->_repeatDuration;
}

- (void)setRepeatDuration:(double)a3
{
  self->_repeatDuration = a3;
}

- (float)speed
{
  return self->_speed;
}

- (void)setSpeed:(float)a3
{
  self->_speed = a3;
}

- (BOOL)autoreverses
{
  return self->_autoreverses;
}

- (void)setAutoreverses:(BOOL)a3
{
  self->_autoreverses = a3;
}

- (NSString)fillMode
{
  return self->_fillMode;
}

- (void)setFillMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)keyTimes
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setKeyTimes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyTimes, 0);
  objc_storeStrong((id *)&self->_fillMode, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
