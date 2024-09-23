@implementation UGCPhotoWithMetadata

- (UGCPhotoWithMetadata)initWithImageData:(id)a3 date:(id)a4 location:(id)a5 source:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  UGCPhotoWithMetadata *v14;
  UGCPhotoWithMetadata *v15;
  CGImageSource *v16;
  CGImageSource *v17;
  CFStringRef Type;
  void *v19;
  uint64_t v20;
  NSString *mimeType;
  UGCPhotoWithMetadata *v22;
  const char *v24;
  objc_super v25;
  uint8_t buf[16];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v11)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
LABEL_13:
      v22 = 0;
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v24 = "Assertion failed: imageData != ((void *)0)";
LABEL_15:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, v24, buf, 2u);
    goto LABEL_13;
  }
  if (!a6)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v24 = "Assertion failed: sourceType != UGCSourceTypeUnknown";
    goto LABEL_15;
  }
  v25.receiver = self;
  v25.super_class = (Class)UGCPhotoWithMetadata;
  v14 = -[UGCPhotoWithMetadata init](&v25, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_rawImageData, a3);
    objc_storeStrong((id *)&v15->_date, a4);
    v15->_sourceType = a6;
    objc_storeStrong((id *)&v15->_location, a5);
    v16 = CGImageSourceCreateWithData((CFDataRef)v15->_rawImageData, 0);
    if (v16)
    {
      v17 = v16;
      Type = CGImageSourceGetType(v16);
      if (Type)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", Type));
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "preferredMIMEType"));
        mimeType = v15->_mimeType;
        v15->_mimeType = (NSString *)v20;

      }
      CFRelease(v17);
    }
  }
  self = v15;
  v22 = self;
LABEL_9:

  return v22;
}

- (UGCPhotoWithMetadata)initWithImageData:(id)a3 PHAsset:(id)a4 sourceType:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  UGCPhotoWithMetadata *v12;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "creationDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "location"));

  v12 = -[UGCPhotoWithMetadata initWithImageData:date:location:source:](self, "initWithImageData:date:location:source:", v9, v10, v11, a5);
  return v12;
}

- (int64_t)photoType
{
  return 6;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoWithMetadata photoMetadata](self, "photoMetadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "clientImageUuid"));

  return (NSString *)v3;
}

- (GEORPPhotoMetadata)photoMetadata
{
  GEORPPhotoMetadata *photoMetadata;
  id v4;
  void *v5;
  void *v6;
  GEORPPhotoMetadata *v7;
  GEORPPhotoMetadata *v8;
  char v9;
  void *v10;
  void *v11;

  photoMetadata = self->_photoMetadata;
  if (!photoMetadata)
  {
    v4 = objc_alloc((Class)GEORPPhotoMetadata);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
    v7 = (GEORPPhotoMetadata *)objc_msgSend(v4, "initWithUUID:location:", v6, self->_location);
    v8 = self->_photoMetadata;
    self->_photoMetadata = v7;

    -[GEORPPhotoMetadata setSize:](self->_photoMetadata, "setSize:", -[NSData length](self->_rawImageData, "length"));
    -[GEORPPhotoMetadata setMediaType:](self->_photoMetadata, "setMediaType:", self->_mimeType);
    v9 = sub_100847A54();
    photoMetadata = self->_photoMetadata;
    if ((v9 & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPPhotoMetadata geotag](photoMetadata, "geotag"));
      objc_msgSend(v10, "setTimestamp:", 0.0);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPPhotoMetadata geotag](self->_photoMetadata, "geotag"));
      objc_msgSend(v11, "setHasTimestamp:", 0);

      photoMetadata = self->_photoMetadata;
    }
  }
  return photoMetadata;
}

- (UIImage)image
{
  UIImage *image;
  UIImage *v4;
  UIImage *v5;

  image = self->_image;
  if (!image)
  {
    v4 = (UIImage *)objc_msgSend(objc_alloc((Class)UIImage), "initWithData:", self->_rawImageData);
    v5 = self->_image;
    self->_image = v4;

    image = self->_image;
  }
  return image;
}

- (NSURL)url
{
  return 0;
}

- (BOOL)needsToBeDownloaded
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char isKindOfClass;
  unsigned __int8 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_opt_class(UGCPhotoWithMetadata);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);
  v7 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    v8 = v4;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoWithMetadata image](self, "image"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "image"));
    if (objc_msgSend(v9, "isEqual:", v10))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoWithMetadata photoMetadata](self, "photoMetadata"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "photoMetadata"));
      v7 = objc_msgSend(v11, "isEqual:", v12);

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (NSData)rawImageData
{
  return self->_rawImageData;
}

- (BOOL)isSuggestedPhoto
{
  return self->_isSuggestedPhoto;
}

- (void)setIsSuggestedPhoto:(BOOL)a3
{
  self->_isSuggestedPhoto = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoMetadata, 0);
  objc_storeStrong((id *)&self->_rawImageData, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
