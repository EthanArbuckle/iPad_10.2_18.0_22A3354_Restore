@implementation PEAdjustmentPreset

- (PEAdjustmentPreset)initWithPropertyListDictionary:(id)a3
{
  id v5;
  PEAdjustmentPreset *v6;
  PEAdjustmentPreset *v7;
  PEAdjustmentPreset *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PEAdjustmentPreset;
  v6 = -[PEAdjustmentPreset init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serializedDictionary, a3);
    v8 = v7;
  }

  return v7;
}

- (PEAdjustmentPreset)initWithCompositionController:(id)a3 asset:(id)a4 additionalSerializationEntries:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PEAdjustmentPreset *v16;
  PEAdjustmentPreset *v17;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(a3, "copy");
  v11 = (void *)MEMORY[0x24BDBCED8];
  -[PEAdjustmentPreset _serializeCompositionController:](self, "_serializeCompositionController:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithDictionary:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("PEAdjustmentsPresetSourceAssetUUIDKey"));

  }
  objc_msgSend(v13, "addEntriesFromDictionary:", v9);
  v15 = (void *)objc_msgSend(v13, "copy");
  v16 = -[PEAdjustmentPreset initWithPropertyListDictionary:](self, "initWithPropertyListDictionary:", v15);

  if (v16)
    v17 = v16;

  return v16;
}

- (PEAdjustmentPreset)initWithCompositionController:(id)a3 asset:(id)a4
{
  return -[PEAdjustmentPreset initWithCompositionController:asset:additionalSerializationEntries:](self, "initWithCompositionController:asset:additionalSerializationEntries:", a3, a4, MEMORY[0x24BDBD1B8]);
}

- (NUComposition)composition
{
  NUComposition *composition;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NUComposition *v9;
  id v10;
  NUComposition *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  composition = self->_composition;
  if (!composition)
  {
    -[PEAdjustmentPreset serializedDictionary](self, "serializedDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PEAdjustmentPresetCompositionKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)MEMORY[0x24BE71C68];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PEAdjustmentPresetFormatIdentifierKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PEAdjustmentPresetFormatVersionKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      objc_msgSend(v6, "deserializeCompositionFromData:formatIdentifier:formatVersion:error:", v5, v7, v8, &v14);
      v9 = (NUComposition *)objc_claimAutoreleasedReturnValue();
      v10 = v14;
      v11 = self->_composition;
      self->_composition = v9;

      if (v10)
      {
        PLPhotoEditGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v10;
          _os_log_impl(&dword_20D13D000, v12, OS_LOG_TYPE_ERROR, "PEAdjustmentPreset failed to find composition with error: %@", buf, 0xCu);
        }

      }
    }

    composition = self->_composition;
  }
  return composition;
}

- (int64_t)actionType
{
  return 1;
}

- (BOOL)isAutoEnhanceEnabled
{
  return (unint64_t)(-[PEAdjustmentPreset autoType](self, "autoType") - 1) < 2;
}

- (int64_t)autoType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PEAdjustmentPreset serializedDictionary](self, "serializedDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PEAdjustmentPresetAutoKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "integerValue");
  return v4;
}

- (id)_serializeCompositionController:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  id v24;
  _QWORD v25[4];
  _QWORD v26[4];
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PEEditAction.m"), 164, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("compositionController"));

  }
  objc_msgSend(v5, "composition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "smartToneAdjustmentController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isAuto"))
    {
      objc_msgSend(v8, "inputLight");
      v10 = v9;
      objc_msgSend(v8, "inputLightDefault");
      if (vabdd_f64(v10, v11) > 0.001)
        v12 = 1;
      else
        v12 = 2;
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend((id)objc_opt_class(), "sanitizeCompositionController:", v5);
    v14 = (void *)MEMORY[0x24BE71C68];
    objc_msgSend(v5, "composition");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v14, "adjustmentInformationForComposition:skipMetadata:error:", v15, 1, &v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v24;

    if (v16)
    {
      v25[0] = CFSTR("PEAdjustmentPresetCompositionKey");
      objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BE71D38]);
      v18 = objc_claimAutoreleasedReturnValue();
      v26[0] = v18;
      v25[1] = CFSTR("PEAdjustmentPresetFormatIdentifierKey");
      objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BE71D40]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v19;
      v25[2] = CFSTR("PEAdjustmentPresetFormatVersionKey");
      objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BE71D48]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26[2] = v20;
      v25[3] = CFSTR("PEAdjustmentPresetAutoKey");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26[3] = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      PLPhotoEditGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v17;
        _os_log_impl(&dword_20D13D000, v18, OS_LOG_TYPE_ERROR, "PEAdjustmentPreset failed to serialize preset with error: %@", buf, 0xCu);
      }
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_isCinematicEditSource:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x24BDB2378];
    objc_msgSend(v3, "videoURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetWithURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x24BE71C38], "assetIsCinematicVideo:", v6))
      v7 = objc_msgSend(MEMORY[0x24BE71C38], "currentSystemCanRenderAsset:", v6);
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_isSpatialAudioEditSource:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  v4 = (void *)MEMORY[0x24BDB2378];
  objc_msgSend(v3, "videoURL");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetWithURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(MEMORY[0x24BE6C438], "assetIsCinematicAudio:", v6);
  if ((v5 & 1) != 0)
    v7 = 1;
  else
LABEL_4:
    v7 = 0;

  return v7;
}

- (void)applyToLoadResult:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "compositionController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "editSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PEAdjustmentPreset applyToCompositionController:asset:editSource:completion:](self, "applyToCompositionController:asset:editSource:completion:", v10, v8, v9, v6);
}

- (void)applyToCompositionController:(id)a3 asset:(id)a4 editSource:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v21, "adjustmentConstants");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (!-[PEAdjustmentPreset _isCinematicEditSource:](self, "_isCinematicEditSource:", v11))
  {
    objc_msgSend(v13, "PIPortraitVideoAdjustmentKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

  }
  if ((objc_msgSend(v10, "mediaSubtypes") & 0x10) == 0)
  {
    objc_msgSend(v13, "PIDepthAdjustmentKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v16);

  }
  if (!-[PEAdjustmentPreset _isSpatialAudioEditSource:](self, "_isSpatialAudioEditSource:", v11))
    objc_msgSend(v14, "addObject:", *MEMORY[0x24BE71D70]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "fetchSmartStyleExtendedProperties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "originallySmartStyleable") & 1) != 0)
    {
      v18 = (void *)MEMORY[0x24BE71CF0];
      objc_msgSend(v21, "composition");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v18) = objc_msgSend(v18, "canRenderStylesOnComposition:", v19);

      if ((v18 & 1) != 0)
        goto LABEL_13;
    }
    else
    {

    }
  }
  objc_msgSend(v13, "PISemanticStyleAdjustmentKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v20);

LABEL_13:
  -[PEAdjustmentPreset applyToCompositionController:asset:editSource:invalidAdjustmentKeys:completion:](self, "applyToCompositionController:asset:editSource:invalidAdjustmentKeys:completion:", v21, v10, v11, v14, v12);

}

- (void)applyToCompositionController:(id)a3 asset:(id)a4 editSource:(id)a5 invalidAdjustmentKeys:(id)a6 completion:(id)a7
{
  id v10;
  id v11;
  void (**v12)(id, uint64_t);
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  NSObject *v23;
  __int16 v24[8];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  v12 = (void (**)(id, uint64_t))a7;
  -[PEAdjustmentPreset composition](self, "composition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = objc_msgSend(v10, "mediaType");
    objc_msgSend(v10, "source");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v10, "imageOrientation");
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE71C40]), "initWithComposition:", v13);
    objc_msgSend(v17, "setSource:mediaType:", v15, v14);
    objc_msgSend(v17, "setImageOrientation:", v16);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v18 = v11;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v26 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(v17, "removeAdjustmentWithKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v20);
    }

    objc_msgSend(v10, "applyChangesFromCompositionController:", v17);
    PLPhotoEditGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24[0] = 0;
      _os_log_impl(&dword_20D13D000, v23, OS_LOG_TYPE_INFO, "PEAdjustmentPreset applied edits to compositionController", (uint8_t *)v24, 2u);
    }

    v12[2](v12, 1);
  }
  else
  {
    v12[2](v12, 0);
  }

}

- (void)setComposition:(id)a3
{
  objc_storeStrong((id *)&self->_composition, a3);
}

- (NSDictionary)serializedDictionary
{
  return self->_serializedDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedDictionary, 0);
  objc_storeStrong((id *)&self->_composition, 0);
}

+ (void)sanitizeCompositionController:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v13 = a3;
  objc_msgSend(v13, "depthAdjustmentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "aperture");
    if (v5 == 0.0)
    {
      objc_msgSend(v4, "depthInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BE71DC0]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = *MEMORY[0x24BE71DB8];
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __52__PEAdjustmentPreset_sanitizeCompositionController___block_invoke;
        v16[3] = &unk_24C6187C0;
        v17 = v7;
        objc_msgSend(v13, "modifyAdjustmentWithKey:modificationBlock:", v8, v16);

      }
    }
    objc_msgSend(v4, "focusRect");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v4, "depthInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BE71DC8]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = *MEMORY[0x24BE71DB8];
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __52__PEAdjustmentPreset_sanitizeCompositionController___block_invoke_2;
        v14[3] = &unk_24C6187C0;
        v15 = v11;
        objc_msgSend(v13, "modifyAdjustmentWithKey:modificationBlock:", v12, v14);

      }
    }
  }

}

void __52__PEAdjustmentPreset_sanitizeCompositionController___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  float v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "floatValue");
  objc_msgSend(v4, "setAperture:", v3);

}

void __52__PEAdjustmentPreset_sanitizeCompositionController___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (id)objc_msgSend(v2, "copy");
  objc_msgSend(v3, "setFocusRect:", v4);

}

- (id)analyticsPayload
{
  void *v2;
  void *v3;
  void *v4;

  -[PEAdjustmentPreset composition](self, "composition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE71C40]), "initWithComposition:", v2);
  +[PEAnalyticsUtility analyticPayloadForCompositionController:](PEAnalyticsUtility, "analyticPayloadForCompositionController:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
