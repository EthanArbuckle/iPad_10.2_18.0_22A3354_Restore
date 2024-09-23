@implementation _MRCMetalContext

- (_MRCMetalContext)init
{
  _MRCMetalContext *result;

  result = (_MRCMetalContext *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (_MRCMetalContext)initWithDevice:(id)a3 libraryURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _MRCMetalContext *v10;
  MTLDevice *v11;
  MTLDevice *device;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *library;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  id v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  MTLLibrary *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  MTLCommandQueue *commandQueue;
  const char *v39;
  void *v40;
  const char *v41;
  void *v43;
  void *v44;
  objc_class *v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  objc_super v52;
  uint64_t v53;
  const __CFString *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v52.receiver = self;
  v52.super_class = (Class)_MRCMetalContext;
  v10 = -[_MRCMetalContext init](&v52, sel_init);
  if (!v10)
    goto LABEL_21;
  if (v8)
    v11 = (MTLDevice *)v8;
  else
    v11 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  device = v10->_device;
  v10->_device = v11;

  if (v10->_device)
  {
    if (v9)
    {
LABEL_7:
      v15 = objc_msgSend_newLibraryWithURL_error_(v10->_device, v13, (uint64_t)v9, a5);
      library = v10->_library;
      v10->_library = (MTLLibrary *)v15;
LABEL_19:

      if (!v10->_library)
      {
LABEL_25:
        a5 = 0;
        goto LABEL_26;
      }
      v37 = objc_msgSend_newCommandQueue(v10->_device, v35, v36);
      commandQueue = v10->_commandQueue;
      v10->_commandQueue = (MTLCommandQueue *)v37;

      if (v10->_commandQueue)
      {
LABEL_21:
        a5 = v10;
        goto LABEL_26;
      }
      if (!a5)
        goto LABEL_26;
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v53 = *MEMORY[0x1E0C9AFB0];
      v54 = CFSTR("Cannot create MTLCommandQueue.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v39, (uint64_t)&v54, &v53, 1);
LABEL_24:
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v17, v41, (uint64_t)CFSTR("MRCErrorDomain"), -1, v40);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_25;
    }
    objc_msgSend_standardUserDefaults(MEMORY[0x1E0C99EA0], v13, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v18, v19, (uint64_t)CFSTR("_MRCMetalContextDefaultLibraryPath"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v20
       || (v21 = objc_alloc(MEMORY[0x1E0C99EA0]),
           v23 = (void *)objc_msgSend_initWithSuiteName_(v21, v22, (uint64_t)CFSTR("com.apple.Quagga")),
           objc_msgSend_objectForKey_(v23, v24, (uint64_t)CFSTR("_MRCMetalContextDefaultLibraryPath")),
           v20 = (void *)objc_claimAutoreleasedReturnValue(),
           v23,
           v20))
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && objc_msgSend_length(v20, v25, v26))
    {
      objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v27, (uint64_t)v20);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9)
        goto LABEL_7;
    }
    else
    {

    }
    v28 = (void *)MEMORY[0x1E0CB34D0];
    v29 = objc_opt_class();
    objc_msgSend_bundleForClass_(v28, v30, v29);
    v31 = objc_claimAutoreleasedReturnValue();
    if (!v31)
    {
      if (!a5)
      {
        v9 = 0;
        goto LABEL_26;
      }
      v43 = (void *)MEMORY[0x1E0CB35C8];
      v55 = *MEMORY[0x1E0C9AFB0];
      v44 = (void *)MEMORY[0x1E0CB3940];
      v45 = (objc_class *)objc_opt_class();
      NSStringFromClass(v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v44, v47, (uint64_t)CFSTR("Cannot get bundle for class %@."), v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v48;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v49, (uint64_t)&v56, &v55, 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v43, v51, (uint64_t)CFSTR("MRCErrorDomain"), -1, v50);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v9 = 0;
      goto LABEL_25;
    }
    library = (void *)v31;
    v33 = objc_msgSend_newDefaultLibraryWithBundle_error_(v10->_device, v32, v31, a5);
    v34 = v10->_library;
    v10->_library = (MTLLibrary *)v33;

    v9 = 0;
    goto LABEL_19;
  }
  if (a5)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v57 = *MEMORY[0x1E0C9AFB0];
    v58[0] = CFSTR("Cannot create MTLDevice.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)v58, &v57, 1);
    goto LABEL_24;
  }
LABEL_26:

  return (_MRCMetalContext *)a5;
}

- (id)beginCommandBuffer
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_beginCommandBufferWithError_, 0);
}

- (id)beginCommandBufferWithError:(id *)a3
{
  MTLCommandBuffer *v5;
  MTLCommandBuffer *currentCommandBuffer;
  const char *v7;
  MTLCommandBuffer *v8;
  MTLCommandBuffer *v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_commandBuffer(self->_commandQueue, a2, (uint64_t)a3);
  v5 = (MTLCommandBuffer *)objc_claimAutoreleasedReturnValue();
  currentCommandBuffer = self->_currentCommandBuffer;
  self->_currentCommandBuffer = v5;

  v8 = self->_currentCommandBuffer;
  if (v8)
  {
    v9 = v8;
  }
  else if (a3)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0C9AFB0];
    v15[0] = CFSTR("Cannot create MTLCommandBuffer.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v7, (uint64_t)v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v10, v12, (uint64_t)CFSTR("MRCErrorDomain"), -1, v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)commitCommandBuffer
{
  objc_msgSend_commitCommandBufferShouldWaitUntilCompleted_(self, a2, 0);
}

- (void)commitCommandBufferShouldWaitUntilCompleted:(BOOL)a3
{
  _BOOL4 v3;
  const char *v5;
  uint64_t v6;
  MTLCommandBuffer *currentCommandBuffer;

  v3 = a3;
  objc_msgSend_commit(self->_currentCommandBuffer, a2, a3);
  if (v3)
    objc_msgSend_waitUntilCompleted(self->_currentCommandBuffer, v5, v6);
  currentCommandBuffer = self->_currentCommandBuffer;
  self->_currentCommandBuffer = 0;

}

- (id)newComputePipelineStateWithFunctionName:(id)a3 constantValues:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  id v10;
  MTLLibrary *library;
  const char *v12;
  void *v13;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v10 = a4;
  library = self->_library;
  if (!v10)
  {
    v13 = (void *)objc_msgSend_newFunctionWithName_(library, v9, (uint64_t)v8);
    if (!v13)
    {
      if (!a5)
        goto LABEL_7;
      v15 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v12, (uint64_t)CFSTR("Cannot create MTLFunction named %@."), v8, *MEMORY[0x1E0C9AFB0]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v13;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v16, (uint64_t)v20, &v19, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v15, v18, (uint64_t)CFSTR("MRCErrorDomain"), -1, v17);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      a5 = 0;
      goto LABEL_6;
    }
LABEL_5:
    a5 = (id *)objc_msgSend_newComputePipelineStateWithFunction_error_(self->_device, v12, (uint64_t)v13, a5);
LABEL_6:

    goto LABEL_7;
  }
  v13 = (void *)objc_msgSend_newFunctionWithName_constantValues_error_(library, v9, (uint64_t)v8, v10, a5);
  if (v13)
    goto LABEL_5;
  a5 = 0;
LABEL_7:

  return a5;
}

- (id)newTextureByBindingIOSurface:(__IOSurface *)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 usage:(unint64_t)a7 plane:(unint64_t)a8 error:(id *)a9
{
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  id v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x1E0CC6BB0], a2, a4, a5, a6, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13;
  if (v13)
  {
    objc_msgSend_setUsage_(v13, v14, a7);
    v17 = (void *)objc_msgSend_newTextureWithDescriptor_iosurface_plane_(self->_device, v16, (uint64_t)v15, a3, a8);
    if (v17)
    {
      v19 = v17;
      v20 = v19;
    }
    else
    {
      if (a9)
      {
        v23 = (void *)MEMORY[0x1E0CB35C8];
        v27 = *MEMORY[0x1E0C9AFB0];
        v28 = CFSTR("Cannot create MTLTexture.");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)&v28, &v27, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v23, v25, (uint64_t)CFSTR("MRCErrorDomain"), -1, v24);
        *a9 = (id)objc_claimAutoreleasedReturnValue();

      }
      v19 = 0;
      v20 = 0;
    }
  }
  else
  {
    if (!a9)
    {
      v20 = 0;
      goto LABEL_10;
    }
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0C9AFB0];
    v30[0] = CFSTR("Cannot create MTLTextureDescriptor.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)v30, &v29, 1);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v21, v22, (uint64_t)CFSTR("MRCErrorDomain"), -1, v19);
    v20 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v20;
}

- (MTLDevice)device
{
  return self->_device;
}

- (MTLLibrary)library
{
  return self->_library;
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (MTLCommandBuffer)currentCommandBuffer
{
  return self->_currentCommandBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCommandBuffer, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
