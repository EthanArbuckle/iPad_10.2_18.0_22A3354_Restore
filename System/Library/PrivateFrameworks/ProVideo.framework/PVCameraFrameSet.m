@implementation PVCameraFrameSet

- (PVCameraFrameSet)initWithColorBuffer:(opaqueCMSampleBuffer *)a3 metadata:(id)a4
{
  id v6;
  PVCameraFrameSet *v7;
  PVCameraFrameSet *v8;
  __int128 v9;
  _OWORD v11[3];
  _OWORD v12[2];
  __int128 v13;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PVCameraFrameSet;
  v7 = -[PVCameraFrameSet init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v12[0] = *MEMORY[0x1E0C9BAA8];
    v12[1] = v9;
    v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v11[0] = v12[0];
    v11[1] = v9;
    v11[2] = v13;
    -[PVCameraFrameSet _sharedInitColorBuffer:colorTransform:depthData:depthTransform:metadata:](v7, "_sharedInitColorBuffer:colorTransform:depthData:depthTransform:metadata:", a3, v12, 0, v11, v6);
  }

  return v8;
}

- (PVCameraFrameSet)initWithColorBuffer:(opaqueCMSampleBuffer *)a3 depthData:(id)a4 metadata:(id)a5
{
  id v8;
  id v9;
  PVCameraFrameSet *v10;
  PVCameraFrameSet *v11;
  __int128 v12;
  _OWORD v14[3];
  _OWORD v15[2];
  __int128 v16;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PVCameraFrameSet;
  v10 = -[PVCameraFrameSet init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v15[0] = *MEMORY[0x1E0C9BAA8];
    v15[1] = v12;
    v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v14[0] = v15[0];
    v14[1] = v12;
    v14[2] = v16;
    -[PVCameraFrameSet _sharedInitColorBuffer:colorTransform:depthData:depthTransform:metadata:](v10, "_sharedInitColorBuffer:colorTransform:depthData:depthTransform:metadata:", a3, v15, v8, v14, v9);
  }

  return v11;
}

- (void)_sharedInitColorBuffer:(opaqueCMSampleBuffer *)a3 colorTransform:(CGAffineTransform *)a4 depthData:(id)a5 depthTransform:(CGAffineTransform *)a6 metadata:(id)a7
{
  AVDepthData *v12;
  NSDictionary *v13;
  __int128 v14;
  __int128 v15;
  AVDepthData *depthData;
  __int128 v17;
  __int128 v18;
  PVImageBuffer *alphaMaskImageBuffer;
  NSDictionary *metadata;
  AVDepthData *v21;

  v12 = (AVDepthData *)a5;
  v13 = (NSDictionary *)a7;
  self->_colorSampleBuffer = a3;
  if (a3)
    CFRetain(a3);
  v14 = *(_OWORD *)&a4->a;
  v15 = *(_OWORD *)&a4->tx;
  *(_OWORD *)&self->_colorTransform.c = *(_OWORD *)&a4->c;
  *(_OWORD *)&self->_colorTransform.tx = v15;
  *(_OWORD *)&self->_colorTransform.a = v14;
  depthData = self->_depthData;
  self->_depthData = v12;
  v21 = v12;

  v17 = *(_OWORD *)&a6->a;
  v18 = *(_OWORD *)&a6->tx;
  *(_OWORD *)&self->_depthTransform.c = *(_OWORD *)&a6->c;
  *(_OWORD *)&self->_depthTransform.tx = v18;
  *(_OWORD *)&self->_depthTransform.a = v17;
  alphaMaskImageBuffer = self->_alphaMaskImageBuffer;
  self->_alphaMaskImageBuffer = 0;

  metadata = self->_metadata;
  self->_metadata = v13;

}

- (void)dealloc
{
  opaqueCMSampleBuffer *colorSampleBuffer;
  NSDictionary *metadata;
  objc_super v5;

  colorSampleBuffer = self->_colorSampleBuffer;
  if (colorSampleBuffer)
  {
    CFRelease(colorSampleBuffer);
    self->_colorSampleBuffer = 0;
  }
  metadata = self->_metadata;
  self->_metadata = 0;

  v5.receiver = self;
  v5.super_class = (Class)PVCameraFrameSet;
  -[PVCameraFrameSet dealloc](&v5, sel_dealloc);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_colorSampleBuffer;
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMSampleBufferGetPresentationTimeStamp((CMTime *)retstr, (CMSampleBufferRef)result);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  return result;
}

- (PVImageBuffer)colorImageBuffer
{
  opaqueCMSampleBuffer *colorSampleBuffer;

  colorSampleBuffer = self->_colorSampleBuffer;
  if (colorSampleBuffer)
  {
    +[PVImageBuffer imageWithCVPixelBuffer:](PVImageBuffer, "imageWithCVPixelBuffer:", CMSampleBufferGetImageBuffer(colorSampleBuffer));
    colorSampleBuffer = (opaqueCMSampleBuffer *)objc_claimAutoreleasedReturnValue();
  }
  return (PVImageBuffer *)colorSampleBuffer;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)orientation
{
  double x;
  double y;
  double z;
  double w;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  x = self->orientation.x;
  y = self->orientation.y;
  z = self->orientation.z;
  w = self->orientation.w;
  result.var3 = w;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (void)setOrientation:(id)a3
{
  self->orientation = ($BD458D890A0AD74B3ABF726E1329EF14)a3;
}

- (int64_t)deviceOrientation
{
  return self->deviceOrientation;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  self->deviceOrientation = a3;
}

- (CGAffineTransform)colorTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].tx;
  return self;
}

- (void)setColorTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_colorTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_colorTransform.tx = v4;
  *(_OWORD *)&self->_colorTransform.a = v3;
}

- (CGAffineTransform)depthTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].tx;
  return self;
}

- (void)setDepthTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_depthTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_depthTransform.tx = v4;
  *(_OWORD *)&self->_depthTransform.a = v3;
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (void)setCameraPosition:(int64_t)a3
{
  self->_cameraPosition = a3;
}

- (opaqueCMSampleBuffer)colorSampleBuffer
{
  return self->_colorSampleBuffer;
}

- (AVDepthData)depthData
{
  return self->_depthData;
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (PVImageBuffer)alphaMaskImageBuffer
{
  return (PVImageBuffer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAlphaMaskImageBuffer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (double)rollRadians
{
  return self->_rollRadians;
}

- (void)setRollRadians:(double)a3
{
  self->_rollRadians = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alphaMaskImageBuffer, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_depthData, 0);
}

@end
