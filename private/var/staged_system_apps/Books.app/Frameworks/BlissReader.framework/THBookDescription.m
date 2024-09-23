@implementation THBookDescription

- (THBookDescription)initWithAsset:(id)a3 summary:(id)a4
{
  THBookDescription *v6;
  NSObject *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THBookDescription;
  v6 = -[THBookDescription init](&v9, "init");
  if (v6)
  {
    v6->mAsset = (THAsset *)a3;
    v6->mBookSummary = (NSDictionary *)a4;
    v6->mOrientationLock = 0;
    v6->mCitationsAllowed = 0;
    v6->_absolutePathToDataMap = +[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable");
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6->_absolutePathToDataSync = (OS_dispatch_queue *)dispatch_queue_create("com.apple.THBookDescription.data", v7);
  }
  return v6;
}

- (PFDContext)drmContext
{
  PFDContext *result;

  result = self->mDrmContext;
  if (!result)
  {
    if (self->mLoadedDrmContext)
    {
      return 0;
    }
    else
    {
      result = (PFDContext *)-[PFDContextManager contextForArchive:](+[PFDContextManager sharedInstance](PFDContextManager, "sharedInstance"), "contextForArchive:", -[NSURL path](-[THAsset url](self->mAsset, "url"), "path"));
      self->mDrmContext = result;
      self->mLoadedDrmContext = 1;
    }
  }
  return result;
}

+ (id)summaryWithURL:(id)a3
{
  id result;
  id v6;
  id v7;
  NSString *v8;
  NSString *v9;
  uint64_t v10;
  id v11;

  v11 = 0;
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", objc_msgSend(a3, "path")))
  {
    result = objc_msgSend(a1, "readBookPropertiesFromURL:error:", a3, &v11);
    if (result)
      return result;
    v6 = v11;
    v7 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THBookDescription summaryWithURL:]");
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookDescription.m");
    if (v6)
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 92, CFSTR("Error reading properties from iBook: %@"), objc_msgSend(v11, "description"));
    else
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 96, CFSTR("Error reading properties from iBook."), v10);
  }
  return 0;
}

+ (THBookDescription)descriptionWithURL:(id)a3
{
  THBookDescription *result;
  THBookDescription *v5;
  __CFString *v6;
  id v7;
  id v8;
  id v9;
  const __CFString *v10;
  char v11;

  result = (THBookDescription *)objc_msgSend(a1, "summaryWithURL:");
  if (result)
  {
    v5 = result;
    v6 = (__CFString *)objc_msgSend(+[AEAssetEngine libraryMgr](AEAssetEngine, "libraryMgr"), "assetIDForAssetAtURLOnMainThread:", a3);
    if (!v6)
    {
      v7 = objc_msgSend(+[AEAssetEngine libraryMgr](AEAssetEngine, "libraryMgr"), "metadataForAssetAtURL:needsCoordination:", a3, 1);
      if (v7)
        v6 = (__CFString *)+[IMLibraryPlist storeIdFromPlistEntry:](IMLibraryPlist, "storeIdFromPlistEntry:", v7);
      else
        v6 = 0;
    }
    if (!-[__CFString length](v6, "length"))
    {
      v6 = (__CFString *)-[THBookDescription objectForKey:](v5, "objectForKey:", kTHBookInfoUUID);
      if (!-[__CFString length](v6, "length"))
      {
        v8 = -[THBookDescription objectForKey:](v5, "objectForKey:", kTHBookInfoOPF);
        v11 = 0;
        if (v8
          && (v9 = v8,
              -[NSFileManager fileExistsAtPath:isDirectory:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:isDirectory:", objc_msgSend(a3, "path"), &v11))&& v11)
        {
          v10 = (const __CFString *)+[NSString md5StringWithContentsOfFile:](NSString, "md5StringWithContentsOfFile:", objc_msgSend(objc_msgSend(a3, "URLByAppendingPathComponent:", v9), "path"));
        }
        else
        {
          v10 = THUniqueIdForPath(objc_msgSend(a3, "path"));
        }
        v6 = (__CFString *)v10;
      }
    }
    return -[THBookDescription initWithAsset:summary:]([THBookDescription alloc], "initWithAsset:summary:", +[THAsset assetWithURL:assetID:](THAsset, "assetWithURL:assetID:", a3, v6), v5);
  }
  return result;
}

+ (THBookDescription)descriptionWithURL:(id)a3 assetID:(id)a4
{
  THBookDescription *result;

  result = (THBookDescription *)objc_msgSend(a1, "summaryWithURL:");
  if (result)
    return -[THBookDescription initWithAsset:summary:]([THBookDescription alloc], "initWithAsset:summary:", +[THAsset assetWithURL:assetID:](THAsset, "assetWithURL:assetID:", a3, a4), result);
  return result;
}

+ (THBookDescription)descriptionWithAsset:(id)a3
{
  THBookDescription *result;

  result = (THBookDescription *)objc_msgSend(a1, "summaryWithURL:", objc_msgSend(a3, "url"));
  if (result)
    return -[THBookDescription initWithAsset:summary:]([THBookDescription alloc], "initWithAsset:summary:", a3, result);
  return result;
}

+ (id)displayNameFromFilePath:(id)a3
{
  return objc_msgSend(objc_msgSend(objc_msgSend(a3, "lastPathComponent"), "stringByDeletingPathExtension"), "tsu_stringByRemovingCharactersInSet:", +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":/")));
}

- (void)dealloc
{
  objc_super v3;

  -[PFDContextManager removeContextForArchive:](+[PFDContextManager sharedInstance](PFDContextManager, "sharedInstance"), "removeContextForArchive:", -[NSURL path](-[THAsset url](self->mAsset, "url"), "path"));

  self->mAsset = 0;
  self->mBookSummary = 0;

  dispatch_release((dispatch_object_t)self->_absolutePathToDataSync);
  v3.receiver = self;
  v3.super_class = (Class)THBookDescription;
  -[THBookDescription dealloc](&v3, "dealloc");
}

- (BOOL)isDevelopment
{
  return 0;
}

- (id)libraryManagerInfo
{
  return objc_msgSend(+[AEAssetEngine libraryMgr](AEAssetEngine, "libraryMgr"), "metadataForAssetAtURL:needsCoordination:", -[THAsset url](-[THBookDescription asset](self, "asset"), "url"), 1);
}

- (NSString)storeID
{
  return -[THAsset storeID](-[THBookDescription asset](self, "asset"), "storeID");
}

- (NSURL)storeURL
{
  return -[THAsset storeUrl](-[THBookDescription asset](self, "asset"), "storeUrl");
}

- (NSString)annotationID
{
  NSString *result;

  result = -[THBookDescription storeID](self, "storeID");
  if (!result)
    return -[THAsset assetID](-[THBookDescription asset](self, "asset"), "assetID");
  return result;
}

- (NSString)databaseKey
{
  return -[THAsset assetID](self->mAsset, "assetID");
}

- (NSString)contextDirectoryPath
{
  return (NSString *)+[THApplicationDelegate contextDirectoryForAsset:](THApplicationDelegate, "contextDirectoryForAsset:", self->mAsset);
}

- (NSURL)bookBundleUrl
{
  return -[THAsset url](-[THBookDescription asset](self, "asset"), "url");
}

- (id)dataForAbsoluteURL:(id)a3 context:(id)a4
{
  id v6;
  NSObject *absolutePathToDataSync;
  void *v8;
  PFDContext *v9;
  id v10;
  id v11;
  NSObject *v12;
  _QWORD v14[7];
  _QWORD block[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = sub_5AFAC;
  v20 = sub_5AFBC;
  v21 = 0;
  if (!a3)
    goto LABEL_9;
  v6 = objc_msgSend(a3, "path");
  absolutePathToDataSync = self->_absolutePathToDataSync;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5AFC8;
  block[3] = &unk_427D68;
  block[5] = v6;
  block[6] = &v16;
  block[4] = self;
  dispatch_sync(absolutePathToDataSync, block);
  v8 = (void *)v17[5];
  if (!v8)
  {
    v9 = -[THBookDescription drmContext](self, "drmContext");
    if (v9)
    {
      v10 = +[TSPData readOnlyDataFromDataRep:filename:context:](TSPData, "readOnlyDataFromDataRep:filename:context:", -[PFDContext dataRepresentationForFile:error:](v9, "dataRepresentationForFile:error:", v6, 0), objc_msgSend(v6, "lastPathComponent"), a4);
      v17[5] = (uint64_t)v10;
      if (!v10)
      {
LABEL_7:
        v11 = +[TSPData readOnlyDataWithoutDataDigestFromURL:context:](TSPData, "readOnlyDataWithoutDataDigestFromURL:context:", +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v6, 0), a4);
        v17[5] = (uint64_t)v11;
        if (v11)
          goto LABEL_8;
LABEL_9:
        v8 = 0;
        goto LABEL_10;
      }
    }
    else if (!v17[5])
    {
      goto LABEL_7;
    }
LABEL_8:
    v12 = self->_absolutePathToDataSync;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_5AFFC;
    v14[3] = &unk_427D90;
    v14[4] = self;
    v14[5] = v6;
    v14[6] = &v16;
    dispatch_sync(v12, v14);
    v8 = (void *)v17[5];
  }
LABEL_10:
  _Block_object_dispose(&v16, 8);
  return v8;
}

- (id)dataForDocRelativePath:(id)a3 context:(id)a4
{
  if (a3)
    return -[THBookDescription dataForAbsoluteURL:context:](self, "dataForAbsoluteURL:context:", +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", -[NSString stringByAppendingPathComponent:](-[NSURL path](-[THBookDescription bookBundleUrl](self, "bookBundleUrl"), "path"), "stringByAppendingPathComponent:", a3), 0), a4);
  else
    return 0;
}

- (id)urlForDocRelativePath:(id)a3
{
  id result;

  result = objc_msgSend(a3, "length");
  if (result)
    return +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", -[NSString stringByAppendingPathComponent:](-[NSURL path](-[THBookDescription bookBundleUrl](self, "bookBundleUrl"), "path"), "stringByAppendingPathComponent:", a3), 0);
  return result;
}

- (NSString)tspObjectContextPath
{
  return -[NSString stringByAppendingPathComponent:](-[THBookDescription contextDirectoryPath](self, "contextDirectoryPath"), "stringByAppendingPathComponent:", CFSTR("database"));
}

- (NSString)bookVersionString
{
  return (NSString *)-[NSDictionary objectForKey:](self->mBookSummary, "objectForKey:", kTHBookInfoBookVersionStringKey);
}

- (NSString)bookTitle
{
  NSString *v3;
  uint64_t v4;
  void *v6;

  v3 = -[THAsset title](-[THBookDescription asset](self, "asset"), "title");
  if (!-[NSString length](v3, "length"))
    v3 = -[NSDictionary objectForKey:](self->mBookSummary, "objectForKey:", kTHBookInfoTitleKey);
  if (-[NSString length](v3, "length"))
    return v3;
  v6 = (void *)objc_opt_class(self, v4);
  return (NSString *)objc_msgSend(v6, "displayNameFromFilePath:", -[NSURL path](-[THAsset url](self->mAsset, "url"), "path"));
}

- (void)loadMetadata
{
  -[THAsset loadMetadata](-[THBookDescription asset](self, "asset"), "loadMetadata");
}

- (NSString)bookSubtitle
{
  return (NSString *)-[NSDictionary objectForKey:](self->mBookSummary, "objectForKey:", kTHBookInfoSubtitleKey);
}

- (NSString)bookAuthor
{
  NSString *v3;

  v3 = -[NSDictionary objectForKey:](self->mBookSummary, "objectForKey:", kTHBookInfoAuthorKey);
  if (-[NSString length](v3, "length"))
    return v3;
  else
    return -[THAsset author](-[THBookDescription asset](self, "asset"), "author");
}

- (NSString)publisherName
{
  return (NSString *)-[NSDictionary objectForKey:](self->mBookSummary, "objectForKey:", kTHBookInfoPublisherKey);
}

- (NSString)genre
{
  NSString *v3;

  v3 = -[THAsset genre](-[THBookDescription asset](self, "asset"), "genre");
  if (-[NSString length](v3, "length"))
    return v3;
  else
    return (NSString *)-[NSDictionary objectForKey:](self->mBookSummary, "objectForKey:", kTHBookInfoGenreKey);
}

- (NSString)isbn
{
  return (NSString *)-[NSDictionary objectForKey:](self->mBookSummary, "objectForKey:", kTHBookInfoISBN);
}

- (NSString)uniquifier
{
  return (NSString *)-[NSDictionary objectForKey:](self->mBookSummary, "objectForKey:", kTHBookInfoUUID);
}

- (NSString)authoredVersion
{
  return (NSString *)-[NSDictionary objectForKey:](self->mBookSummary, "objectForKey:", kTHBookInfoAuthoredVersion);
}

- (NSString)requiredVersion
{
  return (NSString *)-[NSDictionary objectForKey:](self->mBookSummary, "objectForKey:", kTHBookInfoRequiredVersion);
}

- (BOOL)containsUnknownContentVersions
{
  uint64_t v3;

  v3 = objc_opt_class(NSNumber, a2);
  return objc_msgSend((id)TSUDynamicCast(v3, -[NSDictionary objectForKey:](self->mBookSummary, "objectForKey:", kTHBookInfoContentVersions)), "BOOLValue");
}

- (NSString)timestamp
{
  return (NSString *)-[NSDictionary objectForKey:](self->mBookSummary, "objectForKey:", kTHBookInfoTimestamp);
}

- (NSString)language
{
  return (NSString *)-[NSDictionary objectForKey:](self->mBookSummary, "objectForKey:", kTHBookInfoLanguageKey);
}

- (NSString)rawLanguage
{
  return (NSString *)-[NSDictionary objectForKey:](self->mBookSummary, "objectForKey:", kTHBookInfoRawLanguageKey);
}

- (BOOL)autoHyphenate
{
  return objc_msgSend(-[NSDictionary objectForKey:](self->mBookSummary, "objectForKey:", kTHBookInfoAutoHyphenate), "BOOLValue");
}

- (int)orientationLock
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;

  if (!self->mOrientationLock)
  {
    self->mOrientationLock = 3;
    v3 = objc_opt_class(NSString, a2);
    v4 = (void *)TSUDynamicCast(v3, -[NSDictionary objectForKey:](self->mBookSummary, "objectForKey:", kTHBookInfoOrientationLockKey));
    if (v4)
    {
      v5 = v4;
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("landscape-only")) & 1) != 0)
      {
        v6 = 2;
LABEL_7:
        self->mOrientationLock = v6;
        return self->mOrientationLock;
      }
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("portrait-only")))
      {
        v6 = 1;
        goto LABEL_7;
      }
    }
  }
  return self->mOrientationLock;
}

- (BOOL)isSample
{
  return -[THAsset isSample](-[THBookDescription asset](self, "asset"), "isSample");
}

+ (BOOL)isSampleAtURL:(id)a3
{
  id v3;

  if (a3)
  {
    v3 = objc_msgSend(+[AEAssetEngine libraryMgr](AEAssetEngine, "libraryMgr"), "metadataForAssetAtURL:needsCoordination:", a3, 1);
    if (v3)
      v3 = +[IMLibraryPlist isSampleFromPlistEntry:](IMLibraryPlist, "isSampleFromPlistEntry:", v3);
  }
  else
  {
    v3 = 0;
  }
  return objc_msgSend(v3, "BOOLValue");
}

- (BOOL)allowCopy
{
  if (-[THBookDescription isSample](self, "isSample"))
    return 0;
  if (-[PFDContext kiUanAfQBD5qIUraolUj](-[THBookDescription drmContext](self, "drmContext"), "kiUanAfQBD5qIUraolUj"))
    return objc_msgSend(objc_msgSend(+[AEAssetEngine storeMgr](AEAssetEngine, "storeMgr"), "clientApplicationController"), "allowCitationForProtectedBooks");
  return 1;
}

- (BOOL)bookIsPaginatedForPortrait
{
  return -[THBookDescription orientationLock](self, "orientationLock") == 1;
}

- (BOOL)bookIsPaginatedForLandscape
{
  return !-[THBookDescription bookIsPaginatedForPortrait](self, "bookIsPaginatedForPortrait");
}

- (BOOL)isEpub
{
  return -[THAsset isEpub](-[THBookDescription asset](self, "asset"), "isEpub");
}

- (THAsset)asset
{
  return self->mAsset;
}

- (NSDictionary)bookSummary
{
  return self->mBookSummary;
}

- (BOOL)citationsAllowed
{
  return self->mCitationsAllowed;
}

- (void)setCitationsAllowed:(BOOL)a3
{
  self->mCitationsAllowed = a3;
}

- (BOOL)isPreorderBook
{
  return self->mIsPreorderBook;
}

- (void)setIsPreorderBook:(BOOL)a3
{
  self->mIsPreorderBook = a3;
}

- (NSString)assetLogID
{
  return self->_assetLogID;
}

- (void)setAssetLogID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)userDataPath
{
  return -[NSString stringByAppendingPathComponent:](-[THBookDescription contextDirectoryPath](self, "contextDirectoryPath"), "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("userdata_v%ld.sqlite"), 0));
}

+ (BOOL)containsUnknownContentVersions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  const __CFString *v8;
  _UNKNOWN **v9;
  __objc2_meth_list **p_opt_class_meths;
  void *i;
  id v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  const __CFString *v19;
  id v20;
  _UNKNOWN **v21;
  uint64_t v22;
  BOOL v23;
  id v24;
  uint64_t v25;
  double v26;
  void *v27;
  void *v28;
  id v29;
  BOOL v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  if (qword_543338 != -1)
    dispatch_once(&qword_543338, &stru_42B3C0);
  if (objc_msgSend(a3, "hasPrefix:", CFSTR("{"))
    && objc_msgSend(a3, "hasSuffix:", CFSTR("}")))
  {
    v4 = objc_msgSend(objc_msgSend(a3, "substringWithRange:", 1, (char *)objc_msgSend(a3, "length") - 2), "componentsSeparatedByString:", CFSTR(";"));
  }
  else
  {
    v4 = 0;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v33;
    v8 = CFSTR("=");
    v9 = &AEAnnotationPopoverShouldHideNotification_ptr;
    p_opt_class_meths = &OBJC_PROTOCOL___THAccessibilityTSKScrollViewDelegate.opt_class_meths;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(v4);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i), "componentsSeparatedByString:", v8);
        if (objc_msgSend(v12, "count") == (char *)&dword_0 + 2)
        {
          v14 = objc_opt_class(v9[457]);
          *(_QWORD *)&v13 = TSUDynamicCast(v14, objc_msgSend(v12, "objectAtIndexedSubscript:", 0)).n128_u64[0];
          if (v15)
          {
            v16 = v15;
            if (!-[__objc2_meth_list objectForKey:](p_opt_class_meths[102], "objectForKey:", v15, v13))
              return 1;
            v17 = -[__objc2_meth_list objectForKey:](p_opt_class_meths[102], "objectForKey:", v16);
            v18 = v7;
            v19 = v8;
            v20 = v4;
            v21 = v9;
            v22 = objc_opt_class(v9[457]);
            v23 = 1;
            v24 = objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
            v25 = v22;
            v9 = v21;
            v4 = v20;
            v8 = v19;
            v7 = v18;
            *(_QWORD *)&v26 = TSUDynamicCast(v25, v24).n128_u64[0];
            v28 = v27;
            v29 = objc_msgSend(v17, "integerValue", v26);
            v30 = (uint64_t)v29 < (uint64_t)objc_msgSend(v28, "integerValue");
            p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___THAccessibilityTSKScrollViewDelegate + 48);
            if (v30)
              return v23;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v36, 16, v13);
      if (v6)
        continue;
      break;
    }
  }
  return 0;
}

+ (BOOL)readOpfMetadataWithArchive:(id)a3 toProperties:(id)a4
{
  NSString *v7;
  NSString *v8;
  NSString *v9;
  unsigned __int8 v10;
  xmlTextReader *v11;
  xmlTextReader *v12;
  int v13;
  int v14;
  int v15;
  const xmlChar *v16;
  int v17;
  int v18;
  const xmlChar *v19;
  int Attribute;
  const xmlChar *v21;
  const xmlChar *v22;
  const xmlChar *v23;
  const xmlChar *v24;
  const xmlChar *v25;
  NSNumber *v26;
  __CFString **v27;
  const xmlChar *v28;
  int v29;
  __CFString **v30;
  __CFString *v31;
  xmlChar *String;
  id v33;
  xmlChar *v34;
  id v35;
  int i;
  const xmlChar *v37;
  const xmlChar *v38;
  int v39;
  int j;
  const xmlChar *v41;
  const xmlChar *v42;
  NSNumber *v43;
  int v44;
  int v45;
  xmlChar *InnerXml;
  NSString *v47;
  int v48;
  int v49;
  int v50;
  id v52;
  unsigned __int8 v53;
  uint64_t v54;
  id v55;
  _QWORD **v56;
  _QWORD *v57[3];

  v7 = +[PFAXPackage opfXmlUriFromPackage:](PFAXPackage, "opfXmlUriFromPackage:");
  v8 = v7;
  if (v7)
  {
    if (-[NSString hasPrefix:](v7, "hasPrefix:", CFSTR("/")))
      v9 = v8;
    else
      v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/%@"), v8);
    objc_msgSend(a4, "setValue:forKey:", v9, kTHBookInfoOPF);
    v55 = objc_alloc_init((Class)NSAutoreleasePool);
    v10 = objc_msgSend(a3, "isEPUB");
    v11 = (xmlTextReader *)objc_msgSend(objc_msgSend(a3, "entryWithName:", v9), "xmlReader");
    v12 = v11;
    if (v11)
    {
      v53 = v10;
      v52 = a1;
      v57[0] = 0;
      v57[1] = 0;
      v56 = v57;
      v13 = xmlTextReaderDepth(v11);
      while (xmlTextReaderRead(v12) == 1)
      {
        v14 = xmlTextReaderDepth(v12);
        v15 = xmlTextReaderNodeType(v12);
        if (v14 == v13 && v15 == 15)
          break;
        if (v13 + 1 == v14 && v15 == 1)
        {
          v16 = xmlTextReaderConstLocalName(v12);
          if (xmlStrEqual(v16, (const xmlChar *)"metadata"))
          {
            v54 = v13 + 2;
            while (1)
            {
              while (1)
              {
LABEL_14:
                if (xmlTextReaderRead(v12) != 1)
                  goto LABEL_85;
                v17 = xmlTextReaderDepth(v12);
                v18 = xmlTextReaderNodeType(v12);
                if (v17 == v14 && v18 == 15)
                  goto LABEL_85;
                if (v54 != v17 || v18 != 1)
                  continue;
                v19 = xmlTextReaderConstLocalName(v12);
                if (!xmlStrEqual(v19, (const xmlChar *)"meta"))
                  break;
                Attribute = xmlTextReaderMoveToFirstAttribute(v12);
                v21 = 0;
                v22 = 0;
                v23 = 0;
                while (Attribute == 1)
                {
                  v24 = xmlTextReaderConstLocalName(v12);
                  v25 = xmlTextReaderConstValue(v12);
                  if (xmlStrEqual(v24, (const xmlChar *)"name"))
                  {
                    v21 = v25;
                    if (!v25)
                      goto LABEL_32;
                  }
                  else if (xmlStrEqual(v24, (const xmlChar *)"content"))
                  {
                    v22 = v25;
                    if (!v21)
                      goto LABEL_32;
                  }
                  else
                  {
                    if (xmlStrEqual(v24, (const xmlChar *)"property"))
                      v23 = v25;
                    if (!v21)
                      goto LABEL_32;
                  }
                  if (v22)
                    break;
LABEL_32:
                  Attribute = xmlTextReaderMoveToNextAttribute(v12);
                }
                if (xmlStrEqual((const xmlChar *)"ibooks:subtitle", v21))
                {
                  v26 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", v22);
                  v27 = &kTHBookInfoSubtitleKey;
                  goto LABEL_57;
                }
                if (xmlStrEqual((const xmlChar *)"ibooks:currentVersion", v21))
                {
                  v26 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", v22);
                  v27 = &kTHBookInfoAuthoredVersion;
                  goto LABEL_57;
                }
                if (xmlStrEqual((const xmlChar *)"ibooks:requiredVersion", v21))
                {
                  v26 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", v22);
                  v27 = &kTHBookInfoRequiredVersion;
                  goto LABEL_57;
                }
                if (xmlStrEqual((const xmlChar *)"ibooks:contentVersions", v21))
                {
                  if (objc_msgSend(v52, "containsUnknownContentVersions:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", v22)))
                  {
                    v26 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1);
                    v27 = &kTHBookInfoContentVersions;
LABEL_57:
                    objc_msgSend(a4, "setValue:forKey:", v26, *v27);
                  }
                }
                else if (xmlStrEqual((const xmlChar *)"ibooks:autoHyphenate", v21))
                {
                  v43 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSString isEqualToString:](+[NSString stringWithXmlString:](NSString, "stringWithXmlString:", v22), "isEqualToString:", CFSTR("yes")));
                  objc_msgSend(a4, "setValue:forKey:", v43, kTHBookInfoAutoHyphenate);
                }
                else if (xmlStrEqual((const xmlChar *)"ibooks:version", v23))
                {
                  InnerXml = xmlTextReaderReadInnerXml(v12);
                  v47 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", InnerXml);
                  objc_msgSend(a4, "setValue:forKey:", v47, kTHBookInfoBookVersionStringKey);
                  if (InnerXml)
                    xmlFree(InnerXml);
                }
              }
              v28 = xmlTextReaderConstNamespaceUri(v12);
              if (!xmlStrEqual(v28, (const xmlChar *)PFXCommonDublinCoreMetadataNS[0]))
                goto LABEL_14;
              v29 = xmlStrEqual((const xmlChar *)"title", v19);
              v30 = &kTHBookInfoTitleKey;
              if (v29)
                goto LABEL_37;
              if (xmlStrEqual((const xmlChar *)"creator", v19))
              {
                for (i = xmlTextReaderMoveToFirstAttribute(v12); ; i = xmlTextReaderMoveToNextAttribute(v12))
                {
                  if (i != 1)
                    goto LABEL_14;
                  v37 = xmlTextReaderConstLocalName(v12);
                  v38 = xmlTextReaderConstValue(v12);
                  if (xmlStrEqual(v37, (const xmlChar *)"role"))
                  {
                    if (xmlStrEqual(v38, (const xmlChar *)"aut"))
                      break;
                  }
                }
                v30 = &kTHBookInfoAuthorKey;
                goto LABEL_37;
              }
              v39 = xmlStrEqual((const xmlChar *)"publisher", v19);
              v30 = &kTHBookInfoPublisherKey;
              if (v39)
                goto LABEL_37;
              if (!xmlStrEqual((const xmlChar *)"identifier", v19))
              {
                v44 = xmlStrEqual((const xmlChar *)"date", v19);
                v30 = &kTHBookInfoTimestamp;
                if (!v44)
                {
                  v45 = xmlStrEqual((const xmlChar *)"language", v19);
                  v30 = &kTHBookInfoLanguageKey;
                  if (!v45)
                    goto LABEL_14;
                }
                goto LABEL_37;
              }
              for (j = xmlTextReaderMoveToFirstAttribute(v12); ; j = xmlTextReaderMoveToNextAttribute(v12))
              {
                if (j != 1)
                  goto LABEL_14;
                v41 = xmlTextReaderConstLocalName(v12);
                v42 = xmlTextReaderConstValue(v12);
                if ((v53 & 1) != 0)
                  break;
                if (xmlStrEqual(v41, (const xmlChar *)"scheme"))
                {
                  v48 = xmlStrEqual(v42, (const xmlChar *)"ISBN");
                  v30 = &kTHBookInfoISBN;
                  if (v48)
                    goto LABEL_37;
                  v49 = xmlStrEqual(v42, (const xmlChar *)"UUID");
                  goto LABEL_83;
                }
LABEL_66:
                ;
              }
              if (!xmlStrEqual(v41, (const xmlChar *)"id"))
                goto LABEL_66;
              v50 = xmlStrEqual(v42, (const xmlChar *)"isbn");
              v30 = &kTHBookInfoISBN;
              if (v50)
                goto LABEL_37;
              v49 = xmlStrEqual(v42, (const xmlChar *)"uid");
LABEL_83:
              v30 = &kTHBookInfoUUID;
              if (!v49)
                goto LABEL_14;
LABEL_37:
              v31 = *v30;
              if (*v30 && !xmlTextReaderIsEmptyElement(v12))
              {
                String = xmlTextReaderReadString(v12);
                v33 = objc_msgSend(objc_alloc((Class)NSString), "initWithXmlString:", String);
                if (!v33)
                {
                  v34 = xmlTextReaderReadInnerXml(v12);
                  v33 = objc_msgSend(objc_alloc((Class)NSString), "initWithXmlString:", v34);
                  if (v34)
                    xmlFree(v34);
                }
                if (-[__CFString isEqualToString:](v31, "isEqualToString:", kTHBookInfoLanguageKey))
                {
                  objc_msgSend(a4, "setValue:forKey:", v33, kTHBookInfoRawLanguageKey);
                  v35 = +[PFSConstants languageForString:](PFSConstants, "languageForString:", v33);

                  v33 = v35;
                }
                objc_msgSend(a4, "setValue:forKey:", v33, v31);
                if (String)
                  xmlFree(String);

              }
            }
          }
        }
      }
LABEL_85:
      sub_1C342C((uint64_t)&v56, v57[0]);
      if (v12)
        xmlFreeTextReader(v12);
    }

  }
  return v8 != 0;
}

+ (id)readBookPropertiesFromURL:(id)a3 error:(id *)a4
{
  id v7;
  PFXArchive *v8;

  objc_opt_class(PFXConstants);
  v7 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v8 = -[PFXArchive initWithPath:]([PFXArchive alloc], "initWithPath:", objc_msgSend(a3, "path"));
  if (!-[PFXArchive isValid](v8, "isValid"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THBookDescription(ApplePubReading) readBookPropertiesFromURL:error:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THBookDescriptionAdditions.mm"), 392, CFSTR("Failed to load valid archive"));
  if (-[PFXArchive isValid](v8, "isValid"))
  {
    -[PFXArchive setPreventUseOfEncryptionCache:](v8, "setPreventUseOfEncryptionCache:", +[THBookDescription isSampleAtURL:](THBookDescription, "isSampleAtURL:", a3));
    objc_msgSend(a1, "readOpfMetadataWithArchive:toProperties:", v8, v7);
    +[PFAIDisplayOptions readWithArchive:toProperties:](PFAIDisplayOptions, "readWithArchive:toProperties:", v8, v7);
  }

  if (a4 && *a4)
    return 0;
  return v7;
}

@end
