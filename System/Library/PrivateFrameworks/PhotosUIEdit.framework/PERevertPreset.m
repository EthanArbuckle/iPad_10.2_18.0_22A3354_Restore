@implementation PERevertPreset

- (int64_t)actionType
{
  return 4;
}

- (void)applyToLoadResult:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  objc_msgSend(v5, "contentEditingInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v36 = 0;
    +[PESerializationUtility editSourceForContentEditingInput:useEmbeddedPreview:error:](PESerializationUtility, "editSourceForContentEditingInput:useEmbeddedPreview:error:", v7, 0, &v36);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v36;
    if (v8)
    {
      objc_msgSend(v5, "compositionController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      +[PESerializationUtility compositionControllerForContentEditingInput:asShot:source:error:](PESerializationUtility, "compositionControllerForContentEditingInput:asShot:source:error:", v7, 1, v8, &v35);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v35;
      v13 = v12;
      if (v11)
      {
        v32 = v12;
        v33 = v9;
        objc_msgSend(v5, "adjustedSourceCompositionController");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
          v16 = (void *)v14;
        else
          v16 = v10;
        v34 = v16;

        objc_msgSend(v5, "imageURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = objc_alloc(MEMORY[0x24BE72400]);
          objc_msgSend(v5, "imageURL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v18, "initWithMediaURL:timeZoneLookup:", v19, 0);

        }
        else
        {
          v20 = 0;
        }

        objc_msgSend(v7, "livePhoto");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[PESupport repairedAsShotCompositionController:forCurrentCompositionController:isLivePhoto:metadata:](PESupport, "repairedAsShotCompositionController:forCurrentCompositionController:isLivePhoto:metadata:", v11, v34, v24 != 0, v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "applyChangesFromCompositionController:", v25);
        if ((objc_msgSend(MEMORY[0x24BE71F80], "isIdentityCompositionController:", v10) & 1) != 0)
          goto LABEL_20;
        objc_msgSend(v10, "slomoAdjustmentController");
        v27 = objc_claimAutoreleasedReturnValue();
        if (!v27)
          goto LABEL_23;
        v28 = (void *)v27;
        objc_msgSend(v10, "slomoAdjustmentController");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "rate");
        v31 = v30;

        if (v31 != 1.0)
LABEL_20:
          v26 = 2;
        else
LABEL_23:
          v26 = 1;
        v6[2](v6, v26);

        v13 = v32;
        v9 = v33;
      }
      else
      {
        PLPhotoEditGetLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v13;
          _os_log_impl(&dword_20D13D000, v23, OS_LOG_TYPE_ERROR, "PERevertPreset failed to deserialize the as-shot adjustment data: %@", buf, 0xCu);
        }

        v6[2](v6, 0);
      }

    }
    else
    {
      PLPhotoEditGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v9;
        _os_log_impl(&dword_20D13D000, v22, OS_LOG_TYPE_ERROR, "PERevertPreset could not retrieve edit source from the contentEditingInput: %@", buf, 0xCu);
      }

      v6[2](v6, 0);
    }

  }
  else
  {
    PLPhotoEditGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D13D000, v21, OS_LOG_TYPE_ERROR, "PERevertPreset failed to find contentEditingInput", buf, 2u);
    }

    v6[2](v6, 0);
  }

}

- (BOOL)forceRunAsUnadjustedAsset
{
  return 1;
}

@end
