@implementation BKAssetMetadataCache

- (id)coverWritingModeLanguageAndPageProgressionDirectionFromAssetID:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new(AEAssetMetadataCache);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "coverWritingModeLanguageAndPageProgressionDirectionFromAssetID:", v3));

  return v5;
}

- (id)plistEntryAsDictionaryFromAssetID:(id)a3 path:(id)a4 needsCoordination:(BOOL)a5
{
  return 0;
}

- (void)saveTitle:(id)a3 author:(id)a4 genre:(id)a5 language:(id)a6 pageProgressionDirection:(id)a7 forAssetID:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (id)objc_opt_new(AEAssetMetadataCache);
  objc_msgSend(v19, "saveTitle:author:genre:language:pageProgressionDirection:forAssetID:", v18, v17, v16, v15, v14, v13);

}

@end
