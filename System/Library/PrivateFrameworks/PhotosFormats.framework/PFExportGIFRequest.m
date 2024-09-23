@implementation PFExportGIFRequest

- (PFExportGIFRequest)initWithVideoURL:(id)a3
{
  id v4;
  PFExportGIFRequest *v5;
  uint64_t v6;
  NSURL *videoURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PFExportGIFRequest;
  v5 = -[PFExportGIFRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    videoURL = v5->_videoURL;
    v5->_videoURL = (NSURL *)v6;

    *(_WORD *)&v5->_shouldDither = 1;
    *(_OWORD *)&v5->_ditherDepth = xmmword_1A17B6C40;
    v5->_maximumFrameSize = 640;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithVideoURL:", self->_videoURL);
  *((_BYTE *)result + 8) = self->_shouldDither;
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_ditherDepth;
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_maximumFrameRate;
  *((_QWORD *)result + 4) = self->_maximumFrameSize;
  *((_BYTE *)result + 9) = self->_synchronous;
  return result;
}

- (void)_ensureValidInputs
{
  double ditherDepth;
  double v3;
  unint64_t maximumFrameSize;

  ditherDepth = self->_ditherDepth;
  if (ditherDepth < 0.0)
    ditherDepth = 0.0;
  v3 = fmin(self->_maximumFrameRate, 100.0);
  if (v3 <= 0.0)
    v3 = 30.0;
  self->_ditherDepth = ditherDepth;
  self->_maximumFrameRate = v3;
  maximumFrameSize = self->_maximumFrameSize;
  if (maximumFrameSize <= 1)
    maximumFrameSize = 1;
  self->_maximumFrameSize = maximumFrameSize;
}

- (BOOL)shouldDither
{
  return self->_shouldDither;
}

- (void)setShouldDither:(BOOL)a3
{
  self->_shouldDither = a3;
}

- (double)ditherDepth
{
  return self->_ditherDepth;
}

- (void)setDitherDepth:(double)a3
{
  self->_ditherDepth = a3;
}

- (double)maximumFrameRate
{
  return self->_maximumFrameRate;
}

- (void)setMaximumFrameRate:(double)a3
{
  self->_maximumFrameRate = a3;
}

- (unint64_t)maximumFrameSize
{
  return self->_maximumFrameSize;
}

- (void)setMaximumFrameSize:(unint64_t)a3
{
  self->_maximumFrameSize = a3;
}

- (BOOL)isSynchronous
{
  return self->_synchronous;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void)setVideoURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoURL, 0);
}

+ (OS_dispatch_queue)_exportQueue
{
  if (_exportQueue_onceToken != -1)
    dispatch_once(&_exportQueue_onceToken, &__block_literal_global_991);
  return (OS_dispatch_queue *)(id)_exportQueue__sharedExportQueue;
}

+ (id)runExport:(id)a3 toURL:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;

  v8 = (void *)MEMORY[0x1E0CB38A8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "discreteProgressWithTotalUnitCount:", 100);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __49__PFExportGIFRequest_runExport_toURL_completion___block_invoke;
  v17[3] = &unk_1E45A1C18;
  v13 = v12;
  v18 = v13;
  v14 = (void *)MEMORY[0x1A1B0CFA4](v17);
  objc_msgSend(a1, "runExport:toURL:progress:completion:", v11, v10, v14, v9);

  v15 = v13;
  return v15;
}

+ (void)runExport:(id)a3 toURL:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, uint64_t, id);
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  void (**v21)(id, uint64_t, id);
  id v22;
  id v23;

  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, uint64_t, id))a6;
  v13 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v13, "_ensureValidInputs");
  if (objc_msgSend(v13, "isSynchronous"))
  {
    v23 = 0;
    v14 = objc_msgSend(a1, "_exportGIFToURL:request:progress:error:", v10, v13, v11, &v23);
    v15 = v23;
    v12[2](v12, v14, v15);
  }
  else
  {
    objc_msgSend(a1, "_exportQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __58__PFExportGIFRequest_runExport_toURL_progress_completion___block_invoke;
    v17[3] = &unk_1E45A1C40;
    v22 = a1;
    v18 = v10;
    v19 = v13;
    v20 = v11;
    v21 = v12;
    dispatch_async(v16, v17);

    v15 = v18;
  }

}

+ (opaqueCMSampleBuffer)_copyNextSampleBuffer:(id)a3 reader:(id)a4 time:(id *)a5 didReachEnd:(BOOL *)a6 error:(id *)a7
{
  id v11;
  uint64_t v12;
  opaqueCMSampleBuffer *v13;
  opaqueCMSampleBuffer *v14;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  CMTime v22;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = MEMORY[0x1E0CA2E18];
  value = *MEMORY[0x1E0CA2E18];
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  v13 = (opaqueCMSampleBuffer *)objc_msgSend(a3, "copyNextSampleBuffer");
  if (v13)
  {
    v14 = v13;
    CMSampleBufferGetOutputPresentationTimeStamp(&v22, v13);
    value = v22.value;
    flags = v22.flags;
    timescale = v22.timescale;
    epoch = v22.epoch;
    if ((v22.flags & 1) != 0)
    {
      v19 = 0;
      v18 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v11, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _PFExportGIFRequestError(1, v17, CFSTR("Encountered invalid sample buffer time"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    CFRelease(v14);
  }
  else
  {
    flags = *(_DWORD *)(v12 + 12);
    epoch = *(_QWORD *)(v12 + 16);
    if (objc_msgSend(v11, "status") == 2)
    {
      v18 = 0;
      v14 = 0;
      v19 = 1;
      goto LABEL_9;
    }
    objc_msgSend(v11, "error");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _PFExportGIFRequestError(1, v20, CFSTR("Failed to read a video sample buffer"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v19 = 0;
  v14 = 0;
LABEL_9:
  if (a5)
  {
    a5->var0 = value;
    a5->var1 = timescale;
    a5->var2 = flags;
    a5->var3 = epoch;
  }
  if (a6)
    *a6 = v19;
  if (a7)
    *a7 = objc_retainAutorelease(v18);

  return v14;
}

+ (CGImage)_createProcessedGIFImage:(opaqueCMSampleBuffer *)a3 options:(id)a4 transform:(CGAffineTransform *)a5 error:(id *)a6
{
  id v9;
  CVImageBufferRef ImageBuffer;
  CVImageBufferRef v11;
  void *v12;
  void *v13;
  __int128 v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  CGImage *v23;
  double v24;
  id v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  double v34;
  double v35;
  id v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  CGColorSpace *v43;
  void *v45;
  _QWORD v46[2];
  _QWORD v47[2];
  uint64_t v48;
  uint64_t v49;
  _OWORD v50[3];
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (ImageBuffer)
  {
    v11 = ImageBuffer;
    v12 = (void *)MEMORY[0x1A1B0CDDC]();
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_OWORD *)&a5->c;
    v50[0] = *(_OWORD *)&a5->a;
    v50[1] = v14;
    v50[2] = *(_OWORD *)&a5->tx;
    objc_msgSend(v13, "imageByApplyingTransform:", v50);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "extent");
    v17 = v16;
    v19 = v18;
    v20 = objc_msgSend(v15, "colorSpace");
    v21 = v20;
    if (v20)
    {
      v48 = *MEMORY[0x1E0C9DFC0];
      v49 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
    v24 = (double)(unint64_t)objc_msgSend(v9, "maximumFrameSize");
    v25 = v15;
    v26 = v25;
    if (v17 <= v19)
      v27 = v19;
    else
      v27 = v17;
    v28 = v25;
    if (v24 / v27 < 1.0)
    {
      v46[0] = CFSTR("inputImage");
      v46[1] = CFSTR("inputScale");
      v47[0] = v25;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v47[1] = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:withInputParameters:", CFSTR("CILanczosScaleTransform"), v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "outputImage");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v32 = v28;
    v33 = v32;
    if (objc_msgSend(v9, "shouldDither"))
    {
      objc_msgSend(v9, "ditherDepth");
      v35 = v34;
      v36 = v32;
      v37 = exp2(-v35);
      v33 = v36;
      if (v37 > 0.0009765625)
      {
        v45 = v12;
        v38 = v36;
        if (v21)
        {
          objc_msgSend(v36, "imageByColorMatchingWorkingSpaceToColorSpace:", v21);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v51[0] = *MEMORY[0x1E0C9E200];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v50[0] = v39;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v51, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "imageByApplyingFilter:withInputParameters:", CFSTR("CIDither"), v40);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v33, "imageByColorMatchingColorSpaceToWorkingSpace:", v21);
          v41 = objc_claimAutoreleasedReturnValue();

          v33 = (void *)v41;
        }
        v12 = v45;
      }

    }
    objc_msgSend(MEMORY[0x1E0C9DD90], "contextWithOptions:", v22);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    objc_msgSend(v33, "extent");
    v23 = (CGImage *)objc_msgSend(v42, "createCGImage:fromRect:format:colorSpace:", v33, *MEMORY[0x1E0C9E070], v43);
    CGColorSpaceRelease(v43);

    objc_autoreleasePoolPop(v12);
  }
  else if (a6)
  {
    _PFExportGIFRequestError(1, 0, CFSTR("Unable to get CVPixelBuffer from sample buffer"));
    v23 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (BOOL)_exportGIFToURL:(id)a3 request:(id)a4 progress:(id)a5 error:(id *)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  double Seconds;
  double v18;
  double v19;
  void *v20;
  const __CFDictionary *v21;
  __CFString *v22;
  void *v23;
  double v24;
  void *v25;
  CGImage *v26;
  _BOOL4 v27;
  void *v28;
  const void *v29;
  id v30;
  void *v31;
  unsigned int (*v32)(_QWORD *, CGImage *, CGAffineTransform *, _QWORD);
  double v33;
  Float64 v34;
  int v35;
  uint64_t v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  BOOL v41;
  void *v43;
  void (*v44)(_QWORD *, CGImage *, CGAffineTransform *, uint64_t);
  uint64_t v45;
  _QWORD *v46;
  double v47;
  __int128 v48;
  CGImageDestinationRef idst;
  size_t v50;
  CGFloat v51;
  CMTimeFlags v53;
  void (**v54)(id, _BYTE *, double);
  const __CFURL *url;
  void *v56;
  void *v58;
  void *v59;
  void *v60;
  CGAffineTransform v61;
  id v62;
  char v63;
  id v64;
  char v65;
  __int128 v66;
  CGFloat v67;
  _QWORD v68[8];
  CMTime time;
  void *v70;
  __int128 v71;
  double v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  CGAffineTransform v78;
  CGAffineTransform v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  CGFloat v89;
  CMTimeScale v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  url = (const __CFURL *)a3;
  v8 = a4;
  v54 = (void (**)(id, _BYTE *, double))a5;
  v9 = (void *)MEMORY[0x1E0C8AF90];
  v56 = v8;
  objc_msgSend(v8, "videoURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetWithURL:", v10);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  +[PFMediaUtilities tracksWithMediaType:forAsset:](PFMediaUtilities, "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v60, "count") >= 2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LOWORD(time.value) = 0;
    _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "PFExportGIFRequest encountered multiple video tracks. Only one will be used", (uint8_t *)&time, 2u);
  }
  objc_msgSend(v60, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "timeRange");
    v89 = *((double *)&v81 + 1);
    v53 = DWORD1(v82);
    v90 = v82;
    v51 = *((double *)&v82 + 1);
    memset(&v79, 0, sizeof(v79));
    objc_msgSend(v12, "preferredTransform");
  }
  else
  {
    v51 = 0.0;
    v53 = 0;
    v81 = 0u;
    v82 = 0u;
    v89 = 0.0;
    v90 = 0;
    v80 = 0u;
    memset(&v79, 0, sizeof(v79));
    memset(&v78, 0, sizeof(v78));
  }
  CGAffineTransformInvert(&v79, &v78);
  if (!v12 || (v53 & 0x1D) != 1)
  {
    _PFExportGIFRequestError(1, 0, CFSTR("Failed to get a valid video track with numeric duration"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
LABEL_43:
    v58 = 0;
LABEL_44:
    v41 = 0;
    goto LABEL_45;
  }
  v13 = objc_alloc(MEMORY[0x1E0C8AFD0]);
  v77 = 0;
  v14 = (void *)objc_msgSend(v13, "initWithAsset:error:", v59, &v77);
  v15 = v77;
  v16 = v15;
  if (!v14 || v15)
  {
    _PFExportGIFRequestError(1, v15, CFSTR("Failed to create AVAssetReader"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_43;
  }
  *(CGFloat *)&time.value = v89;
  time.timescale = v90;
  time.flags = v53;
  *(CGFloat *)&time.epoch = v51;
  Seconds = CMTimeGetSeconds(&time);
  objc_msgSend(v8, "maximumFrameRate");
  v19 = v18;
  v87 = *MEMORY[0x1E0CBCCE0];
  v85 = *MEMORY[0x1E0CBCCF0];
  v86 = &unk_1E45CA268;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
  v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)*MEMORY[0x1E0CEC4F8], "identifier");
  v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v50 = vcvtpd_u64_f64(Seconds * v19);
  idst = CGImageDestinationCreateWithURL(url, v22, v50, v21);

  if (!idst)
  {
    _PFExportGIFRequestError(2, 0, CFSTR("Failed to create image destination"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_43;
  }

  v83 = *MEMORY[0x1E0CA9040];
  v84 = &unk_1E45CA280;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B000]), "initWithTrack:outputSettings:", v12, v23);
  if (objc_msgSend(v14, "canAddOutput:", v58))
    objc_msgSend(v14, "addOutput:", v58);
  if ((objc_msgSend(v14, "startReading") & 1) == 0)
  {
    objc_msgSend(v14, "error");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    _PFExportGIFRequestError(1, v43, CFSTR("Failed to start reading video"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_57:
    CFRelease(idst);
    goto LABEL_44;
  }

  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v76 = 0;
  time.value = 0;
  *(_QWORD *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  v70 = &unk_1A17D2676;
  v48 = *MEMORY[0x1E0CA2E68];
  v71 = *MEMORY[0x1E0CA2E68];
  v47 = *(double *)(MEMORY[0x1E0CA2E68] + 16);
  v72 = v47;
  objc_msgSend(v8, "maximumFrameRate");
  v68[1] = 3221225472;
  v68[0] = MEMORY[0x1E0C809B0];
  v68[2] = __61__PFExportGIFRequest__exportGIFToURL_request_progress_error___block_invoke;
  v68[3] = &unk_1E45A1C68;
  *(double *)&v68[6] = 1.0 / v24;
  v68[7] = idst;
  v68[4] = &time;
  v68[5] = &v73;
  v46 = (_QWORD *)MEMORY[0x1A1B0CFA4](v68);
  v25 = 0;
  v26 = 0;
  LOBYTE(v27) = 1;
  while (v27)
  {
    if (objc_msgSend(v14, "status") != 1 || v74[3] >= v50)
    {
      v27 = 1;
LABEL_50:
      if (!v26)
        goto LABEL_55;
      if (v27)
      {
        v44 = (void (*)(_QWORD *, CGImage *, CGAffineTransform *, uint64_t))v46[2];
        v61.a = v89;
        *(_QWORD *)&v61.b = __PAIR64__(v53, v90);
        v61.c = v51;
        v44(v46, v26, &v61, 1);
        v27 = 1;
      }
      goto LABEL_54;
    }
    v28 = (void *)MEMORY[0x1A1B0CDDC]();
    v66 = v48;
    v67 = v47;
    v65 = 0;
    v64 = 0;
    v29 = (const void *)objc_msgSend(a1, "_copyNextSampleBuffer:reader:time:didReachEnd:error:", v58, v14, &v66, &v65, &v64);
    v30 = v64;
    v31 = v30;
    if (v29)
    {
      v63 = 0;
      if (!v26)
      {
        v36 = *(_QWORD *)&time.timescale;
        *(_OWORD *)(*(_QWORD *)&time.timescale + 32) = v66;
        *(CGFloat *)(v36 + 48) = v67;
        goto LABEL_27;
      }
      v32 = (unsigned int (*)(_QWORD *, CGImage *, CGAffineTransform *, _QWORD))v46[2];
      *(_OWORD *)&v61.a = v66;
      v61.c = v67;
      if (v32(v46, v26, &v61, 0))
      {
        CGImageRelease(v26);
        if (v54)
        {
          *(_OWORD *)&v61.a = *(_OWORD *)(*(_QWORD *)&time.timescale + 32);
          v61.c = *(CGFloat *)(*(_QWORD *)&time.timescale + 48);
          v33 = CMTimeGetSeconds((CMTime *)&v61);
          v61.a = v89;
          *(_QWORD *)&v61.b = __PAIR64__(v53, v90);
          v61.c = v51;
          v34 = CMTimeGetSeconds((CMTime *)&v61);
          v54[2](v54, &v63, v33 / v34);
        }
LABEL_27:
        if (v63)
        {
          v26 = 0;
          goto LABEL_29;
        }
        v62 = 0;
        v61 = v79;
        v26 = (CGImage *)objc_msgSend(a1, "_createProcessedGIFImage:options:transform:error:", v29, v56, &v61, &v62);
        v37 = v62;
        v38 = v37;
        v27 = v26 != 0;
        if (!v26)
        {
          v39 = v37;

          v25 = v39;
        }

      }
      else
      {
LABEL_29:
        v27 = 1;
      }
      CFRelease(v29);
      if (v63)
      {
        objc_msgSend(v14, "cancelReading");
        _PFExportGIFRequestError(3, 0, CFSTR("Cancelled"));
        v40 = (id)objc_claimAutoreleasedReturnValue();

LABEL_37:
        v27 = 0;
        v35 = 3;
        v25 = v40;
        goto LABEL_38;
      }
      v35 = 0;
      goto LABEL_38;
    }
    if (!v65)
    {
      v40 = v30;

      goto LABEL_37;
    }
    v35 = 3;
    v27 = 1;
LABEL_38:

    objc_autoreleasePoolPop(v28);
    if (v35)
      goto LABEL_50;
  }
  v27 = 0;
  if (!v26)
    goto LABEL_55;
LABEL_54:
  CGImageRelease(v26);
LABEL_55:

  _Block_object_dispose(&time, 8);
  _Block_object_dispose(&v73, 8);
  if (!v27)
    goto LABEL_57;
  v41 = CGImageDestinationFinalize(idst);
  _PFExportGIFRequestError(2, 0, CFSTR("Failed to finalize image destination"));
  v45 = objc_claimAutoreleasedReturnValue();

  CFRelease(idst);
  v25 = (void *)v45;
LABEL_45:
  if (a6)
    *a6 = objc_retainAutorelease(v25);

  return v41;
}

uint64_t __61__PFExportGIFRequest__exportGIFToURL_request_progress_error___block_invoke(uint64_t a1, CGImage *a2, CMTime *a3, int a4)
{
  uint64_t v4;
  uint64_t v8;
  double Seconds;
  void *v10;
  void *v11;
  const __CFDictionary *v12;
  uint64_t v13;
  __int128 v14;
  CMTime v16;
  CMTime lhs;
  CMTime v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  LODWORD(v4) = a4;
  v22[1] = *MEMORY[0x1E0C80C00];
  memset(&v18, 0, sizeof(v18));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  lhs = *a3;
  v16 = *(CMTime *)(v8 + 32);
  CMTimeSubtract(&v18, &lhs, &v16);
  lhs = v18;
  Seconds = CMTimeGetSeconds(&lhs);
  if (Seconds + 0.001 >= *(double *)(a1 + 48))
    v4 = 1;
  else
    v4 = v4;
  if ((_DWORD)v4 == 1)
  {
    v21 = *MEMORY[0x1E0CBCCE0];
    v19 = *MEMORY[0x1E0CBCCF8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", ceil(Seconds * 100.0) / 100.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    CGImageDestinationAddImage(*(CGImageDestinationRef *)(a1 + 56), a2, v12);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v14 = *(_OWORD *)&a3->value;
    *(_QWORD *)(v13 + 48) = a3->epoch;
    *(_OWORD *)(v13 + 32) = v14;

  }
  return v4;
}

void __58__PFExportGIFRequest_runExport_toURL_progress_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  v2 = (void *)a1[8];
  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v7 = 0;
  objc_msgSend(v2, "_exportGIFToURL:request:progress:error:", v3, v4, v5, &v7);
  v6 = v7;
  (*(void (**)(void))(a1[7] + 16))();

}

uint64_t __49__PFExportGIFRequest_runExport_toURL_completion___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", vcvtmd_s64_f64(a3 * 100.0));
  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  *a2 = result;
  return result;
}

void __34__PFExportGIFRequest__exportQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.PFExportGIFRequest", v2);
  v1 = (void *)_exportQueue__sharedExportQueue;
  _exportQueue__sharedExportQueue = (uint64_t)v0;

}

@end
