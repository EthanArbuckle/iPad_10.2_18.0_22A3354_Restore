@implementation SearchUIBonusSPIAppTopHitAsyncSectionLoader

+ (BOOL)supportsSectionModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___SearchUIBonusSPIAppTopHitAsyncSectionLoader;
  if (objc_msgSendSuper2(&v12, sel_supportsSectionModel_, v4))
  {
    v5 = (void *)MEMORY[0x1E0DA9CB8];
    objc_msgSend(v4, "rowModels");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifyingResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resultBundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "supportsBonusSPI:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)fetchCardSectionsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  -[SearchUIAsyncSectionLoader delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "deviceIsAuthenticated");

  if ((v6 & 1) != 0
    && (-[SearchUIAppTopHitAsyncSectionLoader bundleIdentifier](self, "bundleIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = WFTopHitContextualActionTypeForBundleIdentifier(),
        v7,
        v8))
  {
    v9 = (void *)MEMORY[0x1E0DC7E00];
    v10 = objc_msgSend((id)objc_opt_class(), "maxNumOfTopHitEntities");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __86__SearchUIBonusSPIAppTopHitAsyncSectionLoader_fetchCardSectionsWithCompletionHandler___block_invoke;
    v12[3] = &unk_1EA1F89D0;
    v12[4] = self;
    v13 = v4;
    objc_msgSend(v9, "getTopHitContextualActionsForType:limit:completion:", v8, v10, v12);

  }
  else
  {
    -[SearchUIAppTopHitAsyncSectionLoader responseForCardSections:animated:](self, "responseForCardSections:animated:", MEMORY[0x1E0C9AA60], 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v11);

  }
}

void __86__SearchUIBonusSPIAppTopHitAsyncSectionLoader_fetchCardSectionsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  __objc2_class **v12;
  void *v13;
  __objc2_class *v14;
  void *v15;
  void *v16;
  __objc2_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint8_t v50[4];
  _DWORD v51[7];

  *(_QWORD *)&v51[5] = *MEMORY[0x1E0C80C00];
  v49 = a2;
  v5 = a3;
  if (!v5 && v49 && objc_msgSend(v49, "count"))
  {
    v40 = (void *)objc_opt_new();
    v8 = objc_msgSend(v49, "count");
    v9 = objc_msgSend((id)objc_opt_class(), "maxNumOfTopHitEntities");
    if (v8 >= v9)
      v10 = v9;
    else
      v10 = v8;
    if (v10)
    {
      v11 = 0;
      v12 = off_1EA1F5000;
      do
      {
        objc_msgSend(v49, "objectAtIndexedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v12[16];
        objc_msgSend(v13, "icon");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[__objc2_class imageFromContexualActionIcon:](v14, "imageFromContexualActionIcon:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = v12[16];
        objc_msgSend(v13, "accessoryIcon");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[__objc2_class imageFromContexualActionIcon:](v17, "imageFromContexualActionIcon:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setBadgingImage:", v19);

        v20 = (void *)objc_opt_new();
        WFDataFromSpotlightResultRunnable();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
        objc_msgSend(v20, "setIntentMessageData:", v21);

        objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setApplicationBundleIdentifier:", v23);

        objc_msgSend(v13, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setCommandDetail:", v24);

        if (v22)
        {
          v25 = v16;
          SearchUIAppTopHitSectionLoaderLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            __86__SearchUIBonusSPIAppTopHitAsyncSectionLoader_fetchCardSectionsWithCompletionHandler___block_invoke_cold_1(v50, v22, v51, v26);
        }
        else
        {
          objc_msgSend(v20, "setIsRunnableWorkflow:", 1);
          objc_msgSend(v13, "spotlightItem");
          v47 = v16;
          v26 = objc_claimAutoreleasedReturnValue();
          v44 = objc_alloc(MEMORY[0x1E0DA9C98]);
          -[NSObject uniqueIdentifier](v26, "uniqueIdentifier");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject attributeSet](v26, "attributeSet");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "serializedAttributes");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "allKeys");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject attributeSet](v26, "attributeSet");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "serializedAttributes");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "allValues");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "subtitle");
          v30 = a1;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (void *)objc_msgSend(v44, "initWithIdentifier:bundleIdentifier:protectionClass:attributeKeys:attributeValues:type:completion:", v48, v41, CFSTR("Priority"), v27, v29, 3, v31);

          a1 = v30;
          v12 = off_1EA1F5000;

          v32 = *(void **)(v30 + 32);
          objc_msgSend(v13, "subtitle");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "buildVerticalLayoutCardSectionFromResult:title:subtitle:command:", v47, v33, 0, v20);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = 0;
          objc_msgSend(v34, "setSpotlightBackingResult:", v45);
          objc_msgSend(v40, "addObject:", v34);

          v25 = v47;
        }

        ++v11;
        v35 = objc_msgSend(v49, "count");
        v36 = objc_msgSend((id)objc_opt_class(), "maxNumOfTopHitEntities");
        if (v35 >= v36)
          v37 = v36;
        else
          v37 = v35;
      }
      while (v11 < v37);
    }
    v38 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "responseForCardSections:animated:", v40, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v38 + 16))(v38, v39);

    v5 = 0;
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "responseForCardSections:animated:", MEMORY[0x1E0C9AA60], 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

void __86__SearchUIBonusSPIAppTopHitAsyncSectionLoader_fetchCardSectionsWithCompletionHandler___block_invoke_cold_1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1DAD39000, a4, OS_LOG_TYPE_ERROR, "Unable to encode result runnable: %@", a1, 0xCu);

}

@end
