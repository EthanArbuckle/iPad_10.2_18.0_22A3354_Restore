@implementation PXStoryMemoryChapterCollectionProducer

+ (id)chapterCollectionForGenerativeMemory:(id)a3 assets:(id)a4 keyAsset:(id)a5 error:(id *)a6
{
  id v9;
  void *Result_pSo0pM0_pSAySo7NSErrorCSgGSgtFZ_0;

  v9 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  Result_pSo0pM0_pSAySo7NSErrorCSgGSgtFZ_0 = (void *)_sSo38PXStoryMemoryChapterCollectionProducerC12PhotosUICoreE07chapterD0013forGenerativeB06assets8keyAsset5errorSo0acD0_pSgSo8PHMemoryC_So09PXDisplayM11FetchResult_pSo0pM0_pSAySo7NSErrorCSgGSgtFZ_0((uint64_t)v9, a4, a5, a6);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return Result_pSo0pM0_pSAySo7NSErrorCSgGSgtFZ_0;
}

- (PXStoryMemoryChapterCollectionProducer)initWithStoryQueue:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMemoryChapterCollectionProducer.m"), 37, CFSTR("%s is not available as initializer"), "-[PXStoryMemoryChapterCollectionProducer initWithStoryQueue:]");

  abort();
}

- (PXStoryMemoryChapterCollectionProducer)initWithMemory:(id)a3 storyQueue:(id)a4
{
  id v7;
  PXStoryMemoryChapterCollectionProducer *v8;
  PXStoryMemoryChapterCollectionProducer *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXStoryMemoryChapterCollectionProducer;
  v8 = -[PXStoryTransientChapterCollectionProducer initWithStoryQueue:](&v11, sel_initWithStoryQueue_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_memory, a3);

  return v9;
}

- (id)workQueue_uneditedChapterCollectionWithAssets:(id)a3 keyAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[PXStoryMemoryChapterCollectionProducer memory](self, "memory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photosGraphProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryMemoryChapterCollectionProducer memory](self, "memory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isGenerative");

  v12 = (void *)objc_opt_class();
  if (v11)
  {
    -[PXStoryMemoryChapterCollectionProducer memory](self, "memory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v14 = (id *)&v23;
    objc_msgSend(v12, "chapterCollectionForGenerativeMemory:assets:keyAsset:error:", v13, v7, v6, &v23);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("chapterTitles"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v14 = (id *)&v22;
    objc_msgSend(v12, "chapterCollectionForPhotosGraphChapters:assets:keyAsset:error:", v13, v7, v6, &v22);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v15;

  v17 = *v14;
  if (!v16)
  {
    PLStoryGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v20;
      v26 = 2112;
      v27 = v17;
      _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_ERROR, "%{public}@ malformed photosGraph chapters: %@", buf, 0x16u);

    }
  }

  return v16;
}

- (void)workQueue_saveEditTransaction:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, id);
  void *v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *v20;
  NSArray *workQueue_originalPhotosGraphChapters;
  void *v22;
  NSArray *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  NSArray *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51[2];

  v7 = a3;
  v8 = (void (**)(id, _QWORD, id))a4;
  objc_msgSend(v7, "originalChapterCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "conformsToProtocol:", &unk_1EEA18BE0) & 1) != 0)
  {
    v10 = v9;
    objc_msgSend(v7, "edits");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = 0;
    v12 = objc_msgSend(v10, "canApplyEdits:error:", v11, v51);
    v13 = v51[0];
    v14 = v13;
    if ((v12 & 1) != 0)
    {
      v43 = v13;
      v15 = objc_msgSend(v10, "copyByApplyingEdits:", v11);
      v16 = (void *)v15;
      if (!self->_workQueue_originalPhotosGraphChapters)
      {
        v39 = v10;
        v41 = (void *)v15;
        -[PXStoryMemoryChapterCollectionProducer memory](self, "memory");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "photosGraphProperties");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("chapterTitles"));
        v19 = objc_claimAutoreleasedReturnValue();

        v20 = (NSArray *)v19;
        if (v19)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (objc_class *)objc_opt_class();
            NSStringFromClass(v35);
            v38 = v20;
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray px_descriptionForAssertionMessage](v38, "px_descriptionForAssertionMessage");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMemoryChapterCollectionProducer.m"), 155, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.memory.photosGraphProperties[PHMemoryPhotosGraphPropertiesChapterTitlesKey]"), v36, v37);

            v20 = v38;
          }
        }
        workQueue_originalPhotosGraphChapters = self->_workQueue_originalPhotosGraphChapters;
        self->_workQueue_originalPhotosGraphChapters = v20;

        v10 = v39;
        v16 = v41;
      }
      v22 = (void *)objc_opt_class();
      v23 = self->_workQueue_originalPhotosGraphChapters;
      v50 = 0;
      objc_msgSend(v22, "photosGraphChaptersForChapterCollection:originalPhotosGraphChapters:error:", v16, v23, &v50);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v50;
      v26 = v25;
      if (v24)
      {
        v42 = v25;
        -[PXStoryMemoryChapterCollectionProducer memory](self, "memory");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __90__PXStoryMemoryChapterCollectionProducer_workQueue_saveEditTransaction_completionHandler___block_invoke;
        v48[3] = &unk_1E5124E40;
        v49 = v24;
        v47 = 0;
        objc_msgSend(v27, "px_photosGraphDataByMutatingPropertiesUsingBlock:error:", v48, &v47);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v47;
        if (v28)
        {
          objc_msgSend(v27, "photoLibrary");
          v40 = v24;
          v30 = v11;
          v31 = v29;
          v32 = v16;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __90__PXStoryMemoryChapterCollectionProducer_workQueue_saveEditTransaction_completionHandler___block_invoke_2;
          v44[3] = &unk_1E5148D08;
          v45 = v27;
          v46 = v28;
          objc_msgSend(v33, "performChanges:completionHandler:", v44, v8);

          v16 = v32;
          v29 = v31;
          v11 = v30;
          v24 = v40;

        }
        else
        {
          v8[2](v8, 0, v29);
        }

        v26 = v42;
        v14 = v43;
      }
      else
      {
        v8[2](v8, 0, v25);
        v14 = v43;
      }

    }
    else
    {
      v8[2](v8, 0, v13);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PXStoryChapterErrorDomain"), 3, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v10);
  }

}

- (PHMemory)memory
{
  return self->_memory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memory, 0);
  objc_storeStrong((id *)&self->_workQueue_originalPhotosGraphChapters, 0);
}

uint64_t __90__PXStoryMemoryChapterCollectionProducer_workQueue_saveEditTransaction_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("chapterTitles"));
}

void __90__PXStoryMemoryChapterCollectionProducer_workQueue_saveEditTransaction_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD1640], "changeRequestForMemory:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPhotosGraphData:", *(_QWORD *)(a1 + 40));

}

+ (id)chapterCollectionForPhotosGraphChapters:(id)a3 assets:(id)a4 keyAsset:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PXStoryTimeBasedChapterCollection *v15;
  PXStoryTimeBasedChapterCollection *v16;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  SEL v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = v11;
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "px_descriptionForAssertionMessage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXStoryMemoryChapterCollectionProducer.m"), 52, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("photosGraphChapters"), v20, v21);

    }
  }

  v15 = [PXStoryTimeBasedChapterCollection alloc];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __104__PXStoryMemoryChapterCollectionProducer_chapterCollectionForPhotosGraphChapters_assets_keyAsset_error___block_invoke;
  v22[3] = &unk_1E5116700;
  v23 = v14;
  v24 = a2;
  v25 = a1;
  v16 = -[PXStoryTimeBasedChapterCollection initWithAssets:keyAsset:configuration:](v15, "initWithAssets:keyAsset:configuration:", v12, v13, v22);

  if (a6)
    *a6 = objc_retainAutorelease(0);

  return v16;
}

+ (id)photosGraphChaptersForChapterCollection:(id)a3 originalPhotosGraphChapters:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  SEL v22;
  id v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __116__PXStoryMemoryChapterCollectionProducer_photosGraphChaptersForChapterCollection_originalPhotosGraphChapters_error___block_invoke;
    v19[3] = &unk_1E5116728;
    v20 = v10;
    v22 = a2;
    v23 = a1;
    v12 = v11;
    v21 = v12;
    objc_msgSend(v9, "enumerateChaptersUsingBlock:", v19);

    v13 = 0;
    if (!a5)
      goto LABEL_6;
    goto LABEL_5;
  }
  v14 = (void *)MEMORY[0x1E0CB35C8];
  v24 = *MEMORY[0x1E0CB2938];
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't serialize %@ into dictionary"), v9);
  v25[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("PXStoryChapterErrorDomain"), 4, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  if (a5)
LABEL_5:
    *a5 = objc_retainAutorelease(v13);
LABEL_6:
  v17 = (void *)objc_msgSend(v12, "copy");

  return v17;
}

void __116__PXStoryMemoryChapterCollectionProducer_photosGraphChaptersForChapterCollection_originalPhotosGraphChapters_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v24 = a2;
  v25 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v9);
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("startDate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v25, "startDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToDate:", v12);

        if ((v13 & 1) != 0)
          break;
      }

      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v14 = (id)objc_msgSend(v10, "mutableCopy");

    if (v14)
      goto LABEL_13;
  }
  else
  {
LABEL_10:

  }
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
LABEL_13:
  objc_msgSend(v24, "localizedTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("title"));

  objc_msgSend(v24, "localizedSubtitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (v17)
  {
    PXAssertGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v24, "localizedSubtitle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v23;
      _os_log_error_impl(&dword_1A6789000, v18, OS_LOG_TYPE_ERROR, "ignoring chapter subtitle %@", buf, 0xCu);

    }
  }
  objc_msgSend(v25, "startDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, CFSTR("startDate"));

  objc_msgSend(v25, "endDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, CFSTR("endDate"));

  v21 = *(void **)(a1 + 40);
  v22 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v21, "addObject:", v22);

}

void __104__PXStoryMemoryChapterCollectionProducer_chapterCollectionForPhotosGraphChapters_assets_keyAsset_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  objc_class *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  void *v24;
  uint64_t v25;
  objc_class *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  objc_class *v30;
  uint64_t v31;
  objc_class *v32;
  uint64_t v33;
  objc_class *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[4];
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setUsesAssetLocalCreationDates:", 1);
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v56 = a1;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v60;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v60 != v7)
          objc_enumerationMutation(v4);
        v9 = *(id *)(*((_QWORD *)&v59 + 1) + 8 * v8);
        if (v9)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            goto LABEL_8;
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = *(_QWORD *)(v56 + 48);
          v54 = *(_QWORD *)(v56 + 40);
          v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "px_descriptionForAssertionMessage");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", v54, v46, CFSTR("PXStoryMemoryChapterCollectionProducer.m"), 56, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("graphChapter"), v18, v29);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = *(_QWORD *)(v56 + 40);
          v50 = *(_QWORD *)(v56 + 48);
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", v16, v50, CFSTR("PXStoryMemoryChapterCollectionProducer.m"), 56, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("graphChapter"), v18);
        }

LABEL_8:
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("title"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            goto LABEL_10;
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = *(_QWORD *)(v56 + 48);
          v55 = *(_QWORD *)(v56 + 40);
          v30 = (objc_class *)objc_opt_class();
          NSStringFromClass(v30);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "px_descriptionForAssertionMessage");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", v55, v47, CFSTR("PXStoryMemoryChapterCollectionProducer.m"), 57, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("graphChapter[PHMemoryPhotosGraphPropertiesChapterTitlesTitleKey]"), v21, v40);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = *(_QWORD *)(v56 + 48);
          v51 = *(_QWORD *)(v56 + 40);
          v20 = (objc_class *)objc_opt_class();
          NSStringFromClass(v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", v51, v43, CFSTR("PXStoryMemoryChapterCollectionProducer.m"), 57, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("graphChapter[PHMemoryPhotosGraphPropertiesChapterTitlesTitleKey]"), v21);
        }

LABEL_10:
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("startDate"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            goto LABEL_12;
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v31 = objc_claimAutoreleasedReturnValue();
          v48 = *(_QWORD *)(v56 + 40);
          v52 = (void *)v31;
          v41 = *(_QWORD *)(v56 + 48);
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "px_descriptionForAssertionMessage");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", v48, v41, CFSTR("PXStoryMemoryChapterCollectionProducer.m"), 58, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("graphChapter[PHMemoryPhotosGraphPropertiesChapterTitlesStartDateKey]"), v24, v36);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v22 = objc_claimAutoreleasedReturnValue();
          v44 = *(_QWORD *)(v56 + 40);
          v52 = (void *)v22;
          v38 = *(_QWORD *)(v56 + 48);
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", v44, v38, CFSTR("PXStoryMemoryChapterCollectionProducer.m"), 58, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("graphChapter[PHMemoryPhotosGraphPropertiesChapterTitlesStartDateKey]"), v24);
        }

LABEL_12:
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("endDate"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            goto LABEL_14;
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v33 = objc_claimAutoreleasedReturnValue();
          v49 = *(_QWORD *)(v56 + 40);
          v53 = (void *)v33;
          v42 = *(_QWORD *)(v56 + 48);
          v34 = (objc_class *)objc_opt_class();
          NSStringFromClass(v34);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "px_descriptionForAssertionMessage");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", v49, v42, CFSTR("PXStoryMemoryChapterCollectionProducer.m"), 59, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("graphChapter[PHMemoryPhotosGraphPropertiesChapterTitlesEndDateKey]"), v27, v37);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v25 = objc_claimAutoreleasedReturnValue();
          v45 = *(_QWORD *)(v56 + 40);
          v53 = (void *)v25;
          v39 = *(_QWORD *)(v56 + 48);
          v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", v45, v39, CFSTR("PXStoryMemoryChapterCollectionProducer.m"), 59, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("graphChapter[PHMemoryPhotosGraphPropertiesChapterTitlesEndDateKey]"), v27);
        }

LABEL_14:
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v11, v12);
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __104__PXStoryMemoryChapterCollectionProducer_chapterCollectionForPhotosGraphChapters_assets_keyAsset_error___block_invoke_2;
        v57[3] = &unk_1E5121490;
        v58 = v10;
        v14 = v10;
        objc_msgSend(v3, "addChapterWithDateInterval:configuration:", v13, v57);

        ++v8;
      }
      while (v6 != v8);
      v35 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      v6 = v35;
    }
    while (v35);
  }

}

uint64_t __104__PXStoryMemoryChapterCollectionProducer_chapterCollectionForPhotosGraphChapters_assets_keyAsset_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLocalizedTitle:", *(_QWORD *)(a1 + 32));
}

@end
