@implementation PXAddUnverifiedPeopleActionPerformer

- (PXAddUnverifiedPeopleActionPerformer)initWithPresentationEnvironment:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  PXAddUnverifiedPeopleActionPerformer *v8;
  PXAddUnverifiedPeopleActionPerformer *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXAddUnverifiedPeopleActionPerformer;
  v8 = -[PXActionPerformer initWithActionType:](&v11, sel_initWithActionType_, CFSTR("PXActionAddUnverifiedPeople"));
  v9 = v8;
  if (v8)
  {
    -[PXActionPerformer setPresentationEnvironment:](v8, "setPresentationEnvironment:", v6);
    -[PXAddUnverifiedPeopleActionPerformer setPhotoLibrary:](v9, "setPhotoLibrary:", v7);
  }

  return v9;
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PXAddUnverifiedPeopleActionPerformer photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPeopleSwiftUtilities fetchAddPeopleCandidatesIn:](PXPeopleSwiftUtilities, "fetchAddPeopleCandidatesIn:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PXMap();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.addPeople.openedPicker"), MEMORY[0x1E0C9AA70]);
    PLPeopleGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v19 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "PXAddUnverifiedPeopleActionPerformer: %lu unverified people available to add.", buf, 0xCu);
    }

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD21E8]), "initWithIdentifiers:", v5);
    buf[0] = 0;
    v17 = 0;
    v8 = v4;
    +[PXPeopleUtilities people:hasHumans:hasPets:](PXPeopleUtilities, "people:hasHumans:hasPets:", v8, buf, &v17);
    PXLocalizedStringForPeople(v8, CFSTR("PXPeopleUnverifiedPickerTitle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setPurpose:", v9);
    objc_msgSend(v7, "setAllowsEditingCollection:", 0);
    v10 = objc_alloc(MEMORY[0x1E0CD2168]);
    -[PXAddUnverifiedPeopleActionPerformer photoLibrary](self, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithPhotoLibrary:", v11);

    objc_msgSend(v12, "setSelectionLimit:", 0);
    v13 = 3;
    if (buf[0])
      v13 = 4;
    if (v17)
      v14 = v13;
    else
      v14 = 1;
    objc_msgSend(v12, "_setSourceType:", v14);
    objc_msgSend(v12, "_setPeopleConfiguration:", v7);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2180]), "initWithConfiguration:", v12);
    objc_msgSend(v15, "setDelegate:", self);
    -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "presentViewController:animated:completionHandler:", v15, 1, &__block_literal_global_156_228607);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("There are no people to show in the People Picker"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v7);
  }

}

- (void)_createPersonWithPickerResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  PXAddUnverifiedPeopleActionPerformer *v22;
  id v23;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  uint8_t v31[128];
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v22 = self;
    -[PXAddUnverifiedPeopleActionPerformer photoLibrary](self, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "librarySpecificFetchOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIncludedDetectionTypes:", v7);

    v23 = v4;
    PXMap();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.addPeople.addedPeople"), MEMORY[0x1E0C9AA70]);
    PLPeopleGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v33 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "PXAddUnverifiedPeopleActionPerformer: %lu people selected to add.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithLocalIdentifiers:options:", v8, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __71__PXAddUnverifiedPeopleActionPerformer__createPersonWithPickerResults___block_invoke_163;
    v29[3] = &unk_1E5149198;
    v13 = v10;
    v30 = v13;
    objc_msgSend(v12, "performChanges:completionHandler:", v29, &__block_literal_global_166_228587);

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          +[PXPeopleBootstrapContext contextWithPerson:type:](PXPeopleBootstrapContext, "contextWithPerson:type:", v19, 2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __71__PXAddUnverifiedPeopleActionPerformer__createPersonWithPickerResults___block_invoke_169;
          v24[3] = &unk_1E5148B78;
          v24[4] = v19;
          +[PXPeopleBootstrap performBootstrapWithSourcePerson:context:synchronous:completion:](PXPeopleBootstrap, "performBootstrapWithSourcePerson:context:synchronous:completion:", v19, v20, 0, v24);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v16);
    }

    objc_msgSend(v14, "fetchedObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAddUnverifiedPeopleActionPerformer setSelectedPeopleToAdd:](v22, "setSelectedPeopleToAdd:", v21);

    v4 = v23;
  }

}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_initWeak(&location, self);
  -[PXAddUnverifiedPeopleActionPerformer _createPersonWithPickerResults:](self, "_createPersonWithPickerResults:", v7);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__PXAddUnverifiedPeopleActionPerformer_picker_didFinishPicking___block_invoke;
  v9[3] = &unk_1E5149198;
  v9[4] = self;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v9);
  objc_destroyWeak(&location);

}

- (NSArray)selectedPeopleToAdd
{
  return self->_selectedPeopleToAdd;
}

- (void)setSelectedPeopleToAdd:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPeopleToAdd, a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_selectedPeopleToAdd, 0);
}

uint64_t __64__PXAddUnverifiedPeopleActionPerformer_picker_didFinishPicking___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

void __71__PXAddUnverifiedPeopleActionPerformer__createPersonWithPickerResults___block_invoke_163(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5), (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setManualOrder:verified:", +[PXPeopleUtilities manualOrderForInsertingAtEndOfSectionWithType:](PXPeopleUtilities, "manualOrderForInsertingAtEndOfSectionWithType:", 0), 1);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __71__PXAddUnverifiedPeopleActionPerformer__createPersonWithPickerResults___block_invoke_169(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PLPeopleGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v6;
      v7 = "PXAddUnverifiedPeopleActionPerformer: Added person: %@";
      v8 = v5;
      v9 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v8, v9, v7, (uint8_t *)&v10, 0xCu);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v6;
    v7 = "PXAddUnverifiedPeopleActionPerformer: Failed to add person: %@";
    v8 = v5;
    v9 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

}

void __71__PXAddUnverifiedPeopleActionPerformer__createPersonWithPickerResults___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLPeopleGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      v7 = "PXAddUnverifiedPeopleActionPerformer: Reset Sort Order for people succeeded";
      v8 = v6;
      v9 = OS_LOG_TYPE_DEFAULT;
      v10 = 2;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v11 = 138412290;
    v12 = v4;
    v7 = "PXAddUnverifiedPeopleActionPerformer: Reset Sort Order for people Failed with error: %@.";
    v8 = v6;
    v9 = OS_LOG_TYPE_ERROR;
    v10 = 12;
    goto LABEL_6;
  }

}

uint64_t __71__PXAddUnverifiedPeopleActionPerformer__createPersonWithPickerResults___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "itemIdentifier");
}

void __66__PXAddUnverifiedPeopleActionPerformer_performUserInteractionTask__block_invoke_154()
{
  NSObject *v0;
  uint8_t v1[16];

  PLUIGetLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A6789000, v0, OS_LOG_TYPE_DEFAULT, "Presented unverified people picker", v1, 2u);
  }

}

uint64_t __66__PXAddUnverifiedPeopleActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localIdentifier");
}

@end
