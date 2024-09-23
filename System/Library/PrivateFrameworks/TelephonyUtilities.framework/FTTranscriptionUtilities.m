@implementation FTTranscriptionUtilities

+ (id)parseWebVTTSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  FTWebVTTTranscriptionResult *v4;
  OpaqueCMBlockBuffer *DataBuffer;
  OpaqueCMBlockBuffer *v6;
  size_t DataLength;
  OSStatus v8;
  void *v9;
  const __CFAllocator *v10;
  size_t v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  size_t v16;
  void *v17;
  CFStringRef v18;
  unsigned int destination;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(FTWebVTTTranscriptionResult);
  -[FTWebVTTTranscriptionResult setIsEmptyCueOut:](v4, "setIsEmptyCueOut:", 0);
  DataBuffer = CMSampleBufferGetDataBuffer(a3);
  if (DataBuffer)
  {
    v6 = DataBuffer;
    DataLength = CMBlockBufferGetDataLength(DataBuffer);
    v8 = CMBlockBufferCopyDataBytes(v6, 0, 8uLL, &destination);
    if (v8)
    {
LABEL_3:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", callRecordingCompositionDomain, v8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[FTWebVTTTranscriptionResult setError:](v4, "setError:", v9);

      return v4;
    }
    if (v20 == 1668576374 && DataLength >= 0x10)
    {
      v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v11 = 8;
      v12 = 16;
      do
      {
        v8 = CMBlockBufferCopyDataBytes(v6, v11, 8uLL, &destination);
        if (v8)
          goto LABEL_3;
        v13 = bswap32(destination);
        if (v20 == 1819894128)
        {
          v16 = v13 - 8;
          v17 = malloc_type_malloc(v13 - 8, 0x9B3130F9uLL);
          v8 = CMBlockBufferCopyDataBytes(v6, v12, v16, v17);
          if (v8)
            goto LABEL_3;
          v18 = CFStringCreateWithBytes(v10, (const UInt8 *)v17, v16, 0x8000100u, 0);
          -[FTWebVTTTranscriptionResult setText:](v4, "setText:", v18);
          if (v18)
            CFRelease(v18);
          v14 = 0;
          goto LABEL_11;
        }
        v11 += v13;
        v12 = v11 + 8;
      }
      while (v11 + 8 <= DataLength);
    }
    -[FTWebVTTTranscriptionResult setText:](v4, "setText:", 0);
    v14 = 1;
LABEL_11:
    -[FTWebVTTTranscriptionResult setIsEmptyCueOut:](v4, "setIsEmptyCueOut:", v14);
  }
  return v4;
}

@end
