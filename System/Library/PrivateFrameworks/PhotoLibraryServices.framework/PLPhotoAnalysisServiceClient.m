@implementation PLPhotoAnalysisServiceClient

- (int64_t)suggestedPersonsForPersonWithLocalIdentifier:(id)a3 toBeConfirmedPersonSuggestions:(id)a4 toBeRejectedPersonSuggestions:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  int64_t v23;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v13, "valueForKey:", CFSTR("suggestionDictionaryRepresentation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");
  v17 = objc_msgSend(v13, "count");

  if (v16 != v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoAnalysisServiceClient+Vision.m"), 90, CFSTR("dictionary representation failure for confirmed face suggestions"));

  }
  objc_msgSend(v12, "valueForKey:", CFSTR("suggestionDictionaryRepresentation"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");
  v20 = objc_msgSend(v12, "count");

  if (v19 != v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoAnalysisServiceClient+Vision.m"), 93, CFSTR("dictionary representation failure for rejected face suggestions"));

  }
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  -[PLPhotoAnalysisServiceClient libraryURL](self, "libraryURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __157__PLPhotoAnalysisServiceClient_Vision__suggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_completion___block_invoke_2;
  v27[3] = &unk_1E3664398;
  v28 = v11;
  v29 = &v30;
  v22 = v11;
  v23 = +[PLMediaAnalysisServiceRequestAdapter requestSuggestedPersonsForPersonWithLocalIdentifier:toBeConfirmedPersonSuggestions:toBeRejectedPersonSuggestions:photoLibraryURL:progessHandler:completionHandler:](PLMediaAnalysisServiceRequestAdapter, "requestSuggestedPersonsForPersonWithLocalIdentifier:toBeConfirmedPersonSuggestions:toBeRejectedPersonSuggestions:photoLibraryURL:progessHandler:completionHandler:", v14, v15, v18, v21, &__block_literal_global_16273, v27);

  v31[3] = v23;
  _Block_object_dispose(&v30, 8);

  return v23;
}

- (int64_t)updateKeyFacesOfPersonsWithLocalIdentifiers:(id)a3 forceUpdate:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  int64_t v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v5 = a4;
  v8 = a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v9 = a3;
  -[PLPhotoAnalysisServiceClient libraryURL](self, "libraryURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __107__PLPhotoAnalysisServiceClient_Vision__updateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_completion___block_invoke_2;
  v14[3] = &unk_1E36643C0;
  v15 = v8;
  v16 = &v17;
  v11 = v8;
  v12 = +[PLMediaAnalysisServiceRequestAdapter requestUpdateKeyFacesOfPersonsWithLocalIdentifiers:forceUpdate:photoLibraryURL:progessHandler:completionHandler:](PLMediaAnalysisServiceRequestAdapter, "requestUpdateKeyFacesOfPersonsWithLocalIdentifiers:forceUpdate:photoLibraryURL:progessHandler:completionHandler:", v9, v5, v10, &__block_literal_global_89, v14);

  v18[3] = v12;
  _Block_object_dispose(&v17, 8);

  return v12;
}

- (BOOL)resetFaceClusteringState:(id *)a3
{
  dispatch_block_t v5;
  void *v6;
  id v7;
  int v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__16258;
  v23 = __Block_byref_object_dispose__16259;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v5 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_92);
  -[PLPhotoAnalysisServiceClient libraryURL](self, "libraryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__PLPhotoAnalysisServiceClient_Vision__resetFaceClusteringState___block_invoke_3;
  v11[3] = &unk_1E36643E8;
  v13 = &v15;
  v14 = &v19;
  v7 = v5;
  v12 = v7;
  +[PLMediaAnalysisServiceRequestAdapter requestResetFaceClusteringStateWithPhotoLibraryURL:progressHandler:completionHandler:](PLMediaAnalysisServiceRequestAdapter, "requestResetFaceClusteringStateWithPhotoLibraryURL:progressHandler:completionHandler:", v6, &__block_literal_global_93, v11);

  dispatch_block_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = *((unsigned __int8 *)v16 + 24);
  if (a3 && !*((_BYTE *)v16 + 24))
  {
    *a3 = objc_retainAutorelease((id)v20[5]);
    v8 = *((unsigned __int8 *)v16 + 24);
  }
  v9 = v8 != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

- (BOOL)resetFaceClassificationModel:(id *)a3
{
  dispatch_block_t v5;
  void *v6;
  id v7;
  int v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__16258;
  v23 = __Block_byref_object_dispose__16259;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v5 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_94_16268);
  -[PLPhotoAnalysisServiceClient libraryURL](self, "libraryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__PLPhotoAnalysisServiceClient_Vision__resetFaceClassificationModel___block_invoke_3;
  v11[3] = &unk_1E36643E8;
  v13 = &v15;
  v14 = &v19;
  v7 = v5;
  v12 = v7;
  +[PLMediaAnalysisServiceRequestAdapter requestResetFaceClassificationModelForPhotoLibraryURL:progressHandler:completionHandler:](PLMediaAnalysisServiceRequestAdapter, "requestResetFaceClassificationModelForPhotoLibraryURL:progressHandler:completionHandler:", v6, &__block_literal_global_95, v11);

  dispatch_block_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = *((unsigned __int8 *)v16 + 24);
  if (a3 && !*((_BYTE *)v16 + 24))
  {
    *a3 = objc_retainAutorelease((id)v20[5]);
    v8 = *((unsigned __int8 *)v16 + 24);
  }
  v9 = v8 != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

- (BOOL)reclusterFacesWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_block_t v7;
  void *v8;
  id v9;
  int v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__16258;
  v25 = __Block_byref_object_dispose__16259;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v7 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_96_16267);
  -[PLPhotoAnalysisServiceClient libraryURL](self, "libraryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__PLPhotoAnalysisServiceClient_Vision__reclusterFacesWithOptions_error___block_invoke_3;
  v13[3] = &unk_1E36643E8;
  v15 = &v17;
  v16 = &v21;
  v9 = v7;
  v14 = v9;
  +[PLMediaAnalysisServiceRequestAdapter requestResetFaceClusteringStateWithPhotoLibraryURL:progressHandler:completionHandler:](PLMediaAnalysisServiceRequestAdapter, "requestResetFaceClusteringStateWithPhotoLibraryURL:progressHandler:completionHandler:", v8, &__block_literal_global_97, v13);

  dispatch_block_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v10 = *((unsigned __int8 *)v18 + 24);
  if (a4 && !*((_BYTE *)v18 + 24))
  {
    *a4 = objc_retainAutorelease((id)v22[5]);
    v10 = *((unsigned __int8 *)v18 + 24);
  }
  v11 = v10 != 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

- (id)differencesBetweenClustersInClusterCacheAndLibrary:(id *)a3
{
  dispatch_block_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__16258;
  v25 = __Block_byref_object_dispose__16259;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__16258;
  v19 = __Block_byref_object_dispose__16259;
  v20 = 0;
  v5 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_98);
  -[PLPhotoAnalysisServiceClient libraryURL](self, "libraryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __91__PLPhotoAnalysisServiceClient_Vision__differencesBetweenClustersInClusterCacheAndLibrary___block_invoke_3;
  v11[3] = &unk_1E3664450;
  v13 = &v21;
  v14 = &v15;
  v7 = v5;
  v12 = v7;
  +[PLMediaAnalysisServiceRequestAdapter requestClusterCacheValidationWithPhotoLibraryURL:progressHandler:completionHandler:](PLMediaAnalysisServiceRequestAdapter, "requestClusterCacheValidationWithPhotoLibraryURL:progressHandler:completionHandler:", v6, &__block_literal_global_99, v11);

  dispatch_block_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = (void *)v22[5];
  if (a3 && !v8)
  {
    *a3 = objc_retainAutorelease((id)v16[5]);
    v8 = (void *)v22[5];
  }
  v9 = v8;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (void)personPromoterStatus:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t);
  dispatch_block_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  v5 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_101);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__16258;
  v22 = __Block_byref_object_dispose__16259;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__16258;
  v16 = __Block_byref_object_dispose__16259;
  v17 = 0;
  -[PLPhotoAnalysisServiceClient libraryURL](self, "libraryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__PLPhotoAnalysisServiceClient_Vision__personPromoterStatus___block_invoke_3;
  v8[3] = &unk_1E3664450;
  v10 = &v18;
  v11 = &v12;
  v7 = v5;
  v9 = v7;
  +[PLMediaAnalysisServiceRequestAdapter requestPersonPromoterStatusWithAdvancedFlag:photoLibraryURL:progressHandler:completionHandler:](PLMediaAnalysisServiceRequestAdapter, "requestPersonPromoterStatusWithAdvancedFlag:photoLibraryURL:progressHandler:completionHandler:", 0, v6, &__block_literal_global_102, v8);

  dispatch_block_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (v4)
    v4[2](v4, v19[5], v13[5]);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

}

- (void)personPromoterAdvancedStatus:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t);
  dispatch_block_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  v5 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_103);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__16258;
  v22 = __Block_byref_object_dispose__16259;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__16258;
  v16 = __Block_byref_object_dispose__16259;
  v17 = 0;
  -[PLPhotoAnalysisServiceClient libraryURL](self, "libraryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__PLPhotoAnalysisServiceClient_Vision__personPromoterAdvancedStatus___block_invoke_3;
  v8[3] = &unk_1E3664450;
  v10 = &v18;
  v11 = &v12;
  v7 = v5;
  v9 = v7;
  +[PLMediaAnalysisServiceRequestAdapter requestPersonPromoterStatusWithAdvancedFlag:photoLibraryURL:progressHandler:completionHandler:](PLMediaAnalysisServiceRequestAdapter, "requestPersonPromoterStatusWithAdvancedFlag:photoLibraryURL:progressHandler:completionHandler:", 1, v6, &__block_literal_global_104, v8);

  dispatch_block_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (v4)
    v4[2](v4, v19[5], v13[5]);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

}

- (id)faceCandidatesForKeyFaceForPersonsWithLocalIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_block_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__16258;
  v27 = __Block_byref_object_dispose__16259;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__16258;
  v21 = __Block_byref_object_dispose__16259;
  v22 = 0;
  v7 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_105);
  -[PLPhotoAnalysisServiceClient libraryURL](self, "libraryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __101__PLPhotoAnalysisServiceClient_Vision__faceCandidatesForKeyFaceForPersonsWithLocalIdentifiers_error___block_invoke_3;
  v13[3] = &unk_1E3664498;
  v15 = &v17;
  v16 = &v23;
  v9 = v7;
  v14 = v9;
  +[PLMediaAnalysisServiceRequestAdapter requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers:photoLibraryURL:progessHandler:completionHandler:](PLMediaAnalysisServiceRequestAdapter, "requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers:photoLibraryURL:progessHandler:completionHandler:", v6, v8, &__block_literal_global_106_16264, v13);

  dispatch_block_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v10 = (void *)v24[5];
  if (a4 && !v10)
  {
    *a4 = objc_retainAutorelease((id)v18[5]);
    v10 = (void *)v24[5];
  }
  v11 = v10;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

- (BOOL)rebuildPersonsWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  dispatch_block_t v12;
  void *v13;
  id v14;
  int v15;
  BOOL v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "addEntriesFromDictionary:", v6);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__16258;
  v30 = __Block_byref_object_dispose__16259;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("personLocalIdentifier"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    v32[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_111);
  -[PLPhotoAnalysisServiceClient libraryURL](self, "libraryURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__PLPhotoAnalysisServiceClient_Vision__rebuildPersonsWithOptions_error___block_invoke_3;
  v18[3] = &unk_1E36643E8;
  v20 = &v22;
  v21 = &v26;
  v14 = v12;
  v19 = v14;
  +[PLMediaAnalysisServiceRequestAdapter requestRebuildPersonsWithLocalIdentifiers:photoLibraryURL:progressHandler:completionHandler:](PLMediaAnalysisServiceRequestAdapter, "requestRebuildPersonsWithLocalIdentifiers:photoLibraryURL:progressHandler:completionHandler:", v11, v13, &__block_literal_global_112, v18);

  dispatch_block_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  v15 = *((unsigned __int8 *)v23 + 24);
  if (a4 && !*((_BYTE *)v23 + 24))
  {
    *a4 = objc_retainAutorelease((id)v27[5]);
    v15 = *((unsigned __int8 *)v23 + 24);
  }
  v16 = v15 != 0;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v16;
}

- (id)requestOnDemandFaceCropsForFaceLocalIdentifiers:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[5];
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__16258;
  v21 = __Block_byref_object_dispose__16259;
  v22 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__16258;
  v15[4] = __Block_byref_object_dispose__16259;
  v16 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__16258;
  v13[4] = __Block_byref_object_dispose__16259;
  v14 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __94__PLPhotoAnalysisServiceClient_Vision__requestOnDemandFaceCropsForFaceLocalIdentifiers_error___block_invoke;
  v12[3] = &unk_1E36767E0;
  v12[4] = v15;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __94__PLPhotoAnalysisServiceClient_Vision__requestOnDemandFaceCropsForFaceLocalIdentifiers_error___block_invoke_2;
  v11[3] = &unk_1E3676830;
  v11[4] = &v17;
  v11[5] = v13;
  objc_msgSend(v8, "requestOnDemandFaceCropsForFaceLocalIdentifiers:context:reply:", v5, v6, v11);

  v9 = (id)v18[5];
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v17, 8);

  return v9;
}

void __94__PLPhotoAnalysisServiceClient_Vision__requestOnDemandFaceCropsForFaceLocalIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __94__PLPhotoAnalysisServiceClient_Vision__requestOnDemandFaceCropsForFaceLocalIdentifiers_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __72__PLPhotoAnalysisServiceClient_Vision__rebuildPersonsWithOptions_error___block_invoke_3(_QWORD *a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(a1[4] + 16))();

}

void __101__PLPhotoAnalysisServiceClient_Vision__faceCandidatesForKeyFaceForPersonsWithLocalIdentifiers_error___block_invoke_3(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  (*(void (**)(void))(a1[4] + 16))();
}

void __69__PLPhotoAnalysisServiceClient_Vision__personPromoterAdvancedStatus___block_invoke_3(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  (*(void (**)(void))(a1[4] + 16))();
}

void __61__PLPhotoAnalysisServiceClient_Vision__personPromoterStatus___block_invoke_3(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  (*(void (**)(void))(a1[4] + 16))();
}

void __91__PLPhotoAnalysisServiceClient_Vision__differencesBetweenClustersInClusterCacheAndLibrary___block_invoke_3(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  (*(void (**)(void))(a1[4] + 16))();
}

void __72__PLPhotoAnalysisServiceClient_Vision__reclusterFacesWithOptions_error___block_invoke_3(_QWORD *a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(a1[4] + 16))();

}

void __69__PLPhotoAnalysisServiceClient_Vision__resetFaceClassificationModel___block_invoke_3(_QWORD *a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(a1[4] + 16))();

}

void __65__PLPhotoAnalysisServiceClient_Vision__resetFaceClusteringState___block_invoke_3(_QWORD *a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(a1[4] + 16))();

}

uint64_t __107__PLPhotoAnalysisServiceClient_Vision__updateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), a3);
}

void __157__PLPhotoAnalysisServiceClient_Vision__suggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  PLPhotoAnalysisPersonSuggestion *v12;
  PLPhotoAnalysisPersonSuggestion *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          v12 = [PLPhotoAnalysisPersonSuggestion alloc];
          v13 = -[PLPhotoAnalysisPersonSuggestion initWithSuggestionDictionary:](v12, "initWithSuggestionDictionary:", v11, (_QWORD)v14);
          if (v13)
            objc_msgSend(v5, "addObject:", v13);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (PLPhotoAnalysisServiceClient)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoAnalysisServiceClient.m"), 62, CFSTR("Invalid initialization"));

  return 0;
}

- (PLPhotoAnalysisServiceClient)initWithLibraryURL:(id)a3
{
  id v6;
  void *v7;
  int v8;
  PLPhotoAnalysisServiceClient *v9;
  void *v10;
  NSDictionary *v11;
  NSDictionary *cachedRequestContextDictionary;
  NSObject *v13;
  OS_dispatch_queue *v14;
  OS_dispatch_queue *backgroundQueue;
  void *v16;
  void *v17;
  objc_super v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoAnalysisServiceClient.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryURL"));

  }
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("/var/mobile/Media/PhotoData"));

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoAnalysisServiceClient.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![libraryURL.path hasPrefix:@\"/var/mobile/Media/PhotoData\"]"));

    if (!v6)
      goto LABEL_8;
  }
  else if (!v6)
  {
LABEL_8:

    self = 0;
    goto LABEL_9;
  }
  v19.receiver = self;
  v19.super_class = (Class)PLPhotoAnalysisServiceClient;
  v9 = -[PLPhotoAnalysisServiceClient init](&v19, sel_init);
  self = v9;
  if (!v9)
    goto LABEL_8;
  objc_storeStrong((id *)&v9->_libraryURL, a3);
  v20 = CFSTR("PHPhotoAnalysisOptionPhotoLibraryURLKey");
  -[NSURL absoluteString](self->_libraryURL, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  cachedRequestContextDictionary = self->_cachedRequestContextDictionary;
  self->_cachedRequestContextDictionary = v11;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.photoanalysis.PLPhotoAnalysisServiceClient.backgroundQueue", v13);
  backgroundQueue = self->_backgroundQueue;
  self->_backgroundQueue = v14;

  self->_connectionLock._os_unfair_lock_opaque = 0;
LABEL_9:

  return self;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PLPhotoAnalysisServiceClient;
  -[PLPhotoAnalysisServiceClient dealloc](&v3, sel_dealloc);
}

- (int)photoanalysisdPid
{
  void *v2;
  int v3;

  -[PLPhotoAnalysisServiceClient xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "processIdentifier");

  return v3;
}

- (id)dumpAnalysisStatusError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__68457;
  v22 = __Block_byref_object_dispose__68458;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__68457;
  v16 = __Block_byref_object_dispose__68458;
  v17 = 0;
  -[PLPhotoAnalysisServiceClient executiveService](self, "executiveService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__PLPhotoAnalysisServiceClient_dumpAnalysisStatusError___block_invoke;
  v11[3] = &unk_1E36767E0;
  v11[4] = &v18;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __56__PLPhotoAnalysisServiceClient_dumpAnalysisStatusError___block_invoke_2;
  v10[3] = &unk_1E3676830;
  v10[4] = &v18;
  v10[5] = &v12;
  objc_msgSend(v6, "requestAnalysisStatusWithReply:", v10);

  if (a3)
  {
    v7 = (void *)v19[5];
    if (v7)
      *a3 = objc_retainAutorelease(v7);
  }
  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __70__PLPhotoAnalysisServiceClient_cancelOperationsWithIdentifiers_reply___block_invoke;
  v16[3] = &unk_1E3674E40;
  v9 = v7;
  v17 = v6;
  v18 = v9;
  v10 = v6;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __70__PLPhotoAnalysisServiceClient_cancelOperationsWithIdentifiers_reply___block_invoke_2;
  v14[3] = &unk_1E366FEF8;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v11, "cancelOperationsWithIdentifiers:context:reply:", v10, v12, v14);

}

- (void)notifyLibraryAvailableAtURLForPhotoanalysisd:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoAnalysisServiceClient.m"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryURL"));

    v5 = 0;
  }
  if ((objc_msgSend(v5, "isEqual:", self->_libraryURL) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoAnalysisServiceClient.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[libraryURL isEqual:_libraryURL]"));

  }
  -[PLPhotoAnalysisServiceClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_unboostingRemoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notifyLibraryAvailableAtURL:", v10);

}

- (void)notifyLibraryAvailableAtURLForMediaanalysisd:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Notifying mediaanalysisd of photo library available at %@", (uint8_t *)&v7, 0xCu);
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.mediaanalysisd.analysis"), 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4329E0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);

  objc_msgSend(v4, "resume");
  objc_msgSend(v4, "_unboostingRemoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notifyLibraryAvailableAtURL:", v3);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Invalidating temporary connection to mediaanalysisd", (uint8_t *)&v7, 2u);
  }
  objc_msgSend(v4, "invalidate");

}

- (void)writeQALog:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_68443);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeQALog:", v4);

}

- (OS_dispatch_queue)backgroundQueue
{
  return self->_backgroundQueue;
}

- (void)_resetServicesIncludingConnection:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_connectionLock;
  NSXPCConnection *xpcConnection;
  NSXPCProxyCreating *legacyService;
  NSXPCProxyCreating *photoLibraryService;
  NSXPCProxyCreating *momentGraphService;
  NSXPCProxyCreating *testService;
  NSXPCProxyCreating *executiveService;
  NSXPCProxyCreating *wallpaperService;

  v3 = a3;
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  if (v3)
  {
    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = 0;

  }
  legacyService = self->_legacyService;
  self->_legacyService = 0;

  photoLibraryService = self->_photoLibraryService;
  self->_photoLibraryService = 0;

  momentGraphService = self->_momentGraphService;
  self->_momentGraphService = 0;

  testService = self->_testService;
  self->_testService = 0;

  executiveService = self->_executiveService;
  self->_executiveService = 0;

  wallpaperService = self->_wallpaperService;
  self->_wallpaperService = 0;

  os_unfair_lock_unlock(p_connectionLock);
}

- (void)_setupXPCConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcConnection;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  os_unfair_lock_assert_owner(&self->_connectionLock);
  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.photoanalysisd"), 0);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE44D350);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient _setupServiceProviderInterface:](self, "_setupServiceProviderInterface:", v5);
  -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v5);
  -[PLPhotoAnalysisServiceClient _setupServices](self, "_setupServices");
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__PLPhotoAnalysisServiceClient__setupXPCConnection__block_invoke;
  v9[3] = &unk_1E3677D48;
  objc_copyWeak(&v10, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __51__PLPhotoAnalysisServiceClient__setupXPCConnection__block_invoke_64;
  v7[3] = &unk_1E3677D48;
  objc_copyWeak(&v8, &location);
  -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v7);
  -[NSXPCConnection activate](self->_xpcConnection, "activate");
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)_setupLegacyServiceInterface:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];

  v33[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E20];
  v4 = a3;
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_cancelOperationsWithIdentifiers_context_reply_, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_cancelOperationsWithIdentifiers_context_reply_, 0, 1);
  v8 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestAvailableSuggestionTypeInfosWithOptions_context_reply_, 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  v32[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v11);

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_requestAvailableSuggestionTypeInfosWithOptions_context_reply_, 0, 1);
  v12 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestSuggestionInfosWithOptions_context_reply_, 0, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithSet:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  v31[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v15);

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_requestSuggestionInfosWithOptions_context_reply_, 0, 1);
  v16 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestGraphInferencesSummaryWithDateInterval_context_reply_, 0, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithSet:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  v30[2] = objc_opt_class();
  v30[3] = objc_opt_class();
  v30[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObjectsFromArray:", v19);

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_requestGraphInferencesSummaryWithDateInterval_context_reply_, 0, 1);
  v20 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestGraphInferencesSummaryWithMomentLocalIdentifiers_context_reply_, 0, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setWithSet:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = objc_opt_class();
  v29[1] = objc_opt_class();
  v29[2] = objc_opt_class();
  v29[3] = objc_opt_class();
  v29[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObjectsFromArray:", v23);

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_requestGraphInferencesSummaryWithMomentLocalIdentifiers_context_reply_, 0, 1);
  v24 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestGraphMomentLocalIdentifiersWithDateInterval_context_reply_, 0, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setWithSet:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObjectsFromArray:", v27);

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_requestGraphMomentLocalIdentifiersWithDateInterval_context_reply_, 0, 1);
}

- (void)_setupServiceProviderInterface:(id)a3
{
  void *v4;
  NSXPCInterface *v5;
  NSXPCInterface *legacyServiceInterface;
  NSXPCInterface *v7;
  NSXPCInterface *photoLibraryServiceInterface;
  NSXPCInterface *v9;
  NSXPCInterface *momentGraphServiceInterface;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSXPCInterface *v18;
  NSXPCInterface *testServiceInterface;
  NSXPCInterface *v20;
  NSXPCInterface *executiveServiceInterface;
  NSXPCInterface *v22;
  NSXPCInterface *wallpaperServiceInterface;
  id v24;

  v4 = (void *)MEMORY[0x1E0CB3B50];
  v24 = a3;
  objc_msgSend(v4, "interfaceWithProtocol:", &unk_1EE44D3B0);
  v5 = (NSXPCInterface *)objc_claimAutoreleasedReturnValue();
  legacyServiceInterface = self->_legacyServiceInterface;
  self->_legacyServiceInterface = v5;

  -[PLPhotoAnalysisServiceClient _setupLegacyServiceInterface:](self, "_setupLegacyServiceInterface:", self->_legacyServiceInterface);
  objc_msgSend(v24, "setInterface:forSelector:argumentIndex:ofReply:", self->_legacyServiceInterface, sel_legacyStorytellingServiceAt_reply_, 0, 1);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE44D410);
  v7 = (NSXPCInterface *)objc_claimAutoreleasedReturnValue();
  photoLibraryServiceInterface = self->_photoLibraryServiceInterface;
  self->_photoLibraryServiceInterface = v7;

  objc_msgSend(v24, "setInterface:forSelector:argumentIndex:ofReply:", self->_photoLibraryServiceInterface, sel_photoLibraryServiceAt_reply_, 0, 1);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE44D470);
  v9 = (NSXPCInterface *)objc_claimAutoreleasedReturnValue();
  momentGraphServiceInterface = self->_momentGraphServiceInterface;
  self->_momentGraphServiceInterface = v9;

  v11 = (void *)MEMORY[0x1E0C99E20];
  -[NSXPCInterface classesForSelector:argumentIndex:ofReply:](self->_momentGraphServiceInterface, "classesForSelector:argumentIndex:ofReply:", sel_requestAssetSearchKeywordsForAssetCollectionUUIDs_ofType_reply_, 0, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addObject:", objc_opt_class());
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](self->_momentGraphServiceInterface, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_requestAssetSearchKeywordsForAssetCollectionUUIDs_ofType_reply_, 0, 1);
  v14 = (void *)MEMORY[0x1E0C99E20];
  -[NSXPCInterface classesForSelector:argumentIndex:ofReply:](self->_momentGraphServiceInterface, "classesForSelector:argumentIndex:ofReply:", sel_requestZeroKeywordsWithOptions_reply_, 0, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithSet:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLZeroKeywordStore expectedClasses](PLZeroKeywordStore, "expectedClasses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "unionSet:", v17);

  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](self->_momentGraphServiceInterface, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_requestZeroKeywordsWithOptions_reply_, 0, 1);
  objc_msgSend(v24, "setInterface:forSelector:argumentIndex:ofReply:", self->_momentGraphServiceInterface, sel_momentGraphServiceAt_reply_, 0, 1);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE44D4D0);
  v18 = (NSXPCInterface *)objc_claimAutoreleasedReturnValue();
  testServiceInterface = self->_testServiceInterface;
  self->_testServiceInterface = v18;

  objc_msgSend(v24, "setInterface:forSelector:argumentIndex:ofReply:", self->_testServiceInterface, sel_testServiceAt_reply_, 0, 1);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE44D530);
  v20 = (NSXPCInterface *)objc_claimAutoreleasedReturnValue();
  executiveServiceInterface = self->_executiveServiceInterface;
  self->_executiveServiceInterface = v20;

  objc_msgSend(v24, "setInterface:forSelector:argumentIndex:ofReply:", self->_executiveServiceInterface, sel_executiveServiceAt_reply_, 0, 1);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE44D590);
  v22 = (NSXPCInterface *)objc_claimAutoreleasedReturnValue();
  wallpaperServiceInterface = self->_wallpaperServiceInterface;
  self->_wallpaperServiceInterface = v22;

  objc_msgSend(v24, "setInterface:forSelector:argumentIndex:ofReply:", self->_wallpaperServiceInterface, sel_wallpaperServiceAt_reply_, 0, 1);
}

- (void)_setupServices
{
  NSURL *v3;
  PLPhotoAnalysisServiceClientSideService *v4;
  NSXPCConnection *xpcConnection;
  NSXPCInterface *legacyServiceInterface;
  uint64_t v7;
  NSURL *v8;
  NSXPCProxyCreating *v9;
  NSXPCProxyCreating *legacyService;
  PLPhotoAnalysisServiceClientSideService *v11;
  NSXPCConnection *v12;
  NSXPCInterface *photoLibraryServiceInterface;
  NSURL *v14;
  NSXPCProxyCreating *v15;
  NSXPCProxyCreating *photoLibraryService;
  PLPhotoAnalysisServiceClientSideService *v17;
  NSXPCConnection *v18;
  NSXPCInterface *momentGraphServiceInterface;
  NSURL *v20;
  NSXPCProxyCreating *v21;
  NSXPCProxyCreating *momentGraphService;
  PLPhotoAnalysisServiceClientSideService *v23;
  NSXPCConnection *v24;
  NSXPCInterface *testServiceInterface;
  NSURL *v26;
  NSXPCProxyCreating *v27;
  NSXPCProxyCreating *testService;
  PLPhotoAnalysisServiceClientSideService *v29;
  NSXPCConnection *v30;
  NSXPCInterface *executiveServiceInterface;
  NSURL *v32;
  NSXPCProxyCreating *v33;
  NSXPCProxyCreating *executiveService;
  PLPhotoAnalysisServiceClientSideService *v35;
  NSXPCConnection *v36;
  NSXPCInterface *wallpaperServiceInterface;
  NSURL *v38;
  NSXPCProxyCreating *v39;
  NSXPCProxyCreating *wallpaperService;
  _QWORD v41[4];
  NSURL *v42;
  _QWORD v43[4];
  NSURL *v44;
  _QWORD v45[4];
  NSURL *v46;
  _QWORD v47[4];
  NSURL *v48;
  _QWORD v49[4];
  NSURL *v50;
  _QWORD v51[4];
  NSURL *v52;

  v3 = self->_libraryURL;
  v4 = [PLPhotoAnalysisServiceClientSideService alloc];
  xpcConnection = self->_xpcConnection;
  legacyServiceInterface = self->_legacyServiceInterface;
  v7 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __46__PLPhotoAnalysisServiceClient__setupServices__block_invoke;
  v51[3] = &unk_1E366FF40;
  v8 = v3;
  v52 = v8;
  v9 = -[PLPhotoAnalysisServiceClientSideService initWithConnection:remoteInterface:instantiationBlock:](v4, "initWithConnection:remoteInterface:instantiationBlock:", xpcConnection, legacyServiceInterface, v51);
  legacyService = self->_legacyService;
  self->_legacyService = v9;

  v11 = [PLPhotoAnalysisServiceClientSideService alloc];
  v12 = self->_xpcConnection;
  photoLibraryServiceInterface = self->_photoLibraryServiceInterface;
  v49[0] = v7;
  v49[1] = 3221225472;
  v49[2] = __46__PLPhotoAnalysisServiceClient__setupServices__block_invoke_2;
  v49[3] = &unk_1E366FF40;
  v14 = v8;
  v50 = v14;
  v15 = -[PLPhotoAnalysisServiceClientSideService initWithConnection:remoteInterface:instantiationBlock:](v11, "initWithConnection:remoteInterface:instantiationBlock:", v12, photoLibraryServiceInterface, v49);
  photoLibraryService = self->_photoLibraryService;
  self->_photoLibraryService = v15;

  v17 = [PLPhotoAnalysisServiceClientSideService alloc];
  v18 = self->_xpcConnection;
  momentGraphServiceInterface = self->_momentGraphServiceInterface;
  v47[0] = v7;
  v47[1] = 3221225472;
  v47[2] = __46__PLPhotoAnalysisServiceClient__setupServices__block_invoke_3;
  v47[3] = &unk_1E366FF40;
  v20 = v14;
  v48 = v20;
  v21 = -[PLPhotoAnalysisServiceClientSideService initWithConnection:remoteInterface:instantiationBlock:](v17, "initWithConnection:remoteInterface:instantiationBlock:", v18, momentGraphServiceInterface, v47);
  momentGraphService = self->_momentGraphService;
  self->_momentGraphService = v21;

  v23 = [PLPhotoAnalysisServiceClientSideService alloc];
  v24 = self->_xpcConnection;
  testServiceInterface = self->_testServiceInterface;
  v45[0] = v7;
  v45[1] = 3221225472;
  v45[2] = __46__PLPhotoAnalysisServiceClient__setupServices__block_invoke_4;
  v45[3] = &unk_1E366FF40;
  v26 = v20;
  v46 = v26;
  v27 = -[PLPhotoAnalysisServiceClientSideService initWithConnection:remoteInterface:instantiationBlock:](v23, "initWithConnection:remoteInterface:instantiationBlock:", v24, testServiceInterface, v45);
  testService = self->_testService;
  self->_testService = v27;

  v29 = [PLPhotoAnalysisServiceClientSideService alloc];
  v30 = self->_xpcConnection;
  executiveServiceInterface = self->_executiveServiceInterface;
  v43[0] = v7;
  v43[1] = 3221225472;
  v43[2] = __46__PLPhotoAnalysisServiceClient__setupServices__block_invoke_5;
  v43[3] = &unk_1E366FF40;
  v32 = v26;
  v44 = v32;
  v33 = -[PLPhotoAnalysisServiceClientSideService initWithConnection:remoteInterface:instantiationBlock:](v29, "initWithConnection:remoteInterface:instantiationBlock:", v30, executiveServiceInterface, v43);
  executiveService = self->_executiveService;
  self->_executiveService = v33;

  v35 = [PLPhotoAnalysisServiceClientSideService alloc];
  v36 = self->_xpcConnection;
  wallpaperServiceInterface = self->_wallpaperServiceInterface;
  v41[0] = v7;
  v41[1] = 3221225472;
  v41[2] = __46__PLPhotoAnalysisServiceClient__setupServices__block_invoke_6;
  v41[3] = &unk_1E366FF40;
  v42 = v32;
  v38 = v32;
  v39 = -[PLPhotoAnalysisServiceClientSideService initWithConnection:remoteInterface:instantiationBlock:](v35, "initWithConnection:remoteInterface:instantiationBlock:", v36, wallpaperServiceInterface, v41);
  wallpaperService = self->_wallpaperService;
  self->_wallpaperService = v39;

}

- (id)_xpcConnection
{
  os_unfair_lock_assert_owner(&self->_connectionLock);
  if (self->_xpcConnection)
  {
    if (!self->_legacyService)
      -[PLPhotoAnalysisServiceClient _setupServices](self, "_setupServices");
  }
  else
  {
    -[PLPhotoAnalysisServiceClient _setupXPCConnection](self, "_setupXPCConnection");
  }
  return self->_xpcConnection;
}

- (id)xpcConnection
{
  os_unfair_lock_s *p_connectionLock;
  void *v4;
  uint8_t v6[16];

  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  -[PLPhotoAnalysisServiceClient _xpcConnection](self, "_xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_connectionLock);
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_fault_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "The XPC connection to PAD is unexpectedly nil", v6, 2u);
  }
  return v4;
}

- (id)requestContextDictionary
{
  void *v2;
  unint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", self->_cachedRequestContextDictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  do
    v3 = __ldaxr(&requestContextDictionary_lastOperationId);
  while (__stlxr(v3 + 1, &requestContextDictionary_lastOperationId));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("PHPhotoAnalysisOptionOperationIdKey"));

  return v2;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PLPhotoAnalysisServiceClient legacyService](self, "legacyService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PLPhotoAnalysisServiceClient legacyService](self, "legacyService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)dispatchOnQueue:(id)a3 blockWithoutBoost:(id)a4
{
  NSObject *v5;
  id v6;

  v5 = a3;
  v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_BACKGROUND, 0, a4);
  dispatch_async(v5, v6);

}

- (id)legacyService
{
  os_unfair_lock_s *p_connectionLock;
  id v4;
  NSXPCProxyCreating *v5;
  uint8_t v7[16];

  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  v4 = -[PLPhotoAnalysisServiceClient _xpcConnection](self, "_xpcConnection");
  v5 = self->_legacyService;
  os_unfair_lock_unlock(p_connectionLock);
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_fault_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "The Legacy Service to PAD is unexpectedly nil", v7, 2u);
  }
  return v5;
}

- (NSURL)libraryURL
{
  return self->_libraryURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryURL, 0);
  objc_storeStrong((id *)&self->_wallpaperService, 0);
  objc_storeStrong((id *)&self->_executiveService, 0);
  objc_storeStrong((id *)&self->_testService, 0);
  objc_storeStrong((id *)&self->_momentGraphService, 0);
  objc_storeStrong((id *)&self->_photoLibraryService, 0);
  objc_storeStrong((id *)&self->_legacyService, 0);
  objc_storeStrong((id *)&self->_wallpaperServiceInterface, 0);
  objc_storeStrong((id *)&self->_executiveServiceInterface, 0);
  objc_storeStrong((id *)&self->_testServiceInterface, 0);
  objc_storeStrong((id *)&self->_momentGraphServiceInterface, 0);
  objc_storeStrong((id *)&self->_photoLibraryServiceInterface, 0);
  objc_storeStrong((id *)&self->_legacyServiceInterface, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_cachedRequestContextDictionary, 0);
}

uint64_t __46__PLPhotoAnalysisServiceClient__setupServices__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "legacyStorytellingServiceAt:reply:", *(_QWORD *)(a1 + 32), a3);
}

uint64_t __46__PLPhotoAnalysisServiceClient__setupServices__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "photoLibraryServiceAt:reply:", *(_QWORD *)(a1 + 32), a3);
}

uint64_t __46__PLPhotoAnalysisServiceClient__setupServices__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "momentGraphServiceAt:reply:", *(_QWORD *)(a1 + 32), a3);
}

uint64_t __46__PLPhotoAnalysisServiceClient__setupServices__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "testServiceAt:reply:", *(_QWORD *)(a1 + 32), a3);
}

uint64_t __46__PLPhotoAnalysisServiceClient__setupServices__block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "executiveServiceAt:reply:", *(_QWORD *)(a1 + 32), a3);
}

uint64_t __46__PLPhotoAnalysisServiceClient__setupServices__block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "wallpaperServiceAt:reply:", *(_QWORD *)(a1 + 32), a3);
}

void __51__PLPhotoAnalysisServiceClient__setupXPCConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Photo analysis client XPC connection invalidated", v3, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetServicesIncludingConnection:", 1);

}

void __51__PLPhotoAnalysisServiceClient__setupXPCConnection__block_invoke_64(uint64_t a1)
{
  id WeakRetained;
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Photo analysis client XPC connection interrupted", v3, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetServicesIncludingConnection:", 0);

}

void __70__PLPhotoAnalysisServiceClient_cancelOperationsWithIdentifiers_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = *(id *)(a1 + 32);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "setObject:forKey:", v3, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __70__PLPhotoAnalysisServiceClient_cancelOperationsWithIdentifiers_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __56__PLPhotoAnalysisServiceClient_dumpAnalysisStatusError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __56__PLPhotoAnalysisServiceClient_dumpAnalysisStatusError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)photoLibraryService
{
  os_unfair_lock_s *p_connectionLock;
  id v4;
  NSXPCProxyCreating *v5;

  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  v4 = -[PLPhotoAnalysisServiceClient _xpcConnection](self, "_xpcConnection");
  v5 = self->_photoLibraryService;
  os_unfair_lock_unlock(p_connectionLock);
  return v5;
}

- (id)momentGraphService
{
  os_unfair_lock_s *p_connectionLock;
  id v4;
  NSXPCProxyCreating *v5;

  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  v4 = -[PLPhotoAnalysisServiceClient _xpcConnection](self, "_xpcConnection");
  v5 = self->_momentGraphService;
  os_unfair_lock_unlock(p_connectionLock);
  return v5;
}

- (id)testService
{
  os_unfair_lock_s *p_connectionLock;
  id v4;
  NSXPCProxyCreating *v5;

  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  v4 = -[PLPhotoAnalysisServiceClient _xpcConnection](self, "_xpcConnection");
  v5 = self->_testService;
  os_unfair_lock_unlock(p_connectionLock);
  return v5;
}

- (id)executiveService
{
  os_unfair_lock_s *p_connectionLock;
  id v4;
  NSXPCProxyCreating *v5;

  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  v4 = -[PLPhotoAnalysisServiceClient _xpcConnection](self, "_xpcConnection");
  v5 = self->_executiveService;
  os_unfair_lock_unlock(p_connectionLock);
  return v5;
}

- (id)wallpaperService
{
  os_unfair_lock_s *p_connectionLock;
  id v4;
  NSXPCProxyCreating *v5;

  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  v4 = -[PLPhotoAnalysisServiceClient _xpcConnection](self, "_xpcConnection");
  v5 = self->_wallpaperService;
  os_unfair_lock_unlock(p_connectionLock);
  return v5;
}

- (void)reloadForYouWidgetTimelineWithReply:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__PLPhotoAnalysisServiceClient_Job__reloadForYouWidgetTimelineWithReply___block_invoke;
  v12[3] = &unk_1E3676858;
  v7 = v4;
  v13 = v7;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __73__PLPhotoAnalysisServiceClient_Job__reloadForYouWidgetTimelineWithReply___block_invoke_2;
  v10[3] = &unk_1E36768D0;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "reloadForYouWidgetTimelineWithContext:reply:", v5, v10);

}

- (void)reloadAlbumWidgetTimelineWithReply:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__PLPhotoAnalysisServiceClient_Job__reloadAlbumWidgetTimelineWithReply___block_invoke;
  v12[3] = &unk_1E3676858;
  v7 = v4;
  v13 = v7;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __72__PLPhotoAnalysisServiceClient_Job__reloadAlbumWidgetTimelineWithReply___block_invoke_2;
  v10[3] = &unk_1E36768D0;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "reloadAlbumWidgetTimelineWithContext:reply:", v5, v10);

}

- (void)recordFeatureUsageFromCounts:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__PLPhotoAnalysisServiceClient_Job__recordFeatureUsageFromCounts_reply___block_invoke;
  v15[3] = &unk_1E3676858;
  v10 = v6;
  v16 = v10;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __72__PLPhotoAnalysisServiceClient_Job__recordFeatureUsageFromCounts_reply___block_invoke_2;
  v13[3] = &unk_1E36768D0;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "recordFeatureUsageFromCounts:context:reply:", v7, v8, v13);

}

- (void)cacheCPAnalyticsPropertiesWithReply:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__PLPhotoAnalysisServiceClient_Job__cacheCPAnalyticsPropertiesWithReply___block_invoke;
  v12[3] = &unk_1E3676858;
  v7 = v4;
  v13 = v7;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __73__PLPhotoAnalysisServiceClient_Job__cacheCPAnalyticsPropertiesWithReply___block_invoke_2;
  v10[3] = &unk_1E36768D0;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "cacheCPAnalyticsPropertiesWithContext:reply:", v5, v10);

}

uint64_t __73__PLPhotoAnalysisServiceClient_Job__cacheCPAnalyticsPropertiesWithReply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __73__PLPhotoAnalysisServiceClient_Job__cacheCPAnalyticsPropertiesWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __72__PLPhotoAnalysisServiceClient_Job__recordFeatureUsageFromCounts_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __72__PLPhotoAnalysisServiceClient_Job__recordFeatureUsageFromCounts_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __72__PLPhotoAnalysisServiceClient_Job__reloadAlbumWidgetTimelineWithReply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __72__PLPhotoAnalysisServiceClient_Job__reloadAlbumWidgetTimelineWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __73__PLPhotoAnalysisServiceClient_Job__reloadForYouWidgetTimelineWithReply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __73__PLPhotoAnalysisServiceClient_Job__reloadForYouWidgetTimelineWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)requestAssetCollectionsRelatedToAssetWithLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v9 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__97213;
  v35 = __Block_byref_object_dispose__97214;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__97213;
  v29 = __Block_byref_object_dispose__97214;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__97213;
  v23 = __Block_byref_object_dispose__97214;
  v24 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __110__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToAssetWithLocalIdentifier_options_error___block_invoke;
  v18[3] = &unk_1E36767E0;
  v18[4] = &v25;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __110__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToAssetWithLocalIdentifier_options_error___block_invoke_2;
  v17[3] = &unk_1E3676808;
  v17[4] = &v31;
  v17[5] = &v19;
  objc_msgSend(v12, "requestAssetCollectionsRelatedToAssetWithLocalIdentifier:options:context:reply:", v8, v9, v10, v17);

  v13 = (void *)v32[5];
  if (a5 && !v13)
  {
    v14 = (void *)v26[5];
    if (!v14)
      v14 = (void *)v20[5];
    *a5 = objc_retainAutorelease(v14);
    v13 = (void *)v32[5];
  }
  v15 = v13;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v15;
}

- (id)requestAssetCollectionsRelatedToMomentWithLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v9 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__97213;
  v35 = __Block_byref_object_dispose__97214;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__97213;
  v29 = __Block_byref_object_dispose__97214;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__97213;
  v23 = __Block_byref_object_dispose__97214;
  v24 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __111__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToMomentWithLocalIdentifier_options_error___block_invoke;
  v18[3] = &unk_1E36767E0;
  v18[4] = &v25;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __111__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToMomentWithLocalIdentifier_options_error___block_invoke_2;
  v17[3] = &unk_1E3676808;
  v17[4] = &v31;
  v17[5] = &v19;
  objc_msgSend(v12, "requestAssetCollectionsRelatedToMomentWithLocalIdentifier:options:context:reply:", v8, v9, v10, v17);

  v13 = (void *)v32[5];
  if (a5 && !v13)
  {
    v14 = (void *)v26[5];
    if (!v14)
      v14 = (void *)v20[5];
    *a5 = objc_retainAutorelease(v14);
    v13 = (void *)v32[5];
  }
  v15 = v13;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v15;
}

- (id)requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v9 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__97213;
  v35 = __Block_byref_object_dispose__97214;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__97213;
  v29 = __Block_byref_object_dispose__97214;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__97213;
  v23 = __Block_byref_object_dispose__97214;
  v24 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __120__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier_options_error___block_invoke;
  v18[3] = &unk_1E36767E0;
  v18[4] = &v25;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __120__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier_options_error___block_invoke_2;
  v17[3] = &unk_1E3676808;
  v17[4] = &v31;
  v17[5] = &v19;
  objc_msgSend(v12, "requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier:options:context:reply:", v8, v9, v10, v17);

  v13 = (void *)v32[5];
  if (a5 && !v13)
  {
    v14 = (void *)v26[5];
    if (!v14)
      v14 = (void *)v20[5];
    *a5 = objc_retainAutorelease(v14);
    v13 = (void *)v32[5];
  }
  v15 = v13;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v15;
}

- (id)requestAssetCollectionsRelatedToPersonLocalIdentifiers:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v9 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__97213;
  v35 = __Block_byref_object_dispose__97214;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__97213;
  v29 = __Block_byref_object_dispose__97214;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__97213;
  v23 = __Block_byref_object_dispose__97214;
  v24 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __108__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToPersonLocalIdentifiers_options_error___block_invoke;
  v18[3] = &unk_1E36767E0;
  v18[4] = &v25;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __108__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToPersonLocalIdentifiers_options_error___block_invoke_2;
  v17[3] = &unk_1E3676808;
  v17[4] = &v31;
  v17[5] = &v19;
  objc_msgSend(v12, "requestAssetCollectionsRelatedToPersonLocalIdentifiers:options:context:reply:", v8, v9, v10, v17);

  v13 = (void *)v32[5];
  if (a5 && !v13)
  {
    v14 = (void *)v26[5];
    if (!v14)
      v14 = (void *)v20[5];
    *a5 = objc_retainAutorelease(v14);
    v13 = (void *)v32[5];
  }
  v15 = v13;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v15;
}

- (id)requestCuratedAssetForAssetCollectionWithLocalIdentifier:(id)a3 referenceAssetLocalIdentifier:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[6];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__97213;
  v38 = __Block_byref_object_dispose__97214;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__97213;
  v32 = __Block_byref_object_dispose__97214;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__97213;
  v26 = __Block_byref_object_dispose__97214;
  v27 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __140__PLPhotoAnalysisServiceClient_Graph__requestCuratedAssetForAssetCollectionWithLocalIdentifier_referenceAssetLocalIdentifier_options_error___block_invoke;
  v21[3] = &unk_1E36767E0;
  v21[4] = &v28;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __140__PLPhotoAnalysisServiceClient_Graph__requestCuratedAssetForAssetCollectionWithLocalIdentifier_referenceAssetLocalIdentifier_options_error___block_invoke_2;
  v20[3] = &unk_1E3676830;
  v20[4] = &v34;
  v20[5] = &v22;
  objc_msgSend(v15, "requestCuratedAssetForAssetCollectionWithLocalIdentifier:referenceAssetLocalIdentifier:options:context:reply:", v10, v11, v12, v13, v20);

  v16 = (void *)v35[5];
  if (a6 && !v16)
  {
    v17 = (void *)v29[5];
    if (!v17)
      v17 = (void *)v23[5];
    *a6 = objc_retainAutorelease(v17);
    v16 = (void *)v35[5];
  }
  v18 = v16;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v18;
}

- (id)requestCuratedAssetsForAssetCollectionWithLocalIdentifier:(id)a3 duration:(unint64_t)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v10 = a3;
  v11 = a5;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__97213;
  v37 = __Block_byref_object_dispose__97214;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__97213;
  v31 = __Block_byref_object_dispose__97214;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__97213;
  v25 = __Block_byref_object_dispose__97214;
  v26 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __120__PLPhotoAnalysisServiceClient_Graph__requestCuratedAssetsForAssetCollectionWithLocalIdentifier_duration_options_error___block_invoke;
  v20[3] = &unk_1E36767E0;
  v20[4] = &v27;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __120__PLPhotoAnalysisServiceClient_Graph__requestCuratedAssetsForAssetCollectionWithLocalIdentifier_duration_options_error___block_invoke_2;
  v19[3] = &unk_1E3676808;
  v19[4] = &v33;
  v19[5] = &v21;
  objc_msgSend(v14, "requestCuratedAssetsForAssetCollectionWithLocalIdentifier:duration:options:context:reply:", v10, a4, v11, v12, v19);

  v15 = (void *)v34[5];
  if (a6 && !v15)
  {
    v16 = (void *)v28[5];
    if (!v16)
      v16 = (void *)v22[5];
    *a6 = objc_retainAutorelease(v16);
    v15 = (void *)v34[5];
  }
  v17 = v15;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v17;
}

- (id)requestRepresentativeAssetsForAssetCollectionWithLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v9 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__97213;
  v35 = __Block_byref_object_dispose__97214;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__97213;
  v29 = __Block_byref_object_dispose__97214;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__97213;
  v23 = __Block_byref_object_dispose__97214;
  v24 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __118__PLPhotoAnalysisServiceClient_Graph__requestRepresentativeAssetsForAssetCollectionWithLocalIdentifier_options_error___block_invoke;
  v18[3] = &unk_1E36767E0;
  v18[4] = &v25;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __118__PLPhotoAnalysisServiceClient_Graph__requestRepresentativeAssetsForAssetCollectionWithLocalIdentifier_options_error___block_invoke_2;
  v17[3] = &unk_1E3676808;
  v17[4] = &v31;
  v17[5] = &v19;
  objc_msgSend(v12, "requestRepresentativeAssetsForAssetCollectionWithLocalIdentifier:options:context:reply:", v8, v9, v10, v17);

  v13 = (void *)v32[5];
  if (a5 && !v13)
  {
    v14 = (void *)v26[5];
    if (!v14)
      v14 = (void *)v20[5];
    *a5 = objc_retainAutorelease(v14);
    v13 = (void *)v32[5];
  }
  v15 = v13;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v15;
}

- (void)generateMemoriesWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__PLPhotoAnalysisServiceClient_Graph__generateMemoriesWithOptions_reply___block_invoke;
  v15[3] = &unk_1E3676858;
  v10 = v6;
  v16 = v10;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __73__PLPhotoAnalysisServiceClient_Graph__generateMemoriesWithOptions_reply___block_invoke_2;
  v13[3] = &unk_1E3676880;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "generateMemoriesWithOptions:context:reply:", v7, v8, v13);

}

- (void)simulateMemoriesNotificationWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__PLPhotoAnalysisServiceClient_Graph__simulateMemoriesNotificationWithOptions_reply___block_invoke;
  v15[3] = &unk_1E3676858;
  v10 = v6;
  v16 = v10;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __85__PLPhotoAnalysisServiceClient_Graph__simulateMemoriesNotificationWithOptions_reply___block_invoke_2;
  v13[3] = &unk_1E3676880;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "simulateMemoriesNotificationWithOptions:context:reply:", v7, v8, v13);

}

- (void)generateSuggestionsWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__PLPhotoAnalysisServiceClient_Graph__generateSuggestionsWithOptions_reply___block_invoke;
  v15[3] = &unk_1E3676858;
  v10 = v6;
  v16 = v10;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __76__PLPhotoAnalysisServiceClient_Graph__generateSuggestionsWithOptions_reply___block_invoke_2;
  v13[3] = &unk_1E3676880;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "generateSuggestionsWithOptions:context:reply:", v7, v8, v13);

}

- (void)requestGenerateQuestionsWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__PLPhotoAnalysisServiceClient_Graph__requestGenerateQuestionsWithOptions_reply___block_invoke;
  v15[3] = &unk_1E3676858;
  v10 = v6;
  v16 = v10;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __81__PLPhotoAnalysisServiceClient_Graph__requestGenerateQuestionsWithOptions_reply___block_invoke_2;
  v13[3] = &unk_1E3676880;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "requestGenerateQuestionsWithOptions:context:reply:", v7, v8, v13);

}

- (void)requestSyndicationProcessingWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__PLPhotoAnalysisServiceClient_Graph__requestSyndicationProcessingWithOptions_reply___block_invoke;
  v15[3] = &unk_1E3676858;
  v10 = v6;
  v16 = v10;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __85__PLPhotoAnalysisServiceClient_Graph__requestSyndicationProcessingWithOptions_reply___block_invoke_2;
  v13[3] = &unk_1E3676880;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "requestSyndicationProcessingWithOptions:context:reply:", v7, v8, v13);

}

- (void)requestExternalAssetRelevanceProcessingWithReply:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__PLPhotoAnalysisServiceClient_Graph__requestExternalAssetRelevanceProcessingWithReply___block_invoke;
  v12[3] = &unk_1E3676858;
  v7 = v4;
  v13 = v7;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __88__PLPhotoAnalysisServiceClient_Graph__requestExternalAssetRelevanceProcessingWithReply___block_invoke_2;
  v10[3] = &unk_1E36768A8;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "requestExternalAssetRelevanceProcessingWithContext:reply:", v5, v10);

}

- (void)requestMusicCurationForAssetCollectionLocalIdentifier:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __107__PLPhotoAnalysisServiceClient_Graph__requestMusicCurationForAssetCollectionLocalIdentifier_options_reply___block_invoke;
  v14[3] = &unk_1E3676858;
  v15 = v8;
  v12 = v8;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestMusicCurationForAssetCollectionLocalIdentifier:options:context:reply:", v10, v9, v11, v12);

}

- (void)requestMusicCurationForAssetLocalIdentifiers:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __98__PLPhotoAnalysisServiceClient_Graph__requestMusicCurationForAssetLocalIdentifiers_options_reply___block_invoke;
  v14[3] = &unk_1E3676858;
  v15 = v8;
  v12 = v8;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestMusicCurationForAssetLocalIdentifiers:options:context:reply:", v10, v9, v11, v12);

}

- (void)requestFlexMusicCurationForAssetCollectionLocalIdentifier:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __111__PLPhotoAnalysisServiceClient_Graph__requestFlexMusicCurationForAssetCollectionLocalIdentifier_options_reply___block_invoke;
  v14[3] = &unk_1E3676858;
  v15 = v8;
  v12 = v8;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestFlexMusicCurationForAssetCollectionLocalIdentifier:options:context:reply:", v10, v9, v11, v12);

}

- (void)requestFlexMusicCurationForAssetLocalIdentifiers:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __102__PLPhotoAnalysisServiceClient_Graph__requestFlexMusicCurationForAssetLocalIdentifiers_options_reply___block_invoke;
  v14[3] = &unk_1E3676858;
  v15 = v8;
  v12 = v8;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestFlexMusicCurationForAssetLocalIdentifiers:options:context:reply:", v10, v9, v11, v12);

}

- (void)requestSongsForAdamIDs:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__PLPhotoAnalysisServiceClient_Graph__requestSongsForAdamIDs_options_reply___block_invoke;
  v14[3] = &unk_1E3676858;
  v15 = v8;
  v12 = v8;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestSongsForAdamIDs:options:context:reply:", v10, v9, v11, v12);

}

- (void)requestMusicCacheStatusWithReply:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__PLPhotoAnalysisServiceClient_Graph__requestMusicCacheStatusWithReply___block_invoke;
  v8[3] = &unk_1E3676858;
  v9 = v4;
  v6 = v4;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestMusicCacheStatusWithContext:reply:", v5, v6);

}

- (void)requestPrecachingOfAudioDataForAdamIDs:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__PLPhotoAnalysisServiceClient_Graph__requestPrecachingOfAudioDataForAdamIDs_reply___block_invoke;
  v11[3] = &unk_1E3676858;
  v12 = v6;
  v9 = v6;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestPrecachingOfAudioDataForAdamIDs:context:reply:", v7, v8, v9);

}

- (void)requestMusicCurationDebugInformationForSongWithAdamID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __99__PLPhotoAnalysisServiceClient_Graph__requestMusicCurationDebugInformationForSongWithAdamID_reply___block_invoke;
  v11[3] = &unk_1E3676858;
  v12 = v6;
  v9 = v6;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestMusicCurationDebugInformationForSongWithAdamID:context:reply:", v7, v8, v9);

}

- (void)requestMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __119__PLPhotoAnalysisServiceClient_Graph__requestMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier_reply___block_invoke;
  v11[3] = &unk_1E3676858;
  v12 = v6;
  v9 = v6;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier:context:reply:", v7, v8, v9);

}

- (void)requestFlexMusicCurationDebugInformationForSongWithUID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __100__PLPhotoAnalysisServiceClient_Graph__requestFlexMusicCurationDebugInformationForSongWithUID_reply___block_invoke;
  v11[3] = &unk_1E3676858;
  v12 = v6;
  v9 = v6;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestFlexMusicCurationDebugInformationForSongWithUID:context:reply:", v7, v8, v9);

}

- (void)requestFlexMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __123__PLPhotoAnalysisServiceClient_Graph__requestFlexMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier_reply___block_invoke;
  v11[3] = &unk_1E3676858;
  v12 = v6;
  v9 = v6;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestFlexMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier:context:reply:", v7, v8, v9);

}

- (void)requestClearMusicCacheWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__PLPhotoAnalysisServiceClient_Graph__requestClearMusicCacheWithOptions_reply___block_invoke;
  v15[3] = &unk_1E3676858;
  v10 = v6;
  v16 = v10;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __79__PLPhotoAnalysisServiceClient_Graph__requestClearMusicCacheWithOptions_reply___block_invoke_2;
  v13[3] = &unk_1E3676858;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "requestClearMusicCacheWithOptions:context:reply:", v7, v8, v13);

}

- (void)requestMusicCatalogAdamIDsForPurchasedSongID:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __98__PLPhotoAnalysisServiceClient_Graph__requestMusicCatalogAdamIDsForPurchasedSongID_options_reply___block_invoke;
  v14[3] = &unk_1E3676858;
  v15 = v8;
  v12 = v8;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestMusicCatalogAdamIDsForPurchasedSongID:options:context:reply:", v10, v9, v11, v12);

}

- (void)requestCacheSongSourceWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__PLPhotoAnalysisServiceClient_Graph__requestCacheSongSourceWithOptions_reply___block_invoke;
  v11[3] = &unk_1E3676858;
  v12 = v6;
  v9 = v6;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestCacheSongSourceWithOptions:context:reply:", v7, v8, v9);

}

- (void)requestMusicCurationWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__PLPhotoAnalysisServiceClient_Graph__requestMusicCurationWithOptions_reply___block_invoke;
  v11[3] = &unk_1E3676858;
  v12 = v6;
  v9 = v6;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestMusicCurationWithOptions:context:reply:", v7, v8, v9);

}

- (void)requestFlexMusicCurationWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__PLPhotoAnalysisServiceClient_Graph__requestFlexMusicCurationWithOptions_reply___block_invoke;
  v11[3] = &unk_1E3676858;
  v12 = v6;
  v9 = v6;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestFlexMusicCurationWithOptions:context:reply:", v7, v8, v9);

}

- (void)requestRecentlyUsedSongsWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__PLPhotoAnalysisServiceClient_Graph__requestRecentlyUsedSongsWithOptions_reply___block_invoke;
  v11[3] = &unk_1E3676858;
  v12 = v6;
  v9 = v6;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestRecentlyUsedSongsWithOptions:context:reply:", v7, v8, v9);

}

- (id)requestSortedArrayOfPersonLocalIdentifiers:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__97213;
  v32 = __Block_byref_object_dispose__97214;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__97213;
  v26 = __Block_byref_object_dispose__97214;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__97213;
  v20 = __Block_byref_object_dispose__97214;
  v21 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __92__PLPhotoAnalysisServiceClient_Graph__requestSortedArrayOfPersonLocalIdentifiers_withError___block_invoke;
  v15[3] = &unk_1E36767E0;
  v15[4] = &v22;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __92__PLPhotoAnalysisServiceClient_Graph__requestSortedArrayOfPersonLocalIdentifiers_withError___block_invoke_2;
  v14[3] = &unk_1E3676808;
  v14[4] = &v28;
  v14[5] = &v16;
  objc_msgSend(v9, "requestSortedArrayOfPersonLocalIdentifiers:context:reply:", v6, v7, v14);

  v10 = (void *)v29[5];
  if (a4 && !v10)
  {
    v11 = (void *)v23[5];
    if (!v11)
      v11 = (void *)v17[5];
    *a4 = objc_retainAutorelease(v11);
    v10 = (void *)v29[5];
  }
  v12 = v10;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v12;
}

- (id)requestAllSocialGroupsForMemberLocalIdentifier:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v9 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__97213;
  v35 = __Block_byref_object_dispose__97214;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__97213;
  v29 = __Block_byref_object_dispose__97214;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__97213;
  v23 = __Block_byref_object_dispose__97214;
  v24 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __104__PLPhotoAnalysisServiceClient_Graph__requestAllSocialGroupsForMemberLocalIdentifier_withOptions_error___block_invoke;
  v18[3] = &unk_1E36767E0;
  v18[4] = &v25;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __104__PLPhotoAnalysisServiceClient_Graph__requestAllSocialGroupsForMemberLocalIdentifier_withOptions_error___block_invoke_2;
  v17[3] = &unk_1E3676808;
  v17[4] = &v31;
  v17[5] = &v19;
  objc_msgSend(v12, "requestAllSocialGroupsForMemberLocalIdentifier:options:context:reply:", v8, v9, v10, v17);

  v13 = (void *)v32[5];
  if (a5 && !v13)
  {
    v14 = (void *)v26[5];
    if (!v14)
      v14 = (void *)v20[5];
    *a5 = objc_retainAutorelease(v14);
    v13 = (void *)v32[5];
  }
  v15 = v13;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v15;
}

- (id)requestSocialGroupsOverlappingMemberLocalIdentifiers:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__97213;
  v32 = __Block_byref_object_dispose__97214;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__97213;
  v26 = __Block_byref_object_dispose__97214;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__97213;
  v20 = __Block_byref_object_dispose__97214;
  v21 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __102__PLPhotoAnalysisServiceClient_Graph__requestSocialGroupsOverlappingMemberLocalIdentifiers_withError___block_invoke;
  v15[3] = &unk_1E36767E0;
  v15[4] = &v22;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __102__PLPhotoAnalysisServiceClient_Graph__requestSocialGroupsOverlappingMemberLocalIdentifiers_withError___block_invoke_2;
  v14[3] = &unk_1E3676808;
  v14[4] = &v28;
  v14[5] = &v16;
  objc_msgSend(v9, "requestSocialGroupsOverlappingMemberLocalIdentifiers:context:reply:", v6, v7, v14);

  v10 = (void *)v29[5];
  if (a4 && !v10)
  {
    v11 = (void *)v23[5];
    if (!v11)
      v11 = (void *)v17[5];
    *a4 = objc_retainAutorelease(v11);
    v10 = (void *)v29[5];
  }
  v12 = v10;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v12;
}

- (id)requestRelatedMomentsForPersonLocalIdentifiers:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__97213;
  v32 = __Block_byref_object_dispose__97214;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__97213;
  v26 = __Block_byref_object_dispose__97214;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__97213;
  v20 = __Block_byref_object_dispose__97214;
  v21 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __96__PLPhotoAnalysisServiceClient_Graph__requestRelatedMomentsForPersonLocalIdentifiers_withError___block_invoke;
  v15[3] = &unk_1E36767E0;
  v15[4] = &v22;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __96__PLPhotoAnalysisServiceClient_Graph__requestRelatedMomentsForPersonLocalIdentifiers_withError___block_invoke_2;
  v14[3] = &unk_1E3676808;
  v14[4] = &v28;
  v14[5] = &v16;
  objc_msgSend(v9, "requestRelatedMomentsForPersonLocalIdentifiers:context:reply:", v6, v7, v14);

  v10 = (void *)v29[5];
  if (a4 && !v10)
  {
    v11 = (void *)v23[5];
    if (!v11)
      v11 = (void *)v17[5];
    *a4 = objc_retainAutorelease(v11);
    v10 = (void *)v29[5];
  }
  v12 = v10;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v12;
}

- (id)requestAssetsForPersonLocalIdentifiers:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__97213;
  v32 = __Block_byref_object_dispose__97214;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__97213;
  v26 = __Block_byref_object_dispose__97214;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__97213;
  v20 = __Block_byref_object_dispose__97214;
  v21 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __88__PLPhotoAnalysisServiceClient_Graph__requestAssetsForPersonLocalIdentifiers_withError___block_invoke;
  v15[3] = &unk_1E36767E0;
  v15[4] = &v22;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __88__PLPhotoAnalysisServiceClient_Graph__requestAssetsForPersonLocalIdentifiers_withError___block_invoke_2;
  v14[3] = &unk_1E3676808;
  v14[4] = &v28;
  v14[5] = &v16;
  objc_msgSend(v9, "requestAssetsForPersonLocalIdentifiers:context:reply:", v6, v7, v14);

  v10 = (void *)v29[5];
  if (a4 && !v10)
  {
    v11 = (void *)v23[5];
    if (!v11)
      v11 = (void *)v17[5];
    *a4 = objc_retainAutorelease(v11);
    v10 = (void *)v29[5];
  }
  v12 = v10;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v12;
}

- (id)requestSignalModelInfosWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__97213;
  v30 = __Block_byref_object_dispose__97214;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__97213;
  v24 = __Block_byref_object_dispose__97214;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__97213;
  v18 = __Block_byref_object_dispose__97214;
  v19 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__PLPhotoAnalysisServiceClient_Graph__requestSignalModelInfosWithError___block_invoke;
  v13[3] = &unk_1E36767E0;
  v13[4] = &v20;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __72__PLPhotoAnalysisServiceClient_Graph__requestSignalModelInfosWithError___block_invoke_2;
  v12[3] = &unk_1E3676830;
  v12[4] = &v26;
  v12[5] = &v14;
  objc_msgSend(v7, "requestSignalModelInfosWithContext:reply:", v5, v12);

  v8 = (void *)v27[5];
  if (a3 && !v8)
  {
    v9 = (void *)v21[5];
    if (!v9)
      v9 = (void *)v15[5];
    *a3 = objc_retainAutorelease(v9);
    v8 = (void *)v27[5];
  }
  v10 = v8;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v10;
}

- (void)notifyWhenGraphReadyWithCoalescingIdentifier:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__PLPhotoAnalysisServiceClient_Graph__notifyWhenGraphReadyWithCoalescingIdentifier_reply___block_invoke;
  v15[3] = &unk_1E3676858;
  v10 = v6;
  v16 = v10;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __90__PLPhotoAnalysisServiceClient_Graph__notifyWhenGraphReadyWithCoalescingIdentifier_reply___block_invoke_2;
  v13[3] = &unk_1E36768D0;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "notifyWhenGraphReadyWithCoalescingIdentifier:context:reply:", v7, v8, v13);

}

- (void)requestOnDemandTasksWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__PLPhotoAnalysisServiceClient_Graph__requestOnDemandTasksWithOptions_reply___block_invoke;
  v15[3] = &unk_1E3676858;
  v10 = v6;
  v16 = v10;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __77__PLPhotoAnalysisServiceClient_Graph__requestOnDemandTasksWithOptions_reply___block_invoke_2;
  v13[3] = &unk_1E36768D0;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "requestOnDemandTasksWithOptions:context:reply:", v7, v8, v13);

}

- (id)requestRelatedDebugInformationBetweenAssetForLocalIdentifier:(id)a3 andRelatedAssetCollectionForLocalIdentifier:(id)a4 options:(id)a5 relatedType:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[6];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__97213;
  v40 = __Block_byref_object_dispose__97214;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__97213;
  v34 = __Block_byref_object_dispose__97214;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__97213;
  v28 = __Block_byref_object_dispose__97214;
  v29 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __170__PLPhotoAnalysisServiceClient_Graph__requestRelatedDebugInformationBetweenAssetForLocalIdentifier_andRelatedAssetCollectionForLocalIdentifier_options_relatedType_error___block_invoke;
  v23[3] = &unk_1E36767E0;
  v23[4] = &v30;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __170__PLPhotoAnalysisServiceClient_Graph__requestRelatedDebugInformationBetweenAssetForLocalIdentifier_andRelatedAssetCollectionForLocalIdentifier_options_relatedType_error___block_invoke_2;
  v22[3] = &unk_1E3676830;
  v22[4] = &v36;
  v22[5] = &v24;
  objc_msgSend(v17, "requestRelatedDebugInformationBetweenAssetForLocalIdentifier:andRelatedAssetCollectionForLocalIdentifier:options:relatedType:context:reply:", v12, v13, v14, a6, v15, v22);

  v18 = (void *)v37[5];
  if (a7 && !v18)
  {
    v19 = (void *)v31[5];
    if (!v19)
      v19 = (void *)v25[5];
    *a7 = objc_retainAutorelease(v19);
    v18 = (void *)v37[5];
  }
  v20 = v18;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v20;
}

- (id)requestRelatedDebugInformationBetweenReferenceAssetCollectionForLocalIdentifier:(id)a3 andRelatedAssetCollectionForLocalIdentifier:(id)a4 options:(id)a5 relatedType:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[6];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__97213;
  v40 = __Block_byref_object_dispose__97214;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__97213;
  v34 = __Block_byref_object_dispose__97214;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__97213;
  v28 = __Block_byref_object_dispose__97214;
  v29 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __189__PLPhotoAnalysisServiceClient_Graph__requestRelatedDebugInformationBetweenReferenceAssetCollectionForLocalIdentifier_andRelatedAssetCollectionForLocalIdentifier_options_relatedType_error___block_invoke;
  v23[3] = &unk_1E36767E0;
  v23[4] = &v30;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __189__PLPhotoAnalysisServiceClient_Graph__requestRelatedDebugInformationBetweenReferenceAssetCollectionForLocalIdentifier_andRelatedAssetCollectionForLocalIdentifier_options_relatedType_error___block_invoke_2;
  v22[3] = &unk_1E3676830;
  v22[4] = &v36;
  v22[5] = &v24;
  objc_msgSend(v17, "requestRelatedDebugInformationBetweenReferenceAssetCollectionForLocalIdentifier:andRelatedAssetCollectionForLocalIdentifier:options:relatedType:context:reply:", v12, v13, v14, a6, v15, v22);

  v18 = (void *)v37[5];
  if (a7 && !v18)
  {
    v19 = (void *)v31[5];
    if (!v19)
      v19 = (void *)v25[5];
    *a7 = objc_retainAutorelease(v19);
    v18 = (void *)v37[5];
  }
  v20 = v18;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v20;
}

- (id)requestCurationDebugInformationForAssetLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__97213;
  v32 = __Block_byref_object_dispose__97214;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__97213;
  v26 = __Block_byref_object_dispose__97214;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__97213;
  v20 = __Block_byref_object_dispose__97214;
  v21 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __100__PLPhotoAnalysisServiceClient_Graph__requestCurationDebugInformationForAssetLocalIdentifier_error___block_invoke;
  v15[3] = &unk_1E36767E0;
  v15[4] = &v22;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __100__PLPhotoAnalysisServiceClient_Graph__requestCurationDebugInformationForAssetLocalIdentifier_error___block_invoke_2;
  v14[3] = &unk_1E3676830;
  v14[4] = &v28;
  v14[5] = &v16;
  objc_msgSend(v9, "requestCurationDebugInformationForAsset:context:reply:", v6, v7, v14);

  v10 = (void *)v29[5];
  if (a4 && !v10)
  {
    v11 = (void *)v23[5];
    if (!v11)
      v11 = (void *)v17[5];
    *a4 = objc_retainAutorelease(v11);
    v10 = (void *)v29[5];
  }
  v12 = v10;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v12;
}

- (id)requestUtilityAssetInformationWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__97213;
  v30 = __Block_byref_object_dispose__97214;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__97213;
  v24 = __Block_byref_object_dispose__97214;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__97213;
  v18 = __Block_byref_object_dispose__97214;
  v19 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__PLPhotoAnalysisServiceClient_Graph__requestUtilityAssetInformationWithError___block_invoke;
  v13[3] = &unk_1E36767E0;
  v13[4] = &v20;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __79__PLPhotoAnalysisServiceClient_Graph__requestUtilityAssetInformationWithError___block_invoke_2;
  v12[3] = &unk_1E3676830;
  v12[4] = &v26;
  v12[5] = &v14;
  objc_msgSend(v7, "requestUtilityAssetInformationWithContext:reply:", v5, v12);

  v8 = (void *)v27[5];
  if (a3 && !v8)
  {
    v9 = (void *)v21[5];
    if (!v9)
      v9 = (void *)v15[5];
    *a3 = objc_retainAutorelease(v9);
    v8 = (void *)v27[5];
  }
  v10 = v8;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v10;
}

- (id)requestSharingSuggestionDebugInformationForAssetCollectionLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__97213;
  v32 = __Block_byref_object_dispose__97214;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__97213;
  v26 = __Block_byref_object_dispose__97214;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__97213;
  v20 = __Block_byref_object_dispose__97214;
  v21 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __119__PLPhotoAnalysisServiceClient_Graph__requestSharingSuggestionDebugInformationForAssetCollectionLocalIdentifier_error___block_invoke;
  v15[3] = &unk_1E36767E0;
  v15[4] = &v22;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __119__PLPhotoAnalysisServiceClient_Graph__requestSharingSuggestionDebugInformationForAssetCollectionLocalIdentifier_error___block_invoke_2;
  v14[3] = &unk_1E3676830;
  v14[4] = &v28;
  v14[5] = &v16;
  objc_msgSend(v9, "requestSharingSuggestionDebugInformationForAssetCollectionLocalIdentifier:context:reply:", v6, v7, v14);

  v10 = (void *)v29[5];
  if (a4 && !v10)
  {
    v11 = (void *)v23[5];
    if (!v11)
      v11 = (void *)v17[5];
    *a4 = objc_retainAutorelease(v11);
    v10 = (void *)v29[5];
  }
  v12 = v10;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v12;
}

- (id)requestSharingMessageSuggestionDebugInformationForAssetCollectionLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__97213;
  v32 = __Block_byref_object_dispose__97214;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__97213;
  v26 = __Block_byref_object_dispose__97214;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__97213;
  v20 = __Block_byref_object_dispose__97214;
  v21 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __126__PLPhotoAnalysisServiceClient_Graph__requestSharingMessageSuggestionDebugInformationForAssetCollectionLocalIdentifier_error___block_invoke;
  v15[3] = &unk_1E36767E0;
  v15[4] = &v22;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __126__PLPhotoAnalysisServiceClient_Graph__requestSharingMessageSuggestionDebugInformationForAssetCollectionLocalIdentifier_error___block_invoke_2;
  v14[3] = &unk_1E3676830;
  v14[4] = &v28;
  v14[5] = &v16;
  objc_msgSend(v9, "requestSharingMessageSuggestionDebugInformationForAssetCollectionLocalIdentifier:context:reply:", v6, v7, v14);

  v10 = (void *)v29[5];
  if (a4 && !v10)
  {
    v11 = (void *)v23[5];
    if (!v11)
      v11 = (void *)v17[5];
    *a4 = objc_retainAutorelease(v11);
    v10 = (void *)v29[5];
  }
  v12 = v10;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v12;
}

- (id)requestCurationDebugInformationForAssetCollectionWithLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v9 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__97213;
  v35 = __Block_byref_object_dispose__97214;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__97213;
  v29 = __Block_byref_object_dispose__97214;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__97213;
  v23 = __Block_byref_object_dispose__97214;
  v10 = MEMORY[0x1E0C809B0];
  v24 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __122__PLPhotoAnalysisServiceClient_Graph__requestCurationDebugInformationForAssetCollectionWithLocalIdentifier_options_error___block_invoke;
  v18[3] = &unk_1E36767E0;
  v18[4] = &v25;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __122__PLPhotoAnalysisServiceClient_Graph__requestCurationDebugInformationForAssetCollectionWithLocalIdentifier_options_error___block_invoke_2;
  v17[3] = &unk_1E3676830;
  v17[4] = &v31;
  v17[5] = &v19;
  objc_msgSend(v11, "requestCurationDebugInformationForAssetCollectionWithLocalIdentifier:options:context:reply:", v8, v9, v12, v17);

  v13 = (void *)v32[5];
  if (a5 && !v13)
  {
    v14 = (void *)v26[5];
    if (!v14)
      v14 = (void *)v20[5];
    *a5 = objc_retainAutorelease(v14);
    v13 = (void *)v32[5];
  }
  v15 = v13;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v15;
}

- (id)requestSummaryCurationForHighlightLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v9 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__97213;
  v35 = __Block_byref_object_dispose__97214;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__97213;
  v29 = __Block_byref_object_dispose__97214;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__97213;
  v23 = __Block_byref_object_dispose__97214;
  v10 = MEMORY[0x1E0C809B0];
  v24 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __103__PLPhotoAnalysisServiceClient_Graph__requestSummaryCurationForHighlightLocalIdentifier_options_error___block_invoke;
  v18[3] = &unk_1E36767E0;
  v18[4] = &v25;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __103__PLPhotoAnalysisServiceClient_Graph__requestSummaryCurationForHighlightLocalIdentifier_options_error___block_invoke_2;
  v17[3] = &unk_1E3676808;
  v17[4] = &v31;
  v17[5] = &v19;
  objc_msgSend(v11, "requestSummaryCurationForHighlightLocalIdentifier:options:context:reply:", v8, v9, v12, v17);

  v13 = (void *)v32[5];
  if (a5 && !v13)
  {
    v14 = (void *)v26[5];
    if (!v14)
      v14 = (void *)v20[5];
    *a5 = objc_retainAutorelease(v14);
    v13 = (void *)v32[5];
  }
  v15 = v13;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v15;
}

- (id)requestMemoryDebugInformationForMemoryWithLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__97213;
  v32 = __Block_byref_object_dispose__97214;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__97213;
  v26 = __Block_byref_object_dispose__97214;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__97213;
  v20 = __Block_byref_object_dispose__97214;
  v7 = MEMORY[0x1E0C809B0];
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __103__PLPhotoAnalysisServiceClient_Graph__requestMemoryDebugInformationForMemoryWithLocalIdentifier_error___block_invoke;
  v15[3] = &unk_1E36767E0;
  v15[4] = &v22;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __103__PLPhotoAnalysisServiceClient_Graph__requestMemoryDebugInformationForMemoryWithLocalIdentifier_error___block_invoke_2;
  v14[3] = &unk_1E3676830;
  v14[4] = &v28;
  v14[5] = &v16;
  objc_msgSend(v8, "requestMemoryDebugInformationForMemoryWithLocalIdentifier:context:reply:", v6, v9, v14);

  v10 = (void *)v29[5];
  if (a4 && !v10)
  {
    v11 = (void *)v23[5];
    if (!v11)
      v11 = (void *)v17[5];
    *a4 = objc_retainAutorelease(v11);
    v10 = (void *)v29[5];
  }
  v12 = v10;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

- (id)requestCurationOfLength:(unint64_t)a3 forMemoryForLocalIdentifier:(id)a4 withOptions:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v10 = a4;
  v11 = a5;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__97213;
  v37 = __Block_byref_object_dispose__97214;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__97213;
  v31 = __Block_byref_object_dispose__97214;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__97213;
  v25 = __Block_byref_object_dispose__97214;
  v12 = MEMORY[0x1E0C809B0];
  v26 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __109__PLPhotoAnalysisServiceClient_Graph__requestCurationOfLength_forMemoryForLocalIdentifier_withOptions_error___block_invoke;
  v20[3] = &unk_1E36767E0;
  v20[4] = &v27;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __109__PLPhotoAnalysisServiceClient_Graph__requestCurationOfLength_forMemoryForLocalIdentifier_withOptions_error___block_invoke_2;
  v19[3] = &unk_1E3676808;
  v19[4] = &v33;
  v19[5] = &v21;
  objc_msgSend(v13, "requestCurationOfLength:forMemoryForLocalIdentifier:withOptions:context:reply:", a3, v10, v11, v14, v19);

  v15 = (void *)v34[5];
  if (a6 && !v15)
  {
    v16 = (void *)v28[5];
    if (!v16)
      v16 = (void *)v22[5];
    *a6 = objc_retainAutorelease(v16);
    v15 = (void *)v34[5];
  }
  v17 = v15;
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v17;
}

- (id)requestAvailableSuggestionTypeInfosWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__97213;
  v32 = __Block_byref_object_dispose__97214;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__97213;
  v26 = __Block_byref_object_dispose__97214;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__97213;
  v20 = __Block_byref_object_dispose__97214;
  v7 = MEMORY[0x1E0C809B0];
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __92__PLPhotoAnalysisServiceClient_Graph__requestAvailableSuggestionTypeInfosWithOptions_error___block_invoke;
  v15[3] = &unk_1E36767E0;
  v15[4] = &v22;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __92__PLPhotoAnalysisServiceClient_Graph__requestAvailableSuggestionTypeInfosWithOptions_error___block_invoke_2;
  v14[3] = &unk_1E3676830;
  v14[4] = &v28;
  v14[5] = &v16;
  objc_msgSend(v8, "requestAvailableSuggestionTypeInfosWithOptions:context:reply:", v6, v9, v14);

  v10 = (void *)v29[5];
  if (a4 && !v10)
  {
    v11 = (void *)v23[5];
    if (!v11)
      v11 = (void *)v17[5];
    *a4 = objc_retainAutorelease(v11);
    v10 = (void *)v29[5];
  }
  v12 = v10;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

- (id)requestSuggestionInfosWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__97213;
  v32 = __Block_byref_object_dispose__97214;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__97213;
  v26 = __Block_byref_object_dispose__97214;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__97213;
  v20 = __Block_byref_object_dispose__97214;
  v7 = MEMORY[0x1E0C809B0];
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__PLPhotoAnalysisServiceClient_Graph__requestSuggestionInfosWithOptions_error___block_invoke;
  v15[3] = &unk_1E36767E0;
  v15[4] = &v22;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __79__PLPhotoAnalysisServiceClient_Graph__requestSuggestionInfosWithOptions_error___block_invoke_2;
  v14[3] = &unk_1E3676808;
  v14[4] = &v28;
  v14[5] = &v16;
  objc_msgSend(v8, "requestSuggestionInfosWithOptions:context:reply:", v6, v9, v14);

  v10 = (void *)v29[5];
  if (a4 && !v10)
  {
    v11 = (void *)v23[5];
    if (!v11)
      v11 = (void *)v17[5];
    *a4 = objc_retainAutorelease(v11);
    v10 = (void *)v29[5];
  }
  v12 = v10;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

- (id)requestExportGraphForPurpose:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__97213;
  v32 = __Block_byref_object_dispose__97214;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__97213;
  v26 = __Block_byref_object_dispose__97214;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__97213;
  v20 = __Block_byref_object_dispose__97214;
  v21 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__PLPhotoAnalysisServiceClient_Graph__requestExportGraphForPurpose_error___block_invoke;
  v15[3] = &unk_1E36767E0;
  v15[4] = &v22;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __74__PLPhotoAnalysisServiceClient_Graph__requestExportGraphForPurpose_error___block_invoke_2;
  v14[3] = &unk_1E36768F8;
  v14[4] = &v28;
  v14[5] = &v16;
  objc_msgSend(v9, "requestExportGraphServiceForPurpose:context:reply:", v6, v7, v14);

  v10 = (void *)v29[5];
  if (a4 && !v10)
  {
    v11 = (void *)v23[5];
    if (!v11)
      v11 = (void *)v17[5];
    *a4 = objc_retainAutorelease(v11);
    v10 = (void *)v29[5];
  }
  v12 = v10;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v12;
}

- (id)requestGraphStatisticsWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__97213;
  v32 = __Block_byref_object_dispose__97214;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__97213;
  v26 = __Block_byref_object_dispose__97214;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__97213;
  v20 = __Block_byref_object_dispose__97214;
  v21 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__PLPhotoAnalysisServiceClient_Graph__requestGraphStatisticsWithOptions_error___block_invoke;
  v15[3] = &unk_1E36767E0;
  v15[4] = &v22;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __79__PLPhotoAnalysisServiceClient_Graph__requestGraphStatisticsWithOptions_error___block_invoke_2;
  v14[3] = &unk_1E36768F8;
  v14[4] = &v28;
  v14[5] = &v16;
  objc_msgSend(v9, "requestGraphServiceStatisticsWithOptions:context:reply:", v6, v7, v14);

  v10 = (void *)v29[5];
  if (a4 && !v10)
  {
    v11 = (void *)v23[5];
    if (!v11)
      v11 = (void *)v17[5];
    *a4 = objc_retainAutorelease(v11);
    v10 = (void *)v29[5];
  }
  v12 = v10;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v12;
}

- (void)requestHighlightEstimatesWithReply:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__PLPhotoAnalysisServiceClient_Graph__requestHighlightEstimatesWithReply___block_invoke;
  v12[3] = &unk_1E3676858;
  v6 = v4;
  v13 = v6;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __74__PLPhotoAnalysisServiceClient_Graph__requestHighlightEstimatesWithReply___block_invoke_2;
  v10[3] = &unk_1E3676920;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "requestHighlightEstimatesWithContext:reply:", v8, v10);

}

- (id)requestGraphStatus:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  PLPhotosKnowledgeGraphAvailabilityStatus *v8;
  PLPhotosKnowledgeGraphAvailabilityStatus *v9;
  void *v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__97213;
  v30 = __Block_byref_object_dispose__97214;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__97213;
  v24 = __Block_byref_object_dispose__97214;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__97213;
  v18 = __Block_byref_object_dispose__97214;
  v19 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__PLPhotoAnalysisServiceClient_Graph__requestGraphStatus___block_invoke;
  v13[3] = &unk_1E36767E0;
  v13[4] = &v20;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __58__PLPhotoAnalysisServiceClient_Graph__requestGraphStatus___block_invoke_2;
  v12[3] = &unk_1E3676830;
  v12[4] = &v26;
  v12[5] = &v14;
  objc_msgSend(v7, "requestGraphServiceStatusWithContext:reply:", v5, v12);

  if (v27[5])
  {
    v8 = [PLPhotosKnowledgeGraphAvailabilityStatus alloc];
    v9 = -[PLPhotosKnowledgeGraphAvailabilityStatus initWithDictionary:](v8, "initWithDictionary:", v27[5]);
  }
  else if (a3)
  {
    v10 = (void *)v21[5];
    if (!v10)
      v10 = (void *)v15[5];
    v9 = 0;
    *a3 = objc_retainAutorelease(v10);
  }
  else
  {
    v9 = 0;
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v9;
}

- (id)requestGraphPerformQuery:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__97213;
  v32 = __Block_byref_object_dispose__97214;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__97213;
  v26 = __Block_byref_object_dispose__97214;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__97213;
  v20 = __Block_byref_object_dispose__97214;
  v21 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__PLPhotoAnalysisServiceClient_Graph__requestGraphPerformQuery_error___block_invoke;
  v15[3] = &unk_1E36767E0;
  v15[4] = &v22;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __70__PLPhotoAnalysisServiceClient_Graph__requestGraphPerformQuery_error___block_invoke_2;
  v14[3] = &unk_1E3676830;
  v14[4] = &v28;
  v14[5] = &v16;
  objc_msgSend(v9, "requestGraphServicePerformsQueryWithContext:query:reply:", v7, v6, v14);

  v10 = (void *)v29[5];
  if (a4 && !v10)
  {
    v11 = (void *)v23[5];
    if (!v11)
      v11 = (void *)v17[5];
    *a4 = objc_retainAutorelease(v11);
    v10 = (void *)v29[5];
  }
  v12 = v10;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v12;
}

- (void)requestGraphRebuildFractionCompletedWithReply:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__PLPhotoAnalysisServiceClient_Graph__requestGraphRebuildFractionCompletedWithReply___block_invoke;
  v12[3] = &unk_1E3676858;
  v7 = v4;
  v13 = v7;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __85__PLPhotoAnalysisServiceClient_Graph__requestGraphRebuildFractionCompletedWithReply___block_invoke_2;
  v10[3] = &unk_1E36768A8;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "requestGraphRebuildFractionCompletedWithContext:reply:", v5, v10);

}

- (BOOL)requestInvalidateTransientCaches:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__97213;
  v16 = __Block_byref_object_dispose__97214;
  v17 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__PLPhotoAnalysisServiceClient_Graph__requestInvalidateTransientCaches___block_invoke;
  v11[3] = &unk_1E36767E0;
  v11[4] = &v12;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __72__PLPhotoAnalysisServiceClient_Graph__requestInvalidateTransientCaches___block_invoke_2;
  v10[3] = &unk_1E36767E0;
  v10[4] = &v12;
  objc_msgSend(v7, "requestInvalidateServiceTransientCachesWithContext:reply:", v5, v10);

  v8 = (void *)v13[5];
  if (a3 && v8)
    *a3 = objc_retainAutorelease(v8);

  _Block_object_dispose(&v12, 8);
  return v8 == 0;
}

- (BOOL)requestInvalidatePersistentCaches:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__97213;
  v16 = __Block_byref_object_dispose__97214;
  v17 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__PLPhotoAnalysisServiceClient_Graph__requestInvalidatePersistentCaches___block_invoke;
  v11[3] = &unk_1E36767E0;
  v11[4] = &v12;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __73__PLPhotoAnalysisServiceClient_Graph__requestInvalidatePersistentCaches___block_invoke_2;
  v10[3] = &unk_1E36767E0;
  v10[4] = &v12;
  objc_msgSend(v7, "requestInvalidateServicePersistentCachesWithContext:reply:", v5, v10);

  v8 = (void *)v13[5];
  if (a3 && v8)
    *a3 = objc_retainAutorelease(v8);

  _Block_object_dispose(&v12, 8);
  return v8 == 0;
}

- (void)requestSnapshotServiceForRelatedWithMomentLocalIdentifier:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__97213;
  v30 = __Block_byref_object_dispose__97214;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__97213;
  v24 = __Block_byref_object_dispose__97214;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__97213;
  v18 = __Block_byref_object_dispose__97214;
  v19 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __103__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedWithMomentLocalIdentifier_reply___block_invoke;
  v13[3] = &unk_1E36767E0;
  v13[4] = &v20;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __103__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedWithMomentLocalIdentifier_reply___block_invoke_2;
  v12[3] = &unk_1E36768F8;
  v12[4] = &v26;
  v12[5] = &v14;
  objc_msgSend(v10, "requestSnapshotServiceForRelatedWithMomentLocalIdentifier:context:reply:", v6, v8, v12);

  v11 = v21[5];
  if (!v11)
    v11 = v15[5];
  v7[2](v7, v27[5], v11);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
}

- (void)requestSnapshotServiceForRelatedWithAssetLocalIdentifier:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__97213;
  v30 = __Block_byref_object_dispose__97214;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__97213;
  v24 = __Block_byref_object_dispose__97214;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__97213;
  v18 = __Block_byref_object_dispose__97214;
  v19 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __102__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedWithAssetLocalIdentifier_reply___block_invoke;
  v13[3] = &unk_1E36767E0;
  v13[4] = &v20;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __102__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedWithAssetLocalIdentifier_reply___block_invoke_2;
  v12[3] = &unk_1E36768F8;
  v12[4] = &v26;
  v12[5] = &v14;
  objc_msgSend(v10, "requestSnapshotServiceForRelatedWithAssetLocalIdentifier:context:reply:", v6, v8, v12);

  v11 = v21[5];
  if (!v11)
    v11 = v15[5];
  v7[2](v7, v27[5], v11);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
}

- (void)requestSnapshotServiceForRelatedDebugInfoBetweenAssetForLocalIdentifier:(id)a3 andRelatedResultsForLocalIdentifiers:(id)a4 relatedType:(unint64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, uint64_t);
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD, uint64_t))a6;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__97213;
  v35 = __Block_byref_object_dispose__97214;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__97213;
  v29 = __Block_byref_object_dispose__97214;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__97213;
  v23 = __Block_byref_object_dispose__97214;
  v24 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __166__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedDebugInfoBetweenAssetForLocalIdentifier_andRelatedResultsForLocalIdentifiers_relatedType_reply___block_invoke;
  v18[3] = &unk_1E36767E0;
  v18[4] = &v25;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __166__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedDebugInfoBetweenAssetForLocalIdentifier_andRelatedResultsForLocalIdentifiers_relatedType_reply___block_invoke_2;
  v17[3] = &unk_1E36768F8;
  v17[4] = &v31;
  v17[5] = &v19;
  objc_msgSend(v15, "requestSnapshotServiceForRelatedDebugInfoBetweenAssetForLocalIdentifier:andRelatedResultsForLocalIdentifiers:relatedType:context:reply:", v10, v11, a5, v13, v17);

  v16 = v26[5];
  if (!v16)
    v16 = v20[5];
  v12[2](v12, v32[5], v16);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
}

- (void)requestSnapshotServiceForRelatedDebugInfoBetweenMomentForLocalIdentifier:(id)a3 andRelatedResultsForLocalIdentifiers:(id)a4 relatedType:(unint64_t)a5 additionalSnapshotSummaryInfo:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, uint64_t);
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[6];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, _QWORD, uint64_t))a7;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__97213;
  v38 = __Block_byref_object_dispose__97214;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__97213;
  v32 = __Block_byref_object_dispose__97214;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__97213;
  v26 = __Block_byref_object_dispose__97214;
  v27 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __197__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedDebugInfoBetweenMomentForLocalIdentifier_andRelatedResultsForLocalIdentifiers_relatedType_additionalSnapshotSummaryInfo_reply___block_invoke;
  v21[3] = &unk_1E36767E0;
  v21[4] = &v28;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v17;
  v20[1] = 3221225472;
  v20[2] = __197__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedDebugInfoBetweenMomentForLocalIdentifier_andRelatedResultsForLocalIdentifiers_relatedType_additionalSnapshotSummaryInfo_reply___block_invoke_2;
  v20[3] = &unk_1E36768F8;
  v20[4] = &v34;
  v20[5] = &v22;
  objc_msgSend(v18, "requestSnapshotServiceForRelatedDebugInfoBetweenMomentForLocalIdentifier:andRelatedResultsForLocalIdentifiers:relatedType:additionalSnapshotSummaryInfo:context:reply:", v12, v13, a5, v14, v16, v20);

  v19 = v29[5];
  if (!v19)
    v19 = v23[5];
  v15[2](v15, v35[5], v19);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
}

- (id)requestDefaultsObjectForKey:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__97213;
  v31 = __Block_byref_object_dispose__97214;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__97213;
  v25 = __Block_byref_object_dispose__97214;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__97213;
  v19 = __Block_byref_object_dispose__97214;
  v20 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__PLPhotoAnalysisServiceClient_Graph__requestDefaultsObjectForKey_withError___block_invoke;
  v14[3] = &unk_1E36767E0;
  v14[4] = &v27;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __77__PLPhotoAnalysisServiceClient_Graph__requestDefaultsObjectForKey_withError___block_invoke_2;
  v13[3] = &unk_1E3676948;
  v13[4] = &v15;
  v13[5] = &v21;
  objc_msgSend(v9, "requestDefaultsObjectForKey:context:reply:", v6, v7, v13);

  if (a4)
  {
    v10 = (void *)v28[5];
    if (!v10)
      v10 = (void *)v22[5];
    *a4 = objc_retainAutorelease(v10);
  }
  v11 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v11;
}

- (BOOL)requestSetDefaultsObject:(id)a3 forKey:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__97213;
  v28 = __Block_byref_object_dispose__97214;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__97213;
  v22 = __Block_byref_object_dispose__97214;
  v23 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __81__PLPhotoAnalysisServiceClient_Graph__requestSetDefaultsObject_forKey_withError___block_invoke;
  v17[3] = &unk_1E36767E0;
  v17[4] = &v24;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __81__PLPhotoAnalysisServiceClient_Graph__requestSetDefaultsObject_forKey_withError___block_invoke_2;
  v16[3] = &unk_1E36767E0;
  v16[4] = &v18;
  objc_msgSend(v12, "requestSetDefaultsObject:forKey:context:reply:", v8, v9, v10, v16);

  if (a5)
  {
    v13 = (void *)v25[5];
    if (!v13)
      v13 = (void *)v19[5];
    *a5 = objc_retainAutorelease(v13);
  }
  if (v25[5])
    v14 = 0;
  else
    v14 = v19[5] == 0;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v14;
}

- (BOOL)requestTitleForCollectionMomentListWithLocalIdentifier:(id)a3 format:(int64_t)a4 title:(id *)a5 subtitle:(id *)a6 error:(id *)a7
{
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  _QWORD v18[7];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v12 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__97213;
  v36 = __Block_byref_object_dispose__97214;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__97213;
  v30 = __Block_byref_object_dispose__97214;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__97213;
  v24 = __Block_byref_object_dispose__97214;
  v25 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __122__PLPhotoAnalysisServiceClient_Graph__requestTitleForCollectionMomentListWithLocalIdentifier_format_title_subtitle_error___block_invoke;
  v19[3] = &unk_1E36767E0;
  v19[4] = &v20;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __122__PLPhotoAnalysisServiceClient_Graph__requestTitleForCollectionMomentListWithLocalIdentifier_format_title_subtitle_error___block_invoke_2;
  v18[3] = &unk_1E3676970;
  v18[4] = &v32;
  v18[5] = &v26;
  v18[6] = &v20;
  objc_msgSend(v15, "requestTitleForCollectionMomentListWithLocalIdentifier:format:context:reply:", v12, a4, v13, v18);

  if (a5)
    *a5 = objc_retainAutorelease((id)v33[5]);
  if (a6)
    *a6 = objc_retainAutorelease((id)v27[5]);
  if (a7)
    *a7 = objc_retainAutorelease((id)v21[5]);
  v16 = v21[5] == 0;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v16;
}

- (BOOL)requestTitleForAssetCollectionWithLocalIdentifier:(id)a3 format:(int64_t)a4 title:(id *)a5 subtitle:(id *)a6 error:(id *)a7
{
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  _QWORD v18[7];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v12 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__97213;
  v36 = __Block_byref_object_dispose__97214;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__97213;
  v30 = __Block_byref_object_dispose__97214;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__97213;
  v24 = __Block_byref_object_dispose__97214;
  v25 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __117__PLPhotoAnalysisServiceClient_Graph__requestTitleForAssetCollectionWithLocalIdentifier_format_title_subtitle_error___block_invoke;
  v19[3] = &unk_1E36767E0;
  v19[4] = &v20;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __117__PLPhotoAnalysisServiceClient_Graph__requestTitleForAssetCollectionWithLocalIdentifier_format_title_subtitle_error___block_invoke_2;
  v18[3] = &unk_1E3676970;
  v18[4] = &v32;
  v18[5] = &v26;
  v18[6] = &v20;
  objc_msgSend(v15, "requestTitleForAssetCollectionWithLocalIdentifier:format:context:reply:", v12, a4, v13, v18);

  if (a5)
    *a5 = objc_retainAutorelease((id)v33[5]);
  if (a6)
    *a6 = objc_retainAutorelease((id)v27[5]);
  if (a7)
    *a7 = objc_retainAutorelease((id)v21[5]);
  v16 = v21[5] == 0;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v16;
}

- (BOOL)requestTitleForPersonLocalIdentifiers:(id)a3 format:(int64_t)a4 title:(id *)a5 subtitle:(id *)a6 error:(id *)a7
{
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  _QWORD v18[7];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v12 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__97213;
  v36 = __Block_byref_object_dispose__97214;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__97213;
  v30 = __Block_byref_object_dispose__97214;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__97213;
  v24 = __Block_byref_object_dispose__97214;
  v25 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __105__PLPhotoAnalysisServiceClient_Graph__requestTitleForPersonLocalIdentifiers_format_title_subtitle_error___block_invoke;
  v19[3] = &unk_1E36767E0;
  v19[4] = &v20;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __105__PLPhotoAnalysisServiceClient_Graph__requestTitleForPersonLocalIdentifiers_format_title_subtitle_error___block_invoke_2;
  v18[3] = &unk_1E3676970;
  v18[4] = &v32;
  v18[5] = &v26;
  v18[6] = &v20;
  objc_msgSend(v15, "requestTitleForPersonLocalIdentifiers:format:context:reply:", v12, a4, v13, v18);

  if (a5)
    *a5 = objc_retainAutorelease((id)v33[5]);
  if (a6)
    *a6 = objc_retainAutorelease((id)v27[5]);
  if (a7)
    *a7 = objc_retainAutorelease((id)v21[5]);
  v16 = v21[5] == 0;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v16;
}

- (id)requestSnapshotServiceForRelatedResultsWithGraphOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__97213;
  v24 = __Block_byref_object_dispose__97214;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__97213;
  v18 = __Block_byref_object_dispose__97214;
  v19 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __101__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedResultsWithGraphOptions_error___block_invoke;
  v13[3] = &unk_1E36767E0;
  v13[4] = &v14;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __101__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedResultsWithGraphOptions_error___block_invoke_2;
  v12[3] = &unk_1E36768F8;
  v12[4] = &v20;
  v12[5] = &v14;
  objc_msgSend(v9, "requestSnapshotServiceForRelatedResultsWithGraphOptions:context:reply:", v6, v7, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v10 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

- (id)requestSnapshotServiceForPeopleCurationResultsWithGraphOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__97213;
  v24 = __Block_byref_object_dispose__97214;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__97213;
  v18 = __Block_byref_object_dispose__97214;
  v19 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __108__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForPeopleCurationResultsWithGraphOptions_error___block_invoke;
  v13[3] = &unk_1E36767E0;
  v13[4] = &v14;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __108__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForPeopleCurationResultsWithGraphOptions_error___block_invoke_2;
  v12[3] = &unk_1E36768F8;
  v12[4] = &v20;
  v12[5] = &v14;
  objc_msgSend(v9, "requestSnapshotServiceForPeopleCurationResultsWithGraphOptions:context:reply:", v6, v7, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v10 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

- (id)requestSuggestedRecipientsForAssetLocalIdentifiers:(id)a3 momentLocalIdentifiers:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint32_t denom;
  uint32_t numer;
  NSObject *v24;
  NSObject *v25;
  id v26;
  id v28;
  _QWORD v29[6];
  _QWORD v30[5];
  mach_timebase_info info;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  double v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v10 = a4;
  v11 = a5;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__97213;
  v48 = __Block_byref_object_dispose__97214;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__97213;
  v42 = __Block_byref_object_dispose__97214;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__97213;
  v36 = __Block_byref_object_dispose__97214;
  v37 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotoAnalysisQueriesGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_id_generate(v13);
  info = 0;
  mach_timebase_info(&info);
  v15 = v13;
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "RequestSuggestedRecipientsForAssetLocalIdentifiers", ", buf, 2u);
  }

  v17 = mach_absolute_time();
  v18 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __127__PLPhotoAnalysisServiceClient_Graph__requestSuggestedRecipientsForAssetLocalIdentifiers_momentLocalIdentifiers_options_error___block_invoke;
  v30[3] = &unk_1E36767E0;
  v30[4] = &v38;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v30);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v18;
  v29[1] = 3221225472;
  v29[2] = __127__PLPhotoAnalysisServiceClient_Graph__requestSuggestedRecipientsForAssetLocalIdentifiers_momentLocalIdentifiers_options_error___block_invoke_2;
  v29[3] = &unk_1E3676808;
  v29[4] = &v44;
  v29[5] = &v32;
  objc_msgSend(v19, "requestSuggestedRecipientsForAssetLocalIdentifiers:momentLocalIdentifiers:options:context:reply:", v28, v10, v11, v12, v29);

  if (a6 && !v45[5])
  {
    v20 = (void *)v39[5];
    if (!v20)
      v20 = (void *)v33[5];
    *a6 = objc_retainAutorelease(v20);
  }
  v21 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v24 = v16;
  v25 = v24;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v25, OS_SIGNPOST_INTERVAL_END, v14, "RequestSuggestedRecipientsForAssetLocalIdentifiers", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v51 = "RequestSuggestedRecipientsForAssetLocalIdentifiers";
    v52 = 2048;
    v53 = (float)((float)((float)((float)(v21 - v17) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v26 = (id)v45[5];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v26;
}

- (id)requestBatchSuggestedRecipientsForMomentUUIDByAssetUUID:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v9 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__97213;
  v35 = __Block_byref_object_dispose__97214;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__97213;
  v29 = __Block_byref_object_dispose__97214;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__97213;
  v23 = __Block_byref_object_dispose__97214;
  v24 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __109__PLPhotoAnalysisServiceClient_Graph__requestBatchSuggestedRecipientsForMomentUUIDByAssetUUID_options_error___block_invoke;
  v18[3] = &unk_1E36767E0;
  v18[4] = &v25;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __109__PLPhotoAnalysisServiceClient_Graph__requestBatchSuggestedRecipientsForMomentUUIDByAssetUUID_options_error___block_invoke_2;
  v17[3] = &unk_1E3676830;
  v17[4] = &v31;
  v17[5] = &v19;
  objc_msgSend(v12, "requestBatchSuggestedRecipientsForMomentUUIDByAssetUUID:options:context:reply:", v8, v9, v10, v17);

  v13 = (void *)v32[5];
  if (a5 && !v13)
  {
    v14 = (void *)v26[5];
    if (!v14)
      v14 = (void *)v20[5];
    *a5 = objc_retainAutorelease(v14);
    v13 = (void *)v32[5];
  }
  v15 = v13;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v15;
}

- (id)requestSuggestedContributionsForAssetsMetadata:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint32_t denom;
  uint32_t numer;
  NSObject *v19;
  NSObject *v20;
  id v21;
  _QWORD v23[6];
  _QWORD v24[5];
  mach_timebase_info info;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  double v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__97213;
  v42 = __Block_byref_object_dispose__97214;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__97213;
  v36 = __Block_byref_object_dispose__97214;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__97213;
  v30 = __Block_byref_object_dispose__97214;
  v31 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotoAnalysisQueriesGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);
  info = 0;
  mach_timebase_info(&info);
  v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "RequestSuggestedContributions", ", buf, 2u);
  }

  v12 = mach_absolute_time();
  v13 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __92__PLPhotoAnalysisServiceClient_Graph__requestSuggestedContributionsForAssetsMetadata_error___block_invoke;
  v24[3] = &unk_1E36767E0;
  v24[4] = &v32;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __92__PLPhotoAnalysisServiceClient_Graph__requestSuggestedContributionsForAssetsMetadata_error___block_invoke_2;
  v23[3] = &unk_1E3676808;
  v23[4] = &v38;
  v23[5] = &v26;
  objc_msgSend(v14, "requestSuggestedContributionsForAssetsMetadata:options:context:reply:", v6, 0, v7, v23);

  if (a4 && !v39[5])
  {
    v15 = (void *)v33[5];
    if (!v15)
      v15 = (void *)v27[5];
    *a4 = objc_retainAutorelease(v15);
  }
  v16 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v19 = v11;
  v20 = v19;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v20, OS_SIGNPOST_INTERVAL_END, v9, "RequestSuggestedContributions", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v45 = "RequestSuggestedContributions";
    v46 = 2048;
    v47 = (float)((float)((float)((float)(v16 - v12) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v21 = (id)v39[5];

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  return v21;
}

- (BOOL)requestHighlightEnrichmentWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__97213;
  v18 = __Block_byref_object_dispose__97214;
  v8 = MEMORY[0x1E0C809B0];
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__PLPhotoAnalysisServiceClient_Graph__requestHighlightEnrichmentWithOptions_error___block_invoke;
  v13[3] = &unk_1E36767E0;
  v13[4] = &v14;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __83__PLPhotoAnalysisServiceClient_Graph__requestHighlightEnrichmentWithOptions_error___block_invoke_2;
  v12[3] = &unk_1E36767E0;
  v12[4] = &v14;
  objc_msgSend(v9, "requestHighlightEnrichmentWithOptions:context:reply:", v6, v7, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v10 = v15[5] == 0;
  _Block_object_dispose(&v14, 8);

  return v10;
}

- (BOOL)requestEnrichmentWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__97213;
  v18 = __Block_byref_object_dispose__97214;
  v8 = MEMORY[0x1E0C809B0];
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__PLPhotoAnalysisServiceClient_Graph__requestEnrichmentWithOptions_error___block_invoke;
  v13[3] = &unk_1E36767E0;
  v13[4] = &v14;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __74__PLPhotoAnalysisServiceClient_Graph__requestEnrichmentWithOptions_error___block_invoke_2;
  v12[3] = &unk_1E36767E0;
  v12[4] = &v14;
  objc_msgSend(v9, "requestEnrichmentWithOptions:context:reply:", v6, v7, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v10 = v15[5] == 0;
  _Block_object_dispose(&v14, 8);

  return v10;
}

- (BOOL)requestHighlightCollectionEnrichmentWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__97213;
  v18 = __Block_byref_object_dispose__97214;
  v8 = MEMORY[0x1E0C809B0];
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__PLPhotoAnalysisServiceClient_Graph__requestHighlightCollectionEnrichmentWithOptions_error___block_invoke;
  v13[3] = &unk_1E36767E0;
  v13[4] = &v14;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __93__PLPhotoAnalysisServiceClient_Graph__requestHighlightCollectionEnrichmentWithOptions_error___block_invoke_2;
  v12[3] = &unk_1E36767E0;
  v12[4] = &v14;
  objc_msgSend(v9, "requestHighlightCollectionEnrichmentWithOptions:context:reply:", v6, v7, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v10 = v15[5] == 0;
  _Block_object_dispose(&v14, 8);

  return v10;
}

- (BOOL)requestAssetRevGeocodingWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__97213;
  v16 = __Block_byref_object_dispose__97214;
  v6 = MEMORY[0x1E0C809B0];
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__PLPhotoAnalysisServiceClient_Graph__requestAssetRevGeocodingWithError___block_invoke;
  v11[3] = &unk_1E36767E0;
  v11[4] = &v12;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __73__PLPhotoAnalysisServiceClient_Graph__requestAssetRevGeocodingWithError___block_invoke_2;
  v10[3] = &unk_1E36767E0;
  v10[4] = &v12;
  objc_msgSend(v7, "requestAssetRevGeocodingWithContext:reply:", v5, v10);

  if (a3)
    *a3 = objc_retainAutorelease((id)v13[5]);
  v8 = v13[5] == 0;
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (BOOL)requestAssetRevGeocodingForAssetLocalIdentifiers:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__97213;
  v18 = __Block_byref_object_dispose__97214;
  v8 = MEMORY[0x1E0C809B0];
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __98__PLPhotoAnalysisServiceClient_Graph__requestAssetRevGeocodingForAssetLocalIdentifiers_withError___block_invoke;
  v13[3] = &unk_1E36767E0;
  v13[4] = &v14;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __98__PLPhotoAnalysisServiceClient_Graph__requestAssetRevGeocodingForAssetLocalIdentifiers_withError___block_invoke_2;
  v12[3] = &unk_1E36767E0;
  v12[4] = &v14;
  objc_msgSend(v9, "requestAssetRevGeocodingForAssetLocalIdentifiers:context:reply:", v6, v7, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v10 = v15[5] == 0;
  _Block_object_dispose(&v14, 8);

  return v10;
}

- (BOOL)requestSyndicationLibraryRevGeocodingWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__97213;
  v16 = __Block_byref_object_dispose__97214;
  v6 = MEMORY[0x1E0C809B0];
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__PLPhotoAnalysisServiceClient_Graph__requestSyndicationLibraryRevGeocodingWithError___block_invoke;
  v11[3] = &unk_1E36767E0;
  v11[4] = &v12;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __86__PLPhotoAnalysisServiceClient_Graph__requestSyndicationLibraryRevGeocodingWithError___block_invoke_2;
  v10[3] = &unk_1E3676998;
  v10[4] = &v12;
  objc_msgSend(v7, "requestRevGeocodingSyndicationLibraryWithContext:reply:", v5, v10);

  if (a3)
    *a3 = objc_retainAutorelease((id)v13[5]);
  v8 = v13[5] == 0;
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (id)requestHighlightDebugInformationForHighlightWithLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__97213;
  v32 = __Block_byref_object_dispose__97214;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__97213;
  v26 = __Block_byref_object_dispose__97214;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__97213;
  v20 = __Block_byref_object_dispose__97214;
  v7 = MEMORY[0x1E0C809B0];
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __109__PLPhotoAnalysisServiceClient_Graph__requestHighlightDebugInformationForHighlightWithLocalIdentifier_error___block_invoke;
  v15[3] = &unk_1E36767E0;
  v15[4] = &v22;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __109__PLPhotoAnalysisServiceClient_Graph__requestHighlightDebugInformationForHighlightWithLocalIdentifier_error___block_invoke_2;
  v14[3] = &unk_1E3676830;
  v14[4] = &v28;
  v14[5] = &v16;
  objc_msgSend(v8, "requestHighlightDebugInformationForHighlightWithLocalIdentifier:context:reply:", v6, v9, v14);

  v10 = (void *)v29[5];
  if (a4 && !v10)
  {
    v11 = (void *)v23[5];
    if (!v11)
      v11 = (void *)v17[5];
    *a4 = objc_retainAutorelease(v11);
    v10 = (void *)v29[5];
  }
  v12 = v10;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

- (id)requestTextFeaturesForMomentLocalIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__97213;
  v24 = __Block_byref_object_dispose__97214;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__97213;
  v18 = __Block_byref_object_dispose__97214;
  v8 = MEMORY[0x1E0C809B0];
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__PLPhotoAnalysisServiceClient_Graph__requestTextFeaturesForMomentLocalIdentifiers_error___block_invoke;
  v13[3] = &unk_1E36767E0;
  v13[4] = &v20;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __90__PLPhotoAnalysisServiceClient_Graph__requestTextFeaturesForMomentLocalIdentifiers_error___block_invoke_2;
  v12[3] = &unk_1E3676830;
  v12[4] = &v14;
  v12[5] = &v20;
  objc_msgSend(v9, "requestTextFeaturesForMomentLocalIdentifiers:context:reply:", v6, v7, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

- (id)requestIconicSceneScoreForAssetLocalIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__97213;
  v24 = __Block_byref_object_dispose__97214;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__97213;
  v18 = __Block_byref_object_dispose__97214;
  v8 = MEMORY[0x1E0C809B0];
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__PLPhotoAnalysisServiceClient_Graph__requestIconicSceneScoreForAssetLocalIdentifiers_error___block_invoke;
  v13[3] = &unk_1E36767E0;
  v13[4] = &v20;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __93__PLPhotoAnalysisServiceClient_Graph__requestIconicSceneScoreForAssetLocalIdentifiers_error___block_invoke_2;
  v12[3] = &unk_1E3676830;
  v12[4] = &v14;
  v12[5] = &v20;
  objc_msgSend(v9, "requestIconicSceneScoreForAssetLocalIdentifiers:context:reply:", v6, v7, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

- (id)requestGeoHashForAssetLocalIdentifiers:(id)a3 geoHashSize:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__97213;
  v27 = __Block_byref_object_dispose__97214;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__97213;
  v21 = __Block_byref_object_dispose__97214;
  v11 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __96__PLPhotoAnalysisServiceClient_Graph__requestGeoHashForAssetLocalIdentifiers_geoHashSize_error___block_invoke;
  v16[3] = &unk_1E36767E0;
  v16[4] = &v23;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __96__PLPhotoAnalysisServiceClient_Graph__requestGeoHashForAssetLocalIdentifiers_geoHashSize_error___block_invoke_2;
  v15[3] = &unk_1E3676830;
  v15[4] = &v17;
  v15[5] = &v23;
  objc_msgSend(v12, "requestGeoHashForAssetLocalIdentifiers:geoHashSize:context:reply:", v8, v9, v10, v15);

  if (a5)
    *a5 = objc_retainAutorelease((id)v24[5]);
  v13 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v13;
}

- (id)requestCurationScoreByAssetUUIDForAssetUUIDs:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__97213;
  v24 = __Block_byref_object_dispose__97214;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__97213;
  v18 = __Block_byref_object_dispose__97214;
  v8 = MEMORY[0x1E0C809B0];
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__PLPhotoAnalysisServiceClient_Graph__requestCurationScoreByAssetUUIDForAssetUUIDs_error___block_invoke;
  v13[3] = &unk_1E36767E0;
  v13[4] = &v20;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __90__PLPhotoAnalysisServiceClient_Graph__requestCurationScoreByAssetUUIDForAssetUUIDs_error___block_invoke_2;
  v12[3] = &unk_1E3676830;
  v12[4] = &v14;
  v12[5] = &v20;
  objc_msgSend(v9, "requestCurationScoreByAssetUUIDForAssetUUIDs:context:reply:", v6, v7, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

- (id)runCurationWithItems:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__97213;
  v27 = __Block_byref_object_dispose__97214;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__97213;
  v21 = __Block_byref_object_dispose__97214;
  v11 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__PLPhotoAnalysisServiceClient_Graph__runCurationWithItems_options_error___block_invoke;
  v16[3] = &unk_1E36767E0;
  v16[4] = &v23;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __74__PLPhotoAnalysisServiceClient_Graph__runCurationWithItems_options_error___block_invoke_2;
  v15[3] = &unk_1E3676830;
  v15[4] = &v17;
  v15[5] = &v23;
  objc_msgSend(v12, "runCurationWithItems:options:context:reply:", v8, v9, v10, v15);

  if (a5)
    *a5 = objc_retainAutorelease((id)v24[5]);
  v13 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v13;
}

- (BOOL)reportMetricsWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__97213;
  v29 = __Block_byref_object_dispose__97214;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__97213;
  v23 = __Block_byref_object_dispose__97214;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v7 = MEMORY[0x1E0C809B0];
  v18 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__PLPhotoAnalysisServiceClient_Graph__reportMetricsWithOptions_error___block_invoke;
  v14[3] = &unk_1E36767E0;
  v14[4] = &v25;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __70__PLPhotoAnalysisServiceClient_Graph__reportMetricsWithOptions_error___block_invoke_2;
  v13[3] = &unk_1E36769C0;
  v13[4] = &v15;
  v13[5] = &v19;
  objc_msgSend(v8, "reportMetricsWithOptions:context:reply:", v6, v9, v13);

  if (a4)
  {
    v10 = (void *)v26[5];
    if (!v10)
      v10 = (void *)v20[5];
    *a4 = objc_retainAutorelease(v10);
  }
  v11 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v11;
}

- (void)requestRunPFLWithAttachments:(id)a3 recipeUserInfo:(id)a4 resultBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[7];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, uint64_t, uint64_t))a5;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__97213;
  v39 = __Block_byref_object_dispose__97214;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__97213;
  v33 = __Block_byref_object_dispose__97214;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__97213;
  v27 = __Block_byref_object_dispose__97214;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__97213;
  v21 = __Block_byref_object_dispose__97214;
  v11 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __95__PLPhotoAnalysisServiceClient_Graph__requestRunPFLWithAttachments_recipeUserInfo_resultBlock___block_invoke;
  v16[3] = &unk_1E36767E0;
  v16[4] = &v35;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __95__PLPhotoAnalysisServiceClient_Graph__requestRunPFLWithAttachments_recipeUserInfo_resultBlock___block_invoke_2;
  v15[3] = &unk_1E36769E8;
  v15[4] = &v23;
  v15[5] = &v17;
  v15[6] = &v29;
  objc_msgSend(v12, "requestRunPFLWithAttachments:recipeUserInfo:context:resultBlock:", v8, v9, v13, v15);

  v14 = v30[5];
  if (!v14)
    v14 = v36[5];
  v10[2](v10, v24[5], v18[5], v14);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
}

- (void)requestRunShadowEvaluationWithRecipe:(id)a3 models:(id)a4 trialDeploymentID:(id)a5 trialExperimentID:(id)a6 trialTreatmentID:(id)a7 resultBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, _QWORD);
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[5];
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (void (**)(id, _QWORD))a8;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__97213;
  v36 = __Block_byref_object_dispose__97214;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__97213;
  v30 = __Block_byref_object_dispose__97214;
  v20 = MEMORY[0x1E0C809B0];
  v31 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __148__PLPhotoAnalysisServiceClient_Graph__requestRunShadowEvaluationWithRecipe_models_trialDeploymentID_trialExperimentID_trialTreatmentID_resultBlock___block_invoke;
  v25[3] = &unk_1E36767E0;
  v25[4] = &v32;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = 3221225472;
  v24[2] = __148__PLPhotoAnalysisServiceClient_Graph__requestRunShadowEvaluationWithRecipe_models_trialDeploymentID_trialExperimentID_trialTreatmentID_resultBlock___block_invoke_2;
  v24[3] = &unk_1E36767E0;
  v24[4] = &v26;
  v24[0] = v20;
  objc_msgSend(v21, "runShadowEvaluationWithRecipe:models:trialDeploymentID:trialExperimentID:trialTreatmentID:context:resultBlock:", v14, v15, v16, v17, v18, v22, v24);

  v23 = v27[5];
  if (!v23)
    v23 = v33[5];
  v19[2](v19, v23);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
}

- (void)requestModelInference:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75__PLPhotoAnalysisServiceClient_Graph__requestModelInference_options_reply___block_invoke;
  v18[3] = &unk_1E3676858;
  v10 = v8;
  v19 = v10;
  v11 = a4;
  v12 = a3;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __75__PLPhotoAnalysisServiceClient_Graph__requestModelInference_options_reply___block_invoke_2;
  v16[3] = &unk_1E36768D0;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v13, "runModelInferenceForFingerprintVersion:options:context:reply:", v12, v11, v14, v16);

}

- (id)requestRelationshipInferencesForPersonLocalIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint32_t denom;
  uint32_t numer;
  NSObject *v18;
  NSObject *v19;
  id v20;
  _QWORD v22[6];
  _QWORD v23[5];
  mach_timebase_info info;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  double v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__97213;
  v35 = __Block_byref_object_dispose__97214;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__97213;
  v29 = __Block_byref_object_dispose__97214;
  v30 = 0;
  PLPhotoAnalysisQueriesGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  info = 0;
  mach_timebase_info(&info);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RequestRelationshipInferencesForPersonLocalIdentifiers", ", buf, 2u);
  }

  v11 = mach_absolute_time();
  v12 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __100__PLPhotoAnalysisServiceClient_Graph__requestRelationshipInferencesForPersonLocalIdentifiers_error___block_invoke;
  v23[3] = &unk_1E36767E0;
  v23[4] = &v31;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __100__PLPhotoAnalysisServiceClient_Graph__requestRelationshipInferencesForPersonLocalIdentifiers_error___block_invoke_2;
  v22[3] = &unk_1E3676830;
  v22[4] = &v25;
  v22[5] = &v31;
  objc_msgSend(v13, "requestRelationshipInferencesForPersonLocalIdentifiers:context:reply:", v6, v14, v22);

  if (a4)
    *a4 = objc_retainAutorelease((id)v32[5]);
  v15 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v18 = v10;
  v19 = v18;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v19, OS_SIGNPOST_INTERVAL_END, v8, "RequestRelationshipInferencesForPersonLocalIdentifiers", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "RequestRelationshipInferencesForPersonLocalIdentifiers";
    v39 = 2048;
    v40 = (float)((float)((float)((float)(v15 - v11) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v20 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v20;
}

- (id)requestSuggestedPersonsWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint32_t denom;
  uint32_t numer;
  NSObject *v18;
  NSObject *v19;
  id v20;
  _QWORD v22[6];
  _QWORD v23[5];
  mach_timebase_info info;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  double v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__97213;
  v35 = __Block_byref_object_dispose__97214;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__97213;
  v29 = __Block_byref_object_dispose__97214;
  v30 = 0;
  PLPhotoAnalysisQueriesGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  info = 0;
  mach_timebase_info(&info);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RequestSuggestedPersonsWithOptions", ", buf, 2u);
  }

  v11 = mach_absolute_time();
  v12 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __80__PLPhotoAnalysisServiceClient_Graph__requestSuggestedPersonsWithOptions_error___block_invoke;
  v23[3] = &unk_1E36767E0;
  v23[4] = &v31;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __80__PLPhotoAnalysisServiceClient_Graph__requestSuggestedPersonsWithOptions_error___block_invoke_2;
  v22[3] = &unk_1E3676808;
  v22[4] = &v25;
  v22[5] = &v31;
  objc_msgSend(v13, "requestSuggestedPersonsWithOptions:context:reply:", v6, v14, v22);

  v15 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v18 = v10;
  v19 = v18;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v19, OS_SIGNPOST_INTERVAL_END, v8, "RequestSuggestedPersonsWithOptions", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "RequestSuggestedPersonsWithOptions";
    v39 = 2048;
    v40 = (float)((float)((float)((float)(v15 - v11) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v32[5]);
  v20 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v20;
}

- (id)requestComposabilityScoresOfAssetsForLocalIdentifiers:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint32_t denom;
  uint32_t numer;
  NSObject *v21;
  NSObject *v22;
  id v23;
  _QWORD v25[6];
  _QWORD v26[5];
  mach_timebase_info info;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__97213;
  v38 = __Block_byref_object_dispose__97214;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__97213;
  v32 = __Block_byref_object_dispose__97214;
  v33 = 0;
  PLPhotoAnalysisQueriesGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);
  info = 0;
  mach_timebase_info(&info);
  v12 = v10;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "RequestComposabilityScores", ", buf, 2u);
  }

  v14 = mach_absolute_time();
  v15 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __107__PLPhotoAnalysisServiceClient_Graph__requestComposabilityScoresOfAssetsForLocalIdentifiers_options_error___block_invoke;
  v26[3] = &unk_1E36767E0;
  v26[4] = &v34;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  v25[1] = 3221225472;
  v25[2] = __107__PLPhotoAnalysisServiceClient_Graph__requestComposabilityScoresOfAssetsForLocalIdentifiers_options_error___block_invoke_2;
  v25[3] = &unk_1E3676830;
  v25[4] = &v28;
  v25[5] = &v34;
  objc_msgSend(v16, "requestComposabilityScoresOfAssetsForLocalIdentifiers:options:context:reply:", v8, v9, v17, v25);

  v18 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v21 = v13;
  v22 = v21;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v22, OS_SIGNPOST_INTERVAL_END, v11, "RequestComposabilityScores", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "RequestComposabilityScores";
    v42 = 2048;
    v43 = (float)((float)((float)((float)(v18 - v14) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  if (a5)
    *a5 = objc_retainAutorelease((id)v35[5]);
  v23 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v23;
}

- (id)requestSuggestedMePersonIdentifierWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__97213;
  v29 = __Block_byref_object_dispose__97214;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__97213;
  v23 = __Block_byref_object_dispose__97214;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__97213;
  v17 = __Block_byref_object_dispose__97214;
  v18 = 0;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__PLPhotoAnalysisServiceClient_Graph__requestSuggestedMePersonIdentifierWithError___block_invoke;
  v12[3] = &unk_1E36767E0;
  v12[4] = &v19;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __83__PLPhotoAnalysisServiceClient_Graph__requestSuggestedMePersonIdentifierWithError___block_invoke_2;
  v11[3] = &unk_1E36768F8;
  v11[4] = &v25;
  v11[5] = &v13;
  objc_msgSend(v7, "requestInferredMePersonLocalIdentifierWithErrorForContext:reply:", v5, v11);

  if (a3)
  {
    v8 = (void *)v20[5];
    if (!v8)
      v8 = (void *)v14[5];
    *a3 = objc_retainAutorelease(v8);
  }
  v9 = (id)v26[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v9;
}

- (id)requestGraphInferencesSummaryWithDateInterval:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint32_t denom;
  uint32_t numer;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v25[6];
  _QWORD v26[5];
  mach_timebase_info info;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__97213;
  v38 = __Block_byref_object_dispose__97214;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__97213;
  v32 = __Block_byref_object_dispose__97214;
  v33 = 0;
  PLPhotoAnalysisQueriesGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  info = 0;
  mach_timebase_info(&info);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RequestGraphInferencesSummaryWithDateInterval", ", buf, 2u);
  }

  v11 = mach_absolute_time();
  v12 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __91__PLPhotoAnalysisServiceClient_Graph__requestGraphInferencesSummaryWithDateInterval_error___block_invoke;
  v26[3] = &unk_1E36767E0;
  v26[4] = &v34;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v12;
  v25[1] = 3221225472;
  v25[2] = __91__PLPhotoAnalysisServiceClient_Graph__requestGraphInferencesSummaryWithDateInterval_error___block_invoke_2;
  v25[3] = &unk_1E3676830;
  v25[4] = &v28;
  v25[5] = &v34;
  objc_msgSend(v13, "requestGraphInferencesSummaryWithDateInterval:context:reply:", v6, v14, v25);

  v15 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v18 = v10;
  v19 = v18;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v19, OS_SIGNPOST_INTERVAL_END, v8, "RequestGraphInferencesSummaryWithDateInterval", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "RequestGraphInferencesSummaryWithDateInterval";
    v42 = 2048;
    v43 = (float)((float)((float)((float)(v15 - v11) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v20 = (void *)v35[5];
  v21 = v20;
  v22 = v21;
  if (v20 && a4)
    *a4 = objc_retainAutorelease(v21);

  v23 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v23;
}

- (id)requestGraphInferencesSummaryWithMomentLocalIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint32_t denom;
  uint32_t numer;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v25[6];
  _QWORD v26[5];
  mach_timebase_info info;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__97213;
  v38 = __Block_byref_object_dispose__97214;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__97213;
  v32 = __Block_byref_object_dispose__97214;
  v33 = 0;
  PLPhotoAnalysisQueriesGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  info = 0;
  mach_timebase_info(&info);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RequestGraphInferencesSummaryWithDateInterval", ", buf, 2u);
  }

  v11 = mach_absolute_time();
  v12 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __101__PLPhotoAnalysisServiceClient_Graph__requestGraphInferencesSummaryWithMomentLocalIdentifiers_error___block_invoke;
  v26[3] = &unk_1E36767E0;
  v26[4] = &v34;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v12;
  v25[1] = 3221225472;
  v25[2] = __101__PLPhotoAnalysisServiceClient_Graph__requestGraphInferencesSummaryWithMomentLocalIdentifiers_error___block_invoke_2;
  v25[3] = &unk_1E3676830;
  v25[4] = &v28;
  v25[5] = &v34;
  objc_msgSend(v13, "requestGraphInferencesSummaryWithMomentLocalIdentifiers:context:reply:", v6, v14, v25);

  v15 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v18 = v10;
  v19 = v18;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v19, OS_SIGNPOST_INTERVAL_END, v8, "RequestGraphInferencesSummaryWithDateInterval", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "RequestGraphInferencesSummaryWithDateInterval";
    v42 = 2048;
    v43 = (float)((float)((float)((float)(v15 - v11) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v20 = (void *)v35[5];
  v21 = v20;
  v22 = v21;
  if (v20 && a4)
    *a4 = objc_retainAutorelease(v21);

  v23 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v23;
}

- (id)requestGraphMomentLocalIdentifiersWithDateInterval:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint32_t denom;
  uint32_t numer;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v25[6];
  _QWORD v26[5];
  mach_timebase_info info;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__97213;
  v38 = __Block_byref_object_dispose__97214;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__97213;
  v32 = __Block_byref_object_dispose__97214;
  v33 = 0;
  PLPhotoAnalysisQueriesGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  info = 0;
  mach_timebase_info(&info);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RequestGraphInferencesSummaryWithDateInterval", ", buf, 2u);
  }

  v11 = mach_absolute_time();
  v12 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __96__PLPhotoAnalysisServiceClient_Graph__requestGraphMomentLocalIdentifiersWithDateInterval_error___block_invoke;
  v26[3] = &unk_1E36767E0;
  v26[4] = &v34;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v12;
  v25[1] = 3221225472;
  v25[2] = __96__PLPhotoAnalysisServiceClient_Graph__requestGraphMomentLocalIdentifiersWithDateInterval_error___block_invoke_2;
  v25[3] = &unk_1E3676808;
  v25[4] = &v28;
  v25[5] = &v34;
  objc_msgSend(v13, "requestGraphMomentLocalIdentifiersWithDateInterval:context:reply:", v6, v14, v25);

  v15 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v18 = v10;
  v19 = v18;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v19, OS_SIGNPOST_INTERVAL_END, v8, "RequestGraphInferencesSummaryWithDateInterval", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "RequestGraphInferencesSummaryWithDateInterval";
    v42 = 2048;
    v43 = (float)((float)((float)((float)(v15 - v11) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v20 = (void *)v35[5];
  v21 = v20;
  v22 = v21;
  if (v20 && a4)
    *a4 = objc_retainAutorelease(v21);

  v23 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v23;
}

- (id)requestPersonalTraitsForHighlightsWithUUIDs:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint32_t denom;
  uint32_t numer;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v25[6];
  _QWORD v26[5];
  mach_timebase_info info;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__97213;
  v38 = __Block_byref_object_dispose__97214;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__97213;
  v32 = __Block_byref_object_dispose__97214;
  v33 = 0;
  PLPhotoAnalysisQueriesGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  info = 0;
  mach_timebase_info(&info);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "requestPersonalTraitsForHighlightsWithUUIDs", ", buf, 2u);
  }

  v11 = mach_absolute_time();
  -[PLPhotoAnalysisServiceClient momentGraphService](self, "momentGraphService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __89__PLPhotoAnalysisServiceClient_Graph__requestPersonalTraitsForHighlightsWithUUIDs_error___block_invoke;
  v26[3] = &unk_1E36767E0;
  v26[4] = &v34;
  objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v13;
  v25[1] = 3221225472;
  v25[2] = __89__PLPhotoAnalysisServiceClient_Graph__requestPersonalTraitsForHighlightsWithUUIDs_error___block_invoke_2;
  v25[3] = &unk_1E3676808;
  v25[4] = &v28;
  v25[5] = &v34;
  objc_msgSend(v14, "requestPersonalTraitsForHighlightUUIDs:reply:", v6, v25);

  v15 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v18 = v10;
  v19 = v18;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v19, OS_SIGNPOST_INTERVAL_END, v8, "requestPersonalTraitsForHighlightsWithUUIDs", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "requestPersonalTraitsForHighlightsWithUUIDs";
    v42 = 2048;
    v43 = (float)((float)((float)((float)(v15 - v11) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v20 = (void *)v35[5];
  v21 = v20;
  v22 = v21;
  if (v20 && a4)
    *a4 = objc_retainAutorelease(v21);

  v23 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v23;
}

- (id)requestPersonalTraitsForAssetsWithUUIDs:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint32_t denom;
  uint32_t numer;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v25[6];
  _QWORD v26[5];
  mach_timebase_info info;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__97213;
  v38 = __Block_byref_object_dispose__97214;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__97213;
  v32 = __Block_byref_object_dispose__97214;
  v33 = 0;
  PLPhotoAnalysisQueriesGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  info = 0;
  mach_timebase_info(&info);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "requestPersonalTraitsForAssetsWithUUIDs", ", buf, 2u);
  }

  v11 = mach_absolute_time();
  -[PLPhotoAnalysisServiceClient momentGraphService](self, "momentGraphService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __85__PLPhotoAnalysisServiceClient_Graph__requestPersonalTraitsForAssetsWithUUIDs_error___block_invoke;
  v26[3] = &unk_1E36767E0;
  v26[4] = &v34;
  objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v13;
  v25[1] = 3221225472;
  v25[2] = __85__PLPhotoAnalysisServiceClient_Graph__requestPersonalTraitsForAssetsWithUUIDs_error___block_invoke_2;
  v25[3] = &unk_1E3676808;
  v25[4] = &v28;
  v25[5] = &v34;
  objc_msgSend(v14, "requestPersonalTraitsForAssetUUIDs:reply:", v6, v25);

  v15 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v18 = v10;
  v19 = v18;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v19, OS_SIGNPOST_INTERVAL_END, v8, "requestPersonalTraitsForAssetsWithUUIDs", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "requestPersonalTraitsForAssetsWithUUIDs";
    v42 = 2048;
    v43 = (float)((float)((float)((float)(v15 - v11) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v20 = (void *)v35[5];
  v21 = v20;
  v22 = v21;
  if (v20 && a4)
    *a4 = objc_retainAutorelease(v21);

  v23 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v23;
}

- (id)requestDiscoveryFeedItemsWithOptions:(id)a3 generationSessionState:(id *)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint32_t denom;
  uint32_t numer;
  NSObject *v20;
  NSObject *v21;
  id v22;
  _QWORD v24[7];
  _QWORD v25[5];
  mach_timebase_info info;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  double v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__97213;
  v43 = __Block_byref_object_dispose__97214;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__97213;
  v37 = __Block_byref_object_dispose__97214;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__97213;
  v31 = __Block_byref_object_dispose__97214;
  v32 = 0;
  PLPhotoAnalysisQueriesGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);
  info = 0;
  mach_timebase_info(&info);
  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "RequestDiscoveryFeedItemsWithOptions", ", buf, 2u);
  }

  v13 = mach_absolute_time();
  v14 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __105__PLPhotoAnalysisServiceClient_Graph__requestDiscoveryFeedItemsWithOptions_generationSessionState_error___block_invoke;
  v25[3] = &unk_1E36767E0;
  v25[4] = &v39;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = __105__PLPhotoAnalysisServiceClient_Graph__requestDiscoveryFeedItemsWithOptions_generationSessionState_error___block_invoke_2;
  v24[3] = &unk_1E3676A40;
  v24[4] = &v33;
  v24[5] = &v27;
  v24[6] = &v39;
  objc_msgSend(v15, "requestDiscoveryFeedItemsWithOptions:context:reply:", v8, v16, v24);

  v17 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v20 = v12;
  v21 = v20;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v21, OS_SIGNPOST_INTERVAL_END, v10, "RequestDiscoveryFeedItemsWithOptions", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "RequestDiscoveryFeedItemsWithOptions";
    v47 = 2048;
    v48 = (float)((float)((float)((float)(v17 - v13) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v28[5]);
  if (a5)
    *a5 = objc_retainAutorelease((id)v40[5]);
  v22 = (id)v34[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  return v22;
}

- (id)requestUpNextMemoryLocalIdentifiersWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint32_t denom;
  uint32_t numer;
  NSObject *v18;
  NSObject *v19;
  id v20;
  _QWORD v22[6];
  _QWORD v23[5];
  mach_timebase_info info;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  double v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__97213;
  v35 = __Block_byref_object_dispose__97214;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__97213;
  v29 = __Block_byref_object_dispose__97214;
  v30 = 0;
  PLPhotoAnalysisQueriesGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  info = 0;
  mach_timebase_info(&info);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RequestUpNextMemoriesWithOptions", ", buf, 2u);
  }

  v11 = mach_absolute_time();
  v12 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __92__PLPhotoAnalysisServiceClient_Graph__requestUpNextMemoryLocalIdentifiersWithOptions_error___block_invoke;
  v23[3] = &unk_1E36767E0;
  v23[4] = &v31;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __92__PLPhotoAnalysisServiceClient_Graph__requestUpNextMemoryLocalIdentifiersWithOptions_error___block_invoke_2;
  v22[3] = &unk_1E3676830;
  v22[4] = &v25;
  v22[5] = &v31;
  objc_msgSend(v13, "requestUpNextMemoriesWithOptions:context:reply:", v6, v14, v22);

  v15 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v18 = v10;
  v19 = v18;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v19, OS_SIGNPOST_INTERVAL_END, v8, "RequestUpNextMemoriesWithOptions", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "RequestUpNextMemoriesWithOptions";
    v39 = 2048;
    v40 = (float)((float)((float)((float)(v15 - v11) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v32[5]);
  v20 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v20;
}

- (id)requestKeyAssetLocalIdentifierForPrototypeCategory:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__97213;
  v24 = __Block_byref_object_dispose__97214;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__97213;
  v18 = __Block_byref_object_dispose__97214;
  v7 = MEMORY[0x1E0C809B0];
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __96__PLPhotoAnalysisServiceClient_Graph__requestKeyAssetLocalIdentifierForPrototypeCategory_error___block_invoke;
  v13[3] = &unk_1E36767E0;
  v13[4] = &v20;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __96__PLPhotoAnalysisServiceClient_Graph__requestKeyAssetLocalIdentifierForPrototypeCategory_error___block_invoke_2;
  v12[3] = &unk_1E36768F8;
  v12[4] = &v14;
  v12[5] = &v20;
  objc_msgSend(v8, "requestKeyAssetLocalIdentifierForPrototypeCategory:context:reply:", v6, v9, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

- (id)requestUpNextAssetLocalIdentifiersForAssetWithLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__97213;
  v24 = __Block_byref_object_dispose__97214;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__97213;
  v18 = __Block_byref_object_dispose__97214;
  v7 = MEMORY[0x1E0C809B0];
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __107__PLPhotoAnalysisServiceClient_Graph__requestUpNextAssetLocalIdentifiersForAssetWithLocalIdentifier_error___block_invoke;
  v13[3] = &unk_1E36767E0;
  v13[4] = &v20;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __107__PLPhotoAnalysisServiceClient_Graph__requestUpNextAssetLocalIdentifiersForAssetWithLocalIdentifier_error___block_invoke_2;
  v12[3] = &unk_1E3676808;
  v12[4] = &v14;
  v12[5] = &v20;
  objc_msgSend(v8, "requestUpNextAssetLocalIdentifiersForAssetWithLocalIdentifier:context:reply:", v6, v9, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

- (id)requestTrendsByIdentifierWithCadence:(id)a3 forYear:(unint64_t)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__97213;
  v26 = __Block_byref_object_dispose__97214;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__97213;
  v20 = __Block_byref_object_dispose__97214;
  v9 = MEMORY[0x1E0C809B0];
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__PLPhotoAnalysisServiceClient_Graph__requestTrendsByIdentifierWithCadence_forYear_error___block_invoke;
  v15[3] = &unk_1E36767E0;
  v15[4] = &v22;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __90__PLPhotoAnalysisServiceClient_Graph__requestTrendsByIdentifierWithCadence_forYear_error___block_invoke_2;
  v14[3] = &unk_1E3676830;
  v14[4] = &v16;
  v14[5] = &v22;
  objc_msgSend(v10, "requestTrendsByIdentifierWithCadence:forYear:context:reply:", v8, a4, v11, v14);

  if (a5)
    *a5 = objc_retainAutorelease((id)v23[5]);
  v12 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

- (id)requestUtilityAssetLocalIdentifiersWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__97213;
  v22 = __Block_byref_object_dispose__97214;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__97213;
  v16 = __Block_byref_object_dispose__97214;
  v5 = MEMORY[0x1E0C809B0];
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__PLPhotoAnalysisServiceClient_Graph__requestUtilityAssetLocalIdentifiersWithError___block_invoke;
  v11[3] = &unk_1E36767E0;
  v11[4] = &v18;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __84__PLPhotoAnalysisServiceClient_Graph__requestUtilityAssetLocalIdentifiersWithError___block_invoke_2;
  v10[3] = &unk_1E3676830;
  v10[4] = &v12;
  v10[5] = &v18;
  objc_msgSend(v6, "requestUtilityAssetLocalIdentifiersWithContext:reply:", v7, v10);

  if (a3)
    *a3 = objc_retainAutorelease((id)v19[5]);
  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

- (id)requestConfidenceByMomentLocalIdentifierForMeaning:(id)a3 useAlternativeMeaningEdge:(BOOL)a4 onlyHighPrecision:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__97213;
  v28 = __Block_byref_object_dispose__97214;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__97213;
  v22 = __Block_byref_object_dispose__97214;
  v11 = MEMORY[0x1E0C809B0];
  v23 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __140__PLPhotoAnalysisServiceClient_Graph__requestConfidenceByMomentLocalIdentifierForMeaning_useAlternativeMeaningEdge_onlyHighPrecision_error___block_invoke;
  v17[3] = &unk_1E36767E0;
  v17[4] = &v24;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __140__PLPhotoAnalysisServiceClient_Graph__requestConfidenceByMomentLocalIdentifierForMeaning_useAlternativeMeaningEdge_onlyHighPrecision_error___block_invoke_2;
  v16[3] = &unk_1E3676830;
  v16[4] = &v18;
  v16[5] = &v24;
  objc_msgSend(v12, "requestConfidenceByMomentLocalIdentifierForMeaning:useAlternativeMeaningEdge:onlyHighPrecision:context:reply:", v10, v8, v7, v13, v16);

  if (a6)
    *a6 = objc_retainAutorelease((id)v25[5]);
  v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

- (id)requestAssetLocalIdentifiersByCityNameWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__97213;
  v22 = __Block_byref_object_dispose__97214;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__97213;
  v16 = __Block_byref_object_dispose__97214;
  v5 = MEMORY[0x1E0C809B0];
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__PLPhotoAnalysisServiceClient_Graph__requestAssetLocalIdentifiersByCityNameWithError___block_invoke;
  v11[3] = &unk_1E36767E0;
  v11[4] = &v18;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __87__PLPhotoAnalysisServiceClient_Graph__requestAssetLocalIdentifiersByCityNameWithError___block_invoke_2;
  v10[3] = &unk_1E3676830;
  v10[4] = &v12;
  v10[5] = &v18;
  objc_msgSend(v6, "requestAssetLocalIdentifiersByCityNameWithContext:reply:", v7, v10);

  if (a3)
    *a3 = objc_retainAutorelease((id)v19[5]);
  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

- (id)requestMeaningScoreDebugDescriptionForMomentLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__97213;
  v24 = __Block_byref_object_dispose__97214;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__97213;
  v18 = __Block_byref_object_dispose__97214;
  v7 = MEMORY[0x1E0C809B0];
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __105__PLPhotoAnalysisServiceClient_Graph__requestMeaningScoreDebugDescriptionForMomentLocalIdentifier_error___block_invoke;
  v13[3] = &unk_1E36767E0;
  v13[4] = &v20;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __105__PLPhotoAnalysisServiceClient_Graph__requestMeaningScoreDebugDescriptionForMomentLocalIdentifier_error___block_invoke_2;
  v12[3] = &unk_1E36768F8;
  v12[4] = &v14;
  v12[5] = &v20;
  objc_msgSend(v8, "requestMeaningScoreDebugDescriptionForMomentLocalIdentifier:context:reply:", v6, v9, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

- (id)requestAssetLocalIdentifiersWithinLocationRadiusOfAssetLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__97213;
  v24 = __Block_byref_object_dispose__97214;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__97213;
  v18 = __Block_byref_object_dispose__97214;
  v7 = MEMORY[0x1E0C809B0];
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __116__PLPhotoAnalysisServiceClient_Graph__requestAssetLocalIdentifiersWithinLocationRadiusOfAssetLocalIdentifier_error___block_invoke;
  v13[3] = &unk_1E36767E0;
  v13[4] = &v20;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __116__PLPhotoAnalysisServiceClient_Graph__requestAssetLocalIdentifiersWithinLocationRadiusOfAssetLocalIdentifier_error___block_invoke_2;
  v12[3] = &unk_1E3676808;
  v12[4] = &v14;
  v12[5] = &v20;
  objc_msgSend(v8, "requestAssetLocalIdentifiersWithinLocationRadiusOfAssetLocalIdentifier:context:reply:", v6, v9, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

- (id)requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__97213;
  v24 = __Block_byref_object_dispose__97214;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__97213;
  v18 = __Block_byref_object_dispose__97214;
  v7 = MEMORY[0x1E0C809B0];
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __114__PLPhotoAnalysisServiceClient_Graph__requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier_error___block_invoke;
  v13[3] = &unk_1E36767E0;
  v13[4] = &v20;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __114__PLPhotoAnalysisServiceClient_Graph__requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier_error___block_invoke_2;
  v12[3] = &unk_1E3676808;
  v12[4] = &v14;
  v12[5] = &v20;
  objc_msgSend(v8, "requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier:context:reply:", v6, v9, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

- (void)requestUpdateFeaturedContentBasedOnUserFeedbackWithPersonUUIDs:(id)a3 reply:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __108__PLPhotoAnalysisServiceClient_Graph__requestUpdateFeaturedContentBasedOnUserFeedbackWithPersonUUIDs_reply___block_invoke;
  v15[3] = &unk_1E3676858;
  v8 = v6;
  v16 = v8;
  v9 = a3;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __108__PLPhotoAnalysisServiceClient_Graph__requestUpdateFeaturedContentBasedOnUserFeedbackWithPersonUUIDs_reply___block_invoke_2;
  v13[3] = &unk_1E36768D0;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v10, "requestUpdateFeaturedContentBasedOnUserFeedbackWithPersonUUIDs:context:reply:", v9, v11, v13);

}

- (BOOL)requestGenerateDefaultRulesForLibraryScopeWithLocalIdentifier:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v8 = a3;
  v9 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__97213;
  v32 = __Block_byref_object_dispose__97214;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__97213;
  v26 = __Block_byref_object_dispose__97214;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v10 = MEMORY[0x1E0C809B0];
  v21 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __119__PLPhotoAnalysisServiceClient_Graph__requestGenerateDefaultRulesForLibraryScopeWithLocalIdentifier_withOptions_error___block_invoke;
  v17[3] = &unk_1E36767E0;
  v17[4] = &v28;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __119__PLPhotoAnalysisServiceClient_Graph__requestGenerateDefaultRulesForLibraryScopeWithLocalIdentifier_withOptions_error___block_invoke_2;
  v16[3] = &unk_1E36769C0;
  v16[4] = &v18;
  v16[5] = &v22;
  objc_msgSend(v11, "requestGenerateDefaultRulesForLibraryScopeWithLocalIdentifier:withOptions:context:reply:", v8, v9, v12, v16);

  if (a5)
  {
    v13 = (void *)v29[5];
    if (!v13)
      v13 = (void *)v23[5];
    *a5 = objc_retainAutorelease(v13);
  }
  v14 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v14;
}

- (id)requestSuggestedMomentLocalIdentifiersForPersonLocalIdentifiers:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v8 = a3;
  v9 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__97213;
  v34 = __Block_byref_object_dispose__97214;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__97213;
  v28 = __Block_byref_object_dispose__97214;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__97213;
  v22 = __Block_byref_object_dispose__97214;
  v10 = MEMORY[0x1E0C809B0];
  v23 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __121__PLPhotoAnalysisServiceClient_Graph__requestSuggestedMomentLocalIdentifiersForPersonLocalIdentifiers_withOptions_error___block_invoke;
  v17[3] = &unk_1E36767E0;
  v17[4] = &v30;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __121__PLPhotoAnalysisServiceClient_Graph__requestSuggestedMomentLocalIdentifiersForPersonLocalIdentifiers_withOptions_error___block_invoke_2;
  v16[3] = &unk_1E3676808;
  v16[4] = &v18;
  v16[5] = &v24;
  objc_msgSend(v11, "requestSuggestedMomentLocalIdentifiersForPersonLocalIdentifiers:withOptions:context:reply:", v8, v9, v12, v16);

  if (a5)
  {
    v13 = (void *)v31[5];
    if (!v13)
      v13 = (void *)v25[5];
    *a5 = objc_retainAutorelease(v13);
  }
  v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v14;
}

- (BOOL)requestStartSharedLibrarySuggestionResultWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__97213;
  v27 = __Block_byref_object_dispose__97214;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__97213;
  v21 = __Block_byref_object_dispose__97214;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v5 = MEMORY[0x1E0C809B0];
  v16 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __90__PLPhotoAnalysisServiceClient_Graph__requestStartSharedLibrarySuggestionResultWithError___block_invoke;
  v12[3] = &unk_1E36767E0;
  v12[4] = &v23;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __90__PLPhotoAnalysisServiceClient_Graph__requestStartSharedLibrarySuggestionResultWithError___block_invoke_2;
  v11[3] = &unk_1E36769C0;
  v11[4] = &v17;
  v11[5] = &v13;
  objc_msgSend(v6, "requestStartSharedLibrarySuggestionResultWithContext:reply:", v7, v11);

  if (a3)
  {
    v8 = (void *)v24[5];
    if (!v8)
      v8 = (void *)v18[5];
    *a3 = objc_retainAutorelease(v8);
  }
  v9 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v9;
}

- (id)requestCameraSmartSharingProcessingForLibraryScopeWithUUID:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v8 = a3;
  v9 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__97213;
  v34 = __Block_byref_object_dispose__97214;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__97213;
  v28 = __Block_byref_object_dispose__97214;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__97213;
  v22 = __Block_byref_object_dispose__97214;
  v10 = MEMORY[0x1E0C809B0];
  v23 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __116__PLPhotoAnalysisServiceClient_Graph__requestCameraSmartSharingProcessingForLibraryScopeWithUUID_withOptions_error___block_invoke;
  v17[3] = &unk_1E36767E0;
  v17[4] = &v30;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __116__PLPhotoAnalysisServiceClient_Graph__requestCameraSmartSharingProcessingForLibraryScopeWithUUID_withOptions_error___block_invoke_2;
  v16[3] = &unk_1E3676830;
  v16[4] = &v18;
  v16[5] = &v24;
  objc_msgSend(v11, "requestCameraSmartSharingProcessingForLibraryScopeWithUUID:withOptions:context:reply:", v8, v9, v12, v16);

  if (a5)
  {
    v13 = (void *)v31[5];
    if (!v13)
      v13 = (void *)v25[5];
    *a5 = objc_retainAutorelease(v13);
  }
  v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v14;
}

- (void)asyncRequestCameraSmartSharingProcessingForLibraryScopeWithUUID:(id)a3 withOptions:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __121__PLPhotoAnalysisServiceClient_Graph__asyncRequestCameraSmartSharingProcessingForLibraryScopeWithUUID_withOptions_reply___block_invoke;
  v18[3] = &unk_1E3676858;
  v13 = v8;
  v19 = v13;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __121__PLPhotoAnalysisServiceClient_Graph__asyncRequestCameraSmartSharingProcessingForLibraryScopeWithUUID_withOptions_reply___block_invoke_2;
  v16[3] = &unk_1E3676880;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "requestCameraSmartSharingProcessingForLibraryScopeWithUUID:withOptions:context:reply:", v10, v9, v11, v16);

}

- (void)requestReprocessSuggestionsOnLibraryScopeRulesChangeWithReply:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __101__PLPhotoAnalysisServiceClient_Graph__requestReprocessSuggestionsOnLibraryScopeRulesChangeWithReply___block_invoke;
  v12[3] = &unk_1E3676858;
  v6 = v4;
  v13 = v6;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __101__PLPhotoAnalysisServiceClient_Graph__requestReprocessSuggestionsOnLibraryScopeRulesChangeWithReply___block_invoke_2;
  v10[3] = &unk_1E36768D0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "requestReprocessSuggestionsOnLibraryScopeRulesChangeWithContext:reply:", v8, v10);

}

- (id)requestNightlySuggestionsForPosterConfiguration:(id)a3 atDate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v8 = a3;
  v9 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__97213;
  v34 = __Block_byref_object_dispose__97214;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__97213;
  v28 = __Block_byref_object_dispose__97214;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__97213;
  v22 = __Block_byref_object_dispose__97214;
  v10 = MEMORY[0x1E0C809B0];
  v23 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __100__PLPhotoAnalysisServiceClient_Graph__requestNightlySuggestionsForPosterConfiguration_atDate_error___block_invoke;
  v17[3] = &unk_1E36767E0;
  v17[4] = &v30;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __100__PLPhotoAnalysisServiceClient_Graph__requestNightlySuggestionsForPosterConfiguration_atDate_error___block_invoke_2;
  v16[3] = &unk_1E3676830;
  v16[4] = &v18;
  v16[5] = &v24;
  objc_msgSend(v11, "requestNightlySuggestionsForPosterConfiguration:atDate:context:reply:", v8, v9, v12, v16);

  if (a5)
  {
    v13 = (void *)v31[5];
    if (!v13)
      v13 = (void *)v25[5];
    *a5 = objc_retainAutorelease(v13);
  }
  v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v14;
}

- (void)reloadWallpaperSuggestions:(id)a3 reply:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__PLPhotoAnalysisServiceClient_Graph__reloadWallpaperSuggestions_reply___block_invoke;
  v15[3] = &unk_1E3676858;
  v8 = v6;
  v16 = v8;
  v9 = a3;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __72__PLPhotoAnalysisServiceClient_Graph__reloadWallpaperSuggestions_reply___block_invoke_2;
  v13[3] = &unk_1E36768D0;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v10, "reloadWallpaperSuggestionsWithSuggestionUUIDs:context:reply:", v9, v11, v13);

}

- (void)requestPeopleForWallpaperSuggestionsWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __93__PLPhotoAnalysisServiceClient_Graph__requestPeopleForWallpaperSuggestionsWithOptions_reply___block_invoke;
  v15[3] = &unk_1E3676858;
  v8 = v6;
  v16 = v8;
  v9 = a3;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __93__PLPhotoAnalysisServiceClient_Graph__requestPeopleForWallpaperSuggestionsWithOptions_reply___block_invoke_2;
  v13[3] = &unk_1E3676880;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v10, "requestPeopleForWallpaperSuggestionsWithOptions:context:reply:", v9, v11, v13);

}

- (void)requestWallpaperProperties:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __80__PLPhotoAnalysisServiceClient_Graph__requestWallpaperProperties_options_reply___block_invoke;
  v18[3] = &unk_1E3676858;
  v10 = v8;
  v19 = v10;
  v11 = a4;
  v12 = a3;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __80__PLPhotoAnalysisServiceClient_Graph__requestWallpaperProperties_options_reply___block_invoke_2;
  v16[3] = &unk_1E3676880;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v13, "requestWallpaperPropertiesForAssets:options:context:reply:", v12, v11, v14, v16);

}

- (void)exportWallpaperForAssets:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__PLPhotoAnalysisServiceClient_Graph__exportWallpaperForAssets_options_reply___block_invoke;
  v18[3] = &unk_1E3676858;
  v10 = v8;
  v19 = v10;
  v11 = a4;
  v12 = a3;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __78__PLPhotoAnalysisServiceClient_Graph__exportWallpaperForAssets_options_reply___block_invoke_2;
  v16[3] = &unk_1E36768D0;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v13, "exportWallpaperForAssets:options:context:reply:", v12, v11, v14, v16);

}

- (id)requestEnergyStatusWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__97213;
  v25 = __Block_byref_object_dispose__97214;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__97213;
  v19 = __Block_byref_object_dispose__97214;
  v5 = MEMORY[0x1E0C809B0];
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__PLPhotoAnalysisServiceClient_Graph__requestEnergyStatusWithError___block_invoke;
  v14[3] = &unk_1E36767E0;
  v14[4] = &v21;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __68__PLPhotoAnalysisServiceClient_Graph__requestEnergyStatusWithError___block_invoke_2;
  v13[3] = &unk_1E3676BE0;
  v13[4] = &v15;
  objc_msgSend(v6, "requestEnergyStatusWithContext:reply:", v7, v13);

  v8 = (void *)v22[5];
  v9 = v8;
  v10 = v9;
  if (v8 && a3)
    *a3 = objc_retainAutorelease(v9);

  v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

- (void)runPerformanceTest:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__PLPhotoAnalysisServiceClient_Graph__runPerformanceTest_options_reply___block_invoke;
  v18[3] = &unk_1E3676858;
  v10 = v8;
  v19 = v10;
  v11 = a4;
  v12 = a3;
  -[PLPhotoAnalysisServiceClient synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __72__PLPhotoAnalysisServiceClient_Graph__runPerformanceTest_options_reply___block_invoke_2;
  v16[3] = &unk_1E36768D0;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v13, "runPerformanceTest:options:context:reply:", v12, v11, v14, v16);

}

- (void)requestGraphModelResultWithOptions:(id)a3 progress:(id)a4 reply:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __89__PLPhotoAnalysisServiceClient_Graph__requestGraphModelResultWithOptions_progress_reply___block_invoke;
  v21[3] = &unk_1E3676858;
  v10 = v8;
  v22 = v10;
  v11 = a4;
  v12 = a3;
  -[PLPhotoAnalysisServiceClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisServiceClient requestContextDictionary](self, "requestContextDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "becomeCurrentWithPendingUnitCount:", 1);
  v16 = v9;
  v17 = 3221225472;
  v18 = __89__PLPhotoAnalysisServiceClient_Graph__requestGraphModelResultWithOptions_progress_reply___block_invoke_2;
  v19 = &unk_1E3676880;
  v20 = v10;
  v15 = v10;
  objc_msgSend(v13, "requestGraphModelResultWithOptions:context:reply:", v12, v14, &v16);

  objc_msgSend(v11, "resignCurrent", v16, v17, v18, v19);
}

uint64_t __89__PLPhotoAnalysisServiceClient_Graph__requestGraphModelResultWithOptions_progress_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __89__PLPhotoAnalysisServiceClient_Graph__requestGraphModelResultWithOptions_progress_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__PLPhotoAnalysisServiceClient_Graph__runPerformanceTest_options_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __72__PLPhotoAnalysisServiceClient_Graph__runPerformanceTest_options_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __68__PLPhotoAnalysisServiceClient_Graph__requestEnergyStatusWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __68__PLPhotoAnalysisServiceClient_Graph__requestEnergyStatusWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __78__PLPhotoAnalysisServiceClient_Graph__exportWallpaperForAssets_options_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __78__PLPhotoAnalysisServiceClient_Graph__exportWallpaperForAssets_options_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __80__PLPhotoAnalysisServiceClient_Graph__requestWallpaperProperties_options_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __80__PLPhotoAnalysisServiceClient_Graph__requestWallpaperProperties_options_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __93__PLPhotoAnalysisServiceClient_Graph__requestPeopleForWallpaperSuggestionsWithOptions_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __93__PLPhotoAnalysisServiceClient_Graph__requestPeopleForWallpaperSuggestionsWithOptions_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __72__PLPhotoAnalysisServiceClient_Graph__reloadWallpaperSuggestions_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __72__PLPhotoAnalysisServiceClient_Graph__reloadWallpaperSuggestions_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __100__PLPhotoAnalysisServiceClient_Graph__requestNightlySuggestionsForPosterConfiguration_atDate_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __100__PLPhotoAnalysisServiceClient_Graph__requestNightlySuggestionsForPosterConfiguration_atDate_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

uint64_t __101__PLPhotoAnalysisServiceClient_Graph__requestReprocessSuggestionsOnLibraryScopeRulesChangeWithReply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __101__PLPhotoAnalysisServiceClient_Graph__requestReprocessSuggestionsOnLibraryScopeRulesChangeWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __121__PLPhotoAnalysisServiceClient_Graph__asyncRequestCameraSmartSharingProcessingForLibraryScopeWithUUID_withOptions_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __121__PLPhotoAnalysisServiceClient_Graph__asyncRequestCameraSmartSharingProcessingForLibraryScopeWithUUID_withOptions_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __116__PLPhotoAnalysisServiceClient_Graph__requestCameraSmartSharingProcessingForLibraryScopeWithUUID_withOptions_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __116__PLPhotoAnalysisServiceClient_Graph__requestCameraSmartSharingProcessingForLibraryScopeWithUUID_withOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __90__PLPhotoAnalysisServiceClient_Graph__requestStartSharedLibrarySuggestionResultWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __90__PLPhotoAnalysisServiceClient_Graph__requestStartSharedLibrarySuggestionResultWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

void __121__PLPhotoAnalysisServiceClient_Graph__requestSuggestedMomentLocalIdentifiersForPersonLocalIdentifiers_withOptions_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __121__PLPhotoAnalysisServiceClient_Graph__requestSuggestedMomentLocalIdentifiersForPersonLocalIdentifiers_withOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __119__PLPhotoAnalysisServiceClient_Graph__requestGenerateDefaultRulesForLibraryScopeWithLocalIdentifier_withOptions_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __119__PLPhotoAnalysisServiceClient_Graph__requestGenerateDefaultRulesForLibraryScopeWithLocalIdentifier_withOptions_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

uint64_t __108__PLPhotoAnalysisServiceClient_Graph__requestUpdateFeaturedContentBasedOnUserFeedbackWithPersonUUIDs_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __108__PLPhotoAnalysisServiceClient_Graph__requestUpdateFeaturedContentBasedOnUserFeedbackWithPersonUUIDs_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __114__PLPhotoAnalysisServiceClient_Graph__requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __114__PLPhotoAnalysisServiceClient_Graph__requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __116__PLPhotoAnalysisServiceClient_Graph__requestAssetLocalIdentifiersWithinLocationRadiusOfAssetLocalIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __116__PLPhotoAnalysisServiceClient_Graph__requestAssetLocalIdentifiersWithinLocationRadiusOfAssetLocalIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __105__PLPhotoAnalysisServiceClient_Graph__requestMeaningScoreDebugDescriptionForMomentLocalIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __105__PLPhotoAnalysisServiceClient_Graph__requestMeaningScoreDebugDescriptionForMomentLocalIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __87__PLPhotoAnalysisServiceClient_Graph__requestAssetLocalIdentifiersByCityNameWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __87__PLPhotoAnalysisServiceClient_Graph__requestAssetLocalIdentifiersByCityNameWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __140__PLPhotoAnalysisServiceClient_Graph__requestConfidenceByMomentLocalIdentifierForMeaning_useAlternativeMeaningEdge_onlyHighPrecision_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __140__PLPhotoAnalysisServiceClient_Graph__requestConfidenceByMomentLocalIdentifierForMeaning_useAlternativeMeaningEdge_onlyHighPrecision_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __84__PLPhotoAnalysisServiceClient_Graph__requestUtilityAssetLocalIdentifiersWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __84__PLPhotoAnalysisServiceClient_Graph__requestUtilityAssetLocalIdentifiersWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __90__PLPhotoAnalysisServiceClient_Graph__requestTrendsByIdentifierWithCadence_forYear_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __90__PLPhotoAnalysisServiceClient_Graph__requestTrendsByIdentifierWithCadence_forYear_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __107__PLPhotoAnalysisServiceClient_Graph__requestUpNextAssetLocalIdentifiersForAssetWithLocalIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __107__PLPhotoAnalysisServiceClient_Graph__requestUpNextAssetLocalIdentifiersForAssetWithLocalIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __96__PLPhotoAnalysisServiceClient_Graph__requestKeyAssetLocalIdentifierForPrototypeCategory_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __96__PLPhotoAnalysisServiceClient_Graph__requestKeyAssetLocalIdentifierForPrototypeCategory_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __92__PLPhotoAnalysisServiceClient_Graph__requestUpNextMemoryLocalIdentifiersWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __92__PLPhotoAnalysisServiceClient_Graph__requestUpNextMemoryLocalIdentifiersWithOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __105__PLPhotoAnalysisServiceClient_Graph__requestDiscoveryFeedItemsWithOptions_generationSessionState_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __105__PLPhotoAnalysisServiceClient_Graph__requestDiscoveryFeedItemsWithOptions_generationSessionState_error___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1[4] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;
  v17 = v7;

  v12 = *(_QWORD *)(a1[5] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;
  v14 = v8;

  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v9;

}

void __85__PLPhotoAnalysisServiceClient_Graph__requestPersonalTraitsForAssetsWithUUIDs_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __85__PLPhotoAnalysisServiceClient_Graph__requestPersonalTraitsForAssetsWithUUIDs_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __89__PLPhotoAnalysisServiceClient_Graph__requestPersonalTraitsForHighlightsWithUUIDs_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __89__PLPhotoAnalysisServiceClient_Graph__requestPersonalTraitsForHighlightsWithUUIDs_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __96__PLPhotoAnalysisServiceClient_Graph__requestGraphMomentLocalIdentifiersWithDateInterval_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __96__PLPhotoAnalysisServiceClient_Graph__requestGraphMomentLocalIdentifiersWithDateInterval_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __101__PLPhotoAnalysisServiceClient_Graph__requestGraphInferencesSummaryWithMomentLocalIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __101__PLPhotoAnalysisServiceClient_Graph__requestGraphInferencesSummaryWithMomentLocalIdentifiers_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __91__PLPhotoAnalysisServiceClient_Graph__requestGraphInferencesSummaryWithDateInterval_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __91__PLPhotoAnalysisServiceClient_Graph__requestGraphInferencesSummaryWithDateInterval_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __83__PLPhotoAnalysisServiceClient_Graph__requestSuggestedMePersonIdentifierWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __83__PLPhotoAnalysisServiceClient_Graph__requestSuggestedMePersonIdentifierWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __107__PLPhotoAnalysisServiceClient_Graph__requestComposabilityScoresOfAssetsForLocalIdentifiers_options_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __107__PLPhotoAnalysisServiceClient_Graph__requestComposabilityScoresOfAssetsForLocalIdentifiers_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __80__PLPhotoAnalysisServiceClient_Graph__requestSuggestedPersonsWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __80__PLPhotoAnalysisServiceClient_Graph__requestSuggestedPersonsWithOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __100__PLPhotoAnalysisServiceClient_Graph__requestRelationshipInferencesForPersonLocalIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __100__PLPhotoAnalysisServiceClient_Graph__requestRelationshipInferencesForPersonLocalIdentifiers_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

uint64_t __75__PLPhotoAnalysisServiceClient_Graph__requestModelInference_options_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __75__PLPhotoAnalysisServiceClient_Graph__requestModelInference_options_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __148__PLPhotoAnalysisServiceClient_Graph__requestRunShadowEvaluationWithRecipe_models_trialDeploymentID_trialExperimentID_trialTreatmentID_resultBlock___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __148__PLPhotoAnalysisServiceClient_Graph__requestRunShadowEvaluationWithRecipe_models_trialDeploymentID_trialExperimentID_trialTreatmentID_resultBlock___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __95__PLPhotoAnalysisServiceClient_Graph__requestRunPFLWithAttachments_recipeUserInfo_resultBlock___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __95__PLPhotoAnalysisServiceClient_Graph__requestRunPFLWithAttachments_recipeUserInfo_resultBlock___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1[4] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;
  v17 = v7;

  v12 = *(_QWORD *)(a1[5] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;
  v14 = v8;

  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v9;

}

void __70__PLPhotoAnalysisServiceClient_Graph__reportMetricsWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __70__PLPhotoAnalysisServiceClient_Graph__reportMetricsWithOptions_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __74__PLPhotoAnalysisServiceClient_Graph__runCurationWithItems_options_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __74__PLPhotoAnalysisServiceClient_Graph__runCurationWithItems_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __90__PLPhotoAnalysisServiceClient_Graph__requestCurationScoreByAssetUUIDForAssetUUIDs_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __90__PLPhotoAnalysisServiceClient_Graph__requestCurationScoreByAssetUUIDForAssetUUIDs_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __96__PLPhotoAnalysisServiceClient_Graph__requestGeoHashForAssetLocalIdentifiers_geoHashSize_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __96__PLPhotoAnalysisServiceClient_Graph__requestGeoHashForAssetLocalIdentifiers_geoHashSize_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __93__PLPhotoAnalysisServiceClient_Graph__requestIconicSceneScoreForAssetLocalIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __93__PLPhotoAnalysisServiceClient_Graph__requestIconicSceneScoreForAssetLocalIdentifiers_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __90__PLPhotoAnalysisServiceClient_Graph__requestTextFeaturesForMomentLocalIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __90__PLPhotoAnalysisServiceClient_Graph__requestTextFeaturesForMomentLocalIdentifiers_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __109__PLPhotoAnalysisServiceClient_Graph__requestHighlightDebugInformationForHighlightWithLocalIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __109__PLPhotoAnalysisServiceClient_Graph__requestHighlightDebugInformationForHighlightWithLocalIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __86__PLPhotoAnalysisServiceClient_Graph__requestSyndicationLibraryRevGeocodingWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __86__PLPhotoAnalysisServiceClient_Graph__requestSyndicationLibraryRevGeocodingWithError___block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

void __98__PLPhotoAnalysisServiceClient_Graph__requestAssetRevGeocodingForAssetLocalIdentifiers_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __98__PLPhotoAnalysisServiceClient_Graph__requestAssetRevGeocodingForAssetLocalIdentifiers_withError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __73__PLPhotoAnalysisServiceClient_Graph__requestAssetRevGeocodingWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __73__PLPhotoAnalysisServiceClient_Graph__requestAssetRevGeocodingWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __93__PLPhotoAnalysisServiceClient_Graph__requestHighlightCollectionEnrichmentWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __93__PLPhotoAnalysisServiceClient_Graph__requestHighlightCollectionEnrichmentWithOptions_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __74__PLPhotoAnalysisServiceClient_Graph__requestEnrichmentWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __74__PLPhotoAnalysisServiceClient_Graph__requestEnrichmentWithOptions_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __83__PLPhotoAnalysisServiceClient_Graph__requestHighlightEnrichmentWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __83__PLPhotoAnalysisServiceClient_Graph__requestHighlightEnrichmentWithOptions_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __92__PLPhotoAnalysisServiceClient_Graph__requestSuggestedContributionsForAssetsMetadata_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __92__PLPhotoAnalysisServiceClient_Graph__requestSuggestedContributionsForAssetsMetadata_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __109__PLPhotoAnalysisServiceClient_Graph__requestBatchSuggestedRecipientsForMomentUUIDByAssetUUID_options_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __109__PLPhotoAnalysisServiceClient_Graph__requestBatchSuggestedRecipientsForMomentUUIDByAssetUUID_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __127__PLPhotoAnalysisServiceClient_Graph__requestSuggestedRecipientsForAssetLocalIdentifiers_momentLocalIdentifiers_options_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __127__PLPhotoAnalysisServiceClient_Graph__requestSuggestedRecipientsForAssetLocalIdentifiers_momentLocalIdentifiers_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __108__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForPeopleCurationResultsWithGraphOptions_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __108__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForPeopleCurationResultsWithGraphOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __101__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedResultsWithGraphOptions_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __101__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedResultsWithGraphOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __105__PLPhotoAnalysisServiceClient_Graph__requestTitleForPersonLocalIdentifiers_format_title_subtitle_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __105__PLPhotoAnalysisServiceClient_Graph__requestTitleForPersonLocalIdentifiers_format_title_subtitle_error___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  uint64_t v10;
  id *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v8 = a3;
  v9 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  v10 = *(_QWORD *)(a1[6] + 8);
  v12 = *(_QWORD *)(v10 + 40);
  v11 = (id *)(v10 + 40);
  if (!v12)
    objc_storeStrong(v11, a4);

}

void __117__PLPhotoAnalysisServiceClient_Graph__requestTitleForAssetCollectionWithLocalIdentifier_format_title_subtitle_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __117__PLPhotoAnalysisServiceClient_Graph__requestTitleForAssetCollectionWithLocalIdentifier_format_title_subtitle_error___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  uint64_t v10;
  id *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v8 = a3;
  v9 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  v10 = *(_QWORD *)(a1[6] + 8);
  v12 = *(_QWORD *)(v10 + 40);
  v11 = (id *)(v10 + 40);
  if (!v12)
    objc_storeStrong(v11, a4);

}

void __122__PLPhotoAnalysisServiceClient_Graph__requestTitleForCollectionMomentListWithLocalIdentifier_format_title_subtitle_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __122__PLPhotoAnalysisServiceClient_Graph__requestTitleForCollectionMomentListWithLocalIdentifier_format_title_subtitle_error___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  uint64_t v10;
  id *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v8 = a3;
  v9 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  v10 = *(_QWORD *)(a1[6] + 8);
  v12 = *(_QWORD *)(v10 + 40);
  v11 = (id *)(v10 + 40);
  if (!v12)
    objc_storeStrong(v11, a4);

}

void __81__PLPhotoAnalysisServiceClient_Graph__requestSetDefaultsObject_forKey_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __81__PLPhotoAnalysisServiceClient_Graph__requestSetDefaultsObject_forKey_withError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __77__PLPhotoAnalysisServiceClient_Graph__requestDefaultsObjectForKey_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __77__PLPhotoAnalysisServiceClient_Graph__requestDefaultsObjectForKey_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __197__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedDebugInfoBetweenMomentForLocalIdentifier_andRelatedResultsForLocalIdentifiers_relatedType_additionalSnapshotSummaryInfo_reply___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __197__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedDebugInfoBetweenMomentForLocalIdentifier_andRelatedResultsForLocalIdentifiers_relatedType_additionalSnapshotSummaryInfo_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __166__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedDebugInfoBetweenAssetForLocalIdentifier_andRelatedResultsForLocalIdentifiers_relatedType_reply___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __166__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedDebugInfoBetweenAssetForLocalIdentifier_andRelatedResultsForLocalIdentifiers_relatedType_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __102__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedWithAssetLocalIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __102__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedWithAssetLocalIdentifier_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __103__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedWithMomentLocalIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __103__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedWithMomentLocalIdentifier_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __73__PLPhotoAnalysisServiceClient_Graph__requestInvalidatePersistentCaches___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __73__PLPhotoAnalysisServiceClient_Graph__requestInvalidatePersistentCaches___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __72__PLPhotoAnalysisServiceClient_Graph__requestInvalidateTransientCaches___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __72__PLPhotoAnalysisServiceClient_Graph__requestInvalidateTransientCaches___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __85__PLPhotoAnalysisServiceClient_Graph__requestGraphRebuildFractionCompletedWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__PLPhotoAnalysisServiceClient_Graph__requestGraphRebuildFractionCompletedWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__PLPhotoAnalysisServiceClient_Graph__requestGraphPerformQuery_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __70__PLPhotoAnalysisServiceClient_Graph__requestGraphPerformQuery_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __58__PLPhotoAnalysisServiceClient_Graph__requestGraphStatus___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __58__PLPhotoAnalysisServiceClient_Graph__requestGraphStatus___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

uint64_t __74__PLPhotoAnalysisServiceClient_Graph__requestHighlightEstimatesWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__PLPhotoAnalysisServiceClient_Graph__requestHighlightEstimatesWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__PLPhotoAnalysisServiceClient_Graph__requestGraphStatisticsWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __79__PLPhotoAnalysisServiceClient_Graph__requestGraphStatisticsWithOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __74__PLPhotoAnalysisServiceClient_Graph__requestExportGraphForPurpose_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __74__PLPhotoAnalysisServiceClient_Graph__requestExportGraphForPurpose_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __79__PLPhotoAnalysisServiceClient_Graph__requestSuggestionInfosWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __79__PLPhotoAnalysisServiceClient_Graph__requestSuggestionInfosWithOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __92__PLPhotoAnalysisServiceClient_Graph__requestAvailableSuggestionTypeInfosWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __92__PLPhotoAnalysisServiceClient_Graph__requestAvailableSuggestionTypeInfosWithOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __109__PLPhotoAnalysisServiceClient_Graph__requestCurationOfLength_forMemoryForLocalIdentifier_withOptions_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __109__PLPhotoAnalysisServiceClient_Graph__requestCurationOfLength_forMemoryForLocalIdentifier_withOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __103__PLPhotoAnalysisServiceClient_Graph__requestMemoryDebugInformationForMemoryWithLocalIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __103__PLPhotoAnalysisServiceClient_Graph__requestMemoryDebugInformationForMemoryWithLocalIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __103__PLPhotoAnalysisServiceClient_Graph__requestSummaryCurationForHighlightLocalIdentifier_options_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __103__PLPhotoAnalysisServiceClient_Graph__requestSummaryCurationForHighlightLocalIdentifier_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __122__PLPhotoAnalysisServiceClient_Graph__requestCurationDebugInformationForAssetCollectionWithLocalIdentifier_options_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __122__PLPhotoAnalysisServiceClient_Graph__requestCurationDebugInformationForAssetCollectionWithLocalIdentifier_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __126__PLPhotoAnalysisServiceClient_Graph__requestSharingMessageSuggestionDebugInformationForAssetCollectionLocalIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __126__PLPhotoAnalysisServiceClient_Graph__requestSharingMessageSuggestionDebugInformationForAssetCollectionLocalIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __119__PLPhotoAnalysisServiceClient_Graph__requestSharingSuggestionDebugInformationForAssetCollectionLocalIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __119__PLPhotoAnalysisServiceClient_Graph__requestSharingSuggestionDebugInformationForAssetCollectionLocalIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __79__PLPhotoAnalysisServiceClient_Graph__requestUtilityAssetInformationWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __79__PLPhotoAnalysisServiceClient_Graph__requestUtilityAssetInformationWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __100__PLPhotoAnalysisServiceClient_Graph__requestCurationDebugInformationForAssetLocalIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __100__PLPhotoAnalysisServiceClient_Graph__requestCurationDebugInformationForAssetLocalIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __189__PLPhotoAnalysisServiceClient_Graph__requestRelatedDebugInformationBetweenReferenceAssetCollectionForLocalIdentifier_andRelatedAssetCollectionForLocalIdentifier_options_relatedType_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __189__PLPhotoAnalysisServiceClient_Graph__requestRelatedDebugInformationBetweenReferenceAssetCollectionForLocalIdentifier_andRelatedAssetCollectionForLocalIdentifier_options_relatedType_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __170__PLPhotoAnalysisServiceClient_Graph__requestRelatedDebugInformationBetweenAssetForLocalIdentifier_andRelatedAssetCollectionForLocalIdentifier_options_relatedType_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __170__PLPhotoAnalysisServiceClient_Graph__requestRelatedDebugInformationBetweenAssetForLocalIdentifier_andRelatedAssetCollectionForLocalIdentifier_options_relatedType_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

uint64_t __77__PLPhotoAnalysisServiceClient_Graph__requestOnDemandTasksWithOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__PLPhotoAnalysisServiceClient_Graph__requestOnDemandTasksWithOptions_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__PLPhotoAnalysisServiceClient_Graph__notifyWhenGraphReadyWithCoalescingIdentifier_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__PLPhotoAnalysisServiceClient_Graph__notifyWhenGraphReadyWithCoalescingIdentifier_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__PLPhotoAnalysisServiceClient_Graph__requestSignalModelInfosWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __72__PLPhotoAnalysisServiceClient_Graph__requestSignalModelInfosWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __88__PLPhotoAnalysisServiceClient_Graph__requestAssetsForPersonLocalIdentifiers_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __88__PLPhotoAnalysisServiceClient_Graph__requestAssetsForPersonLocalIdentifiers_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __96__PLPhotoAnalysisServiceClient_Graph__requestRelatedMomentsForPersonLocalIdentifiers_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __96__PLPhotoAnalysisServiceClient_Graph__requestRelatedMomentsForPersonLocalIdentifiers_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __102__PLPhotoAnalysisServiceClient_Graph__requestSocialGroupsOverlappingMemberLocalIdentifiers_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __102__PLPhotoAnalysisServiceClient_Graph__requestSocialGroupsOverlappingMemberLocalIdentifiers_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __104__PLPhotoAnalysisServiceClient_Graph__requestAllSocialGroupsForMemberLocalIdentifier_withOptions_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __104__PLPhotoAnalysisServiceClient_Graph__requestAllSocialGroupsForMemberLocalIdentifier_withOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __92__PLPhotoAnalysisServiceClient_Graph__requestSortedArrayOfPersonLocalIdentifiers_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __92__PLPhotoAnalysisServiceClient_Graph__requestSortedArrayOfPersonLocalIdentifiers_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

uint64_t __81__PLPhotoAnalysisServiceClient_Graph__requestRecentlyUsedSongsWithOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81__PLPhotoAnalysisServiceClient_Graph__requestFlexMusicCurationWithOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__PLPhotoAnalysisServiceClient_Graph__requestMusicCurationWithOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __79__PLPhotoAnalysisServiceClient_Graph__requestCacheSongSourceWithOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __98__PLPhotoAnalysisServiceClient_Graph__requestMusicCatalogAdamIDsForPurchasedSongID_options_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __79__PLPhotoAnalysisServiceClient_Graph__requestClearMusicCacheWithOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __79__PLPhotoAnalysisServiceClient_Graph__requestClearMusicCacheWithOptions_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __123__PLPhotoAnalysisServiceClient_Graph__requestFlexMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __100__PLPhotoAnalysisServiceClient_Graph__requestFlexMusicCurationDebugInformationForSongWithUID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __119__PLPhotoAnalysisServiceClient_Graph__requestMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __99__PLPhotoAnalysisServiceClient_Graph__requestMusicCurationDebugInformationForSongWithAdamID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __84__PLPhotoAnalysisServiceClient_Graph__requestPrecachingOfAudioDataForAdamIDs_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__PLPhotoAnalysisServiceClient_Graph__requestMusicCacheStatusWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__PLPhotoAnalysisServiceClient_Graph__requestSongsForAdamIDs_options_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __102__PLPhotoAnalysisServiceClient_Graph__requestFlexMusicCurationForAssetLocalIdentifiers_options_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __111__PLPhotoAnalysisServiceClient_Graph__requestFlexMusicCurationForAssetCollectionLocalIdentifier_options_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __98__PLPhotoAnalysisServiceClient_Graph__requestMusicCurationForAssetLocalIdentifiers_options_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __107__PLPhotoAnalysisServiceClient_Graph__requestMusicCurationForAssetCollectionLocalIdentifier_options_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88__PLPhotoAnalysisServiceClient_Graph__requestExternalAssetRelevanceProcessingWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88__PLPhotoAnalysisServiceClient_Graph__requestExternalAssetRelevanceProcessingWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__PLPhotoAnalysisServiceClient_Graph__requestSyndicationProcessingWithOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__PLPhotoAnalysisServiceClient_Graph__requestSyndicationProcessingWithOptions_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81__PLPhotoAnalysisServiceClient_Graph__requestGenerateQuestionsWithOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81__PLPhotoAnalysisServiceClient_Graph__requestGenerateQuestionsWithOptions_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__PLPhotoAnalysisServiceClient_Graph__generateSuggestionsWithOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__PLPhotoAnalysisServiceClient_Graph__generateSuggestionsWithOptions_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__PLPhotoAnalysisServiceClient_Graph__simulateMemoriesNotificationWithOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__PLPhotoAnalysisServiceClient_Graph__simulateMemoriesNotificationWithOptions_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__PLPhotoAnalysisServiceClient_Graph__generateMemoriesWithOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__PLPhotoAnalysisServiceClient_Graph__generateMemoriesWithOptions_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __118__PLPhotoAnalysisServiceClient_Graph__requestRepresentativeAssetsForAssetCollectionWithLocalIdentifier_options_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __118__PLPhotoAnalysisServiceClient_Graph__requestRepresentativeAssetsForAssetCollectionWithLocalIdentifier_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __120__PLPhotoAnalysisServiceClient_Graph__requestCuratedAssetsForAssetCollectionWithLocalIdentifier_duration_options_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __120__PLPhotoAnalysisServiceClient_Graph__requestCuratedAssetsForAssetCollectionWithLocalIdentifier_duration_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __140__PLPhotoAnalysisServiceClient_Graph__requestCuratedAssetForAssetCollectionWithLocalIdentifier_referenceAssetLocalIdentifier_options_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __140__PLPhotoAnalysisServiceClient_Graph__requestCuratedAssetForAssetCollectionWithLocalIdentifier_referenceAssetLocalIdentifier_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __108__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToPersonLocalIdentifiers_options_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __108__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToPersonLocalIdentifiers_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __120__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier_options_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __120__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __111__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToMomentWithLocalIdentifier_options_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __111__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToMomentWithLocalIdentifier_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __110__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToAssetWithLocalIdentifier_options_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __110__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToAssetWithLocalIdentifier_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

@end
