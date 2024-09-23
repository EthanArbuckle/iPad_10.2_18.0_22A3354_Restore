@implementation PLPhotoAnalysisAssetAttributes

+ (id)entityName
{
  return CFSTR("PhotoAnalysisAssetAttributes");
}

+ (id)fetchRequest
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0C97B48]);
  objc_msgSend(a1, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithEntityName:", v4);

  return v5;
}

@end
