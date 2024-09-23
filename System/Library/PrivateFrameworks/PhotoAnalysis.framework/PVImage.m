@implementation PVImage

- (PVImage)initWithCGImage:(CGImage *)a3 orientation:(unsigned int)a4 adjustmentVersion:(id)a5 creationDate:(id)a6
{
  id v10;
  id v11;
  PVImage *v12;
  size_t Height;
  unint64_t width;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id adjustmentVersion;
  uint64_t v20;
  NSString *groupingIdentifier;
  unint64_t v22;
  PVImage *v23;
  objc_super v25;

  v10 = a5;
  v11 = a6;
  if (a3)
  {
    v25.receiver = self;
    v25.super_class = (Class)PVImage;
    v12 = -[PVImage init](&v25, sel_init);
    if (v12)
    {
      CGImageRetain(a3);
      v12->_CGImage = a3;
      v12->_width = CGImageGetWidth(a3);
      Height = CGImageGetHeight(a3);
      v12->_height = Height;
      width = v12->_width;
      if (a4 - 5 >= 4)
        v15 = v12->_width;
      else
        v15 = Height;
      if (a4 - 5 >= 4)
        width = Height;
      v12->_assetWidth = v15;
      v12->_assetHeight = width;
      if (a4 - 5 >= 4)
        v16 = 32;
      else
        v16 = 40;
      if (a4 - 5 >= 4)
        v17 = 40;
      else
        v17 = 32;
      v12->_bytesPerRow = CGImageGetBytesPerRow(a3);
      v18 = objc_msgSend(v10, "copy");
      adjustmentVersion = v12->_adjustmentVersion;
      v12->_adjustmentVersion = (id)v18;

      GroupingIdentifierFromDate(v11);
      v20 = objc_claimAutoreleasedReturnValue();
      groupingIdentifier = v12->_groupingIdentifier;
      v12->_groupingIdentifier = (NSString *)v20;

      v12->_orientation = a4;
      v22 = *(unint64_t *)((char *)&v12->super.isa + v17);
      v12->_orientedWidth = *(unint64_t *)((char *)&v12->super.isa + v16);
      v12->_orientedHeight = v22;
    }
    self = v12;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (PVImage)initWithCIImage:(id)a3 assetWidth:(unint64_t)a4 assetHeight:(unint64_t)a5 orientation:(unsigned int)a6 adjustmentVersion:(id)a7 creationDate:(id)a8
{
  id v15;
  id v16;
  id v17;
  PVImage *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  id adjustmentVersion;
  uint64_t v25;
  NSString *groupingIdentifier;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  PVImage *v30;
  objc_super v32;

  v15 = a3;
  v16 = a7;
  v17 = a8;
  if (v15)
  {
    v32.receiver = self;
    v32.super_class = (Class)PVImage;
    v18 = -[PVImage init](&v32, sel_init);
    if (v18)
    {
      objc_msgSend(v15, "extent");
      v20 = v19;
      v22 = v21;
      objc_storeStrong((id *)&v18->_CIImage, a3);
      v18->_width = (unint64_t)v20;
      v18->_height = (unint64_t)v22;
      v18->_assetWidth = a4;
      v18->_assetHeight = a5;
      v23 = objc_msgSend(v16, "copy");
      adjustmentVersion = v18->_adjustmentVersion;
      v18->_adjustmentVersion = (id)v23;

      GroupingIdentifierFromDate(v17);
      v25 = objc_claimAutoreleasedReturnValue();
      groupingIdentifier = v18->_groupingIdentifier;
      v18->_groupingIdentifier = (NSString *)v25;

      v18->_orientation = a6;
      v27 = 32;
      if (a6 - 5 >= 4)
        v28 = 32;
      else
        v28 = 40;
      if (a6 - 5 >= 4)
        v27 = 40;
      v29 = *(unint64_t *)((char *)&v18->super.isa + v27);
      v18->_orientedWidth = *(unint64_t *)((char *)&v18->super.isa + v28);
      v18->_orientedHeight = v29;
    }
    self = v18;
    v30 = self;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (PVImage)initWithData:(id)a3 imageCreationOptions:(id)a4 assetWidth:(unint64_t)a5 assetHeight:(unint64_t)a6 adjustmentVersion:(id)a7 creationDate:(id)a8
{
  const __CFData *v15;
  const __CFDictionary *v16;
  id v17;
  id v18;
  PVImage *v19;
  CGImageSource *v20;
  CGImageSource *v21;
  const CGImageMetadata *v22;
  const CGImageMetadata *v23;
  const __CFString *v24;
  const __CFString *v25;
  SInt32 IntValue;
  PVImage *v27;
  CGImage *ImageAtIndex;
  CGImage *v29;
  uint64_t v30;
  id adjustmentVersion;
  uint64_t v32;
  NSString *groupingIdentifier;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v38;
  unint64_t v39;
  objc_super v40;
  uint8_t buf[4];
  SInt32 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v15 = (const __CFData *)a3;
  v16 = (const __CFDictionary *)a4;
  v17 = a7;
  v18 = a8;
  if (v15)
  {
    v40.receiver = self;
    v40.super_class = (Class)PVImage;
    v19 = -[PVImage init](&v40, sel_init);
    if (v19)
    {
      v20 = CGImageSourceCreateWithData(v15, v16);
      if (v20)
      {
        v21 = v20;
        v39 = a5;
        v22 = CGImageSourceCopyMetadataAtIndex(v20, 0, 0);
        if (v22)
        {
          v23 = v22;
          v38 = a6;
          v24 = CGImageMetadataCopyStringValueWithPath(v22, 0, CFSTR("tiff:Orientation"));
          if (v24)
          {
            v25 = v24;
            IntValue = CFStringGetIntValue(v24);
            if ((IntValue - 9) <= 0xFFFFFFF7)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                v42 = IntValue;
                _os_log_error_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "ERROR: Invalid orientation found: %d. Using a default value of 1", buf, 8u);
              }
              IntValue = 1;
            }
            CFRelease(v25);
          }
          else
          {
            IntValue = 1;
          }
          CFRelease(v23);
          a6 = v38;
        }
        else
        {
          IntValue = 1;
        }
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v21, 0, v16);
        if (ImageAtIndex)
        {
          v29 = ImageAtIndex;
          v19->_CGImage = ImageAtIndex;
          v19->_width = CGImageGetWidth(ImageAtIndex);
          v19->_height = CGImageGetHeight(v29);
          v19->_assetWidth = v39;
          v19->_assetHeight = a6;
        }
        CFRelease(v21);
        objc_storeStrong((id *)&v19->_imageData, a3);
        v30 = objc_msgSend(v17, "copy");
        adjustmentVersion = v19->_adjustmentVersion;
        v19->_adjustmentVersion = (id)v30;

        GroupingIdentifierFromDate(v18);
        v32 = objc_claimAutoreleasedReturnValue();
        groupingIdentifier = v19->_groupingIdentifier;
        v19->_groupingIdentifier = (NSString *)v32;

        v19->_orientation = IntValue;
        v34 = 32;
        if ((IntValue - 5) >= 4)
          v35 = 32;
        else
          v35 = 40;
        if ((IntValue - 5) >= 4)
          v34 = 40;
        v36 = *(unint64_t *)((char *)&v19->super.isa + v34);
        v19->_orientedWidth = *(unint64_t *)((char *)&v19->super.isa + v35);
        v19->_orientedHeight = v36;
      }
      else
      {

        v19 = 0;
      }
    }
    self = v19;
    v27 = self;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (PVImage)initWithURL:(id)a3 assetWidth:(unint64_t)a4 assetHeight:(unint64_t)a5 imageCreationOptions:(id)a6 adjustmentVersion:(id)a7 creationDate:(id)a8
{
  const __CFURL *v14;
  const __CFDictionary *v15;
  id v16;
  id v17;
  PVImage *v18;
  CGImageSource *v19;
  CGImageSource *v20;
  const CGImageMetadata *v21;
  const CGImageMetadata *v22;
  const __CFString *v23;
  const __CFString *v24;
  SInt32 IntValue;
  PVImage *v26;
  CGImage *ImageAtIndex;
  CGImage *v28;
  uint64_t v29;
  NSURL *imageURL;
  uint64_t v31;
  id adjustmentVersion;
  uint64_t v33;
  NSString *groupingIdentifier;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v39;
  objc_super v40;
  uint8_t buf[4];
  SInt32 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v14 = (const __CFURL *)a3;
  v15 = (const __CFDictionary *)a6;
  v16 = a7;
  v17 = a8;
  if (v14)
  {
    v40.receiver = self;
    v40.super_class = (Class)PVImage;
    v18 = -[PVImage init](&v40, sel_init);
    if (v18)
    {
      v19 = CGImageSourceCreateWithURL(v14, v15);
      if (v19)
      {
        v20 = v19;
        v39 = a5;
        v21 = CGImageSourceCopyMetadataAtIndex(v19, 0, 0);
        if (v21)
        {
          v22 = v21;
          v23 = CGImageMetadataCopyStringValueWithPath(v21, 0, CFSTR("tiff:Orientation"));
          if (v23)
          {
            v24 = v23;
            IntValue = CFStringGetIntValue(v23);
            if ((IntValue - 9) <= 0xFFFFFFF7)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                v42 = IntValue;
                _os_log_error_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "ERROR: Invalid orientation found: %d. Using a default value of 1", buf, 8u);
              }
              IntValue = 1;
            }
            CFRelease(v24);
          }
          else
          {
            IntValue = 1;
          }
          CFRelease(v22);
        }
        else
        {
          IntValue = 1;
        }
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v20, 0, v15);
        if (ImageAtIndex)
        {
          v28 = ImageAtIndex;
          v18->_width = CGImageGetWidth(ImageAtIndex);
          v18->_height = CGImageGetHeight(v28);
          v18->_CGImage = v28;
        }
        CFRelease(v20);
        v29 = -[__CFURL copy](v14, "copy");
        imageURL = v18->_imageURL;
        v18->_imageURL = (NSURL *)v29;

        v18->_assetWidth = a4;
        v18->_assetHeight = v39;
        v31 = objc_msgSend(v16, "copy");
        adjustmentVersion = v18->_adjustmentVersion;
        v18->_adjustmentVersion = (id)v31;

        GroupingIdentifierFromDate(v17);
        v33 = objc_claimAutoreleasedReturnValue();
        groupingIdentifier = v18->_groupingIdentifier;
        v18->_groupingIdentifier = (NSString *)v33;

        v18->_orientation = IntValue;
        v35 = 32;
        if ((IntValue - 5) >= 4)
          v36 = 32;
        else
          v36 = 40;
        if ((IntValue - 5) >= 4)
          v35 = 40;
        v37 = *(unint64_t *)((char *)&v18->super.isa + v35);
        v18->_orientedWidth = *(unint64_t *)((char *)&v18->super.isa + v36);
        v18->_orientedHeight = v37;
      }
      else
      {

        v18 = 0;
      }
    }
    self = v18;
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_CGImage);
  v3.receiver = self;
  v3.super_class = (Class)PVImage;
  -[PVImage dealloc](&v3, sel_dealloc);
}

- (CGRect)imageRectForNormalizedRect:(CGRect)a3
{
  double x;
  BOOL v4;
  double y;
  BOOL v6;
  double width;
  double height;
  double v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  x = a3.origin.x;
  v4 = a3.origin.x >= 0.0 && a3.origin.x <= 1.0;
  if (v4
    && ((y = a3.origin.y, a3.origin.y >= 0.0) ? (v6 = a3.origin.y <= 1.0) : (v6 = 0),
        v6
     && (width = a3.size.width, a3.size.width >= 0.0)
     && a3.size.width <= 1.0
     && (height = a3.size.height, a3.size.height >= 0.0)
     && a3.size.height <= 1.0))
  {
    v10 = (double)-[PVImage orientedWidth](self, "orientedWidth");
    v11 = -[PVImage orientedHeight](self, "orientedHeight");
    if (v10 >= (double)v11)
      v12 = v10;
    else
      v12 = (double)v11;
    v13 = x * v10;
    v14 = width * v12;
    v15 = y * (double)v11;
    v16 = height * v12;
  }
  else
  {
    v13 = *MEMORY[0x1E0C9D628];
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v16 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  result.size.height = v16;
  result.size.width = v14;
  result.origin.y = v15;
  result.origin.x = v13;
  return result;
}

- (unint64_t)assetWidth
{
  return self->_assetWidth;
}

- (unint64_t)assetHeight
{
  return self->_assetHeight;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (unint64_t)orientedWidth
{
  return self->_orientedWidth;
}

- (unint64_t)orientedHeight
{
  return self->_orientedHeight;
}

- (unint64_t)bytesPerRow
{
  return self->_bytesPerRow;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (id)adjustmentVersion
{
  return self->_adjustmentVersion;
}

- (NSString)groupingIdentifier
{
  return self->_groupingIdentifier;
}

- (CIImage)CIImage
{
  return self->_CIImage;
}

- (CGImage)CGImage
{
  return self->_CGImage;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_CIImage, 0);
  objc_storeStrong((id *)&self->_groupingIdentifier, 0);
  objc_storeStrong(&self->_adjustmentVersion, 0);
}

+ (PVImage)imageWithCGImage:(CGImage *)a3 orientation:(unsigned int)a4 adjustmentVersion:(id)a5 creationDate:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  PVImage *v11;

  v7 = *(_QWORD *)&a4;
  v9 = a6;
  v10 = a5;
  v11 = -[PVImage initWithCGImage:orientation:adjustmentVersion:creationDate:]([PVImage alloc], "initWithCGImage:orientation:adjustmentVersion:creationDate:", a3, v7, v10, v9);

  return v11;
}

+ (PVImage)imageWithCIImage:(id)a3 assetWidth:(unint64_t)a4 assetHeight:(unint64_t)a5 orientation:(unsigned int)a6 adjustmentVersion:(id)a7 creationDate:(id)a8
{
  uint64_t v9;
  id v13;
  id v14;
  id v15;
  PVImage *v16;

  v9 = *(_QWORD *)&a6;
  v13 = a8;
  v14 = a7;
  v15 = a3;
  v16 = -[PVImage initWithCIImage:assetWidth:assetHeight:orientation:adjustmentVersion:creationDate:]([PVImage alloc], "initWithCIImage:assetWidth:assetHeight:orientation:adjustmentVersion:creationDate:", v15, a4, a5, v9, v14, v13);

  return v16;
}

+ (PVImage)imageWithURL:(id)a3 assetWidth:(unint64_t)a4 assetHeight:(unint64_t)a5 imageCreationOptions:(id)a6 adjustmentVersion:(id)a7 creationDate:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  PVImage *v17;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a3;
  v17 = -[PVImage initWithURL:assetWidth:assetHeight:imageCreationOptions:adjustmentVersion:creationDate:]([PVImage alloc], "initWithURL:assetWidth:assetHeight:imageCreationOptions:adjustmentVersion:creationDate:", v16, a4, a5, v15, v14, v13);

  return v17;
}

+ (PVImage)imageWithData:(id)a3 imageCreationOptions:(id)a4 assetWidth:(unint64_t)a5 assetHeight:(unint64_t)a6 adjustmentVersion:(id)a7 creationDate:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  PVImage *v17;

  v13 = a8;
  v14 = a7;
  v15 = a4;
  v16 = a3;
  v17 = -[PVImage initWithData:imageCreationOptions:assetWidth:assetHeight:adjustmentVersion:creationDate:]([PVImage alloc], "initWithData:imageCreationOptions:assetWidth:assetHeight:adjustmentVersion:creationDate:", v16, v15, a5, a6, v14, v13);

  return v17;
}

@end
