@implementation AEAssetEngine

+ (void)setAppInfoMgr:(id)a3
{
  objc_storeStrong((id *)&qword_30D670, a3);
}

+ (id)appInfoMgr
{
  return (id)qword_30D670;
}

+ (void)setStoreMgr:(id)a3
{
  objc_storeStrong((id *)&qword_30D678, a3);
}

+ (id)storeMgr
{
  return (id)qword_30D678;
}

+ (void)setLibraryMgr:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((id)qword_30D680 != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&qword_30D680, a3);
    v4 = v5;
  }

}

+ (id)libraryMgr
{
  return (id)qword_30D680;
}

+ (id)cachePathForAssetID:(id)a3
{
  return +[AEAssetEngine cachePathForAssetType:withAssetID:](AEAssetEngine, "cachePathForAssetType:withAssetID:", CFSTR("AE"), a3);
}

+ (id)cachePathForAssetType:(id)a3 withAssetID:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSFileManager *v13;
  unsigned __int8 v14;
  id v15;
  void *v16;
  void *v17;
  id v19;

  v5 = a4;
  v6 = a3;
  if ((unint64_t)objc_msgSend(v5, "length") < 2)
    v7 = CFSTR("AE");
  else
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringToIndex:", 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication applicationCacheDirectory](UIApplication, "applicationCacheDirectory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("AssetInfo")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", v6));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", v7));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathComponent:", v5));
  v13 = objc_opt_new(NSFileManager);
  v19 = 0;
  v14 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v13, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v19);
  v15 = v19;
  v16 = v15;
  if ((v14 & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedDescription"));
    +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Could not create cache [path: %@] %@"), v12, v17);

  }
  return v12;
}

@end
