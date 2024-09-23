@implementation STMediaStatusDomainDisplayNameTransformer

- (id)transformedDataForData:(id)a3
{
  id v4;
  char isKindOfClass;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  STAttributedEntityBatchResolving *entityResolver;
  STAttributedEntityBatchResolving *v18;
  uint64_t v19;
  STAttributedEntityBatchResolving *v20;
  void *v21;
  STAttributedEntityBatchResolving *v22;
  void *v23;
  STAttributedEntityBatchResolving *v24;
  void *v25;
  STAttributedEntityBatchResolving *v26;
  void *v27;
  void *v29;
  void *v30;
  _QWORD v31[4];
  STAttributedEntityBatchResolving *v32;
  _QWORD v33[4];
  STAttributedEntityBatchResolving *v34;
  _QWORD v35[4];
  STAttributedEntityBatchResolving *v36;
  _QWORD v37[4];
  STAttributedEntityBatchResolving *v38;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v4;
  v7 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "microphoneAttributions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bs_map:", &__block_literal_global);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v10);

    objc_msgSend(v6, "mutedMicrophoneRecordingAttributions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bs_map:", &__block_literal_global_3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v12);

    objc_msgSend(v6, "systemAudioRecordingAttributions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bs_map:", &__block_literal_global_4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v14);

    objc_msgSend(v6, "cameraAttributions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bs_map:", &__block_literal_global_6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v16);

    if (self)
      entityResolver = self->_entityResolver;
    else
      entityResolver = 0;
    v18 = entityResolver;
    -[STAttributedEntityBatchResolving resolveEntities:](v18, "resolveEntities:", v8);
    v19 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_5;
    v37[3] = &unk_1E8E18040;
    v20 = v18;
    v38 = v20;
    objc_msgSend(v9, "bs_map:", v37);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v19;
    v35[1] = 3221225472;
    v30 = v9;
    v35[2] = __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_6;
    v35[3] = &unk_1E8E18068;
    v22 = v20;
    v36 = v22;
    objc_msgSend(v11, "bs_map:", v35);
    v29 = v11;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v19;
    v33[1] = 3221225472;
    v33[2] = __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_7;
    v33[3] = &unk_1E8E18068;
    v24 = v22;
    v34 = v24;
    objc_msgSend(v13, "bs_map:", v33);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v19;
    v31[1] = 3221225472;
    v31[2] = __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_8;
    v31[3] = &unk_1E8E18090;
    v32 = v24;
    v26 = v24;
    objc_msgSend(v15, "bs_map:", v31);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0DB0948]);
    objc_msgSend(v7, "setMicrophoneAttributions:", v21);
    objc_msgSend(v7, "setMutedMicrophoneRecordingAttributions:", v23);
    objc_msgSend(v7, "setSystemAudioRecordingAttributions:", v25);
    objc_msgSend(v7, "setCameraAttributions:", v27);

  }
  return v7;
}

id __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "activityAttribution");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  void *v14;

  v3 = a2;
  objc_msgSend(v3, "activityAttribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "resolveEntity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0DB0858]);
  objc_msgSend(v6, "attributedEntity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeEntity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithAttributedEntity:activeEntity:", v8, v9);

  v11 = objc_alloc(MEMORY[0x1E0DB0928]);
  objc_msgSend(v3, "maximumHistoryAccessed");
  v13 = v12;

  v14 = (void *)objc_msgSend(v11, "initWithActivityAttribution:maximumHistoryAccessed:", v10, v13);
  return v14;
}

id __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "activityAttribution");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v3 = a2;
  objc_msgSend(v3, "activityAttribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "resolveEntity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0DB0858]);
  objc_msgSend(v6, "attributedEntity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeEntity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithAttributedEntity:activeEntity:", v8, v9);

  v11 = objc_alloc(MEMORY[0x1E0DB0918]);
  objc_msgSend(v3, "cameraDescriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v11, "initWithCameraDescriptor:activityAttribution:", v12, v10);
  return v13;
}

- (STMediaStatusDomainDisplayNameTransformer)initWithEntityResolver:(id)a3
{
  id v5;
  STMediaStatusDomainDisplayNameTransformer *v6;
  STMediaStatusDomainDisplayNameTransformer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STMediaStatusDomainDisplayNameTransformer;
  v6 = -[STMediaStatusDomainDisplayNameTransformer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_entityResolver, a3);

  return v7;
}

uint64_t __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "attributedEntity");
}

uint64_t __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "attributedEntity");
}

id __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a2, "attributedEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resolveEntity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0DB0858]);
  objc_msgSend(v4, "attributedEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeEntity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithAttributedEntity:activeEntity:", v6, v7);

  return v8;
}

id __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a2, "attributedEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resolveEntity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0DB0858]);
  objc_msgSend(v4, "attributedEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeEntity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithAttributedEntity:activeEntity:", v6, v7);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityResolver, 0);
}

@end
