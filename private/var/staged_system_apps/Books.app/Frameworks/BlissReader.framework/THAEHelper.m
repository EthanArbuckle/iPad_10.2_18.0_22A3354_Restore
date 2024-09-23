@implementation THAEHelper

- (THAEHelper)initWithURL:(id)a3 withOptions:(id)a4
{
  THAEHelper *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THAEHelper;
  v6 = -[THAEHelper init](&v8, "init");
  if (v6)
  {
    v6->mURL = (NSURL *)a3;
    v6->mOptions = (NSDictionary *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->mURL = 0;
  self->mBookDescription = 0;

  self->mBookCoverDescription = 0;
  self->mOptions = 0;
  v3.receiver = self;
  v3.super_class = (Class)THAEHelper;
  -[THAEHelper dealloc](&v3, "dealloc");
}

- (id)url
{
  return self->mURL;
}

- (id)bookDescription
{
  id result;

  result = self->mBookDescription;
  if (!result)
  {
    result = objc_msgSend(+[THApplePubAssetPlugin sharedPlugin](THApplePubAssetPlugin, "sharedPlugin"), "descriptionForURL:", -[THAEHelper url](self, "url"));
    self->mBookDescription = (THBookDescription *)result;
  }
  return result;
}

- (id)bookCoverDescription
{
  id result;

  result = self->mBookCoverDescription;
  if (!result)
  {
    result = objc_msgSend(+[THApplePubAssetPlugin sharedPlugin](THApplePubAssetPlugin, "sharedPlugin"), "coverDescriptionForURL:", -[THAEHelper url](self, "url"));
    self->mBookCoverDescription = (THBookCoverDescription *)result;
  }
  return result;
}

- (id)helperCoverImage
{
  id result;
  id v4;
  id v5;

  result = objc_msgSend(objc_msgSend(-[THAEHelper url](self, "url"), "pathExtension"), "caseInsensitiveCompare:", CFSTR("epub"));
  if (result)
  {
    v4 = -[THAEHelper url](self, "url");
    result = +[UIImage imageWithContentsOfFile:](UIImage, "imageWithContentsOfFile:", objc_msgSend(objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", kIMLibraryPlistArtworkName, 0), "path"));
    if (!result)
    {
      result = -[THAEHelper bookCoverDescription](self, "bookCoverDescription");
      if (result)
      {
        v5 = objc_msgSend(-[THAEHelper bookCoverDescription](self, "bookCoverDescription"), "embeddedArtURL");
        result = +[UIImage imageWithContentsOfFile:](UIImage, "imageWithContentsOfFile:", objc_msgSend(v5, "path"));
        if (!result)
        {
          result = objc_msgSend(-[THAEHelper bookCoverDescription](self, "bookCoverDescription"), "drmContext");
          if (result)
          {
            result = objc_msgSend(result, "dataWithContentsOfFile:error:", objc_msgSend(v5, "path"), 0);
            if (result)
              return +[UIImage imageWithData:](UIImage, "imageWithData:", result);
          }
        }
      }
    }
  }
  return result;
}

- (id)helperMetadataForKey:(id)a3 needsCoordination:(BOOL)a4
{
  _BOOL8 v4;
  id result;
  id v8;
  id v9;
  id v10;

  v4 = a4;
  if (objc_msgSend(a3, "isEqualToString:", AEHelperStringMetadataAssetIDKey))
    return objc_msgSend(-[THAEHelper bookDescription](self, "bookDescription"), "annotationID");
  v8 = objc_msgSend(+[AEAssetEngine libraryMgr](AEAssetEngine, "libraryMgr"), "metadataForAssetAtURL:needsCoordination:", self->mURL, v4);
  if (v8)
  {
    v9 = v8;
    if (objc_msgSend(a3, "isEqualToString:", AEHelperStringMetadataAuthorKey))
    {
      result = +[IMLibraryPlist authorFromPlistEntry:](IMLibraryPlist, "authorFromPlistEntry:", v9);
      if (result)
        return result;
    }
    else if (objc_msgSend(a3, "isEqualToString:", AEHelperStringMetadataTitleKey))
    {
      result = +[IMLibraryPlist titleFromPlistEntry:](IMLibraryPlist, "titleFromPlistEntry:", v9);
      if (result)
        return result;
    }
    else if (objc_msgSend(a3, "isEqualToString:", AEHelperStringMetadataGenreKey))
    {
      result = +[IMLibraryPlist genreFromPlistEntry:](IMLibraryPlist, "genreFromPlistEntry:", v9);
      if (result)
        return result;
    }
  }
  result = -[THAEHelper bookDescription](self, "bookDescription");
  if (result)
  {
    v10 = result;
    if (objc_msgSend(a3, "isEqualToString:", AEHelperStringMetadataAuthorKey))
    {
      return objc_msgSend(v10, "bookAuthor");
    }
    else if (objc_msgSend(a3, "isEqualToString:", AEHelperStringMetadataTitleKey))
    {
      return objc_msgSend(v10, "bookTitle");
    }
    else if (objc_msgSend(a3, "isEqualToString:", AEHelperStringMetadataGenreKey))
    {
      return objc_msgSend(v10, "genre");
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)helperDeletePersistentCache
{
  id v2;
  id v3;
  NSFileManager *v4;
  unsigned int v5;
  unsigned int v6;
  char v7;

  v2 = objc_msgSend(-[THAEHelper bookDescription](self, "bookDescription"), "contextDirectoryPath");
  if (v2)
  {
    v3 = v2;
    v7 = 0;
    v4 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
    v5 = -[NSFileManager fileExistsAtPath:isDirectory:](v4, "fileExistsAtPath:isDirectory:", v3, &v7);
    if (v7)
      v6 = v5;
    else
      v6 = 0;
    if (v6 == 1)
      -[NSFileManager removeItemAtPath:error:](v4, "removeItemAtPath:error:", v3, 0);
  }
}

- (id)helperMinifiedController
{
  return -[THiBooksMinifiedController initWithHelper:]([THiBooksMinifiedController alloc], "initWithHelper:", self);
}

- (void)helperViewControllerWithOptions:(id)a3 completion:(id)a4
{
  objc_msgSend(+[THApplePubAssetPlugin sharedPlugin](THApplePubAssetPlugin, "sharedPlugin"), "helper:viewControllerWithOptions:completion:", self, a3, a4);
}

- (BOOL)helperValidateBookAuthorizationWithError:(id *)a3 needsCoordination:(BOOL)a4
{
  void *v6;
  id v7;
  id v8;
  __CFDictionary *v9;
  id v10;
  void *v11;
  PFDContext *v12;
  PFDContext *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  BOOL v23;
  BOOL v24;
  id v25;
  uint64_t v26;
  id v27;
  id v29;

  if (a3)
  {
    *a3 = 0;
    v6 = objc_autoreleasePoolPush();
    v7 = objc_msgSend(objc_msgSend(-[THAEHelper bookDescription](self, "bookDescription"), "bookBundleUrl"), "path");
    if (!v7 || (v8 = v7, !objc_msgSend(v7, "length")))
    {
      v22 = objc_alloc((Class)NSError);
      v23 = 0;
      *a3 = objc_msgSend(v22, "initWithDomain:code:userInfo:", AssetEngineErrorDomain, 1001, 0);
LABEL_23:
      objc_autoreleasePoolPop(v6);
      v27 = *a3;
      return v23;
    }
    v9 = +[PFAXPackage rightsInfoForArchiveAtPath:](PFAXPackage, "rightsInfoForArchiveAtPath:", objc_msgSend(objc_msgSend(+[BLLibrary defaultBookLibrary](BLLibrary, "defaultBookLibrary"), "_perUserBookURLForBookURL:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v8)), "path"));
    v10 = +[PFAXPackage newAllEncryptionInfoFromAssetForArchiveAtPath:](PFAXPackage, "newAllEncryptionInfoFromAssetForArchiveAtPath:", v8);
    v11 = v10;
    if (!v9 && !objc_msgSend(objc_msgSend(v10, "allKeys"), "count"))
    {
      v24 = v11 == 0;
      goto LABEL_19;
    }
    v12 = -[PFDContext initWithRoot:pVwXvin61ocxeAjqxjwz:andRights:]([PFDContext alloc], "initWithRoot:pVwXvin61ocxeAjqxjwz:andRights:", v8, v11, v9);
    v13 = v12;
    v29 = 0;
    if (v12)
    {
      -[PFDContext dataRepresentationForEntryName:error:](v12, "dataRepresentationForEntryName:error:", CFSTR("OPS/assets/ncxExtensions.xml"), &v29);
      v14 = objc_msgSend(v29, "domain");
      v15 = objc_msgSend(v29, "code");
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("ibookserrors")))
      {
        if ((unint64_t)v15 + 42597 > 2)
        {
          if (!+[PFDContext isBagRefetchRequiredForStatus:](PFDContext, "isBagRefetchRequiredForStatus:", v15))goto LABEL_16;
          v25 = objc_alloc((Class)NSError);
          v26 = AssetEngineErrorDomain;
          v18 = objc_msgSend(v29, "userInfo");
          v19 = v25;
          v20 = v26;
          v21 = 2002;
        }
        else
        {
          v16 = objc_alloc((Class)NSError);
          v17 = AssetEngineErrorDomain;
          v18 = objc_msgSend(v29, "userInfo");
          v19 = v16;
          v20 = v17;
          v21 = 2003;
        }
        *a3 = objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, v21, v18);
      }
    }
LABEL_16:

    if (v13)
      v24 = v29 == 0;
    else
      v24 = 0;
LABEL_19:
    v23 = v24;

    goto LABEL_23;
  }
  return 0;
}

- (BOOL)acknowledgeAnnotationProvider:(id)a3 willMergeAnnotationsWithAssetVersionMismatch:(id)a4 assetID:(id)a5 assetURL:(id)a6
{
  id v11;

  if (a5)
  {
    v11 = objc_msgSend(-[THAEHelper bookDescription](self, "bookDescription"), "bookVersionString");
    -[THAnnotationSerializationManager handleAnnotationProvider:willMergeVersionMismatchedAnnotationsWithIncomingAnnotationAssetVersion:assetAssetVersion:assetID:assetURL:](+[THAnnotationSerializationManager annotationSerializationManagerWithAssetID:assetURL:bookVersionString:pathToAssetContextDirectory:isManagedBook:](THAnnotationSerializationManager, "annotationSerializationManagerWithAssetID:assetURL:bookVersionString:pathToAssetContextDirectory:isManagedBook:", a5, a6, v11, objc_msgSend(-[THAEHelper bookDescription](self, "bookDescription"), "contextDirectoryPath"), objc_msgSend(objc_msgSend(-[THAEHelper bookDescription](self, "bookDescription"), "asset"), "isManagedBook")), "handleAnnotationProvider:willMergeVersionMismatchedAnnotationsWithIncomingAnnotationAssetVersion:assetAssetVersion:assetID:assetURL:", a3, +[THBookVersion bookVersionWithVersionString:](THBookVersion, "bookVersionWithVersionString:", a4), +[THBookVersion bookVersionWithVersionString:](THBookVersion, "bookVersionWithVersionString:", v11), a5, a6);
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4, 0, a6), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAEHelper acknowledgeAnnotationProvider:willMergeAnnotationsWithAssetVersionMismatch:assetID:assetURL:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAssetHelper.m"), 471, CFSTR("invalid nil value for '%s'"), "assetID");
  }
  return 0;
}

- (BOOL)acknowledgeAnnotationProvider:(id)a3 willMergeAnnotationsWithAssertVersionMismatch:(id)a4 assetID:(id)a5 assetURL:(id)a6
{
  return -[THAEHelper acknowledgeAnnotationProvider:willMergeAnnotationsWithAssetVersionMismatch:assetID:assetURL:](self, "acknowledgeAnnotationProvider:willMergeAnnotationsWithAssetVersionMismatch:assetID:assetURL:", a3, a4, a5, a6);
}

@end
