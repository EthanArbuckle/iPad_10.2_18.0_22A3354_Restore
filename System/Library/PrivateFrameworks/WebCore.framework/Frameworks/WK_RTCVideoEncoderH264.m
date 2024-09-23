@implementation WK_RTCVideoEncoderH264

- (WK_RTCVideoEncoderH264)initWithCodecInfo:(id)a3
{
  id v5;
  WK_RTCVideoEncoderH264 *v6;
  WK_RTCVideoEncoderH264 *v7;
  uint64_t v8;
  BitrateAdjuster *value;
  BOOL v10;
  WK_RTCVideoEncoderH264 *result;
  const __CFString *Profile;
  CFIndex Length;
  CFIndex v14;
  std::string::value_type *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  WK_RTCVideoEncoderH264 *v28;
  uint64_t v29;
  objc_super v30;
  pthread_mutexattr_t v31;
  __int128 v32;
  __int128 v33;
  void *__p[2];
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)WK_RTCVideoEncoderH264;
  v6 = -[WK_RTCVideoEncoderH264 init](&v30, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_18;
  objc_storeStrong((id *)&v6->_codecInfo, a3);
  v8 = operator new();
  *(_QWORD *)v8 = &off_24C0B0148;
  pthread_mutexattr_init(&v31);
  pthread_mutexattr_setpolicy_np(&v31, 3);
  pthread_mutex_init((pthread_mutex_t *)(v8 + 8), &v31);
  pthread_mutexattr_destroy(&v31);
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
  v7->_packetizationMode = 0;
  if (v5)
  {
    objc_msgSend(v5, "nativeSdpVideoFormat");
  }
  else
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    *(_OWORD *)__p = 0u;
    v31 = (pthread_mutexattr_t)0;
    v32 = 0u;
  }
  v7->_profile_level_id.var0 = ($933FE304851782B2CE9323D3F4AFD4F0)webrtc::ParseSdpForH264ProfileLevelId((unint64_t)&v32 + 8);
  v7->_profile_level_id.__engaged_ = v10;
  if (((uint64_t)__p[0] & 1) != 0)
  {
    operator delete(__p[1]);
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v32 + 8, v33);
    if ((SBYTE7(v32) & 0x80000000) == 0)
    {
LABEL_9:
      if (v7->_profile_level_id.__engaged_)
        goto LABEL_10;
LABEL_21:
      v28 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v32 + 8, v33);
    if ((SBYTE7(v32) & 0x80000000) == 0)
      goto LABEL_9;
  }
  operator delete((void *)v31.__sig);
  if (!v7->_profile_level_id.__engaged_)
    goto LABEL_21;
LABEL_10:
  v7->_useVCP = 1;
  result = (WK_RTCVideoEncoderH264 *)rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)1>();
  if ((result & 1) == 0)
  {
    if (!v7->_profile_level_id.__engaged_)
      goto LABEL_24;
    *(_QWORD *)v31.__opaque = 0;
    *(_QWORD *)&v32 = 0;
    v31.__sig = 0;
    Length = CFStringGetLength(Profile);
    v14 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    v15 = (std::string::value_type *)operator new[]();
    if (CFStringGetCString(Profile, v15, v14, 0x8000100u))
      std::string::__assign_external((std::string *)&v31, v15);
    MEMORY[0x20BD0ADD4](v15, 0x1000C8077774924);
    rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)10,std::string const*>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)10,std::string const*> const&)::t, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH264.mm");
    if (SBYTE7(v32) < 0)
      operator delete((void *)v31.__sig);
  }
  objc_msgSend(v5, "name");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v23, "isEqualToString:", CFSTR("H264")) & 1) != 0)
  {

LABEL_18:
    *(_DWORD *)&v7->_isKeyFrameRequired = 256;
    v7->_frameCount = 0;
    v7->_lastFrameRateEstimationTime = 0;
    *(_WORD *)&v7->_useAnnexB = 257;
    v7->_enableL1T2ScalabilityMode = 0;
    v28 = v7;
LABEL_22:

    return v28;
  }
  result = (WK_RTCVideoEncoderH264 *)rtc::webrtc_checks_impl::FatalLog("/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH264.mm", 454, "[codecInfo.name isEqualToString:kRTCVideoCodecH264Name]", _ZZN3rtc18webrtc_checks_impl11LogStreamerIJEE4CallIJEEEvPKciS5_DpRKT_E1t, v24, v25, v26, v27, v29);
LABEL_24:
  __break(1u);
  return result;
}

- (void)setH264LowLatencyEncoderEnabled:(BOOL)a3
{
  self->_isH264LowLatencyEncoderEnabled = a3;
}

- (void)dealloc
{
  objc_super v3;

  -[WK_RTCVideoEncoderH264 destroyCompressionSession](self, "destroyCompressionSession");
  v3.receiver = self;
  v3.super_class = (Class)WK_RTCVideoEncoderH264;
  -[WK_RTCVideoEncoderH264 dealloc](&v3, sel_dealloc);
}

- (int64_t)startEncodeWithSettings:(id)a3 numberOfCores:(int)a4
{
  id v5;
  int64_t result;
  unsigned int v7;
  const H264ProfileLevelId *v8;
  unsigned int v9;
  BitrateAdjuster *value;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int maxAllowedFrameRate;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;

  v5 = a3;
  self->_width = objc_msgSend(v5, "width");
  self->_height = objc_msgSend(v5, "height");
  result = objc_msgSend(v5, "mode");
  self->_mode = result;
  if (!self->_profile_level_id.__engaged_)
    goto LABEL_27;
  v7 = 10368000;
  switch(self->_profile_level_id.var0.__val_.level)
  {
    case 0:
    case 0xA:
    case 0xB:
    case 0xC:
    case 0xD:
    case 0x14:
    case 0x15:
    case 0x16:
      v7 = 0;
      break;
    case 0x1F:
      v7 = 27648000;
      break;
    case 0x20:
      v7 = 55296000;
      break;
    case 0x28:
    case 0x29:
      v7 = 62914560;
      break;
    case 0x2A:
      v7 = 133693440;
      break;
    case 0x32:
      v7 = 150994944;
      break;
    case 0x33:
      v7 = 251658240;
      break;
    case 0x34:
      v7 = 530841600;
      break;
    default:
      break;
  }
  self->_maxAllowedFrameRate = v7 / (((self->_height + 15) & 0xFFFFFFF0) * ((self->_width + 15) & 0xFFFFFFF0));
  result = objc_msgSend(v5, "startBitrate");
  if (self->_profile_level_id.__engaged_)
  {
    self->_targetBitrateBps = v9;
    value = self->_bitrateAdjuster.__ptr_.__value_;
    pthread_mutex_lock((pthread_mutex_t *)((char *)value + 8));
    v11 = *((_DWORD *)value + 20);
    if (!v11
      || (float)(vabds_f32((float)v9, (float)v11) / (float)v11) >= 0.1
      || (v12 = *((_DWORD *)value + 22)) == 0
      || (float)(vabds_f32((float)v9, (float)v12) / (float)v12) >= 0.1)
    {
      *((_DWORD *)value + 21) = v9;
      *((_DWORD *)value + 22) = v9;
    }
    *((_DWORD *)value + 20) = v9;
    pthread_mutex_unlock((pthread_mutex_t *)((char *)value + 8));
    v13 = objc_msgSend(v5, "maxFramerate");
    maxAllowedFrameRate = self->_maxAllowedFrameRate;
    if (v13)
      v15 = v13;
    else
      v15 = 30;
    if (v15 < maxAllowedFrameRate)
      maxAllowedFrameRate = v15;
    self->_encoderFrameRate = maxAllowedFrameRate;
    v16 = objc_msgSend(v5, "maxFramerate");
    v17 = self->_maxAllowedFrameRate;
    if (v16 > v17 && v17 && (rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)2>() & 1) == 0)
    {
      objc_msgSend(v5, "maxFramerate");
      rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)4,unsigned int>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)4,unsigned int>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)4,unsigned int>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)4,unsigned int>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*> const&)::t, v18, v19, v20, v21, v22, v23, v24, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH264.mm");
    }
    v25 = -[WK_RTCVideoEncoderH264 resetCompressionSessionWithPixelFormat:](self, "resetCompressionSessionWithPixelFormat:", 875704422);

    return v25;
  }
  else
  {
LABEL_27:
    __break(1u);
  }
  return result;
}

- (void)setUseAnnexB:(BOOL)a3
{
  self->_useAnnexB = a3;
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

- (BOOL)hasCompressionSession
{
  return self->_vtCompressionSession != 0;
}

- (int64_t)encode:(id)a3 codecSpecificInfo:(id)a4 frameTypes:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 isKeyFrameRequired;
  _BOOL4 v12;
  int v13;
  void (**errorCallback)(id, uint64_t);
  void (**v15)(id, uint64_t);
  int64_t v16;
  void *v17;
  char isKindOfClass;
  OpaqueVTCompressionSession *v19;
  void *v20;
  OpaqueVTCompressionSession *v21;
  __CVBuffer *PixelBuffer;
  __CVBuffer *v23;
  size_t Width;
  size_t Height;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *BaseAddressOfPlane;
  int BytesPerRowOfPlane;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (**v43)(id, uint64_t);
  char v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  WK_RTCVideoEncoderH264 *v64;
  id v65;
  WK_RTCVideoEncoderH264 *v66;
  id v67;
  OpaqueVTCompressionSession **v68;
  WK_RTCCodecSpecificInfoH264 *v69;
  id v70;
  OpaqueVTCompressionSession *v71;
  uint64_t v72;
  OpaqueVTCompressionSession *v73;
  const __CFDictionary *v74;
  OSStatus v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  char *v91;
  const __CFDictionary *frameProperties;
  __CVBuffer *v93;
  int v94;
  CMTime duration;
  CMTime presentationTimeStamp;
  CMTime v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  void *values;
  void *keys;
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_callback && -[WK_RTCVideoEncoderH264 hasCompressionSession](self, "hasCompressionSession"))
  {
    isKeyFrameRequired = self->_isKeyFrameRequired;
    self->_isKeyFrameRequired = 0;
    v12 = -[WK_RTCVideoEncoderH264 resetCompressionSessionIfNeededWithFrame:](self, "resetCompressionSessionIfNeededWithFrame:", v8);
    v13 = isKeyFrameRequired || v12;
    if (self->_disableEncoding)
    {
      errorCallback = (void (**)(id, uint64_t))self->_errorCallback;
      if (!errorCallback)
      {
LABEL_39:
        v16 = -1;
        goto LABEL_40;
      }
LABEL_8:
      errorCallback[2](errorCallback, 0xFFFFFFFFLL);
      goto LABEL_39;
    }
    v94 = v13;
    if (self->_isUsingSoftwareEncoder)
      -[WK_RTCVideoEncoderH264 updateBitRateAccordingActualFrameRate](self, "updateBitRateAccordingActualFrameRate");
    objc_msgSend(v8, "buffer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v8, "buffer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v20, "requiresCropping") & 1) != 0)
      {
        v23 = PixelBuffer;
        if (!PixelBuffer)
        {
          v43 = (void (**)(id, uint64_t))self->_errorCallback;
          if (v43)
            goto LABEL_37;
          goto LABEL_38;
        }
        Width = CVPixelBufferGetWidth(PixelBuffer);
        Height = CVPixelBufferGetHeight(v23);
        if (objc_msgSend(v20, "requiresScalingToWidth:height:", Width, Height))
          std::vector<unsigned char>::resize((uint64_t)&self->_frameScaleBuffer, (int)objc_msgSend(v20, "bufferSizeForCroppingAndScalingToWidth:height:", Width, Height));
        else
          self->_frameScaleBuffer.__end_ = self->_frameScaleBuffer.__begin_;
        std::vector<unsigned char>::shrink_to_fit(&self->_frameScaleBuffer.__begin_);
        if ((objc_msgSend(v20, "cropAndScaleTo:withTempBuffer:", v23, self->_frameScaleBuffer.__begin_) & 1) == 0)
        {
          CVBufferRelease(v23);
          v43 = (void (**)(id, uint64_t))self->_errorCallback;
          if (v43)
LABEL_37:
            v43[2](v43, 0xFFFFFFFFLL);
LABEL_38:

          goto LABEL_39;
        }
        goto LABEL_42;
      }
      v23 = (__CVBuffer *)objc_msgSend(v20, "pixelBuffer");
      CVBufferRetain(v23);

      if (v23)
        goto LABEL_43;
    }
    if (!v23)
    {
LABEL_30:
      errorCallback = (void (**)(id, uint64_t))self->_errorCallback;
      if (!errorCallback)
        goto LABEL_39;
      goto LABEL_8;
    }
    objc_msgSend(v8, "buffer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "toI420");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if (CVPixelBufferLockBaseAddress(v23, 0))
    {
      if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) != 0)
      {
LABEL_27:

        if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
          rtc::webrtc_logging_impl::Log("\r\t", v36, v37, v38, v39, v40, v41, v42, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH264.mm");
        CVBufferRelease(v23);
        goto LABEL_30;
      }
    }
    else
    {
      BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(v23, 0);
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v23, 0);
      v91 = (char *)CVPixelBufferGetBaseAddressOfPlane(v23, 1uLL);
      v90 = CVPixelBufferGetBytesPerRowOfPlane(v23, 1uLL);
      LODWORD(BaseAddressOfPlane) = I420ToNV12((char *)objc_msgSend(v26, "dataY"), objc_msgSend(v26, "strideY"), (const char *)objc_msgSend(v26, "dataU"), objc_msgSend(v26, "strideU"), (const char *)objc_msgSend(v26, "dataV"), objc_msgSend(v26, "strideV"), BaseAddressOfPlane, BytesPerRowOfPlane, v91, v90, objc_msgSend(v26, "width"), objc_msgSend(v26, "height"));
      CVPixelBufferUnlockBaseAddress(v23, 0);
      if (!(_DWORD)BaseAddressOfPlane)
      {

LABEL_42:
LABEL_43:
        if (v10)
          v45 = v94;
        else
          v45 = 1;
        if ((v45 & 1) == 0)
        {
          v100 = 0u;
          v101 = 0u;
          v98 = 0u;
          v99 = 0u;
          v46 = v10;
          v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v98, v104, 16);
          if (v47)
          {
            v48 = *(_QWORD *)v99;
            while (2)
            {
              for (i = 0; i != v47; ++i)
              {
                if (*(_QWORD *)v99 != v48)
                  objc_enumerationMutation(v46);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * i), "intValue") == 3)
                {
                  if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)1>() & 1) == 0)
                    rtc::webrtc_logging_impl::Log("\r\t", v50, v51, v52, v53, v54, v55, v56, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH264.mm");
                  v94 = 1;
                  goto LABEL_59;
                }
              }
              v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v98, v104, 16);
              if (v47)
                continue;
              break;
            }
          }
          v94 = 0;
LABEL_59:

        }
        memset(&v97, 0, sizeof(v97));
        CMTimeMake(&v97, objc_msgSend(v8, "timeStampNs") / 1000000, 1000);
        if (v94)
        {
          keys = (void *)*MEMORY[0x24BDF9578];
          values = (void *)*MEMORY[0x24BDBD270];
          frameProperties = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)&keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        }
        else
        {
          frameProperties = 0;
        }
        keys = 0;
        v57 = (id *)operator new();
        v93 = v23;
        v58 = *(void **)&self->_width;
        v59 = objc_msgSend(v8, "timeStampNs");
        v60 = objc_msgSend(v8, "timeStamp");
        v61 = objc_msgSend(v8, "duration");
        v62 = objc_msgSend(v8, "rotation");
        v63 = v59 / 1000000;
        v64 = self;
        v65 = v9;
        v66 = v64;
        v67 = v65;
        v68 = v66;
        *v57 = v68;
        v57[1] = 0;
        v57[2] = v58;
        v57[3] = (id)v63;
        v57[4] = (id)v60;
        v57[5] = (id)v61;
        v57[6] = (id)v62;
        *((_BYTE *)v57 + 56) = v94;
        if (v67)
          v69 = (WK_RTCCodecSpecificInfoH264 *)v67;
        else
          v69 = objc_alloc_init(WK_RTCCodecSpecificInfoH264);
        v70 = v57[1];
        v57[1] = v69;

        keys = v57;
        objc_msgSend(v57[1], "setPacketizationMode:", v68[5]);
        v71 = v68[2];
        pthread_mutex_lock((pthread_mutex_t *)((char *)v71 + 8));
        v72 = *((unsigned int *)v71 + 21);
        pthread_mutex_unlock((pthread_mutex_t *)((char *)v71 + 8));
        objc_msgSend(v68, "setBitrateBps:frameRate:", v72, *((unsigned int *)v68 + 8));
        v73 = v68[11];
        if (v73)
        {
          presentationTimeStamp = v97;
          duration = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
          keys = 0;
          v74 = frameProperties;
          v75 = VTCompressionSessionEncodeFrame(v73, v93, &presentationTimeStamp, &duration, frameProperties, v57, 0);
          v57 = 0;
        }
        else
        {
          v75 = 1;
          v74 = frameProperties;
        }
        if (v74)
          CFRelease(v74);
        CVBufferRelease(v93);
        switch(v75)
        {
          case -12912:
            if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
LABEL_77:
              rtc::webrtc_logging_impl::Log("\r\t", v76, v77, v78, v79, v80, v81, v82, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH264.mm");
            break;
          case 0:
            v16 = 0;
LABEL_83:
            if (v57)
            {

              MEMORY[0x20BD0ADEC](v57, 0x1080C40613243D1);
            }
            goto LABEL_40;
          case -12903:
            if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
              goto LABEL_77;
            break;
          default:
            if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
              rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v83, v84, v85, v86, v87, v88, v89, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH264.mm");
            v16 = -1;
            goto LABEL_83;
        }
        objc_msgSend(v68, "resetCompressionSessionWithPixelFormat:", objc_msgSend(v68, "pixelFormatOfFrame:", v8));
        v16 = 1;
        goto LABEL_83;
      }
      if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) != 0)
        goto LABEL_27;
    }
    rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v27, v28, v29, v30, v31, v32, v33, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH264.mm");
    goto LABEL_27;
  }
  v15 = (void (**)(id, uint64_t))self->_errorCallback;
  if (v15)
    v15[2](v15, 0xFFFFFFFFLL);
  v16 = -7;
LABEL_40:

  return v16;
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
  WK_RTCVideoEncoderH264 *v5;
  unsigned int v6;
  BitrateAdjuster *value;
  unsigned int v8;
  unsigned int v9;
  unsigned int maxAllowedFrameRate;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  BitrateAdjuster *v20;
  pthread_mutex_t *v21;
  uint64_t v22;

  if (self->_profile_level_id.__engaged_)
  {
    v5 = self;
    v6 = 1000
    v5->_targetBitrateBps = v6;
    value = v5->_bitrateAdjuster.__ptr_.__value_;
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
    maxAllowedFrameRate = v5->_maxAllowedFrameRate;
    if (maxAllowedFrameRate < a4 && maxAllowedFrameRate)
    {
      if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)2>() & 1) == 0)
        rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)4,unsigned int>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)4,unsigned int>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)4,unsigned int>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)4,unsigned int>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*> const&)::t, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH264.mm");
      maxAllowedFrameRate = v5->_maxAllowedFrameRate;
    }
    if (a4)
      v18 = a4;
    else
      v18 = 30;
    if (v18 >= maxAllowedFrameRate)
      v19 = maxAllowedFrameRate;
    else
      v19 = v18;
    v20 = v5->_bitrateAdjuster.__ptr_.__value_;
    v21 = (pthread_mutex_t *)((char *)v20 + 8);
    pthread_mutex_lock((pthread_mutex_t *)((char *)v20 + 8));
    v22 = *((unsigned int *)v20 + 21);
    pthread_mutex_unlock(v21);
    -[WK_RTCVideoEncoderH264 setBitrateBps:frameRate:](v5, "setBitrateBps:frameRate:", v22, v19);
    LODWORD(self) = 0;
  }
  else
  {
    __break(1u);
  }
  return (int)self;
}

- (int64_t)releaseEncoder
{
  id callback;

  -[WK_RTCVideoEncoderH264 destroyCompressionSession](self, "destroyCompressionSession");
  callback = self->_callback;
  self->_callback = 0;

  return 0;
}

- (unsigned)pixelFormatOfFrame:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  OSType PixelFormatType;

  v3 = a3;
  objc_msgSend(v3, "buffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "buffer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(v6, "pixelBuffer"));

    return PixelFormatType;
  }
  else
  {

    return 875704422;
  }
}

- (BOOL)resetCompressionSessionIfNeededWithFrame:(id)a3
{
  id v4;
  uint64_t v5;
  __CVPixelBufferPool *PixelBufferPool;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[WK_RTCVideoEncoderH264 pixelFormatOfFrame:](self, "pixelFormatOfFrame:", v4);
  if (!-[WK_RTCVideoEncoderH264 hasCompressionSession](self, "hasCompressionSession"))
    goto LABEL_15;
  PixelBufferPool = VTCompressionSessionGetPixelBufferPool(self->_vtCompressionSession);
  if (PixelBufferPool)
  {
    CVPixelBufferPoolGetPixelBufferAttributes(PixelBufferPool);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDC56B8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v10 = 0;
        goto LABEL_9;
      }
      v22[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
LABEL_9:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "containsObject:", v11);

    if ((v12 & 1) != 0)
    {

      goto LABEL_11;
    }
    if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)1>() & 1) == 0)
      rtc::webrtc_logging_impl::Log("\r\t", v14, v15, v16, v17, v18, v19, v20, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH264.mm");

LABEL_15:
    -[WK_RTCVideoEncoderH264 resetCompressionSessionWithPixelFormat:](self, "resetCompressionSessionWithPixelFormat:", v5);
    v13 = 1;
    goto LABEL_16;
  }
LABEL_11:
  v13 = 0;
LABEL_16:

  return v13;
}

- (int)resetCompressionSessionWithPixelFormat:(unsigned int)a3
{
  void *v5;
  const __CFAllocator *v6;
  const CFDictionaryKeyCallBacks *v7;
  const CFDictionaryValueCallBacks *v8;
  CFDictionaryRef v9;
  CFNumberRef v10;
  const void *v11;
  const __CFDictionary *v12;
  __CFDictionary *Mutable;
  OSStatus v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t valuePtr;
  void *values[3];
  void *keys[4];

  keys[3] = *(void **)MEMORY[0x24BDAC8D0];
  -[WK_RTCVideoEncoderH264 destroyCompressionSession](self, "destroyCompressionSession");
  self->_disableEncoding = 0;
  v5 = (void *)*MEMORY[0x24BDC5668];
  keys[0] = *(void **)MEMORY[0x24BDC5698];
  keys[1] = v5;
  keys[2] = *(void **)MEMORY[0x24BDC56B8];
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v7 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v8 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  v9 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  valuePtr = a3;
  v10 = CFNumberCreate(0, kCFNumberLongType, &valuePtr);
  v11 = (const void *)*MEMORY[0x24BDBD270];
  values[0] = *(void **)MEMORY[0x24BDBD270];
  values[1] = v9;
  values[2] = v10;
  v12 = CFDictionaryCreate(v6, (const void **)keys, (const void **)values, 3, v7, v8);
  if (v9)
    CFRelease(v9);
  if (v10)
    CFRelease(v10);
  Mutable = CFDictionaryCreateMutable(0, 5, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDF9348], v11);
  if (self->_isH264LowLatencyEncoderEnabled && self->_useVCP)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDF99C8], v11);
  if (v12)
    CFRelease(v12);
  if (Mutable)
    CFRelease(Mutable);
  if (v14)
  {
    if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
      rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v15, v16, v17, v18, v19, v20, v21, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH264.mm");
    return -1;
  }
  else
  {
    -[WK_RTCVideoEncoderH264 configureCompressionSession](self, "configureCompressionSession");
    return 0;
  }
}

- (void)configureCompressionSession
{
  OpaqueVTCompressionSession *vtCompressionSession;
  const __CFString *v4;
  const __CFString *Profile;
  const __CFString *v6;
  OpaqueVTCompressionSession *v7;

  SetVTSessionProperty(self->_vtCompressionSession, (const __CFString *)*MEMORY[0x24BDF9348], self->_isH264LowLatencyEncoderEnabled);
  if (self->_useBaseline && self->_useVCP && self->_isH264LowLatencyEncoderEnabled)
  {
    vtCompressionSession = self->_vtCompressionSession;
    v4 = (const __CFString *)*MEMORY[0x24BDF9330];
    Profile = (const __CFString *)*MEMORY[0x24BDF9708];
  }
  else
  {
    if (!self->_profile_level_id.__engaged_)
    {
      __break(1u);
      return;
    }
    v6 = (const __CFString *)*MEMORY[0x24BDF9330];
    v7 = self->_vtCompressionSession;
    vtCompressionSession = v7;
    v4 = v6;
  }
  SetVTSessionProperty(vtCompressionSession, v4, Profile);
  SetVTSessionProperty(self->_vtCompressionSession, (const __CFString *)*MEMORY[0x24BDF91F8], 0);
  if (self->_enableL1T2ScalabilityMode)
    SetVTSessionProperty(self->_vtCompressionSession, (const __CFString *)*MEMORY[0x24BDF9220], 0.5);
  -[WK_RTCVideoEncoderH264 setEncoderBitrateBps:frameRate:](self, "setEncoderBitrateBps:frameRate:", self->_targetBitrateBps, self->_encoderFrameRate);
  SetVTSessionProperty(self->_vtCompressionSession, (const __CFString *)*MEMORY[0x24BDF92C8], 7200);
  SetVTSessionProperty(self->_vtCompressionSession, (const __CFString *)*MEMORY[0x24BDF92D0], 240);
}

- (void)destroyCompressionSession
{
  OpaqueVTCompressionSession *vtCompressionSession;

  vtCompressionSession = self->_vtCompressionSession;
  if (vtCompressionSession)
  {
    VTCompressionSessionInvalidate(vtCompressionSession);
    CFRelease(self->_vtCompressionSession);
    self->_vtCompressionSession = 0;
  }
}

- (id)implementationName
{
  return CFSTR("VideoToolbox");
}

- (void)setBitrateBps:(unsigned int)a3 frameRate:(unsigned int)a4
{
  if (self->_encoderBitrateBps != a3 || self->_encoderFrameRate != a4)
    -[WK_RTCVideoEncoderH264 setEncoderBitrateBps:frameRate:](self, "setEncoderBitrateBps:frameRate:");
}

- (void)setEncoderBitrateBps:(unsigned int)a3 frameRate:(unsigned int)a4
{
  unsigned int v7;

  if (-[WK_RTCVideoEncoderH264 hasCompressionSession](self, "hasCompressionSession"))
  {
    if (self->_isBelowExpectedFrameRate)
      v7 = a3 / 3;
    else
      v7 = a3;
    if (v7)
      SetVTSessionProperty(self->_vtCompressionSession, (const __CFString *)*MEMORY[0x24BDF9208], v7);
    if (self->_maxAllowedFrameRate)
      SetVTSessionProperty(self->_vtCompressionSession, (const __CFString *)*MEMORY[0x24BDF9260], a4);
    self->_encoderBitrateBps = a3;
    self->_encoderFrameRate = a4;
  }
}

- (void)updateBitRateAccordingActualFrameRate
{
  uint64_t v3;
  int64_t v4;
  int64_t lastFrameRateEstimationTime;
  uint64_t v6;
  unint64_t v7;
  _BOOL4 v8;

  ++self->_frameCount;
  if (rtc::g_clock)
  {
    v3 = (*(uint64_t (**)(uint64_t, SEL))(*(_QWORD *)rtc::g_clock + 16))(rtc::g_clock, a2);
  }
  else
  {
    if (!dword_253EA791C)
      mach_timebase_info((mach_timebase_info_t)&rtc::SystemTimeNanos(void)::timebase);
    v3 = (uint64_t)(mach_absolute_time() * rtc::SystemTimeNanos(void)::timebase)
       / dword_253EA791C;
  }
  v4 = v3 / 1000000;
  lastFrameRateEstimationTime = self->_lastFrameRateEstimationTime;
  if (lastFrameRateEstimationTime)
  {
    v6 = v4 - lastFrameRateEstimationTime;
    if (v6 >= 1000)
    {
      v7 = 1000 * self->_frameCount / (unint64_t)v6;
      self->_lastFrameRateEstimationTime = v4;
      self->_frameCount = 0;
      v8 = self->_encoderFrameRate > 2 * v7;
      if (self->_isBelowExpectedFrameRate != v8)
      {
        self->_isBelowExpectedFrameRate = v8;
        -[WK_RTCVideoEncoderH264 setEncoderBitrateBps:frameRate:](self, "setEncoderBitrateBps:frameRate:", self->_encoderBitrateBps);
      }
    }
  }
  else
  {
    self->_lastFrameRateEstimationTime = v4;
  }
}

- (void)frameWasEncoded:(int)a3 flags:(unsigned int)a4 sampleBuffer:(opaqueCMSampleBuffer *)a5 codecSpecificInfo:(id)a6 width:(int)a7 height:(int)a8 renderTimeMs:(int64_t)a9 timestamp:(int64_t)a10 duration:(unint64_t)a11 rotation:(int64_t)a12 isKeyFrameRequired:(BOOL)a13
{
  uint64_t v13;
  uint64_t v14;
  char v16;
  uint64_t v17;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (**errorCallback)(id, _QWORD);
  const __CFArray *SampleAttachmentsArray;
  const __CFArray *v29;
  const __CFDictionary *ValueAtIndex;
  int v31;
  const __CFBoolean *v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (**v41)(id, _QWORD);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  _QWORD *v50;
  id descriptionCallback;
  OpaqueCMBlockBuffer *DataBuffer;
  size_t DataLength;
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
  uint64_t v67;
  void (**v68)(id, uint64_t);
  size_t *v69;
  char *v70;
  size_t v71;
  size_t v72;
  size_t v73;
  size_t v74;
  void *v75;
  const void *v76;
  const opaqueCMFormatDescription *FormatDescription;
  const __CFDictionary *Extension;
  const __CFData *Value;
  const __CFData *v80;
  void (**v81)(id, const UInt8 *, CFIndex);
  const UInt8 *BytePtr;
  CFIndex Length;
  WK_RTCEncodedImage *v84;
  id v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  _QWORD *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  BitrateAdjuster *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  _QWORD *v106;
  uint64_t v107;
  size_t v108;
  size_t v109;
  size_t v110;
  char *v111;
  _BOOL4 v112;
  _QWORD v113[5];
  size_t lengthAtOffsetOut;
  char *dataPointerOut;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  uint64_t (*v119)(uint64_t, uint64_t);
  uint64_t (*v120)(uint64_t);
  uint64_t v121;
  _QWORD *v122;

  v13 = *(_QWORD *)&a8;
  v14 = *(_QWORD *)&a7;
  v16 = a4;
  v17 = *(_QWORD *)&a3;
  v19 = a6;
  if ((_DWORD)v17)
  {
    if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
      rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH264.mm");
    if (a13)
      self->_isKeyFrameRequired = 1;
    errorCallback = (void (**)(id, _QWORD))self->_errorCallback;
    if (errorCallback)
      errorCallback[2](errorCallback, v17);
    goto LABEL_79;
  }
  if ((v16 & 2) == 0)
  {
    self->_isKeyFrameRequired = 0;
    SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(a5, 0);
    v29 = SampleAttachmentsArray;
    if (!SampleAttachmentsArray)
    {
      v33 = 1;
      goto LABEL_27;
    }
    if (!CFArrayGetCount(SampleAttachmentsArray))
    {
      LODWORD(v29) = 0;
      v33 = 1;
      goto LABEL_27;
    }
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v29, 0);
    v31 = CFDictionaryContainsKey(ValueAtIndex, (const void *)*MEMORY[0x24BDC0CC8]);
    if (self->_enableL1T2ScalabilityMode
      && (v32 = (const __CFBoolean *)CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x24BDC0CB8])) != 0)
    {
      v33 = CFBooleanGetValue(v32) != 0;
      if (!v31)
      {
LABEL_14:
        if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)1>() & 1) == 0)
          rtc::webrtc_logging_impl::Log("\r\t", v34, v35, v36, v37, v38, v39, v40, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH264.mm");
        LODWORD(v29) = 1;
LABEL_27:
        v116 = 0;
        v117 = &v116;
        v118 = 0x3812000000;
        v119 = __Block_byref_object_copy_;
        v120 = __Block_byref_object_dispose_;
        v121 = 0;
        v49 = (_QWORD *)operator new();
        *v49 = 0;
        v49[1] = 0;
        v49[2] = 0;
        v122 = v49;
        v50 = (_QWORD *)v117[6];
        if (self->_useAnnexB)
        {
          if ((webrtc::H264CMSampleBufferToAnnexBBuffer(a5, (int)v29, (uint64_t)v50) & 1) == 0)
          {
            if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)2>() & 1) == 0)
              rtc::webrtc_logging_impl::Log("\r\t", v61, v62, v63, v64, v65, v66, v67, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH264.mm");
            v68 = (void (**)(id, uint64_t))self->_errorCallback;
            if (v68)
              v68[2](v68, 0xFFFFFFFFLL);
            goto LABEL_75;
          }
          descriptionCallback = self->_descriptionCallback;
          if (descriptionCallback && self->_needsToSendDescription)
          {
            self->_needsToSendDescription = 0;
            (*((void (**)(id, _QWORD, _QWORD))descriptionCallback + 2))(descriptionCallback, 0, 0);
          }
        }
        else
        {
          *v50 = 0;
          DataBuffer = CMSampleBufferGetDataBuffer(a5);
          DataLength = CMBlockBufferGetDataLength(DataBuffer);
          if (DataLength)
          {
            lengthAtOffsetOut = 0;
            dataPointerOut = 0;
            if (CMBlockBufferGetDataPointer(DataBuffer, 0, &lengthAtOffsetOut, 0, &dataPointerOut))
            {
              if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
                rtc::webrtc_logging_impl::Log(rtc::webrtc_logging_impl::LogStreamer<>::Call<rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int>>(rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)13,rtc::webrtc_logging_impl::LogMetadata>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)9,char const*>,rtc::webrtc_logging_impl::Val<(rtc::webrtc_logging_impl::LogArgType)1,int> const&)::t, v54, v55, v56, v57, v58, v59, v60, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH264.mm");
              goto LABEL_75;
            }
            v112 = v33;
            v69 = (size_t *)v117[6];
            v70 = dataPointerOut;
            v71 = *v69;
            v72 = v69[1];
            v73 = *v69 + DataLength;
            if (v72 < v73)
            {
              if (v72 + (v72 >> 1) <= v73)
                v74 = *v69 + DataLength;
              else
                v74 = v72 + (v72 >> 1);
              v110 = v74;
              v111 = dataPointerOut;
              v75 = (void *)operator new[]();
              v76 = (const void *)v69[2];
              if (v76)
              {
                v108 = (size_t)v75;
                v109 = v69[2];
                memcpy(v75, v76, *v69);
                v69[2] = v108;
                MEMORY[0x20BD0ADD4](v109, 0x1000C8077774924);
              }
              else
              {
                v69[2] = (size_t)v75;
              }
              v70 = v111;
              v69[1] = v110;
              v71 = *v69;
            }
            memcpy((void *)(v69[2] + v71), v70, DataLength);
            *v69 = v73;
            v33 = v112;
          }
          if (self->_descriptionCallback)
          {
            if (self->_needsToSendDescription)
            {
              FormatDescription = CMSampleBufferGetFormatDescription(a5);
              Extension = (const __CFDictionary *)CMFormatDescriptionGetExtension(FormatDescription, (CFStringRef)*MEMORY[0x24BDC0B80]);
              if (Extension)
              {
                Value = (const __CFData *)CFDictionaryGetValue(Extension, CFSTR("avcC"));
                v80 = Value;
                if (Value)
                {
                  self->_needsToSendDescription = 0;
                  v81 = (void (**)(id, const UInt8 *, CFIndex))self->_descriptionCallback;
                  BytePtr = CFDataGetBytePtr(Value);
                  Length = CFDataGetLength(v80);
                  v81[2](v81, BytePtr, Length);
                }
              }
            }
          }
        }
        v84 = objc_alloc_init(WK_RTCEncodedImage);
        v85 = objc_alloc(MEMORY[0x24BDBCE50]);
        v86 = (uint64_t *)v117[6];
        v87 = v86[2];
        v88 = *v86;
        v113[0] = MEMORY[0x24BDAC760];
        v113[1] = 3221225472;
        v113[2] = __149__RTCVideoEncoderH264_frameWasEncoded_flags_sampleBuffer_codecSpecificInfo_width_height_renderTimeMs_timestamp_duration_rotation_isKeyFrameRequired___block_invoke;
        v113[3] = &unk_24C0BC890;
        v113[4] = &v116;
        v89 = (void *)objc_msgSend(v85, "initWithBytesNoCopy:length:deallocator:", v87, v88, v113);
        -[WK_RTCEncodedImage setBuffer:](v84, "setBuffer:", v89);

        -[WK_RTCEncodedImage setEncodedWidth:](v84, "setEncodedWidth:", v14);
        -[WK_RTCEncodedImage setEncodedHeight:](v84, "setEncodedHeight:", v13);
        -[WK_RTCEncodedImage setCompleteFrame:](v84, "setCompleteFrame:", 1);
        if ((_DWORD)v29)
          v90 = 3;
        else
          v90 = 4;
        -[WK_RTCEncodedImage setFrameType:](v84, "setFrameType:", v90);
        -[WK_RTCEncodedImage setCaptureTimeMs:](v84, "setCaptureTimeMs:", a9);
        -[WK_RTCEncodedImage setDuration:](v84, "setDuration:", a11);
        -[WK_RTCEncodedImage setTimeStamp:](v84, "setTimeStamp:", a10);
        -[WK_RTCEncodedImage setRotation:](v84, "setRotation:", a12);
        -[WK_RTCEncodedImage setContentType:](v84, "setContentType:", self->_mode == 1);
        -[WK_RTCEncodedImage setFlags:](v84, "setFlags:", 255);
        if (self->_enableL1T2ScalabilityMode)
          v91 = !v33;
        else
          v91 = 0xFFFFFFFFLL;
        -[WK_RTCEncodedImage setTemporalIndex:](v84, "setTemporalIndex:", v91);
        if (self->_useAnnexB)
        {
          v92 = (_QWORD *)v117[6];
          if (*v92)
            v93 = v92[2];
          else
            v93 = 0;
          (*((void (**)(H264BitstreamParser *, uint64_t))self->_h264BitstreamParser._vptr$BitstreamParser + 2))(&self->_h264BitstreamParser, v93);
          v94 = (*((uint64_t (**)(H264BitstreamParser *))self->_h264BitstreamParser._vptr$BitstreamParser + 3))(&self->_h264BitstreamParser);
          if ((v94 & 0xFF00000000) != 0)
            v95 = v94;
          else
            v95 = 0;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v95);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          -[WK_RTCEncodedImage setQp:](v84, "setQp:", v96);

        }
        if (((*((uint64_t (**)(void))self->_callback + 2))() & 1) != 0)
        {
          v97 = self->_bitrateAdjuster.__ptr_.__value_;
          -[WK_RTCEncodedImage buffer](v84, "buffer");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          webrtc::BitrateAdjuster::Update((webrtc::BitrateAdjuster *)v97, objc_msgSend(v98, "length"));

        }
        else
        {
          if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)3>() & 1) == 0)
            rtc::webrtc_logging_impl::Log("\r\t", v99, v100, v101, v102, v103, v104, v105, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH264.mm");
          if (a13)
            self->_isKeyFrameRequired = 1;
        }

LABEL_75:
        _Block_object_dispose(&v116, 8);
        v106 = v122;
        v122 = 0;
        if (v106)
        {
          v107 = v106[2];
          v106[2] = 0;
          if (v107)
            MEMORY[0x20BD0ADD4](v107, 0x1000C8077774924);
          MEMORY[0x20BD0ADEC](v106, 0x1010C40A79CA2DELL);
        }
        goto LABEL_79;
      }
    }
    else
    {
      v33 = 1;
      if (!v31)
        goto LABEL_14;
    }
    LODWORD(v29) = 0;
    goto LABEL_27;
  }
  if (a13)
    self->_isKeyFrameRequired = 1;
  v41 = (void (**)(id, _QWORD))self->_errorCallback;
  if (v41)
    v41[2](v41, 0);
  if ((rtc::LogMessage::IsNoop<(rtc::LoggingSeverity)1>() & 1) == 0)
    rtc::webrtc_logging_impl::Log("\r\t", v42, v43, v44, v45, v46, v47, v48, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/sdk/objc/components/video_codec/RTCVideoEncoderH264.mm");
LABEL_79:

}

- (id)scalingSettings
{
  return -[WK_RTCVideoEncoderQpThresholds initWithThresholdsLow:high:]([WK_RTCVideoEncoderQpThresholds alloc], "initWithThresholdsLow:high:", 28, 39);
}

- (void)flush
{
  OpaqueVTCompressionSession *vtCompressionSession;
  CMTime v3;

  vtCompressionSession = self->_vtCompressionSession;
  if (vtCompressionSession)
  {
    v3 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
    VTCompressionSessionCompleteFrames(vtCompressionSession, &v3);
  }
}

- (void)enableL1T2ScalabilityMode
{
  self->_enableL1T2ScalabilityMode = 1;
}

- (void).cxx_destruct
{
  char *begin;
  BitrateAdjuster *value;

  objc_storeStrong(&self->_errorCallback, 0);
  objc_storeStrong(&self->_descriptionCallback, 0);
  begin = self->_frameScaleBuffer.__begin_;
  if (begin)
  {
    self->_frameScaleBuffer.__end_ = begin;
    operator delete(begin);
  }
  self->_h264BitstreamParser._vptr$BitstreamParser = (void **)&off_24C0B4A00;
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
  *((_BYTE *)self + 48) = 0;
  *((_BYTE *)self + 56) = 0;
  *((_QWORD *)self + 14) = &off_24C0B4A00;
  *((_BYTE *)self + 120) = 0;
  *((_BYTE *)self + 172) = 0;
  *((_BYTE *)self + 176) = 0;
  *((_BYTE *)self + 200) = 0;
  *((_BYTE *)self + 204) = 0;
  *((_BYTE *)self + 208) = 0;
  *((_QWORD *)self + 28) = 0;
  *((_QWORD *)self + 29) = 0;
  *((_QWORD *)self + 27) = 0;
  return self;
}

@end
