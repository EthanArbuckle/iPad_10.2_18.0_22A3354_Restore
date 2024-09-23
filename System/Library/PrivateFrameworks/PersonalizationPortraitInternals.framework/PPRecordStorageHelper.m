@implementation PPRecordStorageHelper

void __81__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_groupIds_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNonnullNSString:", ":bundleId", v3);
  objc_msgSend(v4, "bindNamedParam:toNonnullNSString:", ":domain", *(_QWORD *)(a1 + 40));

}

- (BOOL)deleteAllRecordsSourcedFromBundleId:(id)a3 groupIds:(id)a4 txnWitness:(id)a5 atLeastOneRecordClusterRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  BOOL *v22;
  unint64_t *v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v15, "db");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __131__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_groupIds_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke;
    v18[3] = &unk_1E7E16D38;
    v18[4] = self;
    v19 = v13;
    v20 = v14;
    v21 = v15;
    v22 = a6;
    v23 = a7;
    objc_msgSend(v16, "writeTransaction:", v18);

  }
  else
  {
    if (a6)
      *a6 = 0;
    if (a7)
      *a7 = 0;
  }

  return 1;
}

void __141__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_groupIds_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  int v14;

  objc_msgSend(*(id *)(a1 + 32), "rowIdsForRecordsSourcedFromBundleId:groupIds:txnWitness:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT id FROM %@ AS rt WHERE rt.id IN _pas_nsindexset(:unfilteredRowIds) AND rt.algorithm = :algorithm"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "UTF8String");
  objc_msgSend(*(id *)(a1 + 56), "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __141__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_groupIds_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke_2;
  v12[3] = &unk_1E7E16CE8;
  v13 = v2;
  v14 = *(_DWORD *)(a1 + 80);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __141__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_groupIds_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke_3;
  v9[3] = &unk_1E7E16AC8;
  v10 = v3;
  v11 = v4;
  v6 = v3;
  v7 = v2;
  objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", v8, v12, v9, 0);

  objc_msgSend(*(id *)(a1 + 32), "deleteRecordsForRowIds:txnWitness:atLeastOneClusterRemoved:deletedCount:", v6, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

void __81__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_groupIds_txnWitness___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id obj;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "UTF8String");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = *(id *)(a1 + 40);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 48), "db");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = v6;
        v15[1] = 3221225472;
        v15[2] = __81__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_groupIds_txnWitness___block_invoke_2;
        v15[3] = &unk_1E7E189A0;
        v10 = *(_QWORD *)(a1 + 56);
        v16 = *(id *)(a1 + 64);
        v17 = v8;
        v12[0] = v6;
        v12[1] = 3221225472;
        v12[2] = __81__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_groupIds_txnWitness___block_invoke_3;
        v12[3] = &unk_1E7E16AC8;
        v13 = *(id *)(a1 + 72);
        v14 = v2;
        objc_msgSend(v9, "prepAndRunQuery:onPrep:onRow:onError:", v10, v15, v12, 0);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }

}

- (id)rowIdsForRecordsSourcedFromBundleId:(id)a3 groupIds:(id)a4 txnWitness:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT rt.id FROM %@ AS rt INNER JOIN sources AS src ON rt.source_id = src.id WHERE src.bundle_id = :bundleId AND (src.group_id = :domain OR (src.group_id >= :domain || '.' AND src.group_id < :domain || '/'))"), self->_table);
  objc_msgSend(v12, "_pas_stringBackedByUTF8CString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "db");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __81__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_groupIds_txnWitness___block_invoke;
  v23[3] = &unk_1E7E1ED60;
  v23[4] = self;
  v24 = v9;
  v25 = v10;
  v26 = v13;
  v27 = v8;
  v15 = v11;
  v28 = v15;
  v16 = v8;
  v17 = v13;
  v18 = v10;
  v19 = v9;
  objc_msgSend(v14, "readTransaction:", v23);

  v20 = v28;
  v21 = v15;

  return v21;
}

void __131__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_groupIds_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = (void *)a1[4];
  objc_msgSend(v2, "rowIdsForRecordsSourcedFromBundleId:groupIds:txnWitness:", a1[5], a1[6], a1[7]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteRecordsForRowIds:txnWitness:atLeastOneClusterRemoved:deletedCount:", v3, a1[7], a1[8], a1[9]);

}

- (void)deleteRecordsForRowIds:(id)a3 txnWitness:(id)a4 atLeastOneClusterRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  unint64_t v36;
  NSObject *v37;
  void *v38;
  PPDKStorage *duetStorage;
  _DKEventStream *duetStream;
  BOOL v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  int v56;
  NSObject *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  unint64_t *v64;
  void *v65;
  BOOL *v66;
  void *v67;
  _QWORD v68[5];
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[5];
  id v74;
  _QWORD v75[4];
  id v76;
  _QWORD v77[4];
  id v78;
  _QWORD v79[4];
  id v80;
  _QWORD v81[4];
  id v82;
  id v83;
  _QWORD v84[4];
  id v85;
  _QWORD v86[5];
  _QWORD v87[4];
  id v88;
  uint8_t v89[8];
  uint64_t v90;
  uint64_t (*v91)(uint64_t, void *);
  void *v92;
  id v93;
  id v94;
  id v95;
  _BYTE buf[24];
  char v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v67 = v10;
  if (objc_msgSend(v10, "count"))
  {
    v64 = a6;
    v66 = a5;
    if (a5)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT %@ AS clusterIdent FROM %@ WHERE id IN _pas_nsindexset(:rowIds)"), self->_clusterIdentifierColumn, self->_table);
      v13 = (void *)objc_opt_new();
      objc_msgSend(v11, "db");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x1E0C809B0];
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke;
      v79[3] = &unk_1E7E1F040;
      v16 = v10;
      v80 = v16;
      v77[0] = v15;
      v77[1] = 3221225472;
      v77[2] = __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke_2;
      v77[3] = &unk_1E7E1F120;
      v17 = v13;
      v78 = v17;
      objc_msgSend(v14, "prepAndRunQuery:onPrep:onRow:onError:", v12, v79, v77, 0);

      v18 = v78;
      v19 = v17;

      v65 = v19;
      v20 = v16;
      v21 = v11;
    }
    else
    {
      v22 = v10;
      v23 = v11;
      v65 = 0;
      if (!self)
      {
LABEL_26:

        v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT source_id, COUNT(source_id) FROM %@ WHERE id IN _pas_nsindexset(:rowIds) GROUP BY source_id"), self->_table);
        objc_msgSend(v11, "db");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = MEMORY[0x1E0C809B0];
        v75[0] = MEMORY[0x1E0C809B0];
        v75[1] = 3221225472;
        v75[2] = __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke_3;
        v75[3] = &unk_1E7E1F040;
        v51 = v67;
        v76 = v51;
        v73[0] = v50;
        v73[1] = 3221225472;
        v73[2] = __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke_4;
        v73[3] = &unk_1E7E195F0;
        v73[4] = self;
        v52 = v11;
        v74 = v52;
        objc_msgSend(v49, "prepAndRunQuery:onPrep:onRow:onError:", v48, v75, v73, 0);

        objc_msgSend(v52, "db");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM %@ WHERE id IN _pas_nsindexset(:rowIds)"), self->_table);
        v71[0] = MEMORY[0x1E0C809B0];
        v71[1] = 3221225472;
        v71[2] = __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke_5;
        v71[3] = &unk_1E7E1F040;
        v72 = v51;
        objc_msgSend(v53, "prepAndRunQuery:onPrep:onRow:onError:", v54, v71, 0, 0);

        if (v64)
        {
          objc_msgSend(v52, "db");
          v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v56 = sqlite3_changes((sqlite3 *)objc_msgSend(v55, "handle"));

          if (v56 < 0)
          {
            pp_default_log_handle();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)v89 = 67109120;
              *(_DWORD *)&v89[4] = v56;
              _os_log_fault_impl(&dword_1C392E000, v57, OS_LOG_TYPE_FAULT, "Negative number of deletions found: %d", v89, 8u);
            }

          }
          *v64 = v56;
        }
        -[PPSourceStorage pruneSourcesWithNoReferencesWithTxnWitness:](self->_sourceStorage, "pruneSourcesWithNoReferencesWithTxnWitness:", v52);
        if (v66)
        {
          if (!v65)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPRecordStorageHelper.m"), 1423, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clusterIdentSet"));

          }
          *v66 = 0;
          v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT touched.value AS touchedId, remaining.%@ as remainingId FROM _pas_nsset(:clusterIdentSet) AS touched LEFT JOIN %@ AS remaining ON touchedId = remainingId WHERE remainingId IS NULL"), self->_clusterIdentifierColumn, self->_table);
          objc_msgSend(v52, "db");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = MEMORY[0x1E0C809B0];
          v69[0] = MEMORY[0x1E0C809B0];
          v69[1] = 3221225472;
          v69[2] = __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke_224;
          v69[3] = &unk_1E7E1F040;
          v70 = v65;
          v68[0] = v60;
          v68[1] = 3221225472;
          v68[2] = __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke_2_226;
          v68[3] = &__block_descriptor_40_e49___PASDBIterAction__B_16__0___PASSqliteStatement_8l;
          v68[4] = v66;
          objc_msgSend(v59, "prepAndRunQuery:onPrep:onRow:onError:", v58, v69, v68, 0);

        }
        goto LABEL_37;
      }
    }
    if (self->_duetStream && objc_msgSend(v67, "count"))
    {
      v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT dk_event_id FROM %@ WHERE is_remote = 0 AND dk_event_id IS NOT NULL AND id IN _pas_nsindexset(:rowIds)"), self->_table);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v97 = 0;
      objc_msgSend(v11, "db");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = MEMORY[0x1E0C809B0];
      v87[0] = MEMORY[0x1E0C809B0];
      v87[1] = 3221225472;
      v87[2] = __61__PPRecordStorageHelper__deleteDKEventsForRowIds_txnWitness___block_invoke;
      v87[3] = &unk_1E7E1F040;
      v27 = v67;
      v88 = v27;
      v86[0] = v26;
      v86[1] = 3221225472;
      v86[2] = __61__PPRecordStorageHelper__deleteDKEventsForRowIds_txnWitness___block_invoke_2;
      v86[3] = &unk_1E7E1BB80;
      v86[4] = buf;
      objc_msgSend((id)v25, "prepAndRunQuery:onPrep:onRow:onError:", v24, v87, v86, 0);
      v62 = (void *)v24;

      LOBYTE(v25) = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) == 0;
      _Block_object_dispose(buf, 8);
      if ((v25 & 1) == 0)
      {
        v84[0] = MEMORY[0x1E0C809B0];
        v84[1] = 3221225472;
        v84[2] = __61__PPRecordStorageHelper__deleteDKEventsForRowIds_txnWitness___block_invoke_3;
        v84[3] = &unk_1E7E1F040;
        v85 = v27;
        +[PPSQLDatabase createTempTableContainingRowsFromQuery:descriptiveTableName:txnWitness:bind:](PPSQLDatabase, "createTempTableContainingRowsFromQuery:descriptiveTableName:txnWitness:bind:", v24, CFSTR("del_dk_evt"), v11, v84);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        do
        {
          v29 = (void *)objc_opt_new();
          v30 = (void *)objc_opt_new();
          objc_msgSend(v11, "db");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT rowid, dk_event_id FROM %@ LIMIT :batchSize"), v28);
          *(_QWORD *)v89 = MEMORY[0x1E0C809B0];
          v90 = 3221225472;
          v91 = __61__PPRecordStorageHelper__deleteDKEventsForRowIds_txnWitness___block_invoke_5;
          v92 = &unk_1E7E1DB68;
          v33 = v29;
          v93 = v33;
          v34 = v28;
          v94 = v34;
          v35 = v30;
          v95 = v35;
          objc_msgSend(v31, "prepAndRunQuery:onPrep:onRow:onError:", v32, &__block_literal_global_242, v89, 0);

          v36 = objc_msgSend(v33, "count");
          if (objc_msgSend(v35, "count"))
          {
            pp_default_log_handle();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              v46 = objc_msgSend(v35, "count");
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)&buf[4] = v46;
              _os_log_debug_impl(&dword_1C392E000, v37, OS_LOG_TYPE_DEBUG, "Propagating deletion of %tu _DKEvents", buf, 0xCu);
            }

            objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForObjectsWithUUIDs:", v35);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            duetStorage = self->_duetStorage;
            duetStream = self->_duetStream;
            v83 = 0;
            v41 = -[PPDKStorage deleteAllEventsInEventStream:matchingPredicate:error:](duetStorage, "deleteAllEventsInEventStream:matchingPredicate:error:", duetStream, v38, &v83);
            v42 = v83;
            if (!v41)
            {
              pp_default_log_handle();
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                v47 = objc_msgSend(v35, "count");
                *(_DWORD *)buf = 134218242;
                *(_QWORD *)&buf[4] = v47;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v42;
                _os_log_error_impl(&dword_1C392E000, v43, OS_LOG_TYPE_ERROR, "Failed to delete %tu _DKEvents: %@", buf, 0x16u);
              }

            }
          }
          if (objc_msgSend(v33, "count"))
          {
            objc_msgSend(v11, "db");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM %@ WHERE rowid IN _pas_nsarray(:batchRowIds)"), v34);
            v81[0] = MEMORY[0x1E0C809B0];
            v81[1] = 3221225472;
            v81[2] = __61__PPRecordStorageHelper__deleteDKEventsForRowIds_txnWitness___block_invoke_247;
            v81[3] = &unk_1E7E1F040;
            v82 = v33;
            objc_msgSend(v44, "prepAndRunQuery:onPrep:onRow:onError:", v45, v81, 0, 0);

          }
        }
        while (v36 > 0xC7);
        +[PPSQLDatabase dropTableWithName:txnWitness:](PPSQLDatabase, "dropTableWithName:txnWitness:", v34, v11);

      }
    }
    goto LABEL_26;
  }
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
LABEL_37:

}

- (BOOL)deleteAllRecordsSourcedFromBundleId:(id)a3 groupIds:(id)a4 algorithm:(unsigned int)a5 txnWitness:(id)a6 atLeastOneRecordClusterRemoved:(BOOL *)a7 deletedCount:(unint64_t *)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  BOOL *v24;
  unint64_t *v25;
  unsigned int v26;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  if (objc_msgSend(v16, "count"))
  {
    objc_msgSend(v17, "db");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __141__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_groupIds_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke;
    v20[3] = &unk_1E7E16D88;
    v20[4] = self;
    v21 = v15;
    v22 = v16;
    v26 = a5;
    v23 = v17;
    v24 = a7;
    v25 = a8;
    objc_msgSend(v18, "writeTransaction:", v20);

  }
  else
  {
    if (a7)
      *a7 = 0;
    if (a8)
      *a8 = 0;
  }

  return 1;
}

void __141__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_groupIds_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSIndexSet:", ":unfilteredRowIds", v3);
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":algorithm", *(unsigned int *)(a1 + 40));

}

uint64_t __72__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNonnullNSString:", ":bundleId", *(_QWORD *)(a1 + 32));
}

void __132__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned int *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":algorithm", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":bundleId", *(_QWORD *)(a1 + 32));

}

void __122__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = (void *)a1[4];
  objc_msgSend(v2, "rowIdsForRecordsSourcedFromBundleId:txnWitness:", a1[5], a1[6]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteRecordsForRowIds:txnWitness:atLeastOneClusterRemoved:deletedCount:", v3, a1[6], a1[7], a1[8]);

}

- (id)rowIdsForRecordsSourcedFromBundleId:(id)a3 txnWitness:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  const char *v19;
  _QWORD v20[4];
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT rt.id FROM %@ AS rt INNER JOIN sources AS src ON rt.source_id = src.id WHERE src.bundle_id = :bundleId"), self->_table);
  v10 = (void *)MEMORY[0x1C3BD6630]();
  v11 = -[NSString UTF8String](self->_table, "UTF8String");
  objc_msgSend(v7, "db");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __72__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_txnWitness___block_invoke;
  v20[3] = &unk_1E7E1F040;
  v14 = v6;
  v21 = v14;
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __72__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_txnWitness___block_invoke_2;
  v17[3] = &unk_1E7E16AC8;
  v15 = v8;
  v18 = v15;
  v19 = v11;
  objc_msgSend(v12, "prepAndRunQuery:onPrep:onRow:onError:", v9, v20, v17, 0);

  objc_autoreleasePoolPop(v10);
  return v15;
}

- (BOOL)deleteAllRecordsSourcedFromBundleId:(id)a3 txnWitness:(id)a4 atLeastOneRecordClusterRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL *v20;
  unint64_t *v21;

  v11 = a3;
  v12 = a4;
  objc_msgSend(v12, "db");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __122__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke;
  v17[3] = &unk_1E7E1A1D0;
  v17[4] = self;
  v18 = v11;
  v19 = v12;
  v20 = a5;
  v21 = a6;
  v14 = v12;
  v15 = v11;
  objc_msgSend(v13, "writeTransaction:", v17);

  return 1;
}

- (BOOL)deleteAllRecordsSourcedFromBundleId:(id)a3 algorithm:(unsigned int)a4 txnWitness:(id)a5 atLeastOneRecordClusterRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8
{
  id v13;
  objc_class *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  unsigned int v21;

  v13 = a3;
  v14 = (objc_class *)MEMORY[0x1E0CB3940];
  v15 = a5;
  v16 = (void *)objc_msgSend([v14 alloc], "initWithFormat:", CFSTR("SELECT rt.id FROM %@ AS rt INNER JOIN sources AS src ON rt.source_id = src.id WHERE rt.algorithm = :algorithm AND src.bundle_id = :bundleId"), self->_table);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __132__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke;
  v19[3] = &unk_1E7E16CE8;
  v21 = a4;
  v20 = v13;
  v17 = v13;
  -[PPRecordStorageHelper _deleteRecordsWithRowIdsFromQuery:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:bind:](self, v16, v15, (uint64_t)a6, (uint64_t)a7, v19);

  return 1;
}

- (void)_deleteRecordsWithRowIdsFromQuery:(void *)a3 txnWitness:(uint64_t)a4 atLeastOneRecordClusterRemoved:(uint64_t)a5 deletedCount:(void *)a6 bind:
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  if (a1)
  {
    v11 = a6;
    v12 = a3;
    v13 = a2;
    v14 = (void *)objc_opt_new();
    objc_msgSend(v12, "db");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __119__PPRecordStorageHelper__deleteRecordsWithRowIdsFromQuery_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_bind___block_invoke;
    v17[3] = &unk_1E7E1F120;
    v18 = v14;
    v16 = v14;
    objc_msgSend(v15, "prepAndRunQuery:onPrep:onRow:onError:", v13, v11, v17, 0);

    objc_msgSend(a1, "deleteRecordsForRowIds:txnWitness:atLeastOneClusterRemoved:deletedCount:", v16, v12, a4, a5);
  }
}

- (PPRecordStorageHelper)initWithName:(id)a3 table:(id)a4 clusterIdentifierColumn:(id)a5 maxRecords:(unsigned int)a6 duetStorage:(id)a7 duetStream:(id)a8 sourceStorage:(id)a9
{
  id v15;
  id v16;
  id v17;
  PPRecordStorageHelper *v18;
  PPRecordStorageHelper *v19;
  uint64_t v20;
  NSString *feedbackTable;
  uint64_t v22;
  NSString *lastDuetImportDateKey;
  uint64_t v24;
  NSString *lastDuetDeletionDateKey;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v15 = a3;
  v16 = a4;
  v29 = a5;
  v28 = a7;
  v27 = a8;
  v17 = a9;
  v30.receiver = self;
  v30.super_class = (Class)PPRecordStorageHelper;
  v18 = -[PPRecordStorageHelper init](&v30, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_table, a4);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_fb_pseudocounts"), v16, v27, v28, v29);
    feedbackTable = v19->_feedbackTable;
    v19->_feedbackTable = (NSString *)v20;

    objc_storeStrong((id *)&v19->_clusterIdentifierColumn, a5);
    v19->_maxRecords = a6;
    objc_storeStrong((id *)&v19->_duetStorage, a7);
    objc_storeStrong((id *)&v19->_duetStream, a8);
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("lastDK%@ImportDate"), v15);
    lastDuetImportDateKey = v19->_lastDuetImportDateKey;
    v19->_lastDuetImportDateKey = (NSString *)v22;

    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("lastDK%@DeletionDate"), v15);
    lastDuetDeletionDateKey = v19->_lastDuetDeletionDateKey;
    v19->_lastDuetDeletionDateKey = (NSString *)v24;

    objc_storeStrong((id *)&v19->_sourceStorage, a9);
  }

  return v19;
}

- (id)blobFromUUID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0C99DF0];
  v4 = a3;
  v5 = objc_retainAutorelease((id)objc_msgSend([v3 alloc], "initWithLength:", 16));
  objc_msgSend(v4, "getUUIDBytes:", objc_msgSend(v5, "mutableBytes"));

  return v5;
}

- (id)uuidForStatement:(id)a3 columnName:(const char *)a4 tableName:(const char *)a5
{
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "getNSDataForColumnName:table:", a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length") == 16)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v7), "bytes"));
  }
  else
  {
    pp_default_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315650;
      v12 = a4;
      v13 = 2080;
      v14 = a5;
      v15 = 2048;
      v16 = objc_msgSend(v7, "length");
      _os_log_error_impl(&dword_1C392E000, v9, OS_LOG_TYPE_ERROR, "column '%s' in table '%s' has blob of unexpected length %tu", (uint8_t *)&v11, 0x20u);
    }

    v8 = 0;
  }

  return v8;
}

- (BOOL)clearWithDatabase:(id)a3 client:(unsigned __int8)a4 deletedCount:(unint64_t *)a5 error:(id *)a6 clearExternalTableReferences:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  PPDKStorage *duetStorage;
  char v15;
  NSObject *v16;
  void *v18;
  _QWORD v19[5];
  id v20;
  unint64_t *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v9 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v12 = a7;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __98__PPRecordStorageHelper_clearWithDatabase_client_deletedCount_error_clearExternalTableReferences___block_invoke;
  v19[3] = &unk_1E7E169B0;
  v13 = v12;
  v19[4] = self;
  v20 = v13;
  v21 = a5;
  objc_msgSend(a3, "writeTransactionWithClient:block:", v9, v19);
  duetStorage = self->_duetStorage;
  if (duetStorage)
  {
    v15 = -[PPDKStorage deleteAllEventsInEventStream:error:](duetStorage, "deleteAllEventsInEventStream:error:", self->_duetStream, a6);
  }
  else
  {
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      -[_DKEventStream name](self->_duetStream, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v18;
      _os_log_debug_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEBUG, "Suppressing _DKKnowledge %@ clear due to dkSyncEnabled=NO.", buf, 0xCu);

    }
    v15 = 1;
  }

  return v15;
}

- (id)decayedFeedbackCountsForItemString:(id)a3 database:(id)a4 client:(unsigned __int8)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  PPDecayedFeedbackCounts *v13;
  PPDecayedFeedbackCounts *v14;
  NSObject *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  double *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  uint8_t buf[4];
  int v53;
  uint64_t v54;

  v5 = a5;
  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__4580;
  v46 = __Block_byref_object_dispose__4581;
  v47 = 0;
  v38 = 0;
  v39 = (double *)&v38;
  v40 = 0x2020000000;
  v41 = 0;
  v34 = 0;
  v35 = (double *)&v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = (double *)&v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0;
  v27 = (double *)&v26;
  v28 = 0x2020000000;
  v29 = 0;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT MAX(last_update_seconds_from_1970) AS latest_date,        SUM(CASE WHEN feedback_type = :engagedExplicitly THEN pseudocount END) AS engaged_explicitly,        SUM(CASE WHEN feedback_type = :engagedImplicitly THEN pseudocount END) AS engaged_implicitly,        SUM(CASE WHEN feedback_type = :rejectedExplicitly THEN pseudocount END) AS rejected_explicitly,        SUM(CASE WHEN feedback_type = :rejectedImplicitly THEN pseudocount END) AS rejected_implicitly FROM %@ WHERE item_string = :itemString"), self->_feedbackTable);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__PPRecordStorageHelper_decayedFeedbackCountsForItemString_database_client___block_invoke;
  v17[3] = &unk_1E7E16A00;
  v20 = &v48;
  v11 = v10;
  v18 = v11;
  v12 = v8;
  v19 = v12;
  v21 = &v42;
  v22 = &v38;
  v23 = &v34;
  v24 = &v30;
  v25 = &v26;
  objc_msgSend(v9, "readTransactionWithClient:block:", v5, v17);
  if (*((_BYTE *)v49 + 24))
  {
    v13 = [PPDecayedFeedbackCounts alloc];
    v14 = -[PPDecayedFeedbackCounts initWithLatestDate:engagedExplicitly:engagedImplicitly:rejectedExplicitly:rejectedImplicitly:](v13, "initWithLatestDate:engagedExplicitly:engagedImplicitly:rejectedExplicitly:rejectedImplicitly:", v43[5], v39[3], v35[3], v31[3], v27[3]);
  }
  else
  {
    pp_default_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v53 = v5;
      _os_log_error_impl(&dword_1C392E000, v15, OS_LOG_TYPE_ERROR, "Error accumulating feedback counts with database client %hhu", buf, 8u);
    }

    v14 = 0;
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
  return v14;
}

- (BOOL)storeFeedback:(id)a3 database:(id)a4 client:(unsigned __int8)a5 lowercaseItemStrings:(BOOL)a6 limit:(unsigned int)a7
{
  uint64_t v9;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  PPRecordStorageHelper *v24;
  uint64_t *v25;
  uint64_t v26;
  unsigned int v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  objc_msgSend(v12, "timestamp");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSince1970");
  v16 = v15;

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("INSERT INTO %@ (item_string, feedback_type, last_update_seconds_from_1970) VALUES (:itemString, :feedbackType, :lastUpdateSecondsFrom1970) ON CONFLICT(item_string, feedback_type) DO UPDATE SET pseudocount = pseudocount + 1, last_update_seconds_from_1970 = :lastUpdateSecondsFrom1970"), self->_feedbackTable);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __82__PPRecordStorageHelper_storeFeedback_database_client_lowercaseItemStrings_limit___block_invoke;
  v21[3] = &unk_1E7E16A78;
  v18 = v12;
  v27 = a7;
  v22 = v18;
  v25 = &v29;
  v19 = v17;
  v28 = a6;
  v26 = v16;
  v23 = v19;
  v24 = self;
  objc_msgSend(v13, "writeTransactionWithClient:block:", v9, v21);
  LOBYTE(v9) = *((_BYTE *)v30 + 24);

  _Block_object_dispose(&v29, 8);
  return v9;
}

- (BOOL)decayFeedbackWithDatabase:(id)a3 client:(unsigned __int8)a4 decayRate:(double)a5
{
  uint64_t v6;
  id v8;
  BOOL v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v6 = a4;
  v8 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__PPRecordStorageHelper_decayFeedbackWithDatabase_client_decayRate___block_invoke;
  v11[3] = &unk_1E7E16AA0;
  v11[4] = self;
  v11[5] = &v12;
  *(double *)&v11[6] = a5;
  if (objc_msgSend(v8, "writeTransactionWithClient:timeoutInSeconds:block:", v6, v11, 5.0))
    v9 = *((_BYTE *)v13 + 24) != 0;
  else
    v9 = 0;
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (void)truncateRecordsByDroppingOldestMakingRoomForCount:(unsigned int)a3 txnWitness:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  objc_msgSend(v6, "db");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__PPRecordStorageHelper_truncateRecordsByDroppingOldestMakingRoomForCount_txnWitness___block_invoke;
  v9[3] = &unk_1E7E1F1F8;
  v11 = a3;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "writeTransaction:", v9);

}

- (id)rowIdsForRecordsToDropMakingRoomForCount:(unsigned int)a3 txnWitness:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  SEL v18;
  unsigned int v19;

  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "db");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__PPRecordStorageHelper_rowIdsForRecordsToDropMakingRoomForCount_txnWitness___block_invoke;
  v15[3] = &unk_1E7E1CAE0;
  v19 = a3;
  v15[4] = self;
  v16 = v7;
  v18 = a2;
  v10 = v8;
  v17 = v10;
  v11 = v7;
  objc_msgSend(v9, "readTransaction:", v15);

  v12 = v17;
  v13 = v10;

  return v13;
}

- (id)duetEventDeletionProcessingBlockWithDatabase:(id)a3 client:(unsigned __int8)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD aBlock[4];
  id v11;
  PPRecordStorageHelper *v12;
  unsigned __int8 v13;

  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PPRecordStorageHelper_duetEventDeletionProcessingBlockWithDatabase_client___block_invoke;
  aBlock[3] = &unk_1E7E16B18;
  v13 = a4;
  v11 = v6;
  v12 = self;
  v7 = v6;
  v8 = _Block_copy(aBlock);

  return v8;
}

- (void)fixupDKEventsMetadataWithShouldContinueBlock:(id)a3 database:(id)a4 client:(unsigned __int8)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PPDKStorage *duetStorage;
  void *v26;
  uint64_t (**v27)(_QWORD);
  NSObject *v28;
  void *v29;
  id v30;
  _QWORD v31[5];
  _QWORD v32[4];
  NSObject *v33;
  PPRecordStorageHelper *v34;
  id v35;
  uint8_t v36[16];
  _QWORD v37[6];
  uint8_t buf[8];
  uint8_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _DKEventStream *duetStream;
  _QWORD v45[4];

  v5 = a5;
  v45[2] = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v8 = a4;
  v9 = v8;
  if (self)
  {
    *(_QWORD *)buf = 0;
    v39 = buf;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__4580;
    v42 = __Block_byref_object_dispose__4581;
    v43 = 0;
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __78__PPRecordStorageHelper__dkEventMetadataFixupHasCompletedWithDatabase_client___block_invoke;
    v37[3] = &unk_1E7E1EF00;
    v37[4] = self;
    v37[5] = buf;
    objc_msgSend(v8, "readTransactionWithClient:block:", v5, v37);
    v10 = (void *)*((_QWORD *)v39 + 5);
    if (v10)
    {
      v11 = objc_msgSend(v10, "BOOLValue");
      _Block_object_dispose(buf, 8);

      if (v11)
      {
        pp_default_log_handle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEBUG, "Skipping duet fix up as it has already been completed.", buf, 2u);
        }
        goto LABEL_20;
      }
    }
    else
    {
      pp_default_log_handle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v36 = 0;
        _os_log_debug_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEBUG, "PPRecordStorageHelper: metadata fix up has never occurred.", v36, 2u);
      }

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.PersonalizationPortrait.duetStreamFixup", 5);
  v12 = objc_claimAutoreleasedReturnValue();
  if (self->_duetStorage && self->_duetStream)
  {
    v14 = (void *)MEMORY[0x1C3BD6630]();
    v15 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForObjectsWithMetadataKey:", CFSTR("compatVersion"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "notPredicateWithSubpredicate:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v14);
    v18 = (void *)MEMORY[0x1C3BD6630]();
    v19 = (void *)MEMORY[0x1E0D15AD0];
    objc_msgSend(MEMORY[0x1E0D15920], "compatibilityVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "predicateForObjectsWithMetadataKey:", v20);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v18);
    v21 = (void *)MEMORY[0x1C3BD6630]();
    v22 = (void *)MEMORY[0x1E0CB3528];
    v45[0] = v17;
    v45[1] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "andPredicateWithSubpredicates:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v21);
    duetStorage = self->_duetStorage;
    duetStream = self->_duetStream;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &duetStream, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __86__PPRecordStorageHelper_fixupDKEventsMetadataWithShouldContinueBlock_database_client___block_invoke;
    v32[3] = &unk_1E7E16B68;
    v27 = (uint64_t (**)(_QWORD))v30;
    v35 = v27;
    v33 = v12;
    v34 = self;
    -[PPDKStorage iterEventBatchesMatchingPredicate:streams:sortDescriptors:batchSize:error:block:](duetStorage, "iterEventBatchesMatchingPredicate:streams:sortDescriptors:batchSize:error:block:", v24, v26, MEMORY[0x1E0C9AA60], 8, 0, v32);

    if ((v27[2](v27) & 1) != 0)
    {
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __86__PPRecordStorageHelper_fixupDKEventsMetadataWithShouldContinueBlock_database_client___block_invoke_126;
      v31[3] = &unk_1E7E1EEB0;
      v31[4] = self;
      objc_msgSend(v9, "writeTransactionWithClient:block:", v5, v31);
    }
    else
    {
      pp_default_log_handle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v28, OS_LOG_TYPE_DEFAULT, "Duet stream fix up deferring.", buf, 2u);
      }

    }
  }
  else
  {
    pp_default_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v17, OS_LOG_TYPE_INFO, "Not fixing up Duet stream as the stream or storage is nil.", buf, 2u);
    }
  }

LABEL_20:
}

- (void)importDuetEventsWithLimit:(unsigned int)a3 database:(id)a4 client:(unsigned __int8)a5 remoteEventsOnly:(BOOL)a6 isComplete:(BOOL *)a7 shouldContinueBlock:(id)a8 eventImportBlock:(id)a9
{
  _BOOL4 v11;
  uint64_t v12;
  id v15;
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
  PPDKStorage *duetStorage;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  NSObject *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD aBlock[4];
  id v40;
  PPRecordStorageHelper *v41;
  id v42;
  id v43;
  uint64_t *v44;
  BOOL *v45;
  unsigned int v46;
  char v47;
  _QWORD v48[5];
  id v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint8_t buf[4];
  id v58;
  void *v59;
  _DKEventStream *duetStream;
  _QWORD v61[5];

  v11 = a6;
  v12 = a5;
  v61[3] = *MEMORY[0x1E0C80C00];
  v37 = a4;
  v36 = a8;
  v15 = a9;
  if (self->_duetStorage)
  {
    v34 = v15;
    v51 = 0;
    v52 = &v51;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__4580;
    v55 = __Block_byref_object_dispose__4581;
    v56 = 0;
    v16 = (void *)objc_opt_new();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __132__PPRecordStorageHelper_importDuetEventsWithLimit_database_client_remoteEventsOnly_isComplete_shouldContinueBlock_eventImportBlock___block_invoke;
    v48[3] = &unk_1E7E16BF8;
    v48[4] = self;
    v35 = v16;
    v49 = v35;
    v50 = &v51;
    objc_msgSend(v37, "readTransactionWithClient:block:", v12, v48);
    if (v52[5])
      objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithStartDateAfter:");
    else
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v18 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(MEMORY[0x1E0D15A08], "predicateForEventsWithNullSourceDeviceID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "notPredicateWithSubpredicate:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForObjectsWithUUIDs:", v35);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "notPredicateWithSubpredicate:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x1E0CB3528];
    v61[0] = v17;
    v61[1] = v20;
    v61[2] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "andPredicateWithSubpredicates:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __132__PPRecordStorageHelper_importDuetEventsWithLimit_database_client_remoteEventsOnly_isComplete_shouldContinueBlock_eventImportBlock___block_invoke_2;
    aBlock[3] = &unk_1E7E16C48;
    v46 = a3;
    v45 = a7;
    v42 = v36;
    v47 = v12;
    v44 = &v51;
    v40 = v37;
    v41 = self;
    v43 = v34;
    v27 = _Block_copy(aBlock);
    v38 = 0;
    duetStorage = self->_duetStorage;
    duetStream = self->_duetStream;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &duetStream, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15A08], "startDateSortDescriptorAscending:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[PPDKStorage iterEventBatchesMatchingPredicate:streams:sortDescriptors:batchSize:error:block:](duetStorage, "iterEventBatchesMatchingPredicate:streams:sortDescriptors:batchSize:error:block:", v26, v29, v31, a3, &v38, v27);

    if (!v32)
    {
      pp_default_log_handle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v38;
        _os_log_error_impl(&dword_1C392E000, v33, OS_LOG_TYPE_ERROR, "Error while iterating through _DKEvents during importDuetEventsWithLimit: %@", buf, 0xCu);
      }

      if (a7)
        *a7 = 1;
    }

    _Block_object_dispose(&v51, 8);
    v15 = v34;
  }
  else if (a7)
  {
    *a7 = 1;
  }

}

- (void)disableSyncForBundleIds:(id)a3 txnWitness:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  int v23;
  NSObject *v24;
  uint64_t v25;
  NSString *table;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint64_t *v37;
  _QWORD aBlock[4];
  id v39;
  PPRecordStorageHelper *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  NSString *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v8 = (void *)objc_opt_new();
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PPRecordStorageHelper_disableSyncForBundleIds_txnWitness___block_invoke;
  aBlock[3] = &unk_1E7E1FCE8;
  v10 = v8;
  v39 = v10;
  v40 = self;
  v11 = _Block_copy(aBlock);
  v34[0] = v9;
  v34[1] = 3221225472;
  v34[2] = __60__PPRecordStorageHelper_disableSyncForBundleIds_txnWitness___block_invoke_150;
  v34[3] = &unk_1E7E16C98;
  v37 = &v41;
  v12 = v10;
  v35 = v12;
  v13 = v11;
  v36 = v13;
  v14 = _Block_copy(v34);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT rt.dk_event_id FROM %@ AS rt INNER JOIN sources AS src ON rt.source_id = src.id WHERE rt.is_remote = 0 AND rt.is_sync_eligible = 1 AND rt.dk_event_id IS NOT NULL AND src.bundle_id IN _pas_nsset(:bundleIds)"), self->_table);
  objc_msgSend(v7, "db");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v9;
  v32[1] = 3221225472;
  v32[2] = __60__PPRecordStorageHelper_disableSyncForBundleIds_txnWitness___block_invoke_2;
  v32[3] = &unk_1E7E1F040;
  v17 = v6;
  v33 = v17;
  v30[0] = v9;
  v30[1] = 3221225472;
  v30[2] = __60__PPRecordStorageHelper_disableSyncForBundleIds_txnWitness___block_invoke_3;
  v30[3] = &unk_1E7E16CC0;
  v30[4] = self;
  v18 = v14;
  v31 = v18;
  objc_msgSend(v16, "prepAndRunQuery:onPrep:onRow:onError:", v15, v32, v30, 0);

  v13[2](v13);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UPDATE %@ SET is_sync_eligible = 0 WHERE is_remote = 0 AND is_sync_eligible = 1 AND source_id IN (SELECT id FROM sources WHERE bundle_id IN _pas_nsset(:bundleIds))"), self->_table);
  objc_msgSend(v7, "db");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v9;
  v28[1] = 3221225472;
  v28[2] = __60__PPRecordStorageHelper_disableSyncForBundleIds_txnWitness___block_invoke_4;
  v28[3] = &unk_1E7E1F040;
  v21 = v17;
  v29 = v21;
  objc_msgSend(v20, "prepAndRunQuery:onPrep:onRow:onError:", v19, v28, 0, 0);

  objc_msgSend(v7, "db");
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v23 = sqlite3_changes((sqlite3 *)objc_msgSend(v22, "handle"));

  pp_default_log_handle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = objc_msgSend(v21, "count");
    table = self->_table;
    v27 = v42[3];
    *(_DWORD *)buf = 134218754;
    v46 = v25;
    v47 = 2112;
    v48 = table;
    v49 = 1024;
    v50 = v23;
    v51 = 2048;
    v52 = v27;
    _os_log_impl(&dword_1C392E000, v24, OS_LOG_TYPE_DEFAULT, "Disabled cloud sync for %tu bundleIds in %@: %d records modified, %tu _DKKnowledgeStore records deleted.", buf, 0x26u);
  }

  _Block_object_dispose(&v41, 8);
}

- (BOOL)deleteAllRecordsWithClusterIdentifier:(id)a3 txnWitness:(id)a4 atLeastOneRecordClusterRemoved:(BOOL *)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  id v11;
  objc_class *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;

  v11 = a3;
  v12 = (objc_class *)MEMORY[0x1E0CB3940];
  v13 = a4;
  v14 = (void *)objc_msgSend([v12 alloc], "initWithFormat:", CFSTR("SELECT rt.id FROM %@ AS rt WHERE rt.%@ = :clusterIdent"), self->_table, self->_clusterIdentifierColumn);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __124__PPRecordStorageHelper_deleteAllRecordsWithClusterIdentifier_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke;
  v17[3] = &unk_1E7E1F040;
  v18 = v11;
  v15 = v11;
  -[PPRecordStorageHelper _deleteRecordsWithRowIdsFromQuery:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:bind:](self, v14, v13, (uint64_t)a5, (uint64_t)a6, v17);

  return 1;
}

- (BOOL)deleteAllRecordsWithClusterIdentifier:(id)a3 algorithm:(unsigned int)a4 txnWitness:(id)a5 atLeastOneRecordClusterRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8
{
  id v13;
  objc_class *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  unsigned int v21;

  v13 = a3;
  v14 = (objc_class *)MEMORY[0x1E0CB3940];
  v15 = a5;
  v16 = (void *)objc_msgSend([v14 alloc], "initWithFormat:", CFSTR("SELECT rt.id FROM %@ AS rt WHERE rt.algorithm = :algorithm AND rt.%@ = :clusterIdent"), self->_table, self->_clusterIdentifierColumn);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __134__PPRecordStorageHelper_deleteAllRecordsWithClusterIdentifier_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke;
  v19[3] = &unk_1E7E16CE8;
  v21 = a4;
  v20 = v13;
  v17 = v13;
  -[PPRecordStorageHelper _deleteRecordsWithRowIdsFromQuery:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:bind:](self, v16, v15, (uint64_t)a6, (uint64_t)a7, v19);

  return 1;
}

- (BOOL)deleteAllRecordsWithName:(id)a3 algorithm:(unsigned int)a4 bundleId:(id)a5 groupId:(id)a6 category:(unsigned int)a7 beforeDate:(id)a8 txnWitness:(id)a9 atLeastOneRecordClusterRemoved:(BOOL *)a10 deletedCount:(unint64_t *)a11 error:(id *)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  objc_class *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  unsigned int v35;
  unsigned int v36;

  v18 = a3;
  v19 = a5;
  v20 = a6;
  v21 = a8;
  v22 = (objc_class *)MEMORY[0x1E0CB3940];
  v23 = a9;
  v24 = (void *)objc_msgSend([v22 alloc], "initWithFormat:", CFSTR("SELECT rt.id FROM %@ AS rt INNER JOIN sources src ON rt.source_id = src.id WHERE rt.algorithm = :algorithm AND rt.name = :name AND rt.category = :category AND src.group_id = :groupId AND src.bundle_id = :bundleId AND src.seconds_from_1970 <= :beforeDate"), self->_table);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __158__PPRecordStorageHelper_deleteAllRecordsWithName_algorithm_bundleId_groupId_category_beforeDate_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke;
  v30[3] = &unk_1E7E16D10;
  v35 = a4;
  v36 = a7;
  v31 = v18;
  v32 = v19;
  v33 = v20;
  v34 = v21;
  v25 = v21;
  v26 = v20;
  v27 = v19;
  v28 = v18;
  -[PPRecordStorageHelper _deleteRecordsWithRowIdsFromQuery:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:bind:](self, v24, v23, (uint64_t)a10, (uint64_t)a11, v30);

  return 1;
}

- (BOOL)deleteAllRecordsSourcedFromBundleId:(id)a3 documentIds:(id)a4 txnWitness:(id)a5 atLeastOneRecordClusterRemoved:(BOOL *)a6 deletedCount:(unint64_t *)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  BOOL *v22;
  unint64_t *v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v15, "db");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __134__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_documentIds_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke;
    v18[3] = &unk_1E7E16D38;
    v18[4] = self;
    v19 = v13;
    v20 = v14;
    v21 = v15;
    v22 = a6;
    v23 = a7;
    objc_msgSend(v16, "writeTransaction:", v18);

  }
  else
  {
    if (a6)
      *a6 = 0;
    if (a7)
      *a7 = 0;
  }

  return 1;
}

- (BOOL)deleteAllRecordsSourcedFromBundleId:(id)a3 documentIds:(id)a4 algorithm:(unsigned int)a5 txnWitness:(id)a6 atLeastOneRecordClusterRemoved:(BOOL *)a7 deletedCount:(unint64_t *)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  unsigned int v23;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  if (objc_msgSend(v16, "count"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT rt.id FROM %@ AS rt INNER JOIN sources AS src ON rt.source_id = src.id WHERE rt.algorithm = :algorithm AND src.bundle_id = :bundleId AND src.doc_id IN _pas_nsarray(:documentIds)"), self->_table);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __144__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_documentIds_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke;
    v20[3] = &unk_1E7E16D60;
    v23 = a5;
    v21 = v15;
    v22 = v16;
    -[PPRecordStorageHelper _deleteRecordsWithRowIdsFromQuery:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:bind:](self, v18, v17, (uint64_t)a7, (uint64_t)a8, v20);

  }
  else
  {
    if (a7)
      *a7 = 0;
    if (a8)
      *a8 = 0;
  }

  return 1;
}

- (BOOL)deleteAllRecordsSourcedFromBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 txnWitness:(id)a6 atLeastOneRecordClusterRemoved:(BOOL *)a7 deletedCount:(unint64_t *)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  BOOL *v30;
  unint64_t *v31;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  objc_msgSend(v18, "db");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __144__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_groupId_olderThanDate_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke;
  v25[3] = &unk_1E7E16DB0;
  v25[4] = self;
  v26 = v15;
  v27 = v16;
  v28 = v17;
  v29 = v18;
  v30 = a7;
  v31 = a8;
  v20 = v18;
  v21 = v17;
  v22 = v16;
  v23 = v15;
  objc_msgSend(v19, "writeTransaction:", v25);

  return 1;
}

- (BOOL)deleteAllRecordsSourcedFromBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 algorithm:(unsigned int)a6 txnWitness:(id)a7 atLeastOneRecordClusterRemoved:(BOOL *)a8 deletedCount:(unint64_t *)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  unsigned int v33;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT rt.id FROM %@ AS rt INNER JOIN sources AS src ON rt.source_id = src.id WHERE rt.algorithm = :algorithm AND src.seconds_from_1970 < :timestamp "), self->_table);
  if ((objc_msgSend(v16, "isEqualToString:", CFSTR("PortraitBundleIdWildCardMatchingAll")) & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v20, "stringByAppendingString:", CFSTR("AND src.bundle_id = :bundleId "));
    v22 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v21);
    v20 = (void *)v22;
  }
  if (v17)
  {
    v23 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v20, "stringByAppendingString:", CFSTR("AND src.group_id = :groupId"));
    v24 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v23);
    v20 = (void *)v24;
  }
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __154__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_groupId_olderThanDate_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke;
  v29[3] = &unk_1E7E16DD8;
  v33 = a6;
  v30 = v16;
  v31 = v18;
  v32 = v17;
  v25 = v17;
  v26 = v18;
  v27 = v16;
  -[PPRecordStorageHelper _deleteRecordsWithRowIdsFromQuery:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:bind:](self, v20, v19, (uint64_t)a8, (uint64_t)a9, v29);

  return 1;
}

- (void)deleteAllRemoteRecordsMissingInDuetFromDatabase:(id)a3 client:(unsigned __int8)a4 shouldContinueBlock:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  unsigned int (**v18)(_QWORD);
  NSObject *v19;
  NSString *table;
  NSString *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  PPRecordStorageHelper *v25;
  id v26;
  id v27;
  __int128 *p_buf;
  _QWORD aBlock[5];
  id v30;
  id v31;
  uint64_t *v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t v38[4];
  NSString *v39;
  __int16 v40;
  uint64_t v41;
  __int128 buf;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;

  v6 = a4;
  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (self->_duetStream)
  {
    pp_default_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      table = self->_table;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = table;
      _os_log_debug_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEBUG, "PPRecordStorageHelper(%@): purging all orphaned remote records from local storage", (uint8_t *)&buf, 0xCu);
    }

    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v11 = MEMORY[0x1E0C809B0];
    v37 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __100__PPRecordStorageHelper_deleteAllRemoteRecordsMissingInDuetFromDatabase_client_shouldContinueBlock___block_invoke;
    aBlock[3] = &unk_1E7E16E00;
    aBlock[4] = self;
    v12 = v8;
    v30 = v12;
    v33 = v6;
    v13 = v9;
    v31 = v13;
    v32 = &v34;
    v14 = _Block_copy(aBlock);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__4580;
    v45 = __Block_byref_object_dispose__4581;
    v46 = 0;
    v46 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[PPDKStorage readBatchSize](self->_duetStorage, "readBatchSize"));
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT dk_event_id FROM %@ WHERE dk_event_id IS NOT NULL AND is_remote"), self->_table);
    v23[0] = v11;
    v23[1] = 3221225472;
    v23[2] = __100__PPRecordStorageHelper_deleteAllRemoteRecordsMissingInDuetFromDatabase_client_shouldContinueBlock___block_invoke_2;
    v23[3] = &unk_1E7E16E50;
    v16 = v15;
    v24 = v16;
    v25 = self;
    p_buf = &buf;
    v17 = v14;
    v26 = v17;
    v18 = (unsigned int (**)(_QWORD))v13;
    v27 = v18;
    objc_msgSend(v12, "readTransactionWithClient:block:", v6, v23);
    if (objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count") && v18[2](v18))
      (*((void (**)(id, _QWORD))v17 + 2))(v17, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    pp_default_log_handle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v21 = self->_table;
      v22 = v35[3];
      *(_DWORD *)v38 = 138412546;
      v39 = v21;
      v40 = 2048;
      v41 = v22;
      _os_log_debug_impl(&dword_1C392E000, v19, OS_LOG_TYPE_DEBUG, "PPRecordStorageHelper(%@): removed %tu orphaned remote records from local storage", v38, 0x16u);
    }

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v34, 8);
  }

}

- (BOOL)deleteFeedbackCountRecordsOlderThanDate:(id)a3 txnWitness:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  objc_msgSend(a4, "db");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM %@ WHERE last_update_seconds_from_1970 < :secondsFrom1970"), self->_feedbackTable);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__PPRecordStorageHelper_deleteFeedbackCountRecordsOlderThanDate_txnWitness___block_invoke;
  v12[3] = &unk_1E7E1F040;
  v13 = v6;
  v9 = v6;
  v10 = objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", v8, v12, 0, 0);

  return v10;
}

- (BOOL)pruneOrphanedFeedbackCountRecordsWithLimit:(unint64_t)a3 rowOffset:(unint64_t)a4 deletedCount:(unint64_t *)a5 txnWitness:(id)a6 isComplete:(BOOL *)a7
{
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  _QWORD v22[6];

  v12 = (objc_class *)MEMORY[0x1E0CB3940];
  v13 = a6;
  v14 = (void *)objc_msgSend([v12 alloc], "initWithFormat:", CFSTR("DELETE FROM %@ AS fb WHERE fb.rowid IN (SELECT rowid FROM %@                    ORDER BY rowid                    LIMIT :limit                    OFFSET :offset) AND NOT EXISTS (SELECT 1 FROM %@ AS rt                 WHERE rt.%@ = fb.item_string)"), self->_feedbackTable, self->_feedbackTable, self->_table, self->_clusterIdentifierColumn);
  objc_msgSend(v13, "db");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "numberOfRowsInTable:", self->_feedbackTable);

  objc_msgSend(v13, "db");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __113__PPRecordStorageHelper_pruneOrphanedFeedbackCountRecordsWithLimit_rowOffset_deletedCount_txnWitness_isComplete___block_invoke;
  v22[3] = &__block_descriptor_48_e29_v16__0___PASSqliteStatement_8l;
  v22[4] = a3;
  v22[5] = a4;
  v18 = objc_msgSend(v17, "prepAndRunQuery:onPrep:onRow:onError:", v14, v22, 0, 0);

  objc_msgSend(v13, "db");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_retainAutorelease(v19);
  *a5 = sqlite3_changes((sqlite3 *)objc_msgSend(v20, "handle"));

  if (a4 + a3 >= v16)
    *a7 = 1;

  return v18;
}

- (id)rowIdsForRecordsSourcedFromBundleId:(id)a3 documentIds:(id)a4 txnWitness:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  const char *v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT rt.id FROM %@ AS rt INNER JOIN sources AS src ON rt.source_id = src.id WHERE src.bundle_id = :bundleId AND src.doc_id IN _pas_nsarray(:documentIds)"), self->_table);
  v13 = (void *)MEMORY[0x1C3BD6630]();
  v14 = -[NSString UTF8String](self->_table, "UTF8String");
  objc_msgSend(v10, "db");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __84__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_documentIds_txnWitness___block_invoke;
  v24[3] = &unk_1E7E189A0;
  v17 = v8;
  v25 = v17;
  v18 = v9;
  v26 = v18;
  v21[0] = v16;
  v21[1] = 3221225472;
  v21[2] = __84__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_documentIds_txnWitness___block_invoke_2;
  v21[3] = &unk_1E7E16AC8;
  v19 = v11;
  v22 = v19;
  v23 = v14;
  objc_msgSend(v15, "prepAndRunQuery:onPrep:onRow:onError:", v12, v24, v21, 0);

  objc_autoreleasePoolPop(v13);
  return v19;
}

- (id)rowIdsForRecordsSourcedFromBundleId:(id)a3 exactMatchGroupId:(id)a4 olderThanDate:(id)a5 txnWitness:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v29[4];
  id v30;
  const char *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT rt.id FROM %@ AS rt INNER JOIN sources AS src ON rt.source_id = src.id WHERE src.seconds_from_1970 < :timestamp "), self->_table);
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("PortraitBundleIdWildCardMatchingAll")) & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v15, "stringByAppendingString:", CFSTR("AND src.bundle_id = :bundleId "));
    v17 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v16);
    v15 = (void *)v17;
  }
  if (v11)
  {
    v18 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v15, "stringByAppendingString:", CFSTR("AND src.group_id = :groupId"));
    v19 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v18);
    v15 = (void *)v19;
  }
  v20 = (void *)MEMORY[0x1C3BD6630]();
  v21 = -[NSString UTF8String](self->_table, "UTF8String");
  objc_msgSend(v13, "db");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __104__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_exactMatchGroupId_olderThanDate_txnWitness___block_invoke;
  v32[3] = &unk_1E7E1A800;
  v24 = v10;
  v33 = v24;
  v25 = v12;
  v34 = v25;
  v26 = v11;
  v35 = v26;
  v29[0] = v23;
  v29[1] = 3221225472;
  v29[2] = __104__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_exactMatchGroupId_olderThanDate_txnWitness___block_invoke_2;
  v29[3] = &unk_1E7E16AC8;
  v27 = v14;
  v30 = v27;
  v31 = v21;
  objc_msgSend(v22, "prepAndRunQuery:onPrep:onRow:onError:", v15, v32, v29, 0);

  objc_autoreleasePoolPop(v20);
  return v27;
}

- (id)rowIdsForRecordsOlderThanDate:(id)a3 txnWitness:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  const char *v19;
  _QWORD v20[4];
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT rt.id FROM %@ AS rt INNER JOIN sources AS src on rt.source_id = src.id WHERE src.seconds_from_1970 < :timestamp"), self->_table);
  v10 = (void *)MEMORY[0x1C3BD6630]();
  v11 = -[NSString UTF8String](self->_table, "UTF8String");
  objc_msgSend(v7, "db");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __66__PPRecordStorageHelper_rowIdsForRecordsOlderThanDate_txnWitness___block_invoke;
  v20[3] = &unk_1E7E1F040;
  v14 = v6;
  v21 = v14;
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __66__PPRecordStorageHelper_rowIdsForRecordsOlderThanDate_txnWitness___block_invoke_2;
  v17[3] = &unk_1E7E16AC8;
  v15 = v8;
  v18 = v15;
  v19 = v11;
  objc_msgSend(v12, "prepAndRunQuery:onPrep:onRow:onError:", v9, v20, v17, 0);

  objc_autoreleasePoolPop(v10);
  return v15;
}

- (BOOL)fixupDKEventsWithDatabase:(id)a3 fixup49995922Table:(id)a4 batchSize:(unsigned int)a5 shouldContinueBlock:(id)a6 createRecordWithStatement:(id)a7 eventForRecord:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  uint8_t v23[8];
  _QWORD v24[4];
  id v25;
  PPRecordStorageHelper *v26;
  id v27;
  id v28;
  id v29;
  uint8_t *v30;
  unsigned int v31;
  uint8_t buf[8];
  uint8_t *v33;
  uint64_t v34;
  char v35;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (self->_duetStorage && self->_duetStream)
  {
    if (a5 <= 1)
      a5 = 1;
    *(_QWORD *)buf = 0;
    v33 = buf;
    v34 = 0x2020000000;
    v35 = 1;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke;
    v24[3] = &unk_1E7E16FF8;
    v31 = a5;
    v25 = v15;
    v26 = self;
    v27 = v17;
    v28 = v18;
    v29 = v16;
    v30 = buf;
    v19 = objc_msgSend(v14, "writeTransactionWithClient:timeoutInSeconds:block:", 1, v24, 5.0);
    if ((v19 & 1) == 0)
    {
      pp_default_log_handle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v23 = 0;
        _os_log_error_impl(&dword_1C392E000, v20, OS_LOG_TYPE_ERROR, "during fixup pass: SQL transaction timed out.", v23, 2u);
      }

    }
    if (!v33[24])
      v19 = 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    pp_default_log_handle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v21, OS_LOG_TYPE_DEFAULT, "fixupDKEventsWithBatchSize exiting early due to missing _duetStorage or _duetStream", buf, 2u);
    }

    v19 = 1;
  }

  return v19;
}

- (unsigned)distinctClusterCountInDatabase:(id)a3 client:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v4 = a4;
  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT COUNT(DISTINCT %@) AS cluster_count FROM %@"), self->_clusterIdentifierColumn, self->_table);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__PPRecordStorageHelper_distinctClusterCountInDatabase_client___block_invoke;
  v10[3] = &unk_1E7E1EF00;
  v8 = v7;
  v11 = v8;
  v12 = &v13;
  objc_msgSend(v6, "readTransactionWithClient:block:", v4, v10);
  LODWORD(v4) = *((_DWORD *)v14 + 6);

  _Block_object_dispose(&v13, 8);
  return v4;
}

- (id)clusterIdentifiersExistingInDatabaseBeforeDate:(id)a3 client:(unsigned __int8)a4 date:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4580;
  v23 = __Block_byref_object_dispose__4581;
  v24 = 0;
  v24 = (id)objc_opt_new();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT DISTINCT tbl.%@ AS cluster_id FROM %@ AS tbl INNER JOIN sources AS src ON tbl.source_id = src.id WHERE src.seconds_from_1970 < :date"), self->_clusterIdentifierColumn, self->_table);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__PPRecordStorageHelper_clusterIdentifiersExistingInDatabaseBeforeDate_client_date___block_invoke;
  v15[3] = &unk_1E7E16BF8;
  v11 = v10;
  v16 = v11;
  v12 = v9;
  v17 = v12;
  v18 = &v19;
  objc_msgSend(v8, "readTransactionWithClient:block:", v6, v15);
  v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v13;
}

- (id)thirdPartyBundleIdsFromTodayInDatabase:(id)a3 client:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a4;
  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4580;
  v18 = __Block_byref_object_dispose__4581;
  v19 = 0;
  v19 = (id)objc_opt_new();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT src.bundle_id AS third_party_bundle FROM sources AS src WHERE src.seconds_from_1970 > :date AND src.bundle_id NOT LIKE \"com.apple%%\" AND src.id IN (SELECT source_id FROM %@)"), self->_table);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__PPRecordStorageHelper_thirdPartyBundleIdsFromTodayInDatabase_client___block_invoke;
  v11[3] = &unk_1E7E1EF00;
  v8 = v7;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v6, "readTransactionWithClient:block:", v4, v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (id)lastDonationTimeForSourcesInDatabase:(id)a3 client:(unsigned __int8)a4 before:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4580;
  v23 = __Block_byref_object_dispose__4581;
  v24 = 0;
  v24 = (id)objc_opt_new();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT src.bundle_id AS bundle_id, MAX(src.seconds_from_1970) as date FROM sources AS src WHERE src.seconds_from_1970 < :date AND src.id IN (SELECT source_id FROM %@) GROUP BY src.bundle_id"), self->_table);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__PPRecordStorageHelper_lastDonationTimeForSourcesInDatabase_client_before___block_invoke;
  v15[3] = &unk_1E7E16BF8;
  v11 = v10;
  v16 = v11;
  v12 = v9;
  v17 = v12;
  v18 = &v19;
  objc_msgSend(v8, "readTransactionWithClient:block:", v6, v15);
  v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v13;
}

- (id)firstDonationSourceCountsForDatabase:(id)a3 client:(unsigned __int8)a4 shouldContinueBlock:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4580;
  v23 = __Block_byref_object_dispose__4581;
  v24 = 0;
  v24 = (id)objc_opt_new();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT src.bundle_id AS bundle_id, item.algorithm as algorithm, count(DISTINCT(item.%@)) as count FROM %@ as item INNER JOIN sources as src on src.id = item.source_id WHERE NOT item.is_remote AND item.rowid in (SELECT x.rowid FROM %@ as x INNER JOIN sources as srx ON srx.id = x.source_id WHERE item.%@ = x.%@ ORDER BY srx.seconds_from_1970 ASC LIMIT 1) GROUP BY src.bundle_id, item.algorithm"), self->_clusterIdentifierColumn, self->_table, self->_table, self->_clusterIdentifierColumn, self->_clusterIdentifierColumn);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__PPRecordStorageHelper_firstDonationSourceCountsForDatabase_client_shouldContinueBlock___block_invoke;
  v15[3] = &unk_1E7E17088;
  v11 = v9;
  v17 = v11;
  v18 = &v19;
  v12 = v10;
  v16 = v12;
  objc_msgSend(v8, "readTransactionWithClient:block:", v6, v15);
  v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceStorage, 0);
  objc_storeStrong((id *)&self->_lastDuetDeletionDateKey, 0);
  objc_storeStrong((id *)&self->_lastDuetImportDateKey, 0);
  objc_storeStrong((id *)&self->_duetStream, 0);
  objc_storeStrong((id *)&self->_duetStorage, 0);
  objc_storeStrong((id *)&self->_clusterIdentifierColumn, 0);
  objc_storeStrong((id *)&self->_feedbackTable, 0);
  objc_storeStrong((id *)&self->_table, 0);
}

void __89__PPRecordStorageHelper_firstDonationSourceCountsForDatabase_client_shouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint8_t buf[16];

  v3 = a2;
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() & 1) != 0)
  {
    objc_msgSend(v3, "db");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __89__PPRecordStorageHelper_firstDonationSourceCountsForDatabase_client_shouldContinueBlock___block_invoke_2;
    v11[3] = &unk_1E7E17060;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v12 = v6;
    v13 = v7;
    objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", v5, &__block_literal_global_292, v11, 0);

  }
  else
  {
    pp_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEFAULT, "PPRecordStorageHelper: not executing first sources query due to deferral request.", buf, 2u);
    }

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

  }
}

uint64_t __89__PPRecordStorageHelper_firstDonationSourceCountsForDatabase_client_shouldContinueBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint8_t v11[16];

  v3 = a2;
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) != 0)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v3, "nonnullNSStringForColumnAlias:", "bundle_id");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBundleId:", v5);
    objc_msgSend(v4, "setAlgorithm:", objc_msgSend(v3, "getInt64ForColumnAlias:", "algorithm"));
    objc_msgSend(v4, "setCount:", objc_msgSend(v3, "getInt64ForColumnAlias:", "count"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v4);
    v6 = *MEMORY[0x1E0D81780];

  }
  else
  {
    pp_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPRecordStorageHelper: interrupting first sources query to defer.", v11, 2u);
    }

    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

    v6 = *MEMORY[0x1E0D81788];
  }

  return v6;
}

void __76__PPRecordStorageHelper_lastDonationTimeForSourcesInDatabase_client_before___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__PPRecordStorageHelper_lastDonationTimeForSourcesInDatabase_client_before___block_invoke_2;
  v7[3] = &unk_1E7E1F040;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __76__PPRecordStorageHelper_lastDonationTimeForSourcesInDatabase_client_before___block_invoke_3;
  v6[3] = &unk_1E7E1BB80;
  v6[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", v5, v7, v6, 0);

}

void __76__PPRecordStorageHelper_lastDonationTimeForSourcesInDatabase_client_before___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "timeIntervalSince1970");
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":date");

}

uint64_t __76__PPRecordStorageHelper_lastDonationTimeForSourcesInDatabase_client_before___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  unsigned __int8 *v8;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnAlias:", "bundle_id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getDoubleForColumnAlias:", "date");
  v6 = v5;

  if (v4)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v6);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v7, v4);

  }
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v8;
}

void __71__PPRecordStorageHelper_thirdPartyBundleIdsFromTodayInDatabase_client___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  _QWORD v5[5];

  objc_msgSend(a2, "db");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__PPRecordStorageHelper_thirdPartyBundleIdsFromTodayInDatabase_client___block_invoke_3;
  v5[3] = &unk_1E7E1BB80;
  v3 = *(_QWORD *)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", v3, &__block_literal_global_282, v5, 0);

}

uint64_t __71__PPRecordStorageHelper_thirdPartyBundleIdsFromTodayInDatabase_client___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;

  objc_msgSend(a2, "getNSStringForColumnAlias:", "third_party_bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

void __71__PPRecordStorageHelper_thirdPartyBundleIdsFromTodayInDatabase_client___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  id v4;

  v2 = a2;
  v4 = (id)objc_opt_new();
  objc_msgSend(v4, "timeIntervalSince1970");
  objc_msgSend(v2, "bindNamedParam:toDouble:", ":date", v3 + -86400.0);

}

void __84__PPRecordStorageHelper_clusterIdentifiersExistingInDatabaseBeforeDate_client_date___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__PPRecordStorageHelper_clusterIdentifiersExistingInDatabaseBeforeDate_client_date___block_invoke_2;
  v7[3] = &unk_1E7E1F040;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __84__PPRecordStorageHelper_clusterIdentifiersExistingInDatabaseBeforeDate_client_date___block_invoke_3;
  v6[3] = &unk_1E7E1BB80;
  v6[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", v5, v7, v6, 0);

}

void __84__PPRecordStorageHelper_clusterIdentifiersExistingInDatabaseBeforeDate_client_date___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "timeIntervalSince1970");
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":date");

}

uint64_t __84__PPRecordStorageHelper_clusterIdentifiersExistingInDatabaseBeforeDate_client_date___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;

  objc_msgSend(a2, "getNSStringForColumnAlias:", "cluster_id");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

void __63__PPRecordStorageHelper_distinctClusterCountInDatabase_client___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  _QWORD v5[5];

  objc_msgSend(a2, "db");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__PPRecordStorageHelper_distinctClusterCountInDatabase_client___block_invoke_2;
  v5[3] = &unk_1E7E1BB80;
  v3 = *(_QWORD *)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", v3, 0, v5, 0);

}

uint64_t __63__PPRecordStorageHelper_distinctClusterCountInDatabase_client___block_invoke_2(uint64_t a1, void *a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumnAlias:", "cluster_count");
  return *MEMORY[0x1E0D81788];
}

void __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  id obj;
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[6];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[5];
  id v60;
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  int v68;
  uint8_t v69[128];
  uint8_t buf[4];
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasTableNamed:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(unsigned int *)(a1 + 80));
    objc_msgSend(v3, "db");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT * FROM %@ LIMIT :batchSize"), *(_QWORD *)(a1 + 32));
    v9 = MEMORY[0x1E0C809B0];
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_2;
    v67[3] = &__block_descriptor_36_e29_v16__0___PASSqliteStatement_8l;
    v68 = *(_DWORD *)(a1 + 80);
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_3;
    v65[3] = &unk_1E7E1F120;
    v10 = v6;
    v66 = v10;
    objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", v8, v67, v65, 0);

    if (objc_msgSend(v10, "count"))
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(unsigned int *)(a1 + 80));
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT * FROM %@ AS rec_tbl INNER JOIN sources ON rec_tbl.source_id = sources.id WHERE rec_tbl.id IN _pas_nsarray(:batchRowIds)"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
      objc_msgSend(v3, "db");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = v9;
      v63[1] = 3221225472;
      v63[2] = __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_4;
      v63[3] = &unk_1E7E1F040;
      v14 = v10;
      v64 = v14;
      v59[0] = v9;
      v59[1] = 3221225472;
      v59[2] = __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_5;
      v59[3] = &unk_1E7E16F28;
      v15 = *(void **)(a1 + 48);
      v59[4] = *(_QWORD *)(a1 + 40);
      v62 = v15;
      v48 = v3;
      v60 = v48;
      v16 = v11;
      v61 = v16;
      objc_msgSend(v13, "prepAndRunQuery:onPrep:onRow:onError:", v12, v63, v59, 0);

      v57[0] = v9;
      v57[1] = 3221225472;
      v57[2] = __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_257;
      v57[3] = &unk_1E7E16F50;
      v58 = *(id *)(a1 + 56);
      objc_msgSend(v16, "_pas_mappedArrayWithTransform:", v57);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_pas_mappedArrayWithTransform:", &__block_literal_global_262);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "saveEvents:stream:maxRetries:retryInterval:shouldContinueBlock:", v18, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), -1, *(_QWORD *)(a1 + 64), 5.0) & 1) != 0)
      {
        v42 = v14;
        v46 = v3;

        v44 = v16;
        objc_msgSend(v16, "_pas_mappedArrayWithTransform:", &__block_literal_global_265);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(a1 + 40);
        v21 = *(void **)(v20 + 40);
        v22 = *(_QWORD *)(v20 + 48);
        v23 = (void *)MEMORY[0x1E0D15A08];
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v19);
        objc_msgSend(v23, "predicateForObjectsWithUUIDs:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = 0;
        LOBYTE(v22) = objc_msgSend(v21, "deleteAllEventsInEventStream:matchingPredicate:error:", v22, v25, &v56);
        v26 = v56;

        if ((v22 & 1) == 0)
        {
          pp_default_log_handle();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v71 = v26;
            _os_log_error_impl(&dword_1C392E000, v27, OS_LOG_TYPE_ERROR, "during fixup pass: failed to delete old _DKEvent batch: %@", buf, 0xCu);
          }

        }
        v45 = v12;
        v28 = (_QWORD *)a1;

        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v43 = v17;
        obj = v17;
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v69, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v53;
          do
          {
            for (i = 0; i != v30; ++i)
            {
              if (*(_QWORD *)v53 != v31)
                objc_enumerationMutation(obj);
              v33 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
              objc_msgSend(v48, "db");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UPDATE %@ SET dk_event_id = :uuidBlob WHERE id = :rowId"), *(_QWORD *)(v28[5] + 8), v42);
              v51[0] = MEMORY[0x1E0C809B0];
              v51[1] = 3221225472;
              v51[2] = __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_269;
              v51[3] = &unk_1E7E189A0;
              v36 = v28[5];
              v51[4] = v33;
              v51[5] = v36;
              objc_msgSend(v34, "prepAndRunQuery:onPrep:onRow:onError:", v35, v51, 0, 0);

            }
            v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v69, 16);
          }
          while (v30);
        }

        objc_msgSend(v48, "db");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM %@ WHERE id IN _pas_nsarray(:batchRowIds)"), v28[4]);
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_2_272;
        v49[3] = &unk_1E7E1F040;
        v50 = v42;
        objc_msgSend(v37, "prepAndRunQuery:onPrep:onRow:onError:", v38, v49, 0, 0);

        *(_BYTE *)(*(_QWORD *)(v28[9] + 8) + 24) = 0;
        v18 = v50;
        v3 = v46;
        v16 = v44;
        v12 = v45;
        v17 = v43;
      }
      else
      {
        pp_default_log_handle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C392E000, v41, OS_LOG_TYPE_ERROR, "during fixup pass: failed to save replacement _DKEvent batch", buf, 2u);
        }

      }
    }
    else
    {
      objc_msgSend(v3, "db");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TABLE %@"), *(_QWORD *)(a1 + 32));
      objc_msgSend(v39, "prepAndRunQuery:onPrep:onRow:onError:", v40, 0, 0, 0);

    }
  }

}

uint64_t __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", ":batchSize", *(unsigned int *)(a1 + 32));
}

uint64_t __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 *v7;

  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BD6630]();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumnName:table:", "id", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  v7 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  objc_autoreleasePoolPop(v4);

  return *v7;
}

uint64_t __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSArray:", ":batchRowIds", *(_QWORD *)(a1 + 32));
}

uint64_t __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  PPFixup49995922Tuple *v12;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BD6630]();
  v5 = objc_msgSend(v3, "getInt64ForColumnName:table:", "id", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "UTF8String"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "getNSDataForColumnName:table:", "dk_event_id", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "UTF8String"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "length") == 16)
      {
        v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v8), "bytes"));
LABEL_11:
        v12 = -[PPFixup49995922Tuple initWithRowid:record:dkUUID:]([PPFixup49995922Tuple alloc], "initWithRowid:record:dkUUID:", v5, v6, v9);
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);

        goto LABEL_12;
      }
      pp_default_log_handle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v15 = 138412546;
        v16 = v14;
        v17 = 2048;
        v18 = v5;
        _os_log_error_impl(&dword_1C392E000, v11, OS_LOG_TYPE_ERROR, "during fixup pass: %@ row %lld has bad dk_event_id, ignoring", (uint8_t *)&v15, 0x16u);
      }

    }
    v9 = 0;
    goto LABEL_11;
  }
  pp_default_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v15 = 138412546;
    v16 = v10;
    v17 = 2048;
    v18 = v5;
    _os_log_error_impl(&dword_1C392E000, v9, OS_LOG_TYPE_ERROR, "during fixup pass: %@ row %lld contains bad source, ignoring", (uint8_t *)&v15, 0x16u);
  }
LABEL_12:

  objc_autoreleasePoolPop(v4);
  return *MEMORY[0x1E0D81780];
}

id __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_257(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0D81638];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "rowid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "record");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "initWithFirst:second:", v6, v9);

  return v10;
}

void __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_269(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":rowId", objc_msgSend(v5, "longLongValue"));

  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "second");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "blobFromUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSData:", ":uuidBlob", v8);

}

uint64_t __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_2_272(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSArray:", ":batchRowIds", *(_QWORD *)(a1 + 32));
}

uint64_t __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_263(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dkUUID");
}

uint64_t __141__PPRecordStorageHelper_fixupDKEventsWithDatabase_fixup49995922Table_batchSize_shouldContinueBlock_createRecordWithStatement_eventForRecord___block_invoke_2_260(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "second");
}

uint64_t __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSIndexSet:", ":rowIds", *(_QWORD *)(a1 + 32));
}

uint64_t __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;

  objc_msgSend(a2, "getNSStringForColumnAlias:", "clusterIdent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

uint64_t __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSIndexSet:", ":rowIds", *(_QWORD *)(a1 + 32));
}

uint64_t __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[5];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE buf[24];
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v5;
  if (v3)
  {
    v8 = (void *)MEMORY[0x1C3BD6630]();
    v9 = objc_msgSend(v6, "getInt64ForColumn:", 0);
    v10 = objc_msgSend(v6, "getInt64ForColumn:", 1);
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0x7FFFFFFFFFFFFFFFLL;
    v11 = MEMORY[0x1E0C809B0];
    v20[4] = &v22;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __68__PPRecordStorageHelper__processRowForDeletionWithStatement_handle___block_invoke;
    v21[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
    v21[4] = v9;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __68__PPRecordStorageHelper__processRowForDeletionWithStatement_handle___block_invoke_2;
    v20[3] = &unk_1E7E1BB80;
    objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT ref_count FROM sources WHERE id = :rowId"), v21, v20, 0);
    v12 = v23[3];
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      pp_default_log_handle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v18 = *(_QWORD *)(v3 + 8);
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v9;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v18;
        _os_log_error_impl(&dword_1C392E000, v13, OS_LOG_TYPE_ERROR, "Can't find source with id %lld during %@ record deletion", buf, 0x16u);
      }

    }
    else
    {
      v14 = v12 - v10;
      if (v12 - v10 < 0)
      {
        pp_default_log_handle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v19 = *(_QWORD *)(v3 + 8);
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v19;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v9;
          _os_log_error_impl(&dword_1C392E000, v15, OS_LOG_TYPE_ERROR, "Record deletion from %@ is leading to negative ref_count for source with id %lld", buf, 0x16u);
        }

      }
      *(_QWORD *)buf = v11;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __68__PPRecordStorageHelper__processRowForDeletionWithStatement_handle___block_invoke_233;
      v27 = &__block_descriptor_48_e29_v16__0___PASSqliteStatement_8l;
      v28 = v14;
      v29 = v9;
      objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE sources SET ref_count = :refCount WHERE id = :rowId"), buf, 0, 0);
    }
    _Block_object_dispose(&v22, 8);
    objc_autoreleasePoolPop(v8);
    v16 = *MEMORY[0x1E0D81780];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSIndexSet:", ":rowIds", *(_QWORD *)(a1 + 32));
}

uint64_t __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke_224(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":clusterIdentSet", *(_QWORD *)(a1 + 32));
}

uint64_t __97__PPRecordStorageHelper_deleteRecordsForRowIds_txnWitness_atLeastOneClusterRemoved_deletedCount___block_invoke_2_226(uint64_t a1)
{
  **(_BYTE **)(a1 + 32) = 1;
  return *MEMORY[0x1E0D81788];
}

uint64_t __68__PPRecordStorageHelper__processRowForDeletionWithStatement_handle___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", ":rowId", *(_QWORD *)(a1 + 32));
}

uint64_t __68__PPRecordStorageHelper__processRowForDeletionWithStatement_handle___block_invoke_2(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

void __68__PPRecordStorageHelper__processRowForDeletionWithStatement_handle___block_invoke_233(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":refCount", v3);
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":rowId", *(_QWORD *)(a1 + 40));

}

uint64_t __61__PPRecordStorageHelper__deleteDKEventsForRowIds_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSIndexSet:", ":rowIds", *(_QWORD *)(a1 + 32));
}

uint64_t __61__PPRecordStorageHelper__deleteDKEventsForRowIds_txnWitness___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E0D81788];
}

uint64_t __61__PPRecordStorageHelper__deleteDKEventsForRowIds_txnWitness___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSIndexSet:", ":rowIds", *(_QWORD *)(a1 + 32));
}

uint64_t __61__PPRecordStorageHelper__deleteDKEventsForRowIds_txnWitness___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(v4, "numberWithLongLong:", objc_msgSend(v5, "getInt64ForColumn:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  objc_msgSend(v5, "getNSDataForColumnAlias:", "dk_event_id");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length") != 16)
  {
    pp_default_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = 138412546;
      v13 = v11;
      v14 = 2048;
      v15 = objc_msgSend(v7, "length");
      _os_log_error_impl(&dword_1C392E000, v9, OS_LOG_TYPE_ERROR, "column 'dk_event_id' in table '%@' has blob of unexpected length %tu", (uint8_t *)&v12, 0x16u);
    }
    goto LABEL_6;
  }
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v7), "bytes"));
  if (v8)
  {
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);
LABEL_6:

  }
  return *MEMORY[0x1E0D81780];
}

uint64_t __61__PPRecordStorageHelper__deleteDKEventsForRowIds_txnWitness___block_invoke_247(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSArray:", ":batchRowIds", *(_QWORD *)(a1 + 32));
}

uint64_t __61__PPRecordStorageHelper__deleteDKEventsForRowIds_txnWitness___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", ":batchSize", 200);
}

void __66__PPRecordStorageHelper_rowIdsForRecordsOlderThanDate_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "timeIntervalSince1970");
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":timestamp");

}

uint64_t __66__PPRecordStorageHelper_rowIdsForRecordsOlderThanDate_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(a2, "getInt64ForColumnName:table:", "id", *(_QWORD *)(a1 + 40)));
  return *MEMORY[0x1E0D81780];
}

void __104__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_exactMatchGroupId_olderThanDate_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("PortraitBundleIdWildCardMatchingAll")) & 1) == 0)
    objc_msgSend(v3, "bindNamedParam:toNonnullNSString:", ":bundleId", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSince1970");
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":timestamp");
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(v3, "bindNamedParam:toNonnullNSString:", ":groupId");

}

uint64_t __104__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_exactMatchGroupId_olderThanDate_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(a2, "getInt64ForColumnName:table:", "id", *(_QWORD *)(a1 + 40)));
  return *MEMORY[0x1E0D81780];
}

uint64_t __72__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(a2, "getInt64ForColumnName:table:", "id", *(_QWORD *)(a1 + 40)));
  return *MEMORY[0x1E0D81780];
}

uint64_t __81__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_groupIds_txnWitness___block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(a2, "getInt64ForColumnName:table:", "id", *(_QWORD *)(a1 + 40)));
  return *MEMORY[0x1E0D81780];
}

void __84__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_documentIds_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNonnullNSString:", ":bundleId", v3);
  objc_msgSend(v4, "bindNamedParam:toNSArray:", ":documentIds", *(_QWORD *)(a1 + 40));

}

uint64_t __84__PPRecordStorageHelper_rowIdsForRecordsSourcedFromBundleId_documentIds_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(a2, "getInt64ForColumnName:table:", "id", *(_QWORD *)(a1 + 40)));
  return *MEMORY[0x1E0D81780];
}

void __113__PPRecordStorageHelper_pruneOrphanedFeedbackCountRecordsWithLimit_rowOffset_deletedCount_txnWitness_isComplete___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":limit", v3);
  objc_msgSend(v4, "bindNamedParam:toInteger:", ":offset", *(_QWORD *)(a1 + 40));

}

void __76__PPRecordStorageHelper_deleteFeedbackCountRecordsOlderThanDate_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "timeIntervalSince1970");
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":secondsFrom1970");

}

void __100__PPRecordStorageHelper_deleteAllRemoteRecordsMissingInDuetFromDatabase_client_shouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unsigned int (**v13)(_QWORD);
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  unsigned int v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _BYTE buf[24];
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t *v29;
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v18 = *(unsigned __int8 *)(a1 + 64);
  v5 = *(void **)(a1 + 48);
  v6 = a2;
  v7 = v4;
  v8 = v5;
  if (v3)
  {
    v24 = 0;
    v9 = *(void **)(v3 + 40);
    objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForObjectsWithUUIDs:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = *(_QWORD *)(v3 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(*(id *)(v3 + 40), "readBatchSize");
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __120__PPRecordStorageHelper__filterAndRemoveMissingRemoteRecordsFromBatch_database_client_deletedCount_shouldContinueBlock___block_invoke;
    v21[3] = &unk_1E7E16E78;
    v19 = v8;
    v13 = (unsigned int (**)(_QWORD))v8;
    v23 = v13;
    v14 = v6;
    v22 = v14;
    LOBYTE(v12) = objc_msgSend(v9, "iterEventBatchesMatchingPredicate:streams:sortDescriptors:batchSize:readMetaData:remoteOnly:error:block:", v10, v11, MEMORY[0x1E0C9AA60], v12, 0, 1, &v24, v21);

    if ((v12 & 1) != 0)
    {
      if (!objc_msgSend(v14, "count") || !v13[2](v13))
        goto LABEL_9;
      objc_msgSend(v14, "allObjects");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __120__PPRecordStorageHelper__filterAndRemoveMissingRemoteRecordsFromBatch_database_client_deletedCount_shouldContinueBlock___block_invoke_188;
      v26 = &unk_1E7E16EA0;
      v28 = v15;
      v29 = &v20;
      v27 = v3;
      v16 = v15;
      objc_msgSend(v7, "writeTransactionWithClient:block:", v18, buf);

    }
    else
    {
      pp_default_log_handle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = *(_QWORD *)(v3 + 8);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v24;
        _os_log_error_impl(&dword_1C392E000, v16, OS_LOG_TYPE_ERROR, "PPRecordStorageHelper(%@): error iterating the duet stream: %@", buf, 0x16u);
      }
    }

LABEL_9:
    v8 = v19;
  }

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += v20;
  objc_msgSend(v6, "removeAllObjects");

}

void __100__PPRecordStorageHelper_deleteAllRemoteRecordsMissingInDuetFromDatabase_client_shouldContinueBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;
  uint64_t v9;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __100__PPRecordStorageHelper_deleteAllRemoteRecordsMissingInDuetFromDatabase_client_shouldContinueBlock___block_invoke_3;
  v6[3] = &unk_1E7E16E28;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 64);
  v6[4] = *(_QWORD *)(a1 + 40);
  v9 = v5;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", v4, 0, v6, 0);

}

uint64_t __100__PPRecordStorageHelper_deleteAllRemoteRecordsMissingInDuetFromDatabase_client_shouldContinueBlock___block_invoke_3(_QWORD *a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  int v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;

  v3 = (_QWORD *)a1[4];
  v4 = (void *)v3[1];
  v5 = a2;
  objc_msgSend(v3, "uuidForStatement:columnName:tableName:", v5, "dk_event_id", objc_msgSend(v4, "UTF8String"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "addObject:", v6);
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "count");
  if (v7 >= objc_msgSend(*(id *)(a1[4] + 40), "readBatchSize"))
    (*(void (**)(void))(a1[5] + 16))();
  v8 = (*(uint64_t (**)(void))(a1[6] + 16))();
  v9 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  v10 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  if (v8)
    v11 = v9;
  else
    v11 = v10;
  return *v11;
}

void __120__PPRecordStorageHelper__filterAndRemoveMissingRemoteRecordsFromBatch_database_client_deletedCount_shouldContinueBlock___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() & 1) != 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "UUID", (_QWORD)v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "removeObject:", v12);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    *a3 = 1;
  }

}

void __120__PPRecordStorageHelper__filterAndRemoveMissingRemoteRecordsFromBatch_database_client_deletedCount_shouldContinueBlock___block_invoke_188(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("SELECT id FROM %@ WHERE dk_event_id IN _pas_nsarray(:batch)"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __120__PPRecordStorageHelper__filterAndRemoveMissingRemoteRecordsFromBatch_database_client_deletedCount_shouldContinueBlock___block_invoke_2;
  v10[3] = &unk_1E7E189A0;
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v11 = v8;
  v12 = v9;
  -[PPRecordStorageHelper _deleteRecordsWithRowIdsFromQuery:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:bind:](v6, v5, v4, 0, v7, v10);

}

void __120__PPRecordStorageHelper__filterAndRemoveMissingRemoteRecordsFromBatch_database_client_deletedCount_shouldContinueBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __120__PPRecordStorageHelper__filterAndRemoveMissingRemoteRecordsFromBatch_database_client_deletedCount_shouldContinueBlock___block_invoke_3;
  v5[3] = &unk_1E7E16B40;
  v2 = *(void **)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  v3 = a2;
  objc_msgSend(v2, "_pas_proxyArrayWithMapping:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSArray:", ":batch", v4);

}

uint64_t __119__PPRecordStorageHelper__deleteRecordsWithRowIdsFromQuery_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_bind___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(a2, "getInt64ForColumn:", 0));
  return *MEMORY[0x1E0D81780];
}

uint64_t __120__PPRecordStorageHelper__filterAndRemoveMissingRemoteRecordsFromBatch_database_client_deletedCount_shouldContinueBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "blobFromUUID:", a2);
}

void __154__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_groupId_olderThanDate_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":algorithm", *(unsigned int *)(a1 + 56));
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("PortraitBundleIdWildCardMatchingAll")) & 1) == 0)
    objc_msgSend(v3, "bindNamedParam:toNSString:", ":bundleId", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSince1970");
  objc_msgSend(v3, "bindNamedParam:toDouble:", ":timestamp");
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(v3, "bindNamedParam:toNSString:", ":groupId");

}

void __144__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_groupId_olderThanDate_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "rowIdsForRecordsSourcedFromBundleId:exactMatchGroupId:olderThanDate:txnWitness:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "deleteRecordsForRowIds:txnWitness:atLeastOneClusterRemoved:deletedCount:", v2, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));

}

uint64_t __141__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_groupIds_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(a2, "getInt64ForColumnName:table:", "id", *(_QWORD *)(a1 + 40)));
  return *MEMORY[0x1E0D81780];
}

void __144__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_documentIds_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned int *)(a1 + 48);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":algorithm", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":bundleId", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "bindNamedParam:toNSArray:", ":documentIds", *(_QWORD *)(a1 + 40));

}

void __134__PPRecordStorageHelper_deleteAllRecordsSourcedFromBundleId_documentIds_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = (void *)a1[4];
  objc_msgSend(v2, "rowIdsForRecordsSourcedFromBundleId:documentIds:txnWitness:", a1[5], a1[6], a1[7]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteRecordsForRowIds:txnWitness:atLeastOneClusterRemoved:deletedCount:", v3, a1[7], a1[8], a1[9]);

}

void __158__PPRecordStorageHelper_deleteAllRecordsWithName_algorithm_bundleId_groupId_category_beforeDate_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned int *)(a1 + 64);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":algorithm", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":name", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":category", *(unsigned int *)(a1 + 68));
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":bundleId", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":groupId", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "timeIntervalSince1970");
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":beforeDate");

}

void __134__PPRecordStorageHelper_deleteAllRecordsWithClusterIdentifier_algorithm_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned int *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":algorithm", v3);
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":clusterIdent", *(_QWORD *)(a1 + 32));

}

uint64_t __124__PPRecordStorageHelper_deleteAllRecordsWithClusterIdentifier_txnWitness_atLeastOneRecordClusterRemoved_deletedCount_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":clusterIdent", *(_QWORD *)(a1 + 32));
}

uint64_t __60__PPRecordStorageHelper_disableSyncForBundleIds_txnWitness___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(void **)(v2 + 40);
    if (v3)
    {
      v4 = *(_QWORD *)(v2 + 48);
      objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForObjectsWithUUIDs:", *(_QWORD *)(a1 + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      LOBYTE(v4) = objc_msgSend(v3, "deleteAllEventsInEventStream:matchingPredicate:error:", v4, v5, &v9);
      v6 = v9;

      if ((v4 & 1) == 0)
      {
        pp_default_log_handle();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v11 = v6;
          _os_log_error_impl(&dword_1C392E000, v7, OS_LOG_TYPE_ERROR, "Failed to delete _DKEvents in response to change in bundleId sync status: %@", buf, 0xCu);
        }

      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
}

unint64_t __60__PPRecordStorageHelper_disableSyncForBundleIds_txnWitness___block_invoke_150(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result >= 0xC9)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

uint64_t __60__PPRecordStorageHelper_disableSyncForBundleIds_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":bundleIds", *(_QWORD *)(a1 + 32));
}

uint64_t __60__PPRecordStorageHelper_disableSyncForBundleIds_txnWitness___block_invoke_3(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  id v5;
  void *v6;
  unsigned __int8 *v7;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)v3[1];
  v5 = a2;
  objc_msgSend(v3, "uuidForStatement:columnName:tableName:", v5, "dk_event_id", objc_msgSend(v4, "UTF8String"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v7 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v7;
}

uint64_t __60__PPRecordStorageHelper_disableSyncForBundleIds_txnWitness___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":bundleIds", *(_QWORD *)(a1 + 32));
}

void __132__PPRecordStorageHelper_importDuetEventsWithLimit_database_client_remoteEventsOnly_isComplete_shouldContinueBlock_eventImportBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  _BYTE v28[24];
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  v8 = *(id *)(a1 + 40);
  v9 = a2;
  if (v3)
  {
    +[PPSQLKVStore loadBlobForKey:transaction:](PPSQLKVStore, "loadBlobForKey:transaction:", *(_QWORD *)(v3 + 56), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v25 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v10, &v25);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v25;
      v13 = v12;
      if (v11)
      {
        v22 = v12;
        v14 = objc_retainAutorelease(v11);
        v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT rt.dk_event_id FROM %@ AS rt INNER JOIN sources AS src ON rt.source_id = src.id WHERE src.seconds_from_1970 > :before_timestamp AND src.seconds_from_1970 < :after_timestamp AND rt.dk_event_id IS NOT NULL"), *(_QWORD *)(v3 + 8));
        objc_msgSend(v9, "db");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = MEMORY[0x1E0C809B0];
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __92__PPRecordStorageHelper__addEventsSourcedOnLastImportDateToSet_lastDKImportDate_txnWitness___block_invoke;
        v23[3] = &unk_1E7E1F040;
        v6 = v14;
        v24 = v6;
        *(_QWORD *)v28 = v17;
        *(_QWORD *)&v28[8] = 3221225472;
        *(_QWORD *)&v28[16] = __92__PPRecordStorageHelper__addEventsSourcedOnLastImportDateToSet_lastDKImportDate_txnWitness___block_invoke_2;
        v29 = &unk_1E7E195F0;
        v30 = v3;
        v18 = v8;
        v31 = v18;
        objc_msgSend(v16, "prepAndRunQuery:onPrep:onRow:onError:", v15, v23, v28, 0);

        if (objc_msgSend(v18, "count"))
        {
          pp_default_log_handle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            v20 = objc_msgSend(v18, "count");
            *(_DWORD *)buf = 134217984;
            v27 = v20;
            _os_log_debug_impl(&dword_1C392E000, v19, OS_LOG_TYPE_DEBUG, "importDuetEventsWithLimit skipping import of %tu events with matching starting date.", buf, 0xCu);
          }

        }
        v13 = v22;
      }
      else
      {
        pp_default_log_handle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v21 = *(_QWORD *)(v3 + 56);
          *(_DWORD *)v28 = 138412546;
          *(_QWORD *)&v28[4] = v21;
          *(_WORD *)&v28[12] = 2112;
          *(_QWORD *)&v28[14] = v13;
          _os_log_error_impl(&dword_1C392E000, v15, OS_LOG_TYPE_ERROR, "Failed to unarchive blob for key %@: %@", v28, 0x16u);
        }
      }

    }
  }

  objc_storeStrong(v5, v6);
}

void __132__PPRecordStorageHelper_importDuetEventsWithLimit_database_client_remoteEventsOnly_isComplete_shouldContinueBlock_eventImportBlock___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a2;
  *a3 = 1;
  v12 = v5;
  if (objc_msgSend(v5, "count") < (unint64_t)*(unsigned int *)(a1 + 80))
  {
    v6 = *(_BYTE **)(a1 + 72);
    if (v6)
      *v6 = 1;
  }
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
  {
    v7 = *(unsigned __int8 *)(a1 + 84);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __132__PPRecordStorageHelper_importDuetEventsWithLimit_database_client_remoteEventsOnly_isComplete_shouldContinueBlock_eventImportBlock___block_invoke_3;
    v13[3] = &unk_1E7E16C20;
    v9 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 64);
    v13[4] = v8;
    v10 = v12;
    v11 = *(_QWORD *)(a1 + 72);
    v14 = v10;
    v17 = v11;
    v15 = *(id *)(a1 + 56);
    objc_msgSend(v9, "writeTransactionWithClient:block:", v7, v13);

  }
}

void __132__PPRecordStorageHelper_importDuetEventsWithLimit_database_client_remoteEventsOnly_isComplete_shouldContinueBlock_eventImportBlock___block_invoke_3(uint64_t a1, void *a2)
{
  _QWORD *v4;
  void *v5;
  void *v6;
  _BYTE *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _BYTE buf[24];
  void *v32;
  _QWORD *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD **)(a1 + 32);
  v5 = *(void **)(a1 + 48);
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v7 = *(_BYTE **)(a1 + 64);
  v8 = *(id *)(a1 + 40);
  v9 = v6;
  v23 = v5;
  v10 = a2;
  v22 = v9;
  if (v4)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__4580;
    v29 = __Block_byref_object_dispose__4581;
    v11 = v9;
    v30 = v11;
    +[PPSQLKVStore loadBlobForKey:transaction:](PPSQLKVStore, "loadBlobForKey:transaction:", v4[7], v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v24 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v12, &v24);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v24;
      if (v13)
      {
        if ((objc_msgSend(v13, "isEqualToDate:", v11) & 1) == 0)
        {
          pp_default_log_handle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEFAULT, "Detected concurrent _DK event import, aborting", buf, 2u);
          }

          if (v7)
            *v7 = 1;
          v4 = (id)v26[5];

LABEL_16:
LABEL_22:
          _Block_object_dispose(&v25, 8);

          goto LABEL_23;
        }
      }
      else
      {
        pp_default_log_handle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v21 = v4[7];
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v21;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v14;
          _os_log_error_impl(&dword_1C392E000, v17, OS_LOG_TYPE_ERROR, "Failed to unarchive blob for key %@: %@", buf, 0x16u);
        }

      }
    }
    else if (v11)
    {
      pp_default_log_handle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "Detected concurrent _DK event import, aborting", buf, 2u);
      }

      if (v7)
        *v7 = 1;
      v4 = (id)v26[5];
      goto LABEL_16;
    }

    objc_msgSend(v4, "truncateRecordsByDroppingOldestMakingRoomForCount:txnWitness:", objc_msgSend(v8, "count"), v10);
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __103__PPRecordStorageHelper__importDuetEventBatch_lastDKImportDate_isComplete_eventImportBlock_txnWitness___block_invoke;
    v32 = &unk_1E7E16C70;
    v39 = sel__importDuetEventBatch_lastDKImportDate_isComplete_eventImportBlock_txnWitness_;
    v33 = v4;
    v34 = v10;
    v37 = v23;
    v18 = v8;
    v35 = v18;
    v38 = &v25;
    v36 = v11;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", buf);
    v4 = (id)v26[5];

    goto LABEL_22;
  }
LABEL_23:

  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v4;

}

void __103__PPRecordStorageHelper__importDuetEventBatch_lastDKImportDate_isComplete_eventImportBlock_txnWitness___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[5];
  _QWORD v36[4];
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("PPRecordStorageHelper.m"), 708, CFSTR("_DKEvent has nil UUID"));

  }
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "blobFromUUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  objc_msgSend(*(id *)(a1 + 40), "db");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT 1 FROM %@ WHERE dk_event_id = :uuidBlob"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v12 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __103__PPRecordStorageHelper__importDuetEventBatch_lastDKImportDate_isComplete_eventImportBlock_txnWitness___block_invoke_2;
  v36[3] = &unk_1E7E1F040;
  v13 = v9;
  v37 = v13;
  v35[0] = v12;
  v35[1] = 3221225472;
  v35[2] = __103__PPRecordStorageHelper__importDuetEventBatch_lastDKImportDate_isComplete_eventImportBlock_txnWitness___block_invoke_3;
  v35[3] = &unk_1E7E1BB80;
  v35[4] = &v38;
  objc_msgSend(v10, "prepAndRunQuery:onPrep:onRow:onError:", v11, v36, v35, 0);

  if (*((_BYTE *)v39 + 24))
  {
    pp_default_log_handle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "UUID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v43 = v32;
      _os_log_debug_impl(&dword_1C392E000, v14, OS_LOG_TYPE_DEBUG, "Skipping import of _DKEvent %@, already present", buf, 0xCu);

    }
  }
  else
  {
    +[PPSettings sharedInstance](PPSettings, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "source");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bundleID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "bundleIdentifierIsEnabledForCloudKit:", v17);

    if (v18)
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  if (a3 + 1 == objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    objc_msgSend(v5, "startDate");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

    v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    if (v22 && *(_QWORD *)(a1 + 56) && objc_msgSend(v22, "isEqualToDate:"))
    {
      pp_default_log_handle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138412290;
        v43 = v24;
        _os_log_impl(&dword_1C392E000, v23, OS_LOG_TYPE_DEFAULT, "_DKEvent.startDate %@ did not change across batch, bumping timestamp to avoid spin.", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 56), "dateByAddingTimeInterval:", 1.0);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v27 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = v25;

    }
    v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v34 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v28, 1, &v34);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v34;
    if (v29)
    {
      +[PPSQLKVStore storeBlob:forKey:transaction:](PPSQLKVStore, "storeBlob:forKey:transaction:", v29, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), *(_QWORD *)(a1 + 40));
    }
    else
    {
      pp_default_log_handle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v30;
        _os_log_error_impl(&dword_1C392E000, v31, OS_LOG_TYPE_ERROR, "Failed to serialize NSDate during _DK import: %@", buf, 0xCu);
      }

    }
  }

  _Block_object_dispose(&v38, 8);
}

uint64_t __103__PPRecordStorageHelper__importDuetEventBatch_lastDKImportDate_isComplete_eventImportBlock_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSData:", ":uuidBlob", *(_QWORD *)(a1 + 32));
}

uint64_t __103__PPRecordStorageHelper__importDuetEventBatch_lastDKImportDate_isComplete_eventImportBlock_txnWitness___block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E0D81788];
}

void __92__PPRecordStorageHelper__addEventsSourcedOnLastImportDateToSet_lastDKImportDate_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v7 = a2;
  +[PPSourceStorage matchAccuracyForSecondsFrom1970](PPSourceStorage, "matchAccuracyForSecondsFrom1970");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSince1970");
  objc_msgSend(v7, "bindNamedParam:toDouble:", ":before_timestamp", v5 - v4);
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSince1970");
  objc_msgSend(v7, "bindNamedParam:toDouble:", ":after_timestamp", v4 + v6);

}

uint64_t __92__PPRecordStorageHelper__addEventsSourcedOnLastImportDateToSet_lastDKImportDate_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  id v5;
  void *v6;
  unsigned __int8 *v7;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)v3[1];
  v5 = a2;
  objc_msgSend(v3, "uuidForStatement:columnName:tableName:", v5, "dk_event_id", objc_msgSend(v4, "UTF8String"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  v7 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v7;
}

void __86__PPRecordStorageHelper_fixupDKEventsMetadataWithShouldContinueBlock_database_client___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[16];

  v5 = a2;
  if (((*(uint64_t (**)(void))(a1[6] + 16))() & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0D81598];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __86__PPRecordStorageHelper_fixupDKEventsMetadataWithShouldContinueBlock_database_client___block_invoke_125;
    v14[3] = &unk_1E7E1FCE8;
    v7 = a1[4];
    v14[4] = a1[5];
    v15 = v5;
    objc_msgSend(v6, "runAsyncOnQueue:afterDelaySeconds:block:", v7, v14, 0.0);
    if (((*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(a1[6] + 16))(a1[6], v8, v9, v10, v11) & 1) == 0)
    {
      pp_default_log_handle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEFAULT, "Deferring fix up of Duet stream.", buf, 2u);
      }

      *a3 = 1;
    }

  }
  else
  {
    pp_default_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "Deferring fix up of Duet stream.", buf, 2u);
    }

    *a3 = 1;
  }

}

void __86__PPRecordStorageHelper_fixupDKEventsMetadataWithShouldContinueBlock_database_client___block_invoke_126(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("%@_%@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), CFSTR("DuetStreamFixedUp"));
  +[PPSQLKVStore setNumber:forKey:transaction:](PPSQLKVStore, "setNumber:forKey:transaction:", MEMORY[0x1E0C9AAB0], v5, v4);

}

void __86__PPRecordStorageHelper_fixupDKEventsMetadataWithShouldContinueBlock_database_client___block_invoke_125(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  __int128 v15;
  id (*v16)(uint64_t, void *);
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!v1)
  {
    v11 = 0;
LABEL_16:
    pp_default_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v15) = 138412290;
      *(_QWORD *)((char *)&v15 + 4) = v11;
      _os_log_error_impl(&dword_1C392E000, v13, OS_LOG_TYPE_ERROR, "Error cleaning events in Duet stream: %@", (uint8_t *)&v15, 0xCu);
    }

    goto LABEL_19;
  }
  objc_msgSend(*(id *)(a1 + 40), "_pas_filteredArrayWithTest:", &__block_literal_global_4755);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "count"))
  {

    v11 = 0;
    goto LABEL_19;
  }
  v3 = *(void **)(v1 + 40);
  v14 = 0;
  v4 = objc_msgSend(v3, "deleteEvents:error:", v2, &v14);
  v5 = v14;
  if ((v4 & 1) != 0)
  {
    *(_QWORD *)&v15 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v15 + 1) = 3221225472;
    v16 = __67__PPRecordStorageHelper__cleanUpMalformedMetadataDuetEvents_error___block_invoke_128;
    v17 = &unk_1E7E16BB0;
    v18 = v1;
    objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*(id *)(v1 + 40), "saveEvents:stream:maxRetries:retryInterval:shouldContinueBlock:", v6, *(_QWORD *)(v1 + 48), -1, &__block_literal_global_133, 5.0);
    if ((v7 & 1) == 0)
    {
      pp_default_log_handle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEFAULT, "Unable to save fixed up events to Duet", buf, 2u);
      }

    }
    pp_default_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_INFO, "Completed cleanup of malformed Duet events.", buf, 2u);
    }

    v10 = 0;
  }
  else
  {
    pp_default_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_error_impl(&dword_1C392E000, v12, OS_LOG_TYPE_ERROR, "Error deleting incompatible events: %@", buf, 0xCu);
    }

    v10 = objc_retainAutorelease(v5);
    v7 = 0;
  }

  v11 = v10;
  if ((v7 & 1) == 0)
    goto LABEL_16;
LABEL_19:

}

id __67__PPRecordStorageHelper__cleanUpMalformedMetadataDuetEvents_error___block_invoke_128(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint8_t *v19;
  __int16 v21;
  __int16 v22;

  v3 = a2;
  objc_msgSend(v3, "stream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15928], "entityStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (!v6)
  {
    objc_msgSend(v7, "topicRecordFromEvent:", v3);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v9 = (void *)v14;
      v15 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      objc_msgSend(v3, "source");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "deviceID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "eventForTopicRecord:sourceDeviceID:", v9, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    pp_default_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 0;
      v18 = "PPRecordStorageHelper: unable to generate topic record for Duet event.";
      v19 = (uint8_t *)&v21;
      goto LABEL_11;
    }
LABEL_12:

    v16 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v7, "namedEntityRecordFromEvent:", v3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    pp_default_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 0;
      v18 = "PPRecordStorageHelper: unable to generate entity record for Duet event.";
      v19 = (uint8_t *)&v22;
LABEL_11:
      _os_log_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEFAULT, v18, v19, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  v9 = (void *)v8;
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(v3, "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deviceID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "eventForNamedEntityRecord:sourceDeviceID:", v9, v12);
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v16 = (void *)v13;

LABEL_13:
  return v16;
}

uint64_t __67__PPRecordStorageHelper__cleanUpMalformedMetadataDuetEvents_error___block_invoke_131()
{
  return 1;
}

BOOL __67__PPRecordStorageHelper__cleanUpMalformedMetadataDuetEvents_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  void *v5;

  objc_msgSend(a2, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("compatVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D15920], "compatibilityVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

void __78__PPRecordStorageHelper__dkEventMetadataFixupHasCompletedWithDatabase_client___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v8 = (id)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("%@_%@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), CFSTR("DuetStreamFixedUp"));
  +[PPSQLKVStore numberForKey:transaction:](PPSQLKVStore, "numberForKey:transaction:", v8, v4);
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __77__PPRecordStorageHelper_duetEventDeletionProcessingBlockWithDatabase_client___block_invoke(int8x16_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  void *v11;
  void *v12;
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
  uint64_t v27;
  id v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int8x16_t v41;
  _QWORD v42[4];
  NSObject *v43;
  uint64_t v44;
  id obj;
  _QWORD v46[4];
  int8x16_t v47;
  _BYTE *v48;
  __int8 v49;
  id location;
  _QWORD v51[6];
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  id v61;
  void *v62;
  void *v63;
  _BYTE v64[24];
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  _QWORD v68[6];

  v68[3] = *MEMORY[0x1E0C80C00];
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__4580;
  v56 = __Block_byref_object_dispose__4581;
  v57 = 0;
  v2 = a1[3].u8[0];
  v3 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __77__PPRecordStorageHelper_duetEventDeletionProcessingBlockWithDatabase_client___block_invoke_2;
  v51[3] = &unk_1E7E1EF00;
  v4 = (void *)a1[2].i64[0];
  v51[4] = a1[2].i64[1];
  v51[5] = &v52;
  objc_msgSend(v4, "readTransactionWithClient:block:", v2, v51);
  if (v53[5])
  {
    pp_default_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      goto LABEL_5;
    v6 = *(_QWORD *)(a1[2].i64[1] + 8);
    v7 = v53[5];
    *(_DWORD *)v64 = 138412546;
    *(_QWORD *)&v64[4] = v6;
    *(_WORD *)&v64[12] = 2112;
    *(_QWORD *)&v64[14] = v7;
    v8 = "dkEventDeletionProcessingBlock(%@): processing _DKEvent deletions after: %@";
    v9 = v5;
    v10 = 22;
  }
  else
  {
    pp_default_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      goto LABEL_5;
    v39 = *(_QWORD *)(a1[2].i64[1] + 8);
    *(_DWORD *)v64 = 138412290;
    *(_QWORD *)&v64[4] = v39;
    v8 = "dkEventDeletionProcessingBlock(%@): processing all _DKEvent deletions";
    v9 = v5;
    v10 = 12;
  }
  _os_log_debug_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEBUG, v8, v64, v10);
LABEL_5:

  if (v53[5])
    objc_msgSend(MEMORY[0x1E0D15A08], "predicateForEventsWithStartDateAfter:");
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D15A08];
  objc_msgSend(MEMORY[0x1E0D15B08], "eventStreamName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[2].i64[1] + 48), "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateForObjectsWithMetadataKey:andStringValue:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D15A08];
  objc_msgSend(MEMORY[0x1E0D15B08], "eventSourceDeviceID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "predicateForObjectsWithMetadataKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0CB3528];
  v68[0] = v11;
  v68[1] = v15;
  v68[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "andPredicateWithSubpredicates:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  location = 0;
  *(_QWORD *)v64 = 0;
  *(_QWORD *)&v64[8] = v64;
  *(_QWORD *)&v64[16] = 0x3032000000;
  v65 = __Block_byref_object_copy__4580;
  v66 = __Block_byref_object_dispose__4581;
  v67 = 0;
  v22 = *(void **)(a1[2].i64[1] + 40);
  objc_msgSend(v22, "tombstoneStream");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AD0], "startDateSortDescriptorAscending:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(*(id *)(a1[2].i64[1] + 40), "readBatchSize");
  v46[0] = v3;
  v46[1] = 3221225472;
  v46[2] = __77__PPRecordStorageHelper_duetEventDeletionProcessingBlockWithDatabase_client___block_invoke_112;
  v46[3] = &unk_1E7E16AF0;
  v41 = a1[2];
  v28 = (id)v41.i64[0];
  v47 = vextq_s8(v41, v41, 8uLL);
  v49 = a1[3].i8[0];
  v48 = v64;
  LOBYTE(v22) = objc_msgSend(v22, "iterEventBatchesMatchingPredicate:streams:sortDescriptors:batchSize:readMetaData:remoteOnly:error:block:", v21, v24, v26, v27, 0, 0, &location, v46);

  if ((v22 & 1) == 0)
  {
    pp_default_log_handle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v38 = *(_QWORD *)(a1[2].i64[1] + 8);
      *(_DWORD *)buf = 138412546;
      v59 = v38;
      v60 = 2112;
      v61 = location;
      _os_log_error_impl(&dword_1C392E000, v29, OS_LOG_TYPE_ERROR, "dkEventDeletionProcessingBlock(%@): failed to load tombstone events: %@", buf, 0x16u);
    }

  }
  if (*(_QWORD *)(*(_QWORD *)&v64[8] + 40))
  {
    v30 = location;
    location = 0;

    v31 = *(_QWORD *)(*(_QWORD *)&v64[8] + 40);
    obj = location;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v31, 1, &obj);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(&location, obj);
    if (v32)
    {
      v33 = (void *)a1[2].i64[0];
      v34 = a1[3].u8[0];
      v42[0] = v3;
      v42[1] = 3221225472;
      v42[2] = __77__PPRecordStorageHelper_duetEventDeletionProcessingBlockWithDatabase_client___block_invoke_114;
      v42[3] = &unk_1E7E1DCA8;
      v35 = v32;
      v36 = a1[2].i64[1];
      v43 = v35;
      v44 = v36;
      objc_msgSend(v33, "writeTransactionWithClient:block:", v34, v42);
      v37 = v43;
    }
    else
    {
      pp_default_log_handle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        v40 = *(_QWORD *)(a1[2].i64[1] + 8);
        *(_DWORD *)buf = 138412546;
        v59 = v40;
        v60 = 2112;
        v61 = location;
        _os_log_debug_impl(&dword_1C392E000, v37, OS_LOG_TYPE_DEBUG, "dkEventDeletionProcessingBlock(%@): failed to serialize NSDate: %@", buf, 0x16u);
      }
    }

  }
  _Block_object_dispose(v64, 8);

  _Block_object_dispose(&v52, 8);
}

void __77__PPRecordStorageHelper_duetEventDeletionProcessingBlockWithDatabase_client___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    +[PPSQLKVStore loadBlobForKey:transaction:](PPSQLKVStore, "loadBlobForKey:transaction:", *(_QWORD *)(v3 + 64), a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v11 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v11);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = v11;
      if (!v5)
      {
        pp_default_log_handle();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v10 = *(_QWORD *)(v3 + 64);
          *(_DWORD *)buf = 138412546;
          v13 = v10;
          v14 = 2112;
          v15 = v6;
          _os_log_error_impl(&dword_1C392E000, v7, OS_LOG_TYPE_ERROR, "Failed to unarchive NSDate for KVS key %@: %@", buf, 0x16u);
        }

      }
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

void __77__PPRecordStorageHelper_duetEventDeletionProcessingBlockWithDatabase_client___block_invoke_112(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  id *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE buf[24];
  void *v39;
  uint64_t v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 56);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v7 = v8;
  v9 = a2;
  v10 = v2;
  v11 = v10;
  v33 = v3;
  if (v3)
  {
    v27 = v4;
    v29 = v10;
    v32 = v6;
    objc_msgSend(v9, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "startDate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v28 = v13;
    v31 = v7;
    v14 = (void *)objc_opt_new();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v30 = v9;
    v15 = v9;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v35 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v20, "stringValue");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21
            && (v22 = objc_alloc(MEMORY[0x1E0CB3A28]),
                objc_msgSend(v20, "stringValue"),
                v23 = (void *)objc_claimAutoreleasedReturnValue(),
                v24 = objc_msgSend(v22, "initWithUUIDString:", v23),
                v23,
                v24))
          {
            objc_msgSend(v14, "addObject:", v24);
          }
          else
          {
            pp_default_log_handle();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              v25 = *(_QWORD *)(v33 + 8);
              objc_msgSend(v20, "stringValue");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v25;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v26;
              _os_log_error_impl(&dword_1C392E000, v24, OS_LOG_TYPE_ERROR, "dkEventDeletionProcessingBlock(%@): tombstone event contains bad UUIDString: \"%@\", buf, 0x16u);

            }
          }

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v17);
    }

    v11 = v29;
    if (objc_msgSend(v14, "count"))
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __87__PPRecordStorageHelper__processTombstoneEventBatch_database_client_lastTombstoneDate___block_invoke;
      v39 = &unk_1E7E1DCA8;
      v40 = v33;
      v41 = v14;
      objc_msgSend(v29, "writeTransactionWithClient:block:", v27, buf);

    }
    v7 = v31;
    v6 = v32;
    v9 = v30;
  }

  objc_storeStrong(v6, v7);
}

uint64_t __77__PPRecordStorageHelper_duetEventDeletionProcessingBlockWithDatabase_client___block_invoke_114(uint64_t a1, uint64_t a2)
{
  return +[PPSQLKVStore storeBlob:forKey:transaction:](PPSQLKVStore, "storeBlob:forKey:transaction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64), a2);
}

void __87__PPRecordStorageHelper__processTombstoneEventBatch_database_client_lastTombstoneDate___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;
  objc_class *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  if (v3)
  {
    v5 = (objc_class *)MEMORY[0x1E0CB3940];
    v6 = a2;
    v7 = (void *)objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("SELECT id FROM %@ WHERE dk_event_id IN _pas_nsarray(:eventUUIDBlobs) AND is_remote"), v3[1]);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __79__PPRecordStorageHelper__cleanDatabaseOfCloudSyncedEventsWithUUIDs_txnWitness___block_invoke;
    v8[3] = &unk_1E7E189A0;
    v9 = v4;
    v10 = v3;
    -[PPRecordStorageHelper _deleteRecordsWithRowIdsFromQuery:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:bind:](v3, v7, v6, 0, 0, v8);

  }
}

void __79__PPRecordStorageHelper__cleanDatabaseOfCloudSyncedEventsWithUUIDs_txnWitness___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__PPRecordStorageHelper__cleanDatabaseOfCloudSyncedEventsWithUUIDs_txnWitness___block_invoke_2;
  v5[3] = &unk_1E7E16B40;
  v2 = *(void **)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  v3 = a2;
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSArray:", ":eventUUIDBlobs", v4);

}

uint64_t __79__PPRecordStorageHelper__cleanDatabaseOfCloudSyncedEventsWithUUIDs_txnWitness___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "blobFromUUID:", a2);
}

void __77__PPRecordStorageHelper_rowIdsForRecordsToDropMakingRoomForCount_txnWitness___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unsigned int v4;
  BOOL v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  _QWORD v20[5];

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  LODWORD(v3) = *(_DWORD *)(v3 + 32);
  v4 = *(_DWORD *)(a1 + 64);
  v5 = v3 >= v4;
  v6 = v3 - v4;
  if (v5)
    v7 = v6;
  else
    v7 = 0;
  objc_msgSend(v2, "db");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfRowsInTable:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  if (v9 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), v9, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  }
  v10 = __OFSUB__(v9, v7);
  v11 = v9 - v7;
  if (!((v11 < 0) ^ v10 | (v11 == 0)))
  {
    if (v11 <= 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PPRecordStorageHelper.m"), 304, CFSTR("Removing non-positive row count"));

    }
    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT rt.id FROM %@ AS rt INNER JOIN sources AS src ON rt.source_id = src.id ORDER BY src.seconds_from_1970 ASC LIMIT :rowsToRemove "), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "UTF8String");
    objc_msgSend(*(id *)(a1 + 40), "db");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __77__PPRecordStorageHelper_rowIdsForRecordsToDropMakingRoomForCount_txnWitness___block_invoke_2;
    v20[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
    v20[4] = v11;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __77__PPRecordStorageHelper_rowIdsForRecordsToDropMakingRoomForCount_txnWitness___block_invoke_3;
    v17[3] = &unk_1E7E16AC8;
    v18 = *(id *)(a1 + 48);
    v19 = v12;
    objc_msgSend(v13, "prepAndRunQuery:onPrep:onRow:onError:", v16, v20, v17, 0);

  }
}

uint64_t __77__PPRecordStorageHelper_rowIdsForRecordsToDropMakingRoomForCount_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", ":rowsToRemove", *(_QWORD *)(a1 + 32));
}

uint64_t __77__PPRecordStorageHelper_rowIdsForRecordsToDropMakingRoomForCount_txnWitness___block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(a2, "getInt64ForColumnName:table:", "id", *(_QWORD *)(a1 + 40)));
  return *MEMORY[0x1E0D81780];
}

void __86__PPRecordStorageHelper_truncateRecordsByDroppingOldestMakingRoomForCount_txnWitness___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "rowIdsForRecordsToDropMakingRoomForCount:txnWitness:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteRecordsForRowIds:txnWitness:atLeastOneClusterRemoved:deletedCount:", v3, *(_QWORD *)(a1 + 40), 0, 0);

}

void __68__PPRecordStorageHelper_decayFeedbackWithDatabase_client_decayRate___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *context;
  _QWORD v20[6];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  context = (void *)MEMORY[0x1C3BD6630]();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_lastDecayDate"), *(_QWORD *)(a1[4] + 16));
  +[PPSQLKVStore loadBlobForKey:transaction:](PPSQLKVStore, "loadBlobForKey:transaction:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v22);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v22;
    if (!v6)
    {
      +[PPSQLKVStore removeBlobForKey:transaction:](PPSQLKVStore, "removeBlobForKey:transaction:", v4, v3);
      pp_default_log_handle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_13:

        v6 = 0;
        goto LABEL_17;
      }
      *(_DWORD *)buf = 138412546;
      v24 = v4;
      v25 = 2112;
      v26 = v7;
      v11 = "Clearing key %@ because the blob failed to deserialize: %@";
LABEL_19:
      _os_log_error_impl(&dword_1C392E000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0x16u);
      goto LABEL_13;
    }
    objc_msgSend(v6, "timeIntervalSinceNow");
    v9 = v8 / -86400.0;
    if (v8 / -86400.0 < 0.25)
    {
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
      goto LABEL_17;
    }

  }
  else
  {
    v7 = 0;
    v9 = 1.0;
  }
  v12 = v7;
  v13 = (void *)MEMORY[0x1E0CB36F8];
  v14 = (void *)objc_opt_new();
  v21 = v12;
  objc_msgSend(v13, "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;

  if (!v6)
  {
    pp_default_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_DWORD *)buf = 138412546;
    v24 = v4;
    v25 = 2112;
    v26 = v7;
    v11 = "Unable to serialize date for key %@: %@";
    goto LABEL_19;
  }
  objc_msgSend(v3, "db");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UPDATE %@ SET pseudocount = :decayFactor * pseudocount"), *(_QWORD *)(a1[4] + 16), context);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __68__PPRecordStorageHelper_decayFeedbackWithDatabase_client_decayRate___block_invoke_90;
  v20[3] = &__block_descriptor_48_e29_v16__0___PASSqliteStatement_8l;
  v20[4] = a1[6];
  *(double *)&v20[5] = v9;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v15, "prepAndRunQuery:onPrep:onRow:onError:", v16, v20, 0, 0);

  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    +[PPSQLKVStore storeBlob:forKey:transaction:](PPSQLKVStore, "storeBlob:forKey:transaction:", v6, v4, v3);
  }
  else
  {
    pp_default_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = *(void **)(a1[4] + 16);
      *(_DWORD *)buf = 138412290;
      v24 = v18;
      _os_log_impl(&dword_1C392E000, v17, OS_LOG_TYPE_INFO, "Decaying feedback counts UPSERT transaction failed for table %@", buf, 0xCu);
    }

  }
LABEL_17:

  objc_autoreleasePoolPop(context);
}

uint64_t __68__PPRecordStorageHelper_decayFeedbackWithDatabase_client_decayRate___block_invoke_90(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toDouble:", ":decayFactor", (double)exp(-(*(double *)(a1 + 32) * *(double *)(a1 + 40))));
}

void __82__PPRecordStorageHelper_storeFeedback_database_client_lowercaseItemStrings_limit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  char v20;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "feedbackItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__PPRecordStorageHelper_storeFeedback_database_client_lowercaseItemStrings_limit___block_invoke_2;
  v14[3] = &unk_1E7E16A50;
  v19 = *(_DWORD *)(a1 + 72);
  v17 = *(_QWORD *)(a1 + 56);
  v12 = v3;
  v15 = v12;
  v16 = *(id *)(a1 + 40);
  v20 = *(_BYTE *)(a1 + 76);
  v18 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v14);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(v12, "db");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "numberOfRowsInTable:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16));

    if (v7 > *(unsigned int *)(a1 + 72))
    {
      v8 = (void *)MEMORY[0x1C3BD6630]();
      v9 = v7 - *(unsigned int *)(a1 + 72);
      objc_msgSend(v12, "db");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM %@ ORDER BY last_update_seconds_from_1970 LIMIT :excessRowCount"), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16));
      v13[0] = v5;
      v13[1] = 3221225472;
      v13[2] = __82__PPRecordStorageHelper_storeFeedback_database_client_lowercaseItemStrings_limit___block_invoke_4;
      v13[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
      v13[4] = v9;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v10, "prepAndRunQuery:onPrep:onRow:onError:", v11, v13, 0, 0);

      objc_autoreleasePoolPop(v8);
    }
  }

}

void __82__PPRecordStorageHelper_storeFeedback_database_client_lowercaseItemStrings_limit___block_invoke_2(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  char v14;

  v7 = a2;
  if (*(unsigned int *)(a1 + 64) <= a3)
  {
    *a4 = 1;

  }
  else
  {
    v10 = v7;
    objc_msgSend(*(id *)(a1 + 32), "db");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __82__PPRecordStorageHelper_storeFeedback_database_client_lowercaseItemStrings_limit___block_invoke_3;
    v11[3] = &unk_1E7E16A28;
    v14 = *(_BYTE *)(a1 + 68);
    v12 = v10;
    v13 = *(_QWORD *)(a1 + 56);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v8, "prepAndRunQuery:onPrep:onRow:onError:", v9, v11, 0, 0);

    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      *a4 = 1;

  }
}

uint64_t __82__PPRecordStorageHelper_storeFeedback_database_client_lowercaseItemStrings_limit___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toInt64:", ":excessRowCount", *(_QWORD *)(a1 + 32));
}

void __82__PPRecordStorageHelper_storeFeedback_database_client_lowercaseItemStrings_limit___block_invoke_3(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v3 = *(unsigned __int8 *)(a1 + 48);
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "itemString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    v9 = v6;
    objc_msgSend(v6, "lowercaseString");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  v10 = v7;
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":itemString", v7);
  objc_msgSend(v5, "bindNamedParam:toInteger:", ":feedbackType", objc_msgSend(*(id *)(a1 + 32), "itemFeedbackType"));
  objc_msgSend(v5, "bindNamedParam:toDouble:", ":lastUpdateSecondsFrom1970", *(double *)(a1 + 40));

}

void __76__PPRecordStorageHelper_decayedFeedbackCountsForItemString_database_client___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__PPRecordStorageHelper_decayedFeedbackCountsForItemString_database_client___block_invoke_2;
  v11[3] = &unk_1E7E1F040;
  v5 = *(_QWORD *)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __76__PPRecordStorageHelper_decayedFeedbackCountsForItemString_database_client___block_invoke_3;
  v7[3] = &unk_1E7E169D8;
  v6 = *(_OWORD *)(a1 + 72);
  v8 = *(_OWORD *)(a1 + 56);
  v9 = v6;
  v10 = *(_QWORD *)(a1 + 88);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", v5, v11, v7, 0);

}

void __76__PPRecordStorageHelper_decayedFeedbackCountsForItemString_database_client___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":engagedExplicitly", 1);
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":engagedImplicitly", 2);
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":rejectedExplicitly", 3);
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":rejectedImplicitly", 4);
  objc_msgSend(v3, "bindNamedParam:toNSString:", ":itemString", *(_QWORD *)(a1 + 32));

}

uint64_t __76__PPRecordStorageHelper_decayedFeedbackCountsForItemString_database_client___block_invoke_3(_QWORD *a1, void *a2)
{
  objc_class *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (objc_class *)MEMORY[0x1E0C99D68];
  v4 = a2;
  v5 = objc_msgSend([v3 alloc], "initWithTimeIntervalSince1970:", (double)objc_msgSend(v4, "getInt64ForColumnAlias:", "latest_date"));
  v6 = *(_QWORD *)(a1[4] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(v4, "getDoubleForColumnAlias:", "engaged_explicitly");
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v8;
  objc_msgSend(v4, "getDoubleForColumnAlias:", "engaged_implicitly");
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v9;
  objc_msgSend(v4, "getDoubleForColumnAlias:", "rejected_explicitly");
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = v10;
  objc_msgSend(v4, "getDoubleForColumnAlias:", "rejected_implicitly");
  v12 = v11;

  *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = v12;
  return *MEMORY[0x1E0D81788];
}

void __98__PPRecordStorageHelper_clearWithDatabase_client_deletedCount_error_clearExternalTableReferences___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = a1[5];
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v8);
  v4 = (_QWORD *)a1[4];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT id FROM %@"), v4[1]);
  -[PPRecordStorageHelper _deleteRecordsWithRowIdsFromQuery:txnWitness:atLeastOneRecordClusterRemoved:deletedCount:bind:](v4, v5, v8, 0, a1[6], 0);

  objc_msgSend(v8, "db");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM %@"), *(_QWORD *)(a1[4] + 16));
  objc_msgSend(v6, "prepAndRunQuery:onPrep:onRow:onError:", v7, 0, 0, 0);

  +[PPSQLKVStore removeBlobForKey:transaction:](PPSQLKVStore, "removeBlobForKey:transaction:", *(_QWORD *)(a1[4] + 56), v8);
  +[PPSQLKVStore removeBlobForKey:transaction:](PPSQLKVStore, "removeBlobForKey:transaction:", *(_QWORD *)(a1[4] + 64), v8);

}

@end
