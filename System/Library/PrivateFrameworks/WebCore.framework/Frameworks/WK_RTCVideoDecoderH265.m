@implementation WK_RTCVideoDecoderH265

- (WK_RTCVideoDecoderH265)init
{
  WK_RTCVideoDecoderH265 *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WK_RTCVideoDecoderH265;
  result = -[WK_RTCVideoDecoderH265 init](&v3, sel_init);
  if (result)
    result->_useHEVC = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[WK_RTCVideoDecoderH265 destroyDecompressionSession](self, "destroyDecompressionSession");
  -[WK_RTCVideoDecoderH265 setVideoFormat:](self, "setVideoFormat:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WK_RTCVideoDecoderH265;
  -[WK_RTCVideoDecoderH265 dealloc](&v3, sel_dealloc);
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
  v11 = -[WK_RTCVideoDecoderH265 decodeData:size:timeStamp:](self, "decodeData:size:timeStamp:", v9, objc_msgSend(v10, "length"), objc_msgSend(v7, "timeStamp"));

  return v11;
}

- (int64_t)decodeData:(const char *)a3 size:(unint64_t)a4 timeStamp:(int64_t)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  CMFormatDescriptionRef H265VideoFormatDescription;
  const opaqueCMFormatDescription *v19;
  CMBlockBufferRef v20;
  CMBlockBufferRef v21;
  unint64_t v22;
  uint64_t v23;
  unsigned __int8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int8 *v29;
  unsigned int *v30;
  _QWORD *v31;
  unsigned int *v32;
  unsigned int v33;
  uint64_t v34;
  unsigned int *v35;
  unsigned int v36;
  unsigned int v37;
  BOOL v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  opaqueCMFormatDescription *videoFormat;
  const __CFAllocator *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  OpaqueCMBlockBuffer *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  opaqueCMSampleBuffer *v71;
  int v72;
  OSStatus v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t reorderSize;
  OSStatus v83;
  _QWORD *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  CMSampleBufferRef sampleBuffer;
  CMBlockBufferRef destinationBuffer;
  _QWORD v95[3];
  char v96;
  unsigned __int8 *v97;
  opaqueCMSampleBuffer *v98;

  if (self->_error)
  {
    if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)2>() & 1) == 0)
      rtc::webrtc_logging_impl::Log("\r\t", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoDecoderH265.mm");
    self->_error = 0;
    return -1;
  }
  if (!a3 || !a4)
  {
    if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)2>() & 1) != 0)
      return -1;
LABEL_54:
    rtc::webrtc_logging_impl::Log("\r\t", v40, v41, v42, v43, v44, v45, v46, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoDecoderH265.mm");
    return -1;
  }
  if (!self->_useHEVC)
  {
    H265VideoFormatDescription = webrtc::CreateH265VideoFormatDescription((webrtc *)a3, (const unsigned __int8 *)a4);
    if (H265VideoFormatDescription)
    {
      v19 = H265VideoFormatDescription;
      webrtc::H264::FindNaluIndices((webrtc::H264 *)a3, (const unsigned __int8 *)a4, (char **)&destinationBuffer);
      v20 = destinationBuffer;
      if (destinationBuffer == (CMBlockBufferRef)v95[0])
      {
        v24 = 0;
LABEL_42:
        if (destinationBuffer)
LABEL_43:
          operator delete(v20);
      }
      else
      {
        v21 = destinationBuffer;
        while (1)
        {
          v22 = *((_QWORD *)v21 + 2);
          if (v22)
          {
            v23 = *((_QWORD *)v21 + 1);
            if ((a3[v23] & 0x7E) == 0x40)
              break;
          }
          v21 = (CMBlockBufferRef)((char *)v21 + 24);
          if (v21 == (CMBlockBufferRef)v95[0])
            goto LABEL_39;
        }
        v24 = 0;
        if (v21 == (CMBlockBufferRef)v95[0] || v22 < 3)
          goto LABEL_42;
        webrtc::H264::ParseRbsp((webrtc::H264 *)&a3[v23 + 2], v22 - 2, (unint64_t *)&v97);
        if (v98 == (opaqueCMSampleBuffer *)v97)
          v29 = 0;
        else
          v29 = v97;
        webrtc::H265VpsParser::ParseInternal(v29, v98 - (opaqueCMSampleBuffer *)v97, v25, v26, v27, v28, (uint64_t)&destinationBuffer);
        if (v97)
        {
          v98 = (opaqueCMSampleBuffer *)v97;
          operator delete(v97);
        }
        if (!v96)
        {
LABEL_39:
          v24 = 0;
          if (v20)
            goto LABEL_43;
          goto LABEL_44;
        }
        v30 = (unsigned int *)v95;
        v31 = (_QWORD *)((char *)v95 + 4 * HIDWORD(destinationBuffer) + 4);
        if (v95 != v31)
        {
          v32 = (unsigned int *)v95 + 1;
          if ((_QWORD *)((char *)v95 + 4) != v31)
          {
            v33 = v95[0];
            v34 = 4 * HIDWORD(destinationBuffer);
            v35 = (unsigned int *)v95 + 1;
            do
            {
              v37 = *v35++;
              v36 = v37;
              v38 = v33 >= v37;
              if (v33 <= v37)
                v33 = v36;
              if (!v38)
                v30 = v32;
              v32 = v35;
              v34 -= 4;
            }
            while (v34);
          }
        }
        v39 = *v30;
        if (v39 >= 0x10)
          v24 = 16;
        else
          v24 = v39;
        if (v20)
          goto LABEL_43;
      }
LABEL_44:
      pthread_mutex_lock(&self->_reorderQueue._reorderQueueLock.impl_.mutex_);
      self->_reorderQueue._reorderSize = v24;
      pthread_mutex_unlock(&self->_reorderQueue._reorderQueueLock.impl_.mutex_);
      CMVideoFormatDescriptionGetDimensions(v19);
      if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)1>() & 1) == 0)
        rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v47, v48, v49, v50, v51, v52, v53, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoDecoderH265.mm");
      if (!CMFormatDescriptionEqual(v19, self->_videoFormat))
      {
        -[WK_RTCVideoDecoderH265 setVideoFormat:](self, "setVideoFormat:", v19);
        v72 = -[WK_RTCVideoDecoderH265 resetDecompressionSession](self, "resetDecompressionSession");
        if (v72)
        {
          v13 = v72;
          CFRelease(v19);
          return v13;
        }
      }
      CFRelease(v19);
    }
  }
  videoFormat = self->_videoFormat;
  if (!videoFormat)
  {
    if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)2>() & 1) != 0)
      return -1;
    goto LABEL_54;
  }
  sampleBuffer = 0;
  if (self->_useHEVC)
  {
    destinationBuffer = 0;
    v55 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, a4, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, a4, 1u, &destinationBuffer))
    {
      if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
        rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v56, v57, v58, v59, v60, v61, v62, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoDecoderH265.mm");
      return -1;
    }
    v63 = destinationBuffer;
    if (CMBlockBufferReplaceDataBytes(a3, destinationBuffer, 0, a4))
    {
      if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
        rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v64, v65, v66, v67, v68, v69, v70, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoDecoderH265.mm");
      v71 = 0;
    }
    else
    {
      v97 = 0;
      v73 = CMSampleBufferCreate(v55, v63, 1u, 0, 0, videoFormat, 1, 0, 0, 0, 0, (CMSampleBufferRef *)&v97);
      if (v73 && (rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
        rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v74, v75, v76, v77, v78, v79, v80, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoDecoderH265.mm");
      if (v73)
        v71 = 0;
      else
        v71 = (opaqueCMSampleBuffer *)v97;
    }
    if (v63)
      CFRelease(v63);
    sampleBuffer = v71;
    if (!v71)
      return -1;
LABEL_72:
    v81 = (_QWORD *)operator new();
    pthread_mutex_lock(&self->_reorderQueue._reorderQueueLock.impl_.mutex_);
    reorderSize = self->_reorderQueue._reorderSize;
    pthread_mutex_unlock(&self->_reorderQueue._reorderQueueLock.impl_.mutex_);
    *v81 = a5;
    v81[1] = reorderSize;
    v83 = VTDecompressionSessionDecodeFrame(self->_decompressionSession, sampleBuffer, 1u, v81, 0);
    if (v83 == -12903)
    {
      if (-[WK_RTCVideoDecoderH265 resetDecompressionSession](self, "resetDecompressionSession"))
      {
        v83 = -12903;
      }
      else
      {
        v84 = (_QWORD *)operator new();
        pthread_mutex_lock(&self->_reorderQueue._reorderQueueLock.impl_.mutex_);
        v85 = self->_reorderQueue._reorderSize;
        pthread_mutex_unlock(&self->_reorderQueue._reorderQueueLock.impl_.mutex_);
        *v84 = a5;
        v84[1] = v85;
        v83 = VTDecompressionSessionDecodeFrame(self->_decompressionSession, sampleBuffer, 1u, v84, 0);
      }
    }
    CFRelease(sampleBuffer);
    if (!v83)
      return 0;
    if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
      rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v86, v87, v88, v89, v90, v91, v92, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoDecoderH265.mm");
    return -1;
  }
  if (webrtc::H265AnnexBBufferToCMSampleBuffer((webrtc *)a3, (const unsigned __int8 *)a4, videoFormat, &sampleBuffer, (opaqueCMSampleBuffer **)a5))goto LABEL_72;
  return -1;
}

- (int64_t)setHVCCFormat:(const char *)a3 size:(unint64_t)a4 width:(unsigned __int16)a5 height:(unsigned __int16)a6
{
  int32_t v6;
  int32_t v7;
  const CFDictionaryKeyCallBacks *v11;
  const CFDictionaryValueCallBacks *v12;
  const __CFDictionary *v13;
  OSStatus v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  const opaqueCMFormatDescription *v23;
  unsigned __int8 *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  unsigned __int8 *v30;
  unsigned int v31;
  size_t v32;
  webrtc::H264 *v33;
  uint64_t v34;
  unsigned __int8 *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned __int8 *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned __int8 *v47;
  int64_t result;
  int v49;
  int v50;
  unsigned __int8 *v51;
  int v52;
  uint64_t v53;
  unint64_t v54;
  unsigned __int8 *v55;
  int v56;
  unsigned int v57;
  int v58;
  unsigned int v59;
  unint64_t v60;
  unsigned int v61;
  unint64_t v62;
  uint64_t v63;
  int v64;
  int v65;
  unsigned int v66;
  int v67;
  unint64_t v68;
  unsigned int v69;
  unsigned __int8 *v70;
  unint64_t v71;
  int v72;
  BOOL v73;
  int v74;
  int v75;
  int v76;
  unsigned __int16 Bits;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unsigned __int8 *v82;
  uint64_t *v83;
  uint8x16_t *v84;
  uint64_t *v85;
  unsigned __int32 v87;
  uint64_t v88;
  unsigned __int32 *v89;
  unsigned __int32 v90;
  unsigned __int32 v91;
  BOOL v92;
  unsigned int v93;
  unsigned __int8 v94;
  int v95;
  uint64_t v96;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  CFTypeRef cf;
  void *values;
  void *keys;
  uint8x16_t v101[2];
  char v102;
  unsigned __int8 *v103;
  unsigned __int8 *v104;

  v6 = a6;
  v7 = a5;
  keys = CFSTR("hvcC");
  values = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)a3, a4);
  v11 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v12 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  cf = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v13 = CFDictionaryCreate(0, MEMORY[0x24BDC0B80], &cf, 1, v11, v12);
  formatDescriptionOut = 0;
  v14 = CMVideoFormatDescriptionCreate(0, 0x68766331u, v7, v6, v13, &formatDescriptionOut);
  CFRelease(values);
  CFRelease(cf);
  CFRelease(v13);
  if (v14)
  {
    if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
      rtc::webrtc_logging_impl::Log("\r\t", v15, v16, v17, v18, v19, v20, v21, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoDecoderH265.mm");
    return v14;
  }
  v23 = formatDescriptionOut;
  if (!formatDescriptionOut)
    goto LABEL_90;
  if (a4)
  {
    if ((a4 & 0x8000000000000000) != 0)
      abort();
    v24 = (unsigned __int8 *)operator new(a4);
    memcpy(v24, a3, a4);
    v29 = a4;
    if (&v24[a4] == v24)
      v30 = 0;
    else
      v30 = v24;
    if (((a4 >> 28) & 0x1FFFFFFFFLL) != 0)
    {
      result = (int64_t)rtc::webrtc_checks_impl::FatalLog("Source/webrtc/rtc_base/numerics/safe_conversions.h", 36, "IsValueInRangeForNumericType<Dst>(value)", _ZZN3rtc18webrtc_checks_impl11LogStreamerIJEE4CallIJEEEvPKciS5_DpRKT_E1t, v25, v26, v27, v28, v96);
      __break(1u);
      return result;
    }
  }
  else
  {
    v24 = 0;
    v29 = 0;
    v30 = 0;
  }
  v31 = 8 * v29;
  if (!v31)
    goto LABEL_23;
  v32 = 0;
  if (v31 < 0x10)
    goto LABEL_65;
  v33 = 0;
  if (*v30 > 1u)
    goto LABEL_66;
  v32 = 0;
  if (v31 - 152 < 0x11 || v31 == 144 || (v31 & 0xFFFFFFF0) == 0x80)
  {
LABEL_65:
    v33 = 0;
  }
  else
  {
    v33 = 0;
    if (v31 - 104 >= 0x11 && v31 != 96 && v31 - 16 >= 0x40 && (v31 & 0xFFFFFFF0) != 0x50)
    {
      v34 = (v31 - 73) >> 3;
      v35 = &v30[((v31 - 1) >> 3) - v34];
      v36 = (v31 - 89) >> 3;
      v37 = v34 - v36;
      v38 = (v31 - 97) >> 3;
      v39 = v37 + v36 - v38;
      v40 = (v31 - 113) >> 3;
      v41 = &v35[v39 + v38 - v40];
      v42 = (v31 - 129) >> 3;
      v43 = v40 - v42;
      v44 = (v31 - 137) >> 3;
      v45 = v43 + v42 - v44;
      v46 = (v31 - 145) >> 3;
      v47 = &v41[v45 + v44 - v46];
      v101[0].i64[0] = (uint64_t)&v47[v46 - ((v31 - 169) >> 3) + 1];
      v101[0].i8[12] = 0;
      if (v31 == 176)
      {
LABEL_23:
        v32 = 0;
        v33 = 0;
        goto LABEL_66;
      }
      v32 = 0;
      v92 = v31 >= 0xB8;
      v49 = v31 - 184;
      v101[0].i32[2] = v31 - 184;
      v51 = &v47[v46 - ((v31 - 169) >> 3) + 2];
      v50 = v47[v46 - ((v31 - 169) >> 3) + 1];
      v101[0].i64[0] = (uint64_t)v51;
      v33 = 0;
      if (v92 && v50)
      {
        v52 = 0;
        v53 = 23;
        do
        {
          v101[0].i8[12] = 0;
          if (v49 < 8)
            goto LABEL_23;
          v101[0].i32[2] = v49 - 8;
          v55 = v51 + 1;
          LODWORD(v54) = *v51;
          v101[0].i64[0] = (uint64_t)(v51 + 1);
          v56 = v49 & 7;
          if ((v49 & 7) != 0)
          {
            v57 = *v55;
            v101[0].i8[12] = 0;
            v58 = v49 - 24;
            if (v49 < 0x18)
              goto LABEL_23;
            v54 = ((unint64_t)(v54 & ~(-1 << v56)) << (8 - v56)) | (v57 >> v56);
            v101[0].i32[2] = v49 - 24;
            v59 = 16 - v56;
            v60 = (unint64_t)(v51[1] & ~(-1 << v56)) << (16 - v56);
            v55 = v51 + 2;
            v101[0].i64[0] = (uint64_t)(v51 + 2);
          }
          else
          {
            v101[0].i8[12] = 0;
            v58 = v49 - 24;
            if (v49 < 0x18)
              goto LABEL_23;
            v60 = 0;
            v101[0].i32[2] = v49 - 24;
            v59 = 16;
          }
          v61 = v59 - 8;
          v51 = v55 + 1;
          v62 = ((unint64_t)*v55 << (v59 - 8)) | v60;
          v101[0].i64[0] = (uint64_t)(v55 + 1);
          if (v59 >= 0x10)
          {
            v61 = v59 - 16;
            v62 |= (unint64_t)v55[1] << (v59 - 16);
            v51 = v55 + 2;
            v101[0].i64[0] = (uint64_t)(v55 + 2);
          }
          if (v61)
            LODWORD(v62) = v62 | (*v51 >> (8 - v61));
          v63 = v53 + 3;
          v101[0].i8[12] = 1;
          LODWORD(v62) = (unsigned __int16)v62;
          if ((_WORD)v62)
          {
            if ((v54 & 0x3F) != 0x20)
            {
              while (1)
              {
                v101[0].i8[12] = 0;
                v64 = v58 - 16;
                if (v58 < 16)
                  goto LABEL_23;
                v101[0].i32[2] = v58 - 16;
                v65 = v58 & 7;
                if ((v58 & 7) != 0)
                {
                  v66 = 16 - v65;
                  v67 = *v51++;
                  v68 = (unint64_t)(v67 & ~(-1 << v65)) << (16 - v65);
                  v101[0].i64[0] = (uint64_t)v51;
                }
                else
                {
                  v68 = 0;
                  v66 = 16;
                }
                v69 = v66 - 8;
                v70 = v51 + 1;
                v71 = ((unint64_t)*v51 << (v66 - 8)) | v68;
                v101[0].i64[0] = (uint64_t)(v51 + 1);
                if (v66 >= 0x10)
                {
                  v69 = v66 - 16;
                  v71 |= (unint64_t)v51[1] << (v66 - 16);
                  v70 = v51 + 2;
                  v101[0].i64[0] = (uint64_t)(v51 + 2);
                }
                if (v69)
                  LODWORD(v71) = v71 | (*v70 >> (8 - v69));
                v72 = 8 * (unsigned __int16)v71;
                v49 = v64 - v72;
                if (v64 < v72)
                  goto LABEL_23;
                v32 = 0;
                v74 = v58 - 9;
                v73 = v58 < 9;
                v75 = v58 - 2;
                if (v73)
                  v74 = v75;
                v76 = v49 + 7;
                if (v49 < -7)
                  v76 = v49 + 14;
                v51 = &v70[(v74 >> 3) - (v76 >> 3)];
                v101[0].i64[0] = (uint64_t)v51;
                v101[0].i32[2] = v49;
                v101[0].i8[12] = 1;
                v33 = 0;
                if ((unsigned __int16)v71 < 3u || v49 < 0)
                  goto LABEL_66;
                v63 += 2 + (unsigned __int16)v71;
                v58 = v49;
                LODWORD(v62) = v62 - 1;
                if (!(_DWORD)v62)
                  goto LABEL_60;
              }
            }
            Bits = webrtc::BitstreamReader::ReadBits(v101, 16);
            v32 = 0;
            if (Bits < 3u)
              goto LABEL_65;
            v33 = 0;
            if (v101[0].i32[2] >= 8 * Bits)
            {
              v33 = (webrtc::H264 *)&a3[v53 + 7];
              v32 = Bits - 2;
            }
            break;
          }
          v49 = v58;
LABEL_60:
          v32 = 0;
          v33 = 0;
          ++v52;
          v53 = v63;
        }
        while (v52 != v50);
      }
    }
  }
LABEL_66:
  if (v24)
    operator delete(v24);
  if (!v32)
    goto LABEL_88;
  webrtc::H264::ParseRbsp(v33, v32, (unint64_t *)&v103);
  if (v104 == v103)
    v82 = 0;
  else
    v82 = v103;
  webrtc::H265VpsParser::ParseInternal(v82, v104 - v103, v78, v79, v80, v81, (uint64_t)v101);
  if (v103)
  {
    v104 = v103;
    operator delete(v103);
  }
  if (v102)
  {
    v83 = &v101[0].i64[1];
    v84 = (uint8x16_t *)((char *)&v101[0].u64[1] + 4 * v101[0].u32[1] + 4);
    v85 = (uint64_t *)((char *)&v101[0].i64[1] + 4);
    if (&v101[0].u64[1] != (unint64_t *)v84 && (uint8x16_t *)((char *)&v101[0].u64[1] + 4) != v84)
    {
      v87 = v101[0].u32[2];
      v88 = 4 * v101[0].u32[1];
      v89 = &v101[0].u32[3];
      do
      {
        v91 = *v89++;
        v90 = v91;
        v92 = v87 >= v91;
        if (v87 <= v91)
          v87 = v90;
        if (!v92)
          v83 = v85;
        v85 = (uint64_t *)v89;
        v88 -= 4;
      }
      while (v88);
    }
    v93 = *(_DWORD *)v83;
    if (v93 >= 0x10)
      v94 = 16;
    else
      v94 = v93;
  }
  else
  {
LABEL_88:
    v94 = 0;
  }
  pthread_mutex_lock(&self->_reorderQueue._reorderQueueLock.impl_.mutex_);
  self->_reorderQueue._reorderSize = v94;
  pthread_mutex_unlock(&self->_reorderQueue._reorderQueueLock.impl_.mutex_);
  if (!CMFormatDescriptionEqual(v23, self->_videoFormat))
  {
    -[WK_RTCVideoDecoderH265 setVideoFormat:](self, "setVideoFormat:", v23);
    v95 = -[WK_RTCVideoDecoderH265 resetDecompressionSession](self, "resetDecompressionSession");
    if (v95)
    {
      v22 = v95;
      if (!v23)
        return v22;
      goto LABEL_91;
    }
  }
LABEL_90:
  v22 = 0;
  self->_useHEVC = 1;
  if (v23)
LABEL_91:
    CFRelease(v23);
  return v22;
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

  -[WK_RTCVideoDecoderH265 destroyDecompressionSession](self, "destroyDecompressionSession");
  -[WK_RTCVideoDecoderH265 setVideoFormat:](self, "setVideoFormat:", 0);
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
  VTDecompressionOutputCallbackRecord v12;
  uint64_t valuePtr;
  void *values[3];
  void *keys[4];

  keys[3] = *(void **)MEMORY[0x24BDAC8D0];
  -[WK_RTCVideoDecoderH265 destroyDecompressionSession](self, "destroyDecompressionSession");
  if (self->_videoFormat)
  {
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
    v12.decompressionOutputCallback = (VTDecompressionOutputCallback)h265DecompressionOutputCallback;
    v12.decompressionOutputRefCon = self;
    v10 = VTDecompressionSessionCreate(0, self->_videoFormat, 0, v9, &v12, &self->_decompressionSession);
    CFRelease(v9);
    if (v10)
    {
      -[WK_RTCVideoDecoderH265 destroyDecompressionSession](self, "destroyDecompressionSession");
      return -1;
    }
    -[WK_RTCVideoDecoderH265 configureDecompressionSession](self, "configureDecompressionSession");
  }
  return 0;
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
