@implementation TRIActivationEventDatabase

- (TRIActivationEventDatabase)initWithDatabase:(id)a3
{
  id v6;
  TRIActivationEventDatabase *v7;
  TRIActivationEventDatabase *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivationEventDatabase.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

  }
  v11.receiver = self;
  v11.super_class = (Class)TRIActivationEventDatabase;
  v7 = -[TRIActivationEventDatabase init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_db, a3);

  return v8;
}

- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)-[TRIDatabase readTransactionWithFailableBlock:](self->_db, "readTransactionWithFailableBlock:", a3);
}

- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)-[TRIDatabase writeTransactionWithFailableBlock:](self->_db, "writeTransactionWithFailableBlock:", a3);
}

- ($61A80719B04F7407D3E47539F1B23CAA)addRecordWithParentId:(id)a3 factorPackSetId:(id)a4 deploymentId:(int)a5 osBuild:(id)a6 languageCode:(id)a7 regionCode:(id)a8 carrierBundleId:(id)a9 carrierCountryCode:(id)a10 diagnosticsUsageEnabled:(BOOL)a11 hasAne:(BOOL)a12 aneVersion:(id)a13 transaction:(id)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  $61A80719B04F7407D3E47539F1B23CAA v42;
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
  id v60;
  void *v62;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  TRIActivationEventDatabase *v73;
  uint64_t *v74;
  int v75;
  BOOL v76;
  BOOL v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;

  v18 = a3;
  v19 = a4;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a13;
  v26 = a14;
  v27 = v18;
  if (v18)
  {
    if (v19)
      goto LABEL_3;
LABEL_19:
    v45 = v27;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivationEventDatabase.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetId"));

    v27 = v45;
    if (v20)
      goto LABEL_4;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivationEventDatabase.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentId"));

  v27 = 0;
  if (!v19)
    goto LABEL_19;
LABEL_3:
  if (v20)
    goto LABEL_4;
LABEL_20:
  v47 = v27;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivationEventDatabase.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("osBuild"));

  v27 = v47;
LABEL_4:
  v28 = v20;
  if (!v21)
  {
    v49 = v27;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivationEventDatabase.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("languageCode"));

    v27 = v49;
  }
  v29 = v21;
  if (!v22)
  {
    v51 = v27;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivationEventDatabase.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("regionCode"));

    v27 = v51;
  }
  v30 = v22;
  if (!v23)
  {
    v53 = v27;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivationEventDatabase.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("carrierBundleId"));

    v27 = v53;
  }
  v31 = v23;
  if (!v24)
  {
    v55 = v27;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivationEventDatabase.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("carrierCountryCode"));

    v27 = v55;
  }
  v32 = v24;
  v62 = v26;
  if (!v25)
  {
    v58 = v27;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivationEventDatabase.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("aneVersion"));

    v27 = v58;
  }
  v78 = 0;
  v79 = &v78;
  v80 = 0x2810000000;
  v81 = "";
  v82 = 0;
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __202__TRIActivationEventDatabase_addRecordWithParentId_factorPackSetId_deploymentId_osBuild_languageCode_regionCode_carrierBundleId_carrierCountryCode_diagnosticsUsageEnabled_hasAne_aneVersion_transaction___block_invoke;
  v64[3] = &unk_1E9331450;
  v60 = v27;
  v65 = v60;
  v33 = v19;
  v66 = v33;
  v75 = a5;
  v34 = v28;
  v67 = v34;
  v35 = v29;
  v68 = v35;
  v36 = v30;
  v69 = v36;
  v37 = v31;
  v70 = v37;
  v38 = v32;
  v71 = v38;
  v76 = a11;
  v77 = a12;
  v39 = v25;
  v72 = v39;
  v73 = self;
  v74 = &v78;
  v40 = MEMORY[0x1D8232C48](v64);
  v41 = (void *)v40;
  if (v26)
    (*(void (**)(uint64_t, id))(v40 + 16))(v40, v26);
  else
    -[TRIActivationEventDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v40);
  v42.var0 = v79[4];

  _Block_object_dispose(&v78, 8);
  return v42;
}

uint64_t __202__TRIActivationEventDatabase_addRecordWithParentId_factorPackSetId_deploymentId_osBuild_languageCode_regionCode_carrierBundleId_carrierCountryCode_diagnosticsUsageEnabled_hasAne_aneVersion_transaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  id v9;
  int v10;
  uint64_t v11;
  unsigned __int8 *v12;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  int v24;
  __int16 v25;

  v3 = a2;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __202__TRIActivationEventDatabase_addRecordWithParentId_factorPackSetId_deploymentId_osBuild_languageCode_regionCode_carrierBundleId_carrierCountryCode_diagnosticsUsageEnabled_hasAne_aneVersion_transaction___block_invoke_2;
  v15[3] = &unk_1E9331428;
  v16 = *(id *)(a1 + 32);
  v17 = *(id *)(a1 + 40);
  v24 = *(_DWORD *)(a1 + 112);
  v18 = *(id *)(a1 + 48);
  v19 = *(id *)(a1 + 56);
  v20 = *(id *)(a1 + 64);
  v21 = *(id *)(a1 + 72);
  v22 = *(id *)(a1 + 80);
  v25 = *(_WORD *)(a1 + 116);
  v23 = *(id *)(a1 + 88);
  v5 = *(void **)(*(_QWORD *)(a1 + 96) + 8);
  v14 = 0;
  objc_msgSend(v5, "generalErrorHandlerWithOutError:", &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  v8 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" INSERT OR IGNORE INTO activationEvents(    experimentId,     treatmentId,     deploymentId,     osBuild,     languageCode,     regionCode,     carrierBundleId,     carrierCountryCode,     diagnosticsUsageEnabled,     hasAne,     aneVersion) VALUES(    :experiment_id,     :treatment_id,     :deployment_id,     :os_build,     :language_code,     :region_code,     :carrier_bundle_id,     :carrier_country_code,     :diagnostics_usage_enabled,     :has_ane,     :ane_version);"),
         v15,
         0,
         v6);

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v3, "db");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = sqlite3_changes((sqlite3 *)objc_msgSend(v9, "handle"));

    if (v10)
      v11 = 1;
    else
      v11 = 2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 32) = v11;
    v12 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 32) = 0;
    v12 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  }

  return *v12;
}

void __202__TRIActivationEventDatabase_addRecordWithParentId_factorPackSetId_deploymentId_osBuild_languageCode_regionCode_carrierBundleId_carrierCountryCode_diagnosticsUsageEnabled_hasAne_aneVersion_transaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":experiment_id", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":treatment_id", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":deployment_id", *(int *)(a1 + 96));
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":os_build", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":language_code", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":region_code", *(_QWORD *)(a1 + 64));
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":carrier_bundle_id", *(_QWORD *)(a1 + 72));
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":carrier_country_code", *(_QWORD *)(a1 + 80));
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":diagnostics_usage_enabled", *(unsigned __int8 *)(a1 + 100));
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":has_ane", *(unsigned __int8 *)(a1 + 101));
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":ane_version", *(_QWORD *)(a1 + 88));

}

- (id)activationEventRecordWithParentId:(id)a3 factorPackSetId:(id)a4 deploymentId:(int)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  TRIActivationEventDatabase *v21;
  uint64_t *v22;
  SEL v23;
  int v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivationEventDatabase.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentId"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivationEventDatabase.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetId"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__11;
  v29 = __Block_byref_object_dispose__11;
  v30 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __93__TRIActivationEventDatabase_activationEventRecordWithParentId_factorPackSetId_deploymentId___block_invoke;
  v18[3] = &unk_1E93314C8;
  v12 = v9;
  v19 = v12;
  v13 = v11;
  v24 = a5;
  v20 = v13;
  v21 = self;
  v22 = &v25;
  v23 = a2;
  -[TRIActivationEventDatabase readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v18);
  v14 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v14;
}

uint64_t __93__TRIActivationEventDatabase_activationEventRecordWithParentId_factorPackSetId_deploymentId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 *v13;
  _QWORD v15[5];
  id v16;
  id v17;
  __int128 v18;
  int v19;
  _QWORD v20[4];
  id v21;
  id v22;
  int v23;

  v4 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __93__TRIActivationEventDatabase_activationEventRecordWithParentId_factorPackSetId_deploymentId___block_invoke_2;
  v20[3] = &unk_1E9331478;
  v21 = *(id *)(a1 + 32);
  v22 = *(id *)(a1 + 40);
  v23 = *(_DWORD *)(a1 + 72);
  v5 = a2;
  v6 = (void *)MEMORY[0x1D8232C48](v20);
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __93__TRIActivationEventDatabase_activationEventRecordWithParentId_factorPackSetId_deploymentId___block_invoke_3;
  v15[3] = &unk_1E93314A0;
  v15[4] = *(_QWORD *)(a1 + 48);
  v18 = *(_OWORD *)(a1 + 56);
  v16 = *(id *)(a1 + 32);
  v17 = *(id *)(a1 + 40);
  v19 = *(_DWORD *)(a1 + 72);
  v7 = (void *)MEMORY[0x1D8232C48](v15);
  objc_msgSend(v5, "db");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "generalErrorHandlerWithOutError:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" SELECT * FROM     activationEvents  WHERE         experimentId = :experiment_id    AND treatmentId = :treatment_id    AND deploymentId = :deployment_id"), v6, v7, v9);

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (v10)
  {
    v12 = *(void **)(v11 + 40);
    v13 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  }
  else
  {
    v12 = 0;
    v13 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  }
  objc_storeStrong((id *)(v11 + 40), v12);

  return *v13;
}

void __93__TRIActivationEventDatabase_activationEventRecordWithParentId_factorPackSetId_deploymentId___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":experiment_id", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":treatment_id", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":deployment_id", *(int *)(a1 + 48));

}

uint64_t __93__TRIActivationEventDatabase_activationEventRecordWithParentId_factorPackSetId_deploymentId___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unsigned __int8 *v18;
  void *v20;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnName:table:", "osBuild", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnName:table:", "languageCode", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnName:table:", "regionCode", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnName:table:", "carrierBundleId", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("TRIActivationEventDatabase.m"), 153, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[stmt getNSStringForColumnName:\"carrierBundleId\" table:nil]"));

  }
  objc_msgSend(v3, "getNSStringForColumnName:table:", "carrierCountryCode", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("TRIActivationEventDatabase.m"), 154, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[stmt getNSStringForColumnName:\"carrierCountryCode\" table:nil]"));

  }
  v9 = objc_msgSend(v3, "getIntegerForColumnName:table:", "diagnosticsUsageEnabled", 0);
  v10 = objc_msgSend(v3, "getIntegerForColumnName:table:", "hasAne", 0);
  objc_msgSend(v3, "getNSStringForColumnName:table:", "aneVersion", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("TRIActivationEventDatabase.m"), 157, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[stmt getNSStringForColumnName:\"aneVersion\" table:nil]"));

    if (v4)
      goto LABEL_7;
LABEL_11:
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = 0;
    goto LABEL_12;
  }
  if (!v4)
    goto LABEL_11;
LABEL_7:
  if (!v5 || !v6)
    goto LABEL_11;
  +[TRIActivationEventRecord recordWithParentId:factorPackSetId:deploymentId:osBuild:languageCode:regionCode:carrierBundleIdentifier:carrierCountryIsoCode:diagnosticsUsageEnabled:hasAne:aneVersion:](TRIActivationEventRecord, "recordWithParentId:factorPackSetId:deploymentId:osBuild:languageCode:regionCode:carrierBundleIdentifier:carrierCountryIsoCode:diagnosticsUsageEnabled:hasAne:aneVersion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 72), v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;
LABEL_12:

  v18 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v18;
}

- ($61A80719B04F7407D3E47539F1B23CAA)deleteRecordWithParentId:(id)a3 factorPackSetId:(id)a4 deploymentId:(int)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  $61A80719B04F7407D3E47539F1B23CAA v14;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  TRIActivationEventDatabase *v21;
  uint64_t *v22;
  int v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivationEventDatabase.m"), 192, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentId"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivationEventDatabase.m"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetId"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v24 = 0;
  v25 = &v24;
  v26 = 0x2810000000;
  v27 = "";
  v28 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __84__TRIActivationEventDatabase_deleteRecordWithParentId_factorPackSetId_deploymentId___block_invoke;
  v18[3] = &unk_1E93314F0;
  v12 = v9;
  v19 = v12;
  v13 = v11;
  v23 = a5;
  v20 = v13;
  v21 = self;
  v22 = &v24;
  -[TRIActivationEventDatabase writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v18);
  v14.var0 = v25[4];

  _Block_object_dispose(&v24, 8);
  return v14;
}

uint64_t __84__TRIActivationEventDatabase_deleteRecordWithParentId_factorPackSetId_deploymentId___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  int v8;
  uint64_t v9;
  unsigned __int8 *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  int v15;

  v3 = a2;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__TRIActivationEventDatabase_deleteRecordWithParentId_factorPackSetId_deploymentId___block_invoke_2;
  v12[3] = &unk_1E9331478;
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15 = *(_DWORD *)(a1 + 64);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "generalErrorHandlerWithOutError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" DELETE FROM     activationEvents  WHERE         experimentId = :experiment_id    AND treatmentId = :treatment_id    AND deploymentId = :deployment_id;"),
         v12,
         0,
         v5);

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v3, "db");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = sqlite3_changes((sqlite3 *)objc_msgSend(v7, "handle"));
    v9 = 1;
    if (v8 <= 0)
      v9 = 2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = v9;

    v10 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = 0;
    v10 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  }

  return *v10;
}

void __84__TRIActivationEventDatabase_deleteRecordWithParentId_factorPackSetId_deploymentId___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":experiment_id", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":treatment_id", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":deployment_id", *(int *)(a1 + 48));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
}

@end
