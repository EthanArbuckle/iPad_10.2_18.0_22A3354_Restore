@implementation WK_RTCVideoDecoderH264

- (WK_RTCVideoDecoderH264)init
{
  WK_RTCVideoDecoderH264 *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WK_RTCVideoDecoderH264;
  v2 = -[WK_RTCVideoDecoderH264 init](&v4, sel_init);
  if (v2)
  {
    v2->_memoryPool = CMMemoryPoolCreate(0);
    v2->_useAVC = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  CMMemoryPoolInvalidate(self->_memoryPool);
  CFRelease(self->_memoryPool);
  -[WK_RTCVideoDecoderH264 destroyDecompressionSession](self, "destroyDecompressionSession");
  -[WK_RTCVideoDecoderH264 setVideoFormat:](self, "setVideoFormat:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WK_RTCVideoDecoderH264;
  -[WK_RTCVideoDecoderH264 dealloc](&v3, sel_dealloc);
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
  objc_msgSend(v7, "buffer");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "bytes");
  objc_msgSend(v7, "buffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WK_RTCVideoDecoderH264 decodeData:size:timeStamp:](self, "decodeData:size:timeStamp:", v9, objc_msgSend(v10, "length"), objc_msgSend(v7, "timeStamp"));

  return v11;
}

- (int64_t)decodeData:(const char *)a3 size:(unint64_t)a4 timeStamp:(int64_t)a5
{
  OpaqueCMMemoryPool *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  CMFormatDescriptionRef VideoFormatDescription;
  CMFormatDescriptionRef v20;
  unsigned __int8 v21;
  opaqueCMFormatDescription *videoFormat;
  const __CFAllocator *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  OpaqueCMBlockBuffer *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  opaqueCMSampleBuffer *v46;
  int v47;
  OSStatus v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t reorderSize;
  OSStatus v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  CMSampleBufferRef sampleBuffer;
  CMSampleBufferRef v76;
  CMBlockBufferRef destinationBuffer;

  if (self->_error)
  {
    if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)2>() & 1) == 0)
      rtc::webrtc_logging_impl::Log("\r\t", v7, v8, v9, v10, v11, v12, v13, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoDecoderH264.mm");
    self->_error = 0;
    return -1;
  }
  if (!a3 || !a4)
  {
    if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)2>() & 1) == 0)
      goto LABEL_48;
    return -1;
  }
  if (!self->_useAVC)
  {
    VideoFormatDescription = webrtc::CreateVideoFormatDescription((webrtc *)a3, (const unsigned __int8 *)a4);
    if (VideoFormatDescription)
    {
      v20 = VideoFormatDescription;
      v21 = webrtc::ComputeH264ReorderSizeFromAnnexB((webrtc *)a3, (const unsigned __int8 *)a4);
      pthread_mutex_lock(&self->_reorderQueue._reorderQueueLock.impl_.mutex_);
      self->_reorderQueue._reorderSize = v21;
      pthread_mutex_unlock(&self->_reorderQueue._reorderQueueLock.impl_.mutex_);
      if (!CMFormatDescriptionEqual(v20, self->_videoFormat))
      {
        -[WK_RTCVideoDecoderH264 setVideoFormat:](self, "setVideoFormat:", v20);
        v47 = -[WK_RTCVideoDecoderH264 resetDecompressionSession](self, "resetDecompressionSession");
        if (v47)
        {
          v14 = v47;
          CFRelease(v20);
          return v14;
        }
      }
      CFRelease(v20);
    }
  }
  videoFormat = self->_videoFormat;
  if (!videoFormat)
  {
    if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)2>() & 1) == 0)
      goto LABEL_48;
    return -1;
  }
  sampleBuffer = 0;
  if (!self->_useAVC)
  {
    if (!webrtc::H264AnnexBBufferToCMSampleBuffer((webrtc *)a3, (const unsigned __int8 *)a4, videoFormat, &sampleBuffer, (opaqueCMSampleBuffer **)self->_memoryPool, v5))return -1;
    goto LABEL_39;
  }
  destinationBuffer = 0;
  v23 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, a4, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, a4, 1u, &destinationBuffer))
  {
    if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
      rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v24, v25, v26, v27, v28, v29, v30, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoDecoderH264.mm");
    goto LABEL_47;
  }
  v38 = destinationBuffer;
  if (CMBlockBufferReplaceDataBytes(a3, destinationBuffer, 0, a4))
  {
    if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
      rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v39, v40, v41, v42, v43, v44, v45, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoDecoderH264.mm");
    v46 = 0;
  }
  else
  {
    v76 = 0;
    v48 = CMSampleBufferCreate(v23, v38, 1u, 0, 0, videoFormat, 1, 0, 0, 0, 0, &v76);
    if (v48 && (rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
      rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v49, v50, v51, v52, v53, v54, v55, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoDecoderH264.mm");
    if (v48)
      v46 = 0;
    else
      v46 = v76;
  }
  if (v38)
    CFRelease(v38);
  sampleBuffer = v46;
  if (v46)
  {
LABEL_39:
    v56 = (_QWORD *)operator new();
    pthread_mutex_lock(&self->_reorderQueue._reorderQueueLock.impl_.mutex_);
    reorderSize = self->_reorderQueue._reorderSize;
    pthread_mutex_unlock(&self->_reorderQueue._reorderQueueLock.impl_.mutex_);
    *v56 = a5;
    v56[1] = reorderSize;
    v58 = VTDecompressionSessionDecodeFrame(self->_decompressionSession, sampleBuffer, 1u, v56, 0);
    if ((v58 & 0xFFFFFFF7) == 0xFFFFCD91
      && !-[WK_RTCVideoDecoderH264 resetDecompressionSession](self, "resetDecompressionSession"))
    {
      if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)1>() & 1) == 0)
        rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*> const&)::t, v59, v60, v61, v62, v63, v64, v65, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoDecoderH264.mm");
      v66 = (_QWORD *)operator new();
      pthread_mutex_lock(&self->_reorderQueue._reorderQueueLock.impl_.mutex_);
      v67 = self->_reorderQueue._reorderSize;
      pthread_mutex_unlock(&self->_reorderQueue._reorderQueueLock.impl_.mutex_);
      *v66 = a5;
      v66[1] = v67;
      v58 = VTDecompressionSessionDecodeFrame(self->_decompressionSession, sampleBuffer, 1u, v66, 0);
    }
    CFRelease(sampleBuffer);
    if (!v58)
      return 0;
    if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
      rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v68, v69, v70, v71, v72, v73, v74, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoDecoderH264.mm");
    return -1;
  }
LABEL_47:
  if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
LABEL_48:
    rtc::webrtc_logging_impl::Log("\r\t", v31, v32, v33, v34, v35, v36, v37, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoDecoderH264.mm");
  return -1;
}

- (int64_t)setAVCFormat:(const char *)a3 size:(unint64_t)a4 width:(unsigned __int16)a5 height:(unsigned __int16)a6
{
  int32_t v6;
  int32_t v7;
  const CFDictionaryKeyCallBacks *v11;
  const CFDictionaryValueCallBacks *v12;
  const __CFDictionary *v13;
  OSStatus v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  const opaqueCMFormatDescription *v29;
  unsigned __int8 v30;
  int v31;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  CFTypeRef cf;
  void *values;
  void *keys;

  v6 = a6;
  v7 = a5;
  keys = CFSTR("avcC");
  values = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)a3, a4);
  v11 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v12 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  cf = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v13 = CFDictionaryCreate(0, MEMORY[0x24BDC0B80], &cf, 1, v11, v12);
  formatDescriptionOut = 0;
  v14 = CMVideoFormatDescriptionCreate(0, 0x61766331u, v7, v6, v13, &formatDescriptionOut);
  CFRelease(values);
  CFRelease(cf);
  CFRelease(v13);
  if (v14)
  {
    if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
      rtc::webrtc_logging_impl::Log("\r\t", v21, v22, v23, v24, v25, v26, v27, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoDecoderH264.mm");
    return v14;
  }
  else
  {
    v29 = formatDescriptionOut;
    if (formatDescriptionOut)
    {
      v30 = webrtc::ComputeH264ReorderSizeFromAVC((webrtc *)a3, a4, v15, v16, v17, v18, v19, v20);
      pthread_mutex_lock(&self->_reorderQueue._reorderQueueLock.impl_.mutex_);
      self->_reorderQueue._reorderSize = v30;
      pthread_mutex_unlock(&self->_reorderQueue._reorderQueueLock.impl_.mutex_);
      if (CMFormatDescriptionEqual(v29, self->_videoFormat)
        || (-[WK_RTCVideoDecoderH264 setVideoFormat:](self, "setVideoFormat:", v29),
            (v31 = -[WK_RTCVideoDecoderH264 resetDecompressionSession](self, "resetDecompressionSession")) == 0))
      {
        v28 = 0;
        self->_useAVC = 1;
      }
      else
      {
        v28 = v31;
      }
      CFRelease(v29);
    }
    else
    {
      v28 = 0;
      self->_useAVC = 1;
    }
  }
  return v28;
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

- (int64_t)releaseDecoder
{
  id callback;

  -[WK_RTCVideoDecoderH264 destroyDecompressionSession](self, "destroyDecompressionSession");
  -[WK_RTCVideoDecoderH264 setVideoFormat:](self, "setVideoFormat:", 0);
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
  CFNumberRef v8;
  const __CFDictionary *v9;
  OSStatus v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  VTDecompressionOutputCallbackRecord outputCallback;
  uint64_t valuePtr;
  void *values[3];
  void *keys[4];

  keys[3] = *(void **)MEMORY[0x24BDAC8D0];
  -[WK_RTCVideoDecoderH264 destroyDecompressionSession](self, "destroyDecompressionSession");
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
  valuePtr = 875704422;
  v8 = CFNumberCreate(0, kCFNumberLongType, &valuePtr);
  values[0] = *(void **)MEMORY[0x24BDBD270];
  values[1] = v7;
  values[2] = v8;
  v9 = CFDictionaryCreate(v4, (const void **)keys, (const void **)values, 3, v5, v6);
  if (v7)
    CFRelease(v7);
  if (v8)
    CFRelease(v8);
  outputCallback.decompressionOutputCallback = (VTDecompressionOutputCallback)decompressionOutputCallback;
  outputCallback.decompressionOutputRefCon = self;
  v10 = VTDecompressionSessionCreate(0, self->_videoFormat, 0, v9, &outputCallback, &self->_decompressionSession);
  CFRelease(v9);
  if (!v10)
  {
    -[WK_RTCVideoDecoderH264 configureDecompressionSession](self, "configureDecompressionSession");
    return 0;
  }
  if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
    rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoDecoderH264.mm");
  -[WK_RTCVideoDecoderH264 destroyDecompressionSession](self, "destroyDecompressionSession");
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
  uint64_t v4;
  void *v5;

  decompressionSession = self->_decompressionSession;
  if (decompressionSession)
    VTDecompressionSessionWaitForAsynchronousFrames(decompressionSession);
  webrtc::RTCVideoFrameReorderQueue::takeIfAny((webrtc::RTCVideoFrameReorderQueue *)&self->_reorderQueue);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      (*((void (**)(void))self->_callback + 2))();

      webrtc::RTCVideoFrameReorderQueue::takeIfAny((webrtc::RTCVideoFrameReorderQueue *)&self->_reorderQueue);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v5);
  }
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

- (void)processFrame:(id)a3 reorderSize:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  v8 = v6;
  if (self->_reorderQueue._reorderQueue.__size_.__value_ | a4)
  {
    webrtc::RTCVideoFrameReorderQueue::append((uint64_t)&self->_reorderQueue, v6, a4);
    while (1)
    {
      webrtc::RTCVideoFrameReorderQueue::takeIfAvailable((webrtc::RTCVideoFrameReorderQueue *)&self->_reorderQueue);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        break;
      (*((void (**)(void))self->_callback + 2))();

    }
  }
  else
  {
    (*((void (**)(void))self->_callback + 2))();
  }

}

- (void).cxx_destruct
{
  RTCVideoFrameReorderQueue *p_reorderQueue;
  void **begin;
  void **end;
  void *v6;
  void **v7;
  void **v8;

  p_reorderQueue = &self->_reorderQueue;
  pthread_mutex_destroy(&self->_reorderQueue._reorderQueueLock.impl_.mutex_);
  std::deque<std::unique_ptr<webrtc::RTCVideoFrameReorderQueue::RTCVideoFrameWithOrder>>::clear(p_reorderQueue);
  begin = self->_reorderQueue._reorderQueue.__map_.__begin_;
  end = self->_reorderQueue._reorderQueue.__map_.__end_;
  if (begin != end)
  {
    do
    {
      v6 = *begin++;
      operator delete(v6);
    }
    while (begin != end);
    v8 = self->_reorderQueue._reorderQueue.__map_.__begin_;
    v7 = self->_reorderQueue._reorderQueue.__map_.__end_;
    if (v7 != v8)
      self->_reorderQueue._reorderQueue.__map_.__end_ = (void **)((char *)v7
                                                                + (((char *)v8 - (char *)v7 + 7) & 0xFFFFFFFFFFFFFFF8));
  }
  if (p_reorderQueue->_reorderQueue.__map_.__first_)
    operator delete(p_reorderQueue->_reorderQueue.__map_.__first_);
  objc_storeStrong(&self->_callback, 0);
}

- (id).cxx_construct
{
  webrtc::RTCVideoFrameReorderQueue::RTCVideoFrameReorderQueue((webrtc::RTCVideoFrameReorderQueue *)&self->_reorderQueue);
  return self;
}

@end
