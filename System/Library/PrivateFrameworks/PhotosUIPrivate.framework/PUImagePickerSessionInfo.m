@implementation PUImagePickerSessionInfo

- (PUImagePickerSessionInfo)initWithPhotosViewDelegate:(id)a3 loadingStatusManager:(id)a4 allowMultipleSelection:(BOOL)a5 limitedLibrary:(BOOL)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  PUImagePickerSessionInfo *v12;
  PUImagePickerSessionInfo *v13;
  objc_super v15;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PUImagePickerSessionInfo;
  v12 = -[PUSessionInfo init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    -[PUSessionInfo setPhotosViewDelegate:](v12, "setPhotosViewDelegate:", v10);
    -[PUSessionInfo setLoadingStatusManager:](v13, "setLoadingStatusManager:", v11);
    -[PUSessionInfo setAllowsMultipleSelection:](v13, "setAllowsMultipleSelection:", v7);
    v13->_isLimitedLibraryPicker = a6;
  }

  return v13;
}

- (BOOL)isSelectingAssets
{
  return 1;
}

- (BOOL)isForAssetPicker
{
  return 1;
}

- (BOOL)isLimitedLibraryPicker
{
  return self->_isLimitedLibraryPicker;
}

- (PHCollectionList)rootCollectionList
{
  return self->_rootCollectionList;
}

- (void)setRootCollectionList:(id)a3
{
  objc_storeStrong((id *)&self->_rootCollectionList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootCollectionList, 0);
}

@end
