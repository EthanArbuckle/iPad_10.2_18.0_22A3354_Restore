@implementation PLFullSizeRenderVideoVirtualResource

- (PLFullSizeRenderVideoVirtualResource)initWithAsset:(id)a3
{
  id v4;
  PLFullSizeRenderVideoVirtualResource *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLFullSizeRenderVideoVirtualResource;
  v5 = -[PLVirtualResource initWithAsset:resourceType:version:recipeID:](&v10, sel_initWithAsset_resourceType_version_recipeID_, v4, 1, 2, 0x20000);
  if (v5)
  {
    -[PLVirtualResource setUnorientedWidth:](v5, "setUnorientedWidth:", objc_msgSend(v4, "width"));
    -[PLVirtualResource setUnorientedHeight:](v5, "setUnorientedHeight:", objc_msgSend(v4, "height"));
    +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", 0x20000);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uti");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLVirtualResource setUniformTypeIdentifier:](v5, "setUniformTypeIdentifier:", v7);

    objc_msgSend(v6, "codecFourCharCodeName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLVirtualResource setCodecFourCharCodeName:](v5, "setCodecFourCharCodeName:", v8);

  }
  return v5;
}

- (unint64_t)cplType
{
  return 16;
}

@end
