@implementation WK_RTCVideoEncoderH265

- (WK_RTCVideoEncoderH265)initWithCodecInfo:(id)a3
{
  id v5;
  WK_RTCVideoEncoderH265 *v6;
  WK_RTCVideoEncoderH265 *v7;
  uint64_t v8;
  BitrateAdjuster *value;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  WK_RTCVideoEncoderH265 *result;
  uint64_t v16;
  objc_super v17;
  pthread_mutexattr_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WK_RTCVideoEncoderH265;
  v6 = -[WK_RTCVideoEncoderH265 init](&v17, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_6;
  objc_storeStrong((id *)&v6->_codecInfo, a3);
  v8 = operator new();
  *(_QWORD *)v8 = &off_24C0B0148;
  pthread_mutexattr_init(&v18);
  pthread_mutexattr_setpolicy_np(&v18, 3);
  pthread_mutex_init((pthread_mutex_t *)(v8 + 8), &v18);
  pthread_mutexattr_destroy(&v18);
  *(_QWORD *)(v8 + 72) = 0x3F7333333F000000;
  *(_OWORD *)(v8 + 112) = 0u;
  *(_OWORD *)(v8 + 128) = 0u;
  *(_OWORD *)(v8 + 96) = 0u;
  *(_QWORD *)(v8 + 144) = 0;
  *(_QWORD *)(v8 + 152) = -1;
  *(_BYTE *)(v8 + 160) = 0;
  *(_QWORD *)(v8 + 164) = 0x45FA000000000000;
  *(int64x2_t *)(v8 + 176) = vdupq_n_s64(0x5DCuLL);
  pthread_mutex_lock((pthread_mutex_t *)(v8 + 8));
  *(_DWORD *)(v8 + 80) = 0;
  *(_DWORD *)(v8 + 84) = 0;
  *(_DWORD *)(v8 + 88) = 0;
  *(_QWORD *)(v8 + 192) = 0;
  webrtc::RateStatistics::Reset((webrtc::RateStatistics *)(v8 + 96));
  pthread_mutex_unlock((pthread_mutex_t *)(v8 + 8));
  value = v7->_bitrateAdjuster.__ptr_.__value_;
  v7->_bitrateAdjuster.__ptr_.__value_ = (BitrateAdjuster *)v8;
  if (value)
    (*(void (**)(BitrateAdjuster *))(*(_QWORD *)value + 8))(value);
  *(_WORD *)&v7->_useAnnexB = 257;
  objc_msgSend(v5, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("H265")) & 1) != 0)
  {

LABEL_6:
    return v7;
  }
  result = (WK_RTCVideoEncoderH265 *)rtc::webrtc_checks_impl::FatalLog("/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH265.mm", 199, "[codecInfo.name isEqualToString:@\"H265\"]", _ZZN3rtc18webrtc_checks_impl11LogStreamerIJEE4CallIJEEEvPKciS5_DpRKT_E1t, v11, v12, v13, v14, v16);
  __break(1u);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[WK_RTCVideoEncoderH265 destroyCompressionSession](self, "destroyCompressionSession");
  v3.receiver = self;
  v3.super_class = (Class)WK_RTCVideoEncoderH265;
  -[WK_RTCVideoEncoderH265 dealloc](&v3, sel_dealloc);
}

- (int64_t)startEncodeWithSettings:(id)a3 numberOfCores:(int)a4
{
  id v5;
  unsigned int v6;
  BitrateAdjuster *value;
  unsigned int v8;
  unsigned int v9;
  int64_t v10;

  v5 = a3;
  self->_width = objc_msgSend(v5, "width");
  self->_height = objc_msgSend(v5, "height");
  self->_mode = objc_msgSend(v5, "mode");
  v6 = objc_msgSend(v5, "startBitrate");
  self->_targetBitrateBps = v6;
  value = self->_bitrateAdjuster.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)((char *)value + 8));
  v8 = *((_DWORD *)value + 20);
  if (!v8
    || (float)(vabds_f32((float)v6, (float)v8) / (float)v8) >= 0.1
    || (v9 = *((_DWORD *)value + 22)) == 0
    || (float)(vabds_f32((float)v6, (float)v9) / (float)v9) >= 0.1)
  {
    *((_DWORD *)value + 21) = v6;
    *((_DWORD *)value + 22) = v6;
  }
  *((_DWORD *)value + 20) = v6;
  pthread_mutex_unlock((pthread_mutex_t *)((char *)value + 8));
  v10 = -[WK_RTCVideoEncoderH265 resetCompressionSession](self, "resetCompressionSession");

  return v10;
}

- (void)setUseAnnexB:(BOOL)a3
{
  self->_useAnnexB = a3;
  self->_needsToSendDescription = !a3;
}

- (void)setLowLatency:(BOOL)a3
{
  self->_isLowLatencyEnabled = a3;
}

- (void)setDescriptionCallback:(id)a3
{
  void *v4;
  id descriptionCallback;

  v4 = (void *)MEMORY[0x20BD0B3A4](a3, a2);
  descriptionCallback = self->_descriptionCallback;
  self->_descriptionCallback = v4;

}

- (void)setErrorCallback:(id)a3
{
  void *v4;
  id errorCallback;

  v4 = (void *)MEMORY[0x20BD0B3A4](a3, a2);
  errorCallback = self->_errorCallback;
  self->_errorCallback = v4;

}

- (int64_t)encode:(id)a3 codecSpecificInfo:(id)a4 frameTypes:(id)a5
{
  id v8;
  id v9;
  id v10;
  OpaqueVTCompressionSession *compressionSession;
  CVPixelBufferPoolRef PixelBufferPool;
  __CVPixelBufferPool *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char isKindOfClass;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (**v31)(id, uint64_t);
  int64_t v32;
  __CVBuffer *value;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
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
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  size_t Width;
  size_t Height;
  int v69;
  char *begin;
  char *end;
  void (**errorCallback)(id, uint64_t);
  void *v73;
  const __CFDictionary *v74;
  _QWORD *v75;
  __CVBuffer *v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  WK_RTCVideoEncoderH265 *v82;
  BitrateAdjuster *v83;
  uint64_t v84;
  __CVBuffer *v85;
  OpaqueVTCompressionSession *v86;
  __CVBuffer *v87;
  OSStatus v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id *v96;
  char *BaseAddressOfPlane;
  int BytesPerRowOfPlane;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void (**v106)(id, uint64_t);
  char *v108;
  char *v109;
  uint64_t v110;
  char *v111;
  char *v112;
  char *v113;
  char *v114;
  char v115;
  unint64_t v116;
  char *v117;
  char *v118;
  unint64_t v119;
  __int128 v120;
  char *v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  int v125;
  char *v126;
  void *v127;
  unint64_t v128;
  id v129;
  _BOOL4 v130;
  CMTime duration;
  CMTime presentationTimeStamp;
  CMTime pixelBufferOut;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  void *values;
  void *keys;
  _BYTE v140[128];
  uint64_t v141;

  v141 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_callback)
  {
    compressionSession = self->_compressionSession;
    if (compressionSession)
    {
      PixelBufferPool = VTCompressionSessionGetPixelBufferPool(compressionSession);
      v130 = PixelBufferPool == 0;
      v13 = PixelBufferPool;
      if (!PixelBufferPool)
      {
        -[WK_RTCVideoEncoderH265 resetCompressionSession](self, "resetCompressionSession");
        v13 = VTCompressionSessionGetPixelBufferPool(self->_compressionSession);
        if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)1>() & 1) == 0)
          rtc::webrtc_logging_impl::Log("\r\t", v14, v15, v16, v17, v18, v19, v20, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH265.mm");
      }
      objc_msgSend(v8, "buffer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_28;
      objc_msgSend(v8, "buffer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v23, "requiresCropping") & 1) == 0)
      {
        value = (__CVBuffer *)objc_msgSend(v23, "pixelBuffer");
        CVBufferRetain(value);
        goto LABEL_16;
      }
      if (!v13)
      {
        if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
          rtc::webrtc_logging_impl::Log("\r\t", v60, v61, v62, v63, v64, v65, v66, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH265.mm");
LABEL_44:
        errorCallback = (void (**)(id, uint64_t))self->_errorCallback;
        if (!errorCallback)
        {
LABEL_46:

LABEL_69:
          v32 = -1;
          goto LABEL_70;
        }
LABEL_45:
        errorCallback[2](errorCallback, 0xFFFFFFFFLL);
        goto LABEL_46;
      }
      pixelBufferOut.value = 0;
      if (CVPixelBufferPoolCreatePixelBuffer(0, v13, (CVPixelBufferRef *)&pixelBufferOut))
      {
        if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
          rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v24, v25, v26, v27, v28, v29, v30, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH265.mm");
        goto LABEL_44;
      }
      value = (__CVBuffer *)pixelBufferOut.value;
      if (!pixelBufferOut.value)
        goto LABEL_44;
      Width = CVPixelBufferGetWidth((CVPixelBufferRef)pixelBufferOut.value);
      Height = CVPixelBufferGetHeight(value);
      if (objc_msgSend(v23, "requiresScalingToWidth:height:", Width, Height))
      {
        v69 = objc_msgSend(v23, "bufferSizeForCroppingAndScalingToWidth:height:", Width, Height);
        begin = self->_nv12ScaleBuffer.__begin_;
        end = self->_nv12ScaleBuffer.__end_;
        if (v69 <= (unint64_t)(end - begin))
        {
          if (v69 < (unint64_t)(end - begin))
          {
            end = &begin[v69];
            self->_nv12ScaleBuffer.__end_ = end;
          }
        }
        else
        {
          std::vector<unsigned char>::__append(&self->_nv12ScaleBuffer.__begin_, v69 - (end - begin));
          begin = self->_nv12ScaleBuffer.__begin_;
          end = self->_nv12ScaleBuffer.__end_;
        }
      }
      else
      {
        end = self->_nv12ScaleBuffer.__begin_;
        self->_nv12ScaleBuffer.__end_ = end;
        begin = end;
      }
      v108 = (char *)(end - begin);
      if ((char *)(self->_nv12ScaleBuffer.__end_cap_.__value_ - begin) <= (char *)(end - begin))
      {
        v108 = begin;
        goto LABEL_87;
      }
      if (end == begin)
      {
        v111 = (char *)(end - begin);
        goto LABEL_85;
      }
      v128 = end - begin;
      v109 = (char *)operator new(end - begin);
      v108 = v109;
      v110 = end - begin;
      v111 = &v109[end - begin];
      if ((unint64_t)(end - begin) < 8 || (unint64_t)(begin - v109) < 0x20)
      {
        v112 = end;
        v113 = &v109[v128];
        goto LABEL_77;
      }
      if (v128 >= 0x20)
      {
        v116 = v128 & 0xFFFFFFFFFFFFFFE0;
        v117 = end - 16;
        v118 = &v109[end - 16 - begin];
        v119 = v128 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v120 = *(_OWORD *)v117;
          *((_OWORD *)v118 - 1) = *((_OWORD *)v117 - 1);
          *(_OWORD *)v118 = v120;
          v118 -= 32;
          v117 -= 32;
          v119 -= 32;
        }
        while (v119);
        if (v110 == v116)
          goto LABEL_85;
        if ((v110 & 0x18) == 0)
        {
          v113 = &v111[-v116];
          v112 = &end[-v116];
LABEL_77:
          v114 = v113 - 1;
          do
          {
            v115 = *--v112;
            *v114-- = v115;
          }
          while (v112 != begin);
          goto LABEL_85;
        }
      }
      else
      {
        v116 = 0;
      }
      v112 = &end[-(v110 & 0xFFFFFFFFFFFFFFF8)];
      v113 = &v111[-(v110 & 0xFFFFFFFFFFFFFFF8)];
      v121 = &end[-v116 - 8];
      v122 = v121 - begin;
      v123 = v116 - (v110 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        v124 = *(_QWORD *)v121;
        v121 -= 8;
        *(_QWORD *)&v109[v122] = v124;
        v122 -= 8;
        v123 += 8;
      }
      while (v123);
      if (v110 != (v110 & 0xFFFFFFFFFFFFFFF8))
        goto LABEL_77;
LABEL_85:
      self->_nv12ScaleBuffer.__begin_ = v108;
      self->_nv12ScaleBuffer.__end_ = v111;
      self->_nv12ScaleBuffer.__end_cap_.__value_ = v111;
      if (begin)
      {
        operator delete(begin);
        v108 = self->_nv12ScaleBuffer.__begin_;
      }
LABEL_87:
      if ((objc_msgSend(v23, "cropAndScaleTo:withTempBuffer:", value, v108) & 1) == 0)
      {
        errorCallback = (void (**)(id, uint64_t))self->_errorCallback;
        if (!errorCallback)
          goto LABEL_46;
        goto LABEL_45;
      }
LABEL_16:

      if (value)
      {
LABEL_17:
        v129 = v9;
        if (v10 && PixelBufferPool)
        {
          v136 = 0u;
          v137 = 0u;
          v134 = 0u;
          v135 = 0u;
          v34 = v10;
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v134, v140, 16);
          if (v35)
          {
            v36 = *(_QWORD *)v135;
            while (2)
            {
              for (i = 0; i != v35; ++i)
              {
                if (*(_QWORD *)v135 != v36)
                  objc_enumerationMutation(v34);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v134 + 1) + 8 * i), "intValue") == 3)
                {
                  v130 = 1;
                  goto LABEL_48;
                }
              }
              v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v134, v140, 16);
              if (v35)
                continue;
              break;
            }
          }
          v130 = 0;
LABEL_48:

        }
        memset(&pixelBufferOut, 0, sizeof(pixelBufferOut));
        CMTimeMake(&pixelBufferOut, objc_msgSend(v8, "timeStampNs") / 1000000, 1000);
        if (v130)
        {
          v73 = (void *)*MEMORY[0x24BDF9578];
          values = (void *)*MEMORY[0x24BDBD270];
          keys = v73;
          v74 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)&keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        }
        else
        {
          v74 = 0;
        }
        keys = 0;
        v75 = (_QWORD *)operator new();
        v76 = value;
        v77 = *(_QWORD *)&self->_width;
        v78 = objc_msgSend(v8, "timeStampNs");
        v79 = objc_msgSend(v8, "timeStamp");
        v80 = objc_msgSend(v8, "rotation");
        v81 = v78 / 1000000;
        v82 = self;
        *v75 = v82;
        v75[1] = v77;
        v75[2] = v81;
        *((_DWORD *)v75 + 6) = v79;
        v75[4] = v80;
        keys = v75;
        v83 = v82->_bitrateAdjuster.__ptr_.__value_;
        pthread_mutex_lock((pthread_mutex_t *)((char *)v83 + 8));
        v84 = *((unsigned int *)v83 + 21);
        pthread_mutex_unlock((pthread_mutex_t *)((char *)v83 + 8));
        -[WK_RTCVideoEncoderH265 setBitrateBps:](v82, "setBitrateBps:", v84);
        v85 = v76;
        v86 = self->_compressionSession;
        presentationTimeStamp = pixelBufferOut;
        duration = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
        keys = 0;
        v87 = v76;
        v9 = v129;
        v88 = VTCompressionSessionEncodeFrame(v86, v87, &presentationTimeStamp, &duration, v74, v75, 0);
        if (v74)
          CFRelease(v74);
        CVBufferRelease(v85);
        if (v88)
        {
          if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
            rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v89, v90, v91, v92, v93, v94, v95, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH265.mm");
          v32 = -1;
          v96 = (id *)keys;
          if (!keys)
            goto LABEL_70;
        }
        else
        {
          v32 = 0;
          v96 = (id *)keys;
          if (!keys)
            goto LABEL_70;
        }

        MEMORY[0x20BD0ADEC](v96, 0x1080C40B94625D9);
        goto LABEL_70;
      }
LABEL_28:
      if (!v13)
      {
        if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
          rtc::webrtc_logging_impl::Log("\r\t", v45, v46, v47, v48, v49, v50, v51, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH265.mm");
        goto LABEL_67;
      }
      pixelBufferOut.value = 0;
      if (CVPixelBufferPoolCreatePixelBuffer(0, v13, (CVPixelBufferRef *)&pixelBufferOut))
      {
        if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
          rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v38, v39, v40, v41, v42, v43, v44, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH265.mm");
        goto LABEL_67;
      }
      value = (__CVBuffer *)pixelBufferOut.value;
      if (!pixelBufferOut.value)
      {
LABEL_67:
        v106 = (void (**)(id, uint64_t))self->_errorCallback;
        if (v106)
          v106[2](v106, 0xFFFFFFFFLL);
        goto LABEL_69;
      }
      objc_msgSend(v8, "buffer");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "toI420");
      v52 = (id)objc_claimAutoreleasedReturnValue();
      if (CVPixelBufferLockBaseAddress(value, 0))
      {
        if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) != 0)
        {
LABEL_64:

          if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
            rtc::webrtc_logging_impl::Log("\r\t", v99, v100, v101, v102, v103, v104, v105, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH265.mm");
          CVBufferRelease(value);
          goto LABEL_67;
        }
      }
      else
      {
        BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(value, 0);
        BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(value, 0);
        v126 = (char *)CVPixelBufferGetBaseAddressOfPlane(value, 1uLL);
        v125 = CVPixelBufferGetBytesPerRowOfPlane(value, 1uLL);
        LODWORD(BaseAddressOfPlane) = I420ToNV12((char *)objc_msgSend(v52, "dataY"), objc_msgSend(v52, "strideY"), (const char *)objc_msgSend(v52, "dataU"), objc_msgSend(v52, "strideU"), (const char *)objc_msgSend(v52, "dataV"), objc_msgSend(v52, "strideV"), BaseAddressOfPlane, BytesPerRowOfPlane, v126, v125, objc_msgSend(v52, "width"), objc_msgSend(v52, "height"));
        CVPixelBufferUnlockBaseAddress(value, 0);
        if (!(_DWORD)BaseAddressOfPlane)
        {

          goto LABEL_17;
        }
        if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) != 0)
          goto LABEL_64;
      }
      rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v53, v54, v55, v56, v57, v58, v59, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH265.mm");
      goto LABEL_64;
    }
  }
  v31 = (void (**)(id, uint64_t))self->_errorCallback;
  if (v31)
    v31[2](v31, 0xFFFFFFFFLL);
  v32 = -7;
LABEL_70:

  return v32;
}

- (void)setCallback:(id)a3
{
  void *v4;
  id callback;

  v4 = (void *)MEMORY[0x20BD0B3A4](a3, a2);
  callback = self->_callback;
  self->_callback = v4;

}

- (int)setBitrate:(unsigned int)a3 framerate:(unsigned int)a4
{
  unsigned int v5;
  BitrateAdjuster *value;
  unsigned int v7;
  unsigned int v8;
  BitrateAdjuster *v9;
  pthread_mutex_t *v10;
  uint64_t v11;

  v5 = 1000 * a3;
  self->_targetBitrateBps = 1000 * a3;
  value = self->_bitrateAdjuster.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)((char *)value + 8));
  v7 = *((_DWORD *)value + 20);
  if (!v7
    || (float)(vabds_f32((float)v5, (float)v7) / (float)v7) >= 0.1
    || (v8 = *((_DWORD *)value + 22)) == 0
    || (float)(vabds_f32((float)v5, (float)v8) / (float)v8) >= 0.1)
  {
    *((_DWORD *)value + 21) = v5;
    *((_DWORD *)value + 22) = v5;
  }
  *((_DWORD *)value + 20) = v5;
  pthread_mutex_unlock((pthread_mutex_t *)((char *)value + 8));
  v9 = self->_bitrateAdjuster.__ptr_.__value_;
  v10 = (pthread_mutex_t *)((char *)v9 + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)v9 + 8));
  v11 = *((unsigned int *)v9 + 21);
  pthread_mutex_unlock(v10);
  -[WK_RTCVideoEncoderH265 setBitrateBps:](self, "setBitrateBps:", v11);
  return 0;
}

- (int64_t)releaseEncoder
{
  id callback;

  -[WK_RTCVideoEncoderH265 destroyCompressionSession](self, "destroyCompressionSession");
  callback = self->_callback;
  self->_callback = 0;

  return 0;
}

- (int)resetCompressionSession
{
  void *v3;
  const __CFAllocator *v4;
  const CFDictionaryKeyCallBacks *v5;
  const CFDictionaryValueCallBacks *v6;
  CFDictionaryRef v7;
  CFNumberRef v8;
  const __CFDictionary *v9;
  __CFDictionary *Mutable;
  OSStatus v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t valuePtr;
  void *values[3];
  void *keys[4];

  keys[3] = *(void **)MEMORY[0x24BDAC8D0];
  -[WK_RTCVideoEncoderH265 destroyCompressionSession](self, "destroyCompressionSession");
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
  Mutable = CFDictionaryCreateMutable(0, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  {
    if (Mutable)
      CFDictionaryRemoveValue(Mutable, (const void *)*MEMORY[0x24BDF99C8]);
    if (v9)
      goto LABEL_9;
  }
  else
  {
    v11 = 0;
    if (v9)
LABEL_9:
      CFRelease(v9);
  }
  if (Mutable)
    CFRelease(Mutable);
  if (v11)
  {
    if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
      rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH265.mm");
    return -1;
  }
  else
  {
    -[WK_RTCVideoEncoderH265 configureCompressionSession](self, "configureCompressionSession");
    return 0;
  }
}

- (void)configureCompressionSession
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  SetVTSessionProperty(self->_compressionSession, (const __CFString *)*MEMORY[0x24BDF9348], self->_isLowLatencyEnabled);
  SetVTSessionProperty(self->_compressionSession, (const __CFString *)*MEMORY[0x24BDF91F8], 0);
  -[WK_RTCVideoEncoderH265 setEncoderBitrateBps:](self, "setEncoderBitrateBps:", self->_targetBitrateBps);
  SetVTSessionProperty(self->_compressionSession, (const __CFString *)*MEMORY[0x24BDF92C8], 7200);
  SetVTSessionProperty(self->_compressionSession, (const __CFString *)*MEMORY[0x24BDF92D0], 240);
  if (VTCompressionSessionPrepareToEncodeFrames(self->_compressionSession))
  {
    if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
      rtc::webrtc_logging_impl::Log("\r\t", v3, v4, v5, v6, v7, v8, v9, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH265.mm");
  }
}

- (void)destroyCompressionSession
{
  OpaqueVTCompressionSession *compressionSession;

  compressionSession = self->_compressionSession;
  if (compressionSession)
  {
    VTCompressionSessionInvalidate(compressionSession);
    CFRelease(self->_compressionSession);
    self->_compressionSession = 0;
  }
}

- (id)implementationName
{
  return CFSTR("VideoToolbox");
}

- (void)setBitrateBps:(unsigned int)a3
{
  if (self->_encoderBitrateBps != a3)
    -[WK_RTCVideoEncoderH265 setEncoderBitrateBps:](self, "setEncoderBitrateBps:");
}

- (void)setEncoderBitrateBps:(unsigned int)a3
{
  OpaqueVTCompressionSession *compressionSession;

  compressionSession = self->_compressionSession;
  if (compressionSession)
  {
    SetVTSessionProperty(compressionSession, (const __CFString *)*MEMORY[0x24BDF9208], a3);
    self->_encoderBitrateBps = a3;
  }
}

- (void)frameWasEncoded:(int)a3 flags:(unsigned int)a4 sampleBuffer:(opaqueCMSampleBuffer *)a5 width:(int)a6 height:(int)a7 renderTimeMs:(int64_t)a8 timestamp:(unsigned int)a9 rotation:(int64_t)a10
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id errorCallback;
  void (*v19)(void);
  uint64_t v21;
  uint64_t v22;
  int64_t v24;
  const __CFArray *SampleAttachmentsArray;
  const __CFArray *v26;
  const __CFDictionary *ValueAtIndex;
  int v28;
  uint64_t v29;
  size_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (**v38)(id, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  OpaqueCMBlockBuffer *DataBuffer;
  size_t DataLength;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (**v56)(id, uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  size_t v65;
  size_t v66;
  size_t v67;
  size_t v68;
  void *v69;
  const void *v70;
  const opaqueCMFormatDescription *FormatDescription;
  const __CFDictionary *Extension;
  const __CFData *Value;
  const __CFData *v74;
  void (**descriptionCallback)(id, const UInt8 *, CFIndex);
  const UInt8 *BytePtr;
  CFIndex Length;
  WK_RTCEncodedImage *v78;
  void *v79;
  uint64_t v80;
  size_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t (**callback)(id, WK_RTCEncodedImage *, WK_RTCCodecSpecificInfoH265 *, _QWORD);
  WK_RTCCodecSpecificInfoH265 *v86;
  BitrateAdjuster *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  size_t v96;
  size_t v97;
  char *v98;
  size_t v99;
  size_t lengthAtOffsetOut;
  char *dataPointerOut[2];

  if (a3)
  {
    if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
      rtc::webrtc_logging_impl::Log("\r\t", v11, v12, v13, v14, v15, v16, v17, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH265.mm");
    errorCallback = self->_errorCallback;
    if (errorCallback)
    {
      v19 = (void (*)(void))*((_QWORD *)errorCallback + 2);
LABEL_21:
      v19();
      return;
    }
    return;
  }
  if ((a4 & 2) == 0)
  {
    v21 = *(_QWORD *)&a7;
    v22 = *(_QWORD *)&a6;
    v24 = a10;
    SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(a5, 0);
    if (SampleAttachmentsArray
      && (v26 = SampleAttachmentsArray, CFArrayGetCount(SampleAttachmentsArray))
      && (ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v26, 0),
          !CFDictionaryContainsKey(ValueAtIndex, (const void *)*MEMORY[0x24BDC0CC8])))
    {
      if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)1>() & 1) == 0)
        rtc::webrtc_logging_impl::Log("\r\t", v57, v58, v59, v60, v61, v62, v63, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH265.mm");
      v28 = 1;
    }
    else
    {
      v28 = 0;
    }
    v29 = operator new();
    v30 = (size_t *)v29;
    *(_QWORD *)(v29 + 8) = 0;
    *(_QWORD *)(v29 + 16) = 0;
    *(_QWORD *)v29 = 0;
    dataPointerOut[1] = (char *)v29;
    if (self->_useAnnexB)
    {
      if ((webrtc::H265CMSampleBufferToAnnexBBuffer(a5, v28, (size_t *)v29) & 1) == 0)
      {
        if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)2>() & 1) == 0)
          rtc::webrtc_logging_impl::Log("\r\t", v31, v32, v33, v34, v35, v36, v37, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH265.mm");
        v38 = (void (**)(id, uint64_t))self->_errorCallback;
        if (v38)
          v38[2](v38, 0xFFFFFFFFLL);
LABEL_61:
        v96 = v30[2];
        v30[2] = 0;
        if (v96)
          MEMORY[0x20BD0ADD4](v96, 0x1000C8077774924);
        MEMORY[0x20BD0ADEC](v30, 0x1010C40A79CA2DELL);
        return;
      }
    }
    else
    {
      *(_QWORD *)v29 = 0;
      DataBuffer = CMSampleBufferGetDataBuffer(a5);
      DataLength = CMBlockBufferGetDataLength(DataBuffer);
      if (DataLength)
      {
        lengthAtOffsetOut = 0;
        dataPointerOut[0] = 0;
        if (CMBlockBufferGetDataPointer(DataBuffer, 0, &lengthAtOffsetOut, 0, dataPointerOut))
        {
          if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
            rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v49, v50, v51, v52, v53, v54, v55, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH265.mm");
          v56 = (void (**)(id, uint64_t))self->_errorCallback;
          if (v56)
            v56[2](v56, 0xFFFFFFFFLL);
          goto LABEL_61;
        }
        v64 = dataPointerOut[0];
        v65 = *v30;
        v66 = v30[1];
        v67 = *v30 + DataLength;
        if (v66 < v67)
        {
          if (v66 + (v66 >> 1) <= v67)
            v68 = *v30 + DataLength;
          else
            v68 = v66 + (v66 >> 1);
          v98 = dataPointerOut[0];
          v99 = v68;
          v69 = (void *)operator new[]();
          v70 = (const void *)v30[2];
          if (v70)
          {
            v97 = (size_t)v69;
            memcpy(v69, v70, *v30);
            v30[2] = v97;
            MEMORY[0x20BD0ADD4](v70, 0x1000C8077774924);
          }
          else
          {
            v30[2] = (size_t)v69;
          }
          v64 = v98;
          v30[1] = v99;
          v65 = *v30;
        }
        memcpy((void *)(v30[2] + v65), v64, DataLength);
        *v30 = v67;
        v24 = a10;
      }
      if (self->_descriptionCallback)
      {
        if (self->_needsToSendDescription)
        {
          FormatDescription = CMSampleBufferGetFormatDescription(a5);
          Extension = (const __CFDictionary *)CMFormatDescriptionGetExtension(FormatDescription, (CFStringRef)*MEMORY[0x24BDC0B80]);
          if (Extension)
          {
            Value = (const __CFData *)CFDictionaryGetValue(Extension, CFSTR("hvcC"));
            v74 = Value;
            if (Value)
            {
              self->_needsToSendDescription = 0;
              descriptionCallback = (void (**)(id, const UInt8 *, CFIndex))self->_descriptionCallback;
              BytePtr = CFDataGetBytePtr(Value);
              Length = CFDataGetLength(v74);
              descriptionCallback[2](descriptionCallback, BytePtr, Length);
            }
          }
        }
      }
    }
    v78 = objc_alloc_init(WK_RTCEncodedImage);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v30[2], *v30, 0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[WK_RTCEncodedImage setBuffer:](v78, "setBuffer:", v79);

    -[WK_RTCEncodedImage setEncodedWidth:](v78, "setEncodedWidth:", v22);
    -[WK_RTCEncodedImage setEncodedHeight:](v78, "setEncodedHeight:", v21);
    -[WK_RTCEncodedImage setCompleteFrame:](v78, "setCompleteFrame:", 1);
    if (v28)
      v80 = 3;
    else
      v80 = 4;
    -[WK_RTCEncodedImage setFrameType:](v78, "setFrameType:", v80);
    -[WK_RTCEncodedImage setCaptureTimeMs:](v78, "setCaptureTimeMs:", a8);
    -[WK_RTCEncodedImage setTimeStamp:](v78, "setTimeStamp:", a9);
    -[WK_RTCEncodedImage setRotation:](v78, "setRotation:", v24);
    -[WK_RTCEncodedImage setContentType:](v78, "setContentType:", self->_mode == 1);
    -[WK_RTCEncodedImage setFlags:](v78, "setFlags:", 255);
    -[WK_RTCEncodedImage setTemporalIndex:](v78, "setTemporalIndex:", 0xFFFFFFFFLL);
    if (self->_useAnnexB)
    {
      if (*v30)
        v81 = v30[2];
      else
        v81 = 0;
      (*((void (**)(H265BitstreamParser *, size_t))self->_h265BitstreamParser._vptr$BitstreamParser + 2))(&self->_h265BitstreamParser, v81);
      v82 = (*((uint64_t (**)(H265BitstreamParser *))self->_h265BitstreamParser._vptr$BitstreamParser + 3))(&self->_h265BitstreamParser);
      if ((v82 & 0xFF00000000) != 0)
        v83 = v82;
      else
        v83 = 0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[WK_RTCEncodedImage setQp:](v78, "setQp:", v84);

    }
    callback = (uint64_t (**)(id, WK_RTCEncodedImage *, WK_RTCCodecSpecificInfoH265 *, _QWORD))self->_callback;
    v86 = objc_alloc_init(WK_RTCCodecSpecificInfoH265);
    LOBYTE(callback) = callback[2](callback, v78, v86, 0);

    if ((callback & 1) != 0)
    {
      v87 = self->_bitrateAdjuster.__ptr_.__value_;
      -[WK_RTCEncodedImage buffer](v78, "buffer");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      webrtc::BitrateAdjuster::Update((webrtc::BitrateAdjuster *)v87, objc_msgSend(v88, "length"));

    }
    else if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
    {
      rtc::webrtc_logging_impl::Log("\r\t", v89, v90, v91, v92, v93, v94, v95, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH265.mm");
    }

    goto LABEL_61;
  }
  if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)1>() & 1) == 0)
    rtc::webrtc_logging_impl::Log("\r\t", v39, v40, v41, v42, v43, v44, v45, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH265.mm");
  v46 = self->_errorCallback;
  if (v46)
  {
    v19 = (void (*)(void))*((_QWORD *)v46 + 2);
    goto LABEL_21;
  }
}

- (id)scalingSettings
{
  return -[WK_RTCVideoEncoderQpThresholds initWithThresholdsLow:high:]([WK_RTCVideoEncoderQpThresholds alloc], "initWithThresholdsLow:high:", 28, 39);
}

- (void)flush
{
  OpaqueVTCompressionSession *compressionSession;
  CMTime v3;

  compressionSession = self->_compressionSession;
  if (compressionSession)
  {
    v3 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
    VTCompressionSessionCompleteFrames(compressionSession, &v3);
  }
}

- (void).cxx_destruct
{
  char *begin;
  BitrateAdjuster *value;

  webrtc::H265BitstreamParser::~H265BitstreamParser((webrtc::H265BitstreamParser *)&self->_h265BitstreamParser);
  objc_storeStrong(&self->_errorCallback, 0);
  objc_storeStrong(&self->_descriptionCallback, 0);
  begin = self->_nv12ScaleBuffer.__begin_;
  if (begin)
  {
    self->_nv12ScaleBuffer.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong(&self->_callback, 0);
  value = self->_bitrateAdjuster.__ptr_.__value_;
  self->_bitrateAdjuster.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(BitrateAdjuster *))(*(_QWORD *)value + 8))(value);
  objc_storeStrong((id *)&self->_codecInfo, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 16) = &off_24C0B4A60;
  *((_BYTE *)self + 212) = 0;
  *((_BYTE *)self + 216) = 0;
  *((_BYTE *)self + 220) = 0;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 193) = 0u;
  return self;
}

@end
