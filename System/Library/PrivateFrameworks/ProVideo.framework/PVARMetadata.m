@implementation PVARMetadata

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_imageBuffer);
  CVPixelBufferRelease(self->_depthBuffer);
  CVPixelBufferRelease(self->_segmentationBuffer);
  v3.receiver = self;
  v3.super_class = (Class)PVARMetadata;
  -[PVARMetadata dealloc](&v3, sel_dealloc);
}

- (PVARMetadata)initWithImageBuffer:(double)a3 depthBuffer:(double)a4 depthData:(double)a5 depthFreshness:(double)a6 segmentationBuffer:(double)a7 cameraTransform:(double)a8 cameraIntrinsics:(uint64_t)a9 cameraImageResolution:(uint64_t)a10
{
  id v22;
  PVARMetadata *v23;
  PVARMetadata *v24;
  objc_super v33;

  v22 = a12;
  v33.receiver = a1;
  v33.super_class = (Class)PVARMetadata;
  v23 = -[PVARMetadata init](&v33, sel_init);
  v24 = v23;
  if (v23)
  {
    -[PVARMetadata setImageBuffer:](v23, "setImageBuffer:", a10);
    -[PVARMetadata setDepthBuffer:](v24, "setDepthBuffer:", a11);
    -[PVARMetadata setDepthData:](v24, "setDepthData:", v22);
    -[PVARMetadata setDepthFreshness:](v24, "setDepthFreshness:", a13);
    -[PVARMetadata setSegmentationBuffer:](v24, "setSegmentationBuffer:", a14);
    -[PVARMetadata setCameraTransform:](v24, "setCameraTransform:", a2, a3, a4, a5);
    -[PVARMetadata setCameraIntrinsics:](v24, "setCameraIntrinsics:", a6, a7, a8);
    -[PVARMetadata setCameraImageResolution:](v24, "setCameraImageResolution:", a16, a17);
  }

  return v24;
}

- (PVARMetadata)initWithARFrame:(id)a3 depthData:(id)a4 depthFreshness:(int)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  PVARMetadata *v25;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "capturedImage");
  objc_msgSend(v7, "sceneDepth");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "depthMap");
  v12 = objc_msgSend(v7, "segmentationBuffer");
  objc_msgSend(v7, "camera");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "transform");
  v32 = v15;
  v33 = v14;
  v30 = v17;
  v31 = v16;
  objc_msgSend(v7, "camera");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "intrinsics");
  v28 = v20;
  v29 = v19;
  v27 = v21;
  objc_msgSend(v7, "camera");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "imageResolution");
  v25 = -[PVARMetadata initWithImageBuffer:depthBuffer:depthData:depthFreshness:segmentationBuffer:cameraTransform:cameraIntrinsics:cameraImageResolution:](self, "initWithImageBuffer:depthBuffer:depthData:depthFreshness:segmentationBuffer:cameraTransform:cameraIntrinsics:cameraImageResolution:", v9, v11, v8, a5, v12, v33, v32, v31, v30, v29, v28, v27, v23, v24);

  if (v25)
    -[PVARMetadata setArFrame:](v25, "setArFrame:", v7);

  return v25;
}

- (void)setImageBuffer:(__CVBuffer *)a3
{
  CVPixelBufferRetain(a3);
  CVPixelBufferRelease(self->_imageBuffer);
  self->_imageBuffer = a3;
}

- (void)setDepthBuffer:(__CVBuffer *)a3
{
  CVPixelBufferRetain(a3);
  CVPixelBufferRelease(self->_depthBuffer);
  self->_depthBuffer = a3;
}

- (void)setSegmentationBuffer:(__CVBuffer *)a3
{
  CVPixelBufferRetain(a3);
  CVPixelBufferRelease(self->_segmentationBuffer);
  self->_segmentationBuffer = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PVARMetadata)initWithCoder:(id)a3
{

  return 0;
}

- (id)description
{
  void *v3;
  __CVBuffer *imageBuffer;
  size_t Width;
  void *v6;
  __CVBuffer *v7;
  size_t Height;
  void *v9;
  void *v10;
  __CVBuffer *depthBuffer;
  size_t v12;
  void *v13;
  void *v14;
  __CVBuffer *v15;
  size_t v16;
  void *v17;
  int depthFreshness;
  void *v19;
  __CVBuffer *segmentationBuffer;
  AVDepthData *depthData;
  size_t v22;
  void *v23;
  void *v24;
  __CVBuffer *v25;
  size_t v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;

  v34 = (void *)MEMORY[0x1E0CB3940];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  imageBuffer = self->_imageBuffer;
  if (imageBuffer)
    Width = CVPixelBufferGetWidth(imageBuffer);
  else
    Width = 0;
  objc_msgSend(v3, "numberWithUnsignedLong:", Width);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = self->_imageBuffer;
  if (v7)
    Height = CVPixelBufferGetHeight(v7);
  else
    Height = 0;
  objc_msgSend(v6, "numberWithUnsignedLong:", Height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  depthBuffer = self->_depthBuffer;
  if (depthBuffer)
    v12 = CVPixelBufferGetWidth(depthBuffer);
  else
    v12 = 0;
  objc_msgSend(v10, "numberWithUnsignedLong:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = self->_depthBuffer;
  if (v15)
    v16 = CVPixelBufferGetHeight(v15);
  else
    v16 = 0;
  objc_msgSend(v14, "numberWithUnsignedLong:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  depthFreshness = self->_depthFreshness;
  v19 = (void *)MEMORY[0x1E0CB37E8];
  depthData = self->_depthData;
  segmentationBuffer = self->_segmentationBuffer;
  if (segmentationBuffer)
    v22 = CVPixelBufferGetWidth(segmentationBuffer);
  else
    v22 = 0;
  objc_msgSend(v19, "numberWithUnsignedLong:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0CB37E8];
  v25 = self->_segmentationBuffer;
  if (v25)
    v26 = CVPixelBufferGetHeight(v25);
  else
    v26 = 0;
  if (depthFreshness)
    v27 = CFSTR("Stale");
  else
    v27 = CFSTR("Fresh");
  objc_msgSend(v24, "numberWithUnsignedLong:", v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSIMDFloat4x4(2, *(simd_float4x4 *)&self[1].super.isa);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSIMDFloat3x3(2, *(simd_float3x3 *)self->_anon_50);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGSize(self->_cameraImageResolution);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "stringWithFormat:", CFSTR("<Image %@x%@> <Depth %@x%@> <DepthData %@> <DepthFreshness %@> <Segmentation %@x%@> <CameraTransform %@> <CameraIntrinsics %@> <CameraResolution %@>"), v35, v9, v13, v17, depthData, v27, v23, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (ARFrame)arFrame
{
  return self->_arFrame;
}

- (void)setArFrame:(id)a3
{
  objc_storeStrong((id *)&self->_arFrame, a3);
}

- (__CVBuffer)imageBuffer
{
  return self->_imageBuffer;
}

- (__CVBuffer)depthBuffer
{
  return self->_depthBuffer;
}

- (AVDepthData)depthData
{
  return self->_depthData;
}

- (void)setDepthData:(id)a3
{
  objc_storeStrong((id *)&self->_depthData, a3);
}

- (int)depthFreshness
{
  return self->_depthFreshness;
}

- (void)setDepthFreshness:(int)a3
{
  self->_depthFreshness = a3;
}

- (__CVBuffer)segmentationBuffer
{
  return self->_segmentationBuffer;
}

- (__n128)cameraTransform
{
  return a1[8];
}

- (__n128)setCameraTransform:(__n128)a3
{
  result[8] = a2;
  result[9] = a3;
  result[10] = a4;
  result[11] = a5;
  return result;
}

- (__n128)cameraIntrinsics
{
  return a1[5];
}

- (__n128)setCameraIntrinsics:(__n128)a3
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  return result;
}

- (CGSize)cameraImageResolution
{
  double width;
  double height;
  CGSize result;

  width = self->_cameraImageResolution.width;
  height = self->_cameraImageResolution.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCameraImageResolution:(CGSize)a3
{
  self->_cameraImageResolution = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthData, 0);
  objc_storeStrong((id *)&self->_arFrame, 0);
}

@end
