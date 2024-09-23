@implementation APOdmlTrainingRowBiomeQuery

- (APOdmlTrainingRowBiomeQuery)initWithRecipe:(id)a3
{
  id v4;
  APOdmlTrainingRowBiomeQuery *v5;
  APOdmlBiomeSQLQuery *v6;
  const char *v7;
  const char *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)APOdmlTrainingRowBiomeQuery;
  v5 = -[APOdmlTrainingRowBiomeQuery init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(APOdmlBiomeSQLQuery);
    objc_msgSend_setRawQuery_(v5, v7, (uint64_t)v6);

    objc_msgSend_setRecipe_(v5, v8, (uint64_t)v4);
  }

  return v5;
}

- (id)makeQuery
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  id v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  void *v34;
  id v35;
  const char *v36;
  void *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  _QWORD v47[5];
  id v48;
  uint64_t *v49;
  _QWORD v50[6];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;

  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = sub_1B69F9868;
  v61 = sub_1B69F9878;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v62 = (id)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = sub_1B69F9868;
  v55 = sub_1B69F9878;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v4, v5);
  v56 = (id)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_AdPlatforms(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ODML(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_TrainingRows(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_publisher(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = sub_1B69F9954;
  v50[3] = &unk_1E6A29D60;
  v50[4] = self;
  v50[5] = &v57;
  v21 = (id)objc_msgSend_sinkWithCompletion_receiveInput_(v18, v20, (uint64_t)&unk_1E6A29D38, v50);

  v22 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_recipe(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_coreMLRecipe(v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputNames(v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v22, v32, (uint64_t)v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = (void *)v58[5];
  v47[0] = v19;
  v47[1] = 3221225472;
  v47[2] = sub_1B69F99C8;
  v47[3] = &unk_1E6A29D88;
  v47[4] = self;
  v35 = v33;
  v48 = v35;
  v49 = &v51;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v34, v36, (uint64_t)v47);
  v37 = (void *)objc_opt_class();
  v38 = v52[5];
  objc_msgSend_recipe(self, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_validateRows_recipe_(v37, v42, v38, v41);

  v45 = (void *)objc_msgSend_copy((void *)v52[5], v43, v44);
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
  return v45;
}

+ (void)combineRecords:(id)a3 andSaveTo:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  int v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  int v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  void *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  double v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  id v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  void *v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  int v81;
  id v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend_adamID(v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    OdmlLogForCategory(0xCuLL);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    v81 = 138412290;
    v82 = (id)objc_opt_class();
    v67 = v82;
    _os_log_impl(&dword_1B69D6000, v24, OS_LOG_TYPE_ERROR, "[%@] Invalid training row. No Adam ID provided.", (uint8_t *)&v81, 0xCu);
LABEL_20:

    goto LABEL_21;
  }
  objc_msgSend_allKeys(v6, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v5, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_containsObject_(v12, v16, (uint64_t)v15);

  if (!v17)
  {
    objc_msgSend_dictionaryRepresentation(v5, v18, v19);
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v5, v74, v75);
    v67 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v76, (uint64_t)v24, v67);
    goto LABEL_20;
  }
  objc_msgSend_recordID(v5, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v21, (uint64_t)v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v22, v23, (uint64_t)CFSTR("AdRecords"));
  v24 = objc_claimAutoreleasedReturnValue();

  objc_msgSend_allKeys(v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_adamID(v5, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_containsObject_(v27, v31, (uint64_t)v30);

  if (!v32)
  {
    objc_msgSend_dictionaryRepresentation(v5, v33, v34);
    v67 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v67, v77, (uint64_t)CFSTR("AdRecords"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_adamID(v5, v78, v79);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v24, v80, (uint64_t)v70, v72);
    goto LABEL_19;
  }
  if (objc_msgSend_impressed(v5, v33, v34))
  {
    objc_msgSend_adamID(v5, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v24, v38, (uint64_t)v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v39, v40, MEMORY[0x1E0C9AAB0], CFSTR("Impressed"));

  }
  if (objc_msgSend_tapped(v5, v35, v36))
  {
    objc_msgSend_adamID(v5, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v24, v44, (uint64_t)v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v45, v46, MEMORY[0x1E0C9AAB0], CFSTR("Tapped"));

  }
  if (objc_msgSend_dupe(v5, v41, v42))
  {
    objc_msgSend_adamID(v5, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v24, v50, (uint64_t)v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v51, v52, MEMORY[0x1E0C9AAB0], CFSTR("Dupe"));

  }
  if (objc_msgSend_installed(v5, v47, v48))
  {
    objc_msgSend_adamID(v5, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v24, v56, (uint64_t)v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v57, v58, MEMORY[0x1E0C9AAB0], CFSTR("AppInstalled"));

  }
  if (objc_msgSend_hasErrorCode(v5, v53, v54))
  {
    objc_msgSend_errorCode(v5, v59, v60);
    if (v63 != (double)0)
    {
      v64 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend_errorCode(v5, v61, v62);
      objc_msgSend_numberWithDouble_(v64, v65, v66);
      v67 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_adamID(v5, v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v24, v71, (uint64_t)v70);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v72, v73, (uint64_t)v67, CFSTR("rerankingErrorCode"));
LABEL_19:

      goto LABEL_20;
    }
  }
LABEL_21:

}

+ (void)trainingRowsFromBiomeEvent:(id)a3 recordID:(id)a4 requiredFeatures:(id)a5 andSaveTo:(id)a6
{
  id v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v9 = a4;
  v10 = a6;
  objc_msgSend_trainingRowsFromDESRecord_featuresRequired_(APOdmlTrainingSetBuilder, v11, (uint64_t)a3, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1B69F9EFC;
  v16[3] = &unk_1E6A29DB0;
  v15 = v9;
  v17 = v15;
  objc_msgSend_enumerateObjectsUsingBlock_(v12, v13, (uint64_t)v16);
  if (v12)
    objc_msgSend_addObjectsFromArray_(v10, v14, (uint64_t)v12);

}

+ (void)validateRows:(id)a3 recipe:(id)a4
{
  id v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  const char *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB3788];
  v7 = a3;
  objc_msgSend_indexSet(v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1B69FA048;
  v15[3] = &unk_1E6A29DD8;
  v16 = v5;
  v17 = v10;
  v11 = v10;
  v14 = v5;
  objc_msgSend_enumerateObjectsUsingBlock_(v7, v12, (uint64_t)v15);
  objc_msgSend_removeObjectsAtIndexes_(v7, v13, (uint64_t)v11);

}

- (APOdmlBiomeSQLQuery)rawQuery
{
  return self->_rawQuery;
}

- (void)setRawQuery:(id)a3
{
  objc_storeStrong((id *)&self->_rawQuery, a3);
}

- (APOdmlRecipe)recipe
{
  return self->_recipe;
}

- (void)setRecipe:(id)a3
{
  objc_storeStrong((id *)&self->_recipe, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_rawQuery, 0);
}

@end
