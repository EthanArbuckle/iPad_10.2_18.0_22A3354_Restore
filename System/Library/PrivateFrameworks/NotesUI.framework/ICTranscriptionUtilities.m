@implementation ICTranscriptionUtilities

+ (id)parseWebVTTSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  ICWebVTTTranscriptionResult *v4;
  OpaqueCMBlockBuffer *DataBuffer;
  OpaqueCMBlockBuffer *v6;
  size_t DataLength;
  OSStatus v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const __CFAllocator *v14;
  size_t v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  void *v20;
  CFStringRef v21;
  unsigned int destination;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(ICWebVTTTranscriptionResult);
  -[ICWebVTTTranscriptionResult setIsEmptyCueOut:](v4, "setIsEmptyCueOut:", 0);
  DataBuffer = CMSampleBufferGetDataBuffer(a3);
  if (!DataBuffer)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0D63F58];
    v10 = -12705;
    goto LABEL_5;
  }
  v6 = DataBuffer;
  DataLength = CMBlockBufferGetDataLength(DataBuffer);
  v8 = CMBlockBufferCopyDataBytes(v6, 0, 8uLL, &destination);
  if (v8)
  {
LABEL_3:
    v9 = *MEMORY[0x1E0D63F58];
    v10 = v8;
    v11 = (void *)MEMORY[0x1E0CB35C8];
LABEL_5:
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v9, v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICWebVTTTranscriptionResult setError:](v4, "setError:", v12);

    return v4;
  }
  if (v23 == 1668576374 && DataLength >= 0x10)
  {
    v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v15 = 8;
    v16 = 16;
    do
    {
      v8 = CMBlockBufferCopyDataBytes(v6, v15, 8uLL, &destination);
      if (v8)
        goto LABEL_3;
      v17 = bswap32(destination);
      if (v23 == 1819894128)
      {
        v19 = v17 - 8;
        v20 = malloc_type_malloc(v17 - 8, 0xD64750DEuLL);
        v8 = CMBlockBufferCopyDataBytes(v6, v16, v19, v20);
        if (v8)
          goto LABEL_3;
        v21 = CFStringCreateWithBytes(v14, (const UInt8 *)v20, v19, 0x8000100u, 0);
        -[ICWebVTTTranscriptionResult setText:](v4, "setText:", v21);
        if (v21)
          CFRelease(v21);
        v18 = 0;
        goto LABEL_14;
      }
      v15 += v17;
      v16 = v15 + 8;
    }
    while (v15 + 8 <= DataLength);
  }
  -[ICWebVTTTranscriptionResult setText:](v4, "setText:", 0);
  v18 = 1;
LABEL_14:
  -[ICWebVTTTranscriptionResult setIsEmptyCueOut:](v4, "setIsEmptyCueOut:", v18);
  return v4;
}

@end
