@implementation VCIntentDefinitionSyncState

+ (id)JSONKeyPathsByPropertyKey
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("databaseUUID");
  v3[1] = CFSTR("sequenceNumber");
  v4[0] = CFSTR("LSDatabaseUUID");
  v4[1] = CFSTR("LSDatabaseSequenceNumber");
  v3[2] = CFSTR("applications");
  v4[2] = CFSTR("applications");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)applicationsJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x1E0DD9C00], "transformerUsingForwardBlock:reverseBlock:", &__block_literal_global_6117, &__block_literal_global_102);
}

id __58__VCIntentDefinitionSyncState_applicationsJSONTransformer__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v5 = a2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__6118;
  v13 = __Block_byref_object_dispose__6119;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__VCIntentDefinitionSyncState_applicationsJSONTransformer__block_invoke_3;
  v8[3] = &unk_1E7AA7D18;
  v8[4] = &v9;
  objc_msgSend(v5, "if_compactMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    *a4 = objc_retainAutorelease((id)v10[5]);
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __58__VCIntentDefinitionSyncState_applicationsJSONTransformer__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  void *v7;
  id v8;
  id v9;
  id v10;

  v10 = 0;
  objc_msgSend(MEMORY[0x1E0DD9E08], "JSONDictionaryFromModel:error:", a3, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;
  v9 = v10;
  *a5 = v7;
  if (v9)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v8);

}

id __58__VCIntentDefinitionSyncState_applicationsJSONTransformer__block_invoke(uint64_t a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v5 = a2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__6118;
  v13 = __Block_byref_object_dispose__6119;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__VCIntentDefinitionSyncState_applicationsJSONTransformer__block_invoke_98;
  v8[3] = &unk_1E7AA7CD0;
  v8[4] = &v9;
  objc_msgSend(v5, "if_compactMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    *a4 = objc_retainAutorelease((id)v10[5]);
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __58__VCIntentDefinitionSyncState_applicationsJSONTransformer__block_invoke_98(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, _QWORD *a5)
{
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v7 = (void *)MEMORY[0x1E0DD9E08];
  v8 = a3;
  v12 = 0;
  objc_msgSend(v7, "modelOfClass:fromJSONDictionary:error:", objc_opt_class(), v8, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v12;
  v11 = v12;
  *a5 = v9;
  if (v11)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v10);

}

- (NSUUID)databaseUUID
{
  return self->_databaseUUID;
}

- (void)setDatabaseUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)applications
{
  return self->_applications;
}

- (void)setApplications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_sequenceNumber, 0);
  objc_storeStrong((id *)&self->_databaseUUID, 0);
}

@end
