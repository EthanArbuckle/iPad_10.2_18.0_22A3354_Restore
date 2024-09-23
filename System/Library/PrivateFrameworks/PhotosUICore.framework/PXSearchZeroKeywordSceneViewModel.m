@implementation PXSearchZeroKeywordSceneViewModel

- (PXSearchZeroKeywordSceneViewModel)initWithTitle:(id)a3 representedObject:(id)a4 sceneId:(id)a5 keyAsset:(id)a6
{
  id v9;
  PXSearchZeroKeywordSceneViewModel *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXSearchZeroKeywordSceneViewModel;
  v9 = a6;
  v10 = -[PXSearchZeroKeywordBaseViewModel initWithType:title:representedObject:displayInfo:](&v12, sel_initWithType_title_representedObject_displayInfo_, 3, a3, a4, a5);
  -[PXSearchZeroKeywordAssetViewModel setAsset:](v10, "setAsset:", v9, v12.receiver, v12.super_class);

  return v10;
}

@end
