@implementation WBSFormAutoFillMetadataCorrector

- (WBSFormAutoFillMetadataCorrector)initWithDomain:(id)a3
{
  id v4;
  WBSFormAutoFillMetadataCorrector *v5;
  void *v6;
  WBSFormAutoFillMetadataCorrector *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WBSFormAutoFillMetadataCorrector;
  v5 = -[WBSFormAutoFillMetadataCorrector init](&v9, sel_init);
  if (v5)
  {
    +[WBSFormAutoFillCorrectionsSQLiteStore standardStore](WBSFormAutoFillCorrectionsSQLiteStore, "standardStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSFormAutoFillMetadataCorrector _commonInitWithDomain:correctionsStore:](v5, "_commonInitWithDomain:correctionsStore:", v4, v6);

    v7 = v5;
  }

  return v5;
}

- (WBSFormAutoFillMetadataCorrector)init
{
  return -[WBSFormAutoFillMetadataCorrector initWithDomain:](self, "initWithDomain:", 0);
}

- (void)_commonInitWithDomain:(id)a3 correctionsStore:(id)a4
{
  id v6;
  NSString *v7;
  NSString *domain;
  WBSFormAutoFillClassificationToCorrectionsTransformer *v9;
  WBSFormAutoFillClassificationToCorrectionsTransformer *classificationToCorrectionsTransformer;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11)
  {
    v7 = (NSString *)objc_msgSend(v11, "copy");
    domain = self->_domain;
    self->_domain = v7;
  }
  else
  {
    domain = self->_domain;
    self->_domain = (NSString *)&stru_1E4B40D18;
  }

  objc_storeStrong((id *)&self->_correctionsStore, a4);
  v9 = objc_alloc_init(WBSFormAutoFillClassificationToCorrectionsTransformer);
  classificationToCorrectionsTransformer = self->_classificationToCorrectionsTransformer;
  self->_classificationToCorrectionsTransformer = v9;

}

- (void)enqueueCorrectionsRequestForFormMetadata:(id)a3 completionHandler:(id)a4
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  WBSFormAutoFillCorrectionsStore *correctionsStore;
  NSString *domain;
  id v17;
  NSObject *v18;
  void *v19;
  NSMutableSet *correctedFormMetadataID;
  uint64_t v21;
  NSMutableSet **p_correctedFormMetadataID;
  NSMutableSet *v23;
  void *v24;
  void *v25;
  id v26;
  id obj;
  void *v28;
  id v29;
  _QWORD block[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD *v35;
  _QWORD *v36;
  id v37[2];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[3];
  char v43;
  _QWORD v44[4];
  id location;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v29 = a4;
  objc_initWeak(&location, self);
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v44[3] = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v43 = 0;
  objc_msgSend(v26, "controls");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v25, "count");
  v6 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[WBSFormAutoFillMetadataCorrector enqueueCorrectionsRequestForFormMetadata:completionHandler:].cold.1((uint64_t)v28, v6);
  v40 = 0u;
  v41 = 0u;
  v39 = 0u;
  v38 = 0u;
  obj = v25;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v7)
  {
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        +[WBSFormFieldFingerprinter fingerprintForControlMetadata:](WBSFormFieldFingerprinter, "fingerprintForControlMetadata:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (id)WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v12, "fieldName");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            v47 = v8 + i + 1;
            v48 = 2112;
            v49 = v19;
            v50 = 2112;
            v51 = v13;
            _os_log_debug_impl(&dword_1A3D90000, v14, OS_LOG_TYPE_DEBUG, "Requesting asynchronous correction of control metadata at index %lu (name = '%@', fingerprint = '%@')", buf, 0x20u);

          }
          correctionsStore = self->_correctionsStore;
          domain = self->_domain;
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __95__WBSFormAutoFillMetadataCorrector_enqueueCorrectionsRequestForFormMetadata_completionHandler___block_invoke;
          v32[3] = &unk_1E4B394F0;
          objc_copyWeak(v37, &location);
          v17 = v13;
          v33 = v17;
          v35 = v42;
          v34 = v29;
          v36 = v44;
          v37[1] = v28;
          -[WBSFormAutoFillCorrectionsStore getClassificationForFieldWithFingerprint:onDomain:completionHandler:](correctionsStore, "getClassificationForFieldWithFingerprint:onDomain:completionHandler:", v17, domain, v32);

          objc_destroyWeak(v37);
          v9 = 1;
        }
        else
        {
          v18 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            v47 = v8 + i + 1;
            _os_log_debug_impl(&dword_1A3D90000, v18, OS_LOG_TYPE_DEBUG, "Skipping correction of control metadata at index %lu due to failure to generate fingerprint", buf, 0xCu);
          }
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
      v8 += i;
    }
    while (v7);
  }
  else
  {
    v9 = 0;
  }

  correctedFormMetadataID = self->_correctedFormMetadataID;
  if (!correctedFormMetadataID)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v21 = objc_claimAutoreleasedReturnValue();
    v23 = self->_correctedFormMetadataID;
    p_correctedFormMetadataID = &self->_correctedFormMetadataID;
    *p_correctedFormMetadataID = (NSMutableSet *)v21;

    correctedFormMetadataID = *p_correctedFormMetadataID;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v26, "uniqueID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](correctedFormMetadataID, "addObject:", v24);

  if (!((v29 == 0) | v9 & 1))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__WBSFormAutoFillMetadataCorrector_enqueueCorrectionsRequestForFormMetadata_completionHandler___block_invoke_3;
    block[3] = &unk_1E4B2B038;
    v31 = v29;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v44, 8);
  objc_destroyWeak(&location);

}

void __95__WBSFormAutoFillMetadataCorrector_enqueueCorrectionsRequestForFormMetadata_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  __int128 v7;
  _QWORD block[4];
  id v9;
  id v10;
  __int128 v11;
  uint64_t v12;
  id v13[2];

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__WBSFormAutoFillMetadataCorrector_enqueueCorrectionsRequestForFormMetadata_completionHandler___block_invoke_2;
  block[3] = &unk_1E4B394C8;
  objc_copyWeak(v13, (id *)(a1 + 64));
  v9 = v3;
  v10 = *(id *)(a1 + 32);
  v7 = *(_OWORD *)(a1 + 40);
  v4 = (id)v7;
  v11 = v7;
  v5 = *(void **)(a1 + 72);
  v12 = *(_QWORD *)(a1 + 56);
  v13[1] = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v13);
}

void __95__WBSFormAutoFillMetadataCorrector_enqueueCorrectionsRequestForFormMetadata_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  BOOL v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[3], "transformedValue:", *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = WeakRetained[2];
    if (v2)
    {
      if (!v3)
      {
        v4 = objc_alloc_init(MEMORY[0x1E0C99D38]);
        v5 = WeakRetained[2];
        WeakRetained[2] = v4;

        v3 = WeakRetained[2];
      }
      objc_msgSend(v3, "setObject:forKey:", v2, *(_QWORD *)(a1 + 40));
    }
    else
    {
      objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    }
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (v2)
      v7 = 0;
    else
      v7 = *(_BYTE *)(v6 + 24) == 0;
    v8 = !v7;
    *(_BYTE *)(v6 + 24) = v8;

  }
  if (*(_QWORD *)(a1 + 48))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v10 = *(_QWORD *)(v9 + 24) + 1;
    *(_QWORD *)(v9 + 24) = v10;
    if (v10 == *(_QWORD *)(a1 + 80))
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __95__WBSFormAutoFillMetadataCorrector_enqueueCorrectionsRequestForFormMetadata_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)hasAttemptedToCorrectMetadata:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *correctedFormMetadataID;
  void *v7;

  v4 = a3;
  v5 = v4;
  correctedFormMetadataID = self->_correctedFormMetadataID;
  if (correctedFormMetadataID)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "uniqueID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(correctedFormMetadataID) = -[NSMutableSet containsObject:](correctedFormMetadataID, "containsObject:", v7);

  }
  return (char)correctedFormMetadataID;
}

- (id)bestAvailableMetadataFromMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = v4;
  if (self->_fingerprintsToCorrections)
  {
    objc_msgSend(v4, "controls");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    if (!v7)
      goto LABEL_12;
    v8 = 0;
    v9 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillMetadataCorrector bestAvailableMetadataFromControlMetadata:](self, "bestAvailableMetadataFromControlMetadata:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11 && (objc_msgSend(v11, "isEqual:", v10) & 1) == 0)
      {
        if (!v9)
          v9 = (void *)objc_msgSend(v6, "mutableCopy");
        objc_msgSend(v9, "setObject:atIndexedSubscript:", v12, v8);
      }

      ++v8;
    }
    while (v7 != v8);
    if (v9)
    {
      objc_msgSend(v5, "formMetadataByReplacingControlsWith:", v9);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_12:
      v13 = v5;
      v9 = 0;
    }

  }
  else
  {
    v13 = v4;
  }

  return v13;
}

- (id)bestAvailableMetadataFromControlMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WBSFormControlMetadata *v9;

  v4 = a3;
  if (v4)
  {
    +[WBSFormFieldFingerprinter fingerprintForControlMetadata:](WBSFormFieldFingerprinter, "fingerprintForControlMetadata:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[NSCache objectForKey:](self->_fingerprintsToCorrections, "objectForKey:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        objc_msgSend(v4, "dictionaryRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(v7, "mutableCopy");

        objc_msgSend(v8, "addEntriesFromDictionary:", v6);
        v9 = -[WBSFormControlMetadata initWithDictionary:]([WBSFormControlMetadata alloc], "initWithDictionary:", v8);

      }
      else
      {
        v9 = (WBSFormControlMetadata *)v4;
      }

    }
    else
    {
      v9 = (WBSFormControlMetadata *)v4;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)domain
{
  return self->_domain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_correctedFormMetadataID, 0);
  objc_storeStrong((id *)&self->_classificationToCorrectionsTransformer, 0);
  objc_storeStrong((id *)&self->_fingerprintsToCorrections, 0);
  objc_storeStrong((id *)&self->_correctionsStore, 0);
}

- (void)enqueueCorrectionsRequestForFormMetadata:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_DEBUG, "Enqueuing correction request for form metadata containing %lu controls", (uint8_t *)&v2, 0xCu);
}

@end
