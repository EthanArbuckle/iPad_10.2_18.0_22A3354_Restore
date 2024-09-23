@implementation FTCaptionsMachine

+ (double)machTimeScale
{
  if (machTimeScale_onceToken != -1)
    dispatch_once(&machTimeScale_onceToken, &__block_literal_global_48);
  return *(double *)&machTimeScale_timeScale;
}

double __34__FTCaptionsMachine_machTimeScale__block_invoke()
{
  unint64_t v0;
  unint64_t v1;
  double result;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  result = (double)v0 / (double)v1 / 1000000000.0;
  machTimeScale_timeScale = *(_QWORD *)&result;
  return result;
}

+ (double)mediaTimeBase
{
  double v2;

  objc_msgSend(a1, "machTimeScale");
  return v2 * (double)(uint64_t)mach_absolute_time();
}

+ (int)createWebVTTTextSampleBuffer:(__CFString *)a3 startTime:(id *)a4 duration:(id *)a5 sampleBufferOut:(opaqueCMSampleBuffer *)a6
{
  const __CFAllocator *v10;
  CFIndex Length;
  UInt8 *v12;
  uint64_t v13;
  unsigned int v14;
  _DWORD *v15;
  OSStatus v16;
  OSStatus v17;
  CFStringRef v18;
  CFStringRef v19;
  CMSampleBufferRef v20;
  CFStringRef v22;
  CFStringRef v23;
  $3CC8671D27C23BF42ADDB32F2B5E48AE maxBufLen;
  CMBlockBufferRef blockBufferOut;
  size_t sampleSizeArray;
  CMSampleTimingInfo sampleTimingArray;
  CMFormatDescriptionRef formatDescriptionOut;
  CMSampleBufferRef v29;
  CFRange v30;
  CFRange v31;

  formatDescriptionOut = 0;
  v29 = 0;
  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  CMFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x74657874u, 0x77767474u, 0, &formatDescriptionOut);
  sampleTimingArray.duration = (CMTime)*a5;
  sampleTimingArray.presentationTimeStamp = (CMTime)*a4;
  sampleTimingArray.decodeTimeStamp = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  blockBufferOut = 0;
  sampleSizeArray = 0;
  if (a3)
  {
    Length = CFStringGetLength(a3);
    maxBufLen.var0 = 0;
    v30.location = 0;
    v30.length = Length;
    CFStringGetBytes(a3, v30, 0x8000100u, 0, 0, 0, 0, &maxBufLen.var0);
    v12 = (UInt8 *)malloc_type_malloc(maxBufLen.var0, 0x67C080A7uLL);
    v31.location = 0;
    v31.length = Length;
    CFStringGetBytes(a3, v31, 0x8000100u, 0, 0, v12, maxBufLen.var0, &maxBufLen.var0);
    v13 = LODWORD(maxBufLen.var0) + 16;
    v14 = bswap32(LODWORD(maxBufLen.var0) + 8);
    v15 = malloc_type_malloc(v13, 0x3D4D23B6uLL);
    *v15 = bswap32(v13);
    v15[1] = 1668576374;
    v15[2] = v14;
    v15[3] = 1819894128;
    memcpy(v15 + 4, v12, maxBufLen.var0);
  }
  else
  {
    v13 = 8;
    v15 = malloc_type_malloc(8uLL, 0x1EABAACDuLL);
    v12 = 0;
    *(_QWORD *)v15 = 0x6574747608000000;
  }
  v16 = CMBlockBufferCreateWithMemoryBlock(v10, v15, v13, v10, 0, 0, v13, 0, &blockBufferOut);
  if (v16)
  {
    v17 = v16;
    maxBufLen = *a4;
    v18 = CMTimeCopyDescription(v10, (CMTime *)&maxBufLen);
    maxBufLen = *a4;
    v19 = CMTimeCopyDescription(v10, (CMTime *)&maxBufLen);
    CFRelease(v18);
    v20 = (CMSampleBufferRef)v19;
LABEL_6:
    CFRelease(v20);
    goto LABEL_7;
  }
  sampleSizeArray = v13;
  v17 = CMSampleBufferCreate(v10, blockBufferOut, 1u, 0, 0, formatDescriptionOut, 1, 1, &sampleTimingArray, 1, &sampleSizeArray, &v29);
  if (v17)
  {
    maxBufLen = *a4;
    v22 = CMTimeCopyDescription(v10, (CMTime *)&maxBufLen);
    maxBufLen = *a4;
    v23 = CMTimeCopyDescription(v10, (CMTime *)&maxBufLen);
    CFRelease(v22);
    CFRelease(v23);
    v20 = v29;
    if (v29)
      goto LABEL_6;
  }
  else
  {
    *a6 = v29;
    v29 = 0;
  }
LABEL_7:
  if (blockBufferOut)
    CFRelease(blockBufferOut);
  free(v12);
  return v17;
}

@end
