@implementation WK_RTCCVPixelBuffer

+ (id)supportedPixelFormats
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", &unk_24C0E6F68, &unk_24C0E6F80, &unk_24C0E6F98, &unk_24C0E6FB0, 0);
}

- (WK_RTCCVPixelBuffer)initWithPixelBuffer:(__CVBuffer *)a3
{
  size_t Width;
  size_t Height;
  size_t v7;
  uint64_t v9;

  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v7 = CVPixelBufferGetWidth(a3);
  LODWORD(v9) = 0;
  return -[WK_RTCCVPixelBuffer initWithPixelBuffer:adaptedWidth:adaptedHeight:cropWidth:cropHeight:cropX:cropY:](self, "initWithPixelBuffer:adaptedWidth:adaptedHeight:cropWidth:cropHeight:cropX:cropY:", a3, Width, Height, v7, CVPixelBufferGetHeight(a3), 0, v9);
}

- (WK_RTCCVPixelBuffer)initWithPixelBuffer:(__CVBuffer *)a3 adaptedWidth:(int)a4 adaptedHeight:(int)a5 cropWidth:(int)a6 cropHeight:(int)a7 cropX:(int)a8 cropY:(int)a9
{
  WK_RTCCVPixelBuffer *v15;
  WK_RTCCVPixelBuffer *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)WK_RTCCVPixelBuffer;
  v15 = -[WK_RTCCVPixelBuffer init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_width = a4;
    v15->_height = a5;
    v15->_pixelBuffer = a3;
    v15->_bufferWidth = CVPixelBufferGetWidth(a3);
    v16->_bufferHeight = CVPixelBufferGetHeight(v16->_pixelBuffer);
    v16->_cropWidth = a6;
    v16->_cropHeight = a7;
    v16->_cropX = a8 & 0xFFFFFFFE;
    v16->_cropY = a9 & 0xFFFFFFFE;
    CVBufferRetain(v16->_pixelBuffer);
  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  CVBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)WK_RTCCVPixelBuffer;
  -[WK_RTCCVPixelBuffer dealloc](&v3, sel_dealloc);
}

- (int)width
{
  return self->_width;
}

- (int)height
{
  return self->_height;
}

- (BOOL)requiresCropping
{
  return self->_cropWidth != self->_bufferWidth || self->_cropHeight != self->_bufferHeight;
}

- (BOOL)requiresScalingToWidth:(int)a3 height:(int)a4
{
  return self->_cropWidth != a3 || self->_cropHeight != a4;
}

- (int)bufferSizeForCroppingAndScalingToWidth:(int)a3 height:(int)a4
{
  int cropWidth;
  int cropHeight;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;

  if ((CVPixelBufferGetPixelFormatType(self->_pixelBuffer) | 0x10) != 0x34323076)
    return 0;
  cropWidth = self->_cropWidth;
  cropHeight = self->_cropHeight;
  if (cropWidth >= -1)
    v9 = cropWidth + 1;
  else
    v9 = cropWidth + 2;
  v10 = v9 >> 1;
  if (cropHeight >= -1)
    v11 = cropHeight + 1;
  else
    v11 = cropHeight + 2;
  v12 = v11 >> 1;
  v13 = a3 + 2;
  if (a3 >= -1)
    v13 = a3 + 1;
  v14 = v13 >> 1;
  v15 = a4 + 2;
  if (a4 >= -1)
    v15 = a4 + 1;
  return 2 * ((v15 >> 1) * v14 + v12 * v10);
}

- (BOOL)cropAndScaleTo:(__CVBuffer *)a3 withTempBuffer:(char *)a4
{
  signed int PixelFormatType;
  size_t Width;
  size_t Height;

  PixelFormatType = CVPixelBufferGetPixelFormatType(self->_pixelBuffer);
  CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType <= 875704437)
  {
    if (PixelFormatType != 32)
    {
      if (PixelFormatType != 875704422)
        return 1;
      goto LABEL_7;
    }
LABEL_10:
    -[WK_RTCCVPixelBuffer cropAndScaleARGBTo:](self, "cropAndScaleARGBTo:", a3);
    return 1;
  }
  if (PixelFormatType == 1111970369)
    goto LABEL_10;
  if (PixelFormatType != 875704438)
    return 1;
LABEL_7:
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  if (!Width || !Height)
    return 1;
  -[WK_RTCCVPixelBuffer requiresScalingToWidth:height:](self, "requiresScalingToWidth:height:", Width, Height);
  -[WK_RTCCVPixelBuffer cropAndScaleNV12To:withTempBuffer:](self, "cropAndScaleNV12To:withTempBuffer:", a3, a4);
  return 1;
}

- (id)toI420
{
  __CVBuffer **p_pixelBuffer;
  int PixelFormatType;
  WK_RTCMutableI420Buffer *v5;
  unsigned __int8 *BaseAddressOfPlane;
  int BytesPerRowOfPlane;
  const char *v8;
  int v9;
  int cropY;
  int cropX;
  int v12;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  int v15;
  int v16;
  int v17;
  int v18;
  char *v19;
  _BOOL4 v20;
  CVPixelBufferRef *p_pixelBufferOut;
  __CVBuffer *v22;
  unsigned __int8 *BaseAddress;
  unsigned int BytesPerRow;
  __CVBuffer *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  WK_RTCMutableI420Buffer *v33;
  uint64_t v35;
  int v36[2];
  int cropHeight;
  int v38[2];
  int cropWidth;
  int v40;
  const char *v41;
  int v42;
  unsigned __int8 *v43;
  int v44;
  int v45;
  CVPixelBufferRef pixelBufferOut;
  CVPixelBufferRef v47;
  uint64_t v48;

  p_pixelBuffer = &self->_pixelBuffer;
  PixelFormatType = CVPixelBufferGetPixelFormatType(self->_pixelBuffer);
  CVPixelBufferLockBaseAddress(*p_pixelBuffer, 1uLL);
  v5 = -[WK_RTCI420Buffer initWithWidth:height:]([WK_RTCMutableI420Buffer alloc], "initWithWidth:height:", -[WK_RTCCVPixelBuffer width](self, "width"), -[WK_RTCCVPixelBuffer height](self, "height"));
  if (PixelFormatType > 875704437)
  {
    if (PixelFormatType != 1111970369)
    {
      if (PixelFormatType == 875704438)
        goto LABEL_7;
      goto LABEL_30;
    }
LABEL_19:
    pixelBufferOut = 0;
    if (-[WK_RTCCVPixelBuffer requiresCropping](self, "requiresCropping")
      || (v20 = -[WK_RTCCVPixelBuffer requiresScalingToWidth:height:](self, "requiresScalingToWidth:height:", -[WK_RTCI420Buffer width](v5, "width"), -[WK_RTCI420Buffer height](v5, "height")), p_pixelBufferOut = p_pixelBuffer, v20))
    {
      CVPixelBufferCreate(0, -[WK_RTCI420Buffer width](v5, "width"), -[WK_RTCI420Buffer height](v5, "height"), PixelFormatType, 0, &pixelBufferOut);
      -[WK_RTCCVPixelBuffer cropAndScaleTo:withTempBuffer:](self, "cropAndScaleTo:withTempBuffer:", pixelBufferOut, 0);
      CVPixelBufferLockBaseAddress(pixelBufferOut, 1uLL);
      p_pixelBufferOut = &pixelBufferOut;
    }
    v22 = *p_pixelBufferOut;
    BaseAddress = (unsigned __int8 *)CVPixelBufferGetBaseAddress(*p_pixelBufferOut);
    BytesPerRow = CVPixelBufferGetBytesPerRow(v22);
    if (PixelFormatType != 32)
    {
      ARGBToI420(BaseAddress, BytesPerRow, (int8x16_t *)-[WK_RTCMutableI420Buffer mutableDataY](v5, "mutableDataY"), -[WK_RTCI420Buffer strideY](v5, "strideY"), -[WK_RTCMutableI420Buffer mutableDataU](v5, "mutableDataU"), -[WK_RTCI420Buffer strideU](v5, "strideU"), -[WK_RTCMutableI420Buffer mutableDataV](v5, "mutableDataV"), -[WK_RTCI420Buffer strideV](v5, "strideV"), -[WK_RTCI420Buffer width](v5, "width"), -[WK_RTCI420Buffer height](v5, "height"));
      v25 = pixelBufferOut;
      if (!pixelBufferOut)
        goto LABEL_30;
      goto LABEL_29;
    }
    BGRAToI420(BaseAddress, BytesPerRow, (int8x16_t *)-[WK_RTCMutableI420Buffer mutableDataY](v5, "mutableDataY"), -[WK_RTCI420Buffer strideY](v5, "strideY"), -[WK_RTCMutableI420Buffer mutableDataU](v5, "mutableDataU"), -[WK_RTCI420Buffer strideU](v5, "strideU"), -[WK_RTCMutableI420Buffer mutableDataV](v5, "mutableDataV"), -[WK_RTCI420Buffer strideV](v5, "strideV"), -[WK_RTCI420Buffer width](v5, "width"), -[WK_RTCI420Buffer height](v5, "height"));
    v25 = pixelBufferOut;
    if (pixelBufferOut)
    {
LABEL_29:
      CVPixelBufferUnlockBaseAddress(v25, 1uLL);
      CVBufferRelease(pixelBufferOut);
    }
LABEL_30:
    CVPixelBufferUnlockBaseAddress(*p_pixelBuffer, 1uLL);
    v33 = v5;
    v5 = 0;
    goto LABEL_31;
  }
  if (PixelFormatType == 32)
    goto LABEL_19;
  if (PixelFormatType != 875704422)
    goto LABEL_30;
LABEL_7:
  BaseAddressOfPlane = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(*p_pixelBuffer, 0);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(*p_pixelBuffer, 0);
  v8 = (const char *)CVPixelBufferGetBaseAddressOfPlane(*p_pixelBuffer, 1uLL);
  v9 = CVPixelBufferGetBytesPerRowOfPlane(*p_pixelBuffer, 1uLL);
  cropX = self->_cropX;
  cropY = self->_cropY;
  if (cropY >= 0)
    v12 = self->_cropY;
  else
    v12 = cropY + 1;
  v45 = v12;
  *(_QWORD *)v38 = CVPixelBufferGetWidthOfPlane(self->_pixelBuffer, 0);
  *(_QWORD *)v36 = CVPixelBufferGetHeightOfPlane(*p_pixelBuffer, 0);
  v40 = cropX;
  v41 = v8;
  v42 = v9;
  v43 = BaseAddressOfPlane;
  v44 = BytesPerRowOfPlane;
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(*p_pixelBuffer, 1uLL);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(*p_pixelBuffer, 1uLL);
  v15 = -[WK_RTCI420Buffer width](v5, "width");
  v16 = -[WK_RTCI420Buffer height](v5, "height");
  v17 = -[WK_RTCI420Buffer chromaWidth](v5, "chromaWidth");
  v18 = -[WK_RTCI420Buffer chromaHeight](v5, "chromaHeight");
  if (-[WK_RTCCVPixelBuffer requiresCropping](self, "requiresCropping")
    || WidthOfPlane
    && WidthOfPlane == v17
    && HeightOfPlane
    && HeightOfPlane == v18
    && *(_QWORD *)v38 == v15
    && *(_QWORD *)v36 == v16)
  {
    pixelBufferOut = 0;
    v47 = 0;
    v48 = 0;
    cropWidth = self->_cropWidth;
    cropHeight = self->_cropHeight;
    v19 = -[WK_RTCMutableI420Buffer mutableDataY](v5, "mutableDataY");
    LODWORD(v35) = -[WK_RTCI420Buffer strideY](v5, "strideY");
    webrtc::NV12ToI420Scaler::NV12ToI420Scale((webrtc::NV12ToI420Scaler *)&pixelBufferOut, &v43[v40 + cropY * v44], v44, &v41[v40 + (v45 >> 1) * v42], v42, cropWidth, cropHeight, v19, v35, (int8x16_t *)-[WK_RTCMutableI420Buffer mutableDataU](v5, "mutableDataU"), -[WK_RTCI420Buffer strideU](v5, "strideU"), (int8x16_t *)-[WK_RTCMutableI420Buffer mutableDataV](v5, "mutableDataV"), -[WK_RTCI420Buffer strideV](v5, "strideV"), -[WK_RTCI420Buffer width](v5, "width"), -[WK_RTCI420Buffer height](v5, "height"));
    if (pixelBufferOut)
    {
      v47 = pixelBufferOut;
      operator delete(pixelBufferOut);
    }
    goto LABEL_30;
  }
  if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
    rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)5,unsigned long>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)5,unsigned long>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)5,unsigned long>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)5,unsigned long> const&)::t, v26, v27, v28, v29, v30, v31, v32, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_frame_buffer/RTCCVPixelBuffer.mm");
  CVPixelBufferUnlockBaseAddress(*p_pixelBuffer, 1uLL);
  v33 = 0;
LABEL_31:

  return v33;
}

- (void)cropAndScaleNV12To:(__CVBuffer *)a3 withTempBuffer:(char *)a4
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int Width;
  int Height;
  int BytesPerRowOfPlane;
  void *v18;
  unsigned int v19;
  unsigned __int8 *v20;
  const unsigned __int8 *v21;
  char *v22;
  const unsigned __int8 *v23;
  unsigned __int8 *v24;
  int v25;
  int8x16_t *BaseAddressOfPlane;

  v6 = CVPixelBufferLockBaseAddress(a3, 0);
  if ((_DWORD)v6)
  {
    v7 = HIDWORD(v6);
    if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
    {
      v25 = v7;
      rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_frame_buffer/RTCCVPixelBuffer.mm");
    }
  }
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  BaseAddressOfPlane = (int8x16_t *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  v18 = CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
  v19 = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
  CVPixelBufferLockBaseAddress(self->_pixelBuffer, 1uLL);
  v20 = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(self->_pixelBuffer, 0);
  v21 = (const unsigned __int8 *)CVPixelBufferGetBytesPerRowOfPlane(self->_pixelBuffer, 0);
  v22 = (char *)CVPixelBufferGetBaseAddressOfPlane(self->_pixelBuffer, 1uLL);
  LODWORD(v24) = BytesPerRowOfPlane;
  v23 = (const unsigned __int8 *)CVPixelBufferGetBytesPerRowOfPlane(self->_pixelBuffer, 1uLL);
  webrtc::NV12Scale((unsigned __int8 *)a4, &v20[self->_cropX + self->_cropY * (int)v21], v21, &v22[self->_cropX + self->_cropY / 2 * (int)v23], v23, self->_cropWidth, self->_cropHeight, BaseAddressOfPlane, v24, (uint64_t)v18, (unsigned __int8 *)__PAIR64__(Width, v19), Height, v25, (int)BaseAddressOfPlane);
  CVPixelBufferUnlockBaseAddress(self->_pixelBuffer, 1uLL);
  CVPixelBufferUnlockBaseAddress(a3, 0);
}

- (void)cropAndScaleARGBTo:(__CVBuffer *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int Width;
  int Height;
  int8x16_t *BaseAddress;
  int BytesPerRow;
  void *v16;
  int v17;
  int cropHeight;
  uint64_t cropWidth;

  if (CVPixelBufferLockBaseAddress(a3, 0) && (rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
    rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v5, v6, v7, v8, v9, v10, v11, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_frame_buffer/RTCCVPixelBuffer.mm");
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  BaseAddress = (int8x16_t *)CVPixelBufferGetBaseAddress(a3);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  CVPixelBufferLockBaseAddress(self->_pixelBuffer, 1uLL);
  v16 = CVPixelBufferGetBaseAddress(self->_pixelBuffer);
  v17 = CVPixelBufferGetBytesPerRow(self->_pixelBuffer);
  if (Height >= 1 && Width >= 1)
  {
    if (BaseAddress)
    {
      cropHeight = self->_cropHeight;
      if (cropHeight <= 0x8000)
      {
        cropWidth = self->_cropWidth;
        if ((int)cropWidth <= 0x8000 && v16 && (_DWORD)cropWidth && cropHeight)
          libyuv::ScaleARGB((uint64_t)v16 + 4 * self->_cropX + self->_cropY * (uint64_t)v17, v17, cropWidth, cropHeight, BaseAddress, BytesPerRow, Width, Height, 0, 0, Width, Height, 3);
      }
    }
  }
  CVPixelBufferUnlockBaseAddress(self->_pixelBuffer, 1uLL);
  CVPixelBufferUnlockBaseAddress(a3, 0);
}

- (void)close
{
  CVBufferRelease(self->_pixelBuffer);
  self->_pixelBuffer = 0;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (int)cropX
{
  return self->_cropX;
}

- (int)cropY
{
  return self->_cropY;
}

- (int)cropWidth
{
  return self->_cropWidth;
}

- (int)cropHeight
{
  return self->_cropHeight;
}

@end
