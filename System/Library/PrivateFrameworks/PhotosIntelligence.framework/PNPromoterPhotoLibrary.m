@implementation PNPromoterPhotoLibrary

- (PNPromoterPhotoLibrary)initWithPhotoLibrary:(id)a3
{
  return -[PNPromoterPhotoLibrary initWithPhotoLibrary:rawClusters:includesPets:](self, "initWithPhotoLibrary:rawClusters:includesPets:", a3, MEMORY[0x24BDBD1B8], 0);
}

- (PNPromoterPhotoLibrary)initWithPhotoLibrary:(id)a3 rawClusters:(id)a4 includesPets:(BOOL)a5
{
  id v9;
  id v10;
  PNPromoterPhotoLibrary *v11;
  PNPromoterPhotoLibrary *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PNPromoterPhotoLibrary;
  v11 = -[PNPromoterPhotoLibrary init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_photoLibrary, a3);
    objc_storeStrong((id *)&v12->_rawClusters, a4);
    v12->_includesPets = a5;
  }

  return v12;
}

- (BOOL)pn_performChangesAndWait:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PNPromoterPhotoLibrary photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "performChangesAndWait:error:", v6, a4);

  return (char)a4;
}

- (id)_defaultFetchOptions
{
  void *v3;
  void *v4;

  -[PNPromoterPhotoLibrary photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setWantsIncrementalChangeDetails:", 0);
  if (-[PNPromoterPhotoLibrary includesPets](self, "includesPets"))
    objc_msgSend(v4, "setIncludedDetectionTypes:", &unk_25149A6A0);
  return v4;
}

- (id)_defaultAssetFetchOptions
{
  void *v3;
  void *v4;

  -[PNPromoterPhotoLibrary _defaultFetchOptions](self, "_defaultFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_defaultAssetPropertySets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchPropertySets:", v4);

  if (-[PNPromoterPhotoLibrary includesPets](self, "includesPets"))
    objc_msgSend(v3, "setIncludedDetectionTypes:", &unk_25149A6B8);
  return v3;
}

- (id)pn_persistentStorageDirectoryURL
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  id v19;
  char v20;
  id v21;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("mediaanalysisd")))
  {
    v8 = objc_alloc_init(MEMORY[0x24BDD1580]);
    v21 = 0;
    objc_msgSend(v8, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v21;
    if (v11)
    {
      v12 = v11;
      v9 = 0;
LABEL_6:
      v13 = (void *)MEMORY[0x24BDBCF48];
      NSTemporaryDirectory();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fileURLWithPath:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v15;
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(v10, "URLByAppendingPathComponent:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v9, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v16, &v20);

    if ((v17 & 1) != 0)
    {
      if (!v20)
      {

        v9 = 0;
        v12 = 0;
        goto LABEL_6;
      }
      v12 = 0;
    }
    else
    {
      v19 = 0;
      objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v19);
      v12 = v19;
    }
    if (v9 && !v12)
      goto LABEL_14;
    goto LABEL_6;
  }
  -[PNPromoterPhotoLibrary photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSystemPhotoLibrary");

  -[PNPromoterPhotoLibrary photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6)
  {
    objc_msgSend(v7, "photoLibraryURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("private/com.apple.mediaanalysisd/caches/vision"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_msgSend(v7, "urlForApplicationDataFolderIdentifier:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v9;
}

- (id)pn_fetchPersonsWithLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PNPromoterPhotoLibrary _defaultFetchOptions](self, "_defaultFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumVerifiedFaceCount:", 1);
  objc_msgSend(v5, "setMinimumUnverifiedFaceCount:", 1);
  objc_msgSend((id)objc_opt_class(), "_phPeopleSortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v6);

  objc_msgSend(v5, "setIncludeTorsoOnlyPerson:", 1);
  objc_msgSend(MEMORY[0x24BDE35E0], "fetchPersonsWithLocalIdentifiers:options:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)pn_fetchPersonsWithType:(unint64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  -[PNPromoterPhotoLibrary _defaultFetchOptions](self, "_defaultFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_phPeopleSortDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v7);

  objc_msgSend(v6, "setIncludeTorsoOnlyPerson:", 1);
  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPromoterPhotoLibrary.m"), 213, CFSTR("PNPhotoLibraryProtocolPeopleTypeFaceGroup cannot be used on PH objects"));

      abort();
    case 1uLL:
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("verifiedType = %@ OR verifiedType = %@"), &unk_25149A240, &unk_25149A258);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPredicate:", v8);

      goto LABEL_7;
    case 2uLL:
      objc_msgSend(v6, "setMinimumVerifiedFaceCount:", 2);
      objc_msgSend(v6, "setMinimumUnverifiedFaceCount:", 2);
      objc_msgSend(MEMORY[0x24BDE35E0], "fetchPersonsWithOptions:", v6);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[PNPromoterPhotoLibrary photoLibrary](self, "photoLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "librarySpecificFetchOptions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSortDescriptors:", v14);

      objc_msgSend(v10, "fetchedObjects");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x24BDD1758];
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __50__PNPromoterPhotoLibrary_pn_fetchPersonsWithType___block_invoke;
      v22[3] = &unk_25147F8C0;
      v23 = v12;
      v17 = v12;
      objc_msgSend(v16, "predicateWithBlock:", v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "filteredArrayUsingPredicate:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    case 3uLL:
      objc_msgSend(v6, "setPersonContext:", 0);
      goto LABEL_7;
    case 4uLL:
      objc_msgSend(v6, "setMinimumVerifiedFaceCount:", 1);
      objc_msgSend(v6, "setMinimumUnverifiedFaceCount:", 1);
LABEL_7:
      objc_msgSend(MEMORY[0x24BDE35E0], "fetchPersonsWithOptions:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v9 = 0;
      break;
  }
  v10 = v9;
  v19 = v10;
LABEL_9:

  return v19;
}

- (id)pn_fetchPersonsInMoment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PNPromoterPhotoLibrary _defaultFetchOptions](self, "_defaultFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumVerifiedFaceCount:", 1);
  objc_msgSend(v5, "setMinimumUnverifiedFaceCount:", 1);
  objc_msgSend((id)objc_opt_class(), "_phPeopleSortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v6);

  objc_msgSend(v5, "setIncludeTorsoOnlyPerson:", 1);
  objc_msgSend(MEMORY[0x24BDE35E0], "fetchPersonsForAssetCollection:options:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)pn_fetchCandidatePersonsForPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PNPromoterPhotoLibrary _defaultFetchOptions](self, "_defaultFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_phPeopleSortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v6);

  objc_msgSend(v5, "setIncludeTorsoOnlyPerson:", 1);
  objc_msgSend(MEMORY[0x24BDE35E0], "fetchMergeCandidatePersonsForPerson:options:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)pn_fetchInvalidCandidatePersonsForPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PNPromoterPhotoLibrary _defaultFetchOptions](self, "_defaultFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_phPeopleSortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v6);

  objc_msgSend(v5, "setIncludeTorsoOnlyPerson:", 1);
  objc_msgSend(MEMORY[0x24BDE35E0], "fetchInvalidMergeCandidatePersonsForPerson:options:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)pn_fetchPersonsGroupedByAssetLocalIdentifierForAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PNPromoterPhotoLibrary _defaultFetchOptions](self, "_defaultFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumVerifiedFaceCount:", 1);
  objc_msgSend(v5, "setMinimumUnverifiedFaceCount:", 1);
  objc_msgSend((id)objc_opt_class(), "_phPeopleSortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v6);

  objc_msgSend(v5, "setIncludeTorsoOnlyPerson:", 1);
  objc_msgSend(MEMORY[0x24BDE35E0], "fetchPersonsGroupedByAssetLocalIdentifierForAssets:options:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)pn_numberOfFacesWithFaceprints
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[PNPromoterPhotoLibrary _defaultFetchOptions](self, "_defaultFetchOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIncludeOnlyFacesWithFaceprints:", 1);
  v7[0] = *MEMORY[0x24BDE37C8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFetchPropertySets:", v3);

  objc_msgSend(v2, "setShouldPrefetchCount:", 1);
  objc_msgSend(v2, "setIncludeTorsoAndFaceDetectionData:", 1);
  objc_msgSend(MEMORY[0x24BDE3548], "fetchFacesWithOptions:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)pn_fetchFacesWithLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PNPromoterPhotoLibrary _defaultFetchOptions](self, "_defaultFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_defaultFacePropertySets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchPropertySets:", v6);

  objc_msgSend((id)objc_opt_class(), "_phFaceSortDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v7);

  objc_msgSend(v5, "setIncludeTorsoAndFaceDetectionData:", 1);
  objc_msgSend(MEMORY[0x24BDE3548], "fetchFacesWithLocalIdentifiers:options:", v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)pn_fetchFacesForPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PNPromoterPhotoLibrary _defaultFetchOptions](self, "_defaultFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludeOnlyFacesWithFaceprints:", 1);
  objc_msgSend((id)objc_opt_class(), "_defaultFacePropertySets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchPropertySets:", v6);

  objc_msgSend((id)objc_opt_class(), "_phFaceSortDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v7);

  objc_msgSend(v5, "setIncludeTorsoAndFaceDetectionData:", 1);
  objc_msgSend(MEMORY[0x24BDE3548], "fetchFacesForPerson:options:", v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)pn_fetchFacesForPerson:(id)a3 inMoment:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPromoterPhotoLibrary pn_fetchFacesForPersonLocalIdentifiers:inMoment:](self, "pn_fetchFacesForPersonLocalIdentifiers:inMoment:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)pn_fetchFacesForPersonLocalIdentifiers:(id)a3 inMoment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[PNPromoterPhotoLibrary photoLibrary](self, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchFacesForMediaProcessingWithPersonLocalIdentifiers:inMoment:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
    v10 = v9;
  else
    v10 = (id)MEMORY[0x24BDBD1A8];

  return v10;
}

- (id)pn_fetchFacesForFaceGroup:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;

  v5 = a3;
  -[PNPromoterPhotoLibrary _defaultFetchOptions](self, "_defaultFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_defaultFacePropertySets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchPropertySets:", v7);

  objc_msgSend((id)objc_opt_class(), "_phFaceSortDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v8);

  objc_msgSend(v6, "setIncludeTorsoAndFaceDetectionData:", 1);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("faceCrop == nil"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInternalPredicate:", v9);

  if (-[NSDictionary count](self->_rawClusters, "count"))
  {
    v10 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v5, "localIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "integerValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSDictionary objectForKeyedSubscript:](self->_rawClusters, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPromoterPhotoLibrary.m"), 333, CFSTR("No vuFaces for %@"), v17);

    }
    objc_msgSend(MEMORY[0x24BDE3548], "fetchFacesWithVuObservationIDs:options:", v13, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDE3548], "fetchFacesInFaceGroup:options:", v5, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)pn_fetchFacesGroupedByAssetLocalIdentifierForAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PNPromoterPhotoLibrary _defaultFetchOptions](self, "_defaultFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_defaultFacePropertySets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchPropertySets:", v6);

  objc_msgSend((id)objc_opt_class(), "_phFaceSortDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v7);

  objc_msgSend(v5, "setIncludeTorsoAndFaceDetectionData:", 1);
  objc_msgSend(MEMORY[0x24BDE3548], "fetchFacesGroupedByAssetLocalIdentifierForAssets:options:", v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)pn_fetchMoments
{
  void *v2;
  void *v3;
  void *v4;

  -[PNPromoterPhotoLibrary _defaultFetchOptions](self, "_defaultFetchOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PNPersonClusterManager momentSortDescriptors](PNPersonClusterManager, "momentSortDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v3);

  objc_msgSend(MEMORY[0x24BDE3498], "fetchMomentsWithOptions:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)pn_fetchMomentsWithLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PNPromoterPhotoLibrary _defaultFetchOptions](self, "_defaultFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PNPersonClusterManager momentSortDescriptors](PNPersonClusterManager, "momentSortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v6);

  objc_msgSend(MEMORY[0x24BDE3498], "fetchAssetCollectionsWithLocalIdentifiers:options:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)pn_fetchMomentsForPerson:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPromoterPhotoLibrary.m"), 377, CFSTR("%s not implemented"), "-[PNPromoterPhotoLibrary pn_fetchMomentsForPerson:]");

  abort();
}

- (id)pn_fetchMomentsForAssetsWithLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PNPromoterPhotoLibrary _defaultFetchOptions](self, "_defaultFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PNPersonClusterManager momentSortDescriptors](PNPersonClusterManager, "momentSortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v6);

  objc_msgSend(MEMORY[0x24BDE3498], "fetchMomentsForAssetsWithLocalIdentifiers:options:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)pn_fetchAssetsWithLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PNPromoterPhotoLibrary _defaultAssetFetchOptions](self, "_defaultAssetFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE3488], "fetchAssetsWithLocalIdentifiers:options:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pn_fetchAssetsInMoment:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PNPromoterPhotoLibrary _defaultAssetFetchOptions](self, "_defaultAssetFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE3488], "fetchAssetsInAssetCollection:options:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pn_fetchAssetsForPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PNPromoterPhotoLibrary _defaultAssetFetchOptions](self, "_defaultAssetFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDE3488];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchAssetsForPersons:options:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)pn_fetchAssetsForFaceGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PNPromoterPhotoLibrary _defaultAssetFetchOptions](self, "_defaultAssetFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDE3488];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchAssetsForFaceGroups:options:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)pn_fetchFaceGroups
{
  void *v3;
  NSDictionary *rawClusters;
  id v5;
  PNPromoterFaceGroupFetchResult *v6;
  _QWORD v8[4];
  id v9;

  if (-[NSDictionary count](self->_rawClusters, "count"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSDictionary count](self->_rawClusters, "count"));
    rawClusters = self->_rawClusters;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __44__PNPromoterPhotoLibrary_pn_fetchFaceGroups__block_invoke;
    v8[3] = &unk_25147F8E8;
    v9 = v3;
    v5 = v3;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](rawClusters, "enumerateKeysAndObjectsUsingBlock:", v8);
    v6 = -[PNPromoterFaceGroupFetchResult initWithFaceGroups:]([PNPromoterFaceGroupFetchResult alloc], "initWithFaceGroups:", v5);

  }
  else
  {
    -[PNPromoterPhotoLibrary _defaultFetchOptions](self, "_defaultFetchOptions");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDE3560], "fetchFaceGroupsWithOptions:", v5);
    v6 = (PNPromoterFaceGroupFetchResult *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)pn_fetchFaceGroupsForPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PNPromoterPhotoLibrary _defaultFetchOptions](self, "_defaultFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE3560], "fetchFaceGroupsForPerson:options:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)_progressFromWorkerStatesDictionary:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("total-allowed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("total-allowed"), (_QWORD)v16) & 1) == 0)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v9 += objc_msgSend(v13, "unsignedIntegerValue");

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  if (v5)
  {
    if ((double)v9 / (double)v5 <= 1.0)
      v14 = (double)v9 / (double)v5;
    else
      v14 = 1.0;
  }
  else
  {
    v14 = -1.0;
  }

  return v14;
}

- (float)pn_faceProcessingProgress
{
  void *v2;
  double v3;
  float v4;

  -[PNPromoterPhotoLibrary photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ratioOfAssetsWithFacesProcessed");
  v4 = v3;

  return v4;
}

- (id)pn_fetchInvalidAssetIdentifiersForCommonComparison
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  _QWORD v33[3];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[PNPromoterPhotoLibrary _defaultFetchOptions](self, "_defaultFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = *MEMORY[0x24BDE3710];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchPropertySets:", v5);

  objc_msgSend(MEMORY[0x24BDE3498], "fetchAssetCollectionsWithType:subtype:options:", 2, 211, v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE3488], "fetchAssetsInAssetCollection:options:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v10), "localIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v8);
  }
  objc_msgSend(MEMORY[0x24BDE3498], "fetchAssetCollectionsWithType:subtype:options:", 2, 201, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE3488], "fetchAssetsInAssetCollection:options:", v13, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v18), "localIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v16);
  }

  return v3;
}

- (id)pn_lastAssetDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[PNPromoterPhotoLibrary _defaultFetchOptions](self, "_defaultFetchOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v4);

  objc_msgSend(v2, "setFetchLimit:", 1);
  objc_msgSend(v2, "setIncludeAssetSourceTypes:", 5);
  objc_msgSend(MEMORY[0x24BDE3488], "fetchAssetsWithOptions:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)pn_fetchAssetsForFaceLocalIdentifiers:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x24BDE35D0], "uuidFromLocalIdentifier:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  -[PNPromoterPhotoLibrary _defaultAssetFetchOptions](self, "_defaultAssetFetchOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("ANY detectedFaces.uuid IN %@"), v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInternalPredicate:", v13);

  objc_msgSend(MEMORY[0x24BDE3488], "fetchAssetsWithOptions:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (NSDictionary)rawClusters
{
  return self->_rawClusters;
}

- (void)setRawClusters:(id)a3
{
  objc_storeStrong((id *)&self->_rawClusters, a3);
}

- (BOOL)includesPets
{
  return self->_includesPets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawClusters, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __44__PNPromoterPhotoLibrary_pn_fetchFaceGroups__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  PNPromoterFaceGroup *v6;
  id v7;

  v5 = a3;
  objc_msgSend(a2, "stringValue");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[PNPromoterFaceGroup initWithGroupIdentifier:andFaceIdentifiers:]([PNPromoterFaceGroup alloc], "initWithGroupIdentifier:andFaceIdentifiers:", v7, v5);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
}

BOOL __50__PNPromoterPhotoLibrary_pn_fetchPersonsWithType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDE3488];
  v15 = a2;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", &v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchAssetsForPersons:options:", v6, *(_QWORD *)(a1 + 32), v15, v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "creationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v11);
  v13 = v12;

  return v13 > 86400.0;
}

+ (id)_phFaceSortDescriptors
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_phPeopleSortDescriptors
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_defaultAssetPropertySets
{
  uint64_t v2;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDE3748];
  v4[0] = *MEMORY[0x24BDE36F0];
  v4[1] = v2;
  v4[2] = *MEMORY[0x24BDE3728];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_defaultFacePropertySets
{
  uint64_t v2;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDE37C0];
  v4[0] = *MEMORY[0x24BDE37C8];
  v4[1] = v2;
  v4[2] = *MEMORY[0x24BDE37B8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
