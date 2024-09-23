@implementation UIImageReaderConfiguration

- (UIImageReaderConfiguration)init
{
  UIImageReaderConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIImageReaderConfiguration;
  result = -[UIImageReaderConfiguration init](&v3, sel_init);
  if (result)
    *(_BYTE *)&result->_flags |= 1u;
  return result;
}

- (BOOL)prefersHighDynamicRange
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)setPrefersHighDynamicRange:(BOOL)prefersHighDynamicRange
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | prefersHighDynamicRange;
}

- (BOOL)preparesImagesForDisplay
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)setPreparesImagesForDisplay:(BOOL)preparesImagesForDisplay
{
  char v3;

  if (preparesImagesForDisplay)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (void)setPreferredThumbnailSize:(CGSize)preferredThumbnailSize
{
  char v3;

  if (preferredThumbnailSize.width <= 0.0 || preferredThumbnailSize.height <= 0.0)
  {
    self->_preferredThumbnailSize = (CGSize)*MEMORY[0x1E0C9D820];
    v3 = *(_BYTE *)&self->_flags & 0xFB;
  }
  else
  {
    self->_preferredThumbnailSize = preferredThumbnailSize;
    v3 = *(_BYTE *)&self->_flags | 4;
  }
  *(_BYTE *)&self->_flags = v3;
}

- (void)setPixelsPerInch:(CGFloat)pixelsPerInch
{
  void *v6;

  if (pixelsPerInch < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIImageReader.m"), 69, CFSTR("Invalid pixelsPerInch of %f"), *(_QWORD *)&pixelsPerInch);

  }
  self->_pixelsPerInch = pixelsPerInch;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  objc_opt_class();
  result = (id)objc_opt_new();
  *((_DWORD *)result + 2) = self->_flags;
  *(CGSize *)((char *)result + 24) = self->_preferredThumbnailSize;
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_pixelsPerInch;
  return result;
}

- (unint64_t)hash
{
  BOOL v2;
  uint64_t v3;

  v2 = self->_preferredThumbnailSize.height == *(double *)(MEMORY[0x1E0C9D820] + 8)
    && self->_preferredThumbnailSize.width == *MEMORY[0x1E0C9D820];
  v3 = 8;
  if (v2)
    v3 = 0;
  return *(_BYTE *)&self->_flags & 3 | (4 * (self->_pixelsPerInch > 0.0)) | v3;
}

- (BOOL)isEqual:(id)a3
{
  UIImageReaderConfiguration *v4;
  UIImageReaderConfiguration *v5;
  UIImageReaderConfiguration *v6;
  BOOL v7;
  BOOL v8;

  v4 = (UIImageReaderConfiguration *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v8 = ((*(_BYTE *)&v6->_flags ^ *(_BYTE *)&self->_flags) & 3) == 0
      && (self->_preferredThumbnailSize.width == v6->_preferredThumbnailSize.width
        ? (v7 = self->_preferredThumbnailSize.height == v6->_preferredThumbnailSize.height)
        : (v7 = 0),
          v7)
      && self->_pixelsPerInch == v6->_pixelsPerInch;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (double)_imageOptions
{
  double *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;
  _QWORD v15[2];

  v1 = a1;
  v15[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)objc_opt_new();
    v3 = v2;
    v4 = MEMORY[0x1E0C9AAB0];
    if (((_BYTE)v1[1] & 4) != 0)
    {
      v7 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CBD180]);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CBD178]);
      v8 = v1[3];
      if (v8 < v1[4])
        v8 = v1[4];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", (unint64_t)v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CBD2A0]);

      v6 = MEMORY[0x1E0C9AAA0];
      v5 = (_QWORD *)MEMORY[0x1E0CBD190];
    }
    else
    {
      v5 = (_QWORD *)MEMORY[0x1E0CBD288];
      v6 = MEMORY[0x1E0C9AAB0];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *v5);
    v10 = *((_BYTE *)v1 + 8);
    if ((v10 & 1) != 0)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CBD1B0], *MEMORY[0x1E0CBD1A0]);
      v14 = *MEMORY[0x1E0CBC6B0];
      v15[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CBD1A8]);

      v10 = *((_BYTE *)v1 + 8);
    }
    if ((v10 & 2) != 0)
    {
      v12 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CBD240]);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CBD250]);
    }
    v1 = (double *)objc_msgSend(v3, "copy");

  }
  return v1;
}

- (void)_checkIsFileURL:(uint64_t)a1
{
  id v3;
  void *v4;
  char v5;
  char v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3)
    {
      v8 = v3;
      v5 = objc_msgSend(v3, "isFileURL");
      v4 = v8;
      if ((v5 & 1) == 0)
      {
        v6 = objc_msgSend(v8, "isFileReferenceURL");
        v4 = v8;
        if ((v6 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__checkIsFileURL_, a1, CFSTR("UIImageReader.m"), 131, CFSTR("Client Error: URL '%@' does not refer to a file"), v8);

          v4 = v8;
        }
      }
    }
  }

}

- (double)_imageFromURL:(void *)a3 orData:(void *)a4 imageRequestOptions:
{
  id v7;
  const __CFData *v8;
  const __CFDictionary *v9;
  id v10;
  uint64_t v11;
  const __CFDictionary *v12;
  CGImageSource *v13;
  CGImageSource *v14;
  CGImageRef ImageAtIndex;
  CGImageRef v16;
  CFDictionaryRef v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  void *v23;
  double v24;
  _UIImageCGImageContent *v25;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!a1)
    goto LABEL_26;
  v10 = v7;
  v11 = *MEMORY[0x1E0CBD288];
  v28[0] = CFSTR("kCGImageSourceSkipCRC");
  v28[1] = v11;
  v29[0] = MEMORY[0x1E0C9AAA0];
  v29[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v13 = CGImageSourceCreateWithData(v8, v12);
  }
  else
  {
    if (!v10)
    {
LABEL_11:

LABEL_12:
      a1 = 0;
      goto LABEL_26;
    }
    v13 = CGImageSourceCreateWithURL((CFURLRef)v10, v12);
  }
  v14 = v13;
  if (!v13)
    goto LABEL_11;
  if (!CGImageSourceGetCount(v13))
  {
    CFRelease(v14);
    goto LABEL_11;
  }

  if (a1[3] * a1[4] == 0.0)
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v14, 0, v9);
  else
    ImageAtIndex = CGImageSourceCreateThumbnailAtIndex(v14, 0, v9);
  v16 = ImageAtIndex;
  if (!ImageAtIndex)
  {
    CFRelease(v14);
    goto LABEL_12;
  }
  v17 = CGImageSourceCopyPropertiesAtIndex(v14, 0, 0);
  -[__CFDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = objc_msgSend(v18, "integerValue");
    if ((unint64_t)(v20 - 1) >= 8)
      v21 = 0;
    else
      v21 = (0x27365140u >> (4 * v20 - 4)) & 7;
  }
  else
  {
    v21 = 0;
  }
  v22 = 1.0;
  if (a1[2] > 0.0)
  {
    -[__CFDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCA00]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23
      || (-[__CFDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF40]),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF48]),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          v27,
          v23))
    {
      objc_msgSend(v23, "doubleValue");
      v22 = fmax(round(v24 / a1[2]), 1.0);

    }
  }
  v25 = -[_UIImageCGImageContent initWithCGImageSource:CGImage:scale:]([_UIImageCGImageContent alloc], "initWithCGImageSource:CGImage:scale:", v14, v16, v22);
  CFRelease(v14);
  CFRelease(v16);
  a1 = -[UIImage _initWithContent:orientation:]([UIImage alloc], "_initWithContent:orientation:", v25, v21);

LABEL_26:
  return a1;
}

- (void)_asyncImageFromURL:(void *)a3 orData:(void *)a4 imageRequestOptions:(void *)a5 completion:
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  id v18;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    if (qword_1ECD803B0 != -1)
      dispatch_once(&qword_1ECD803B0, &__block_literal_global_500);
    v13 = _MergedGlobals_1222;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__UIImageReaderConfiguration__asyncImageFromURL_orData_imageRequestOptions_completion___block_invoke_2;
    block[3] = &unk_1E16C0EF8;
    block[4] = a1;
    v15 = v9;
    v16 = v10;
    v17 = v11;
    v18 = v12;
    dispatch_async(v13, block);

  }
}

void __87__UIImageReaderConfiguration__asyncImageFromURL_orData_imageRequestOptions_completion___block_invoke()
{
  dispatch_workloop_t v0;
  void *v1;

  v0 = dispatch_workloop_create("com.apple.UIKit.UIImageReader-async-image-loading");
  v1 = (void *)_MergedGlobals_1222;
  _MergedGlobals_1222 = (uint64_t)v0;

}

void __87__UIImageReaderConfiguration__asyncImageFromURL_orData_imageRequestOptions_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  -[UIImageReaderConfiguration _imageFromURL:orData:imageRequestOptions:](*(double **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _UIImageDecompressionCompletionQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __87__UIImageReaderConfiguration__asyncImageFromURL_orData_imageRequestOptions_completion___block_invoke_3;
  v6[3] = &unk_1E16B2F48;
  v4 = *(id *)(a1 + 64);
  v7 = v2;
  v8 = v4;
  v5 = v2;
  dispatch_async(v3, v6);

}

uint64_t __87__UIImageReaderConfiguration__asyncImageFromURL_orData_imageRequestOptions_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (CGSize)preferredThumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredThumbnailSize.width;
  height = self->_preferredThumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGFloat)pixelsPerInch
{
  return self->_pixelsPerInch;
}

@end
