@implementation _PIParallaxRenderBuffer

- (_PIParallaxRenderBuffer)initWithPixelBuffer:(id)a3 renderTask:(id)a4
{
  NUImageBuffer *v6;
  CIRenderTask *v7;
  _PIParallaxRenderBuffer *v8;
  NUImageBuffer *pixelBuffer;
  NUImageBuffer *v10;
  CIRenderTask *renderTask;
  objc_super v13;

  v6 = (NUImageBuffer *)a3;
  v7 = (CIRenderTask *)a4;
  v13.receiver = self;
  v13.super_class = (Class)_PIParallaxRenderBuffer;
  v8 = -[_PIParallaxRenderBuffer init](&v13, sel_init);
  pixelBuffer = v8->_pixelBuffer;
  v8->_pixelBuffer = v6;
  v10 = v6;

  renderTask = v8->_renderTask;
  v8->_renderTask = v7;

  return v8;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t v2;
  int64_t v3;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v2 = -[NUImageBuffer size](self->_pixelBuffer, "size");
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (NUColorSpace)colorSpace
{
  return (NUColorSpace *)-[NUImageBuffer colorSpace](self->_pixelBuffer, "colorSpace");
}

- (NUPixelFormat)format
{
  return (NUPixelFormat *)-[NUImageBuffer format](self->_pixelBuffer, "format");
}

- (__CVBuffer)CVPixelBuffer
{
  CIRenderTask *renderTask;
  CIRenderInfo *v4;
  id v5;
  CIRenderInfo *renderInfo;
  BOOL v7;
  NSObject *v8;
  __CVBuffer *v9;
  CIRenderTask *v11;
  id v12;
  uint8_t buf[4];
  CIRenderTask *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  renderTask = self->_renderTask;
  v12 = 0;
  -[CIRenderTask waitUntilCompletedAndReturnError:](renderTask, "waitUntilCompletedAndReturnError:", &v12);
  v4 = (CIRenderInfo *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  renderInfo = self->_renderInfo;
  self->_renderInfo = v4;

  if (self->_renderInfo)
    v7 = v5 == 0;
  else
    v7 = 0;
  if (!v7)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_14991);
    v8 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      v11 = self->_renderTask;
      *(_DWORD *)buf = 138543618;
      v14 = v11;
      v15 = 2114;
      v16 = v5;
      _os_log_error_impl(&dword_1A6382000, v8, OS_LOG_TYPE_ERROR, "Failed to render %{public}@, error: %{public}@", buf, 0x16u);
    }
  }
  v9 = (__CVBuffer *)-[NUImageBuffer CVPixelBuffer](self->_pixelBuffer, "CVPixelBuffer");

  return v9;
}

- (NUImageBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (CIRenderTask)renderTask
{
  return self->_renderTask;
}

- (CIRenderInfo)renderInfo
{
  return self->_renderInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderInfo, 0);
  objc_storeStrong((id *)&self->_renderTask, 0);
  objc_storeStrong((id *)&self->_pixelBuffer, 0);
}

@end
