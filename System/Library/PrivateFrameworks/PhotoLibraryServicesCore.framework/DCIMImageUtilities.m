@implementation DCIMImageUtilities

+ (BOOL)generateThumbnailsFromData:(id)a3 inputSize:(CGSize)a4 preCropLargeThumbnailSize:(CGSize)a5 postCropLargeThumbnailSize:(CGSize)a6 preCropSmallThumbnailSize:(CGSize)a7 postCropSmallThumbnailSize:(CGSize)a8 outSmallThumbnailImageRef:(CGImage *)a9 outLargeThumbnailImageRef:(CGImage *)a10 outLargeThumbnailJPEGData:(id *)a11
{
  CGFloat height;
  CGFloat width;
  double v14;
  double v15;
  double v16;
  double v17;
  id v19;
  unint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  int CVPixelBufferFromImageData;
  int CGImageFromImageData;
  NSObject *v29;
  void *v30;
  const char *v31;
  BOOL v32;
  BOOL v33;
  _DWORD buf[3];
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  height = a8.height;
  width = a8.width;
  v14 = a7.height;
  v15 = a7.width;
  v16 = a5.height;
  v17 = a5.width;
  v40 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v20 = *(_QWORD *)&height | (unint64_t)a9;
  if (v17 >= v16)
    v21 = v17;
  else
    v21 = v16;
  if (v15 >= v14)
    v22 = v15;
  else
    v22 = v14;
  if (!v20)
    v21 = v22;
  v23 = (int)v21;
  v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v25 = *MEMORY[0x1E0C9AE50];
  objc_msgSend(v24, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0D09548]);
  objc_msgSend(v24, "setObject:forKey:", v25, *MEMORY[0x1E0D09558]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKey:", v26, *MEMORY[0x1E0D09568]);

  if (v20)
  {
    CVPixelBufferFromImageData = PFFigCreateCVPixelBufferFromImageData();
    if (!CVPixelBufferFromImageData)
    {
      CGImageFromImageData = 0;
      goto LABEL_18;
    }
    CGImageFromImageData = CVPixelBufferFromImageData;
    PLBackendGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    NSStringFromSelector(a2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    buf[0] = 138412802;
    *(_QWORD *)&buf[1] = v30;
    v36 = 2048;
    v37 = CGImageFromImageData;
    v38 = 2048;
    v39 = objc_msgSend(v19, "length");
    v31 = "PFFigCreateCVPixelBufferFromImageData %@ returned %ld from %lu";
    goto LABEL_16;
  }
  CGImageFromImageData = PFFigCreateCGImageFromImageData();
  if (CGImageFromImageData)
  {
    PLBackendGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
LABEL_17:

      goto LABEL_18;
    }
    NSStringFromSelector(a2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    buf[0] = 138412802;
    *(_QWORD *)&buf[1] = v30;
    v36 = 2048;
    v37 = CGImageFromImageData;
    v38 = 2048;
    v39 = objc_msgSend(v19, "length");
    v31 = "PFFigCreateCGImageFromImageData %@ returned %ld from %lu";
LABEL_16:
    _os_log_impl(&dword_199DF7000, v29, OS_LOG_TYPE_DEFAULT, v31, (uint8_t *)buf, 0x20u);

    goto LABEL_17;
  }
LABEL_18:
  if (width != 0.0 && !CGImageFromImageData)
    **(_QWORD **)&width = 0;
  if (height != 0.0 && !CGImageFromImageData)
    **(_QWORD **)&height = 0;
  v32 = *(_QWORD *)&height != 0;
  if (CGImageFromImageData)
    v33 = 0;
  else
    v33 = *(_QWORD *)&width == 0;

  return v33 && !v32;
}

@end
