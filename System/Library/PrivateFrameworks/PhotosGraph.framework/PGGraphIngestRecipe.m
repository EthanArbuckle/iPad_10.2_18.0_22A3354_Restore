@implementation PGGraphIngestRecipe

- (PGGraphIngestRecipe)initWithPhotoLibrary:(id)a3
{
  id v5;
  PGGraphIngestRecipe *v6;
  PGGraphIngestRecipe *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestRecipe;
  v6 = -[PGGraphIngestRecipe init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_photoLibrary, a3);

  return v7;
}

- (NSArray)momentsToIngest
{
  NSArray *momentsToIngest;
  NSArray *v4;
  NSArray *v5;

  momentsToIngest = self->_momentsToIngest;
  if (!momentsToIngest)
  {
    -[PGGraphIngestRecipe _momentsForLibraryAnalysis](self, "_momentsForLibraryAnalysis");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_momentsToIngest;
    self->_momentsToIngest = v4;

    momentsToIngest = self->_momentsToIngest;
  }
  return momentsToIngest;
}

- (NSArray)highlightsToIngest
{
  NSArray *highlightsToIngest;
  NSArray *v4;
  NSArray *v5;

  highlightsToIngest = self->_highlightsToIngest;
  if (!highlightsToIngest)
  {
    -[PGGraphIngestRecipe _highlightsForLibraryAnalysis](self, "_highlightsForLibraryAnalysis");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_highlightsToIngest;
    self->_highlightsToIngest = v4;

    highlightsToIngest = self->_highlightsToIngest;
  }
  return highlightsToIngest;
}

- (id)_momentsForLibraryAnalysis
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v6);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchMomentsWithOptions:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, objc_msgSend(v7, "count"));
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __49__PGGraphIngestRecipe__momentsForLibraryAnalysis__block_invoke;
  v17 = &unk_1E84348D0;
  v18 = v7;
  v19 = v9;
  v10 = v9;
  v11 = v7;
  objc_msgSend(v8, "enumerateIndexesUsingBlock:", &v14);
  objc_msgSend(v11, "objectsAtIndexes:", v10, v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_highlightsForLibraryAnalysis
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v6);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind = %ld || kind = %ld"), 0, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v7);

  objc_msgSend(MEMORY[0x1E0CD1708], "fetchHighlightsWithOptions:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v8, "fetchedObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)defaultPreprocessorsWithGraphBuilder:(id)a3
{
  id v3;
  PGGraphIngestPrefetchEventProcessor *v4;
  PGGraphIngestPrefetchPeopleProcessor *v5;
  PGGraphIngestPrefetchLocationProcessor *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = -[PGGraphIngestPrefetchEventProcessor initWithGraphBuilder:]([PGGraphIngestPrefetchEventProcessor alloc], "initWithGraphBuilder:", v3);
  v5 = -[PGGraphIngestPrefetchPeopleProcessor initWithGraphBuilder:]([PGGraphIngestPrefetchPeopleProcessor alloc], "initWithGraphBuilder:", v3, v4);
  v9[1] = v5;
  v6 = -[PGGraphIngestPrefetchLocationProcessor initWithGraphBuilder:]([PGGraphIngestPrefetchLocationProcessor alloc], "initWithGraphBuilder:", v3);

  v9[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)defaultPostprocessorsWithGraphBuilder:(id)a3
{
  id v3;
  PGGraphIngestPersonAgeCategoryProcessor *v4;
  PGGraphIngestPersonBiologicalSexProcessor *v5;
  PGGraphIngestRelationshipProcessor *v6;
  PGGraphIngestPetProcessor *v7;
  PGGraphIngestEventLabelingProcessor *v8;
  PGGraphIngestMusicProcessor *v9;
  PGGraphIngestPersonalAestheticsProcessor *v10;
  PGGraphIngestTripProcessor *v11;
  PGGraphIngestMemoryProcessor *v12;
  void *v13;
  PGGraphIngestMeaningfulEventsProcessor *v15;
  PGGraphIngestHolidaysProcessor *v16;
  PGGraphIngestAOIBlockingProcessor *v17;
  PGGraphIngestSocialGroupsProcessor *v18;
  PGGraphRelationshipTaggingProcessor *v19;
  PGGraphIngestNextEdgesProcessor *v20;
  PGGraphIngestBusinessProcessor *v21;
  PGGraphIngestPublicEventsProcessor *v22;
  PGGraphIngestLocationsOfInterestProcessor *v23;
  PGGraphIngestPointsOfInterestProcessor *v24;
  PGGraphIngestFrequentLocationProcessor *v25;
  PGGraphIngestLocationDisambiguationProcessor *v26;
  PGGraphIngestHomeWorkProcessor *v27;
  _QWORD v28[24];

  v28[22] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v27 = -[PGGraphIngestHomeWorkProcessor initWithGraphBuilder:]([PGGraphIngestHomeWorkProcessor alloc], "initWithGraphBuilder:", v3);
  v28[0] = v27;
  v26 = -[PGGraphIngestLocationDisambiguationProcessor initWithGraphBuilder:]([PGGraphIngestLocationDisambiguationProcessor alloc], "initWithGraphBuilder:", v3);
  v28[1] = v26;
  v25 = -[PGGraphIngestFrequentLocationProcessor initWithGraphBuilder:]([PGGraphIngestFrequentLocationProcessor alloc], "initWithGraphBuilder:", v3);
  v28[2] = v25;
  v24 = -[PGGraphIngestPointsOfInterestProcessor initWithGraphBuilder:]([PGGraphIngestPointsOfInterestProcessor alloc], "initWithGraphBuilder:", v3);
  v28[3] = v24;
  v23 = -[PGGraphIngestLocationsOfInterestProcessor initWithGraphBuilder:]([PGGraphIngestLocationsOfInterestProcessor alloc], "initWithGraphBuilder:", v3);
  v28[4] = v23;
  v22 = -[PGGraphIngestPublicEventsProcessor initWithGraphBuilder:]([PGGraphIngestPublicEventsProcessor alloc], "initWithGraphBuilder:", v3);
  v28[5] = v22;
  v21 = -[PGGraphIngestBusinessProcessor initWithGraphBuilder:]([PGGraphIngestBusinessProcessor alloc], "initWithGraphBuilder:", v3);
  v28[6] = v21;
  v20 = -[PGGraphIngestNextEdgesProcessor initWithGraphBuilder:]([PGGraphIngestNextEdgesProcessor alloc], "initWithGraphBuilder:", v3);
  v28[7] = v20;
  v19 = -[PGGraphRelationshipTaggingProcessor initWithGraphBuilder:]([PGGraphRelationshipTaggingProcessor alloc], "initWithGraphBuilder:", v3);
  v28[8] = v19;
  v18 = -[PGGraphIngestSocialGroupsProcessor initWithGraphBuilder:]([PGGraphIngestSocialGroupsProcessor alloc], "initWithGraphBuilder:", v3);
  v28[9] = v18;
  v17 = -[PGGraphIngestAOIBlockingProcessor initWithGraphBuilder:]([PGGraphIngestAOIBlockingProcessor alloc], "initWithGraphBuilder:", v3);
  v28[10] = v17;
  v16 = -[PGGraphIngestHolidaysProcessor initWithGraphBuilder:]([PGGraphIngestHolidaysProcessor alloc], "initWithGraphBuilder:", v3);
  v28[11] = v16;
  v15 = -[PGGraphIngestMeaningfulEventsProcessor initWithGraphBuilder:]([PGGraphIngestMeaningfulEventsProcessor alloc], "initWithGraphBuilder:", v3);
  v28[12] = v15;
  v4 = -[PGGraphIngestPersonAgeCategoryProcessor initWithGraphBuilder:]([PGGraphIngestPersonAgeCategoryProcessor alloc], "initWithGraphBuilder:", v3);
  v28[13] = v4;
  v5 = -[PGGraphIngestPersonBiologicalSexProcessor initWithGraphBuilder:]([PGGraphIngestPersonBiologicalSexProcessor alloc], "initWithGraphBuilder:", v3);
  v28[14] = v5;
  v6 = -[PGGraphIngestRelationshipProcessor initWithGraphBuilder:]([PGGraphIngestRelationshipProcessor alloc], "initWithGraphBuilder:", v3);
  v28[15] = v6;
  v7 = -[PGGraphIngestPetProcessor initWithGraphBuilder:]([PGGraphIngestPetProcessor alloc], "initWithGraphBuilder:", v3);
  v28[16] = v7;
  v8 = -[PGGraphIngestEventLabelingProcessor initWithGraphBuilder:]([PGGraphIngestEventLabelingProcessor alloc], "initWithGraphBuilder:", v3);
  v28[17] = v8;
  v9 = -[PGGraphIngestMusicProcessor initWithGraphBuilder:]([PGGraphIngestMusicProcessor alloc], "initWithGraphBuilder:", v3);
  v28[18] = v9;
  v10 = -[PGGraphIngestPersonalAestheticsProcessor initWithGraphBuilder:]([PGGraphIngestPersonalAestheticsProcessor alloc], "initWithGraphBuilder:", v3);
  v28[19] = v10;
  v11 = -[PGGraphIngestTripProcessor initWithGraphBuilder:]([PGGraphIngestTripProcessor alloc], "initWithGraphBuilder:", v3);
  v28[20] = v11;
  v12 = -[PGGraphIngestMemoryProcessor initWithGraphBuilder:]([PGGraphIngestMemoryProcessor alloc], "initWithGraphBuilder:", v3);

  v28[21] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightsToIngest, 0);
  objc_storeStrong((id *)&self->_momentsToIngest, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __49__PGGraphIngestRecipe__momentsForLibraryAnalysis__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "estimatedAssetCount"))
    objc_msgSend(*(id *)(a1 + 40), "removeIndex:", a2);

}

@end
