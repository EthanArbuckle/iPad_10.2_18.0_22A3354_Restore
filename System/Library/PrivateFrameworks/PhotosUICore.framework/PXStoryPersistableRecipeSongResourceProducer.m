@implementation PXStoryPersistableRecipeSongResourceProducer

- (PXStoryPersistableRecipeSongResourceProducer)initWithPersistableRecipe:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  PXStoryPersistableRecipeSongResourceProducer *v9;
  PXStoryPersistableRecipeSongResourceProducer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXStoryPersistableRecipeSongResourceProducer;
  v9 = -[PXStoryPersistableRecipeSongResourceProducer init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_persistableRecipe, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
  }

  return v10;
}

- (PXStoryPersistableRecipeSongResourceProducer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryPersistableRecipeSongResourceProducer.m"), 39, CFSTR("%s is not available as initializer"), "-[PXStoryPersistableRecipeSongResourceProducer init]");

  abort();
}

- (id)requestSongResourceWithOptions:(unint64_t)a3 resultHandler:(id)a4
{
  void (**v6)(id, PXStoryProducerResult *);
  PFStoryRecipe *v7;
  PFStoryRecipe *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  PXStoryProducerResult *v21;
  PXStoryProducerResult *v22;
  PXStoryNullSongResource *v23;
  PXStoryProducerResult *v24;
  _QWORD v26[4];
  id v27;
  void (**v28)(id, PXStoryProducerResult *);
  id v29[2];
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, PXStoryProducerResult *))a4;
  v7 = self->_persistableRecipe;
  v8 = v7;
  if (!v7)
    goto LABEL_8;
  -[PFStoryRecipe seedSongIdentifiersByCatalog](v7, "seedSongIdentifiersByCatalog");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {

    goto LABEL_5;
  }
  -[PFStoryRecipe currentStyleSongAsset](v8, "currentStyleSongAsset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_8:
    PLStoryGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      -[PFStoryRecipe diagnosticDescription](v8, "diagnosticDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v20;
      _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_INFO, "Persistable recipe contains no song information: %{public}@", (uint8_t *)location, 0xCu);

    }
    v21 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", 0);
    v6[2](v6, v21);

    goto LABEL_13;
  }
LABEL_5:
  -[PFStoryRecipe currentStyle](self->_persistableRecipe, "currentStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "songAssetIdentifier");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = (id)*MEMORY[0x1E0D759C8];
  if (v12 == v13)
  {

    goto LABEL_12;
  }
  v14 = v13;
  v15 = objc_msgSend(v12, "isEqualToString:", v13);

  if ((v15 & 1) != 0)
  {
LABEL_12:
    v22 = [PXStoryProducerResult alloc];
    v23 = objc_alloc_init(PXStoryNullSongResource);
    v24 = -[PXStoryProducerResult initWithObject:](v22, "initWithObject:", v23);
    v6[2](v6, v24);

LABEL_13:
    v18 = 0;
    goto LABEL_14;
  }
  objc_initWeak(location, self);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38A8]), "initWithParent:userInfo:", 0, 0);
  objc_msgSend(v16, "setTotalUnitCount:", 100);
  -[PXStoryConfiguration appleMusicStatusProvider](self->_configuration, "appleMusicStatusProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __93__PXStoryPersistableRecipeSongResourceProducer_requestSongResourceWithOptions_resultHandler___block_invoke;
  v26[3] = &unk_1E5141860;
  objc_copyWeak(v29, location);
  v18 = v16;
  v27 = v18;
  v29[1] = (id)a3;
  v28 = v6;
  objc_msgSend(v17, "requestStatusForCapability:handler:", 1, v26);

  objc_destroyWeak(v29);
  objc_destroyWeak(location);
LABEL_14:

  return v18;
}

- (void)_handleAppleMusicPlaybackStatus:(int64_t)a3 error:(id)a4 parentProgress:(id)a5 options:(unint64_t)a6 resultHandler:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, PXStoryProducerResult *);
  PFStoryRecipe *v15;
  PXStoryProducerResult *v16;
  PXStoryProducerResult *v17;
  id v18;
  PXStoryPersistableRecipeSongResourceProducer *v19;
  id v20;
  void (**v21)(id, PXStoryProducerResult *);
  unint64_t v22;
  id v23;
  id v24;
  void *v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  int64_t v33;
  _QWORD v34[4];
  void (**v35)(id, PXStoryProducerResult *);
  id v36[2];
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, PXStoryProducerResult *))a7;
  v15 = self->_persistableRecipe;
  -[PFStoryRecipe currentStyleSongAsset](v15, "currentStyleSongAsset");
  v16 = (PXStoryProducerResult *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (a3 == 1)
  {
LABEL_4:
    if (v17)
      goto LABEL_17;
    goto LABEL_10;
  }
  -[PXStoryProducerResult catalog](v16, "catalog");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v33 = a3;
  v19 = self;
  v20 = v13;
  v21 = v14;
  v22 = a6;
  v23 = v12;
  v24 = (id)*MEMORY[0x1E0D759E8];
  if (v18 == v24)
  {

    a6 = v22;
    v14 = v21;
    v13 = v20;
    self = v19;
    a3 = v33;
  }
  else
  {
    v25 = v24;
    v26 = objc_msgSend(v18, "isEqualToString:", v24);

    v12 = v23;
    a6 = v22;
    v14 = v21;
    v13 = v20;
    self = v19;
    a3 = v33;
    if (!v26)
      goto LABEL_4;
  }
  PLStoryGetLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v27, OS_LOG_TYPE_ERROR, "Found an Apple Music song persisted for the current style. However, Apple Music playback is disabled for the current user, so ignoring the persisted song.", buf, 2u);
  }

LABEL_10:
  PLStoryGetLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v28, OS_LOG_TYPE_INFO, "No playable persisted current song found. Falling back to seed songs", buf, 2u);
  }

  if (a3 == 1 && !-[PXStoryConfiguration shouldForceUsingFlexMusic](self->_configuration, "shouldForceUsingFlexMusic"))
  {
    -[PFStoryRecipe seedSongAssetForCatalog:](v15, "seedSongAssetForCatalog:", *MEMORY[0x1E0D759E8]);
    v17 = (PXStoryProducerResult *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      PLStoryGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_INFO, "Apple Music is playable, but the persisted recipe does not contain an Apple Music seed song. Ignoring any flex music seed songs to allow curation to provide an Apple Music song if possible.", buf, 2u);
      }

      goto LABEL_23;
    }
  }
  else
  {
    -[PFStoryRecipe seedSongAssetForCatalog:](v15, "seedSongAssetForCatalog:", *MEMORY[0x1E0D759F0], v33);
    v17 = (PXStoryProducerResult *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
LABEL_23:
      PLStoryGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        -[PFStoryRecipe diagnosticDescription](self->_persistableRecipe, "diagnosticDescription");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v32;
        _os_log_impl(&dword_1A6789000, v31, OS_LOG_TYPE_INFO, "No playable current style or seed song was found in persistable recipe: %{public}@", buf, 0xCu);

      }
      objc_msgSend(v13, "setCompletedUnitCount:", objc_msgSend(v13, "totalUnitCount"));
      v17 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", 0);
      v14[2](v14, v17);
      goto LABEL_26;
    }
  }
LABEL_17:
  objc_initWeak((id *)buf, self);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __123__PXStoryPersistableRecipeSongResourceProducer__handleAppleMusicPlaybackStatus_error_parentProgress_options_resultHandler___block_invoke;
  v34[3] = &unk_1E51211B8;
  objc_copyWeak(v36, (id *)buf);
  v36[1] = (id)a6;
  v35 = v14;
  +[PFStoryRecipe_PXStoryExtension requestAudioAssetFromRecipeAsset:recipe:resultHandler:](PFStoryRecipe_PXStoryExtension, "requestAudioAssetFromRecipeAsset:recipe:resultHandler:", v17, v15, v34);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    objc_msgSend(v13, "addChild:withPendingUnitCount:", v29, objc_msgSend(v13, "totalUnitCount"));

  objc_destroyWeak(v36);
  objc_destroyWeak((id *)buf);
LABEL_26:

}

- (void)_handlePersistedAudioAsset:(id)a3 isFinal:(BOOL)a4 error:(id)a5 options:(unint64_t)a6 resultHandler:(id)a7
{
  char v8;
  _BOOL4 v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (**v17)(id, void *);
  PXStoryProducerResult *v18;
  PXStoryProducerResult *v19;
  void *v20;
  uint64_t v21;
  id v22;

  v8 = a6;
  v10 = a4;
  v22 = a3;
  v11 = a5;
  v17 = (void (**)(id, void *))a7;
  if (!v22)
  {
    PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(15, v11, CFSTR("Converting persisted song asset to playable audio asset failed."), v12, v13, v14, v15, v16, v21);
    v18 = (PXStoryProducerResult *)objc_claimAutoreleasedReturnValue();
    v19 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", 0);
    -[PXStoryProducerResult error:](v19, "error:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2](v17, v20);

LABEL_7:
    goto LABEL_8;
  }
  if (v10)
  {
    v18 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v22);
    v17[2](v17, v18);
LABEL_8:

    goto LABEL_9;
  }
  if ((v8 & 6) == 0)
  {
    v18 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v22);
    -[PXStoryProducerResult flags:](v18, "flags:", 1);
    v19 = (PXStoryProducerResult *)objc_claimAutoreleasedReturnValue();
    v17[2](v17, v19);
    goto LABEL_7;
  }
LABEL_9:

}

- (unint64_t)logContext
{
  return self->logContext;
}

- (void)setLogContext:(unint64_t)a3
{
  self->logContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_persistableRecipe, 0);
}

void __123__PXStoryPersistableRecipeSongResourceProducer__handleAppleMusicPlaybackStatus_error_parentProgress_options_resultHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v7;
  id v8;
  id v9;
  id WeakRetained;

  v7 = (id *)(a1 + 40);
  v8 = a4;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "_handlePersistedAudioAsset:isFinal:error:options:resultHandler:", v9, a3, v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

void __93__PXStoryPersistableRecipeSongResourceProducer_requestSongResourceWithOptions_resultHandler___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 6);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleAppleMusicPlaybackStatus:error:parentProgress:options:resultHandler:", a2, v6, a1[4], a1[7], a1[5]);

}

@end
