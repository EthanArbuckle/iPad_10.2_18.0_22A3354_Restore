@implementation PLAssetComputeSyncJournalEntryPayload

- (void)applyPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6 payloadDictionary:(id)a7 info:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  char v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  NSMutableDictionary *payloadAttributes;
  id v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  uint64_t v60;
  BOOL v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  PLAssetComputeSyncJournalEntryPayload *v67;
  void *v68;
  objc_super v69;
  _QWORD v70[4];
  id v71;
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;
  id v76;
  _QWORD v77[4];
  id v78;
  id v79;
  id v80;
  id v81;
  PLAssetComputeSyncJournalEntryPayload *v82;
  id v83;
  id v84;
  char v85;
  _QWORD v86[4];
  id v87;
  PLAssetComputeSyncJournalEntryPayload *v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  char v93;
  _QWORD v94[4];
  id v95;
  id v96;
  PLAssetComputeSyncJournalEntryPayload *v97;
  id v98;
  id v99;
  id v100;
  id v101;
  _QWORD v102[4];
  id v103;
  _QWORD v104[4];
  id v105;
  objc_super v106;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  objc_msgSend(v14, "parentProperty");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isToManySubRelationship");

  if (v21)
  {
    v106.receiver = self;
    v106.super_class = (Class)PLAssetComputeSyncJournalEntryPayload;
    -[PLManagedObjectJournalEntryPayload applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:payloadDictionary:info:](&v106, sel_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info_, v14, v15, v16, v17, v18, v19);
    v22 = v17;
    goto LABEL_17;
  }
  v67 = self;
  v68 = v18;
  v23 = v17;
  if ((objc_msgSend(v14, "isEqualToKey:", CFSTR("sceneClassifications")) & 1) != 0
    || objc_msgSend(v14, "isEqualToKey:", CFSTR("temporalSceneClassifications")))
  {
    objc_msgSend(v14, "key");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "objectForKeyedSubscript:", v24);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v25, "count"))
    {

      v22 = v17;
LABEL_16:
      v18 = v68;
      goto LABEL_17;
    }
    v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v27 = v19;
    v28 = MEMORY[0x1E0C809B0];
    v104[0] = MEMORY[0x1E0C809B0];
    v104[1] = 3221225472;
    v104[2] = __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke;
    v104[3] = &unk_1E3673250;
    v105 = v26;
    v65 = v26;
    objc_msgSend(v25, "enumerateObjectsUsingBlock:", v104);
    objc_msgSend(v15, "valueForKey:", v16);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "mutableCopy");

    v102[0] = v28;
    v102[1] = 3221225472;
    v102[2] = __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_2;
    v102[3] = &unk_1E3669EE0;
    v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v103 = v31;
    objc_msgSend(v30, "enumerateObjectsUsingBlock:", v102);
    v94[0] = v28;
    v94[1] = 3221225472;
    v94[2] = __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_3;
    v94[3] = &unk_1E3669F58;
    v95 = v14;
    v32 = v15;
    v96 = v32;
    v97 = v67;
    v22 = v23;
    v98 = v23;
    v99 = v27;
    v100 = v31;
    v101 = v30;
    v33 = v30;
    v34 = v31;
    objc_msgSend(v65, "enumerateKeysAndObjectsUsingBlock:", v94);
    v35 = v32;
    v19 = v27;
    objc_msgSend(v35, "setValue:forKey:", v33, v16);

LABEL_15:
    goto LABEL_16;
  }
  if ((objc_msgSend(v14, "isEqualToKey:", CFSTR("detectedFaces")) & 1) != 0
    || objc_msgSend(v14, "isEqualToKey:", CFSTR("temporalDetectedFaces")))
  {
    v25 = v15;
    objc_msgSend(v25, "managedObjectContext");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "key");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "objectForKeyedSubscript:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = v38;
    v40 = objc_msgSend(v38, "count");
    v22 = v23;
    if (v40)
    {
      v63 = v36;
      v64 = v25;
      v66 = v19;
      v90 = 0;
      v91 = &v90;
      v92 = 0x2020000000;
      v93 = 0;
      objc_msgSend(v14, "subRelationshipProperties");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v86[0] = MEMORY[0x1E0C809B0];
      v86[1] = 3221225472;
      v86[2] = __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_7;
      v86[3] = &unk_1E3669F80;
      v89 = &v90;
      v42 = v19;
      v87 = v42;
      v88 = self;
      objc_msgSend(v41, "enumerateKeysAndObjectsUsingBlock:", v86);

      if (*((_BYTE *)v91 + 24))
      {
        v43 = objc_msgSend(v14, "isEqualToKey:", CFSTR("temporalDetectedFaces"));
        v44 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v77[0] = MEMORY[0x1E0C809B0];
        v77[1] = 3221225472;
        v77[2] = __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_8;
        v77[3] = &unk_1E3669FA8;
        v62 = v63;
        v78 = v62;
        v45 = v64;
        v79 = v45;
        v85 = v43;
        v46 = v44;
        v80 = v46;
        v81 = v14;
        v82 = v67;
        v83 = v23;
        v84 = v42;
        objc_msgSend(v39, "enumerateObjectsUsingBlock:", v77);
        objc_msgSend(v45, "valueForKey:", v16);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (void *)objc_msgSend(v47, "mutableCopy");

        v49 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v73[0] = MEMORY[0x1E0C809B0];
        v73[1] = 3221225472;
        v73[2] = __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_10;
        v73[3] = &unk_1E3669FD0;
        v50 = v46;
        v74 = v50;
        v75 = v62;
        v51 = v49;
        v76 = v51;
        objc_msgSend(v48, "enumerateObjectsUsingBlock:", v73);
        objc_msgSend(v48, "unionSet:", v50);
        objc_msgSend(v48, "minusSet:", v51);
        objc_msgSend(v45, "setValue:forKey:", v48, v16);

      }
      _Block_object_dispose(&v90, 8);
      v25 = v64;
      v19 = v66;
      v36 = v63;
    }

    goto LABEL_15;
  }
  v22 = v17;
  if (objc_msgSend(v14, "isEqualToKey:", CFSTR("generatedAssetDescriptions")))
  {
    payloadAttributes = self->super._payloadAttributes;
    objc_msgSend(v14, "key");
    v53 = v19;
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](payloadAttributes, "objectForKeyedSubscript:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v53;
    v56 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_11;
    v70[3] = &unk_1E366A7C0;
    v71 = v14;
    v72 = v56;
    v57 = v56;
    objc_msgSend(v55, "enumerateObjectsUsingBlock:", v70);
    +[PLGeneratedAssetDescription setGeneratedAssetDescriptionForAsset:fromDictionaries:](PLGeneratedAssetDescription, "setGeneratedAssetDescriptionForAsset:fromDictionaries:", v15, v57);

    goto LABEL_16;
  }
  v18 = v68;
  if (objc_msgSend(v14, "isEqualToKey:", CFSTR("mediaAnalysisVersion"))
    && -[PLAssetComputeSyncJournalEntryPayload mediaAnalysisVersion](self, "mediaAnalysisVersion") >= 1)
  {
    objc_msgSend(v15, "setMediaAnalysisVersion:", 1);
  }
  else if (!objc_msgSend(v14, "isEqualToKey:", CFSTR("mediaAnalysisImageVersion"))
         || (-[PLAssetComputeSyncJournalEntryPayload mediaAnalysisImageVersion](self, "mediaAnalysisImageVersion"),
             v58 = (void *)objc_claimAutoreleasedReturnValue(),
             v59 = v19,
             v60 = objc_msgSend(v58, "integerValue"),
             v58,
             v61 = v60 < 1,
             v19 = v59,
             v61))
  {
    if (objc_msgSend(v14, "isEqualToKey:", CFSTR("imageEmbeddingVersion"))
      && -[PLAssetComputeSyncJournalEntryPayload imageEmbeddingVersion](self, "imageEmbeddingVersion") >= 1)
    {
      objc_msgSend(v15, "setImageEmbeddingVersion:", 1);
    }
    else if (objc_msgSend(v14, "isEqualToKey:", CFSTR("videoEmbeddingVersion"))
           && -[PLAssetComputeSyncJournalEntryPayload videoEmbeddingVersion](self, "videoEmbeddingVersion") >= 1)
    {
      objc_msgSend(v15, "setVideoEmbeddingVersion:", 1);
    }
    else if ((objc_msgSend(v14, "isEqualToKey:", CFSTR("imageCaptionVersion")) & 1) == 0
           && (objc_msgSend(v14, "isEqualToKey:", CFSTR("videoCaptionVersion")) & 1) == 0)
    {
      v69.receiver = self;
      v69.super_class = (Class)PLAssetComputeSyncJournalEntryPayload;
      -[PLManagedObjectJournalEntryPayload applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:payloadDictionary:info:](&v69, sel_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info_, v14, v15, v16, v22, v68, v19);
    }
  }
  else
  {
    objc_msgSend(v15, "setMediaAnalysisImageVersion:", 1);
  }
LABEL_17:

}

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  BOOL v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "parentProperty");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToKey:", CFSTR("generatedAssetDescriptions")))
  {
    v12 = objc_msgSend(v10, "isEqualToKey:", CFSTR("analysisVersion"));

    if (v12)
      goto LABEL_9;
  }
  else
  {

  }
  if ((objc_msgSend(v10, "isEqualToKey:", CFSTR("mediaAnalysisVersion")) & 1) == 0
    && (objc_msgSend(v10, "isEqualToKey:", CFSTR("mediaAnalysisImageVersion")) & 1) == 0
    && (objc_msgSend(v10, "isEqualToKey:", CFSTR("imageEmbeddingVersion")) & 1) == 0
    && !objc_msgSend(v10, "isEqualToKey:", CFSTR("videoEmbeddingVersion")))
  {
    if ((objc_msgSend(v10, "isEqualToKey:", CFSTR("imageCaptionVersion")) & 1) != 0
      || (objc_msgSend(v10, "isEqualToKey:", CFSTR("videoCaptionVersion")) & 1) != 0)
    {
      goto LABEL_11;
    }
LABEL_14:
    v15.receiver = self;
    v15.super_class = (Class)PLAssetComputeSyncJournalEntryPayload;
    v13 = -[PLManagedObjectJournalEntryPayload comparePayloadValue:toObjectDictionaryValue:forPayloadProperty:](&v15, sel_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty_, v8, v9, v10);
    goto LABEL_15;
  }
LABEL_9:
  if (objc_msgSend(v9, "integerValue") != 1 || !objc_msgSend(v8, "integerValue"))
    goto LABEL_14;
LABEL_11:
  v13 = 1;
LABEL_15:

  return v13;
}

- (int64_t)sceneAnalysisVersion
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("sceneAnalysisVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (int64_t)faceAnalysisVersion
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("faceAnalysisVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (int64_t)mediaAnalysisVersion
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("mediaAnalysisVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (NSNumber)mediaAnalysisImageVersion
{
  return (NSNumber *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("mediaAnalysisImageVersion"));
}

- (int64_t)characterRecognitionVersion
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("crAlgorithmVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (int64_t)visualSearchVersion
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("vsAlgorithmVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (int64_t)imageEmbeddingVersion
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("imageEmbeddingVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (int64_t)videoEmbeddingVersion
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("videoEmbeddingVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

void __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("classificationType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);
  }
  objc_msgSend(v4, "addObject:", v5);

}

void __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v5, "classificationType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);
  }
  objc_msgSend(v4, "addObject:", v5);

}

void __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;

  v5 = (objc_class *)MEMORY[0x1E0C99E20];
  v6 = a3;
  v7 = a2;
  v8 = objc_alloc_init(v5);
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_4;
  v17[3] = &unk_1E3669F30;
  v18 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(void **)(a1 + 56);
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = *(id *)(a1 + 64);
  v14 = v8;
  v23 = v14;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v17);

  objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 80), "minusSet:", v13);
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_6;
    v15[3] = &unk_1E3669EE0;
    v16 = *(id *)(a1 + 40);
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);

  }
  objc_msgSend(*(id *)(a1 + 80), "unionSet:", v14);

}

void __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_7(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  char v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = (void *)a1[4];
  if (v8)
    v9 = objc_msgSend(v8, "shouldApplyWithPayloadProperty:andPayload:", v7, a1[5]);
  else
    v9 = 1;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v9;
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    *a4 = 1;

}

void __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  PLAssetComputeCacheFaceRebuildDescription *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  PLFaceRebuildHelper *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id v16;

  v3 = a2;
  v10 = -[PLFaceRebuildHelper initWithContext:]([PLFaceRebuildHelper alloc], "initWithContext:", *(_QWORD *)(a1 + 32));
  v4 = -[PLAssetComputeCacheFaceRebuildDescription initWithPayloadAttributes:]([PLAssetComputeCacheFaceRebuildDescription alloc], "initWithPayloadAttributes:", v3);
  -[PLFaceRebuildHelper findExistingDetectedFaceForRebuildFace:onAsset:](v10, "findExistingDetectedFaceForRebuildFace:onAsset:", v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLDetectedFace, "insertInManagedObjectContext:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!*(_BYTE *)(a1 + 88))
    {
      objc_msgSend(v5, "setSourceWidth:", objc_msgSend(*(id *)(a1 + 40), "width"));
      objc_msgSend(v5, "setSourceHeight:", objc_msgSend(*(id *)(a1 + 40), "height"));
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v5, v10);
  objc_msgSend(*(id *)(a1 + 56), "subRelationshipProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_9;
  v12[3] = &unk_1E3669F08;
  v7 = *(void **)(a1 + 72);
  v12[4] = *(_QWORD *)(a1 + 64);
  v13 = v5;
  v14 = v7;
  v15 = v3;
  v16 = *(id *)(a1 + 80);
  v8 = v3;
  v9 = v5;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);

}

void __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_10(id *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(a1[4], "containsObject:") & 1) == 0)
  {
    objc_msgSend(a1[5], "deleteObject:", v3);
    objc_msgSend(a1[6], "removeObject:", v3);
  }

}

void __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_11(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("analysisSourceType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1 + 32), "subRelationshipProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_12;
    v8[3] = &unk_1E3669FF8;
    v9 = v7;
    v10 = v4;
    v6 = v4;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v3);
  }

}

void __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v6, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v6, "isEqualToKey:", CFSTR("analysisVersion"));
  if ((_DWORD)v5 && objc_msgSend(v8, "integerValue") >= 1)
  {
    v9 = *(void **)(a1 + 40);
    v10 = &unk_1E375EB80;
  }
  else
  {
    v9 = *(void **)(a1 + 40);
    v10 = v8;
  }
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v11);

}

uint64_t __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:payloadDictionary:info:", a3, *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id v16;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C97B20];
  objc_msgSend(*(id *)(a1 + 32), "subRelationshipEntityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertNewObjectForEntityForName:inManagedObjectContext:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "subRelationshipProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_5;
  v12[3] = &unk_1E3669F08;
  v9 = *(void **)(a1 + 56);
  v12[4] = *(_QWORD *)(a1 + 48);
  v13 = v7;
  v14 = v9;
  v15 = v3;
  v16 = *(id *)(a1 + 64);
  v10 = v3;
  v11 = v7;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v12);

  objc_msgSend(*(id *)(a1 + 72), "addObject:", v11);
}

void __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "managedObjectContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteObject:", v3);

}

uint64_t __131__PLAssetComputeSyncJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:payloadDictionary:info:", a3, *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

+ (BOOL)shouldIncludeOCR
{
  if ((MEMORY[0x19AEC0720](a1, a2) & 1) != 0)
    return shouldIncludeOCR;
  else
    return PLPlatformIsMachineReadableCodeDataSupported();
}

+ (void)setShouldIncludeOCR:(BOOL)a3
{
  if (MEMORY[0x19AEC0720](a1, a2))
    shouldIncludeOCR = a3;
}

+ (id)sceneClassificationPropertiesDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("classificationType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v10[1] = CFSTR("confidence");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  v10[2] = CFSTR("duration");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  v10[3] = CFSTR("packedBoundingBoxRect");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  v10[4] = CFSTR("sceneIdentifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v6;
  v10[5] = CFSTR("startTime");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)detectedFacePropertiesDescription
{
  PLJournalEntryPayloadPropertyInfoAssetCompute *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  PLJournalEntryPayloadPropertyInfoAssetCompute *v68;
  _QWORD v69[5];
  _QWORD v70[5];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[52];
  _QWORD v74[54];

  v74[52] = *MEMORY[0x1E0C80C00];
  v2 = -[PLJournalEntryPayloadPropertyInfoAssetCompute initWithAnalysisStage:versionType:]([PLJournalEntryPayloadPropertyInfoAssetCompute alloc], "initWithAnalysisStage:versionType:", 200, 2);
  v68 = -[PLJournalEntryPayloadPropertyInfoAssetCompute initWithAnalysisStage:versionType:]([PLJournalEntryPayloadPropertyInfoAssetCompute alloc], "initWithAnalysisStage:versionType:", 900, 3);
  v73[0] = CFSTR("centerX");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v67;
  v73[1] = CFSTR("centerY");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v66;
  v73[2] = CFSTR("size");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v74[2] = v65;
  v73[3] = CFSTR("bodyCenterX");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v74[3] = v64;
  v73[4] = CFSTR("bodyCenterY");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v74[4] = v63;
  v73[5] = CFSTR("bodyWidth");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v74[5] = v62;
  v73[6] = CFSTR("bodyHeight");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v74[6] = v61;
  v73[7] = CFSTR("detectionType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v74[7] = v60;
  v73[8] = CFSTR("nameSource");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v74[8] = v59;
  v73[9] = CFSTR("cloudNameSource");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v74[9] = v58;
  v73[10] = CFSTR("hidden");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v74[10] = v57;
  v73[11] = CFSTR("manual");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v74[11] = v56;
  v73[12] = CFSTR("faceAlgorithmVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v74[12] = v55;
  v73[13] = CFSTR("adjustmentVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v74[13] = v54;
  v73[14] = CFSTR("ageType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v74[14] = v53;
  v73[15] = CFSTR("assetVisible");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v74[15] = v52;
  v73[16] = CFSTR("blurScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v74[16] = v51;
  v73[17] = CFSTR("clusterSequenceNumber");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v74[17] = v50;
  v73[18] = CFSTR("confirmedFaceCropGenerationState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v74[18] = v49;
  v73[19] = CFSTR("eyeMakeupType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v74[19] = v48;
  v73[20] = CFSTR("duration");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("duration"), 500, v2);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v74[20] = v47;
  v73[21] = CFSTR("eyesState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v74[21] = v46;
  v73[22] = CFSTR("facialHairType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v74[22] = v45;
  v73[23] = CFSTR("genderType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v74[23] = v44;
  v73[24] = CFSTR("glassesType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v74[24] = v43;
  v73[25] = CFSTR("groupingIdentifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v74[25] = v42;
  v73[26] = CFSTR("hairColorType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v74[26] = v41;
  v73[27] = CFSTR("hasSmile");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v74[27] = v40;
  v73[28] = CFSTR("isLeftEyeClosed");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v74[28] = v39;
  v73[29] = CFSTR("isRightEyeClosed");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v74[29] = v38;
  v73[30] = CFSTR("lipMakeupType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v74[30] = v37;
  v73[31] = CFSTR("faceExpressionType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v74[31] = v36;
  v73[32] = CFSTR("headgearType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v74[32] = v35;
  v73[33] = CFSTR("hairType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v74[33] = v34;
  v73[34] = CFSTR("poseType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v74[34] = v33;
  v73[35] = CFSTR("skintoneType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v74[35] = v32;
  v73[36] = CFSTR("ethnicityType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v74[36] = v31;
  v73[37] = CFSTR("hasFaceMask");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v74[37] = v30;
  v73[38] = CFSTR("gazeType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v74[38] = v29;
  v73[39] = CFSTR("gazeCenterX");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v74[39] = v28;
  v73[40] = CFSTR("gazeCenterY");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v74[40] = v27;
  v73[41] = CFSTR("gazeRectString");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v74[41] = v26;
  v73[42] = CFSTR("gazeAngle");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v74[42] = v25;
  v73[43] = CFSTR("gazeConfidence");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v74[43] = v24;
  v73[44] = CFSTR("roll");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v74[44] = v23;
  v73[45] = CFSTR("poseYaw");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v74[45] = v22;
  v73[46] = CFSTR("qualityMeasure");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v74[46] = v21;
  v73[47] = CFSTR("quality");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v74[47] = v20;
  v73[48] = CFSTR("smileType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v74[48] = v19;
  v73[49] = CFSTR("startTime");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("startTime"), 500, v2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v74[49] = v18;
  v73[50] = CFSTR("faceprint");
  +[PLDetectedFaceprint entityName](PLDetectedFaceprint, "entityName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = CFSTR("data");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("faceprintData"), 1000, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v17;
  v71[1] = CFSTR("faceprintVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", CFSTR("faceprint"), v14, v15, 0, 1, v2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v74[50] = v13;
  v73[51] = CFSTR("detectionTraits");
  +[PLDetectionTrait entityName](PLDetectionTrait, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = CFSTR("duration");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("duration"), 500, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v4;
  v69[1] = CFSTR("score");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v5;
  v69[2] = CFSTR("startTime");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("startTime"), 500, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v70[2] = v6;
  v69[3] = CFSTR("type");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v70[3] = v7;
  v69[4] = CFSTR("value");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v70[4] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", CFSTR("detectionTraits"), v9, v3, 1, 1, v68);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v74[51] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 52);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)mediaAnalysisAttributesPropertiesDictionary
{
  PLJournalEntryPayloadPropertyInfoAssetCompute *v2;
  PLJournalEntryPayloadPropertyInfoAssetCompute *v3;
  void *v4;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  PLJournalEntryPayloadPropertyInfoAssetCompute *v50;
  id v51;
  PLJournalEntryPayloadPropertyInfoAssetCompute *v52;
  PLJournalEntryPayloadPropertyInfoAssetCompute *v53;
  _QWORD v54[4];
  _QWORD v55[4];
  const __CFString *v56;
  void *v57;
  _QWORD v58[4];
  _QWORD v59[4];
  _QWORD v60[30];
  _QWORD v61[32];

  v61[30] = *MEMORY[0x1E0C80C00];
  v2 = -[PLJournalEntryPayloadPropertyInfoAssetCompute initWithAnalysisStage:versionType:]([PLJournalEntryPayloadPropertyInfoAssetCompute alloc], "initWithAnalysisStage:versionType:", 100, 1);
  v52 = -[PLJournalEntryPayloadPropertyInfoAssetCompute initWithAnalysisStage:versionType:]([PLJournalEntryPayloadPropertyInfoAssetCompute alloc], "initWithAnalysisStage:versionType:", 200, 4);
  v53 = -[PLJournalEntryPayloadPropertyInfoAssetCompute initWithAnalysisStage:versionType:]([PLJournalEntryPayloadPropertyInfoAssetCompute alloc], "initWithAnalysisStage:versionType:", 200, 5);
  v3 = -[PLJournalEntryPayloadPropertyInfoAssetCompute initWithAnalysisStage:versionType:]([PLJournalEntryPayloadPropertyInfoAssetCompute alloc], "initWithAnalysisStage:versionType:", 900, 3);
  v60[0] = CFSTR("activityScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v49;
  v60[1] = CFSTR("animatedStickerRangeDurationTimeScale");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v48;
  v60[2] = CFSTR("animatedStickerRangeDurationValue");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = v47;
  v60[3] = CFSTR("animatedStickerRangeStartTimeScale");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v61[3] = v46;
  v60[4] = CFSTR("animatedStickerRangeStartValue");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v61[4] = v45;
  v60[5] = CFSTR("audioClassification");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v61[5] = v44;
  v60[6] = CFSTR("audioScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v61[6] = v43;
  v60[7] = CFSTR("autoplaySuggestionScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v61[7] = v42;
  v60[8] = CFSTR("bestVideoRangeDurationTimeScale");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v61[8] = v41;
  v60[9] = CFSTR("bestVideoRangeDurationValue");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v61[9] = v40;
  v60[10] = CFSTR("bestVideoRangeStartTimeScale");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v61[10] = v39;
  v60[11] = CFSTR("bestVideoRangeStartValue");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v61[11] = v38;
  v60[12] = CFSTR("blurrinessScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v61[12] = v37;
  v60[13] = CFSTR("colorNormalizationData");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v61[13] = v36;
  v60[14] = CFSTR("exposureScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v61[14] = v35;
  v60[15] = CFSTR("faceCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v61[15] = v34;
  v60[16] = CFSTR("mediaAnalysisTimeStamp");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v61[16] = v33;
  v60[17] = CFSTR("mediaAnalysisVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v61[17] = v32;
  v60[18] = CFSTR("mediaAnalysisImageVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v61[18] = v31;
  v60[19] = CFSTR("packedBestPlaybackRect");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v61[19] = v30;
  v60[20] = CFSTR("probableRotationDirection");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v61[20] = v29;
  v60[21] = CFSTR("probableRotationDirectionConfidence");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v61[21] = v28;
  v60[22] = CFSTR("screenTimeDeviceImageSensitivity");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v61[22] = v27;
  v60[23] = CFSTR("settlingEffectScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v61[23] = v26;
  v60[24] = CFSTR("imageEmbeddingVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v61[24] = v25;
  v60[25] = CFSTR("videoEmbeddingVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v61[25] = v24;
  v60[26] = CFSTR("videoScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v61[26] = v23;
  v60[27] = CFSTR("videoStickerSuggestionScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v61[27] = v22;
  v60[28] = CFSTR("wallpaperScore");
  v50 = v2;
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v61[28] = v21;
  v60[29] = CFSTR("visualSearchAttributes");
  +[PLVisualSearchAttributes entityName](PLVisualSearchAttributes, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = CFSTR("adjustmentVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("vsAdjustmentVersion"), 900, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v5;
  v58[1] = CFSTR("algorithmVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("vsAlgorithmVersion"), 100, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v6;
  v58[2] = CFSTR("stickerConfidenceAlgorithmVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("vsStickerConfidenceAlgorithmVersion"), 100, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v7;
  v58[3] = CFSTR("visualSearchData");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v59[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", CFSTR("visualSearchAttributes"), v9, v4, 0, 1, v53);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v61[29] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 30);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (id)objc_msgSend(v11, "mutableCopy");

  if (objc_msgSend((id)objc_opt_class(), "shouldIncludeOCR"))
  {
    v56 = CFSTR("characterRecognitionAttributes");
    +[PLCharacterRecognitionAttributes entityName](PLCharacterRecognitionAttributes, "entityName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = CFSTR("adjustmentVersion");
    +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("crAdjustmentVersion"), 900, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v13;
    v54[1] = CFSTR("algorithmVersion");
    +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("crAlgorithmVersion"), 100, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v14;
    v54[2] = CFSTR("characterRecognitionData");
    +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v55[2] = v15;
    v54[3] = CFSTR("machineReadableCodeData");
    +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("crMachineReadableCodeData"), 1000, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v55[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", CFSTR("characterRecognitionAttributes"), v17, v12, 0, 1, v52);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addEntriesFromDictionary:", v19);

  }
  return v51;
}

+ (id)modelPropertiesDescription
{
  PLJournalEntryPayloadPropertyInfoAssetCompute *v3;
  PLJournalEntryPayloadPropertyInfoAssetCompute *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
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
  void *v28;
  void *v29;
  void *v30;
  PLJournalEntryPayloadPropertyInfoAssetCompute *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  PLJournalEntryPayloadPropertyInfoAssetCompute *v38;
  void *v39;
  void *v40;
  void *v41;
  PLJournalEntryPayloadPropertyInfoAssetCompute *v42;
  void *v43;
  PLJournalEntryPayloadPropertyInfoAssetCompute *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _QWORD v74[3];
  _QWORD v75[3];
  _QWORD v76[3];
  _QWORD v77[3];
  _QWORD v78[6];
  _QWORD v79[6];
  _QWORD v80[22];
  _QWORD v81[22];
  _QWORD v82[11];
  _QWORD v83[13];

  v83[11] = *MEMORY[0x1E0C80C00];
  v3 = -[PLJournalEntryPayloadPropertyInfoAssetCompute initWithAnalysisStage:versionType:]([PLJournalEntryPayloadPropertyInfoAssetCompute alloc], "initWithAnalysisStage:versionType:", 100, 1);
  v4 = -[PLJournalEntryPayloadPropertyInfoAssetCompute initWithAnalysisStage:versionType:]([PLJournalEntryPayloadPropertyInfoAssetCompute alloc], "initWithAnalysisStage:versionType:", 200, 2);
  v31 = -[PLJournalEntryPayloadPropertyInfoAssetCompute initWithAnalysisStage:versionType:]([PLJournalEntryPayloadPropertyInfoAssetCompute alloc], "initWithAnalysisStage:versionType:", 900, 3);
  v44 = -[PLJournalEntryPayloadPropertyInfoAssetCompute initWithAnalysisStage:versionType:]([PLJournalEntryPayloadPropertyInfoAssetCompute alloc], "initWithAnalysisStage:versionType:", 0, 1);
  v42 = -[PLJournalEntryPayloadPropertyInfoAssetCompute initWithAnalysisStage:versionType:]([PLJournalEntryPayloadPropertyInfoAssetCompute alloc], "initWithAnalysisStage:versionType:", 0, 3);
  v82[0] = CFSTR("cloudAssetGUID");
  +[PLJournalEntryPayloadProperty payloadPropertyForUUID](PLJournalEntryPayloadProperty, "payloadPropertyForUUID");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v73;
  v82[1] = CFSTR("iconicScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v83[1] = v72;
  v82[2] = CFSTR("overallAestheticScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v83[2] = v71;
  v82[3] = CFSTR("stickerConfidenceScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v83[3] = v70;
  v82[4] = CFSTR("faceAdjustmentVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("assetFaceAdjustmentVersion"), 900, v4);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v83[4] = v69;
  v82[5] = CFSTR("mediaAnalysisAttributes");
  +[PLMediaAnalysisAssetAttributes entityName](PLMediaAnalysisAssetAttributes, "entityName");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mediaAnalysisAttributesPropertiesDictionary");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", CFSTR("mediaAnalysisAttributes"), v67, v68, 0, 1, 0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v83[5] = v66;
  v82[6] = CFSTR("computedAttributes");
  +[PLComputedAssetAttributes entityName](PLComputedAssetAttributes, "entityName");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = CFSTR("failureScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = v65;
  v80[1] = CFSTR("harmoniousColorScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v81[1] = v64;
  v80[2] = CFSTR("immersivenessScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v81[2] = v63;
  v80[3] = CFSTR("interactionScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v81[3] = v62;
  v80[4] = CFSTR("interestingSubjectScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v81[4] = v61;
  v80[5] = CFSTR("intrusiveObjectPresenceScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v81[5] = v60;
  v80[6] = CFSTR("livelyColorScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v81[6] = v59;
  v80[7] = CFSTR("lowLight");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v81[7] = v58;
  v80[8] = CFSTR("noiseScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v81[8] = v57;
  v80[9] = CFSTR("pleasantCameraTiltScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v81[9] = v56;
  v80[10] = CFSTR("pleasantCompositionScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v81[10] = v55;
  v80[11] = CFSTR("pleasantLightingScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v81[11] = v54;
  v80[12] = CFSTR("pleasantPatternScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v81[12] = v53;
  v80[13] = CFSTR("pleasantPerspectiveScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v81[13] = v52;
  v80[14] = CFSTR("pleasantPostProcessingScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v81[14] = v51;
  v80[15] = CFSTR("pleasantReflectionsScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v81[15] = v50;
  v80[16] = CFSTR("pleasantSymmetryScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v81[16] = v49;
  v80[17] = CFSTR("sharplyFocusedSubjectScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v81[17] = v47;
  v80[18] = CFSTR("tastefullyBlurredScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v81[18] = v46;
  v80[19] = CFSTR("wellChosenSubjectScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v81[19] = v45;
  v80[20] = CFSTR("wellFramedSubjectScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v81[20] = v43;
  v80[21] = CFSTR("wellTimedShotScore");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v81[21] = v41;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, v80, 22);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", CFSTR("computedAssetAttributes"), v40, v48, 0, 1, v3);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v83[6] = v39;
  v82[7] = CFSTR("additionalAttributes");
  +[PLAdditionalAssetAttributes entityName](PLAdditionalAssetAttributes, "entityName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = CFSTR("sceneAnalysisTimestamp");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v3;
  v79[0] = v37;
  v78[1] = CFSTR("sceneAnalysisVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v36;
  v78[2] = CFSTR("faceAnalysisVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v79[2] = v35;
  v78[3] = CFSTR("sceneClassifications");
  +[PLSceneClassification entityName](PLSceneClassification, "entityName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sceneClassificationPropertiesDescription");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", CFSTR("sceneClassifications"), v33, v34, 1, 1, v44);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v79[3] = v32;
  v78[4] = CFSTR("temporalSceneClassifications");
  +[PLSceneClassification entityName](PLSceneClassification, "entityName");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sceneClassificationPropertiesDescription");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", CFSTR("temporalSceneClassifications"), v29, v30, 1, 1, v42);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v79[4] = v28;
  v78[5] = CFSTR("sceneprint");
  +[PLSceneprint entityName](PLSceneprint, "entityName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = CFSTR("data");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("spData"), 1000, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v27;
  v76[1] = CFSTR("duplicateMatchingAlternateData");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("spDuplicateMatchingAlternateData"), 1000, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v77[1] = v26;
  v76[2] = CFSTR("duplicateMatchingData");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("spDuplicateMatchingData"), 1000, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v77[2] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", CFSTR("sceneprint"), v22, v23, 0, 1, v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v79[5] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", CFSTR("additionalAssetAttributes"), v20, v25, 0, 1, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v83[7] = v19;
  v82[8] = CFSTR("detectedFaces");
  +[PLDetectedFace entityName](PLDetectedFace, "entityName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "detectedFacePropertiesDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", CFSTR("detectedFaces"), v17, v18, 1, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v83[8] = v16;
  v82[9] = CFSTR("temporalDetectedFaces");
  +[PLDetectedFace entityName](PLDetectedFace, "entityName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "detectedFacePropertiesDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", CFSTR("temporalDetectedFaces"), v5, v15, 1, 1, v31);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v83[9] = v6;
  v82[10] = CFSTR("generatedAssetDescriptionNodes");
  +[PLGraphNode entityName](PLGraphNode, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = CFSTR("descriptionText");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v8;
  v74[1] = CFSTR("analysisVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v75[1] = v9;
  v74[2] = CFSTR("analysisSourceType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v75[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", CFSTR("generatedAssetDescriptions"), v11, v7, 1, 1, v31);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v83[10] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 11);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)modelProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PLAssetComputeSyncJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_41496 != -1)
    dispatch_once(&modelProperties_onceToken_41496, block);
  return (id)modelProperties_modelProperties_41497;
}

+ (id)persistedPropertyNamesForEntityNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PLAssetComputeSyncJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_41494 != -1)
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_41494, block);
  return (id)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_41495;
}

+ (id)payloadAdapterForManagedObject:(id)a3
{
  id v3;
  char isKindOfClass;
  __objc2_class **v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = off_1E3659270;
  if ((isKindOfClass & 1) == 0)
    v5 = off_1E3659278;
  v6 = (void *)objc_msgSend(objc_alloc(*v5), "initWithManagedObject:", v3);

  return v6;
}

+ (id)payloadClassID
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "entityName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("ComputeSync"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entityName
{
  return +[PLManagedAsset entityName](PLManagedAsset, "entityName");
}

+ (unsigned)payloadVersion
{
  return 1;
}

void __77__PLAssetComputeSyncJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "persistedPropertyNamesForEntityNamesFromModelProperties");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_41495;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_41495 = v1;

}

uint64_t __56__PLAssetComputeSyncJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "modelPropertiesDescription");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)modelProperties_modelProperties_41497;
  modelProperties_modelProperties_41497 = v2;

  return objc_msgSend(*(id *)(a1 + 32), "loadModelPropertiesDescription:parentPayloadProperty:", modelProperties_modelProperties_41497, 0);
}

@end
