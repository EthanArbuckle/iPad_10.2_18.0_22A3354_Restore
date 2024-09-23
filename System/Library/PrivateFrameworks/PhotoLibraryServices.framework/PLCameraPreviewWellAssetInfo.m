@implementation PLCameraPreviewWellAssetInfo

- (PLCameraPreviewWellAssetInfo)initWithUUID:(id)a3 sortToken:(double)a4 addedDate:(id)a5 hidden:(BOOL)a6 visibilityState:(signed __int16)a7 trashedState:(signed __int16)a8 avalanchePickType:(int)a9 savedAssetType:(signed __int16)a10 thumbnailIdentifier:(id)a11 pathManager:(id)a12
{
  id v19;
  id v20;
  PLCameraPreviewWellAssetInfo *v21;
  PLCameraPreviewWellAssetInfo *v22;
  id v25;
  id v26;
  objc_super v27;

  v19 = a3;
  v20 = a5;
  v26 = a11;
  v25 = a12;
  v27.receiver = self;
  v27.super_class = (Class)PLCameraPreviewWellAssetInfo;
  v21 = -[PLCameraPreviewWellAssetInfo init](&v27, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_uuid, a3);
    v22->_sortToken = a4;
    objc_storeStrong((id *)&v22->_addedDate, a5);
    v22->_hidden = a6;
    v22->_visibilityState = a7;
    v22->_trashedState = a8;
    v22->_avalanchePickType = a9;
    v22->_savedAssetType = a10;
    objc_storeStrong((id *)&v22->_thumbnailIdentifier, a11);
    objc_storeStrong((id *)&v22->_pathManager, a12);
  }

  return v22;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (double)sortToken
{
  return self->_sortToken;
}

- (NSDate)addedDate
{
  return self->_addedDate;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (signed)visibilityState
{
  return self->_visibilityState;
}

- (signed)trashedState
{
  return self->_trashedState;
}

- (int)avalanchePickType
{
  return self->_avalanchePickType;
}

- (signed)savedAssetType
{
  return self->_savedAssetType;
}

- (NSString)thumbnailIdentifier
{
  return self->_thumbnailIdentifier;
}

- (PLPhotoLibraryPathManager)pathManager
{
  return self->_pathManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_thumbnailIdentifier, 0);
  objc_storeStrong((id *)&self->_addedDate, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
