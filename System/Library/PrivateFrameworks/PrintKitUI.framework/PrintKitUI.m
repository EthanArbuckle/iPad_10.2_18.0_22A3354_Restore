id GetImageUTI(void *a1, void *a2)
{
  id v3;
  const __CFURL *v4;
  id v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  void *v10;
  CGImageSource *v11;
  id v12;
  CGImageSource *v13;
  _QWORD block[4];
  id v16;
  dispatch_semaphore_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v3 = a1;
  v4 = a2;
  if (!IsAssetURL(v4))
  {
    if (v4)
    {
      if (!IsPrintablePDFURL(v4, 0, 0))
      {
        v11 = CGImageSourceCreateWithURL(v4, 0);
        if (!v11)
          goto LABEL_15;
LABEL_14:
        v13 = v11;
        v12 = (id)-[__CFString copy]((id)CGImageSourceGetType(v11), "copy");
        CFRelease(v13);
        goto LABEL_16;
      }
LABEL_12:
      objc_msgSend((id)*MEMORY[0x1E0CEC570], "identifier");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    if (v3)
    {
      if (IsPrintablePDFData(v3, 0, 0))
        goto LABEL_12;
      v11 = CGImageSourceCreateWithData((CFDataRef)v3, 0);
      if (v11)
        goto LABEL_14;
    }
LABEL_15:
    v12 = 0;
    goto LABEL_16;
  }
  GetPHAssetForAssetURLSync(v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  if (v5)
  {
    v6 = dispatch_semaphore_create(0);
    dispatch_get_global_queue(2, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __GetImageUTIForPHAssetSync_block_invoke;
    block[3] = &unk_1E9D972A8;
    v17 = v6;
    v18 = &v19;
    v16 = v5;
    v8 = v6;
    dispatch_async(v7, block);

    v9 = dispatch_time(0, 30000000000);
    dispatch_semaphore_wait(v8, v9);

    v10 = (void *)v20[5];
  }
  else
  {
    v10 = 0;
  }
  v12 = v10;
  _Block_object_dispose(&v19, 8);

LABEL_16:
  return v12;
}

BOOL IsPrintablePDFURL(void *a1, int a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  CGDataProvider *v16;
  CGDataProvider *v17;
  CGPDFDocument *v18;
  _BOOL4 IsEncrypted;

  v5 = a1;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CEC3F8];
  objc_msgSend(v5, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "typeWithFilenameExtension:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("com.apple.iwork"));

  if ((v11 & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingFromURL:error:", v5, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "readDataUpToLength:error:", 4096, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    if (HasValidPDFHeader(v15)
      && (v16 = CGDataProviderCreateWithURL((CFURLRef)v5)) != 0
      && (v17 = v16, v18 = CGPDFDocumentCreateWithProvider(v16), CGDataProviderRelease(v17), v18))
    {
      if (a2)
      {
        IsEncrypted = CGPDFDocumentIsEncrypted(v18);
        if (v6 && IsEncrypted)
          CGPDFDocumentUnlockWithPassword(v18, (const char *)objc_msgSend(objc_retainAutorelease(v6), "cStringUsingEncoding:", 4));
        v12 = CGPDFDocumentAllowsPrinting(v18);
      }
      else
      {
        v12 = 1;
      }
      CGPDFDocumentRelease(v18);
    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

void sub_1D8154ACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1D8154E80(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1D8155174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL IsAssetURL(void *a1)
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "compare:options:", CFSTR("assets-library"), 1) == 0;
  else
    v3 = 0;

  return v3;
}

id GetPHAssetForAssetURLSync(void *a1)
{
  id v1;
  dispatch_semaphore_t v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_time_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v10;
  dispatch_semaphore_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v1 = a1;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  if (v1)
  {
    v2 = dispatch_semaphore_create(0);
    dispatch_get_global_queue(2, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __GetPHAssetForAssetURLSync_block_invoke;
    block[3] = &unk_1E9D97030;
    v12 = &v13;
    v10 = v1;
    v11 = v2;
    v4 = v2;
    dispatch_async(v3, block);

    v5 = dispatch_time(0, 3000000000);
    dispatch_semaphore_wait(v4, v5);

    v6 = (void *)v14[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v13, 8);

  return v7;
}

id getPHAssetClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPHAssetClass_softClass;
  v7 = getPHAssetClass_softClass;
  if (!getPHAssetClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPHAssetClass_block_invoke;
    v3[3] = &unk_1E9D97240;
    v3[4] = &v4;
    __getPHAssetClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D8155F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8157548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1D81577D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D8158B68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1D8159064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D81591E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D8159BC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D8159DA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D8159E18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1D815A208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id ConvertCIBasedImage(void *a1)
{
  id v1;
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  void *v8;
  CGSize v10;

  v1 = a1;
  objc_msgSend(v1, "size");
  v3 = v2;
  v5 = v4;
  objc_msgSend(v1, "scale");
  v7 = v6;
  v10.width = v3;
  v10.height = v5;
  UIGraphicsBeginImageContextWithOptions(v10, 0, v7);
  objc_msgSend(v1, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  UIGraphicsGetImageFromCurrentImageContext();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v8;
}

id ImageFromImageSource(CGImageSource *a1)
{
  const __CFDictionary *v2;
  CGImageRef ImageAtIndex;
  CGImage *v4;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  const __CFNumber *Value;
  int v8;
  float v9;
  double v10;
  void *v12;
  uint64_t v13;
  const __CFNumber *v14;
  int v15;
  unsigned int v16;
  float valuePtr;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (!CGImageSourceGetCount(a1))
    return 0;
  v18 = CFSTR("kCGImageSourceSkipMetadata");
  v19[0] = *MEMORY[0x1E0C9AE50];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v2 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  ImageAtIndex = CGImageSourceCreateImageAtIndex(a1, 0, v2);
  if (ImageAtIndex)
  {
    v4 = ImageAtIndex;
    v5 = CGImageSourceCopyPropertiesAtIndex(a1, 0, v2);
    if (v5)
    {
      v6 = v5;
      Value = (const __CFNumber *)CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E0CBCA00]);
      if (Value)
      {
        valuePtr = 0.0;
        v8 = CFNumberGetValue(Value, kCFNumberFloatType, &valuePtr);
        v9 = valuePtr;
        if (!v8)
          v9 = 0.0;
        v10 = 1.0;
        if (v9 >= 1.0 && v9 <= 2540.0)
          v10 = v9 / 72.0;
      }
      else
      {
        v10 = 1.0;
      }
      v14 = (const __CFNumber *)CFDictionaryGetValue(v6, (const void *)*MEMORY[0x1E0CBCFF0]);
      if (!v14)
        goto LABEL_19;
      valuePtr = 0.0;
      v15 = CFNumberGetValue(v14, kCFNumberIntType, &valuePtr);
      v16 = LODWORD(valuePtr) - 1;
      if (!v15)
        v16 = -1;
      if (v16 <= 7)
        v13 = ImageFromImageSource___orientationMapping[v16];
      else
LABEL_19:
        v13 = 0;
      CFRelease(v6);
    }
    else
    {
      v13 = 0;
      v10 = 1.0;
    }
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", v4, v13, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v4);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id GetImageForPHAssetSync(void *a1)
{
  id v1;
  dispatch_semaphore_t v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  dispatch_time_t v6;
  id v7;
  _QWORD block[4];
  id v10;
  dispatch_semaphore_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v1 = a1;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v2 = dispatch_semaphore_create(0);
  dispatch_get_global_queue(2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __GetImageForPHAssetSync_block_invoke;
  block[3] = &unk_1E9D972A8;
  v11 = v2;
  v12 = &v13;
  v10 = v1;
  v4 = v2;
  v5 = v1;
  dispatch_async(v3, block);

  v6 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(v4, v6);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void sub_1D815C3C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D815C550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

BOOL IsPrintablePDFData(void *a1, int a2, void *a3)
{
  id v5;
  id v6;
  CGDataProvider *v7;
  CGDataProvider *v8;
  CGPDFDocument *v9;
  _BOOL4 IsEncrypted;
  _BOOL8 v11;

  v5 = a1;
  v6 = a3;
  if (HasValidPDFHeader(v5)
    && (v7 = CGDataProviderCreateWithCFData((CFDataRef)v5)) != 0
    && (v8 = v7, v9 = CGPDFDocumentCreateWithProvider(v7), CGDataProviderRelease(v8), v9))
  {
    if (a2)
    {
      IsEncrypted = CGPDFDocumentIsEncrypted(v9);
      if (v6 && IsEncrypted)
        CGPDFDocumentUnlockWithPassword(v9, (const char *)objc_msgSend(objc_retainAutorelease(v6), "cStringUsingEncoding:", 4));
      v11 = CGPDFDocumentAllowsPrinting(v9);
    }
    else
    {
      v11 = 1;
    }
    CGPDFDocumentRelease(v9);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t HasValidPDFHeader(void *a1)
{
  id v1;
  void *v2;
  id v3;
  char *v4;
  unint64_t v5;
  char *i;
  const char *v7;
  const char *v8;
  uint64_t v9;

  v1 = a1;
  v2 = v1;
  if (v1 && (unint64_t)objc_msgSend(v1, "length") >= 0xB)
  {
    v3 = objc_retainAutorelease(v2);
    v4 = (char *)objc_msgSend(v3, "bytes");
    v5 = objc_msgSend(v3, "length") - 11;
    if (v5 >= 0xFF5)
      v5 = 4085;
    for (i = &v4[v5]; v4 < i; v4 = (char *)(v8 + 1))
    {
      v7 = (const char *)memchr(v4, 37, i - v4);
      if (!v7)
        break;
      v8 = v7;
      if (!strncmp("%PDF-", v7, 5uLL) || !strncmp("%!PS-Adobe-", v8, 0xBuLL))
      {
        v9 = 1;
        goto LABEL_11;
      }
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

double GetMaxCropSize(CGPDFDocument *a1)
{
  double v2;
  double v3;
  size_t NumberOfPages;
  size_t v5;
  uint64_t v6;
  CGPDFPage *Page;
  double v8;
  double v9;
  CGRect BoxRect;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  NumberOfPages = CGPDFDocumentGetNumberOfPages(a1);
  if (NumberOfPages)
  {
    v5 = NumberOfPages;
    v6 = 0;
    do
    {
      Page = CGPDFDocumentGetPage(a1, ++v6);
      if (Page)
      {
        BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
        v8 = round(BoxRect.size.width);
        if (v2 < v8)
          v2 = v8;
        v9 = round(BoxRect.size.height);
        if (v3 < v9)
          v3 = v9;
      }
    }
    while (v5 != v6);
  }
  return v2;
}

void sub_1D815E81C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D815E978(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D815F6A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

id PrintableMIMEType(uint64_t a1)
{
  void *v1;
  id *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "conformsToType:", *MEMORY[0x1E0CEC570]) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x1E0D80AC8];
  }
  else if ((objc_msgSend(v1, "conformsToType:", *MEMORY[0x1E0CEC530]) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x1E0D80AC0];
  }
  else if ((objc_msgSend(v1, "conformsToType:", *MEMORY[0x1E0CEC580]) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x1E0D80AD0];
  }
  else
  {
    if (!objc_msgSend(v1, "conformsToType:", *MEMORY[0x1E0CEC508]))
    {
      v3 = 0;
      goto LABEL_10;
    }
    v2 = (id *)MEMORY[0x1E0D80AB8];
  }
  v3 = *v2;
LABEL_10:

  return v3;
}

uint64_t PrintImagePutBytes(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = objc_msgSend(*(id *)a1, "sendData:ofLength:", a2, a3);
  *(_BYTE *)(a1 + 8) = v5 == 0;
  if (v5)
    return 0;
  else
    return a3;
}

Class __getPHAssetClass_block_invoke(uint64_t a1)
{
  Class result;

  PhotosLibrary();
  result = objc_getClass("PHAsset");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPHAssetClass_block_invoke_cold_1();
  getPHAssetClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PhotosLibrary()
{
  uint64_t v0;
  void *v2;

  if (!PhotosLibraryCore_frameworkLibrary)
    PhotosLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = PhotosLibraryCore_frameworkLibrary;
  if (!PhotosLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getPHImageRequestOptionsClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPHImageRequestOptionsClass_softClass;
  v7 = getPHImageRequestOptionsClass_softClass;
  if (!getPHImageRequestOptionsClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPHImageRequestOptionsClass_block_invoke;
    v3[3] = &unk_1E9D97240;
    v3[4] = &v4;
    __getPHImageRequestOptionsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D8160E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPHImageManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPHImageManagerClass_softClass;
  v7 = getPHImageManagerClass_softClass;
  if (!getPHImageManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPHImageManagerClass_block_invoke;
    v3[3] = &unk_1E9D97240;
    v3[4] = &v4;
    __getPHImageManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D8160F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPHImageRequestOptionsClass_block_invoke(uint64_t a1)
{
  Class result;

  PhotosLibrary();
  result = objc_getClass("PHImageRequestOptions");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPHImageRequestOptionsClass_block_invoke_cold_1();
  getPHImageRequestOptionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPHImageManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  PhotosLibrary();
  result = objc_getClass("PHImageManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPHImageManagerClass_block_invoke_cold_1();
  getPHImageManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1D816125C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D816241C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D8163388(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D8163A18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D8163B2C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D8163CF0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_1D8163EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id createPrintKitUISwitch(double a1, double a2, double a3, double a4)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D18]), "initWithFrame:", a1, a2, a3, a4);
}

id CopyDictionaryString(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (v5 && (objc_msgSend(v5, "objectForKey:", v6), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = v8;
    v10 = (id)objc_msgSend(v8, "copy");

  }
  else
  {
    v10 = v7;
  }

  return v10;
}

id GetDefaultJobName()
{
  void *v0;
  void *v1;

  GetAppName();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Untitled"), CFSTR("Untitled"), CFSTR("Localizable"));
    v0 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v0;
}

id arrayForKey(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

id GetAppName()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedInfoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("CFBundleDisplayName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "infoDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("CFBundleDisplayName"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "infoDictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("CFBundleName"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v2;
}

void _UIPrinterInfoStartRequest(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v1 = a1;
  v2 = (void *)__printerInfoRequests;
  v9 = v1;
  if (!__printerInfoRequests)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)__printerInfoRequests;
    __printerInfoRequests = (uint64_t)v3;

    v1 = v9;
    v2 = (void *)__printerInfoRequests;
  }
  objc_msgSend(v1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[UIPrinterInfoRequest requestInfoForPrinter:](UIPrinterInfoRequest, "requestInfoForPrinter:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)__printerInfoRequests;
    objc_msgSend(v9, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, v8);

  }
}

id _UIPrinterInfoHasInfo(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)__printerInfoRequests;
  objc_msgSend(a1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "printerInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t _UIPrinterInfoGetState(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a1;
  v4 = a2;
  if ((objc_msgSend(v3, "hasPrintInfoSupported") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)__printerInfoRequests;
    objc_msgSend(v3, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      _UIPrinterInfoStartRequest(v3);
      v9 = (void *)__printerInfoRequests;
      objc_msgSend(v3, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "setCompletionHandler:", v4);
    v5 = objc_msgSend(v8, "requestState");

  }
  return v5;
}

void _UIPrinterInfoCancelRequest(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v1 = a1;
  v2 = (void *)__printerInfoRequests;
  v7 = v1;
  objc_msgSend(v1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "setCompletionHandler:", 0);
    v5 = (void *)__printerInfoRequests;
    objc_msgSend(v7, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v6);

  }
}

uint64_t _UIPrinterInfoCancelRequests()
{
  objc_msgSend((id)__printerInfoRequests, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_2);
  return objc_msgSend((id)__printerInfoRequests, "removeAllObjects");
}

void _UIPrintInfoPrinterLookup(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "_checkAvailable:queue:completionHandler:", MEMORY[0x1E0C80D38], v3, 60.0);
  }
  else
  {
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = ___UIPrintInfoPrinterLookup_block_invoke;
    v7[3] = &unk_1E9D975A0;
    v8 = v5;
    v9 = v3;
    v4 = v5;
    dispatch_async(v6, v7);

  }
}

void sub_1D816D49C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D816D5AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D816E4EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(location);
  objc_destroyWeak(&a21);
  _Unwind_Resume(a1);
}

void sub_1D816EAB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D816EE18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D816F794(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D816F8A0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1D8171698(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1D81719E8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1D8171D44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D8172008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D8172434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D81726EC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1D81799E0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

BOOL NSIntersectsRange(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  return a1 < a3 + a4 && a3 < a1 + a2;
}

void sub_1D817BF5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

CFComparisonResult compareTrayNames(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  CFComparisonResult v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;

  v3 = a1;
  v4 = a2;
  v5 = *MEMORY[0x1E0D80AF8];
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D80AF8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("auto")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("any")) & 1) != 0)
  {
    v8 = kCFCompareLessThan;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("auto")) & 1) != 0
         || (objc_msgSend(v7, "isEqualToString:", CFSTR("any")) & 1) != 0)
  {
    v8 = kCFCompareGreaterThan;
  }
  else
  {
    v9 = *MEMORY[0x1E0D80B08];
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D80B08]);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v9);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = CFStringCompare(v10, v11, 1uLL);

  }
  return v8;
}

CFComparisonResult compareMediaTypes(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  CFComparisonResult v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;

  v3 = a1;
  v4 = a2;
  v5 = *MEMORY[0x1E0D80B50];
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D80B50]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("auto")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("any")) & 1) != 0)
  {
    v8 = kCFCompareLessThan;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("auto")) & 1) != 0
         || (objc_msgSend(v7, "isEqualToString:", CFSTR("any")) & 1) != 0)
  {
    v8 = kCFCompareGreaterThan;
  }
  else
  {
    v9 = *MEMORY[0x1E0D80B60];
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D80B60]);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v9);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = CFStringCompare(v10, v11, 1uLL);

  }
  return v8;
}

double _roundToPixel(double a1)
{
  double v2;
  void *v3;
  uint64_t v4;

  v2 = *(double *)&_roundToPixel_scale;
  if (*(double *)&_roundToPixel_scale == -1.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", *(double *)&_roundToPixel_scale);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    _roundToPixel_scale = v4;

    v2 = *(double *)&_roundToPixel_scale;
  }
  return round(v2 * a1) / v2;
}

const __CFURL *redrawPDFWithNUp(void *a1, void *a2, void *a3)
{
  const __CFURL *v5;
  id v6;
  id v7;
  unint64_t v8;
  int v9;
  float v10;
  CGPDFDocument *v11;
  CGPDFDocument *v12;
  void *v13;
  _BOOL4 v14;
  const void *v15;
  void *v16;
  const void *v17;
  uint64_t v18;
  void *v19;
  _BOOL4 IsEncrypted;
  id v21;
  int NumberOfPages;
  CGPDFPage *Page;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  const __CFURL *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  int v55;
  int v56;
  double v57;
  double v58;
  CGFloat v59;
  int *v60;
  int v61;
  CGFloat v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  double width;
  double height;
  int v68;
  int v69;
  int v70;
  double v71;
  double v72;
  int v73;
  int v74;
  int v75;
  int v76;
  double *v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int *v83;
  int v84;
  unsigned int v85;
  int v86;
  int v87;
  char *v88;
  int *v89;
  int v90;
  int *v91;
  int *v92;
  _DWORD *v93;
  int v94;
  int v95;
  int v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  __CFString *v102;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v104;
  const void *v105;
  const void *v106;
  CGPDFDictionary *Info;
  CGPDFDictionary *v108;
  CFStringRef v109;
  CFStringRef v110;
  CFStringRef v111;
  CFStringRef v112;
  CFStringRef v113;
  CFStringRef v114;
  CFStringRef v115;
  CFStringRef v116;
  CGContext *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  int v121;
  double v122;
  double v123;
  CGPDFPage *v124;
  CGPDFPage *v125;
  double v126;
  double v127;
  double x;
  double y;
  double v130;
  double v131;
  double v132;
  double v133;
  double v135;
  CGContext *v136;
  const __CFURL *url;
  void *v139;
  const __CFURL *v140;
  const void *v141;
  CGFloat v142;
  void *value;
  double valuea;
  id v145;
  uint64_t v146;
  CGRect mediaBox;
  CGRect v148;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform transform;
  CGAffineTransform v152;
  CGAffineTransform string;
  uuid_string_t v154;
  uuid_t out;
  uint64_t v156;
  CGRect v157;
  CGRect v158;
  CGRect BoxRect;
  CGRect v160;
  CGRect v161;
  CGRect v162;

  v156 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  LODWORD(a3) = objc_msgSend(v6, "numNUpRows");
  NUp = objc_msgSend(v6, "numNUpColumns") * (_DWORD)a3;
  v8 = objc_msgSend(v6, "nUpLayoutDirection");
  if (v8 >= 4)
  {
    printf("layout direction: %ld\n", v8);
    v9 = 1;
  }
  else
  {
    v9 = dword_1D81AB3B0[v8];
  }
  BorderType = objc_msgSend(v6, "borderType");
  bookletPrinting = objc_msgSend(v6, "bookletStyle");
  MirrorPage = objc_msgSend(v6, "flipHorizontal");
  v10 = -90.0;
  if ((NUp & 0xFFFFFFFB) != 2)
    v10 = 0.0;
  RotationRequested = (NUp & 0xFFFFFFFB) == 2;
  PreferredRotation = LODWORD(v10);
  v11 = CGPDFDocumentCreateWithURL(v5);
  if (!v11)
    goto LABEL_20;
  v12 = v11;
  v13 = (void *)*MEMORY[0x1E0C9AE50];
  v14 = CGPDFDocumentAllowsPrinting(v11);
  v15 = (const void *)*MEMORY[0x1E0C9AE40];
  if (v14)
    v16 = v13;
  else
    v16 = (void *)*MEMORY[0x1E0C9AE40];
  value = v16;
  if (CGPDFDocumentAllowsCopying(v12))
    v17 = v13;
  else
    v17 = v15;
  objc_msgSend(v6, "pdfPassword");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    IsEncrypted = CGPDFDocumentIsEncrypted(v12);

    if (IsEncrypted)
    {
      objc_msgSend(v6, "pdfPassword");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGPDFDocumentUnlockWithPassword(v12, (const char *)objc_msgSend(v21, "cStringUsingEncoding:", 4));

    }
  }
  NumberOfPages = CGPDFDocumentGetNumberOfPages(v12);
  if (!NumberOfPages)
  {
    CGPDFDocumentRelease(v12);
LABEL_20:
    v30 = 0;
    goto LABEL_147;
  }
  Page = CGPDFDocumentGetPage(v12, 1uLL);
  v141 = v17;
  if (Page)
  {
    *(CGRect *)&v24 = CGPDFPageGetBoxRect(Page, kCGPDFMediaBox);
    v27 = v26;
    v29 = v28;
  }
  else
  {
    v27 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v29 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  mediaBox.origin.x = 0.0;
  mediaBox.origin.y = 0.0;
  objc_msgSend(v7, "unAdjustedPaperSize", v24, v25);
  v32 = v31;
  v34 = v33;
  objc_msgSend(v6, "scalingFactor");
  v36 = v32 * v35;
  mediaBox.size.width = v36;
  objc_msgSend(v6, "scalingFactor");
  v38 = v34 * v37;
  mediaBox.size.height = v34 * v37;
  objc_msgSend(v7, "unAdjustedPrintableRect");
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v145 = v7;
  objc_msgSend(v7, "printableRect");
  printableRect_0 = v47;
  printableRect_1 = v48;
  printableRect_2 = v49;
  printableRect_3 = v50;
  objc_msgSend(v6, "scalingFactor");
  *(double *)&printableRect_0 = v51 * *(double *)&printableRect_0;
  objc_msgSend(v6, "scalingFactor");
  *(double *)&printableRect_1 = v52 * *(double *)&printableRect_1;
  objc_msgSend(v6, "scalingFactor");
  *(double *)&printableRect_2 = v53 * *(double *)&printableRect_2;
  objc_msgSend(v6, "scalingFactor");
  *(double *)&printableRect_3 = v54 * *(double *)&printableRect_3;
  v140 = v5;
  if (NUp >= 2)
  {
    v55 = v27 > v29;
    v56 = (NUp & 0xFFFFFFFB) == 2;
    if (v55 == v56)
    {
      v58 = v38;
      v38 = v36;
    }
    else
    {
      mediaBox.size.width = v38;
      mediaBox.size.height = v36;
      v57 = v40 + v44;
      v40 = v42;
      v42 = v36 - v57;
      v58 = v36;
      v59 = v46;
      v46 = v44;
      v44 = v59;
    }
    v63 = 0;
    v64 = 0;
    v65 = v38;
    v162 = CGRectInset(*(CGRect *)(&v58 - 3), 18.0, 18.0);
    v157.origin.x = v40;
    v157.origin.y = v42;
    v157.size.width = v44;
    v157.size.height = v46;
    v158 = CGRectIntersection(v157, v162);
    width = v158.size.width;
    height = v158.size.height;
    v68 = v55 ^ v56;
    switch(NUp)
    {
      case 2:
        v69 = BorderType;
        v70 = bookletPrinting;
        v71 = v27;
        v72 = v29;
        v73 = v9;
        v74 = 2;
        if (v68)
        {
          v75 = 1;
          goto LABEL_43;
        }
        v75 = 2;
        v76 = 1;
        goto LABEL_44;
      case 3:
      case 5:
      case 7:
      case 8:
        goto LABEL_35;
      case 4:
        v69 = BorderType;
        v70 = bookletPrinting;
        v71 = v27;
        v72 = v29;
        v73 = v9;
        v74 = 4;
        v75 = 2;
        goto LABEL_43;
      case 6:
        v69 = BorderType;
        v70 = bookletPrinting;
        v71 = v27;
        v72 = v29;
        v73 = v9;
        v74 = 6;
        if (v68)
        {
          v75 = 2;
LABEL_40:
          v76 = 3;
        }
        else
        {
          v75 = 3;
LABEL_43:
          v76 = 2;
        }
        goto LABEL_44;
      case 9:
        v69 = BorderType;
        v70 = bookletPrinting;
        v71 = v27;
        v72 = v29;
        v73 = v9;
        v74 = 9;
        v75 = 3;
        goto LABEL_40;
      default:
        if (NUp == 16)
        {
          v69 = BorderType;
          v70 = bookletPrinting;
          v71 = v27;
          v72 = v29;
          v73 = v9;
          v74 = 16;
          v75 = 4;
          v76 = 4;
LABEL_44:
          v77 = NupManagerCreate(v74, v75, v76, v73, 90, v69, v70, 0.0, 0.0, v71, v72, v158.origin.x, v158.origin.y, width, height);
          if (v77)
          {
            if (NumberOfPages < 1)
            {
              v79 = 0;
            }
            else
            {
              v78 = 0;
              v79 = 0;
              do
              {
                if (check_range(++v78, NUp, 0, 0))
                  ++v79;
              }
              while (NumberOfPages != v78);
            }
            v146 = (uint64_t)v77;
            v80 = NupManagerNumSheetsForPageCount((uint64_t)v77, v79);
            v60 = (int *)malloc_type_calloc(NUp * (uint64_t)v80, 4uLL, 0x100004052888210uLL);
            if (NumberOfPages >= 1)
            {
              v81 = 0;
              v82 = 0;
              do
              {
                if (check_range(++v81, NUp, 0, 0))
                  v60[v82++] = v81;
              }
              while (NumberOfPages != v81);
            }
            if (bookletPrinting)
            {
              v83 = v60;
              if (NumberOfPages <= 0)
                v84 = -(-NumberOfPages & 3);
              else
                v84 = NumberOfPages & 3;
              if (v84)
                v85 = 4 - v84;
              else
                v85 = 0;
              v86 = v85 + NumberOfPages;
              if ((int)(v85 + NumberOfPages) < 0 != __OFADD__(v85, NumberOfPages))
                v87 = v85 + NumberOfPages + 3;
              else
                v87 = v85 + NumberOfPages;
              v88 = (char *)malloc_type_calloc(v86, 4uLL, 0x100004052888210uLL);
              v89 = (int *)v88;
              if (v86 >= 4)
              {
                v90 = v87 >> 2;
                v91 = &v83[NumberOfPages - 1 + (unint64_t)v85];
                v92 = v83 + 1;
                v93 = v88 + 8;
                do
                {
                  *(v93 - 2) = *v91;
                  *(v93 - 1) = *(v92 - 1);
                  v94 = *v92;
                  v92 += 2;
                  *v93 = v94;
                  v93[1] = *(v91 - 1);
                  v91 -= 2;
                  v93 += 4;
                  --v90;
                }
                while (v90);
              }
              if (v86 >= 0)
                v95 = v85 + NumberOfPages;
              else
                v95 = v86 + 1;
              v96 = v95 >> 1;
              if (NumberOfPages == 1)
                NumberOfPages = 1;
              else
                NumberOfPages = v96;
              free(v83);
              v61 = 0;
              v60 = v89;
            }
            else
            {
              v61 = 0;
              NumberOfPages = v80;
            }
            goto LABEL_79;
          }
        }
        else
        {
LABEL_35:
          printf("lite_print_redraw_pdf_nup: unsupported nup value %d\n", NUp);
        }
        v146 = 0;
        v60 = 0;
        v61 = 1;
        goto LABEL_79;
    }
  }
  v60 = 0;
  v61 = 1;
  if (v27 <= v29 || v36 > v38)
  {
    v146 = 0;
  }
  else
  {
    v146 = 0;
    v60 = 0;
    mediaBox.size.width = v38;
    mediaBox.size.height = v36;
    v62 = v46;
    v46 = v44;
    v44 = v62;
  }
LABEL_79:
  memset(out, 0, sizeof(out));
  uuid_generate_random(out);
  uuid_unparse(out, v154);
  v97 = (void *)MEMORY[0x1E0CB3940];
  NSTemporaryDirectory();
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v154);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "stringWithFormat:", CFSTR("%@/%@.pdf"), v98, v99);
  v100 = objc_claimAutoreleasedReturnValue();

  v139 = (void *)v100;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v100, 0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pdfPassword");
  v102 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v30 = v101;
  if (v30)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v7 = v145;
    url = v30;
    if (Mutable)
    {
      v104 = Mutable;
      v105 = (const void *)CGPDFDocumentCopyOutputIntents();
      if (v105)
      {
        v106 = v105;
        CFDictionarySetValue(v104, (const void *)*MEMORY[0x1E0C9DB60], v105);
        CFRelease(v106);
      }
      if (v102 && CFStringGetLength(v102) >= 1)
      {
        CFDictionaryAddValue(v104, (const void *)*MEMORY[0x1E0C9DB68], v102);
        CFDictionaryAddValue(v104, (const void *)*MEMORY[0x1E0C9DB98], v102);
      }
      CFDictionaryAddValue(v104, (const void *)*MEMORY[0x1E0C9DB20], value);
      CFDictionaryAddValue(v104, (const void *)*MEMORY[0x1E0C9DB18], v141);
      CFDictionarySetValue(v104, (const void *)*MEMORY[0x1E0C9DB40], CFSTR("pdftopdf filter"));
      Info = CGPDFDocumentGetInfo(v12);
      if (Info)
      {
        v108 = Info;
        string.a = 0.0;
        v152.a = 0.0;
        if (CGPDFDictionaryGetString(Info, "Title", (CGPDFStringRef *)&string))
        {
          v109 = CGPDFStringCopyTextString(*(CGPDFStringRef *)&string.a);
          if (v109)
          {
            v110 = v109;
            CFDictionarySetValue(v104, (const void *)*MEMORY[0x1E0C9DB88], v109);
            CFRelease(v110);
          }
        }
        if (CGPDFDictionaryGetString(v108, "Author", (CGPDFStringRef *)&string))
        {
          v111 = CGPDFStringCopyTextString(*(CGPDFStringRef *)&string.a);
          if (v111)
          {
            v112 = v111;
            CFDictionarySetValue(v104, (const void *)*MEMORY[0x1E0C9DB30], v111);
            CFRelease(v112);
          }
        }
        if (CGPDFDictionaryGetString(v108, "Subject", (CGPDFStringRef *)&string))
        {
          v113 = CGPDFStringCopyTextString(*(CGPDFStringRef *)&string.a);
          if (v113)
          {
            v114 = v113;
            CFDictionarySetValue(v104, (const void *)*MEMORY[0x1E0C9DB80], v113);
            CFRelease(v114);
          }
        }
        if (CGPDFDictionaryGetString(v108, "Keywords", (CGPDFStringRef *)&string))
        {
          v115 = CGPDFStringCopyTextString(*(CGPDFStringRef *)&string.a);
          if (v115)
          {
            v116 = v115;
            CFDictionarySetValue(v104, (const void *)*MEMORY[0x1E0C9DB50], v115);
            CFRelease(v116);
          }
        }
        else if (CGPDFDictionaryGetArray(v108, "AAPL:Keywords", (CGPDFArrayRef *)&v152) && *(_QWORD *)&v152.a)
        {
          CFDictionarySetValue(v104, (const void *)*MEMORY[0x1E0C9DB50], *(const void **)&v152.a);
        }
      }
      v30 = url;
      v117 = CGPDFContextCreateWithURL(url, &mediaBox, v104);
      CFRelease(v104);
    }
    else
    {
      v117 = CGPDFContextCreateWithURL(v30, &mediaBox, 0);
    }

    if (v117)
    {
      v142 = v40;
      valuea = v42;
      if (NumberOfPages >= 1)
      {
        v118 = 0;
        v119 = NumberOfPages;
        while (1)
        {
          v120 = v118 + 1;
          if (v61 && !check_range((int)v118 + 1, NUp, 0, 0))
            goto LABEL_138;
          v121 = NUp;
          v148 = mediaBox;
          CGContextBeginPage(v117, &v148);
          CGContextSaveGState(v117);
          if (MirrorPage)
          {
            string.b = 0.0;
            string.c = 0.0;
            string.a = -1.0;
            string.d = 1.0;
            *(_OWORD *)&string.tx = *(unint64_t *)&v148.size.width;
            CGContextConcatCTM(v117, &string);
          }
          if ((v61 & 1) != 0)
            break;
          NupManagerDrawASheet(v117, v146, v12, (uint64_t)&v60[v121 * (int)v118]);
LABEL_137:
          CGContextRestoreGState(v117);
          CGContextEndPage(v117);
LABEL_138:
          v118 = v120;
          if (v119 == v120)
            goto LABEL_143;
        }
        CGContextSaveGState(v117);
        v123 = v148.size.width;
        v122 = v148.size.height;
        v124 = CGPDFDocumentGetPage(v12, v118 + 1);
        if (!v124)
        {
LABEL_135:
          CGContextRestoreGState(v117);
          if (BorderType)
            Draw1UpBorders(v117, BorderType, v142, valuea, v44, v46);
          goto LABEL_137;
        }
        v125 = v124;
        v126 = v44;
        v127 = v46;
        BoxRect = CGPDFPageGetBoxRect(v124, kCGPDFCropBox);
        x = BoxRect.origin.x;
        y = BoxRect.origin.y;
        v130 = BoxRect.size.width;
        v131 = BoxRect.size.height;
        v132 = BoxRect.size.width - v122;
        if (BoxRect.size.width - v122 < 0.0)
          v132 = -(BoxRect.size.width - v122);
        if (v132 >= 2.0)
        {
          if (!MirrorPage)
            goto LABEL_140;
        }
        else
        {
          v133 = BoxRect.size.height - v123;
          if (BoxRect.size.height - v123 < 0.0)
            v133 = -(BoxRect.size.height - v123);
          if (v133 < 2.0 && BoxRect.size.width == v122)
          {
            memset(&string, 0, sizeof(string));
            CGAffineTransformMakeScale(&string, BoxRect.size.height / v122, BoxRect.size.height / v122);
            memset(&v152, 0, sizeof(v152));
            pdfPageToPaperTransformFilter(v125, (uint64_t)&v152, v130, v131);
            t1 = v152;
            t2 = string;
            CGAffineTransformConcat(&transform, &t1, &t2);
            v152 = transform;
            v160.origin.x = x;
            v160.origin.y = y;
            v160.size.width = v130;
            v160.size.height = v131;
            v161 = CGRectApplyAffineTransform(v160, &transform);
            CGContextClipToRect(v117, v161);
            transform = v152;
            CGContextConcatCTM(v117, &transform);
            goto LABEL_134;
          }
          if (!MirrorPage)
          {
            if (v133 < 2.0)
            {
              if (BoxRect.size.width == BoxRect.size.height && !RotationRequested)
                goto LABEL_132;
              goto LABEL_130;
            }
LABEL_140:
            if (RotationRequested != 1 || *(float *)&PreferredRotation >= 0.0)
              goto LABEL_132;
            CGContextTranslateCTM(v117, v123 * 0.5, v122 * 0.5);
            v136 = v117;
            v135 = 3.14159265;
            goto LABEL_131;
          }
        }
LABEL_130:
        CGContextTranslateCTM(v117, v123 * 0.5, v122 * 0.5);
        v135 = *(float *)&PreferredRotation * 3.14159265 / 180.0;
        v136 = v117;
LABEL_131:
        CGContextRotateCTM(v136, v135);
        CGContextTranslateCTM(v117, v130 * -0.5, v131 * -0.5);
LABEL_132:
        CGContextTranslateCTM(v117, -x, -y);
LABEL_134:
        CGContextDrawPDFPage(v117, v125);
        v46 = v127;
        v44 = v126;
        goto LABEL_135;
      }
LABEL_143:
      CGPDFContextClose(v117);
      CGContextRelease(v117);
      v7 = v145;
      v30 = url;
    }
  }
  else
  {

    v7 = v145;
  }
  if (v60)
    free(v60);
  CGPDFDocumentRelease(v12);

  v5 = v140;
LABEL_147:

  return v30;
}

CGFloat pdfPageToPaperTransformFilter@<D0>(CGPDFPage *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double MinX;
  double MinY;
  double v17;
  double v18;
  int v19;
  int v20;
  BOOL v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CGFloat result;
  CGAffineTransform v32;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGRect BoxRect;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  BoxRect = CGPDFPageGetBoxRect(a1, kCGPDFCropBox);
  x = BoxRect.origin.x;
  y = BoxRect.origin.y;
  width = BoxRect.size.width;
  height = BoxRect.size.height;
  v45 = CGPDFPageGetBoxRect(a1, kCGPDFMediaBox);
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  v41 = CGRectIntersection(v40, v45);
  v11 = v41.origin.x;
  v12 = v41.origin.y;
  v13 = v41.size.width;
  v14 = v41.size.height;
  MinX = CGRectGetMinX(v41);
  v42.origin.x = v11;
  v42.origin.y = v12;
  v42.size.width = v13;
  v42.size.height = v14;
  MinY = CGRectGetMinY(v42);
  v43.origin.x = v11;
  v43.origin.y = v12;
  v43.size.width = v13;
  v43.size.height = v14;
  v17 = CGRectGetWidth(v43);
  v44.origin.x = v11;
  v44.origin.y = v12;
  v44.size.width = v13;
  v44.size.height = v14;
  v18 = CGRectGetHeight(v44);
  memset(&v38, 0, sizeof(v38));
  CGAffineTransformMakeTranslation(&v38, -(MinX + v17 * 0.5), -(MinY + v18 * 0.5));
  v19 = CGPDFPageGetRotationAngle(a1) % 360;
  if (v19 >= 0)
    v20 = v19;
  else
    v20 = v19 + 360;
  memset(&v37, 0, sizeof(v37));
  CGAffineTransformMakeRotation(&v37, (double)v20 * -3.14159265 / 180.0);
  v21 = v20 == 90 || v20 == 270;
  if (v21)
    v22 = v18;
  else
    v22 = v17;
  if (v21)
    v23 = v17;
  else
    v23 = v18;
  v24 = a4 / v23;
  v25 = a3 / v22;
  if (v25 > 1.0)
    v25 = 1.0;
  if (v24 > 1.0)
    v24 = 1.0;
  memset(&v36.c, 0, 32);
  if (v25 >= v24)
    v25 = v24;
  *(_OWORD *)&v36.a = 0uLL;
  CGAffineTransformMakeScale(&v36, v25, v25);
  memset(&v35, 0, sizeof(v35));
  CGAffineTransformMakeTranslation(&v35, a3 * 0.5, a4 * 0.5);
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  t1 = v38;
  t2 = v37;
  CGAffineTransformConcat((CGAffineTransform *)a2, &t1, &t2);
  v26 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&t2.a = *(_OWORD *)a2;
  *(_OWORD *)&t2.c = v26;
  *(_OWORD *)&t2.tx = *(_OWORD *)(a2 + 32);
  v32 = v36;
  CGAffineTransformConcat(&t1, &t2, &v32);
  v27 = *(_OWORD *)&t1.c;
  *(_OWORD *)a2 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a2 + 16) = v27;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&t1.tx;
  v28 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&t2.a = *(_OWORD *)a2;
  *(_OWORD *)&t2.c = v28;
  *(_OWORD *)&t2.tx = *(_OWORD *)(a2 + 32);
  v32 = v35;
  CGAffineTransformConcat(&t1, &t2, &v32);
  v29 = *(_OWORD *)&t1.c;
  *(_OWORD *)a2 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a2 + 16) = v29;
  result = t1.tx;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&t1.tx;
  return result;
}

double getPDFPageBoxRect(CGPDFPage *a1)
{
  double v2;

  *(_QWORD *)&v2 = (unint64_t)CGPDFPageGetBoxRect(a1, kCGPDFCropBox);
  CGPDFPageGetRotationAngle(a1);
  return v2;
}

void getPDFPageProperties(__CFDictionary *a1, CGPDFPage *a2)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t i;
  CFDataRef v8;
  __int128 v9;
  __int128 v10;
  _QWORD v11[6];
  CGRect BoxRect;

  v11[5] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C9DB48];
  v11[0] = *MEMORY[0x1E0C9DB58];
  v11[1] = v2;
  v3 = *MEMORY[0x1E0C9DB90];
  v11[2] = *MEMORY[0x1E0C9DB38];
  v11[3] = v3;
  v11[4] = *MEMORY[0x1E0C9DB28];
  v4 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *MEMORY[0x1E0C9D648];
  v10 = v4;
  if (a1 && a2)
  {
    CFDictionaryRemoveAllValues(a1);
    for (i = 0; i != 5; ++i)
    {
      BoxRect = CGPDFPageGetBoxRect(a2, (CGPDFBox)i);
      *(CGFloat *)&v9 = BoxRect.origin.x;
      *((_QWORD *)&v9 + 1) = *(_QWORD *)&BoxRect.origin.y;
      *(CGFloat *)&v10 = BoxRect.size.width;
      *((_QWORD *)&v10 + 1) = *(_QWORD *)&BoxRect.size.height;
      v8 = CFDataCreate(0, (const UInt8 *)&v9, 32);
      CFDictionarySetValue(a1, (const void *)v11[i], v8);
      CFRelease(v8);
    }
  }
}

void sub_1D818C384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_1D818C4EC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D818CDC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
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

void sub_1D818E760(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

Class __getUIActivityViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!ShareSheetLibraryCore_frameworkLibrary)
  {
    ShareSheetLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ShareSheetLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getUIActivityViewControllerClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("UIActivityViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getUIActivityViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1D818F674(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D818F7C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D818F88C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t GetStartPageFromFormatter(void *a1)
{
  id v1;
  uint64_t v2;
  _QWORD v4[4];
  id v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v1 = a1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (pthread_main_np() == 1 || !objc_msgSend(v1, "requiresMainThread"))
  {
    v2 = objc_msgSend(v1, "startPage");
    v8[3] = v2;
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __GetStartPageFromFormatter_block_invoke;
    v4[3] = &unk_1E9D97AC0;
    v6 = &v7;
    v5 = v1;
    dispatch_sync(MEMORY[0x1E0C80D38], v4);

    v2 = v8[3];
  }
  _Block_object_dispose(&v7, 8);

  return v2;
}

void sub_1D818FADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t GetPageCountFromFormatter(void *a1)
{
  id v1;
  uint64_t v2;
  _QWORD v4[4];
  id v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v1 = a1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (pthread_main_np() == 1 || !objc_msgSend(v1, "requiresMainThread"))
  {
    v2 = objc_msgSend(v1, "pageCount");
    v8[3] = v2;
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __GetPageCountFromFormatter_block_invoke;
    v4[3] = &unk_1E9D97AC0;
    v6 = &v7;
    v5 = v1;
    dispatch_sync(MEMORY[0x1E0C80D38], v4);

    v2 = v8[3];
  }
  _Block_object_dispose(&v7, 8);

  return v2;
}

void sub_1D818FBD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D818FC4C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t SendDataToPrinter(void *a1, uint64_t a2, uint64_t a3)
{
  if (objc_msgSend(a1, "sendData:ofLength:", a2, a3))
    return 0;
  else
    return a3;
}

void ReleasePrinter(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

id SummaryForRange(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v43;
  id obj;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count") != 1)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v8 = v1;
    v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v12)
    {
      v13 = v12;
      v43 = v1;
      obj = v8;
      v14 = 0;
      v45 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          v16 = v2;
          if (*(_QWORD *)v47 != v45)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v17, "rangeValue");
          v19 = v18;
          objc_msgSend(v17, "rangeValue");
          v21 = v20;
          v22 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v21 == 1)
          {
            objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("%@"), CFSTR("%@"), CFSTR("Localizable"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            LocalizedUnsignedInteger(objc_msgSend(v17, "rangeValue") + 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "stringWithFormat:", v25, v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("%@-%@"), CFSTR("%@-%@"), CFSTR("Localizable"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            LocalizedUnsignedInteger(objc_msgSend(v17, "rangeValue") + 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v17, "rangeValue");
            LocalizedUnsignedInteger(v28 + v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "stringWithFormat:", v25, v26, v30);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v2 = v16;
          if (v27)
          {
            if (objc_msgSend(v16, "length"))
            {
              objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR(", "), CFSTR(", "), CFSTR("Localizable"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "appendString:", v32);

            }
            objc_msgSend(v16, "appendString:", v27);
          }
          v14 += v19;

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      }
      while (v13);

      v1 = v43;
      if (v14 == 1)
        goto LABEL_19;
LABEL_22:
      v33 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      v36 = CFSTR("Pages %@");
      goto LABEL_23;
    }
LABEL_21:

    goto LABEL_22;
  }
  objc_msgSend(v1, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeValue");
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = v4 + 1;
  if (v6 != 1)
  {
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%@-%@"), CFSTR("%@-%@"), CFSTR("Localizable"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    LocalizedUnsignedInteger(v4 + 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    LocalizedUnsignedInteger(v4 + v6);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendFormat:", v37, v38, v39);

    goto LABEL_21;
  }
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%@"), CFSTR("%@"), CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LocalizedUnsignedInteger(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", v10, v11);

LABEL_19:
  v33 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  v36 = CFSTR("Page %@");
LABEL_23:
  objc_msgSend(v34, "localizedStringForKey:value:table:", v36, v36, CFSTR("Localizable"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "stringWithFormat:", v40, v2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

void sub_1D819BB9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D819C234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double *NupManagerCreate(int a1, int a2, int a3, int a4, int a5, int a6, int a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15)
{
  double *v30;
  double *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  int v38;

  if (a3 * a2 != a1)
  {
    printf("The pages per sheet value is invalid.");
    exit(1);
  }
  v30 = (double *)malloc_type_calloc(0x80uLL, 1uLL, 0x27AF0D96uLL);
  v31 = v30;
  *v30 = a8;
  v30[1] = a9;
  v30[2] = a10;
  v30[3] = a11;
  v30[4] = a12;
  v30[5] = a13;
  v30[6] = a14;
  v30[7] = a15;
  *((_DWORD *)v30 + 16) = a1;
  *((_DWORD *)v30 + 17) = a2;
  *((_DWORD *)v30 + 18) = a3;
  *((_DWORD *)v30 + 19) = a4;
  *((_DWORD *)v30 + 20) = a5;
  *((_DWORD *)v30 + 22) = a6;
  *((_DWORD *)v30 + 31) = a7;
  v32 = -a12;
  if (!a7)
    v32 = -7.5;
  v33 = a14 / (double)a3 + v32;
  v34 = -a13;
  if (!a7)
    v34 = -7.5;
  v35 = a15 / (double)a2 + v34;
  v30[12] = v33;
  v30[13] = v35;
  v30[14] = a10 / a11;
  if ((v33 <= v35 || a10 >= a11) && (v35 <= v33 || a10 <= a11))
  {
    if (a5 != 180)
    {
      *((_DWORD *)v30 + 30) = 0;
      return v31;
    }
    *((_DWORD *)v30 + 30) = 1;
    goto LABEL_21;
  }
  *((_DWORD *)v30 + 30) = 1;
  v30[14] = 1.0 / (a10 / a11);
  if (a5 != -90)
  {
    if (a5 != 180)
    {
      if (a5 == 90)
      {
        switch(a4)
        {
          case 1:
            goto LABEL_32;
          case 2:
            goto LABEL_25;
          case 3:
            goto LABEL_23;
          case 4:
            goto LABEL_34;
          case 5:
            goto LABEL_28;
          case 6:
            goto LABEL_27;
          case 7:
            goto LABEL_30;
          case 8:
            goto LABEL_26;
          default:
            fprintf((FILE *)*MEMORY[0x1E0C80C10], "DEBUG: Unhandled layout direction (%d) using kPKLayoutLeftRightTopBottom\n", a4);
            goto LABEL_32;
        }
      }
      return v31;
    }
LABEL_21:
    switch(a4)
    {
      case 1:
        goto LABEL_30;
      case 2:
        goto LABEL_26;
      case 3:
        goto LABEL_28;
      case 4:
        goto LABEL_27;
      case 5:
        goto LABEL_25;
      case 6:
        goto LABEL_32;
      case 7:
        goto LABEL_34;
      case 8:
        goto LABEL_23;
      default:
        fprintf((FILE *)*MEMORY[0x1E0C80C10], "DEBUG: Unhandled layout direction (%d) using kPKLayoutLeftRightTopBottom\n", a4);
        goto LABEL_30;
    }
  }
  switch(a4)
  {
    case 1:
      goto LABEL_34;
    case 2:
LABEL_23:
      v38 = 5;
      break;
    case 3:
LABEL_25:
      v38 = 8;
      break;
    case 4:
LABEL_32:
      v38 = 7;
      break;
    case 5:
LABEL_26:
      v38 = 3;
      break;
    case 6:
LABEL_30:
      v38 = 4;
      break;
    case 7:
LABEL_27:
      v38 = 1;
      break;
    case 8:
LABEL_28:
      v38 = 2;
      break;
    default:
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "DEBUG: Unhandled layout direction (%d) using kPKLayoutLeftRightTopBottom\n", a4);
LABEL_34:
      v38 = 6;
      break;
  }
  *((_DWORD *)v31 + 19) = v38;
  return v31;
}

uint64_t NupManagerNumSheetsForPageCount(uint64_t a1, int a2)
{
  return ((a2 + *(_DWORD *)(a1 + 64) - 1) / *(_DWORD *)(a1 + 64));
}

void NupManagerDrawASheet(CGContext *a1, uint64_t a2, CGPDFDocumentRef document, uint64_t a4)
{
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int *v25;
  int v26;
  int v28;
  int v29;
  int v30;
  int v31;

  v7 = *(double *)(a2 + 96);
  v8 = *(double *)(a2 + 104);
  v9 = *(double *)(a2 + 112);
  if (v7 / v8 <= v9)
    v8 = v7 / v9;
  else
    v7 = v8 * v9;
  if (*(_DWORD *)(a2 + 120))
    v10 = (double)*(int *)(a2 + 80);
  else
    v10 = 0.0;
  switch(*(_DWORD *)(a2 + 76))
  {
    case 1:
      goto LABEL_10;
    case 2:
      v11 = 0;
      v12 = 0;
      v13 = *(_DWORD *)(a2 + 68);
      v14 = *(_DWORD *)(a2 + 72);
      v30 = 1;
      v15 = 1;
      goto LABEL_14;
    case 3:
      v11 = *(_DWORD *)(a2 + 72) - 1;
      v12 = *(_DWORD *)(a2 + 68) - 1;
      v30 = -1;
      v13 = -1;
      v15 = -1;
      goto LABEL_13;
    case 4:
      v12 = 0;
      v13 = *(_DWORD *)(a2 + 68);
      v11 = *(_DWORD *)(a2 + 72) - 1;
      v15 = -1;
      v30 = 1;
LABEL_13:
      v14 = -1;
      goto LABEL_14;
    case 5:
      v19 = 0;
      v20 = *(_DWORD *)(a2 + 72);
      v21 = *(_DWORD *)(a2 + 68) - 1;
      v31 = 1;
      v22 = -1;
      v23 = -1;
      goto LABEL_26;
    case 6:
      v19 = *(_DWORD *)(a2 + 72) - 1;
      v21 = *(_DWORD *)(a2 + 68) - 1;
      v22 = -1;
      v23 = -1;
      v31 = -1;
      goto LABEL_25;
    case 7:
      v21 = 0;
      v19 = 0;
      v23 = *(_DWORD *)(a2 + 68);
      v20 = *(_DWORD *)(a2 + 72);
      v22 = 1;
      v31 = 1;
      goto LABEL_26;
    case 8:
      v21 = 0;
      v23 = *(_DWORD *)(a2 + 68);
      v19 = *(_DWORD *)(a2 + 72) - 1;
      v31 = -1;
      v22 = 1;
LABEL_25:
      v20 = -1;
LABEL_26:
      if (v19 != v20)
      {
        v24 = 0;
        v29 = v21;
        do
        {
          if (v21 != v23)
          {
            v25 = (int *)(a4 + 4 * v24);
            do
            {
              v26 = *v25++;
              NupDrawAtRowCol(a1, a2, v21, v19, document, v26, 0.0, 0.0, v7, v8, v10);
              v21 += v22;
              ++v24;
            }
            while (v23 != v21);
          }
          v21 = v29;
          v19 += v31;
        }
        while (v19 != v20);
      }
      break;
    default:
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "DEBUG: Unhandled layout direction (%d) using kPKLayoutLeftRightTopBottom\n", *(_DWORD *)(a2 + 76));
LABEL_10:
      v11 = 0;
      v14 = *(_DWORD *)(a2 + 72);
      v12 = *(_DWORD *)(a2 + 68) - 1;
      v15 = 1;
      v30 = -1;
      v13 = -1;
LABEL_14:
      if (v12 != v13)
      {
        v16 = 0;
        v28 = v11;
        do
        {
          if (v11 != v14)
          {
            v17 = (int *)(a4 + 4 * v16);
            do
            {
              v18 = *v17++;
              NupDrawAtRowCol(a1, a2, v12, v11, document, v18, 0.0, 0.0, v7, v8, v10);
              v11 += v15;
              ++v16;
            }
            while (v14 != v11);
          }
          v11 = v28;
          v12 += v30;
        }
        while (v12 != v13);
      }
      break;
  }
}

void NupDrawAtRowCol(CGContext *a1, uint64_t a2, int a3, int a4, CGPDFDocumentRef document, int a6, double a7, double a8, CGFloat a9, CGFloat a10, double a11)
{
  CGPDFPage *Page;
  CGPDFPage *v20;
  double width;
  double height;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  float v29;
  float v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  float v36;
  float v37;
  double v38;
  float v39;
  int v40;
  double v41;
  CGFloat v42;
  double v43;
  double y;
  double x;
  CGRect BoxRect;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  Page = CGPDFDocumentGetPage(document, a6);
  if (a6)
  {
    v20 = Page;
    if (Page)
    {
      BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFMediaBox);
      width = BoxRect.size.width;
      height = BoxRect.size.height;
      v23 = (double)a4;
      v24 = (double)a3;
      v26 = *(double *)(a2 + 96);
      v25 = *(double *)(a2 + 104);
      y = BoxRect.origin.y;
      x = BoxRect.origin.x;
      if (*(_DWORD *)(a2 + 124))
      {
        v27 = *(double *)(a2 + 32);
        v28 = *(double *)(a2 + 40);
        v29 = v27 + v23 * (v26 + v27) + v23 * v27;
        v30 = v28 + v24 * (v25 + v28) + v24 * v28;
        v31 = v29;
        v32 = v30;
        v33 = (v26 - a9) * 0.5 + v29;
        v34 = (v26 + v27 - a9) * 0.5 + v29;
        v35 = (v25 - a10) * 0.5 + v30;
        if (v26 > v25)
          v33 = v34;
        v43 = v33;
        if (v26 <= v25)
          v35 = (v25 + v28 - a10) * 0.5 + v32;
      }
      else
      {
        v36 = *(double *)(a2 + 32) + v23 * (v26 + 7.5) + 3.75;
        v37 = *(double *)(a2 + 40) + v24 * (v25 + 7.5) + 3.75;
        v31 = v36;
        v43 = v26 * 0.5 + v36 - a9 * 0.5;
        v32 = v37;
        v35 = v25 * 0.5 + v37 - a10 * 0.5;
      }
      v42 = v35;
      v38 = *(double *)(a2 + 16) / width;
      if (v38 >= *(double *)(a2 + 24) / height)
        v38 = *(double *)(a2 + 24) / height;
      v39 = v38;
      CGContextSaveGState(a1);
      CGContextTranslateCTM(a1, *(double *)(a2 + 96) * 0.5 + v31, *(double *)(a2 + 104) * 0.5 + v32);
      CGContextScaleCTM(a1, a9, a10);
      CGContextRotateCTM(a1, a11 * 3.14159265 / 180.0);
      CGContextScaleCTM(a1, 1.0 / *(double *)(a2 + 16), 1.0 / *(double *)(a2 + 24));
      CGContextScaleCTM(a1, v39, v39);
      CGContextTranslateCTM(a1, width * -0.5, height * -0.5);
      CGContextTranslateCTM(a1, -x, -y);
      v47.origin.x = x;
      v47.origin.y = y;
      v47.size.width = width;
      v47.size.height = height;
      CGContextClipToRect(a1, v47);
      CGContextDrawPDFPage(a1, v20);
      CGContextRestoreGState(a1);
      v40 = *(_DWORD *)(a2 + 88);
      if (v40)
      {
        v41 = 0.24;
        if ((v40 & 0xFFFFFFFD) != 1)
          v41 = 0.5;
        CGContextSetLineWidth(a1, v41);
        CGContextSetGrayStrokeColor(a1, 0.0, 1.0);
        v48.origin.y = v42;
        v48.origin.x = v43;
        v48.size.width = a9;
        v48.size.height = a10;
        v49 = CGRectInset(v48, -2.25, -2.25);
        CGContextStrokeRect(a1, v49);
        if ((v40 - 3) <= 1)
        {
          v50.origin.y = v42;
          v50.origin.x = v43;
          v50.size.width = a9;
          v50.size.height = a10;
          v51 = CGRectInset(v50, -0.25, -0.25);
          CGContextStrokeRect(a1, v51);
        }
      }
    }
  }
}

void Draw1UpBorders(CGContext *a1, int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  if (a2)
  {
    v12 = 0.24;
    if ((a2 & 0xFFFFFFFD) != 1)
      v12 = 0.5;
    CGContextSetLineWidth(a1, v12);
    CGContextSetGrayStrokeColor(a1, 0.0, 1.0);
    v13.origin.x = a3;
    v13.origin.y = a4;
    v13.size.width = a5;
    v13.size.height = a6;
    v14 = CGRectInset(v13, 2.25, 2.25);
    CGContextStrokeRect(a1, v14);
    if ((a2 - 3) <= 1)
    {
      v15.origin.x = a3;
      v15.origin.y = a4;
      v15.size.width = a5;
      v15.size.height = a6;
      v16 = CGRectInset(v15, 4.25, 4.25);
      CGContextStrokeRect(a1, v16);
    }
  }
}

uint64_t check_range(int a1, int a2, char *__str, char *a4)
{
  uint64_t result;
  int v9;
  const char *v10;
  int v11;
  int v12;
  char *__endptr;

  if (!a1)
    return 1;
  if (a4
    && (!strcasecmp(a4, "even") && (a1 - 1) % (2 * a2) < a2 || !strcasecmp(a4, "odd") && (a1 - 1) % (2 * a2) >= a2))
  {
    return 0;
  }
  if (__str)
  {
    while (1)
    {
      __endptr = __str;
      result = *__str;
      if ((_DWORD)result == 45)
        break;
      if (!*__str)
        return result;
      v9 = strtol(__str, &__endptr, 10);
      if (*__endptr != 45)
      {
        v12 = v9;
        goto LABEL_16;
      }
      v11 = __endptr[1];
      v10 = ++__endptr;
      if ((v11 - 48) <= 9)
        goto LABEL_14;
      v12 = 0xFFFF;
LABEL_16:
      if (v9 <= a1 && v12 >= a1)
        return 1;
      __str = __endptr + 1;
      if (*__endptr != 44)
        return 0;
    }
    v10 = __str + 1;
    __endptr = __str + 1;
    v9 = 1;
LABEL_14:
    v12 = strtol(v10, &__endptr, 10);
    goto LABEL_16;
  }
  return 1;
}

size_t PDFHasAnnotations(CGPDFDocument *a1)
{
  size_t result;
  size_t v3;
  size_t v4;

  result = CGPDFDocumentGetNumberOfPages(a1);
  if (result)
  {
    v3 = result;
    v4 = 1;
    while (!CGPDFDocumentGetPage(a1, v4) || !CGPDFPageGetAnnotationCount())
    {
      if (++v4 > v3)
        return 0;
    }
    return 1;
  }
  return result;
}

id LocalizedInteger(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringFromNumber:numberStyle:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id LocalizedUnsignedInteger(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringFromNumber:numberStyle:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void PMAppendToSummaryString(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a1;
  v3 = a2;
  if (v6)
  {
    if (objc_msgSend(v3, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR(" • "), CFSTR(" • "), CFSTR("Localizable"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v5);

    }
    objc_msgSend(v3, "appendString:", v6);
  }

}

void eraseCGBitmapContext(CGContext *a1)
{
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;
  CGFloat Width;
  CGRect v5;

  CGContextSaveGState(a1);
  ColorSpace = CGBitmapContextGetColorSpace(a1);
  if (ColorSpace)
  {
    Model = CGColorSpaceGetModel(ColorSpace);
    if (Model == kCGColorSpaceModelCMYK)
    {
      CGContextSetCMYKFillColor(a1, 0.0, 0.0, 0.0, 0.0, 1.0);
    }
    else if (Model)
    {
      CGContextSetRGBFillColor(a1, 1.0, 1.0, 1.0, 1.0);
    }
    else
    {
      CGContextSetGrayFillColor(a1, 1.0, 1.0);
    }
    CGContextSetCTM();
    Width = (double)CGBitmapContextGetWidth(a1);
    v5.size.height = (double)CGBitmapContextGetHeight(a1);
    v5.origin.x = 0.0;
    v5.origin.y = 0.0;
    v5.size.width = Width;
    CGContextFillRect(a1, v5);
  }
  CGContextRestoreGState(a1);
}

CGFloat pdfPageToPaperTransform@<D0>(CGPDFPage *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double MinX;
  double MinY;
  double v17;
  double v18;
  int v19;
  int v20;
  BOOL v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CGFloat result;
  CGAffineTransform v32;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGRect BoxRect;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  BoxRect = CGPDFPageGetBoxRect(a1, kCGPDFCropBox);
  x = BoxRect.origin.x;
  y = BoxRect.origin.y;
  width = BoxRect.size.width;
  height = BoxRect.size.height;
  v45 = CGPDFPageGetBoxRect(a1, kCGPDFMediaBox);
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  v41 = CGRectIntersection(v40, v45);
  v11 = v41.origin.x;
  v12 = v41.origin.y;
  v13 = v41.size.width;
  v14 = v41.size.height;
  MinX = CGRectGetMinX(v41);
  v42.origin.x = v11;
  v42.origin.y = v12;
  v42.size.width = v13;
  v42.size.height = v14;
  MinY = CGRectGetMinY(v42);
  v43.origin.x = v11;
  v43.origin.y = v12;
  v43.size.width = v13;
  v43.size.height = v14;
  v17 = CGRectGetWidth(v43);
  v44.origin.x = v11;
  v44.origin.y = v12;
  v44.size.width = v13;
  v44.size.height = v14;
  v18 = CGRectGetHeight(v44);
  memset(&v38, 0, sizeof(v38));
  CGAffineTransformMakeTranslation(&v38, -(MinX + v17 * 0.5), -(MinY + v18 * 0.5));
  v19 = CGPDFPageGetRotationAngle(a1) % 360;
  if (v19 >= 0)
    v20 = v19;
  else
    v20 = v19 + 360;
  memset(&v37, 0, sizeof(v37));
  CGAffineTransformMakeRotation(&v37, (double)v20 * -3.14159265 / 180.0);
  v21 = v20 == 90 || v20 == 270;
  if (v21)
    v22 = v18;
  else
    v22 = v17;
  if (v21)
    v23 = v17;
  else
    v23 = v18;
  v24 = a3 / v22;
  v25 = a4 / v23;
  memset(&v36.c, 0, 32);
  if (v24 >= v25)
    v24 = v25;
  *(_OWORD *)&v36.a = 0uLL;
  CGAffineTransformMakeScale(&v36, v24, v24);
  memset(&v35, 0, sizeof(v35));
  CGAffineTransformMakeTranslation(&v35, a3 * 0.5, a4 * 0.5);
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  t1 = v38;
  t2 = v37;
  CGAffineTransformConcat((CGAffineTransform *)a2, &t1, &t2);
  v26 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&t2.a = *(_OWORD *)a2;
  *(_OWORD *)&t2.c = v26;
  *(_OWORD *)&t2.tx = *(_OWORD *)(a2 + 32);
  v32 = v36;
  CGAffineTransformConcat(&t1, &t2, &v32);
  v27 = *(_OWORD *)&t1.c;
  *(_OWORD *)a2 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a2 + 16) = v27;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&t1.tx;
  v28 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&t2.a = *(_OWORD *)a2;
  *(_OWORD *)&t2.c = v28;
  *(_OWORD *)&t2.tx = *(_OWORD *)(a2 + 32);
  v32 = v35;
  CGAffineTransformConcat(&t1, &t2, &v32);
  v29 = *(_OWORD *)&t1.c;
  *(_OWORD *)a2 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a2 + 16) = v29;
  result = t1.tx;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&t1.tx;
  return result;
}

void drawPDFPageToCGContext(CGPDFPage *a1, CGContext *a2, void *a3, int a4, double a5, double a6)
{
  id v9;
  double width;
  double height;
  int v12;
  int v13;
  BOOL v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL v26;
  BOOL v27;
  double v28;
  CGFloat y;
  CGFloat x;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v34;
  CGAffineTransform transform;
  CGAffineTransform v36;
  CGRect BoxRect;
  CGRect v38;
  CGRect v39;

  if (a1 && a2)
  {
    v9 = a3;
    BoxRect = CGPDFPageGetBoxRect(a1, kCGPDFCropBox);
    y = BoxRect.origin.y;
    x = BoxRect.origin.x;
    width = BoxRect.size.width;
    height = BoxRect.size.height;
    v12 = CGPDFPageGetRotationAngle(a1) % 360;
    v13 = v12 + (v12 < 0 ? 0x168 : 0);
    v14 = v13 == 90 || v13 == 270;
    if (v14)
      v15 = width;
    else
      v15 = height;
    if (v14)
      v16 = height;
    else
      v16 = width;
    objc_msgSend(v9, "paperSize");
    v18 = v17;
    v20 = v19;
    objc_msgSend(v9, "paperSize");
    v22 = v21;
    objc_msgSend(v9, "paperSize");
    v24 = v23;

    if (vabdd_f64(v15, v16) > 1.0
      && ((v25 = v22 / v24, v16 / v15 < 1.0) ? (v26 = v25 <= 1.0) : (v26 = 1),
          !v26 || (v16 / v15 > 1.0 ? (v27 = v25 < 1.0) : (v27 = 0), v27)))
    {
      v28 = v18;
      v18 = v20;
    }
    else
    {
      v28 = v20;
    }
    if (v18 != 0.0 && v28 != 0.0)
    {
      memset(&v36, 0, sizeof(v36));
      pdfPageToPaperTransform(a1, (uint64_t)&v36, v18, v28);
      if (a6 != 0.0)
      {
        memset(&transform, 0, sizeof(transform));
        CGAffineTransformMakeScale(&transform, a6 / v28, a6 / v28);
        t1 = v36;
        t2 = transform;
        CGAffineTransformConcat(&v34, &t1, &t2);
        v36 = v34;
      }
      transform = v36;
      v38.origin.y = y;
      v38.origin.x = x;
      v38.size.width = width;
      v38.size.height = height;
      v39 = CGRectApplyAffineTransform(v38, &transform);
      CGContextClipToRect(a2, v39);
      transform = v36;
      CGContextConcatCTM(a2, &transform);
      if (a4)
        CGContextDrawPDFPageWithAnnotations();
      else
        CGContextDrawPDFPage(a2, a1);
    }
  }
}

uint64_t _imageRotationTransfrom@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v4;
  __int128 v5;

  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  switch(result)
  {
    case 2:
      *(_QWORD *)a2 = 0xBFF0000000000000;
      *(_QWORD *)(a2 + 8) = 0;
      *(_QWORD *)(a2 + 16) = 0;
      *(_QWORD *)(a2 + 24) = 0x3FF0000000000000;
      goto LABEL_12;
    case 3:
      *(_QWORD *)a2 = 0xBFF0000000000000;
      *(_QWORD *)(a2 + 8) = 0;
      *(_QWORD *)(a2 + 16) = 0;
      *(_QWORD *)(a2 + 24) = 0xBFF0000000000000;
      goto LABEL_7;
    case 4:
      *(_QWORD *)a2 = 0x3FF0000000000000;
      *(_QWORD *)(a2 + 8) = 0;
      *(_QWORD *)(a2 + 16) = 0;
      *(_QWORD *)(a2 + 24) = 0xBFF0000000000000;
      goto LABEL_9;
    case 5:
      __asm { FMOV            V2.2D, #-1.0; jumptable 00000001D819F628 case 5 }
      *(_OWORD *)(a2 + 8) = _Q2;
LABEL_7:
      *(double *)(a2 + 32) = a3;
      *(double *)(a2 + 40) = a4;
      break;
    case 6:
      *(_OWORD *)(a2 + 8) = xmmword_1D81AB430;
      *(_QWORD *)(a2 + 24) = 0;
      *(_QWORD *)(a2 + 32) = 0;
LABEL_9:
      *(double *)(a2 + 40) = a4;
      break;
    case 7:
      __asm { FMOV            V0.2D, #1.0; jumptable 00000001D819F628 case 7 }
      *(_OWORD *)(a2 + 8) = _Q0;
      *(_QWORD *)(a2 + 32) = 0;
      *(_QWORD *)(a2 + 40) = 0;
      *(_QWORD *)(a2 + 24) = 0;
      break;
    case 8:
      *(_OWORD *)(a2 + 8) = xmmword_1D81AB440;
LABEL_12:
      *(double *)(a2 + 32) = a3;
      break;
    default:
      v4 = MEMORY[0x1E0C9BAA8];
      v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)a2 = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)(a2 + 16) = v5;
      *(_OWORD *)(a2 + 32) = *(_OWORD *)(v4 + 32);
      break;
  }
  return result;
}

CGFloat _cgImageToPaperTransform@<D0>(uint64_t a1@<X1>, int a2@<W2>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, CGFloat a6@<D2>, CGFloat a7@<D3>, CGFloat a8@<D4>, CGFloat a9@<D5>)
{
  double v14;
  double v16;
  double v17;
  uint64_t v18;
  CGFloat *v19;
  CGFloat *v20;
  CGFloat *v21;
  CGFloat *v22;
  double MinX;
  double MinY;
  double Width;
  double Height;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CGFloat result;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGAffineTransform v40;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v14 = a4;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)a3 = 0u;
  memset(&v45, 0, sizeof(v45));
  if (a2)
    a4 = a5;
  v16 = a4 * -0.5;
  if (a2)
    v17 = v14;
  else
    v17 = a5;
  CGAffineTransformMakeTranslation(&v45, v16, v17 * -0.5);
  v18 = a1 - 2;
  if ((unint64_t)(a1 - 2) >= 7)
  {
    v19 = (CGFloat *)MEMORY[0x1E0C9BAA8];
    v22 = (CGFloat *)(MEMORY[0x1E0C9BAA8] + 24);
    v21 = (CGFloat *)(MEMORY[0x1E0C9BAA8] + 16);
    v20 = (CGFloat *)(MEMORY[0x1E0C9BAA8] + 8);
    v37 = *(double *)(MEMORY[0x1E0C9BAA8] + 40);
    v38 = *(double *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  else
  {
    v19 = (CGFloat *)((char *)&unk_1D81AB458 + 8 * v18);
    v20 = (CGFloat *)((char *)&unk_1D81AB490 + 8 * v18);
    v21 = (CGFloat *)((char *)&unk_1D81AB4C8 + 8 * v18);
    v37 = 0.0;
    v38 = 0.0;
    v22 = (CGFloat *)((char *)&unk_1D81AB500 + 8 * v18);
  }
  v35 = *v21;
  v36 = *v22;
  v33 = *v19;
  v34 = *v20;
  v46.origin.x = a6;
  v46.origin.y = a7;
  v46.size.width = a8;
  v46.size.height = a9;
  MinX = CGRectGetMinX(v46);
  v47.origin.x = a6;
  v47.origin.y = a7;
  v47.size.width = a8;
  v47.size.height = a9;
  MinY = CGRectGetMinY(v47);
  v48.origin.x = a6;
  v48.origin.y = a7;
  v48.size.width = a8;
  v48.size.height = a9;
  Width = CGRectGetWidth(v48);
  v49.origin.x = a6;
  v49.origin.y = a7;
  v49.size.width = a8;
  v49.size.height = a9;
  Height = CGRectGetHeight(v49);
  v27 = Width / v14;
  memset(&v44.c, 0, 32);
  if (Width / v14 >= Height / a5)
    v27 = Height / a5;
  *(_OWORD *)&v44.a = 0uLL;
  CGAffineTransformMakeScale(&v44, v27, v27);
  memset(&v43, 0, sizeof(v43));
  CGAffineTransformMakeTranslation(&v43, MinX + Width * 0.5, MinY + Height * 0.5);
  t1 = v45;
  t2.a = v33;
  t2.b = v34;
  t2.c = v35;
  t2.d = v36;
  t2.tx = v38;
  t2.ty = v37;
  CGAffineTransformConcat((CGAffineTransform *)a3, &t1, &t2);
  v28 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)&t2.a = *(_OWORD *)a3;
  *(_OWORD *)&t2.c = v28;
  *(_OWORD *)&t2.tx = *(_OWORD *)(a3 + 32);
  v40 = v44;
  CGAffineTransformConcat(&t1, &t2, &v40);
  v29 = *(_OWORD *)&t1.c;
  *(_OWORD *)a3 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a3 + 16) = v29;
  *(_OWORD *)(a3 + 32) = *(_OWORD *)&t1.tx;
  v30 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)&t2.a = *(_OWORD *)a3;
  *(_OWORD *)&t2.c = v30;
  *(_OWORD *)&t2.tx = *(_OWORD *)(a3 + 32);
  v40 = v43;
  CGAffineTransformConcat(&t1, &t2, &v40);
  v31 = *(_OWORD *)&t1.c;
  *(_OWORD *)a3 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a3 + 16) = v31;
  result = t1.tx;
  *(_OWORD *)(a3 + 32) = *(_OWORD *)&t1.tx;
  return result;
}

void drawCGImageToCGContext(CGImage *a1, CGContext *a2, uint64_t a3, int a4, int a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  double v14;
  double v18;
  double v19;
  double v20;
  double v21;
  double Width;
  size_t Height;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGAffineTransform v38;
  CGRect v39;

  v14 = a7;
  v18 = a6 - (a8 + a10);
  v19 = a7 - (a9 + a11);
  if (a8 <= v18)
    v20 = v18;
  else
    v20 = a8;
  if (v19 <= a9)
    v21 = a9;
  else
    v21 = v19;
  Width = (double)CGImageGetWidth(a1);
  Height = CGImageGetHeight(a1);
  v24 = (double)Height;
  if (a3 <= 4)
    v25 = Width;
  else
    v25 = (double)Height;
  if (a3 <= 4)
    v26 = (double)Height;
  else
    v26 = Width;
  if ((a6 <= v14 || v25 >= v26) && (a6 >= v14 || v25 <= v26))
  {
    v27 = v21;
    v21 = v20;
    v28 = v14;
    v14 = a6;
  }
  else
  {
    v27 = v20;
    v28 = a6;
  }
  v29 = v14 - v21 - v21;
  v30 = v28 - v27 - v27;
  if (a4)
  {
    v29 = v14;
    v30 = v28;
  }
  v31 = v29 / v25;
  v32 = v30 / v26;
  if (v31 <= v32)
    v33 = v32;
  else
    v33 = v31;
  if (v31 < v32)
    v32 = v31;
  if ((a4 & a5) != 0)
    v32 = v33;
  v34 = (v14 - v25 * v32) * 0.5;
  v35 = (v28 - v26 * v32) * 0.5;
  v36 = v25 * v32;
  v37 = v26 * v32;
  CGContextSaveGState(a2);
  _cgImageToPaperTransform(a3, a3 > 4, (uint64_t)&v38, v25, v26, v34, v35, v36, v37);
  CGContextConcatCTM(a2, &v38);
  v39.origin.x = 0.0;
  v39.origin.y = 0.0;
  v39.size.width = Width;
  v39.size.height = v24;
  CGContextDrawImage(a2, v39, a1);
  CGContextRestoreGState(a2);
}

void sub_1D81A30C8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void __getPHAssetClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getPHImageRequestOptionsClass_block_invoke_cold_1(v0);
}

void __getPHImageRequestOptionsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getPHImageManagerClass_block_invoke_cold_1(v0);
}

void __getPHImageManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __GetImageForPHAssetSync_block_invoke_cold_1(v0);
}

void __getUIActivityViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  -[UIPrintRangeView updatePageRangeView].cold.1(v0);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x1E0C985D8](theDict);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

CGColorSpaceRef CGBitmapContextGetColorSpace(CGContextRef context)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BB68](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1E0C9BB78](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1E0C9BB80](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE8]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BEC8](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextBeginPage(CGContextRef c, const CGRect *mediaBox)
{
  MEMORY[0x1E0C9BFF8](c, mediaBox);
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C038](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x1E0C9C050](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
  MEMORY[0x1E0C9C1A0](c, page);
}

uint64_t CGContextDrawPDFPageWithAnnotations()
{
  return MEMORY[0x1E0C9C1A8]();
}

void CGContextEndPage(CGContextRef c)
{
  MEMORY[0x1E0C9C1F8](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CGContextGetBaseCTM()
{
  return MEMORY[0x1E0C9C240]();
}

uint64_t CGContextGetBlendMode()
{
  return MEMORY[0x1E0C9C248]();
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9C250](retstr, c);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

CGContextRef CGContextRetain(CGContextRef c)
{
  return (CGContextRef)MEMORY[0x1E0C9C378](c);
}

void CGContextRotateCTM(CGContextRef c, CGFloat angle)
{
  MEMORY[0x1E0C9C380](c, angle);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

void CGContextSetAllowsAntialiasing(CGContextRef c, BOOL allowsAntialiasing)
{
  MEMORY[0x1E0C9C398](c, allowsAntialiasing);
}

void CGContextSetAllowsFontSmoothing(CGContextRef c, BOOL allowsFontSmoothing)
{
  MEMORY[0x1E0C9C3A0](c, allowsFontSmoothing);
}

void CGContextSetAllowsFontSubpixelPositioning(CGContextRef c, BOOL allowsFontSubpixelPositioning)
{
  MEMORY[0x1E0C9C3A8](c, allowsFontSubpixelPositioning);
}

void CGContextSetAllowsFontSubpixelQuantization(CGContextRef c, BOOL allowsFontSubpixelQuantization)
{
  MEMORY[0x1E0C9C3B0](c, allowsFontSubpixelQuantization);
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1E0C9C3C0]();
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

void CGContextSetCMYKFillColor(CGContextRef c, CGFloat cyan, CGFloat magenta, CGFloat yellow, CGFloat black, CGFloat alpha)
{
  MEMORY[0x1E0C9C3D0](c, cyan, magenta, yellow, black, alpha);
}

uint64_t CGContextSetCTM()
{
  return MEMORY[0x1E0C9C3D8]();
}

uint64_t CGContextSetFontSmoothingBackgroundColor()
{
  return MEMORY[0x1E0C9C440]();
}

void CGContextSetGrayFillColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
  MEMORY[0x1E0C9C448](c, gray, alpha);
}

void CGContextSetGrayStrokeColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
  MEMORY[0x1E0C9C450](c, gray, alpha);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x1E0C9C458](c, *(_QWORD *)&quality);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x1E0C9C480](c, width);
}

uint64_t CGContextSetLineWidthThreshold()
{
  return MEMORY[0x1E0C9C488]();
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x1E0C9C4A0](c, red, green, blue, alpha);
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
  MEMORY[0x1E0C9C4C8](c, shouldAntialias);
}

void CGContextSetShouldSmoothFonts(CGContextRef c, BOOL shouldSmoothFonts)
{
  MEMORY[0x1E0C9C4E0](c, shouldSmoothFonts);
}

void CGContextSetShouldSubpixelPositionFonts(CGContextRef c, BOOL shouldSubpixelPositionFonts)
{
  MEMORY[0x1E0C9C4E8](c, shouldSubpixelPositionFonts);
}

void CGContextSetShouldSubpixelQuantizeFonts(CGContextRef c, BOOL shouldSubpixelQuantizeFonts)
{
  MEMORY[0x1E0C9C4F0](c, shouldSubpixelQuantizeFonts);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C508](c, color);
}

uint64_t CGContextSetTextGreekingThreshold()
{
  return MEMORY[0x1E0C9C528]();
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C578](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

CGDataConsumerRef CGDataConsumerCreate(void *info, const CGDataConsumerCallbacks *cbks)
{
  return (CGDataConsumerRef)MEMORY[0x1E0C9C5A8](info, cbks);
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
  MEMORY[0x1E0C9C5D0](consumer);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C5F0](data);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C600](info, data, size, releaseData);
}

CGDataProviderRef CGDataProviderCreateWithURL(CFURLRef url)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C610](url);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF0](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF8](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1E0C9CC08](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC530](isrc, index, options);
}

CFArrayRef CGImageSourceCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x1E0CBC550]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC5F0](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1E0CBC618](isrc);
}

void CGPDFContextBeginPage(CGContextRef context, CFDictionaryRef pageInfo)
{
  MEMORY[0x1E0C9CEC0](context, pageInfo);
}

void CGPDFContextClose(CGContextRef context)
{
  MEMORY[0x1E0C9CEC8](context);
}

CGContextRef CGPDFContextCreate(CGDataConsumerRef consumer, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9CED0](consumer, mediaBox, auxiliaryInfo);
}

CGContextRef CGPDFContextCreateWithURL(CFURLRef url, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9CED8](url, mediaBox, auxiliaryInfo);
}

void CGPDFContextEndPage(CGContextRef context)
{
  MEMORY[0x1E0C9CEE0](context);
}

BOOL CGPDFDictionaryGetArray(CGPDFDictionaryRef dict, const char *key, CGPDFArrayRef *value)
{
  return MEMORY[0x1E0C9CEF8](dict, key, value);
}

BOOL CGPDFDictionaryGetString(CGPDFDictionaryRef dict, const char *key, CGPDFStringRef *value)
{
  return MEMORY[0x1E0C9CF28](dict, key, value);
}

BOOL CGPDFDocumentAllowsCopying(CGPDFDocumentRef document)
{
  return MEMORY[0x1E0C9CF30](document);
}

BOOL CGPDFDocumentAllowsPrinting(CGPDFDocumentRef document)
{
  return MEMORY[0x1E0C9CF38](document);
}

uint64_t CGPDFDocumentCopyOutputIntents()
{
  return MEMORY[0x1E0C9CF48]();
}

CGPDFDocumentRef CGPDFDocumentCreateWithProvider(CGDataProviderRef provider)
{
  return (CGPDFDocumentRef)MEMORY[0x1E0C9CF58](provider);
}

CGPDFDocumentRef CGPDFDocumentCreateWithURL(CFURLRef url)
{
  return (CGPDFDocumentRef)MEMORY[0x1E0C9CF60](url);
}

CGPDFDictionaryRef CGPDFDocumentGetInfo(CGPDFDocumentRef document)
{
  return (CGPDFDictionaryRef)MEMORY[0x1E0C9CF90](document);
}

size_t CGPDFDocumentGetNumberOfPages(CGPDFDocumentRef document)
{
  return MEMORY[0x1E0C9CF98](document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x1E0C9CFA0](document, pageNumber);
}

BOOL CGPDFDocumentIsEncrypted(CGPDFDocumentRef document)
{
  return MEMORY[0x1E0C9CFB0](document);
}

void CGPDFDocumentRelease(CGPDFDocumentRef document)
{
  MEMORY[0x1E0C9CFC8](document);
}

BOOL CGPDFDocumentUnlockWithPassword(CGPDFDocumentRef document, const char *password)
{
  return MEMORY[0x1E0C9CFD8](document, password);
}

uint64_t CGPDFPageGetAnnotationCount()
{
  return MEMORY[0x1E0C9D088]();
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D090](page, *(_QWORD *)&box);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

int CGPDFPageGetRotationAngle(CGPDFPageRef page)
{
  return MEMORY[0x1E0C9D0C8](page);
}

CFStringRef CGPDFStringCopyTextString(CGPDFStringRef string)
{
  return (CFStringRef)MEMORY[0x1E0C9D268](string);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
  MEMORY[0x1E0C9D568](slice, remainder, *(_QWORD *)&edge, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, amount);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t PKDrawImageToSheet()
{
  return MEMORY[0x1E0D80A90]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0DC4BC0](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0DC4BD8]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0DC4BE8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0DC4BF0]();
}

void UIGraphicsPopContext(void)
{
  MEMORY[0x1E0DC4C00]();
}

void UIGraphicsPushContext(CGContextRef context)
{
  MEMORY[0x1E0DC4C08](context);
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x1E0DC5298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1E0CB3BC8](commaSeparatedKeysString, firstValue);
}

uint64_t _UIActivityOpenInApplicationTypeForActivityType()
{
  return MEMORY[0x1E0D96E38]();
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x1E0DC5720]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82CF8]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int pthread_main_np(void)
{
  return MEMORY[0x1E0C84E08]();
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

void uuid_generate_random(uuid_t out)
{
  MEMORY[0x1E0C85A20](out);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A40](uu, out);
}

