@implementation VGFaceCaptureData

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  __CVBuffer *v5;
  CVPixelBufferRef IOSurfaceBackedPixelBufferCopy;
  uint64_t v7;
  void (**v8)(_QWORD);
  __CVBuffer *v9;
  CVPixelBufferRef v10;
  void (**v11)(_QWORD);
  id v12;
  _QWORD v14[5];
  _QWORD v15[5];
  $95D729B680665BEAEFA1D6FCA8238556 timestamp;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objc_msgSend(v4, "setVideoIntrinsics:", *(double *)self->_anon_40, *(double *)&self->_anon_40[16], *(double *)&self->_anon_40[32]);
  objc_msgSend(v4, "setDepthIntrinsics:", *(double *)self->_anon_70, *(double *)&self->_anon_70[16], *(double *)&self->_anon_70[32]);
  objc_msgSend(v4, "setChromaticAdaptationMatrix:", *(double *)&self[1].super.isa, *(double *)&self[1]._depth, *(double *)&self[1]._allFaces);
  objc_msgSend(v4, "setFace:", self->_face);
  objc_msgSend(v4, "setAllFaces:", self->_allFaces);
  timestamp = self->_timestamp;
  objc_msgSend(v4, "setTimestamp:", &timestamp);
  IOSurfaceBackedPixelBufferCopy = vg::createIOSurfaceBackedPixelBufferCopy(self->_depth, v5);
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __34__VGFaceCaptureData_copyWithZone___block_invoke;
  v15[3] = &__block_descriptor_40_e5_v8__0l;
  v15[4] = IOSurfaceBackedPixelBufferCopy;
  v8 = (void (**)(_QWORD))MEMORY[0x24BD03294](v15);
  objc_msgSend(v4, "setDepth:", IOSurfaceBackedPixelBufferCopy);
  v10 = vg::createIOSurfaceBackedPixelBufferCopy(self->_yuvRectified, v9);
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __34__VGFaceCaptureData_copyWithZone___block_invoke_2;
  v14[3] = &__block_descriptor_40_e5_v8__0l;
  v14[4] = v10;
  v11 = (void (**)(_QWORD))MEMORY[0x24BD03294](v14);
  objc_msgSend(v4, "setYuvRectified:", v10);
  v12 = v4;
  v11[2](v11);

  v8[2](v8);
  return v12;
}

void __34__VGFaceCaptureData_copyWithZone___block_invoke(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __34__VGFaceCaptureData_copyWithZone___block_invoke_2(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

- (void)saveAtPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:isDirectory:", v4, 0);
  objc_msgSend(MEMORY[0x24BDBF660], "imageWithCVPixelBuffer:", self->_yuvRectified);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BDBF648]);
  v8 = (void *)objc_msgSend(v7, "initWithOptions:", MEMORY[0x24BDBD1B8]);
  v9 = objc_msgSend(v6, "colorSpace");
  v10 = *MEMORY[0x24BDBF8B0];
  v14 = 0;
  objc_msgSend(v8, "writePNGRepresentationOfImage:toURL:format:colorSpace:options:error:", v6, v5, v10, v9, MEMORY[0x24BDBD1B8], &v14);
  v11 = v14;
  __VGLogSharedInstance();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_249CAD000, v12, OS_LOG_TYPE_DEBUG, " VGCaptureData write at %@ ", buf, 0xCu);
  }

  if (v11)
  {
    __VGLogSharedInstance();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v11;
      _os_log_impl(&dword_249CAD000, v13, OS_LOG_TYPE_ERROR, " write error %@ ", buf, 0xCu);
    }

  }
}

- (void)setYuvRectified:(__CVBuffer *)a3
{
  CVPixelBufferRelease(self->_yuvRectified);
  self->_yuvRectified = a3;
  CVPixelBufferRetain(a3);
}

- (void)setDepth:(__CVBuffer *)a3
{
  CVPixelBufferRelease(self->_depth);
  self->_depth = a3;
  CVPixelBufferRetain(a3);
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_depth);
  CVPixelBufferRelease(self->_yuvRectified);
  v3.receiver = self;
  v3.super_class = (Class)VGFaceCaptureData;
  -[VGFaceCaptureData dealloc](&v3, sel_dealloc);
}

- (__CVBuffer)yuvRectified
{
  return self->_yuvRectified;
}

- (__CVBuffer)depth
{
  return self->_depth;
}

- (__n128)videoIntrinsics
{
  return a1[4];
}

- (__n128)setVideoIntrinsics:(__n128)a3
{
  result[4] = a2;
  result[5] = a3;
  result[6] = a4;
  return result;
}

- (__n128)depthIntrinsics
{
  return a1[7];
}

- (__n128)setDepthIntrinsics:(__n128)a3
{
  result[7] = a2;
  result[8] = a3;
  result[9] = a4;
  return result;
}

- (__n128)chromaticAdaptationMatrix
{
  return a1[10];
}

- (__n128)setChromaticAdaptationMatrix:(__n128)a3
{
  result[10] = a2;
  result[11] = a3;
  result[12] = a4;
  return result;
}

- (VGFaceMetadata)face
{
  return self->_face;
}

- (void)setFace:(id)a3
{
  objc_storeStrong((id *)&self->_face, a3);
}

- (NSArray)allFaces
{
  return self->_allFaces;
}

- (void)setAllFaces:(id)a3
{
  objc_storeStrong((id *)&self->_allFaces, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (void)setTimestamp:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_timestamp.epoch = a3->var3;
  *(_OWORD *)&self->_timestamp.value = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allFaces, 0);
  objc_storeStrong((id *)&self->_face, 0);
}

@end
