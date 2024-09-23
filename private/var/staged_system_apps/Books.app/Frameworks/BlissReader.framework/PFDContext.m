@implementation PFDContext

- (PFDContext)initWithRoot:(id)a3 pVwXvin61ocxeAjqxjwz:(id)a4 andRights:(id)a5
{
  PFDContext *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  NSUInteger v15;
  NSUInteger v16;
  char *v17;
  NSArray *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *i;
  void *v24;
  char *v25;
  int v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _QWORD v33[2];
  _BYTE v34[128];

  v32.receiver = self;
  v32.super_class = (Class)PFDContext;
  v8 = -[PFDContext init](&v32, "init");
  if (v8)
  {
    v8->mRoot = (NSString *)objc_msgSend(a3, "stringByStandardizingPath");
    v8->mRights = (NSDictionary *)a5;
    v9 = objc_opt_class(NSDictionary);
    TSUDynamicCast(v9, objc_msgSend(a4, "objectForKey:", PFDEpubEncryptionParserEncryptionInfoKey));
    v8->mEncryption = (NSDictionary *)v10;
    v11 = objc_opt_class(NSArray);
    TSUDynamicCast(v11, objc_msgSend(a4, "objectForKey:", PFDEpubEncryptionParserFontObfuscationInfoKey));
    v8->mFontObfuscation = (NSArray *)v12;
    v13 = objc_opt_class(NSDictionary);
    TSUDynamicCast(v13, objc_msgSend(a4, "objectForKey:", PFDEpubEncryptionParserFairplayInfoKey));
    v8->mFairplay = (NSDictionary *)v14;
    v8->mSessions = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v8->mSessionsLock._os_unfair_lock_opaque = 0;
    v15 = -[NSDictionary count](v8->mFairplay, "count");
    v16 = -[NSDictionary count](v8->mRights, "count");
    if (v16 && v15)
    {
      v17 = (char *)malloc_type_calloc(v16, 0x20uLL, 0x1050040E8CD93FDuLL);
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v18 = -[NSDictionary allValues](v8->mRights, "allValues");
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v19)
      {
        v20 = v19;
        v21 = 0;
        v22 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(_QWORD *)v29 != v22)
              objc_enumerationMutation(v18);
            v24 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
            if (v24)
            {
              v25 = &v17[32 * v21];
              *(_DWORD *)v25 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), "length");
              *((_QWORD *)v25 + 1) = objc_msgSend(v24, "bytes");
              *((_DWORD *)v25 + 4) = 0;
              *((_QWORD *)v25 + 3) = 0;
              ++v21;
            }
          }
          v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        }
        while (v20);
      }
      else
      {
        v21 = 0;
      }
      v26 = afa946271209074f393f(v17, v21, &v8->mFPContext);
      if (v26)
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFDContext initWithRoot:pVwXvin61ocxeAjqxjwz:andRights:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/DRM/PFDContext.mm"), 111, CFSTR("Init failed: %ld"), v26);
      free(v17);
    }
    if (qword_543798 != -1)
      dispatch_once(&qword_543798, &stru_42C2D0);
    os_unfair_lock_lock((os_unfair_lock_t)&dword_5437A8);
    objc_msgSend((id)qword_5437A0, "addObject:", v8);
    if (objc_msgSend((id)qword_5437A0, "count") == (char *)&dword_0 + 1)
    {
      v33[0] = sub_202BDC;
      v33[1] = sub_202BF8;
      C3DSetFileDecryptionCallbacks(v33, 0);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_5437A8);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[PFDContext teardown](self, "teardown");
  v3.receiver = self;
  v3.super_class = (Class)PFDContext;
  -[PFDContext dealloc](&v3, "dealloc");
}

- (void)teardown
{
  FPUnitContextOpaque_ *mFPContext;
  int v4;
  NSMutableDictionary *mSessions;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  mFPContext = self->mFPContext;
  if (mFPContext)
  {
    v4 = c12668d1789a8d63d19a(mFPContext, a2);
    if (v4)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFDContext teardown]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/DRM/PFDContext.mm"), 135, CFSTR("Destroy failed: %ld"), v4);
    self->mFPContext = 0;
  }

  self->mRoot = 0;
  self->mFairplay = 0;

  self->mEncryption = 0;
  self->mRights = 0;

  self->mFontObfuscation = 0;
  os_unfair_lock_lock(&self->mSessionsLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  mSessions = self->mSessions;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](mSessions, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(mSessions);
        objc_msgSend(-[NSMutableDictionary objectForKey:](self->mSessions, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i)), "EXC6L9VofSI7ZuGjFga5qXiB");
      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](mSessions, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  self->mSessions = 0;
  os_unfair_lock_unlock(&self->mSessionsLock);
  os_unfair_lock_lock((os_unfair_lock_t)&dword_5437A8);
  objc_msgSend((id)qword_5437A0, "removeObject:", self);
  if (!objc_msgSend((id)qword_5437A0, "count"))
    C3DSetFileDecryptionCallbacks(0, 0);
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_5437A8);
}

- (BOOL)kiUanAfQBD5qIUraolUj
{
  return self->mFairplay && self->mRights != 0;
}

- (id)dataWithContentsOfFile:(id)a3 error:(id *)a4
{
  id v6;
  id v7;

  v6 = objc_msgSend(a3, "stringByStandardizingPath");
  v7 = +[NSMutableData data](NSMutableData, "data");
  objc_msgSend(-[PFDContext dataRepresentationForFile:error:](self, "dataRepresentationForFile:error:", v6, a4), "readIntoData:", v7);
  return v7;
}

- (id)dataWithContentsOfURL:(id)a3 error:(id *)a4
{
  return -[PFDContext dataWithContentsOfFile:error:](self, "dataWithContentsOfFile:error:", objc_msgSend(a3, "path"), a4);
}

- (id)dataRepresentationForEntryName:(id)a3 error:(id *)a4
{
  return -[PFDContext dataRepresentationForFile:error:](self, "dataRepresentationForFile:error:", -[NSString stringByAppendingPathComponent:](self->mRoot, "stringByAppendingPathComponent:", a3), a4);
}

- (BOOL)p_isFamilyDeauthorizedError:(id)a3
{
  id v4;
  unint64_t v5;
  unsigned int v6;
  BOOL v8;

  v4 = objc_msgSend(a3, "domain");
  v5 = (unint64_t)objc_msgSend(a3, "code");
  v6 = objc_msgSend(v4, "isEqualToString:", CFSTR("ibookserrors"));
  v8 = v5 == -42597 || v5 >> 1 == 0x7FFFFFFFFFFFACCELL;
  return v6 && v8;
}

- (id)dataRepresentationForFile:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  PFDFileDataRepresentation *v8;
  id result;
  void *v10;

  v6 = objc_msgSend(a3, "stringByStandardizingPath");
  v10 = 0;
  v7 = -[PFDContext agSuxzs6g5UyvRU64xGP:error:](self, "agSuxzs6g5UyvRU64xGP:error:", v6, &v10);
  if (v7)
  {
    v8 = -[PFDFileDataRepresentation initWithPath:J00oNrNGGvbpr5VY2bUB:]([PFDFileDataRepresentation alloc], "initWithPath:J00oNrNGGvbpr5VY2bUB:", v6, v7);
    goto LABEL_7;
  }
  if (!-[PFDContext p_isFamilyDeauthorizedError:](self, "p_isFamilyDeauthorizedError:", v10))
  {
    v8 = (PFDFileDataRepresentation *)objc_msgSend(objc_alloc((Class)SFUFileDataRepresentation), "initWithPath:", v6);
LABEL_7:
    result = v8;
    if (!a4)
      return result;
    goto LABEL_8;
  }
  result = 0;
  if (a4)
LABEL_8:
    *a4 = v10;
  return result;
}

- (CGImageSource)newImageSourceWithContentsOfURL:(id)a3 error:(id *)a4
{
  return -[PFDContext newImageSourceWithContentsOfFile:error:](self, "newImageSourceWithContentsOfFile:error:", objc_msgSend(a3, "path"), a4);
}

- (CGImageSource)newImageSourceWithContentsOfFile:(id)a3 error:(id *)a4
{
  CGImageSource *result;
  CGDataProvider *v5;
  CGImageSource *v6;

  result = (CGImageSource *)objc_msgSend(-[PFDContext dataRepresentationForFile:error:](self, "dataRepresentationForFile:error:", a3, a4), "cgDataProvider");
  if (result)
  {
    v5 = result;
    v6 = CGImageSourceCreateWithDataProvider(result, 0);
    CGDataProviderRelease(v5);
    return v6;
  }
  return result;
}

- (id)ABBin6XnCd5TmAcWQlyb:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  BuLr3rwnVU31zt9OioJ56 *v8;
  BuLr3rwnVU31zt9OioJ56 *v10;
  id v11;

  v6 = -[PFDContext p_sinfForEntryWithName:](self, "p_sinfForEntryWithName:", a3);
  if (!v6)
    return 0;
  v7 = v6;
  os_unfair_lock_lock(&self->mSessionsLock);
  v8 = (BuLr3rwnVU31zt9OioJ56 *)-[NSMutableDictionary objectForKey:](self->mSessions, "objectForKey:", v7);
  if (!v8)
  {
    v10 = objc_alloc_init(BuLr3rwnVU31zt9OioJ56);
    v8 = v10;
    if (v10)
    {
      v11 = -[BuLr3rwnVU31zt9OioJ56 setupWithSinfData:](v10, "setupWithSinfData:", v7);
      if (v11)
      {
        v8 = 0;
        if (a4)
          *a4 = v11;
      }
      else
      {
        -[NSMutableDictionary setObject:forKey:](self->mSessions, "setObject:forKey:", v8, v7);
      }
    }
  }
  os_unfair_lock_unlock(&self->mSessionsLock);
  return v8;
}

- (id)agSuxzs6g5UyvRU64xGP:(id)a3 error:(id *)a4
{
  id result;

  result = -[PFDContext p_entryNameForPath:](self, "p_entryNameForPath:", a3);
  if (result)
    return -[PFDContext ABBin6XnCd5TmAcWQlyb:error:](self, "ABBin6XnCd5TmAcWQlyb:error:", result, a4);
  return result;
}

- (BOOL)authorizeAVAssetForPlayback:(id)a3
{
  return -[PFDContext authorizeAVPlayerItemForPlayback:](self, "authorizeAVPlayerItemForPlayback:", +[AVPlayerItem playerItemWithAsset:](AVPlayerItem, "playerItemWithAsset:", a3));
}

- (BOOL)authorizeAVPlayerItemForPlayback:(id)a3
{
  return 1;
}

- (BOOL)p_canDecryptFileAtURL:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;

  v4 = objc_msgSend(objc_msgSend(a3, "URLByStandardizingPath"), "path");
  if (self->mRoot)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "hasPrefix:");
    if (v6)
      LOBYTE(v6) = -[PFDContext p_sinfForEntryWithName:](self, "p_sinfForEntryWithName:", -[PFDContext p_entryNameForPath:](self, "p_entryNameForPath:", v5)) != 0;
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (id)p_entryNameForPath:(id)a3
{
  id v4;
  void *v5;

  v4 = objc_msgSend(a3, "stringByStandardizingPath");
  if (self->mRoot && (v5 = v4, objc_msgSend(v4, "hasPrefix:")))
    return objc_msgSend(v5, "substringFromIndex:", -[NSString length](self->mRoot, "length"));
  else
    return 0;
}

- (id)p_sinfForEntryWithName:(id)a3
{
  id v3;
  id v5;
  id v6;

  v3 = a3;
  if (objc_msgSend(a3, "hasPrefix:", CFSTR("/")))
    v3 = objc_msgSend(v3, "substringFromIndex:", 1);
  objc_sync_enter(self);
  v5 = -[NSDictionary objectForKey:](self->mFairplay, "objectForKey:", v3);
  if (v5)
    v6 = -[NSDictionary objectForKey:](self->mRights, "objectForKey:", v5);
  else
    v6 = 0;
  objc_sync_exit(self);
  if (v5)
    return v6;
  else
    return 0;
}

- (id)MNdKOWwPKnL43Vwwhvrd
{
  id v3;
  id v4;
  _OWORD v6[4];
  _BYTE v7[128];

  objc_sync_enter(self);
  memset(v6, 0, sizeof(v6));
  if (-[NSDictionary countByEnumeratingWithState:objects:count:](self->mFairplay, "countByEnumeratingWithState:objects:count:", v6, v7, 16)&& (v3 = -[NSDictionary objectForKey:](self->mFairplay, "objectForKey:", **((_QWORD **)&v6[0] + 1))) != 0)
  {
    v4 = -[NSDictionary objectForKey:](self->mRights, "objectForKey:", v3);
  }
  else
  {
    v4 = 0;
  }
  objc_sync_exit(self);
  return v4;
}

+ (void)Xj3eVHDeBoTD6fVn6fY8:(id)a3 completion:(id)a4
{
  +[BuLr3rwnVU31zt9OioJ56 cmRVmZXRjaEJhZ0ZvckRTSUQ:completion:](BuLr3rwnVU31zt9OioJ56, "cmRVmZXRjaEJhZ0ZvckRTSUQ:completion:", a3, a4);
}

+ (BOOL)isBagRefetchRequiredForStatus:(int64_t)a3
{
  return +[BuLr3rwnVU31zt9OioJ56 XNRYWdSZWZldGNoUmxdWlyWQ:](BuLr3rwnVU31zt9OioJ56, "XNRYWdSZWZldGNoUmxdWlyWQ:", a3);
}

- (NSArray)fontObfuscation
{
  return self->mFontObfuscation;
}

@end
