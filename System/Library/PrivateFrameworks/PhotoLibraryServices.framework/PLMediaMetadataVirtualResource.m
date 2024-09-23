@implementation PLMediaMetadataVirtualResource

- (PLMediaMetadataVirtualResource)initWithAsset:(id)a3 resourceType:(unsigned int)a4 version:(unsigned int)a5 recipeID:(unsigned int)a6 dataLength:(unint64_t)a7
{
  PLMediaMetadataVirtualResource *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PLMediaMetadataVirtualResource;
  v8 = -[PLVirtualResource initWithAsset:resourceType:version:recipeID:](&v11, sel_initWithAsset_resourceType_version_recipeID_, a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
  if (v8)
  {
    +[PLUniformTypeIdentifier plistUniformTypeIdentifier](PLUniformTypeIdentifier, "plistUniformTypeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLVirtualResource setUniformTypeIdentifier:](v8, "setUniformTypeIdentifier:", v9);

    v8->_dataLength = a7;
  }
  return v8;
}

- (int64_t)dataLength
{
  return self->_dataLength;
}

- (int64_t)estimatedDataLength
{
  return self->_dataLength;
}

@end
