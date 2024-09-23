@implementation WFGalleryBanner

- (unint64_t)referenceActionForKey:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("base"));
}

- (id)imageFileForSize:(int64_t)a3
{
  const char *v3;

  switch(a3)
  {
    case 2:
      -[WFGalleryBanner ipad2xImageFile](self, "ipad2xImageFile");
      v3 = (const char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      -[WFGalleryBanner iphone3xImageFile](self, "iphone3xImageFile");
      v3 = (const char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0:
      -[WFGalleryBanner iphone2xImageFile](self, "iphone2xImageFile");
      v3 = (const char *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      a2 = v3;
      break;
  }
  return (id)(id)a2;
}

- (id)imageForSize:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[WFGalleryBanner imageFileForSize:](self, "imageFileForSize:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0DC7B70];
    objc_msgSend(v3, "mappedData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithData:scale:allowAnimated:", v6, 0, 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WFGalleryBanner *v5;
  void *v6;
  uint64_t v7;
  CKRecordID *identifier;
  void *v9;
  uint64_t v10;
  NSString *name;
  void *v12;
  uint64_t v13;
  NSString *subtitle;
  uint64_t v15;
  CKRecordID *detailPage;
  void *v17;
  uint64_t v18;
  NSString *language;
  uint64_t v20;
  CKRecordID *base;
  void *v22;
  uint64_t v23;
  NSString *persistentIdentifier;
  void *v25;
  uint64_t v26;
  WFFileRepresentation *ipad2xImageFile;
  void *v28;
  uint64_t v29;
  WFFileRepresentation *iphone2xImageFile;
  void *v31;
  uint64_t v32;
  WFFileRepresentation *iphone3xImageFile;
  void *v34;
  uint64_t v35;
  NSArray *supportedIdioms;

  v5 = -[WFGalleryBanner init](+[WFGalleryBanner allocWithZone:](WFGalleryBanner, "allocWithZone:"), "init");
  -[WFGalleryBanner identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (CKRecordID *)v7;

  -[WFGalleryBanner name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copyWithZone:", a3);
  name = v5->_name;
  v5->_name = (NSString *)v10;

  -[WFGalleryBanner subtitle](self, "subtitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "copyWithZone:", a3);
  subtitle = v5->_subtitle;
  v5->_subtitle = (NSString *)v13;

  -[WFGalleryBanner detailPage](self, "detailPage");
  v15 = objc_claimAutoreleasedReturnValue();
  detailPage = v5->_detailPage;
  v5->_detailPage = (CKRecordID *)v15;

  -[WFGalleryBanner language](self, "language");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "copyWithZone:", a3);
  language = v5->_language;
  v5->_language = (NSString *)v18;

  -[WFGalleryBanner base](self, "base");
  v20 = objc_claimAutoreleasedReturnValue();
  base = v5->_base;
  v5->_base = (CKRecordID *)v20;

  -[WFGalleryBanner persistentIdentifier](self, "persistentIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "copyWithZone:", a3);
  persistentIdentifier = v5->_persistentIdentifier;
  v5->_persistentIdentifier = (NSString *)v23;

  -[WFGalleryBanner ipad2xImageFile](self, "ipad2xImageFile");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "copyWithZone:", a3);
  ipad2xImageFile = v5->_ipad2xImageFile;
  v5->_ipad2xImageFile = (WFFileRepresentation *)v26;

  -[WFGalleryBanner iphone2xImageFile](self, "iphone2xImageFile");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "copyWithZone:", a3);
  iphone2xImageFile = v5->_iphone2xImageFile;
  v5->_iphone2xImageFile = (WFFileRepresentation *)v29;

  -[WFGalleryBanner iphone3xImageFile](self, "iphone3xImageFile");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "copyWithZone:", a3);
  iphone3xImageFile = v5->_iphone3xImageFile;
  v5->_iphone3xImageFile = (WFFileRepresentation *)v32;

  -[WFGalleryBanner supportedIdioms](self, "supportedIdioms");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "copyWithZone:", a3);
  supportedIdioms = v5->_supportedIdioms;
  v5->_supportedIdioms = (NSArray *)v35;

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  WFMutableGalleryBanner *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v5 = -[WFMutableGalleryBanner init](+[WFMutableGalleryBanner allocWithZone:](WFMutableGalleryBanner, "allocWithZone:"), "init");
  -[WFGalleryBanner identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[WFMutableGalleryBanner setIdentifier:](v5, "setIdentifier:", v7);

  -[WFGalleryBanner name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[WFMutableGalleryBanner setName:](v5, "setName:", v9);

  -[WFGalleryBanner subtitle](self, "subtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  -[WFMutableGalleryBanner setSubtitle:](v5, "setSubtitle:", v11);

  -[WFGalleryBanner detailPage](self, "detailPage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMutableGalleryBanner setDetailPage:](v5, "setDetailPage:", v12);

  -[WFGalleryBanner language](self, "language");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copyWithZone:", a3);
  -[WFMutableGalleryBanner setLanguage:](v5, "setLanguage:", v14);

  -[WFGalleryBanner base](self, "base");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMutableGalleryBanner setBase:](v5, "setBase:", v15);

  -[WFGalleryBanner persistentIdentifier](self, "persistentIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  -[WFMutableGalleryBanner setPersistentIdentifier:](v5, "setPersistentIdentifier:", v17);

  -[WFGalleryBanner ipad2xImageFile](self, "ipad2xImageFile");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
  -[WFGalleryBanner setIpad2xImageFile:](v5, "setIpad2xImageFile:", v19);

  -[WFGalleryBanner iphone2xImageFile](self, "iphone2xImageFile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copyWithZone:", a3);
  -[WFGalleryBanner setIphone2xImageFile:](v5, "setIphone2xImageFile:", v21);

  -[WFGalleryBanner iphone3xImageFile](self, "iphone3xImageFile");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copyWithZone:", a3);
  -[WFGalleryBanner setIphone3xImageFile:](v5, "setIphone3xImageFile:", v23);

  -[WFGalleryBanner supportedIdioms](self, "supportedIdioms");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copyWithZone:", a3);
  -[WFMutableGalleryBanner setSupportedIdioms:](v5, "setSupportedIdioms:", v25);

  return v5;
}

- (CKRecordID)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (CKRecordID)detailPage
{
  return self->_detailPage;
}

- (WFFileRepresentation)iphone2xImageFile
{
  return self->_iphone2xImageFile;
}

- (void)setIphone2xImageFile:(id)a3
{
  objc_storeStrong((id *)&self->_iphone2xImageFile, a3);
}

- (WFFileRepresentation)iphone3xImageFile
{
  return self->_iphone3xImageFile;
}

- (void)setIphone3xImageFile:(id)a3
{
  objc_storeStrong((id *)&self->_iphone3xImageFile, a3);
}

- (WFFileRepresentation)ipad2xImageFile
{
  return self->_ipad2xImageFile;
}

- (void)setIpad2xImageFile:(id)a3
{
  objc_storeStrong((id *)&self->_ipad2xImageFile, a3);
}

- (NSString)language
{
  return self->_language;
}

- (CKRecordID)base
{
  return self->_base;
}

- (NSString)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (NSArray)supportedIdioms
{
  return self->_supportedIdioms;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedIdioms, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_ipad2xImageFile, 0);
  objc_storeStrong((id *)&self->_iphone3xImageFile, 0);
  objc_storeStrong((id *)&self->_iphone2xImageFile, 0);
  objc_storeStrong((id *)&self->_detailPage, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (NSString)recordType
{
  return (NSString *)CFSTR("GalleryBanner");
}

+ (NSDictionary)properties
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[10];
  _QWORD v19[12];

  v19[10] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("name");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v17;
  v18[1] = CFSTR("subtitle");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v16;
  v18[2] = CFSTR("detailPage");
  +[WFCloudKitItemProperty itemReferencePropertyWithName:itemClass:](WFCloudKitItemProperty, "itemReferencePropertyWithName:itemClass:", CFSTR("detailPage"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v15;
  v18[3] = CFSTR("iphone2xImage");
  v2 = *MEMORY[0x1E0CEC520];
  objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", *MEMORY[0x1E0CEC520]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCloudKitItemProperty assetPropertyWithName:fileType:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "assetPropertyWithName:fileType:ignoredByDefault:encrypted:", CFSTR("iphone2xImageFile"), v14, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v3;
  v18[4] = CFSTR("iphone3xImage");
  objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCloudKitItemProperty assetPropertyWithName:fileType:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "assetPropertyWithName:fileType:ignoredByDefault:encrypted:", CFSTR("iphone3xImageFile"), v4, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v5;
  v18[5] = CFSTR("ipad2xImage");
  objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCloudKitItemProperty assetPropertyWithName:fileType:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "assetPropertyWithName:fileType:ignoredByDefault:encrypted:", CFSTR("ipad2xImageFile"), v6, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v7;
  v18[6] = CFSTR("language");
  +[WFCloudKitItemProperty objectPropertyWithName:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "objectPropertyWithName:ignoredByDefault:encrypted:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v8;
  v18[7] = CFSTR("base");
  +[WFCloudKitItemProperty itemReferencePropertyWithName:itemClass:](WFCloudKitItemProperty, "itemReferencePropertyWithName:itemClass:", CFSTR("base"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v9;
  v18[8] = CFSTR("persistentIdentifier");
  +[WFCloudKitItemProperty objectPropertyWithName:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "objectPropertyWithName:ignoredByDefault:encrypted:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v10;
  v18[9] = CFSTR("supportedIdioms");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[9] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

+ (id)propertyForSize:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("iphone2xImage");
  if (a3 == 1)
    v3 = CFSTR("iphone3xImage");
  if (a3 == 2)
    return CFSTR("ipad2xImage");
  else
    return (id)v3;
}

+ (double)scaleForBannerSize:(int64_t)a3
{
  double result;

  result = 2.0;
  if (a3 == 1)
    return 3.0;
  return result;
}

+ (CGSize)pointSizeForBannerSize:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = dbl_1C1B47E30[a3 == 2];
  v4 = 150.0;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)pixelSizeForBannerSize:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  CGAffineTransform v12;
  CGSize result;

  objc_msgSend(a1, "pointSizeForBannerSize:");
  v6 = v5;
  v8 = v7;
  objc_msgSend(a1, "scaleForBannerSize:", a3);
  CGAffineTransformMakeScale(&v12, v9, v9);
  v10 = v8 * v12.c + v12.a * v6;
  v11 = v8 * v12.d + v12.b * v6;
  result.height = v11;
  result.width = v10;
  return result;
}

@end
