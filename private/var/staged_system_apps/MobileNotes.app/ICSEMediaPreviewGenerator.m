@implementation ICSEMediaPreviewGenerator

- (ICSEMediaPreviewGenerator)initWithScreenScale:(double)a3
{
  ICSEMediaPreviewGenerator *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICSEMediaPreviewGenerator;
  result = -[ICSEMediaPreviewGenerator init](&v5, "init");
  if (result)
    result->_screenScale = a3;
  return result;
}

- (id)generatePreviewWithAttachments:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  id v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if ((unint64_t)v5 >= 3)
    v6 = 3;
  else
    v6 = (uint64_t)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v6));
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", i));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mediaUTI"));
      v11 = +[ICAttachment typeUTIIsPlayableMovie:](ICAttachment, "typeUTIIsPlayableMovie:", v10);

      if (v11)
        v12 = objc_claimAutoreleasedReturnValue(-[ICSEMediaPreviewGenerator generateVideoPreviewUsingAttachment:](self, "generateVideoPreviewUsingAttachment:", v9));
      else
        v12 = objc_claimAutoreleasedReturnValue(-[ICSEMediaPreviewGenerator generateImagePreviewUsingAttachment:](self, "generateImagePreviewUsingAttachment:", v9));
      v13 = (void *)v12;
      objc_msgSend(v7, "ic_addNonNilObject:", v12);

    }
  }
  v14 = objc_msgSend(v7, "copy");

  return v14;
}

- (id)generateVideoPreviewUsingAttachment:(id)a3
{
  void *v3;
  void *v4;
  ICSEMediaPreview *v5;
  void *v6;
  ICSEMediaPreview *v7;
  _QWORD v9[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mediaURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVURLAsset ic_safeURLAssetWithURL:](AVURLAsset, "ic_safeURLAssetWithURL:", v3));

  v5 = [ICSEMediaPreview alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_previewImage"));
  if (v4)
    objc_msgSend(v4, "duration");
  else
    memset(v9, 0, sizeof(v9));
  v7 = -[ICSEMediaPreview initWithWithImage:videoDuration:](v5, "initWithWithImage:videoDuration:", v6, v9);

  return v7;
}

- (id)generateImagePreviewUsingAttachment:(id)a3
{
  id v4;
  void *v5;
  const __CFURL *v6;
  CGImageSourceRef v7;
  void *v8;
  CGImageSource *v9;
  CFDictionaryRef v10;
  CGImage *ImageAtIndex;
  double Width;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __CFData *v20;
  __CFString *v21;
  CGImageDestination *v22;
  id v23;
  void *v24;
  id v25;
  ICSEMediaPreview *v26;
  NSObject *v27;
  NSObject *v28;
  void *v30;
  const __CFData *v31;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaURL"));

  if (v5)
  {
    v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaURL"));
    v7 = CGImageSourceCreateWithURL(v6, 0);
LABEL_5:
    v9 = v7;
    goto LABEL_6;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaData"));

  if (v8)
  {
    v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaData"));
    v7 = CGImageSourceCreateWithData(v6, 0);
    goto LABEL_5;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "image"));

  if (v30)
  {
    v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "image"));
    v31 = (const __CFData *)objc_claimAutoreleasedReturnValue(-[__CFURL ic_PNGData](v6, "ic_PNGData"));
    v9 = CGImageSourceCreateWithData(v31, 0);

LABEL_6:
    v10 = CGImageSourceCopyPropertiesAtIndex(v9, 0, 0);
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v9, 0, 0);
    Width = (double)CGImageGetWidth(ImageAtIndex);
    v13 = Width / (double)CGImageGetHeight(ImageAtIndex);
    -[ICSEMediaPreviewGenerator screenScale](self, "screenScale");
    v15 = v14;
    v16 = v14 * 64.0;
    v17 = v16 / v13;
    v18 = v16 * v13;
    if (v13 > 1.0)
      v19 = v18;
    else
      v19 = v17;
    v20 = (__CFData *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeJPEG, "identifier"));
    v22 = CGImageDestinationCreateWithData(v20, v21, 1uLL, 0);

    if (v22)
    {
      v23 = -[__CFDictionary mutableCopy](v10, "mutableCopy");
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (int)v19));
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, kCGImageDestinationImageMaxPixelSize);

      CGImageDestinationAddImage(v22, ImageAtIndex, (CFDictionaryRef)v23);
      LODWORD(v24) = CGImageDestinationFinalize(v22);
      CFRelease(v22);

      CFRelease(v9);
      CGImageRelease(ImageAtIndex);
      if ((_DWORD)v24)
      {
        v25 = objc_msgSend(objc_alloc((Class)UIImage), "initWithData:scale:", v20, v15);
        v26 = -[ICSEMediaPreview initWithImage:]([ICSEMediaPreview alloc], "initWithImage:", v25);

LABEL_14:
        v27 = v26;

        v28 = v27;
        goto LABEL_15;
      }
    }
    else
    {
      CFRelease(v9);
      CGImageRelease(ImageAtIndex);
    }
    v26 = 0;
    goto LABEL_14;
  }
  v27 = os_log_create("com.apple.notes", "SharingExtension");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    sub_10040A9E8(v27);
  v28 = 0;
LABEL_15:

  return v28;
}

- (double)screenScale
{
  return self->_screenScale;
}

@end
