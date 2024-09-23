@implementation PVCMSampleBuffer

+ (opaqueCMSampleBuffer)createCMSampleBufferForPVImageBuffer:(id)a3 timingInfo:(id *)a4 error:(id *)a5
{
  id v7;
  __CVBuffer *v8;
  OSStatus v9;
  int v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  OSStatus v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  CMSampleBufferRef sampleBufferOut;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (__CVBuffer *)objc_msgSend(v7, "cvPixelBuffer");
  if (v8)
  {
    formatDescriptionOut = 0;
    v9 = CMVideoFormatDescriptionCreateForImageBuffer(0, v8, &formatDescriptionOut);
    v10 = v9;
    if (a5 && v9)
    {
      switch(v9)
      {
        case -12718:
          v11 = CFSTR("Value Not Available");
          break;
        case -12711:
          v11 = CFSTR("Allocation Failed");
          break;
        case -12710:
          v11 = CFSTR("Invalid Parameter");
          break;
        default:
          v11 = &stru_1E65EDDA0;
          break;
      }
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create video format description: %@"), v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.provideo.PVFrameSet"), v10, v16);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    sampleBufferOut = 0;
    if (!v10)
    {
      v17 = CMSampleBufferCreateReadyWithImageBuffer(0, v8, formatDescriptionOut, (const CMSampleTimingInfo *)a4, &sampleBufferOut);
      v10 = v17;
      if (a5)
      {
        if (v17)
        {
          v18 = CFSTR("Allocation Failed");
          switch(v17)
          {
            case -12744:
              v18 = CFSTR("Invalidated");
              break;
            case -12743:
              v18 = CFSTR("Invalid Media Format");
              break;
            case -12742:
              v18 = CFSTR("Invalid Sample Data");
              break;
            case -12741:
              v18 = CFSTR("Invalid Media Type For Operation");
              break;
            case -12740:
              v18 = CFSTR("Sample Timing Info Invalid");
              break;
            case -12739:
              v18 = CFSTR("Cannot Subdivide");
              break;
            case -12738:
              v18 = CFSTR("Invalid Entry Count");
              break;
            case -12737:
              v18 = CFSTR("Array Too Small");
              break;
            case -12736:
              v18 = CFSTR("Buffer Has No Sample Timing Info");
              break;
            case -12735:
              v18 = CFSTR("Buffer Has No Sample Sizes");
              break;
            case -12734:
              v18 = CFSTR("Sample Index Out Of Range");
              break;
            case -12733:
              v18 = CFSTR("Buffer Not Ready");
              break;
            case -12732:
              v18 = CFSTR("Already Has Data Buffer");
              break;
            case -12731:
              v18 = CFSTR("Required Parameter Missing");
              break;
            case -12730:
              break;
            default:
              if (v17 == -16751)
              {
                v18 = CFSTR("Data Cancelled");
              }
              else if (v17 == -16750)
              {
                v18 = CFSTR("Data Failed");
              }
              else
              {
                v18 = &stru_1E65EDDA0;
              }
              break;
          }
          v19 = (void *)MEMORY[0x1E0CB35C8];
          v25 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create sample buffer: %@"), v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.provideo.PVFrameSet"), v10, v21);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

          v10 = 1;
        }
      }
    }
    if (formatDescriptionOut)
      CFRelease(formatDescriptionOut);
    if (v10)
      a5 = 0;
    else
      a5 = (id *)sampleBufferOut;
  }
  else if (a5)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D50];
    v30[0] = CFSTR("Failed to create sample buffer: CVPixelBuffer is nil.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.provideo.PVFrameSet"), 3, v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }

  return (opaqueCMSampleBuffer *)a5;
}

+ (id)sampleBufferWithPVImageBuffer:(id)a3 timestamp:(id *)a4 frameDuration:(id *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  v7 = *a4;
  v6 = *a5;
  objc_msgSend(a1, "sampleBufferWithPVImageBuffer:timestamp:frameDuration:error:", a3, &v7, &v6, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sampleBufferWithPVImageBuffer:(id)a3 timestamp:(id *)a4 frameDuration:(id *)a5 error:(id *)a6
{
  id v11;
  const void *v12;
  id *v13;
  void *v14;
  void *v15;
  _OWORD v17[4];
  uint64_t v18;
  __int128 v19;
  _BYTE v20[32];
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  if (!v11)
  {
    if (!a6)
      goto LABEL_9;
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = CFSTR("Image must not be nil.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.provideo.PVFrameSet"), 1, v15);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
    a6 = 0;
    goto LABEL_9;
  }
  *(_QWORD *)v20 = a5->var3;
  v19 = *(_OWORD *)&a5->var0;
  *(_OWORD *)&v20[8] = *(_OWORD *)&a4->var0;
  *(_QWORD *)&v20[24] = a4->var3;
  v17[0] = v19;
  v17[1] = *(_OWORD *)v20;
  v21 = *(_OWORD *)&v20[8];
  v22 = *(_QWORD *)&v20[24];
  v18 = *(_QWORD *)&v20[24];
  v17[2] = *(_OWORD *)&v20[16];
  v17[3] = *(_OWORD *)&v20[8];
  v12 = (const void *)objc_msgSend(a1, "createCMSampleBufferForPVImageBuffer:timingInfo:error:", v11, v17, a6);
  if (!v12)
    goto LABEL_8;
  a6 = -[PVCMSampleBuffer initWithSampleBuffer:error:]([PVCMSampleBuffer alloc], "initWithSampleBuffer:error:", v12, a6);
  CFRelease(v12);
  if (a6)
  {
    objc_storeStrong(a6 + 2, a3);
    v13 = a6;
  }

LABEL_9:
  return a6;
}

- (PVCMSampleBuffer)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  return -[PVCMSampleBuffer initWithSampleBuffer:error:](self, "initWithSampleBuffer:error:", a3, 0);
}

- (PVCMSampleBuffer)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  PVCMSampleBuffer *v5;
  void *backingPVImageBuffer;
  void *v8;
  objc_super v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {

    if (!a4)
      return 0;
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2D50];
    v12[0] = CFSTR("Sample buffer must not be nil.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    backingPVImageBuffer = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.provideo.PVFrameSet"), 2, backingPVImageBuffer);
    v5 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v10.receiver = self;
  v10.super_class = (Class)PVCMSampleBuffer;
  v5 = -[PVCMSampleBuffer init](&v10, sel_init, a3, a4);
  if (v5)
  {
    CFRetain(a3);
    backingPVImageBuffer = v5->_backingPVImageBuffer;
    v5->_sampleBufferRef = a3;
    v5->_backingPVImageBuffer = 0;
LABEL_6:

  }
  return v5;
}

- (void)dealloc
{
  PVImageBuffer *backingPVImageBuffer;
  objc_super v4;

  CFRelease(self->_sampleBufferRef);
  backingPVImageBuffer = self->_backingPVImageBuffer;
  self->_backingPVImageBuffer = 0;

  v4.receiver = self;
  v4.super_class = (Class)PVCMSampleBuffer;
  -[PVCMSampleBuffer dealloc](&v4, sel_dealloc);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMSampleBufferGetPresentationTimeStamp((CMTime *)retstr, self->_sampleBufferRef);
}

- (opaqueCMSampleBuffer)sampleBufferRef
{
  return self->_sampleBufferRef;
}

- (PVImageBuffer)backingPVImageBuffer
{
  return self->_backingPVImageBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingPVImageBuffer, 0);
}

@end
