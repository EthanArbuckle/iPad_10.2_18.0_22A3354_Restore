@implementation PLFullSizeRenderVideoComplementVirtualResource

- (PLFullSizeRenderVideoComplementVirtualResource)initWithAsset:(id)a3
{
  PLFullSizeRenderVideoComplementVirtualResource *v3;
  PLFullSizeRenderVideoComplementVirtualResource *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLFullSizeRenderVideoComplementVirtualResource;
  v3 = -[PLVirtualResource initWithAsset:resourceType:version:recipeID:](&v9, sel_initWithAsset_resourceType_version_recipeID_, a3, 3, 2, 131272);
  v4 = v3;
  if (v3)
  {
    -[PLVirtualResource setUnorientedWidth:](v3, "setUnorientedWidth:", 0);
    -[PLVirtualResource setUnorientedHeight:](v4, "setUnorientedHeight:", 0);
    +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", 131272);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uti");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLVirtualResource setUniformTypeIdentifier:](v4, "setUniformTypeIdentifier:", v6);

    objc_msgSend(v5, "codecFourCharCodeName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLVirtualResource setCodecFourCharCodeName:](v4, "setCodecFourCharCodeName:", v7);

  }
  return v4;
}

- (unint64_t)cplType
{
  return 19;
}

@end
