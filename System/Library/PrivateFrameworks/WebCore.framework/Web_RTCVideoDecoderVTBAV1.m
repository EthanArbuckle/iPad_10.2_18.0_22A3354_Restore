@implementation Web_RTCVideoDecoderVTBAV1

- (Web_RTCVideoDecoderVTBAV1)init
{
  Web_RTCVideoDecoderVTBAV1 *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)Web_RTCVideoDecoderVTBAV1;
  result = -[Web_RTCVideoDecoderVTBAV1 init](&v3, sel_init);
  if (result)
    result->_shouldCheckFormat = 1;
  return result;
}

- (void)dealloc
{
  void *m_ptr;
  objc_super v4;

  -[Web_RTCVideoDecoderVTBAV1 destroyDecompressionSession](self, "destroyDecompressionSession");
  m_ptr = self->_videoFormat.m_ptr;
  self->_videoFormat.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4.receiver = self;
  v4.super_class = (Class)Web_RTCVideoDecoderVTBAV1;
  -[Web_RTCVideoDecoderVTBAV1 dealloc](&v4, sel_dealloc);
}

- (void)setWidth:(unsigned __int16)a3 height:(unsigned __int16)a4
{
  self->_width = a3;
  self->_height = a4;
  self->_shouldCheckFormat = 1;
}

- (int64_t)decodeData:(const char *)a3 size:(unint64_t)a4 timeStamp:(int64_t)a5
{
  NSObject *v6;
  int64_t v7;
  unint64_t v12;
  int height;
  int width;
  int v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int v23;
  int v24;
  int v25;
  int v26;
  void *v27;
  PAL *v28;
  unint64_t v29;
  int v30;
  NSObject *v31;
  const __CFAllocator *v32;
  int v33;
  NSObject *v34;
  const char *v35;
  uint8_t *v36;
  size_t v37;
  unsigned __int8 *v38;
  unsigned int v39;
  unsigned int v41;
  unint64_t v42;
  unsigned int v44;
  char v45;
  int v46;
  int v47;
  int v48;
  unsigned int v49;
  int v50;
  uint64_t v51;
  int v52;
  OpaqueVTDecompressionSession *v53;
  _QWORD *v54;
  unsigned int *v55;
  int v56;
  NSObject *v57;
  _QWORD *v58;
  unsigned int *v59;
  NSObject *v60;
  unint64_t v61;
  int v62;
  const char *v63;
  char v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unsigned int v69;
  int v70;
  unsigned int v71;
  int v72;
  __CFData *Mutable;
  UInt8 *MutableBytePtr;
  uint64_t v75;
  int v76;
  const opaqueCMFormatDescription **v77;
  const opaqueCMFormatDescription *v78;
  void *v79;
  void *m_ptr;
  int v81;
  void *v82;
  PAL *v83;
  int v84;
  const char *__src;
  void *v86;
  uint64_t v87;
  uint8_t v88[8];
  uint8_t buf[8];
  uint8_t v90[8];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  if (self->_error)
  {
    v6 = qword_1ECE7CD60;
    if (os_log_type_enabled((os_log_t)qword_1ECE7CD60, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v90 = 0;
      _os_log_error_impl(&dword_1940B8000, v6, OS_LOG_TYPE_ERROR, "RTCVideoDecoderVTBAV1 Last frame decode failed", v90, 2u);
    }
    self->_error = 0;
    return -1;
  }
  if ((self->_shouldCheckFormat || !self->_videoFormat.m_ptr) && a4)
  {
    v12 = 0;
    width = self->_width;
    height = self->_height;
    while (1)
    {
      v15 = a3[v12];
      if (v15 < 0 || (v15 & 2) == 0)
        break;
      v16 = v12;
      if ((v15 & 4) != 0)
        v17 = 2;
      else
        v17 = 1;
      v18 = v17 + v12;
      if (a4 >= v18)
        v19 = a4 - v18;
      else
        v19 = 0;
      if (v18 >= a4)
      {
        v21 = 0;
        v20 = v18;
      }
      else
      {
        v20 = v18 + 1;
        v21 = a3[v18] & 0x7F;
        if (a3[v18] < 0)
        {
          if (v19 != 1)
          {
            v22 = v18 + 2;
            v23 = a3[v20];
            v21 |= (unint64_t)(v23 & 0x7F) << 7;
            if ((v23 & 0x80000000) == 0)
              goto LABEL_30;
            if (v19 == 2)
              goto LABEL_29;
            v20 = v18 + 3;
            v24 = a3[v22];
            v21 |= (unint64_t)(v24 & 0x7F) << 14;
            if ((v24 & 0x80000000) == 0)
              goto LABEL_23;
            if (v19 != 3)
            {
              v22 = v18 + 4;
              v25 = a3[v20];
              v21 |= (unint64_t)(v25 & 0x7F) << 21;
              if ((v25 & 0x80000000) == 0)
                goto LABEL_30;
              if (v19 == 4)
              {
LABEL_29:
                v21 = 0;
LABEL_30:
                v20 = v22;
                goto LABEL_23;
              }
              v20 = v18 + 5;
              v26 = a3[v22];
              v21 |= v26 << 28;
              if (v21 <= 0xFFFFFFFE)
              {
                if (v26 < 0)
                  v21 = 0;
                goto LABEL_23;
              }
            }
          }
          v21 = 0;
        }
      }
LABEL_23:
      v12 = v20 + v21;
      if (__CFADD__(v20, v21))
        goto LABEL_117;
      if (v12 >= a4)
        break;
      if ((v15 & 0xF8) == 8)
      {
        v37 = v12 - v16;
        if (v12 < v16)
        {
LABEL_117:
          __break(0xC471u);
          JUMPOUT(0x195411AC4);
        }
        if (v21)
        {
          v38 = (unsigned __int8 *)&a3[v20];
          v39 = a3[v20];
          if ((v39 & 0xC) == 0 && v21 != 1)
          {
            v41 = v38[1];
            HIDWORD(v42) = (v41 >> 7) & 0xFFFFFFFD | (2 * (v39 & 1));
            LODWORD(v42) = v41 << 25;
            HIDWORD(v42) = v42 >> 31;
            LODWORD(v42) = v41 << 26;
            HIDWORD(v42) = v42 >> 31;
            LODWORD(v42) = v41 << 27;
            if (!(v42 >> 31) && v21 >= 4)
            {
              v44 = (unint64_t)v38[3] << 28 >> 31;
              v45 = 5;
              if (v44 > 7)
                v45 = 6;
              v46 = v38[3] << v45;
              v47 = v46 >> 6;
              if (v44 < 8)
              {
                if (v21 < 5)
                  break;
                HIDWORD(v61) = v46 >> 6;
                LODWORD(v61) = v46 << 26;
                v50 = v61 >> 31;
                v49 = v38[4];
                v51 = 3;
              }
              else
              {
                if (v21 < 5)
                  break;
                v48 = v38[4];
                v49 = 2 * v48;
                v50 = __PAIR64__(v47, v48 << 24) >> 31;
                v51 = 2;
              }
              v62 = 0;
              v63 = &a3[v16];
              HIDWORD(v65) = v39 >> 6;
              LODWORD(v65) = v39 << 26;
              v64 = v65 >> 31;
              HIDWORD(v65) = v50;
              LODWORD(v65) = v49 << 24;
              v66 = ((v65 >> 31) + 1);
              HIDWORD(v65) = (v49 >> 5) & 3;
              LODWORD(v65) = v49 << 27;
              HIDWORD(v65) = v65 >> 31;
              LODWORD(v65) = v49 << 28;
              v67 = (v65 >> 31) + 1;
              v68 = 5;
              v69 = 32 * v49;
              do
              {
                if (v51)
                {
                  --v51;
                }
                else
                {
                  if (v68 >= v21)
                    goto LABEL_40;
                  v69 = v38[v68++];
                  v51 = 7;
                }
                v70 = (v69 >> 7) & 1;
                v69 *= 2;
                v62 = v70 | (2 * v62);
                --v66;
              }
              while (v66);
              v71 = v62 + 1;
              do
              {
                if (v51)
                {
                  --v51;
                }
                else
                {
                  if (v68 >= v21)
                    goto LABEL_40;
                  v69 = v38[v68++];
                  v51 = 7;
                }
                v72 = (v69 >> 7) & 1;
                v69 *= 2;
                LODWORD(v66) = v72 | (2 * v66);
                --v67;
              }
              while (v67);
              if ((!width || v71 == width) && (!height || (_DWORD)v66 + 1 == height))
              {
                v84 = v66 + 1;
                __src = v63;
                v83 = (PAL *)*MEMORY[0x1E0C9AE00];
                Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v37 + 4);
                CFDataIncreaseLength(Mutable, v37 + 4);
                MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
                *MutableBytePtr = -127;
                MutableBytePtr[1] = v44 | (32 * v64);
                *((_WORD *)MutableBytePtr + 1) = 12;
                memcpy(MutableBytePtr + 4, __src, v37);
                *(_QWORD *)buf = CFSTR("av1C");
                *(_QWORD *)v90 = Mutable;
                v75 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, buf, 1);
                if (PAL::get_CoreMedia_kCMFormatDescriptionExtension_SampleDescriptionExtensionAtoms(void)::once != -1)
                  dispatch_once(&PAL::get_CoreMedia_kCMFormatDescriptionExtension_SampleDescriptionExtensionAtoms(void)::once, &__block_literal_global_18_1);
                v87 = PAL::get_CoreMedia_kCMFormatDescriptionExtension_SampleDescriptionExtensionAtoms(void)::constantCoreMediakCMFormatDescriptionExtension_SampleDescriptionExtensionAtoms;
                *(_QWORD *)v88 = v75;
                v76 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, &v87, 1);
                v86 = 0;
                if (PAL::softLinkCoreMediaCMVideoFormatDescriptionCreate(v83, (const __CFAllocator *)0x61763031, v71, v84, v76, (const __CFDictionary *)&v86, v77))v79 = 0;
                else
                  v79 = v86;
                if (Mutable)
                  CFRelease(Mutable);
                if (v79)
                {
                  self->_shouldCheckFormat = 0;
                  if (PAL::softLinkCoreMediaCMFormatDescriptionEqual((PAL *)v79, (const opaqueCMFormatDescription *)self->_videoFormat.m_ptr, v78))
                  {
                    CFRelease(v79);
                    break;
                  }
                  m_ptr = self->_videoFormat.m_ptr;
                  self->_videoFormat.m_ptr = v79;
                  if (m_ptr)
                    CFRelease(m_ptr);
                  v81 = -[Web_RTCVideoDecoderVTBAV1 resetDecompressionSession](self, "resetDecompressionSession");
                  if (v81)
                  {
                    v82 = self->_videoFormat.m_ptr;
                    self->_videoFormat.m_ptr = 0;
                    if (v82)
                      CFRelease(v82);
                    return v81;
                  }
                }
              }
            }
          }
        }
        break;
      }
    }
  }
LABEL_40:
  v27 = self->_videoFormat.m_ptr;
  if (!v27)
    return -1;
  *(_QWORD *)v90 = 0;
  v28 = (PAL *)*MEMORY[0x1E0C9AE00];
  v30 = ((uint64_t (*)(PAL *__hidden, const __CFAllocator *, void *, unint64_t, const __CFAllocator *, const CMBlockBufferCustomBlockSource *, unint64_t, unint64_t, unsigned int))PAL::softLinkCoreMediaCMBlockBufferCreateWithMemoryBlock)((PAL *)*MEMORY[0x1E0C9AE00], 0, (void *)a4, *MEMORY[0x1E0C9AE00], 0, 0, a4, 1uLL, v90);
  if (v30)
  {
    v31 = qword_1ECE7CD60;
    if (os_log_type_enabled((os_log_t)qword_1ECE7CD60, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v30;
      _os_log_error_impl(&dword_1940B8000, v31, OS_LOG_TYPE_ERROR, "AV1BufferToCMSampleBuffer CMBlockBufferCreateWithMemoryBlock failed with: %d", buf, 8u);
    }
    return -1;
  }
  v32 = *(const __CFAllocator **)v90;
  v33 = PAL::softLinkCoreMediaCMBlockBufferReplaceDataBytes((PAL *)a3, *(const void **)v90, 0, a4, v29);
  if (v33)
  {
    v34 = qword_1ECE7CD60;
    if (!os_log_type_enabled((os_log_t)qword_1ECE7CD60, OS_LOG_TYPE_ERROR))
      goto LABEL_65;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v33;
    v35 = "AV1BufferToCMSampleBuffer CMBlockBufferReplaceDataBytes failed with: %d";
    v36 = buf;
    goto LABEL_110;
  }
  *(_QWORD *)buf = 0;
  v52 = ((uint64_t (*)(PAL *__hidden, const __CFAllocator *, OpaqueCMBlockBuffer *, unsigned __int8, int (*)(opaqueCMSampleBuffer *, void *), void *, const opaqueCMFormatDescription *, uint64_t, uint64_t, const CMSampleTimingInfo *, uint64_t, const unint64_t *))PAL::softLinkCoreMediaCMSampleBufferCreate)(v28, v32, (OpaqueCMBlockBuffer *)1, 0, 0, v27, (const opaqueCMFormatDescription *)1, 0, 0, 0, 0, (const unint64_t *)buf);
  if (v52)
  {
    v34 = qword_1ECE7CD60;
    if (!os_log_type_enabled((os_log_t)qword_1ECE7CD60, OS_LOG_TYPE_ERROR))
      goto LABEL_65;
    *(_DWORD *)v88 = 67109120;
    *(_DWORD *)&v88[4] = v52;
    v35 = "AV1BufferToCMSampleBuffer CMSampleBufferCreate failed with: %d";
    v36 = v88;
LABEL_110:
    _os_log_error_impl(&dword_1940B8000, v34, OS_LOG_TYPE_ERROR, v35, v36, 8u);
LABEL_65:
    v53 = 0;
    if (!v32)
      goto LABEL_67;
    goto LABEL_66;
  }
  v53 = *(OpaqueVTDecompressionSession **)buf;
  if (v32)
LABEL_66:
    CFRelease(v32);
LABEL_67:
  if (v53)
  {
    v54 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v54 = _Block_copy(self->_callback.m_block);
    v54[1] = a5;
    v56 = WebCore::softLinkVideoToolboxVTDecompressionSessionDecodeFrame((WebCore *)self->_decompressionSession.m_ptr, v53, (opaqueCMSampleBuffer *)1, v54, 0, v55);
    if ((v56 & 0xFFFFFFF7) == 0xFFFFCD91)
    {
      if (-[Web_RTCVideoDecoderVTBAV1 resetDecompressionSession](self, "resetDecompressionSession"))
        goto LABEL_74;
      v57 = qword_1ECE7CD60;
      if (os_log_type_enabled((os_log_t)qword_1ECE7CD60, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v90 = 67109120;
        *(_DWORD *)&v90[4] = v56;
        _os_log_impl(&dword_1940B8000, v57, OS_LOG_TYPE_INFO, "Failed to decode frame with code %d, retrying decode after decompression session reset", v90, 8u);
      }
      v58 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v58 = _Block_copy(self->_callback.m_block);
      v58[1] = a5;
      v56 = WebCore::softLinkVideoToolboxVTDecompressionSessionDecodeFrame((WebCore *)self->_decompressionSession.m_ptr, v53, (opaqueCMSampleBuffer *)1, v58, 0, v59);
    }
    if (!v56)
    {
      v7 = 0;
LABEL_78:
      CFRelease(v53);
      return v7;
    }
LABEL_74:
    v60 = qword_1ECE7CD60;
    if (os_log_type_enabled((os_log_t)qword_1ECE7CD60, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v90 = 67109120;
      *(_DWORD *)&v90[4] = v56;
      _os_log_error_impl(&dword_1940B8000, v60, OS_LOG_TYPE_ERROR, "RTCVideoDecoderVTBAV1 failed to decode frame with code %d", v90, 8u);
    }
    v7 = -1;
    goto LABEL_78;
  }
  return -1;
}

- (void)setCallback:(id)a3
{
  void *v4;

  v4 = _Block_copy(a3);
  _Block_release(self->_callback.m_block);
  self->_callback.m_block = v4;
  _Block_release(0);
}

- (void)setError:(int)a3
{
  self->_error = a3;
}

- (int64_t)releaseDecoder
{
  void *m_ptr;
  void *v4;

  -[Web_RTCVideoDecoderVTBAV1 destroyDecompressionSession](self, "destroyDecompressionSession");
  m_ptr = self->_videoFormat.m_ptr;
  self->_videoFormat.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = _Block_copy(0);
  _Block_release(self->_callback.m_block);
  self->_callback.m_block = v4;
  _Block_release(0);
  return 0;
}

- (int)resetDecompressionSession
{
  const __CFAllocator *v3;
  CFDictionaryRef v4;
  CFNumberRef v5;
  const __CFDictionary *v6;
  OpaqueVTDecompressionSession **v7;
  int v8;
  NSObject *v9;
  int v10;
  void *m_ptr;
  VTDecompressionOutputCallbackRecord v13;
  Web_RTCVideoDecoderVTBAV1 *v14;
  uint64_t valuePtr;
  uint8_t buf[4];
  int v17;
  void *values[3];
  void *keys[4];

  keys[3] = *(void **)MEMORY[0x1E0C80C00];
  -[Web_RTCVideoDecoderVTBAV1 destroyDecompressionSession](self, "destroyDecompressionSession");
  if (!self->_videoFormat.m_ptr)
    return 0;
  if (WebCore::get_CoreVideo_kCVPixelBufferOpenGLESCompatibilityKey(void)::once != -1)
    dispatch_once(&WebCore::get_CoreVideo_kCVPixelBufferOpenGLESCompatibilityKey(void)::once, &__block_literal_global_100_0);
  keys[0] = (void *)WebCore::get_CoreVideo_kCVPixelBufferOpenGLESCompatibilityKey(void)::constantCoreVideokCVPixelBufferOpenGLESCompatibilityKey;
  if (WebCore::get_CoreVideo_kCVPixelBufferIOSurfacePropertiesKey(void)::once != -1)
    dispatch_once(&WebCore::get_CoreVideo_kCVPixelBufferIOSurfacePropertiesKey(void)::once, &__block_literal_global_37_1);
  keys[1] = (void *)WebCore::get_CoreVideo_kCVPixelBufferIOSurfacePropertiesKey(void)::constantCoreVideokCVPixelBufferIOSurfacePropertiesKey;
  if (WebCore::get_CoreVideo_kCVPixelBufferPixelFormatTypeKey(void)::once != -1)
    dispatch_once(&WebCore::get_CoreVideo_kCVPixelBufferPixelFormatTypeKey(void)::once, &__block_literal_global_13_3);
  keys[2] = (void *)WebCore::get_CoreVideo_kCVPixelBufferPixelFormatTypeKey(void)::constantCoreVideokCVPixelBufferPixelFormatTypeKey;
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v4 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  valuePtr = 875704422;
  v5 = CFNumberCreate(0, kCFNumberLongType, &valuePtr);
  values[0] = *(void **)MEMORY[0x1E0C9AE50];
  values[1] = v4;
  values[2] = v5;
  v6 = CFDictionaryCreate(v3, (const void **)keys, (const void **)values, 3, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v13.decompressionOutputRefCon = av1DecompressionOutputCallback;
  v14 = self;
  v13.decompressionOutputCallback = 0;
  v8 = WebCore::softLinkVideoToolboxVTDecompressionSessionCreate(0, (const __CFAllocator *)self->_videoFormat.m_ptr, 0, v6, (const __CFDictionary *)&v13.decompressionOutputRefCon, &v13, v7);
  if (v8)
  {
    v9 = qword_1ECE7CD60;
    if (os_log_type_enabled((os_log_t)qword_1ECE7CD60, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v17 = v8;
      _os_log_error_impl(&dword_1940B8000, v9, OS_LOG_TYPE_ERROR, "RTCVideoDecoderVTBAV1 failed to create decompression session %d", buf, 8u);
    }
    -[Web_RTCVideoDecoderVTBAV1 destroyDecompressionSession](self, "destroyDecompressionSession");
    v10 = -1;
    if (!v6)
      goto LABEL_13;
  }
  else
  {
    m_ptr = self->_decompressionSession.m_ptr;
    self->_decompressionSession.m_ptr = v13.decompressionOutputCallback;
    if (m_ptr)
      CFRelease(m_ptr);
    -[Web_RTCVideoDecoderVTBAV1 configureDecompressionSession](self, "configureDecompressionSession");
    v10 = 0;
    if (!v6)
      goto LABEL_13;
  }
  CFRelease(v6);
LABEL_13:
  if (v5)
    CFRelease(v5);
  if (v4)
    CFRelease(v4);
  return v10;
}

- (void)configureDecompressionSession
{
  WebCore *m_ptr;

  m_ptr = (WebCore *)self->_decompressionSession.m_ptr;
  if (WebCore::get_VideoToolbox_kVTDecompressionPropertyKey_RealTime(void)::once != -1)
    dispatch_once(&WebCore::get_VideoToolbox_kVTDecompressionPropertyKey_RealTime(void)::once, &__block_literal_global_18_10);
  WebCore::softLinkVideoToolboxVTSessionSetProperty(m_ptr, (const void *)WebCore::get_VideoToolbox_kVTDecompressionPropertyKey_RealTime(void)::constantVideoToolboxkVTDecompressionPropertyKey_RealTime, (const __CFString *)*MEMORY[0x1E0C9AE50], WebCore::softLinkVideoToolboxVTSessionSetProperty);
}

- (void)destroyDecompressionSession
{
  WebCore *m_ptr;
  OpaqueVTDecompressionSession *v4;
  void *v5;

  m_ptr = (WebCore *)self->_decompressionSession.m_ptr;
  if (m_ptr)
  {
    WebCore::softLinkVideoToolboxVTDecompressionSessionWaitForAsynchronousFrames(m_ptr, (OpaqueVTDecompressionSession *)a2);
    WebCore::softLinkVideoToolboxVTDecompressionSessionInvalidate((WebCore *)self->_decompressionSession.m_ptr, v4);
    v5 = self->_decompressionSession.m_ptr;
    self->_decompressionSession.m_ptr = 0;
    if (v5)
      CFRelease(v5);
  }
}

- (void)flush
{
  WebCore *m_ptr;

  m_ptr = (WebCore *)self->_decompressionSession.m_ptr;
  if (m_ptr)
    WebCore::softLinkVideoToolboxVTDecompressionSessionWaitForAsynchronousFrames(m_ptr, (OpaqueVTDecompressionSession *)WebCore::softLinkVideoToolboxVTDecompressionSessionWaitForAsynchronousFrames);
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;

  _Block_release(self->_callback.m_block);
  m_ptr = self->_decompressionSession.m_ptr;
  self->_decompressionSession.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_videoFormat.m_ptr;
  self->_videoFormat.m_ptr = 0;
  if (v4)
    CFRelease(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
