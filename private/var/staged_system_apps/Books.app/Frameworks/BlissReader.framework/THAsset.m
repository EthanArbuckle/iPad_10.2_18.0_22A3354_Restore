@implementation THAsset

- (THAsset)initWithURL:(id)a3 assetID:(id)a4 type:(id)a5
{
  THAsset *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)THAsset;
  v8 = -[THAsset init](&v10, "init");
  if (v8)
  {
    v8->mURL = (NSURL *)a3;
    v8->mAssetID = (NSString *)objc_msgSend(a4, "copy");
    v8->mType = (NSString *)objc_msgSend(a5, "copy");
    v8->_unfairLock._os_unfair_lock_opaque = 0;
  }
  return v8;
}

- (THAsset)initWithURL:(id)a3 assetID:(id)a4
{
  return -[THAsset initWithURL:assetID:type:](self, "initWithURL:assetID:type:", a3, a4, CFSTR("application/ibooks"));
}

+ (THAsset)assetWithURL:(id)a3 assetID:(id)a4 type:(id)a5
{
  return (THAsset *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:assetID:type:", a3, a4, a5);
}

+ (THAsset)assetWithURL:(id)a3 assetID:(id)a4
{
  return (THAsset *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:assetID:", a3, a4);
}

- (void)loadMetadata
{
  -[THAsset p_libraryManagerInfoWithCoordination:](self, "p_libraryManagerInfoWithCoordination:", 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THAsset;
  -[THAsset dealloc](&v3, "dealloc");
}

+ (BOOL)asset:(id)a3 isSameAsAsset:(id)a4
{
  BOOL result;

  result = 0;
  if (a3 && a4)
    return !objc_msgSend(objc_msgSend(a3, "assetType"), "compare:", objc_msgSend(a4, "assetType"))
        && objc_msgSend(objc_msgSend(a3, "assetID"), "compare:", objc_msgSend(a4, "assetID")) == 0;
  return result;
}

- (NSString)assetType
{
  return self->mType;
}

- (NSString)assetID
{
  return self->mAssetID;
}

- (NSURL)url
{
  return self->mURL;
}

- (BOOL)isEpub
{
  return objc_msgSend(CFSTR("epub"), "isEqualToString:", -[NSString lowercaseString](-[NSURL pathExtension](-[THAsset url](self, "url"), "pathExtension"), "lowercaseString"));
}

+ (THAsset)assetWithAsset:(id)a3
{
  return +[THAsset assetWithURL:assetID:](THAsset, "assetWithURL:assetID:", objc_msgSend(a3, "url"), objc_msgSend(a3, "assetID"));
}

- (id)p_libraryManagerInfo
{
  return -[THAsset p_libraryManagerInfoWithCoordination:](self, "p_libraryManagerInfoWithCoordination:", 1);
}

- (id)p_libraryManagerInfoWithCoordination:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_unfairLock;

  v3 = a3;
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  if (!self->_metadata)
    self->_metadata = (NSDictionary *)objc_msgSend(+[AEAssetEngine libraryMgr](AEAssetEngine, "libraryMgr"), "metadataForAssetAtURL:needsCoordination:", -[THAsset url](self, "url"), v3);
  os_unfair_lock_unlock(p_unfairLock);
  return self->_metadata;
}

- (NSURL)storeUrl
{
  return (NSURL *)objc_msgSend(objc_msgSend(+[AEAssetEngine storeMgr](AEAssetEngine, "storeMgr"), "clientApplicationController"), "bookUrlForStoreId:", -[THAsset storeID](self, "storeID"));
}

- (NSString)author
{
  NSString *result;

  result = -[THAsset p_libraryManagerInfo](self, "p_libraryManagerInfo");
  if (result)
    return (NSString *)+[IMLibraryPlist authorFromPlistEntry:](IMLibraryPlist, "authorFromPlistEntry:", result);
  return result;
}

- (NSString)title
{
  NSString *result;

  result = -[THAsset p_libraryManagerInfo](self, "p_libraryManagerInfo");
  if (result)
    return (NSString *)+[IMLibraryPlist titleFromPlistEntry:](IMLibraryPlist, "titleFromPlistEntry:", result);
  return result;
}

- (NSString)storeID
{
  NSString *result;

  result = -[THAsset p_libraryManagerInfo](self, "p_libraryManagerInfo");
  if (result)
    return (NSString *)+[IMLibraryPlist storeIdFromPlistEntry:](IMLibraryPlist, "storeIdFromPlistEntry:", result);
  return result;
}

- (NSString)genre
{
  NSString *result;

  result = -[THAsset p_libraryManagerInfo](self, "p_libraryManagerInfo");
  if (result)
    return (NSString *)+[IMLibraryPlist genreFromPlistEntry:](IMLibraryPlist, "genreFromPlistEntry:", result);
  return result;
}

- (BOOL)isSample
{
  id v2;

  v2 = -[THAsset p_libraryManagerInfo](self, "p_libraryManagerInfo");
  if (v2)
    LOBYTE(v2) = objc_msgSend(+[IMLibraryPlist isSampleFromPlistEntry:](IMLibraryPlist, "isSampleFromPlistEntry:", v2), "BOOLValue");
  return (char)v2;
}

- (BOOL)isManagedBook
{
  return objc_msgSend(+[IMLibraryPlist isManagedBookFromURL:](IMLibraryPlist, "isManagedBookFromURL:", -[THAsset url](self, "url")), "BOOLValue");
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (os_unfair_lock_s)unfairLock
{
  return self->_unfairLock;
}

- (void)setUnfairLock:(os_unfair_lock_s)a3
{
  self->_unfairLock = a3;
}

@end
