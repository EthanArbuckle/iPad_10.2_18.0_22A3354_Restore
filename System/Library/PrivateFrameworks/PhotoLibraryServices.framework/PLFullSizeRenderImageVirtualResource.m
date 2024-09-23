@implementation PLFullSizeRenderImageVirtualResource

- (PLFullSizeRenderImageVirtualResource)initWithAsset:(id)a3
{
  id v4;
  PLFullSizeRenderImageVirtualResource *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLFullSizeRenderImageVirtualResource;
  v5 = -[PLVirtualResource initWithAsset:resourceType:version:recipeID:](&v9, sel_initWithAsset_resourceType_version_recipeID_, v4, 0, 2, 65938);
  if (v5)
  {
    objc_msgSend(v4, "fileTypeForFullsizeRenderImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLUniformTypeIdentifier utiWithIdentifier:](PLUniformTypeIdentifier, "utiWithIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLVirtualResource setUniformTypeIdentifier:](v5, "setUniformTypeIdentifier:", v7);
    -[PLVirtualResource setUnorientedWidth:](v5, "setUnorientedWidth:", objc_msgSend(v4, "width"));
    -[PLVirtualResource setUnorientedHeight:](v5, "setUnorientedHeight:", objc_msgSend(v4, "height"));

  }
  return v5;
}

- (unint64_t)cplType
{
  return 2;
}

@end
