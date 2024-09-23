@implementation PVCameraPreviewRequest

- (void)dealloc
{
  opaqueCMSampleBuffer *sampleBuffer;
  objc_super v4;

  sampleBuffer = self->_sampleBuffer;
  if (sampleBuffer)
    CFRelease(sampleBuffer);
  v4.receiver = self;
  v4.super_class = (Class)PVCameraPreviewRequest;
  -[PVCameraPreviewRequest dealloc](&v4, sel_dealloc);
}

- (void)setSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  opaqueCMSampleBuffer *sampleBuffer;

  sampleBuffer = self->_sampleBuffer;
  if (sampleBuffer != a3)
  {
    if (sampleBuffer)
      CFRelease(sampleBuffer);
    self->_sampleBuffer = a3;
    if (a3)
      CFRetain(a3);
  }
}

- (opaqueCMSampleBuffer)sampleBuffer
{
  return self->_sampleBuffer;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- (void)setTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

- (BOOL)mirrored
{
  return self->_mirrored;
}

- (void)setMirrored:(BOOL)a3
{
  self->_mirrored = a3;
}

- (NSMutableArray)effects
{
  return self->_effects;
}

- (void)setEffects:(id)a3
{
  objc_storeStrong((id *)&self->_effects, a3);
}

- (NSDictionary)effectProperties
{
  return self->_effectProperties;
}

- (void)setEffectProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)metadataObjects
{
  return self->_metadataObjects;
}

- (void)setMetadataObjects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataObjects, 0);
  objc_storeStrong((id *)&self->_effectProperties, 0);
  objc_storeStrong((id *)&self->_effects, 0);
}

@end
