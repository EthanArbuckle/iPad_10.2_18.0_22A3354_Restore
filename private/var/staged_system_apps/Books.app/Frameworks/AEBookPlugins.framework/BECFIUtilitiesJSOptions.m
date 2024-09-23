@implementation BECFIUtilitiesJSOptions

+ (id)cfiUtilitiesJSOptionsForBookInfoSnapshot:(id)a3 ordinal:(unint64_t)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = objc_alloc((Class)BECFIUtilitiesJSOptions);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "manifestId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assetID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "spineIndexInPackage"));

  v10 = objc_msgSend(v6, "initWithManifestId:assetId:chapterIndex:spineIndex:", v7, v8, a4, objc_msgSend(v9, "unsignedIntegerValue"));
  return v10;
}

@end
