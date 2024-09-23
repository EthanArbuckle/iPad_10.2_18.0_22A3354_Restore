@implementation PTMSRResizeAdditionalOutput

- (PTMSRResizeAdditionalOutput)initWithSize:(id *)a3 colorSpace:(CGColorSpace *)a4
{
  PTMSRResizeAdditionalOutput *v6;
  const __CFAllocator *v7;
  size_t var1;
  size_t var0;
  uint64_t v10;
  NSObject *v11;
  PTMSRResizeAdditionalOutput *v12;
  IOSurfaceRef IOSurface;
  __IOSurface *v14;
  CFPropertyListRef v15;
  const void *v16;
  objc_super v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)PTMSRResizeAdditionalOutput;
  v6 = -[PTMSRResizeAdditionalOutput init](&v18, sel_init);
  if (!v6)
  {
LABEL_6:
    v12 = 0;
    goto LABEL_11;
  }
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  var0 = a3->var0;
  var1 = a3->var1;
  v10 = *MEMORY[0x1E0CA8F68];
  v19[0] = *MEMORY[0x1E0CA8FF0];
  v19[1] = v10;
  v20[0] = MEMORY[0x1E0C9AA70];
  v20[1] = &unk_1E8252088;
  if (CVPixelBufferCreate(v7, var0, var1, 0x42475241u, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2), &v6->_pixelbuffer))
  {
    _PTLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PTMSRResizeAdditionalOutput initWithSize:colorSpace:].cold.1();

    goto LABEL_6;
  }
  IOSurface = CVPixelBufferGetIOSurface(v6->_pixelbuffer);
  v6->_ioSurface = IOSurface;
  if (a4)
  {
    v14 = IOSurface;
    v15 = CGColorSpaceCopyPropertyList(a4);
    if (v15)
    {
      v16 = v15;
      IOSurfaceSetValue(v14, (CFStringRef)*MEMORY[0x1E0CBBF90], v15);
      CFRelease(v16);
    }
  }
  v12 = v6;
LABEL_11:

  return v12;
}

- (void)dealloc
{
  __CVBuffer *pixelbuffer;
  objc_super v4;

  pixelbuffer = self->_pixelbuffer;
  if (pixelbuffer)
    CVPixelBufferRelease(pixelbuffer);
  v4.receiver = self;
  v4.super_class = (Class)PTMSRResizeAdditionalOutput;
  -[PTMSRResizeAdditionalOutput dealloc](&v4, sel_dealloc);
}

- (__CVBuffer)pixelbuffer
{
  return self->_pixelbuffer;
}

- (void)setPixelbuffer:(__CVBuffer *)a3
{
  self->_pixelbuffer = a3;
}

- (__IOSurface)ioSurface
{
  return self->_ioSurface;
}

- (void)setIoSurface:(__IOSurface *)a3
{
  self->_ioSurface = a3;
}

- (int)sourcePyramidIndex
{
  return self->_sourcePyramidIndex;
}

- (void)setSourcePyramidIndex:(int)a3
{
  self->_sourcePyramidIndex = a3;
}

- (void)initWithSize:colorSpace:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15(&dword_1C9281000, v0, v1, "CVPixelBufferCreate failed %i", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

@end
