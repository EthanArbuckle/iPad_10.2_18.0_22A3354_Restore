@implementation CRTextDetectorModelV3E5MLExecutionContext

- (id)predictionFromImage:(__CVBuffer *)a3 error:(id *)a4
{
  __CVBuffer *v5;
  IOSurfaceRef IOSurface;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  CRTextDetectorModelV3OutputLazy *v12;
  void *v13;
  CRTextDetectorModelV3OutputLazy *v14;
  uint8_t v16[16];

  v5 = a3;
  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (!IOSurface)
  {
    CROSLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1D4FB8000, v8, OS_LOG_TYPE_DEBUG, "CRTextDetectorModelV3E5ML input pixel buffer is not IOSurface backed, creating IOSurface backing. Consider passing in an IOSurface-backed pixel buffer to avoid this overhead.", v16, 2u);
    }

    v5 = CRCreateIOSurfacePixelBufferFromPixelBuffer(v5);
  }
  -[CRE5MLExecutionContext functionDescriptor](self, "functionDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[CRE5MLUtilities newImageInputsForFunctionDescriptor:croppedPixelBuffer:error:](CRE5MLUtilities, "newImageInputsForFunctionDescriptor:croppedPixelBuffer:error:", v9, v5, a4);

  if (!IOSurface)
    CVPixelBufferRelease(v5);
  -[CRE5MLExecutionContext predictionFromInputObjects:error:](self, "predictionFromInputObjects:error:", v10, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = [CRTextDetectorModelV3OutputLazy alloc];
    -[CRE5MLExecutionContext functionDescriptor](self, "functionDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CRTextDetectorModelV3OutputLazy initWithVisionCoreNamedObjects:fromFunctionDescriptor:](v12, "initWithVisionCoreNamedObjects:fromFunctionDescriptor:", v11, v13);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)prebindInputImageSurface:(__IOSurface *)a3 error:(id *)a4
{
  void *v7;
  id v8;

  if (a3)
  {
    if (self->_preboundSurface != a3)
    {
      self->_preboundSurface = a3;
      -[CRE5MLExecutionContext functionDescriptor](self, "functionDescriptor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = +[CRE5MLUtilities newInputsForFunctionDescriptor:surface:isImage:error:](CRE5MLUtilities, "newInputsForFunctionDescriptor:surface:isImage:error:", v7, a3, 1, a4);

      -[CRE5MLExecutionContext prebindInputs:](self, "prebindInputs:", v8);
    }
  }
  else if (a4)
  {
    +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)unbindPreboundInputImageSurface
{
  self->_preboundSurface = 0;
  -[CRE5MLExecutionContext unbindInputs](self, "unbindInputs");
}

- (id)predictionFromPreboundInputsWithError:(id *)a3
{
  CRTextDetectorModelV3OutputLazy *v4;
  void *v5;
  void *v6;
  CRTextDetectorModelV3OutputLazy *v7;

  if (-[CRE5MLExecutionContext predictFromPreboundInputsWithError:](self, "predictFromPreboundInputsWithError:", a3))
  {
    v4 = [CRTextDetectorModelV3OutputLazy alloc];
    -[CRE5MLExecutionContext preboundOutputObjects](self, "preboundOutputObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRE5MLExecutionContext functionDescriptor](self, "functionDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CRTextDetectorModelV3OutputLazy initWithVisionCoreNamedObjects:fromFunctionDescriptor:](v4, "initWithVisionCoreNamedObjects:fromFunctionDescriptor:", v5, v6);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)predictOutputFromPreboundInputsAsync:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__CRTextDetectorModelV3E5MLExecutionContext_predictOutputFromPreboundInputsAsync___block_invoke;
  v6[3] = &unk_1E98DB778;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CRE5MLExecutionContext predictFromPreboundInputsAsync:](self, "predictFromPreboundInputsAsync:", v6);

}

void __82__CRTextDetectorModelV3E5MLExecutionContext_predictOutputFromPreboundInputsAsync___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  CRTextDetectorModelV3OutputLazy *v7;
  void *v8;
  CRTextDetectorModelV3OutputLazy *v9;

  v5 = a3;
  v6 = a2;
  v7 = [CRTextDetectorModelV3OutputLazy alloc];
  objc_msgSend(*(id *)(a1 + 32), "functionDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CRTextDetectorModelV3OutputLazy initWithVisionCoreNamedObjects:fromFunctionDescriptor:](v7, "initWithVisionCoreNamedObjects:fromFunctionDescriptor:", v6, v8);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
