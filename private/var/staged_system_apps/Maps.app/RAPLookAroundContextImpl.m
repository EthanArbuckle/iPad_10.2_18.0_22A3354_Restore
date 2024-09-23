@implementation RAPLookAroundContextImpl

- (RAPLookAroundContextImpl)initWithLookAroundView:(id)a3
{
  id v4;
  RAPLookAroundContextImpl *v5;
  UIImage *v6;
  NSData *v7;
  NSData *v8;
  NSData *lookAroundSnapshotImageData;
  NSData *v10;
  void *v11;
  uint64_t v12;
  GEOPDMuninViewState *reportedMuninViewState;
  void *v14;
  uint64_t v15;
  NSArray *reportedVisibleMUIDs;
  uint64_t v17;
  NSArray *reportedMuninRoadLabels;
  uint64_t v19;
  NSArray *reportedMuninImageResources;
  unsigned __int8 v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)RAPLookAroundContextImpl;
  v5 = -[RAPLookAroundContextImpl init](&v23, "init");
  if (v5)
  {
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "snapshotImage"));
    v7 = UIImagePNGRepresentation(v6);
    v8 = (NSData *)objc_claimAutoreleasedReturnValue(v7);

    lookAroundSnapshotImageData = v5->_lookAroundSnapshotImageData;
    v5->_lookAroundSnapshotImageData = v8;
    v10 = v8;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "muninViewState"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "toGEOPDMuninViewState"));
    reportedMuninViewState = v5->_reportedMuninViewState;
    v5->_reportedMuninViewState = (GEOPDMuninViewState *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "muninMarker"));
    v5->_muninMetadataTileBuildId = objc_msgSend(v14, "buildId");
    v5->_muninImageDataId = (unint64_t)objc_msgSend(v14, "pointId");
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visiblePlaceMUIDs"));
    reportedVisibleMUIDs = v5->_reportedVisibleMUIDs;
    v5->_reportedVisibleMUIDs = (NSArray *)v15;

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleRoadLabels"));
    reportedMuninRoadLabels = v5->_reportedMuninRoadLabels;
    v5->_reportedMuninRoadLabels = (NSArray *)v17;

    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageResources"));
    reportedMuninImageResources = v5->_reportedMuninImageResources;
    v5->_reportedMuninImageResources = (NSArray *)v19;

    if ((objc_msgSend(v4, "showsRoadLabels") & 1) != 0)
      v21 = 1;
    else
      v21 = objc_msgSend(v4, "showsPointLabels");
    v5->_lookAroundLabelsEnabled = v21;

  }
  return v5;
}

- (unint64_t)muninImageDataId
{
  return self->_muninImageDataId;
}

- (void)setMuninImageDataId:(unint64_t)a3
{
  self->_muninImageDataId = a3;
}

- (BOOL)lookAroundLabelsEnabled
{
  return self->_lookAroundLabelsEnabled;
}

- (unsigned)muninMetadataTileBuildId
{
  return self->_muninMetadataTileBuildId;
}

- (void)setMuninMetadataTileBuildId:(unsigned int)a3
{
  self->_muninMetadataTileBuildId = a3;
}

- (NSData)lookAroundSnapshotImageData
{
  return self->_lookAroundSnapshotImageData;
}

- (NSArray)reportedMuninImageResources
{
  return self->_reportedMuninImageResources;
}

- (GEOPDPhotoPosition)reportedMuninPhotoPosition
{
  return self->_reportedMuninPhotoPosition;
}

- (NSArray)reportedMuninRoadLabels
{
  return self->_reportedMuninRoadLabels;
}

- (GEOTileCoordinate)reportedMuninTileCoordinate
{
  return self->_reportedMuninTileCoordinate;
}

- (GEOPDMuninViewState)reportedMuninViewState
{
  return self->_reportedMuninViewState;
}

- (NSArray)reportedVisibleMUIDs
{
  return self->_reportedVisibleMUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportedVisibleMUIDs, 0);
  objc_storeStrong((id *)&self->_reportedMuninViewState, 0);
  objc_storeStrong((id *)&self->_reportedMuninTileCoordinate, 0);
  objc_storeStrong((id *)&self->_reportedMuninRoadLabels, 0);
  objc_storeStrong((id *)&self->_reportedMuninPhotoPosition, 0);
  objc_storeStrong((id *)&self->_reportedMuninImageResources, 0);
  objc_storeStrong((id *)&self->_lookAroundSnapshotImageData, 0);
}

@end
