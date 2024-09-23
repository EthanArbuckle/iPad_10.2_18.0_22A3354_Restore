@implementation PFXArchive

- (PFXArchive)initWithPath:(id)a3
{
  return -[PFXArchive initWithPath:allowArchive:](self, "initWithPath:allowArchive:", a3, 0);
}

- (PFXArchive)initWithPath:(id)a3 allowArchive:(BOOL)a4
{
  _BOOL4 v4;
  PFXArchive *v6;
  objc_class *v7;
  uint64_t v8;
  char v10;
  objc_super v11;

  v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PFXArchive;
  v6 = -[PFXArchive init](&v11, "init");
  if (v6)
  {
    v10 = 0;
    if (-[NSFileManager fileExistsAtPath:isDirectory:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:isDirectory:", a3, &v10))
    {
      if (v10)
      {
        v7 = (objc_class *)a3;
        v8 = 8;
LABEL_5:
        *(Class *)((char *)&v6->super.isa + v8) = v7;
        v6->mRootPath = (NSString *)a3;
        return v6;
      }
      if (v4
        && +[SFUZipArchive isZipArchiveAtPath:](SFUZipArchive, "isZipArchiveAtPath:", a3))
      {
        v7 = (objc_class *)objc_msgSend(objc_alloc((Class)SFUZipArchive), "initWithPath:collapseCommonRootDirectory:", a3, 0);
        v8 = 24;
        goto LABEL_5;
      }
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXArchive;
  -[PFXArchive dealloc](&v3, "dealloc");
}

- (BOOL)isDirectory
{
  return self->mFolderRoot != 0;
}

- (BOOL)isEPUB
{
  return objc_msgSend(CFSTR("epub"), "isEqualToString:", -[NSString lowercaseString](-[NSString pathExtension](self->mRootPath, "pathExtension"), "lowercaseString"));
}

- (NSString)rootFolder
{
  if (!-[PFXArchive isDirectory](self, "isDirectory"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXArchive rootFolder]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/PFXArchive.mm"), 92, CFSTR("only call when directory"));
  return self->mFolderRoot;
}

- (NSString)perUserRootFolder
{
  NSString *result;

  if (!-[PFXArchive isDirectory](self, "isDirectory"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXArchive perUserRootFolder]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/PFXArchive.mm"), 98, CFSTR("only call when directory"));
  result = self->mPerUserRoot;
  if (!result)
  {
    if (self->mFolderRoot)
    {
      result = (NSString *)objc_msgSend(objc_msgSend(+[BLLibrary defaultBookLibrary](BLLibrary, "defaultBookLibrary"), "_perUserBookURLForBookURL:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", self->mFolderRoot)), "path");
      self->mPerUserRoot = result;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)checkEncryption
{
  PFDContext *v3;
  __CFDictionary *v4;
  id v5;
  void *v6;
  PFDContext *v7;

  v3 = -[PFDContextManager contextForArchive:](+[PFDContextManager sharedInstance](PFDContextManager, "sharedInstance"), "contextForArchive:", self->mFolderRoot);
  if (!v3)
  {
    v4 = +[PFAXPackage rightsInfoForArchive:](PFAXPackage, "rightsInfoForArchive:", self);
    v5 = +[PFAXPackage newAllEncryptionInfoForArchive:](PFAXPackage, "newAllEncryptionInfoForArchive:", self);
    v6 = v5;
    if (v4 || objc_msgSend(objc_msgSend(v5, "allKeys"), "count"))
    {
      v3 = -[PFDContext initWithRoot:pVwXvin61ocxeAjqxjwz:andRights:]([PFDContext alloc], "initWithRoot:pVwXvin61ocxeAjqxjwz:andRights:", self->mFolderRoot, v6, v4);
      if (-[PFDContextManager setContext:forArchive:](+[PFDContextManager sharedInstance](PFDContextManager, "sharedInstance"), "setContext:forArchive:", v3, self->mFolderRoot))
      {

      }
      else
      {
        v7 = v3;
      }
    }
    else
    {
      v3 = 0;
    }

  }
  -[PFXArchive setDrmContext:](self, "setDrmContext:", v3);
  self->mEncryptionChecked = 1;
}

- (id)fontObfuscationInfo
{
  if (!self->mEncryptionChecked)
    -[PFXArchive checkEncryption](self, "checkEncryption");
  return -[PFDContext fontObfuscation](self->mDrmContext, "fontObfuscation");
}

- (id)decryptEntryWithName:(id)a3 error:(id *)a4
{
  PFDContext *mDrmContext;

  if (!self->mEncryptionChecked)
    -[PFXArchive checkEncryption](self, "checkEncryption");
  mDrmContext = self->mDrmContext;
  if (mDrmContext)
    return -[PFDContext dataRepresentationForEntryName:error:](mDrmContext, "dataRepresentationForEntryName:error:", a3, a4);
  if ((objc_msgSend(a3, "hasPrefix:", CFSTR("/")) & 1) == 0)
    a3 = objc_msgSend(CFSTR("/"), "stringByAppendingString:", a3);
  return -[PFXArchive entryWithName:](self, "entryWithName:", a3);
}

- (id)entryWithName:(id)a3
{
  id v3;
  NSString *mFolderRoot;
  NSString *v6;
  id v7;
  id v8;
  id v9;

  v3 = a3;
  mFolderRoot = self->mFolderRoot;
  if (mFolderRoot)
  {
    v6 = -[NSString stringByAppendingPathComponent:](mFolderRoot, "stringByAppendingPathComponent:", a3);
    if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", v6))
    {
      v7 = objc_msgSend(objc_alloc((Class)SFUFileDataRepresentation), "initWithPath:", v6);
      return v7;
    }
  }
  else if (self->mZipArchive)
  {
    if (objc_msgSend(a3, "hasPrefix:", CFSTR("/")))
      v3 = objc_msgSend(v3, "substringFromIndex:", 1);
    v8 = -[SFUZipArchive entryWithName:](self->mZipArchive, "entryWithName:", v3);
    if (v8)
    {
      v9 = objc_msgSend(v8, "data");
      if (v9)
      {
        v7 = objc_msgSend(objc_alloc((Class)SFUMemoryDataRepresentation), "initWithDataNoCopy:", v9);
        return v7;
      }
    }
  }
  return 0;
}

- (id)createDataWithName:(id)a3 error:(id *)a4
{
  id v4;
  id v5;

  if (!self->mFolderRoot)
    return 0;
  v4 = -[PFXArchive decryptEntryWithName:error:](self, "decryptEntryWithName:error:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init((Class)NSMutableData);
    if (objc_msgSend(v4, "readIntoData:", v5))
      v4 = v5;
    else
      v4 = 0;

  }
  return v4;
}

- (BOOL)copyEntry:(id)a3 toFile:(id)a4
{
  id v5;
  NSFileManager *v6;

  if (self->mFolderRoot
    && (v5 = -[PFXArchive entryWithName:](self, "entryWithName:", a3),
        v6 = +[NSFileManager defaultManager](NSFileManager, "defaultManager"),
        -[NSFileManager fileExistsAtPath:](v6, "fileExistsAtPath:", objc_msgSend(v5, "path"))))
  {
    return -[NSFileManager copyItemAtPath:toPath:error:](v6, "copyItemAtPath:toPath:error:", objc_msgSend(v5, "path"), a4, 0);
  }
  else
  {
    return 0;
  }
}

- (id)entries
{
  id result;

  if (self->mFolderRoot)
    return -[NSFileManager contentsOfDirectoryAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "contentsOfDirectoryAtPath:error:");
  result = self->mZipArchive;
  if (result)
    return objc_msgSend(result, "allEntryNames");
  return result;
}

- (id)entriesWithinFolder:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = -[PFXArchive entries](self, "entries");
  v5 = objc_alloc_init((Class)NSMutableArray);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v10, "rangeOfString:", a3))
          objc_msgSend(v5, "addObject:", v10);
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  return v5;
}

- (BOOL)isValid
{
  return self->mFolderRoot || self->mZipArchive != 0;
}

- (PFDContext)drmContext
{
  return self->mDrmContext;
}

- (void)setDrmContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSError)drmContextCheckError
{
  return self->mDrmContextCheckError;
}

- (void)setDrmContextCheckError:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (THAsset)asset
{
  return self->mAsset;
}

- (void)setAsset:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (THBookVersion)bookVersion
{
  return self->mBookVersion;
}

- (void)setBookVersion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)preventUseOfEncryptionCache
{
  return self->mPreventUseOfEncryptionCache;
}

- (void)setPreventUseOfEncryptionCache:(BOOL)a3
{
  self->mPreventUseOfEncryptionCache = a3;
}

- (NSString)rootPath
{
  return self->mRootPath;
}

@end
