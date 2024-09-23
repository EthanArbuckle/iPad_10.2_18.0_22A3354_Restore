@implementation PXStoryNullSongResource

- (PXStoryNullSongResource)init
{
  PXStoryNullSongResource *v2;
  PXStoryNullSongResource *v3;
  NSString *identifier;
  PXAudioAsset *asset;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXStoryNullSongResource;
  v2 = -[PXStoryNullSongResource init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)CFSTR("PXStoryNullSongResource");

    asset = v3->_asset;
    v3->_resourceKind = 2;
    v3->_asset = 0;

  }
  return v3;
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("No Music"));
}

- (NSString)px_storyResourceIdentifier
{
  return self->_identifier;
}

- (int64_t)px_storyResourceKind
{
  return self->_resourceKind;
}

- (PXAudioAsset)px_storyResourceSongAsset
{
  return self->_asset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
