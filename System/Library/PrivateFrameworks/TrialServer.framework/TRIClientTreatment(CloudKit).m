@implementation TRIClientTreatment(CloudKit)

+ (id)treatmentFromCKRecord:()CloudKit treatmentSize:
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v16;
  TRIClientTreatmentArtifact *v17;
  NSObject *v19;
  id v20;
  NSObject *v21;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  NSObject *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  *a4 = 0;
  objc_msgSend(v7, "values");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIClientTreatment+CloudKit.m"), 30, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("record.values"));

  }
  objc_msgSend(v8, "triStringValueForField:isNestedValue:", *MEMORY[0x1E0DC0DF8], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "triDataForField:", *MEMORY[0x1E0DC0DE8]);
    v10 = objc_claimAutoreleasedReturnValue();
    *a4 = -[NSObject length](v10, "length");
    objc_msgSend(v8, "triStringValueForField:isNestedValue:", *MEMORY[0x1E0DC0DF0], 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "triDataForField:", *MEMORY[0x1E0DC0DE0]);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v10)
      v14 = v11 == 0;
    else
      v14 = 1;
    if (v14 || v12 == 0)
    {
      TRILogCategory_Server();
      v17 = (TRIClientTreatmentArtifact *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v9;
        _os_log_error_impl(&dword_1D207F000, &v17->super, OS_LOG_TYPE_ERROR, "could not create treatment artifact from CloudKit record for %@ due to missing fields", buf, 0xCu);
      }
      v16 = 0;
    }
    else
    {
      v17 = -[TRIClientTreatmentArtifact initWithEncodedTreatmentDefinition:encodedTreatmentDefinitionSignature:publicCertificate:]([TRIClientTreatmentArtifact alloc], "initWithEncodedTreatmentDefinition:encodedTreatmentDefinitionSignature:publicCertificate:", v10, v11, v12);
      if (-[TRIClientTreatmentArtifact isValidWithTreatmentId:](v17, "isValidWithTreatmentId:", v9))
      {
        v25 = 0;
        objc_msgSend(MEMORY[0x1E0DC0EA8], "parseFromData:error:", v10, &v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v25;
        if (v16)
        {
          v20 = v16;
        }
        else
        {
          TRILogCategory_Server();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v7, "recordID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v27 = v24;
            v28 = 2114;
            v29 = v19;
            _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, "could not parse TRIClientTreatment from CloudKit record %@: %{public}@", buf, 0x16u);

          }
        }

      }
      else
      {
        TRILogCategory_Server();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v9;
          _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "invalid signature for treatment id %@", buf, 0xCu);
        }
        v16 = 0;
      }

    }
  }
  else
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "could not get treatmentId from CloudKit record", buf, 2u);
    }
    v16 = 0;
  }

  return v16;
}

+ (id)assetURLsFromCKRecord:()CloudKit assetIndexes:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "values");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIClientTreatment+CloudKit.m"), 76, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("record.values"));

  }
  objc_msgSend(v9, "triDataForField:", *MEMORY[0x1E0DC0DE0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[TRISignatureKey keyFromData:](TRISignatureKey, "keyFromData:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v22 = 0;
      v23 = &v22;
      v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__8;
      v26 = __Block_byref_object_dispose__8;
      v27 = (id)objc_opt_new();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __67__TRIClientTreatment_CloudKit__assetURLsFromCKRecord_assetIndexes___block_invoke;
      v15[3] = &unk_1E9330E50;
      v16 = v9;
      v19 = &v22;
      v20 = a2;
      v21 = a1;
      v17 = v11;
      v18 = v7;
      objc_msgSend(v8, "enumerateRangesUsingBlock:", v15);
      v12 = (id)v23[5];

      _Block_object_dispose(&v22, 8);
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
