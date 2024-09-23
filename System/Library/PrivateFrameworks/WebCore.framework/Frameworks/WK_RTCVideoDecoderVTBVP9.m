@implementation WK_RTCVideoDecoderVTBVP9

- (WK_RTCVideoDecoderVTBVP9)init
{
  WK_RTCVideoDecoderVTBVP9 *v2;
  WK_RTCVideoDecoderVTBVP9 *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WK_RTCVideoDecoderVTBVP9;
  v2 = -[WK_RTCVideoDecoderVTBVP9 init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_shouldCheckFormat = 1;
    v2->_isVideoFullRange = 1;
    v2->_colorSpace = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[WK_RTCVideoDecoderVTBVP9 destroyDecompressionSession](self, "destroyDecompressionSession");
  -[WK_RTCVideoDecoderVTBVP9 setVideoFormat:](self, "setVideoFormat:", 0);
  CFRelease(self->_colorSpace);
  v3.receiver = self;
  v3.super_class = (Class)WK_RTCVideoDecoderVTBVP9;
  -[WK_RTCVideoDecoderVTBVP9 dealloc](&v3, sel_dealloc);
}

- (int64_t)startDecodeWithNumberOfCores:(int)a3
{
  return 0;
}

- (int64_t)decode:(id)a3 missingFrames:(BOOL)a4 codecSpecificInfo:(id)a5 renderTimeMs:(int64_t)a6
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  int64_t v11;

  v7 = a3;
  if (objc_msgSend(v7, "frameType") == 3)
    -[WK_RTCVideoDecoderVTBVP9 setWidth:height:](self, "setWidth:height:", (unsigned __int16)objc_msgSend(v7, "encodedWidth"), (unsigned __int16)objc_msgSend(v7, "encodedHeight"));
  objc_msgSend(v7, "buffer");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "bytes");
  objc_msgSend(v7, "buffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WK_RTCVideoDecoderVTBVP9 decodeData:size:timeStamp:](self, "decodeData:size:timeStamp:", v9, objc_msgSend(v10, "length"), objc_msgSend(v7, "timeStamp"));

  return v11;
}

- (void)setWidth:(unsigned __int16)a3 height:(unsigned __int16)a4
{
  self->_width = a3;
  self->_height = a4;
  self->_shouldCheckFormat = 1;
}

- (int64_t)decodeData:(const char *)a3 size:(unint64_t)a4 timeStamp:(int64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  int32_t width;
  int32_t height;
  const char *v22;
  char v23;
  BOOL v24;
  _BOOL4 v25;
  const __CFAllocator *v26;
  CFDataRef v27;
  void *v28;
  int64_t result;
  void *v30;
  CMVideoFormatDescriptionRef v31;
  opaqueCMFormatDescription *videoFormat;
  int64_t v33;
  const __CFAllocator *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  OpaqueCMBlockBuffer *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  opaqueCMSampleBuffer *v57;
  int64_t v58;
  OSStatus v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  OpaqueVTDecompressionSession *decompressionSession;
  OSStatus v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  OpaqueVTDecompressionSession *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  CMBlockBufferRef destinationBuffer;
  char v89;
  int v90;
  char v91;
  uint64_t v92;
  int32_t v93;
  int32_t v94;
  char v95;
  uint64_t v96;
  void *v97;
  const __CFString *v98;
  CFDataRef v99;
  _BYTE bytes[12];
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  if (self->_error)
  {
    if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)2>() & 1) == 0)
      rtc::webrtc_logging_impl::Log("\r\t", v9, v10, v11, v12, v13, v14, v15, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoDecoderVTBVP9.mm");
    self->_error = 0;
    return -1;
  }
  v17 = a5;
  if (!self->_shouldCheckFormat && self->_videoFormat)
    goto LABEL_43;
  width = self->_width;
  height = self->_height;
  if (a4)
    v22 = a3;
  else
    v22 = 0;
  webrtc::ParseUncompressedVp9Header((uint64_t)v22, a4, a5, v5, v6, v7, &destinationBuffer);
  if (!v95)
  {
    v17 = a5;
    goto LABEL_43;
  }
  if (v92 <= 3)
    v23 = 0x2040206u >> (8 * v92);
  else
    v23 = 6;
  if ((v92 & 0xFF00000000) == 0)
    v23 = 2;
  *(_QWORD *)&bytes[1] = 0;
  if (v91)
    v24 = v90 == 1;
  else
    v24 = 0;
  v25 = v24;
  *(_DWORD *)&bytes[8] = 514;
  bytes[0] = 1;
  bytes[4] = (_BYTE)destinationBuffer;
  bytes[5] = 10;
  bytes[6] = v23 | (16 * v89) | v25;
  bytes[7] = 2;
  v26 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v27 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, 12);
  v98 = CFSTR("vpcC");
  v99 = v27;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = *MEMORY[0x24BDC0B80];
  v97 = v28;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
  result = objc_claimAutoreleasedReturnValue();
  v30 = (void *)result;
  formatDescriptionOut = 0;
  if (width)
  {
    if (height)
      goto LABEL_31;
  }
  else
  {
    if (!v95)
      goto LABEL_75;
    width = v93;
    if (height)
      goto LABEL_31;
  }
  if (v95)
  {
    height = v94;
LABEL_31:
    if (CMVideoFormatDescriptionCreate(v26, 0x76703039u, width, height, (CFDictionaryRef)result, &formatDescriptionOut))
    {
      v25 = 0;
      v31 = 0;
    }
    else
    {
      v31 = formatDescriptionOut;
      if (formatDescriptionOut)
      {
        CFRetain(formatDescriptionOut);
        CFRelease(v31);
      }
    }

    if (v27)
      CFRelease(v27);
    v17 = a5;
    if (v31)
    {
      CFRetain(v31);
      self->_shouldCheckFormat = 0;
      if (!CMFormatDescriptionEqual(v31, self->_videoFormat) || v25 != self->_isVideoFullRange)
      {
        -[WK_RTCVideoDecoderVTBVP9 setVideoFormat:](self, "setVideoFormat:", v31);
        self->_isVideoFullRange = v25;
        LODWORD(v16) = -[WK_RTCVideoDecoderVTBVP9 resetDecompressionSession](self, "resetDecompressionSession");
        if ((_DWORD)v16)
        {
          -[WK_RTCVideoDecoderVTBVP9 setVideoFormat:](self, "setVideoFormat:", 0);
          v16 = (int)v16;
          CFRelease(v31);
          CFRelease(v31);
          return v16;
        }
      }
      CFRelease(v31);
      CFRelease(v31);
    }
LABEL_43:
    videoFormat = self->_videoFormat;
    if (!videoFormat)
    {
      if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)2>() & 1) == 0)
        rtc::webrtc_logging_impl::Log("\r\t", v42, v43, v44, v45, v46, v47, v48, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoDecoderVTBVP9.mm");
      return -1;
    }
    v33 = v17;
    destinationBuffer = 0;
    v34 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, a4, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, a4, 1u, &destinationBuffer))
    {
      if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
        rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v35, v36, v37, v38, v39, v40, v41, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoDecoderVTBVP9.mm");
      return -1;
    }
    v49 = destinationBuffer;
    if (CMBlockBufferReplaceDataBytes(a3, destinationBuffer, 0, a4))
    {
      if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) != 0)
      {
        v57 = 0;
        v58 = v33;
      }
      else
      {
        rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v50, v51, v52, v53, v54, v55, v56, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoDecoderVTBVP9.mm");
        v58 = v33;
        v57 = 0;
      }
    }
    else
    {
      *(_QWORD *)bytes = 0;
      v59 = CMSampleBufferCreate(v34, v49, 1u, 0, 0, videoFormat, 1, 0, 0, 0, 0, (CMSampleBufferRef *)bytes);
      v58 = v33;
      if (v59 && (rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
        rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v60, v61, v62, v63, v64, v65, v66, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoDecoderVTBVP9.mm");
      if (v59)
        v57 = 0;
      else
        v57 = *(opaqueCMSampleBuffer **)bytes;
    }
    if (v49)
      CFRelease(v49);
    if (!v57)
      return -1;
    destinationBuffer = 0;
    v67 = (_QWORD *)operator new();
    *v67 = MEMORY[0x20BD0B3A4](self->_callback);
    v67[1] = v58;
    decompressionSession = self->_decompressionSession;
    destinationBuffer = 0;
    v69 = VTDecompressionSessionDecodeFrame(decompressionSession, v57, 1u, v67, 0);
    if ((v69 & 0xFFFFFFF7) == 0xFFFFCD91)
    {
      if (-[WK_RTCVideoDecoderVTBVP9 resetDecompressionSession](self, "resetDecompressionSession"))
        goto LABEL_68;
      if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)1>() & 1) == 0)
        rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*> const&)::t, v70, v71, v72, v73, v74, v75, v76, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoDecoderVTBVP9.mm");
      v77 = (_QWORD *)operator new();
      *v77 = MEMORY[0x20BD0B3A4](self->_callback);
      v77[1] = v33;
      v78 = self->_decompressionSession;
      destinationBuffer = 0;
      v69 = VTDecompressionSessionDecodeFrame(v78, v57, 1u, v77, 0);
    }
    if (!v69)
    {
      v16 = 0;
LABEL_74:
      CFRelease(v57);
      return v16;
    }
LABEL_68:
    if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
      rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v79, v80, v81, v82, v83, v84, v85, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoDecoderVTBVP9.mm");
    v16 = -1;
    goto LABEL_74;
  }
LABEL_75:
  __break(1u);
  return result;
}

- (void)setCallback:(id)a3
{
  void *v4;
  id callback;

  v4 = (void *)MEMORY[0x20BD0B3A4](a3, a2);
  callback = self->_callback;
  self->_callback = v4;

}

- (void)setError:(int)a3
{
  self->_error = a3;
}

- (CGColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (int64_t)releaseDecoder
{
  id callback;

  -[WK_RTCVideoDecoderVTBVP9 destroyDecompressionSession](self, "destroyDecompressionSession");
  -[WK_RTCVideoDecoderVTBVP9 setVideoFormat:](self, "setVideoFormat:", 0);
  callback = self->_callback;
  self->_callback = 0;

  return 0;
}

- (int)resetDecompressionSession
{
  void *v3;
  const __CFAllocator *v4;
  const CFDictionaryKeyCallBacks *v5;
  const CFDictionaryValueCallBacks *v6;
  CFDictionaryRef v7;
  uint64_t v8;
  CFNumberRef v9;
  const __CFDictionary *v10;
  OSStatus v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  VTDecompressionOutputCallbackRecord outputCallback;
  uint64_t valuePtr;
  void *values[3];
  void *keys[4];

  keys[3] = *(void **)MEMORY[0x24BDAC8D0];
  -[WK_RTCVideoDecoderVTBVP9 destroyDecompressionSession](self, "destroyDecompressionSession");
  if (!self->_videoFormat)
    return 0;
  v3 = (void *)*MEMORY[0x24BDC5668];
  keys[0] = *(void **)MEMORY[0x24BDC5698];
  keys[1] = v3;
  keys[2] = *(void **)MEMORY[0x24BDC56B8];
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (self->_isVideoFullRange)
    v8 = 875704422;
  else
    v8 = 875704438;
  valuePtr = v8;
  v9 = CFNumberCreate(0, kCFNumberLongType, &valuePtr);
  values[0] = *(void **)MEMORY[0x24BDBD270];
  values[1] = v7;
  values[2] = v9;
  v10 = CFDictionaryCreate(v4, (const void **)keys, (const void **)values, 3, v5, v6);
  if (v7)
    CFRelease(v7);
  if (v9)
    CFRelease(v9);
  outputCallback.decompressionOutputCallback = (VTDecompressionOutputCallback)vp9DecompressionOutputCallback;
  outputCallback.decompressionOutputRefCon = self;
  v11 = VTDecompressionSessionCreate(0, self->_videoFormat, 0, v10, &outputCallback, &self->_decompressionSession);
  CFRelease(v10);
  if (!v11)
  {
    -[WK_RTCVideoDecoderVTBVP9 configureDecompressionSession](self, "configureDecompressionSession");
    return 0;
  }
  if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
    rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoDecoderVTBVP9.mm");
  -[WK_RTCVideoDecoderVTBVP9 destroyDecompressionSession](self, "destroyDecompressionSession");
  return -1;
}

- (void)configureDecompressionSession
{
  VTSessionSetProperty(self->_decompressionSession, (CFStringRef)*MEMORY[0x24BDF9430], (CFTypeRef)*MEMORY[0x24BDBD270]);
}

- (void)destroyDecompressionSession
{
  OpaqueVTDecompressionSession *decompressionSession;

  decompressionSession = self->_decompressionSession;
  if (decompressionSession)
  {
    VTDecompressionSessionWaitForAsynchronousFrames(decompressionSession);
    VTDecompressionSessionInvalidate(self->_decompressionSession);
    CFRelease(self->_decompressionSession);
    self->_decompressionSession = 0;
  }
}

- (void)flush
{
  OpaqueVTDecompressionSession *decompressionSession;

  decompressionSession = self->_decompressionSession;
  if (decompressionSession)
    VTDecompressionSessionWaitForAsynchronousFrames(decompressionSession);
}

- (void)setVideoFormat:(opaqueCMFormatDescription *)a3
{
  opaqueCMFormatDescription *videoFormat;

  videoFormat = self->_videoFormat;
  if (videoFormat != a3)
  {
    if (videoFormat)
      CFRelease(videoFormat);
    self->_videoFormat = a3;
    if (a3)
      CFRetain(a3);
  }
}

- (id)implementationName
{
  return CFSTR("VideoToolbox");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
}

@end
