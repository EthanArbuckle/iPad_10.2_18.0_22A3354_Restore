@implementation PFStoryRecipeSongAssetFactory

+ (id)createAssetWithCategory:(int64_t)a3 subcategory:(int64_t)a4 catalog:(id)a5 songID:(id)a6 title:(id)a7 subtitle:(id)a8 colorGradeCategory:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PFStoryConcreteRecipeSongAsset *v20;

  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = -[PFStoryConcreteRecipeSongAsset initWithIdentifier:category:subcategory:catalog:songID:title:subtitle:]([PFStoryConcreteRecipeSongAsset alloc], "initWithIdentifier:category:subcategory:catalog:songID:title:subtitle:", 0, a3, a4, v19, v18, v17, v16);

  -[PFStoryConcreteRecipeSongAsset setColorGradeCategory:](v20, "setColorGradeCategory:", v15);
  return v20;
}

+ (PFStoryRecipeSongAsset)nullAsset
{
  return (PFStoryRecipeSongAsset *)objc_msgSend(a1, "createAssetWithCategory:subcategory:catalog:songID:title:subtitle:colorGradeCategory:", 0, 0, CFSTR("null"));
}

@end
