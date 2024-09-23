@implementation PXGNamedImageTextureProvider

- (void)setBundle:(id)a3
{
  objc_storeStrong((id *)&self->_bundle, a3);
}

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  _PXGSpriteIndexRange v10;
  unsigned int length;
  id v13;
  id v14;
  NSUInteger v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  NSUInteger v35;
  NSUInteger v36;
  NSUInteger v37;
  NSUInteger v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned int v44;
  PXGNamedImageTextureProvider *val;
  _QWORD block[4];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51[3];
  int v52;
  char v53;
  id location;
  objc_super v55;
  _NSRange result;

  v10 = a3;
  length = a3.length;
  v13 = a7;
  v55.receiver = self;
  v55.super_class = (Class)PXGNamedImageTextureProvider;
  v14 = -[PXGTextureProvider requestTexturesForSpritesInRange:geometries:styles:infos:inLayout:](&v55, sel_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout_, v10, a4, a5, a6, v13);
  v37 = v15;
  v38 = (NSUInteger)v14;
  objc_msgSend(v13, "contentSource");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  val = self;
  -[PXGNamedImageTextureProvider bundle](self, "bundle");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v13;
  objc_msgSend(v13, "displayScale");
  if (length)
  {
    v17 = v16;
    v18 = v38;
    do
    {
      v44 = length;
      objc_msgSend(v40, "imageConfigurationAtIndex:inLayout:", v10, v41);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "imageConfiguration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)objc_msgSend(v41, "userInterfaceDirection");
      objc_msgSend(v19, "imageName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v19, "isSystemImage");
      objc_msgSend(v19, "tintColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGTextureProvider viewEnvironment](val, "viewEnvironment");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "traitCollection");
      v25 = objc_claimAutoreleasedReturnValue();

      v43 = (void *)v25;
      objc_msgSend(v23, "resolvedColorWithTraitCollection:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = v39;
      objc_msgSend(v19, "bundle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_msgSend(v19, "bundle");
        v29 = objc_claimAutoreleasedReturnValue();

        v27 = (id)v29;
      }
      objc_initWeak(&location, val);
      -[PXGTextureProvider requestQueue](val, "requestQueue");
      v30 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __98__PXGNamedImageTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke;
      block[3] = &unk_1E513F610;
      objc_copyWeak(v51, &location);
      v47 = v21;
      v48 = v27;
      v53 = v22;
      v49 = v26;
      v50 = v20;
      v51[1] = v42;
      v51[2] = v17;
      v52 = v18;
      v31 = v20;
      v32 = v26;
      v33 = v27;
      v34 = v21;
      dispatch_async(v30, block);

      objc_destroyWeak(v51);
      objc_destroyWeak(&location);

      ++v18;
      v10 = (_PXGSpriteIndexRange)(v10.location + 1);
      length = v44 - 1;
    }
    while (v44 != 1);
  }

  v36 = v37;
  v35 = v38;
  result.length = v36;
  result.location = v35;
  return result;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

void __98__PXGNamedImageTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  LODWORD(v2) = *(_DWORD *)(a1 + 88);
  objc_msgSend(WeakRetained, "_requestTextureForImageWithName:inBundle:isSystemImage:tintColor:imageConfiguration:userInterfaceDirection:screenScale:requestID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 92), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(double *)(a1 + 80), v2);

}

- (void)_requestTextureForImageWithName:(id)a3 inBundle:(id)a4 isSystemImage:(BOOL)a5 tintColor:(id)a6 imageConfiguration:(id)a7 userInterfaceDirection:(unint64_t)a8 screenScale:(double)a9 requestID:(int)a10
{
  _BOOL8 v13;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v34[4];
  id v35[2];
  int v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  PXGNamedImageTextureProvider *v43;
  id v44[4];
  BOOL v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id location[2];

  v13 = a5;
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  objc_initWeak(location, self);
  v20 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v20, "initWithObjects:", v16, v21, v22, 0);

  if (v18)
  {
    v48 = 0;
    v49 = 0;
    v46 = 0;
    v47 = 0;
    if (objc_msgSend(v18, "getRed:green:blue:alpha:", &v49, &v48, &v47, &v46))
    {
      v24 = objc_alloc(MEMORY[0x1E0CB3940]);
      v25 = (void *)objc_msgSend(v24, "initWithFormat:", CFSTR("%.2f-%.2f-%.2f-%.2f"), v49, v48, v47, v46);
      objc_msgSend(v23, "addObject:", v25);

    }
  }
  if (v19)
    objc_msgSend(v23, "addObject:", v19);
  v26 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B5CD8), "initWithObjects:", v23);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __161__PXGNamedImageTextureProvider__requestTextureForImageWithName_inBundle_isSystemImage_tintColor_imageConfiguration_userInterfaceDirection_screenScale_requestID___block_invoke;
  v37[3] = &unk_1E513F638;
  v27 = v16;
  v38 = v27;
  v28 = v17;
  v39 = v28;
  v45 = v13;
  v29 = v18;
  v40 = v29;
  v30 = v19;
  v41 = v30;
  v44[1] = *(id *)&a9;
  v44[2] = (id)a8;
  objc_copyWeak(v44, location);
  v31 = v26;
  v44[3] = (id)a2;
  v42 = v31;
  v43 = self;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __161__PXGNamedImageTextureProvider__requestTextureForImageWithName_inBundle_isSystemImage_tintColor_imageConfiguration_userInterfaceDirection_screenScale_requestID___block_invoke_14;
  v34[3] = &unk_1E513F660;
  v35[1] = (id)a8;
  objc_copyWeak(v35, location);
  v36 = a10;
  -[PXGCGImageTextureProvider requestCGImageAndAdditionalInfoWithCacheKey:imageProvider:resultHandler:](self, "requestCGImageAndAdditionalInfoWithCacheKey:imageProvider:resultHandler:", v31, v37, v34);
  objc_destroyWeak(v35);

  objc_destroyWeak(v44);
  objc_destroyWeak(location);

}

CGImageRef __161__PXGNamedImageTextureProvider__requestTextureForImageWithName_inBundle_isSystemImage_tintColor_imageConfiguration_userInterfaceDirection_screenScale_requestID___block_invoke(uint64_t a1)
{
  CGImage *v2;
  CGImageRef v3;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t v12[7];
  char v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v2 = PXGCGImageForImageNamedInBundle(*(void **)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 112), *(void **)(a1 + 48), *(void **)(a1 + 56), &v13);
  v3 = CGImageRetain(v2);
  if (*(_QWORD *)(a1 + 96) == 1 && v13 != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    v14 = CFSTR("PXGNamedImageTextureProviderImageOrientationKey");
    v15[0] = &unk_1E53EF240;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "cacheAdditionalInfo:withKey:", v6, *(_QWORD *)(a1 + 64));

  }
  if (!v3)
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "result shouldn't be nil", v12, 2u);
    }

    v8 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_imageFromSolidColor:", v9);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v3 = CGImageRetain((CGImageRef)objc_msgSend(v10, "CGImage"));

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
}

void __161__PXGNamedImageTextureProvider__requestTextureForImageWithName_inBundle_isSystemImage_tintColor_imageConfiguration_userInterfaceDirection_screenScale_requestID___block_invoke_14(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  __int128 v6;
  id WeakRetained;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  char v11;
  __int16 v12;
  char v13;
  int v14;
  char v15;
  _BYTE v16[7];

  if (*(_QWORD *)(a1 + 40) == 1)
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PXGNamedImageTextureProviderImageOrientationKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unsignedIntegerValue");

  }
  v13 = 0;
  v12 = 0;
  memset(v16, 0, sizeof(v16));
  PXGSpriteTextureInfoOrientationFromCGOrientation();
  v9 = v6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = *(unsigned int *)(a1 + 48);
  v10 = v9;
  v11 = 0;
  v14 = 1065353216;
  v15 = 0;
  objc_msgSend(WeakRetained, "provideCGImage:options:forRequestID:", a2, &v10, v8);

}

@end
