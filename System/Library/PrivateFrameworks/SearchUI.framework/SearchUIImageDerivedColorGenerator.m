@implementation SearchUIImageDerivedColorGenerator

+ (id)colorsForImageRef:(CGImage *)a3
{
  size_t Height;
  double v5;
  uint64_t v6;
  char *v7;
  CGColorSpace *DeviceRGB;
  CGContext *v9;
  unint64_t v10;
  _BYTE *v11;
  unint64_t v12;
  char *v13;
  void *v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  CGRect v24;

  CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  if ((double)Height <= 160.0)
    v5 = (double)Height;
  else
    v5 = 160.0;
  v6 = (unint64_t)v5;
  v7 = (char *)malloc_type_malloc(vcvtd_n_u64_f64(v5, 2uLL), 0x8FBE2ADBuLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v9 = CGBitmapContextCreate(v7, 1uLL, (unint64_t)v5, 8uLL, 4uLL, DeviceRGB, 0x4001u);
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v24.size.width = 1.0;
  v24.size.height = v5;
  CGContextDrawImage(v9, v24, a3);
  CGContextRelease(v9);
  CGColorSpaceRelease(DeviceRGB);
  v10 = 0;
  if ((unint64_t)v5)
  {
    v11 = v7 + 3;
    while (!*(v11 - 3) && !*(v11 - 2) && !*(v11 - 1) || !*v11)
    {
      ++v10;
      v11 += 4;
      if (v6 == v10)
      {
        v10 = (unint64_t)v5;
        break;
      }
    }
    v12 = v6 - 1;
    if (v6 - 1 >= 0)
    {
      v13 = &v7[4 * v6 - 2];
      while (!*(v13 - 2) && !*(v13 - 1) && !*v13 || !v13[1])
      {
        --v6;
        v13 -= 4;
        if (v6 <= 0)
          goto LABEL_19;
      }
      v12 = v6 - 1;
    }
  }
  else
  {
LABEL_19:
    v12 = -1;
  }
  v14 = (void *)objc_opt_new();
  if (v12 > v10)
  {
    v16 = 0.25;
    v15 = (double)(v12 - v10) * 0.25;
    v20 = vcvtpd_u64_f64(v15);
    v21 = &v7[4 * v10 + 3];
    do
    {
      LOBYTE(v15) = *(v21 - 3);
      LOBYTE(v16) = *(v21 - 2);
      LOBYTE(v17) = *(v21 - 1);
      LOBYTE(v18) = *v21;
      objc_msgSend(v14, "addObject:", objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", (double)*(unint64_t *)&v15 / 255.0, (double)v16 / 255.0, (double)v17 / 255.0, (double)v18 / 255.0));
      v10 += v20;
      v21 += 4 * v20;
    }
    while (v10 < v12);
  }
  v22 = &v7[4 * v12];
  LOBYTE(v15) = *v22;
  LOBYTE(v16) = v22[1];
  LOBYTE(v17) = v22[2];
  LOBYTE(v19) = v22[3];
  objc_msgSend(v14, "addObject:", objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", (double)*(unint64_t *)&v15 / 255.0, (double)v16 / 255.0, (double)v17 / 255.0, (double)v19 / 255.0));
  free(v7);
  return v14;
}

+ (void)fetchColorsForImage:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__SearchUIImageDerivedColorGenerator_fetchColorsForImage_withCompletionHandler___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (fetchColorsForImage_withCompletionHandler__onceToken[0] != -1)
    dispatch_once(fetchColorsForImage_withCompletionHandler__onceToken, block);
  v9 = fetchColorsForImage_withCompletionHandler__queue;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __80__SearchUIImageDerivedColorGenerator_fetchColorsForImage_withCompletionHandler___block_invoke_2;
  v12[3] = &unk_1EA1F7688;
  v14 = v7;
  v15 = a1;
  v13 = v6;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, v12);

}

void __80__SearchUIImageDerivedColorGenerator_fetchColorsForImage_withCompletionHandler___block_invoke()
{
  objc_class *v0;
  const char *v1;
  NSObject *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  id v6;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = (const char *)objc_msgSend(v6, "cStringUsingEncoding:", objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_USER_INITIATED, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create(v1, v3);
  v5 = (void *)fetchColorsForImage_withCompletionHandler__queue;
  fetchColorsForImage_withCompletionHandler__queue = (uint64_t)v4;

}

void __80__SearchUIImageDerivedColorGenerator_fetchColorsForImage_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  double v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  CGImage *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  os_signpost_id_t spid;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t v53;
  void *v54;
  uint64_t v55;
  CGAffineTransform v56;
  CGAffineTransform buf;
  id v58;
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[3];

  v61[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "hash");
  SearchUIGeneralLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v53 = v2 - 1;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    LOWORD(buf.a) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DAD39000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "SearchUIImageDerivedColorFetchColors", ", (uint8_t *)&buf, 2u);
  }

  v5 = objc_msgSend(*(id *)(a1 + 32), "ioSurface");
  v55 = a1;
  if (v5)
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithIOSurface:", v5, v2);
  else
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCGImage:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGImage", v2));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extent");
  v8 = v7;
  v10 = v9;
  v11 = objc_alloc(MEMORY[0x1E0CEDF70]);
  v12 = (void *)objc_msgSend(v11, "initWithCIImage:options:", v6, MEMORY[0x1E0C9AA70]);
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setRevision:", 2);
  v61[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  v52 = v12;
  v15 = objc_msgSend(v12, "performRequests:error:", v14, &v58);
  v16 = v58;

  if (v16 || (v15 & 1) == 0)
  {
    SearchUIGeneralLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __80__SearchUIImageDerivedColorGenerator_fetchColorsForImage_withCompletionHandler___block_invoke_2_cold_1((uint64_t)v16, v17);

  }
  v50 = v16;
  v51 = v13;
  objc_msgSend(v13, "results");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = v19;
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", objc_msgSend(v19, "pixelBuffer"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "extent");
  memset(&buf, 0, sizeof(buf));
  CGAffineTransformMakeScale(&buf, v8 / v21, v10 / v22);
  v56 = buf;
  objc_msgSend(v20, "imageByApplyingTransform:", &v56);
  v23 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "colorThresholdFilter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)v23;
  objc_msgSend(v24, "setInputImage:", v23);
  LODWORD(v25) = 0.5;
  objc_msgSend(v24, "setThreshold:", v25);
  objc_msgSend(v24, "outputImage");
  v26 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "maskToAlphaFilter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)v26;
  objc_msgSend(v27, "setInputImage:", v26);
  objc_msgSend(v27, "outputImage");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "sourceOutCompositingFilter");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v6;
  objc_msgSend(v29, "setInputImage:", v6);
  objc_msgSend(v29, "setBackgroundImage:", v28);
  objc_msgSend(v29, "outputImage");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = CFSTR("inputWidth");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = CFSTR("inputHeight");
  v60[0] = v31;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "imageByApplyingFilter:withInputParameters:", CFSTR("CISmartGradient"), v33);
  v34 = (id)objc_claimAutoreleasedReturnValue();

  if (!v34)
    v34 = v30;
  objc_msgSend(v34, "extent");
  v36 = v35;
  v38 = v37;
  v40 = v39;
  objc_msgSend(MEMORY[0x1E0C9DD90], "context");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (CGImage *)objc_msgSend(v41, "createCGImage:fromRect:", v34, v36, v38, 8.0, v40);

  objc_msgSend((id)objc_opt_class(), "colorsForImageRef:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
    CGImageRelease(v42);
  SearchUIGeneralLog();
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
  {
    LOWORD(v56.a) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DAD39000, v45, OS_SIGNPOST_INTERVAL_END, spid, "SearchUIImageDerivedColorFetchColors", ", (uint8_t *)&v56, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(v55 + 40) + 16))();
}

- (void)generateUIColorsIsDark:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  BOOL v14;

  v4 = a3;
  v6 = a4;
  -[SearchUIColorGenerator sfColor](self, "sfColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  objc_msgSend(v8, "contactIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") != 1)
  {

LABEL_5:
    -[SearchUIImageDerivedColorGenerator generateUIColorsForSFImage:isDark:completionHandler:](self, "generateUIColorsForSFImage:isDark:completionHandler:", v8, v4, v6);
    goto LABEL_6;
  }
  +[SearchUIContactCache sharedCache](SearchUIContactCache, "sharedCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__SearchUIImageDerivedColorGenerator_generateUIColorsIsDark_completionHandler___block_invoke;
  v11[3] = &unk_1EA1F76B0;
  v13 = v6;
  v11[4] = self;
  v12 = v8;
  v14 = v4;
  objc_msgSend(v10, "fetchContactsForIdentifiers:completionHandler:", v9, v11);

LABEL_6:
}

void __79__SearchUIImageDerivedColorGenerator_generateUIColorsIsDark_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactImageBackgroundColors");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 32), "generateUIColorsForSFImage:isDark:completionHandler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

- (void)generateUIColorsForSFImage:(id)a3 isDark:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  SearchUIImageDerivedColorGenerator *v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __90__SearchUIImageDerivedColorGenerator_generateUIColorsForSFImage_isDark_completionHandler___block_invoke;
  v12[3] = &unk_1EA1F7700;
  v13 = v8;
  v14 = self;
  v16 = a4;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v12);

}

void __90__SearchUIImageDerivedColorGenerator_generateUIColorsForSFImage_isDark_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  +[SearchUIImage imageWithSFImage:](SearchUIImage, "imageWithSFImage:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setSfColor:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setSearchUIImage:", v2);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v2, "setRequiresImageDataToLoad:", 1);
  if (v2)
  {
    v6 = *(unsigned __int8 *)(a1 + 56);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __90__SearchUIImageDerivedColorGenerator_generateUIColorsForSFImage_isDark_completionHandler___block_invoke_2;
    v8[3] = &unk_1EA1F76D8;
    v7 = *(void **)(a1 + 48);
    v8[4] = *(_QWORD *)(a1 + 40);
    v9 = v7;
    objc_msgSend(v2, "loadImageWithScale:isDarkStyle:completionHandler:", v6, v8, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __90__SearchUIImageDerivedColorGenerator_generateUIColorsForSFImage_isDark_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
    objc_msgSend((id)objc_opt_class(), "fetchColorsForImage:withCompletionHandler:", v3, *(_QWORD *)(a1 + 40));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (SearchUIImage)searchUIImage
{
  return self->_searchUIImage;
}

- (void)setSearchUIImage:(id)a3
{
  objc_storeStrong((id *)&self->_searchUIImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchUIImage, 0);
}

void __80__SearchUIImageDerivedColorGenerator_fetchColorsForImage_withCompletionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DAD39000, a2, OS_LOG_TYPE_ERROR, "Error performing VNGenerateObjectnessBasedSaliencyImageRequest in fetchColorsForImage: %@", (uint8_t *)&v2, 0xCu);
}

@end
