@implementation PLSearchTrackedAttributes

- (NSArray)assetAttributesTrackedForSearch
{
  NSArray *assetAttributesTrackedForSearch;
  NSArray *v4;
  NSArray *v5;
  _QWORD v7[36];

  v7[35] = *MEMORY[0x1E0C80C00];
  assetAttributesTrackedForSearch = self->_assetAttributesTrackedForSearch;
  if (!assetAttributesTrackedForSearch)
  {
    v7[0] = CFSTR("addedDate");
    v7[1] = CFSTR("albums");
    v7[2] = CFSTR("avalanchePickType");
    v7[3] = CFSTR("curationScore");
    v7[4] = CFSTR("depthType");
    v7[5] = CFSTR("dateCreated");
    v7[6] = CFSTR("detectedFaces");
    v7[7] = CFSTR("duration");
    v7[8] = CFSTR("favorite");
    v7[9] = CFSTR("filename");
    v7[10] = CFSTR("hidden");
    v7[11] = CFSTR("isMagicCarpet");
    v7[12] = CFSTR("kind");
    v7[13] = CFSTR("kindSubtype");
    v7[14] = CFSTR("locationInfo");
    v7[15] = CFSTR("longitude");
    v7[16] = CFSTR("moment");
    v7[17] = CFSTR("overallAestheticScore");
    v7[18] = CFSTR("originalFilename");
    v7[19] = CFSTR("placeAnnotation");
    v7[20] = CFSTR("playbackVariation");
    v7[21] = CFSTR("playbackStyle");
    v7[22] = CFSTR("RAWBadgeAttribute");
    v7[23] = CFSTR("savedAssetType");
    v7[24] = CFSTR("title");
    v7[25] = CFSTR("trashedState");
    v7[26] = CFSTR("longDescription");
    v7[27] = CFSTR("uniformTypeIdentifier");
    v7[28] = CFSTR("visibilityState");
    v7[29] = CFSTR("additionalAttributes.cameraCaptureDevice");
    v7[30] = CFSTR("additionalAttributes.sceneAnalysisVersion");
    v7[31] = CFSTR("additionalAttributes.sceneClassifications");
    v7[32] = CFSTR("additionalAttributes.personReferences");
    v7[33] = CFSTR("extendedAttributes.cameraMake");
    v7[34] = CFSTR("extendedAttributes.cameraModel");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 35);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_assetAttributesTrackedForSearch;
    self->_assetAttributesTrackedForSearch = v4;

    assetAttributesTrackedForSearch = self->_assetAttributesTrackedForSearch;
  }
  return assetAttributesTrackedForSearch;
}

- (NSArray)mediaAnalysisAssetAttributesTrackedForSearch
{
  NSArray *mediaAnalysisAssetAttributesTrackedForSearch;
  NSArray *v4;
  NSArray *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  mediaAnalysisAssetAttributesTrackedForSearch = self->_mediaAnalysisAssetAttributesTrackedForSearch;
  if (!mediaAnalysisAssetAttributesTrackedForSearch)
  {
    v7[0] = CFSTR("characterRecognitionAttributes");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_mediaAnalysisAssetAttributesTrackedForSearch;
    self->_mediaAnalysisAssetAttributesTrackedForSearch = v4;

    mediaAnalysisAssetAttributesTrackedForSearch = self->_mediaAnalysisAssetAttributesTrackedForSearch;
  }
  return mediaAnalysisAssetAttributesTrackedForSearch;
}

- (NSArray)managedAlbumAttributesTrackedForSearch
{
  NSArray *managedAlbumAttributesTrackedForSearch;
  NSArray *v4;
  NSArray *v5;
  _QWORD v7[8];

  v7[7] = *MEMORY[0x1E0C80C00];
  managedAlbumAttributesTrackedForSearch = self->_managedAlbumAttributesTrackedForSearch;
  if (!managedAlbumAttributesTrackedForSearch)
  {
    v7[0] = CFSTR("assets");
    v7[1] = CFSTR("creationDate");
    v7[2] = CFSTR("endDate");
    v7[3] = CFSTR("keyAssets");
    v7[4] = CFSTR("startDate");
    v7[5] = CFSTR("title");
    v7[6] = CFSTR("trashedState");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 7);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_managedAlbumAttributesTrackedForSearch;
    self->_managedAlbumAttributesTrackedForSearch = v4;

    managedAlbumAttributesTrackedForSearch = self->_managedAlbumAttributesTrackedForSearch;
  }
  return managedAlbumAttributesTrackedForSearch;
}

- (NSArray)fetchingAlbumAttributesTrackedForSearch
{
  NSArray *fetchingAlbumAttributesTrackedForSearch;
  NSArray *v4;
  NSArray *v5;
  _QWORD v7[8];

  v7[7] = *MEMORY[0x1E0C80C00];
  fetchingAlbumAttributesTrackedForSearch = self->_fetchingAlbumAttributesTrackedForSearch;
  if (!fetchingAlbumAttributesTrackedForSearch)
  {
    v7[0] = CFSTR("assets");
    v7[1] = CFSTR("creationDate");
    v7[2] = CFSTR("endDate");
    v7[3] = CFSTR("keyAssets");
    v7[4] = CFSTR("startDate");
    v7[5] = CFSTR("title");
    v7[6] = CFSTR("trashedState");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 7);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_fetchingAlbumAttributesTrackedForSearch;
    self->_fetchingAlbumAttributesTrackedForSearch = v4;

    fetchingAlbumAttributesTrackedForSearch = self->_fetchingAlbumAttributesTrackedForSearch;
  }
  return fetchingAlbumAttributesTrackedForSearch;
}

- (NSArray)memoryAttributesTrackedForSearch
{
  NSArray *memoryAttributesTrackedForSearch;
  NSArray *v4;
  NSArray *v5;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  memoryAttributesTrackedForSearch = self->_memoryAttributesTrackedForSearch;
  if (!memoryAttributesTrackedForSearch)
  {
    v7[0] = CFSTR("category");
    v7[1] = CFSTR("curatedAssets");
    v7[2] = CFSTR("creationDate");
    v7[3] = CFSTR("rejected");
    v7[4] = CFSTR("title");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 5);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_memoryAttributesTrackedForSearch;
    self->_memoryAttributesTrackedForSearch = v4;

    memoryAttributesTrackedForSearch = self->_memoryAttributesTrackedForSearch;
  }
  return memoryAttributesTrackedForSearch;
}

- (NSArray)highlightAttributesTrackedForSearch
{
  NSArray *highlightAttributesTrackedForSearch;
  NSArray *v4;
  NSArray *v5;
  _QWORD v7[11];

  v7[10] = *MEMORY[0x1E0C80C00];
  highlightAttributesTrackedForSearch = self->_highlightAttributesTrackedForSearch;
  if (!highlightAttributesTrackedForSearch)
  {
    v7[0] = CFSTR("dayGroupAssets");
    v7[1] = CFSTR("dayGroupExtendedAssets");
    v7[2] = CFSTR("endDate");
    v7[3] = CFSTR("extendedAssets");
    v7[4] = CFSTR("kind");
    v7[5] = CFSTR("moments");
    v7[6] = CFSTR("startDate");
    v7[7] = CFSTR("summaryAssets");
    v7[8] = CFSTR("title");
    v7[9] = CFSTR("type");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 10);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_highlightAttributesTrackedForSearch;
    self->_highlightAttributesTrackedForSearch = v4;

    highlightAttributesTrackedForSearch = self->_highlightAttributesTrackedForSearch;
  }
  return highlightAttributesTrackedForSearch;
}

- (NSArray)personAttributesTrackedForSearch
{
  NSArray *personAttributesTrackedForSearch;
  NSArray *v4;
  NSArray *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  personAttributesTrackedForSearch = self->_personAttributesTrackedForSearch;
  if (!personAttributesTrackedForSearch)
  {
    v7[0] = CFSTR("fullName");
    v7[1] = CFSTR("verifiedType");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_personAttributesTrackedForSearch;
    self->_personAttributesTrackedForSearch = v4;

    personAttributesTrackedForSearch = self->_personAttributesTrackedForSearch;
  }
  return personAttributesTrackedForSearch;
}

- (NSArray)detectedFaceAttributesTrackedForSearch
{
  NSArray *detectedFaceAttributesTrackedForSearch;
  NSArray *v4;
  NSArray *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  detectedFaceAttributesTrackedForSearch = self->_detectedFaceAttributesTrackedForSearch;
  if (!detectedFaceAttributesTrackedForSearch)
  {
    v7[0] = CFSTR("personForFace");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_detectedFaceAttributesTrackedForSearch;
    self->_detectedFaceAttributesTrackedForSearch = v4;

    detectedFaceAttributesTrackedForSearch = self->_detectedFaceAttributesTrackedForSearch;
  }
  return detectedFaceAttributesTrackedForSearch;
}

- (void)setAssetAttributesTrackedForSearch:(id)a3
{
  objc_storeStrong((id *)&self->_assetAttributesTrackedForSearch, a3);
}

- (void)setMediaAnalysisAssetAttributesTrackedForSearch:(id)a3
{
  objc_storeStrong((id *)&self->_mediaAnalysisAssetAttributesTrackedForSearch, a3);
}

- (void)setManagedAlbumAttributesTrackedForSearch:(id)a3
{
  objc_storeStrong((id *)&self->_managedAlbumAttributesTrackedForSearch, a3);
}

- (void)setFetchingAlbumAttributesTrackedForSearch:(id)a3
{
  objc_storeStrong((id *)&self->_fetchingAlbumAttributesTrackedForSearch, a3);
}

- (void)setMemoryAttributesTrackedForSearch:(id)a3
{
  objc_storeStrong((id *)&self->_memoryAttributesTrackedForSearch, a3);
}

- (void)setHighlightAttributesTrackedForSearch:(id)a3
{
  objc_storeStrong((id *)&self->_highlightAttributesTrackedForSearch, a3);
}

- (void)setPersonAttributesTrackedForSearch:(id)a3
{
  objc_storeStrong((id *)&self->_personAttributesTrackedForSearch, a3);
}

- (void)setDetectedFaceAttributesTrackedForSearch:(id)a3
{
  objc_storeStrong((id *)&self->_detectedFaceAttributesTrackedForSearch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedFaceAttributesTrackedForSearch, 0);
  objc_storeStrong((id *)&self->_personAttributesTrackedForSearch, 0);
  objc_storeStrong((id *)&self->_highlightAttributesTrackedForSearch, 0);
  objc_storeStrong((id *)&self->_memoryAttributesTrackedForSearch, 0);
  objc_storeStrong((id *)&self->_fetchingAlbumAttributesTrackedForSearch, 0);
  objc_storeStrong((id *)&self->_managedAlbumAttributesTrackedForSearch, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisAssetAttributesTrackedForSearch, 0);
  objc_storeStrong((id *)&self->_assetAttributesTrackedForSearch, 0);
}

@end
