@implementation PUAlbumPickerSessionInfo

- (PUAlbumPickerSessionInfo)initWithSourceAlbum:(id)a3 transferredAssets:(id)a4
{
  id v6;
  id v7;
  PUAlbumPickerSessionInfo *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PUAlbumPickerSessionInfo;
  v8 = -[PUSessionInfo init](&v11, sel_init);
  if (v8)
  {
    PLAssetCountsByType();
    PLLocalizedCountDescription();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSessionInfo setSourceAlbum:](v8, "setSourceAlbum:", v6, 0, 0, 0, 0);
    -[PUSessionInfo setTransferredAssets:](v8, "setTransferredAssets:", v7);
    -[PUSessionInfo setLocalizedPrompt:](v8, "setLocalizedPrompt:", v9);

  }
  return v8;
}

- (BOOL)isSelectingTargetAlbum
{
  return 1;
}

- (BOOL)isForAlbumPicker
{
  return 1;
}

@end
