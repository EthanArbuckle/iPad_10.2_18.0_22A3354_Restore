@implementation AESingleBookMetadataProvider

+ (id)singleBookMetadataProviderWithAssetID:(id)a3 assetURL:(id)a4 bookVersionString:(id)a5 pathToAssetContextDirectory:(id)a6 isManagedBook:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  id v14;
  AESingleBookMetadataProvider *v15;

  v7 = a7;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = -[AESingleBookMetadataProvider initWithAssetID:assetURL:bookVersionString:pathToAssetContextDirectory:isManagedBook:]([AESingleBookMetadataProvider alloc], "initWithAssetID:assetURL:bookVersionString:pathToAssetContextDirectory:isManagedBook:", v14, v13, v12, v11, v7);

  return v15;
}

- (AESingleBookMetadataProvider)initWithAssetID:(id)a3 assetURL:(id)a4 bookVersionString:(id)a5 pathToAssetContextDirectory:(id)a6 isManagedBook:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  AESingleBookMetadataProvider *v16;
  AESingleBookMetadataProvider *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v22;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)AESingleBookMetadataProvider;
  v16 = -[AESingleBookMetadataProvider init](&v22, "init");
  v17 = v16;
  if (v16)
  {
    -[AESingleBookMetadataProvider setAssetID:](v16, "setAssetID:", v12);
    -[AESingleBookMetadataProvider setAssetURL:](v17, "setAssetURL:", v13);
    -[AESingleBookMetadataProvider setBookVersionString:](v17, "setBookVersionString:", v14);
    -[AESingleBookMetadataProvider setPathToAssetContextDirectory:](v17, "setPathToAssetContextDirectory:", v15);
    -[AESingleBookMetadataProvider setManagedBook:](v17, "setManagedBook:", v7);
    if (!v12)
    {
      BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationSerializationManager.m", 323, (uint64_t)"-[AESingleBookMetadataProvider initWithAssetID:assetURL:bookVersionString:pathToAssetContextDirectory:isManagedBook:]", (uint64_t)"inAssetID", 0, v18, v19, v20, (uint64_t)v22.receiver);

      v17 = 0;
    }
  }

  return v17;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  const __CFString *v11;
  void *v12;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleBookMetadataProvider assetID](self, "assetID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleBookMetadataProvider assetURL](self, "assetURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleBookMetadataProvider bookVersionString](self, "bookVersionString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleBookMetadataProvider pathToAssetContextDirectory](self, "pathToAssetContextDirectory"));
  v10 = -[AESingleBookMetadataProvider isManagedBook](self, "isManagedBook");
  v11 = CFSTR("NO");
  if (v10)
    v11 = CFSTR("YES");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@(%p) id=%@ url=%@ version=%@ cd=%@ managed=%@>"), v5, self, v6, v7, v8, v9, v11));

  return (NSString *)v12;
}

- (id)assetURLForAssetID:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleBookMetadataProvider assetID](self, "assetID"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleBookMetadataProvider assetID](self, "assetID"));
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationSerializationManager.m", 339, (uint64_t)"-[AESingleBookMetadataProvider assetURLForAssetID:]", (uint64_t)"[inAssetID isEqualToString:self.assetID]", CFSTR("expected asset ID '%@', asked for unmanaged asset ID '%@' "), v10, v11, v12, (uint64_t)v9);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleBookMetadataProvider assetURL](self, "assetURL"));

  return v7;
}

- (id)bookVersionStringForAssetID:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleBookMetadataProvider assetID](self, "assetID"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleBookMetadataProvider assetID](self, "assetID"));
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationSerializationManager.m", 345, (uint64_t)"-[AESingleBookMetadataProvider bookVersionStringForAssetID:]", (uint64_t)"[inAssetID isEqualToString:self.assetID]", CFSTR("expected asset ID '%@', asked for unmanaged asset ID '%@' "), v10, v11, v12, (uint64_t)v9);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleBookMetadataProvider bookVersionString](self, "bookVersionString"));

  return v7;
}

- (id)pathToContextDirectoryForAssetID:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleBookMetadataProvider assetID](self, "assetID"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleBookMetadataProvider assetID](self, "assetID"));
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationSerializationManager.m", 351, (uint64_t)"-[AESingleBookMetadataProvider pathToContextDirectoryForAssetID:]", (uint64_t)"[inAssetID isEqualToString:self.assetID]", CFSTR("expected asset ID '%@', asked for unmanaged asset ID '%@' "), v10, v11, v12, (uint64_t)v9);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleBookMetadataProvider pathToAssetContextDirectory](self, "pathToAssetContextDirectory"));

  return v7;
}

- (BOOL)isManagedWithAssetID:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  BOOL v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleBookMetadataProvider assetID](self, "assetID"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleBookMetadataProvider assetID](self, "assetID"));
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationSerializationManager.m", 357, (uint64_t)"-[AESingleBookMetadataProvider isManagedWithAssetID:]", (uint64_t)"[inAssetID isEqualToString:self.assetID]", CFSTR("expected asset ID '%@', asked for unmanaged asset ID '%@' "), v10, v11, v12, (uint64_t)v9);

  }
  v7 = -[AESingleBookMetadataProvider isManagedBook](self, "isManagedBook");

  return v7;
}

- (NSString)assetID
{
  return self->assetID;
}

- (void)setAssetID:(id)a3
{
  objc_storeStrong((id *)&self->assetID, a3);
}

- (NSURL)assetURL
{
  return self->assetURL;
}

- (void)setAssetURL:(id)a3
{
  objc_storeStrong((id *)&self->assetURL, a3);
}

- (NSString)bookVersionString
{
  return self->bookVersionString;
}

- (void)setBookVersionString:(id)a3
{
  objc_storeStrong((id *)&self->bookVersionString, a3);
}

- (NSString)pathToAssetContextDirectory
{
  return self->pathToAssetContextDirectory;
}

- (void)setPathToAssetContextDirectory:(id)a3
{
  objc_storeStrong((id *)&self->pathToAssetContextDirectory, a3);
}

- (BOOL)isManagedBook
{
  return self->managedBook;
}

- (void)setManagedBook:(BOOL)a3
{
  self->managedBook = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->pathToAssetContextDirectory, 0);
  objc_storeStrong((id *)&self->bookVersionString, 0);
  objc_storeStrong((id *)&self->assetURL, 0);
  objc_storeStrong((id *)&self->assetID, 0);
}

@end
