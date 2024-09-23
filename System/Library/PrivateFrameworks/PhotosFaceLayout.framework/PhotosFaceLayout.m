void PFLGeneratePhotosFace(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x24BDE3570]);
  v16[0] = *MEMORY[0x24BDE3738];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addFetchPropertySets:", v9);

  v10 = (void *)MEMORY[0x24BDE3488];
  v15 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchAssetsWithUUIDs:options:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    PFLGeneratePhotosFaceCommon(v13, v6, 0, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", 0x251457DA8, 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v14);

  }
}

void PFLGeneratePhotosFaceCommon(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  PFLJetsamInfoInterval *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  PFLJetsamInfoInterval *v18;
  _QWORD v19[4];
  PFLJetsamInfoInterval *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  pfl_layout_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v26 = v7;
    v27 = 2080;
    v28 = objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation");
    _os_log_impl(&dword_243C29000, v11, OS_LOG_TYPE_DEFAULT, "PFLGeneratePhotosFace: Calculate watch face layers for %@ in %s", buf, 0x16u);
  }

  +[PFLSegmentationCalculator sharedInstance](PFLSegmentationCalculator, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PFLJetsamInfoInterval initWithLabel:]([PFLJetsamInfoInterval alloc], "initWithLabel:", CFSTR("bestSegmentationForAsset (allPositions)"));
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __PFLGeneratePhotosFaceCommon_block_invoke;
  v19[3] = &unk_251457AA8;
  v23 = v7;
  v24 = v10;
  v20 = v13;
  v21 = v8;
  v22 = v9;
  v14 = v7;
  v15 = v9;
  v16 = v8;
  v17 = v10;
  v18 = v13;
  objc_msgSend(v12, "bestSegmentationForAsset:completion:", v14, v19);

}

void PFLGeneratePhotosFaceWithOptions(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __PFLGeneratePhotosFaceWithOptions_block_invoke;
  v9[3] = &unk_251457A80;
  v10 = v7;
  v8 = v7;
  PFLGeneratePhotosFaceCommon(a1, a2, a3, v9);

}

void sub_243C2B274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void __generateWatchLayers_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  uint64_t v7;
  CGImage *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  unint64_t v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  int v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "cropScore");
  if (v6 > *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    objc_msgSend(v5, "cropScore");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v7;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = a3;
  }
  if (objc_msgSend(v5, "usesMask"))
    v8 = *(CGImage **)(a1 + 88);
  else
    v8 = 0;
  v10 = *(void **)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v11 = *(unsigned int *)(a1 + 96);
  v13 = *(void **)(a1 + 48);
  v12 = *(void **)(a1 + 56);
  v14 = *(unsigned __int8 *)(a1 + 100);
  v15 = v5;
  v16 = v12;
  v17 = v13;
  v18 = v9;
  v19 = v10;
  pfl_layout_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v35 = 138412290;
    v36 = v15;
    _os_log_impl(&dword_243C29000, v20, OS_LOG_TYPE_DEFAULT, "PFLGenerateWatchLayout: generating layout %@", (uint8_t *)&v35, 0xCu);
  }

  v21 = objc_msgSend(v15, "timePosition");
  objc_msgSend(v15, "visibleRect");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  objc_msgSend(v15, "timeRect");
  PFLGenerateWatchLayout(v19, v18, v11, v8, v21, v17, v16, v14 != 0, v23, v25, v27, v29, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v34);

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __imageDataForAsset_block_invoke(_QWORD *a1, void *a2, uint64_t a3, int a4, void *a5)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
  v13 = a2;
  v9 = a5;
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a4;
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDE37F8]);
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id pfl_photo_log()
{
  if (pfl_photo_log_onceToken != -1)
    dispatch_once(&pfl_photo_log_onceToken, &__block_literal_global_0);
  return (id)pfl_photo_log___logger;
}

void __pfl_photo_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photosfacelayout", "photo");
  v1 = (void *)pfl_photo_log___logger;
  pfl_photo_log___logger = (uint64_t)v0;

}

id pfl_layout_log()
{
  if (pfl_layout_log_onceToken != -1)
    dispatch_once(&pfl_layout_log_onceToken, &__block_literal_global_3);
  return (id)pfl_layout_log___logger;
}

void __pfl_layout_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photosfacelayout", "layout");
  v1 = (void *)pfl_layout_log___logger;
  pfl_layout_log___logger = (uint64_t)v0;

}

id pfl_jetsam_log()
{
  if (pfl_jetsam_log_onceToken != -1)
    dispatch_once(&pfl_jetsam_log_onceToken, &__block_literal_global_5);
  return (id)pfl_jetsam_log___logger;
}

void __pfl_jetsam_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photosfacelayout", "jetsam");
  v1 = (void *)pfl_jetsam_log___logger;
  pfl_jetsam_log___logger = (uint64_t)v0;

}

void sub_243C2E844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a49, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

uint64_t getImageOrientationFromSource(CGImageSource *a1)
{
  const __CFDictionary *v1;
  uint64_t v2;
  const __CFDictionary *v3;
  const __CFNumber *Value;
  unsigned int valuePtr;

  v1 = CGImageSourceCopyPropertiesAtIndex(a1, 0, 0);
  v2 = 1;
  if (v1)
  {
    v3 = v1;
    Value = (const __CFNumber *)CFDictionaryGetValue(v1, (const void *)*MEMORY[0x24BDD9698]);
    valuePtr = 1;
    if (Value)
    {
      if (CFNumberGetValue(Value, kCFNumberIntType, &valuePtr))
        v2 = valuePtr;
      else
        v2 = 1;
    }
    CFRelease(v3);
  }
  return v2;
}

uint64_t getImageOrientationFromData(const __CFData *a1)
{
  CGImageSource *v1;
  uint64_t ImageOrientationFromSource;

  v1 = CGImageSourceCreateWithData(a1, 0);
  ImageOrientationFromSource = getImageOrientationFromSource(v1);
  CFRelease(v1);
  return ImageOrientationFromSource;
}

uint64_t makePresentationTransform@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  __int128 v5;
  double v6;
  double v7;
  double v8;
  double v9;

  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  switch((int)result)
  {
    case 1:
      *(_QWORD *)a4 = 0x3FF0000000000000;
      *(_QWORD *)(a4 + 8) = 0;
      *(_QWORD *)(a4 + 16) = 0;
      *(_QWORD *)(a4 + 24) = 0x3FF0000000000000;
      *(_QWORD *)(a4 + 32) = 0;
      *(_QWORD *)(a4 + 40) = 0;
      return result;
    case 2:
      v6 = (double)a2;
      *(_QWORD *)a4 = 0xBFF0000000000000;
      *(_QWORD *)(a4 + 8) = 0;
      *(_QWORD *)(a4 + 16) = 0;
      *(_QWORD *)(a4 + 24) = 0x3FF0000000000000;
      goto LABEL_9;
    case 3:
      v7 = (double)a2;
      v8 = (double)a3;
      *(_QWORD *)a4 = 0xBFF0000000000000;
      *(_QWORD *)(a4 + 8) = 0;
      *(_QWORD *)(a4 + 16) = 0;
      *(_QWORD *)(a4 + 24) = 0xBFF0000000000000;
      goto LABEL_11;
    case 4:
      v9 = (double)a3;
      *(_QWORD *)a4 = 0x3FF0000000000000;
      *(_QWORD *)(a4 + 8) = 0;
      *(_QWORD *)(a4 + 16) = 0;
      *(_QWORD *)(a4 + 24) = 0xBFF0000000000000;
      goto LABEL_13;
    case 5:
      __asm { FMOV            V0.2D, #1.0; jumptable 0000000243C2EEF0 case 5 }
      *(_OWORD *)(a4 + 8) = _Q0;
      *(_QWORD *)(a4 + 32) = 0;
      *(_QWORD *)(a4 + 40) = 0;
      *(_QWORD *)(a4 + 24) = 0;
      return result;
    case 6:
      v6 = (double)a3;
      *(_OWORD *)(a4 + 8) = xmmword_243C315A0;
LABEL_9:
      *(double *)(a4 + 32) = v6;
      return result;
    case 7:
      v7 = (double)a3;
      v8 = (double)a2;
      __asm { FMOV            V2.2D, #-1.0 }
      *(_OWORD *)(a4 + 8) = _Q2;
LABEL_11:
      *(double *)(a4 + 32) = v7;
      *(double *)(a4 + 40) = v8;
      break;
    case 8:
      v9 = (double)a2;
      *(_OWORD *)(a4 + 8) = xmmword_243C31590;
      *(_QWORD *)(a4 + 24) = 0;
      *(_QWORD *)(a4 + 32) = 0;
LABEL_13:
      *(double *)(a4 + 40) = v9;
      break;
    default:
      v4 = MEMORY[0x24BDBD8B8];
      v5 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      *(_OWORD *)a4 = *MEMORY[0x24BDBD8B8];
      *(_OWORD *)(a4 + 16) = v5;
      *(_OWORD *)(a4 + 32) = *(_OWORD *)(v4 + 32);
      break;
  }
  return result;
}

double storedSizeForOrientation(uint64_t a1, double a2, double a3)
{
  double result;
  CGAffineTransform v6;
  CGAffineTransform v7;

  memset(&v7, 0, sizeof(v7));
  makePresentationTransform(a1, 0, 0, (uint64_t)&v6);
  CGAffineTransformInvert(&v7, &v6);
  *(_QWORD *)&result = *(_OWORD *)&vabsq_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v7.c, a3), *(float64x2_t *)&v7.a, a2));
  return result;
}

double presentationSizeForOrientation(uint64_t a1, double a2, double a3)
{
  double result;
  float64x2_t v6;
  float64x2_t v7;
  __int128 v8;

  v7 = 0u;
  v8 = 0u;
  v6 = 0u;
  makePresentationTransform(a1, 0, 0, (uint64_t)&v6);
  *(_QWORD *)&result = *(_OWORD *)&vabsq_f64(vmlaq_n_f64(vmulq_n_f64(v7, a3), v6, a2));
  return result;
}

CGFloat uprightCTM@<D0>(CGImage *a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>)
{
  CGFloat Height;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CGFloat result;
  CGAffineTransform v16;
  CGAffineTransform t2;
  CGAffineTransform t1;

  Height = (double)CGImageGetHeight(a1);
  v6 = MEMORY[0x24BDBD8B8];
  v7 = *MEMORY[0x24BDBD8B8];
  v8 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)a3 = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)(a3 + 16) = v8;
  v9 = *(_OWORD *)(v6 + 32);
  *(_OWORD *)(a3 + 32) = v9;
  *(_OWORD *)&t1.a = v7;
  *(_OWORD *)&t1.c = v8;
  *(_OWORD *)&t1.tx = v9;
  t2.b = 0.0;
  t2.c = 0.0;
  t2.a = 1.0;
  *(_OWORD *)&t2.d = xmmword_243C315B0;
  t2.ty = Height;
  CGAffineTransformConcat((CGAffineTransform *)a3, &t1, &t2);
  v10 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)&t2.a = *(_OWORD *)a3;
  *(_OWORD *)&t2.c = v10;
  *(_OWORD *)&t2.tx = *(_OWORD *)(a3 + 32);
  v11 = a2[1];
  *(_OWORD *)&v16.a = *a2;
  *(_OWORD *)&v16.c = v11;
  *(_OWORD *)&v16.tx = a2[2];
  CGAffineTransformConcat(&t1, &t2, &v16);
  v12 = *(_OWORD *)&t1.c;
  *(_OWORD *)a3 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a3 + 16) = v12;
  *(_OWORD *)(a3 + 32) = *(_OWORD *)&t1.tx;
  v13 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)&t2.a = *(_OWORD *)a3;
  *(_OWORD *)&t2.c = v13;
  *(_OWORD *)&t2.tx = *(_OWORD *)(a3 + 32);
  v16.b = 0.0;
  v16.c = 0.0;
  v16.a = 1.0;
  *(_OWORD *)&v16.d = xmmword_243C315B0;
  v16.ty = Height;
  CGAffineTransformConcat(&t1, &t2, &v16);
  v14 = *(_OWORD *)&t1.c;
  *(_OWORD *)a3 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a3 + 16) = v14;
  result = t1.tx;
  *(_OWORD *)(a3 + 32) = *(_OWORD *)&t1.tx;
  return result;
}

double flipYNormalizedRect(double a1, double a2, double a3, double a4)
{
  double result;
  CGAffineTransform v5;

  v5.b = 0.0;
  v5.c = 0.0;
  v5.a = 1.0;
  *(_OWORD *)&v5.d = xmmword_243C315B0;
  v5.ty = 1.0;
  *(_QWORD *)&result = (unint64_t)CGRectApplyAffineTransform(*(CGRect *)&a1, &v5);
  return result;
}

id flipYNormalizedRects(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v11;
  CGRect v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CGAffineTransform v17;
  _BYTE v18[128];
  uint64_t v19;
  CGRect v20;

  v19 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = v1;
  if (v1 && objc_msgSend(v1, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v11 = v2;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "rectValue");
          v17.a = 1.0;
          v17.b = 0.0;
          v17.c = 0.0;
          *(_OWORD *)&v17.d = xmmword_243C315B0;
          v17.ty = 1.0;
          v12 = CGRectApplyAffineTransform(v20, &v17);
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v12, "{CGRect={CGPoint=dd}{CGSize=dd}}");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v9);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v6);
    }

    v2 = v11;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

double renormalizeRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, CGFloat a7, CGFloat a8)
{
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGRect v16;

  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeScale(&v15, a7, a8);
  v14 = v15;
  v16.origin.x = a1;
  v16.origin.y = a2;
  v16.size.width = a3;
  v16.size.height = a4;
  return a5 + COERCE_DOUBLE(CGRectApplyAffineTransform(v16, &v14));
}

double reduceRectToAspectRatioAndCenter(double a1, double a2, double a3, double a4, double a5)
{
  return reduceRectToAspectRatio(a1, a2, a3, a4, a5, a3 * 0.5);
}

double reduceRectToAspectRatio(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6;
  double v7;
  double v8;

  v6 = a4 * a5;
  if (a4 * a5 >= a3)
    v6 = a3;
  v7 = v6 * 0.5;
  if (a1 + v6 * 0.5 >= a6)
    a6 = a1 + v6 * 0.5;
  v8 = a1 + a3 - v7;
  if (v8 >= a6)
    v8 = a6;
  return v8 - v7;
}

double reduceRectToAspectRatioWithCushion(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return reduceRectToAspectRatio(a1 + a3 * a6, a2 + a4 * a6, a3 * (a6 * -2.0 + 1.0), a4 * (a6 * -2.0 + 1.0), a5, a7);
}

uint64_t canEncodeHEIC()
{
  if (canEncodeHEIC_onceToken != -1)
    dispatch_once(&canEncodeHEIC_onceToken, &__block_literal_global_1);
  return canEncodeHEIC_isSupported;
}

void __canEncodeHEIC_block_invoke()
{
  void *v0;
  CFArrayRef v1;

  v1 = CGImageDestinationCopyTypeIdentifiers();
  objc_msgSend((id)*MEMORY[0x24BDF83E8], "identifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  canEncodeHEIC_isSupported = -[__CFArray containsObject:](v1, "containsObject:", v0);

}

id saveDataToFile(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v7 = 0;
  objc_msgSend(a1, "writeToURL:options:error:", v3, 0, &v7);
  v4 = v7;
  if (v4)
  {
    pfl_layout_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v9 = v3;
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_243C29000, v5, OS_LOG_TYPE_DEFAULT, "saveDataToFile: cannot save data to %@, error = %@\n", buf, 0x16u);
    }

  }
  return v4;
}

__CFData *pngDataFromImage(CGImage *a1)
{
  __CFData *v2;
  __CFString *v3;
  CGImageDestination *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v8[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v2 = (__CFData *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF84F8], "identifier");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = CGImageDestinationCreateWithData(v2, v3, 1uLL, 0);

  if (v4)
  {
    CGImageDestinationAddImage(v4, a1, 0);
    CGImageDestinationFinalize(v4);
    CFRelease(v4);
  }
  else
  {
    pfl_layout_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_243C29000, v5, OS_LOG_TYPE_DEFAULT, "pngDataFromImage: cannot create imageDestinationRef\n", buf, 2u);
    }

  }
  if (!-[__CFData length](v2, "length"))
  {
    pfl_layout_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_243C29000, v6, OS_LOG_TYPE_DEFAULT, "pngDataFromImage: cannot generate png data for image", v8, 2u);
    }

    v2 = 0;
  }
  return v2;
}

id _rectAsString(double a1, double a2, double a3, double a4)
{
  const __CFString *v5;

  if (a4 <= 1.0 && a3 <= 1.0)
    v5 = CFSTR("{ %.5f, %.5f, %.5f, %.5f }");
  else
    v5 = CFSTR("{ %.1f, %.1f, %.1f, %.1f }");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v5, *(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id PFLGenerateWatchLayout(void *a1, void *a2, uint64_t a3, CGImage *a4, unint64_t a5, void *a6, void *a7, int a8, CGFloat a9, CGFloat a10, CGFloat a11, CGFloat a12, double a13, double a14, double a15, double a16)
{
  id v31;
  id v32;
  id v33;
  __CFString *v34;
  id *v35;
  id v36;
  void *v37;
  double v38;
  double v39;
  CGFloat x;
  CGFloat y;
  CGFloat v42;
  CGFloat height;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  BOOL v63;
  void *v64;
  const char *v65;
  void *v66;
  id v67;
  id v68;
  PFLImageDataScaler *v69;
  double v70;
  int64_t v71;
  double v72;
  double v73;
  double v74;
  double v75;
  PFLImageDataScaler *v76;
  uint64_t v77;
  dispatch_semaphore_t v78;
  NSObject *v79;
  NSObject *v80;
  id v81;
  CGImageRef v82;
  CGImage *v83;
  CGImage *v84;
  NSObject *v85;
  size_t v86;
  size_t v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  CGColorSpace *ColorSpace;
  int NumberOfComponents;
  int v95;
  void *v96;
  size_t BitsPerComponent;
  CGColorSpace *shouldInterpolate;
  uint32_t AlphaInfo;
  CGContext *v100;
  id v101;
  const CGFloat *decode;
  CGColorRenderingIntent RenderingIntent;
  NSObject *v104;
  size_t v105;
  unint64_t v106;
  double v107;
  double v108;
  double v109;
  double v110;
  NSObject *v111;
  void *v112;
  const char *v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  BOOL v119;
  double v120;
  double v121;
  double v122;
  double v123;
  CGFloat v124;
  CGFloat v125;
  size_t v126;
  size_t v127;
  CGImage *v128;
  __CFData *v129;
  __CFString *v130;
  CGImageDestination *v131;
  CGImageMetadata *Mutable;
  double v133;
  void *v134;
  const __CFDictionary *v135;
  NSObject *v136;
  NSObject *v137;
  NSObject *v138;
  NSObject *v139;
  uint64_t v140;
  void *v141;
  CGColorSpace *v143;
  size_t BitsPerPixel;
  const __CFData *v145;
  size_t v146;
  int valuea;
  NSObject *value;
  unint64_t v149;
  void *v150;
  size_t widtha;
  void *width;
  id v153;
  CGDataProvider *v154;
  id v155;
  void *v156;
  void *v157;
  id v158;
  __CFString *v159;
  id v160;
  void *v161;
  void *v162;
  double v163;
  id v164;
  id v165;
  CGAffineTransform v166;
  CGAffineTransform v167;
  CGAffineTransform t2;
  CGAffineTransform v169;
  CGAffineTransform v170;
  CGAffineTransform v171;
  CGAffineTransform t1;
  CGAffineTransform *v173;
  CGAffineTransform *p_transform;
  CGAffineTransform v175;
  CGAffineTransform transform;
  uint64_t v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;

  v177 = *MEMORY[0x24BDAC8D0];
  v31 = a1;
  v32 = a2;
  v33 = a6;
  v160 = a7;
  v34 = CFSTR("jpg");
  if (a8)
  {
    v34 = CFSTR("heic");
    v35 = (id *)MEMORY[0x24BDF83E8];
  }
  else
  {
    v35 = (id *)MEMORY[0x24BDF8438];
  }
  v159 = v34;
  v36 = *v35;
  v37 = (void *)objc_opt_new();
  objc_msgSend(v37, "setTimePosition:", a5);
  objc_msgSend(v37, "setTimeRect:", a13, a14, a15, a16);
  objc_msgSend(v37, "setBackgroundZorder:", 0.0);
  objc_msgSend(v37, "setTimeElementZorder:", 1.0);
  v38 = 2.0;
  if (!a4)
    v38 = 0.0;
  objc_msgSend(v37, "setForegroundZorder:", v38);
  v163 = (double)(unint64_t)objc_msgSend(v31, "pixelWidth");
  v156 = v31;
  v39 = (double)(unint64_t)objc_msgSend(v31, "pixelHeight");
  CGAffineTransformMakeScale(&v175, v163, v39);
  v178.origin.x = a9;
  v178.origin.y = a10;
  v178.size.width = a11;
  v178.size.height = a12;
  v179 = CGRectApplyAffineTransform(v178, &v175);
  x = v179.origin.x;
  y = v179.origin.y;
  v42 = v179.size.width;
  height = v179.size.height;
  v44 = *MEMORY[0x24BE723B0] + 1.0;
  v45 = v179.origin.x + v179.size.width * 0.5;
  v46 = v179.origin.y + v179.size.height * 0.5;
  CGAffineTransformMakeTranslation(&t1, -v45, -v46);
  v180.origin.x = x;
  v180.origin.y = y;
  v180.size.width = v42;
  v180.size.height = height;
  v181 = CGRectApplyAffineTransform(v180, &t1);
  v47 = v181.origin.x;
  v48 = v181.origin.y;
  v49 = v181.size.width;
  v50 = v181.size.height;
  CGAffineTransformMakeScale(&v171, v44, v44);
  v182.origin.x = v47;
  v182.origin.y = v48;
  v182.size.width = v49;
  v182.size.height = v50;
  v183 = CGRectApplyAffineTransform(v182, &v171);
  v51 = v183.origin.x;
  v52 = v183.origin.y;
  v53 = v183.size.width;
  v54 = v183.size.height;
  CGAffineTransformMakeTranslation(&transform, v45, v46);
  v184.origin.x = v51;
  v184.origin.y = v52;
  v184.size.width = v53;
  v184.size.height = v54;
  v185 = CGRectApplyAffineTransform(v184, &transform);
  v55 = v185.origin.x;
  v56 = v185.origin.y;
  v57 = v185.size.height * (v39 / v185.size.height);
  if (v185.size.width > v163)
  {
    v58 = v163;
  }
  else
  {
    v57 = v185.size.height;
    v58 = v185.size.width;
  }
  if (v185.size.height > v39)
    v59 = v39;
  else
    v59 = v57;
  if (v185.size.height > v39)
    v60 = v163 / v185.size.width * v58;
  else
    v60 = v58;
  v61 = 0.0;
  if (v55 < 0.0 || (v61 = v55, v55 + v185.size.width > v163))
  {
    if (v61 >= v163 - v185.size.width)
      v55 = v163 - v185.size.width;
    else
      v55 = v61;
  }
  v62 = 0.0;
  if (v56 < 0.0 || (v62 = v56, v56 + v185.size.height > v39))
  {
    if (v62 >= v39 - v185.size.height)
      v56 = v39 - v185.size.height;
    else
      v56 = v62;
  }
  v63 = a4 != 0;
  v64 = (void *)MEMORY[0x24BDD17C8];
  v158 = objc_retainAutorelease(v33);
  objc_msgSend(v64, "stringWithUTF8String:", objc_msgSend(v158, "fileSystemRepresentation"));
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 > 8)
    v65 = "HM";
  else
    v65 = (&off_251457D60)[a5];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("base_%s_%@.%@"), v65, v160, v159);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "stringByAppendingPathComponent:", v162);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v157);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = v32;
  v67 = v36;
  v68 = v66;
  v69 = [PFLImageDataScaler alloc];
  v70 = rint(v56);
  v71 = (uint64_t)rint(v55) & (*(_QWORD *)&v63 | 0xFFFFFFFFFFFFFFFELL);
  v72 = *MEMORY[0x24BE723C0];
  v73 = *(double *)(MEMORY[0x24BE723C0] + 8);
  v74 = (double)v71;
  v75 = (double)(uint64_t)((uint64_t)v70 & (*(_QWORD *)&v63 | 0xFFFFFFFFFFFFFFFELL));
  v76 = -[PFLImageDataScaler initWithSize:crop:data:orientation:type:outputSize:](v69, "initWithSize:crop:data:orientation:type:outputSize:", v165, a3, v67, v163, v39, (double)v71, v75, v60, v59, *MEMORY[0x24BE723C0], v73);
  v77 = 1;
  if (v76)
  {
    v171.a = 0.0;
    *(_QWORD *)&v171.b = &v171;
    *(_QWORD *)&v171.c = 0x3032000000;
    *(_QWORD *)&v171.d = __Block_byref_object_copy__1;
    *(_QWORD *)&v171.tx = __Block_byref_object_dispose__1;
    v171.ty = 0.0;
    transform.a = 0.0;
    *(_QWORD *)&transform.b = &transform;
    *(_QWORD *)&transform.c = 0x2020000000;
    LODWORD(transform.d) = 1;
    v78 = dispatch_semaphore_create(0);
    *(_QWORD *)&t1.a = MEMORY[0x24BDAC760];
    *(_QWORD *)&t1.b = 3221225472;
    *(_QWORD *)&t1.c = __cropScaleSaveToFile_block_invoke;
    *(_QWORD *)&t1.d = &unk_251457D40;
    *(_QWORD *)&t1.tx = v68;
    v173 = &v171;
    p_transform = &transform;
    v79 = v78;
    *(_QWORD *)&t1.ty = v79;
    -[PFLImageDataScaler cropAndScaleWithCompletion:](v76, "cropAndScaleWithCompletion:", &t1);
    dispatch_semaphore_wait(v79, 0xFFFFFFFFFFFFFFFFLL);
    v77 = *(unsigned int *)(*(_QWORD *)&transform.b + 24);
    v164 = *(id *)(*(_QWORD *)&v171.b + 40);

    _Block_object_dispose(&transform, 8);
    _Block_object_dispose(&v171, 8);

  }
  else
  {
    v164 = 0;
  }

  pfl_layout_log();
  v80 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(t1.a) = 138412546;
    *(_QWORD *)((char *)&t1.a + 4) = v68;
    WORD2(t1.b) = 2112;
    *(_QWORD *)((char *)&t1.b + 6) = v164;
    _os_log_impl(&dword_243C29000, v80, OS_LOG_TYPE_DEFAULT, "PFLGenerateWatchLayers: saved base image to %@, error == %@", (uint8_t *)&t1, 0x16u);
  }

  if (v164)
    goto LABEL_34;
  objc_msgSend(v37, "setBaseImageName:", v162);
  objc_msgSend(v37, "setOriginalCrop:", v74, v75, v60, v59);
  objc_msgSend(v37, "setMaskImageName:", 0);
  if (!a4)
    goto LABEL_84;
  v82 = CGImageRetain(a4);
  v83 = v82;
  if ((_DWORD)v77 == 1)
  {
    v84 = v82;
  }
  else
  {
    pfl_layout_log();
    v85 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(t1.a) = 134218240;
      *(_QWORD *)((char *)&t1.a + 4) = 1;
      WORD2(t1.b) = 2048;
      *(_QWORD *)((char *)&t1.b + 6) = v77;
      _os_log_impl(&dword_243C29000, v85, OS_LOG_TYPE_DEFAULT, "saved photo has changed orientation; adjusting the mask from %ld to %ld",
        (uint8_t *)&t1,
        0x16u);
    }

    if (!v83)
      goto LABEL_45;
    v86 = CGImageGetWidth(v83);
    v87 = CGImageGetHeight(v83);
    v88 = presentationSizeForOrientation(1, (double)v86, (double)v87);
    v90 = storedSizeForOrientation(v77, v88, v89);
    v92 = v91;
    ColorSpace = CGImageGetColorSpace(v83);
    NumberOfComponents = CGColorSpaceGetNumberOfComponents(ColorSpace);
    memset(&v175.c, 0, 32);
    v95 = (NumberOfComponents & 0x10000000) != 0 ? 8 * NumberOfComponents + 14 : (8 * NumberOfComponents) | 7;
    *(_OWORD *)&v175.a = 0uLL;
    makePresentationTransform(1, v86, v87, (uint64_t)&v175);
    memset(&v170, 0, sizeof(v170));
    v149 = (int)v92;
    widtha = (int)v90;
    makePresentationTransform(v77, widtha, v149, (uint64_t)&v170);
    v169 = v175;
    t1 = v170;
    CGAffineTransformInvert(&t2, &t1);
    t1 = v175;
    CGAffineTransformConcat(&v169, &t1, &t2);
    valuea = (v95 >> 3) * (int)v90;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", valuea * (int)v92);
    v153 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v96 = (void *)objc_msgSend(v153, "mutableBytes");
    BitsPerComponent = CGImageGetBitsPerComponent(v83);
    shouldInterpolate = CGImageGetColorSpace(v83);
    AlphaInfo = CGImageGetAlphaInfo(v83);
    v100 = CGBitmapContextCreate(v96, widtha, v149, BitsPerComponent, valuea, shouldInterpolate, AlphaInfo);
    v167 = v169;
    CGContextSaveGState(v100);
    v171 = v167;
    memset(&t1, 0, sizeof(t1));
    uprightCTM(v83, &v171, (uint64_t)&t1);
    memset(&v171, 0, sizeof(v171));
    transform = t1;
    CGAffineTransformInvert(&v171, &transform);
    transform = t1;
    CGContextConcatCTM(v100, &transform);
    transform = v171;
    v186.origin.x = 0.0;
    v186.origin.y = 0.0;
    v186.size.width = v90;
    v186.size.height = v92;
    v187 = CGRectApplyAffineTransform(v186, &transform);
    CGContextDrawImage(v100, v187, v83);
    CGContextRestoreGState(v100);
    CGContextRelease(v100);
    v101 = objc_retainAutorelease(v153);

    v145 = (const __CFData *)v101;
    v154 = CGDataProviderCreateWithCFData(v145);
    v146 = CGImageGetBitsPerComponent(v83);
    BitsPerPixel = CGImageGetBitsPerPixel(v83);
    v143 = CGImageGetColorSpace(v83);
    LODWORD(v101) = CGImageGetBitmapInfo(v83);
    decode = CGImageGetDecode(v83);
    LOBYTE(shouldInterpolate) = CGImageGetShouldInterpolate(v83);
    RenderingIntent = CGImageGetRenderingIntent(v83);
    v84 = CGImageCreate(widtha, v149, v146, BitsPerPixel, valuea, v143, (CGBitmapInfo)v101, v154, decode, (BOOL)shouldInterpolate, RenderingIntent);
    CGDataProviderRelease(v154);

    if (!v84)
    {
LABEL_45:
      pfl_layout_log();
      v104 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
        PFLGenerateWatchLayout_cold_1((uint64_t)v83, v77, v104);

      v84 = 0;
    }
    CGImageRelease(v83);
  }
  if (!v84)
  {
LABEL_84:
    objc_msgSend(v37, "setImageAOTBrightness:", 0.0);
    objc_msgSend(v37, "setUserEdited:", 0);
    v81 = v37;
    goto LABEL_85;
  }
  v105 = CGImageGetWidth(a4);
  v106 = objc_msgSend(v156, "pixelWidth");
  CGAffineTransformMakeScale(&v166, (double)v105 / (double)v106, (double)v105 / (double)v106);
  v188.origin.x = v74;
  v188.origin.y = v75;
  v188.size.width = v60;
  v188.size.height = v59;
  v189 = CGRectApplyAffineTransform(v188, &v166);
  v107 = v189.origin.x;
  v108 = v189.origin.y;
  v109 = v189.size.width;
  v110 = v189.size.height;
  pfl_layout_log();
  v111 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
  {
    _rectAsString(v107, v108, v109, v110);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(t1.a) = 138412290;
    *(_QWORD *)((char *)&t1.a + 4) = v112;
    _os_log_impl(&dword_243C29000, v111, OS_LOG_TYPE_DEFAULT, "PFLGenerateWatchLayers: mask crop rect == %@", (uint8_t *)&t1, 0xCu);

  }
  if (a5 > 8)
    v113 = "HM";
  else
    v113 = (&off_251457D60)[a5];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("mask_%s_%@.png"), v113, v160);
  width = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "stringByAppendingPathComponent:", width);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v150);
  v155 = (id)objc_claimAutoreleasedReturnValue();
  v114 = reduceRectToAspectRatioAndCenter(v107, v108, v109, v110, v72 / v73);
  v116 = v115;
  v119 = v117 <= v118;
  v120 = rint(v118);
  v121 = ceil(v72 * v120 / v73);
  v122 = rint(v117);
  v123 = ceil(v73 * v122 / v72);
  if (v119)
    v124 = v120;
  else
    v124 = v123;
  if (v119)
    v125 = v121;
  else
    v125 = v122;
  v126 = CGImageGetWidth(v84);
  v127 = CGImageGetHeight(v84);
  memset(&t1, 0, sizeof(t1));
  makePresentationTransform(v77, v126, v127, (uint64_t)&v171);
  CGAffineTransformInvert(&t1, &v171);
  transform = t1;
  v190.origin.x = rint(v114);
  v190.origin.y = rint(v116);
  v190.size.width = v125;
  v190.size.height = v124;
  v191 = CGRectApplyAffineTransform(v190, &transform);
  v128 = CGImageCreateWithImageInRect(v84, v191);
  if (v128)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v129 = (__CFData *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BDF84F8], "identifier");
    v130 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v131 = CGImageDestinationCreateWithData(v129, v130, 1uLL, 0);

    if (v131)
    {
      Mutable = CGImageMetadataCreateMutable();
      if (Mutable)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v77);
        value = objc_claimAutoreleasedReturnValue();
        CGImageMetadataSetValueWithPath(Mutable, 0, CFSTR("tiff:Orientation"), value);
        if (v72 >= v73)
          v133 = v72;
        else
          v133 = v73;
        v175.a = *(CGFloat *)MEMORY[0x24BDD9218];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v133);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        v175.b = *(CGFloat *)MEMORY[0x24BDD9248];
        *(_QWORD *)&transform.a = v134;
        *(_QWORD *)&transform.b = MEMORY[0x24BDBD1C8];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &transform, &v175, 2);
        v135 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

        CGImageDestinationAddImageAndMetadata(v131, v128, Mutable, v135);
        CGImageDestinationFinalize(v131);
        CFRelease(Mutable);

        v136 = value;
      }
      else
      {

        pfl_photo_log();
        v136 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(transform.a) = 0;
          _os_log_impl(&dword_243C29000, v136, OS_LOG_TYPE_DEFAULT, "cropScaleMask: cannot create metadataRef", (uint8_t *)&transform, 2u);
        }
        v129 = 0;
      }

      CFRelease(v131);
    }
    else
    {

      pfl_photo_log();
      v138 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(transform.a) = 0;
        _os_log_impl(&dword_243C29000, v138, OS_LOG_TYPE_DEFAULT, "cropScaleMask: cannot create imageDestinationRef", (uint8_t *)&transform, 2u);
      }

      v129 = 0;
    }
    CFRelease(v128);
  }
  else
  {
    pfl_photo_log();
    v137 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(transform.a) = 0;
      _os_log_impl(&dword_243C29000, v137, OS_LOG_TYPE_DEFAULT, "cropScaleMask: cannot create croppedImageRef", (uint8_t *)&transform, 2u);
    }

    v129 = 0;
  }
  pfl_layout_log();
  v139 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
  {
    v140 = -[__CFData length](v129, "length");
    LODWORD(t1.a) = 134218242;
    *(_QWORD *)((char *)&t1.a + 4) = v140;
    WORD2(t1.b) = 2112;
    *(_QWORD *)((char *)&t1.b + 6) = v155;
    _os_log_impl(&dword_243C29000, v139, OS_LOG_TYPE_DEFAULT, "PFLGenerateWatchLayout: saving %ld bytes of mask data to %@", (uint8_t *)&t1, 0x16u);
  }

  saveDataToFile(v129, v155);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v141)
  {
    objc_msgSend(v37, "setMaskImageName:", width);
    CGImageRelease(v84);

    goto LABEL_84;
  }

LABEL_34:
  v81 = 0;
LABEL_85:

  return v81;
}

void sub_243C3071C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  uint64_t v59;

  _Block_object_dispose((const void *)(v59 - 224), 8);
  _Block_object_dispose(&a59, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __cropScaleSaveToFile_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pfl_layout_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = objc_msgSend(v3, "length");
      v7 = *(_QWORD *)(a1 + 32);
      v14 = 134218242;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_243C29000, v4, OS_LOG_TYPE_DEFAULT, "cropScaleSaveToFile: saving %ld bytes to %@", (uint8_t *)&v14, 0x16u);
    }

    saveDataToFile(v3, *(void **)(a1 + 32));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = getImageOrientationFromData((const __CFData *)v3);
  }
  else
  {
    if (v5)
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_243C29000, v4, OS_LOG_TYPE_DEFAULT, "cropScaleSaveToFile: failed to crop", (uint8_t *)&v14, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", 0x251457DA8, 3, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void PFLGenerateWatchLayout_cold_1(uint64_t a1, unsigned int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 138412802;
  v4 = a1;
  v5 = 2048;
  v6 = 1;
  v7 = 2048;
  v8 = a2;
  _os_log_error_impl(&dword_243C29000, log, OS_LOG_TYPE_ERROR, "cannot reorient mask image %@ from %ld to %ld", (uint8_t *)&v3, 0x20u);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8C0](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC20](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x24BDBDD50](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE180](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x24BDBE1C8](provider);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x24BDBE5E0](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x24BDBE5F8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

void CGImageDestinationAddImageAndMetadata(CGImageDestinationRef idst, CGImageRef image, CGImageMetadataRef metadata, CFDictionaryRef options)
{
  MEMORY[0x24BDD9050](idst, image, metadata, options);
}

CFArrayRef CGImageDestinationCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x24BDD9070]();
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9078](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE620](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE628](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x24BDBE630](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x24BDBE638](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

const CGFloat *__cdecl CGImageGetDecode(CGImageRef image)
{
  return (const CGFloat *)MEMORY[0x24BDBE670](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

CGColorRenderingIntent CGImageGetRenderingIntent(CGImageRef image)
{
  return MEMORY[0x24BDBE6C0](image);
}

BOOL CGImageGetShouldInterpolate(CGImageRef image)
{
  return MEMORY[0x24BDBE6C8](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x24BDD90C8]();
}

BOOL CGImageMetadataSetValueWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path, CFTypeRef value)
{
  return MEMORY[0x24BDD9108](metadata, parent, path, value);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x24BDD9148](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9168](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9170](data, options);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x24BDC53A0](texture);
}

uint64_t PFCRectForTimePosition()
{
  return MEMORY[0x24BE723B8]();
}

uint64_t PFLCCalculateLayout()
{
  return MEMORY[0x24BE723D0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x24BDAF6E8](*(_QWORD *)&pid, *(_QWORD *)&flavor, buffer);
}

uint64_t proc_reset_footprint_interval()
{
  return MEMORY[0x24BDAF720]();
}

