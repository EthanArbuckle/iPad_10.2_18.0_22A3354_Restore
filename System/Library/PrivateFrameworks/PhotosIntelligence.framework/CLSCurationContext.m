@implementation CLSCurationContext

- (CLSCurationContext)initWithPhotoLibrary:(id)a3 curationSession:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  CLSCurationContext *v10;

  v6 = (objc_class *)MEMORY[0x24BDE36A8];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithPhotoLibrary:", v8);

  v10 = -[CLSCurationContext initWithUserFeedbackCalculator:curationSession:](self, "initWithUserFeedbackCalculator:curationSession:", v9, v7);
  return v10;
}

- (CLSCurationContext)initWithUserFeedbackCalculator:(id)a3 curationSession:(id)a4
{
  id v7;
  id v8;
  CLSCurationContext *v9;
  CLSCurationContext *v10;
  uint64_t v11;
  PHPhotoLibrary *photoLibrary;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLSCurationContext;
  v9 = -[CLSCurationContext init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userFeedbackCalculator, a3);
    objc_msgSend(v7, "photoLibrary");
    v11 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v10->_photoLibrary;
    v10->_photoLibrary = (PHPhotoLibrary *)v11;

    objc_storeStrong((id *)&v10->_curationSession, a4);
  }

  return v10;
}

- (CLSCurationContext)initWithPhotoLibrary:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  CLSCurationSession *v7;
  CLSCurationContext *v8;

  v4 = (objc_class *)MEMORY[0x24BDE36A8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithPhotoLibrary:", v5);

  v7 = objc_alloc_init(CLSCurationSession);
  v8 = -[CLSCurationContext initWithUserFeedbackCalculator:curationSession:](self, "initWithUserFeedbackCalculator:curationSession:", v6, v7);

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)CLSCurationContext;
  -[CLSCurationContext description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %tu verified persons, %tu hidden/blocked persons, %tu merge candidates"), v4, -[NSSet count](self->_verifiedPersonUUIDs, "count"), -[NSSet count](self->_hiddenOrBlockedPersonUUIDs, "count"), -[NSDictionary count](self->_personUUIDByMergeCandidateUUID, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)verifiedPersonUUIDs
{
  CLSCurationContext *v2;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_verifiedPersonUUIDs)
    -[CLSCurationContext _loadPersonAndMergeCandidateUUIDs](v2, "_loadPersonAndMergeCandidateUUIDs");
  objc_sync_exit(v2);

  return v2->_verifiedPersonUUIDs;
}

- (id)hiddenOrBlockedPersonUUIDs
{
  CLSCurationContext *v2;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_hiddenOrBlockedPersonUUIDs)
    -[CLSCurationContext _loadPersonAndMergeCandidateUUIDs](v2, "_loadPersonAndMergeCandidateUUIDs");
  objc_sync_exit(v2);

  return v2->_hiddenOrBlockedPersonUUIDs;
}

- (id)nonPetFacedPersonLocalIdentifiers
{
  CLSCurationContext *v2;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_nonPetFacedPersonLocalIdentifiers)
    -[CLSCurationContext _loadNonPetFacedPersonLocalIdentifiers](v2, "_loadNonPetFacedPersonLocalIdentifiers");
  objc_sync_exit(v2);

  return v2->_nonPetFacedPersonLocalIdentifiers;
}

- (id)personUUIDByMergeCandidateUUID
{
  CLSCurationContext *v2;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_personUUIDByMergeCandidateUUID)
    -[CLSCurationContext _loadPersonAndMergeCandidateUUIDs](v2, "_loadPersonAndMergeCandidateUUIDs");
  objc_sync_exit(v2);

  return v2->_personUUIDByMergeCandidateUUID;
}

- (void)_loadPersonAndMergeCandidateUUIDs
{
  NSObject *v3;
  id v4;
  os_signpost_id_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSDictionary *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSSet *v18;
  CLSCurationContext *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  NSSet *verifiedPersonUUIDs;
  NSSet *v27;
  NSSet *hiddenOrBlockedPersonUUIDs;
  NSSet *v29;
  NSDictionary *personUUIDByMergeCandidateUUID;
  uint64_t v31;
  uint32_t denom;
  uint32_t numer;
  id v34;
  NSObject *v35;
  os_signpost_id_t spid;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  id obj;
  uint64_t v41;
  NSSet *v42;
  NSSet *v43;
  uint64_t v44;
  void *context;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  mach_timebase_info info;
  uint8_t buf[4];
  CLSCurationContext *v56;
  __int16 v57;
  double v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  v4 = MEMORY[0x24BDACB70];
  v5 = os_signpost_id_generate(v3);
  info = 0;
  mach_timebase_info(&info);
  v6 = v3;
  v38 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_BEGIN, v5, "LoadPersonAndMergeCandidateUUIDs", ", buf, 2u);
  }
  spid = v5;

  v37 = mach_absolute_time();
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPersonContext:", 1);
  v39 = v7;
  objc_msgSend(MEMORY[0x24BDE35E0], "fetchPersonsWithOptions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v9 = objc_alloc(MEMORY[0x24BDBCEF0]);
  -[CLSCurationContext userFeedbackCalculator](self, "userFeedbackCalculator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "personUUIDsWithNegativeFeedback");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (NSSet *)objc_msgSend(v9, "initWithSet:", v11);

  v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v13 = objc_alloc_init(MEMORY[0x24BDD14E0]);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v8;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  v44 = v14;
  if (v14)
  {
    v41 = *(_QWORD *)v51;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v51 != v41)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v15);
        context = (void *)MEMORY[0x249506444](v14);
        objc_msgSend(v16, "uuid", spid);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "type") == -1)
          v18 = v42;
        else
          v18 = v43;
        -[NSSet addObject:](v18, "addObject:", v17);
        v19 = self;
        -[CLSCurationContext _mergeCandidateUUIDsForPerson:](self, "_mergeCandidateUUIDsForPerson:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v47;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v47 != v23)
                objc_enumerationMutation(v20);
              v25 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
              objc_msgSend(v13, "addObject:", v25);
              if (objc_msgSend(v13, "countForObject:", v25) == 1)
                -[NSDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v17, v25);
              else
                -[NSDictionary removeObjectForKey:](v12, "removeObjectForKey:", v25);
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
          }
          while (v22);
        }

        objc_autoreleasePoolPop(context);
        ++v15;
        self = v19;
      }
      while (v15 != v44);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
      v44 = v14;
    }
    while (v14);
  }

  verifiedPersonUUIDs = self->_verifiedPersonUUIDs;
  self->_verifiedPersonUUIDs = v43;
  v27 = v43;

  hiddenOrBlockedPersonUUIDs = self->_hiddenOrBlockedPersonUUIDs;
  self->_hiddenOrBlockedPersonUUIDs = v42;
  v29 = v42;

  personUUIDByMergeCandidateUUID = self->_personUUIDByMergeCandidateUUID;
  self->_personUUIDByMergeCandidateUUID = v12;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v56 = self;
    _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Finished loading %@", buf, 0xCu);
  }
  v31 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v34 = MEMORY[0x24BDACB70];
  if (v38 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_END, spid, "LoadPersonAndMergeCandidateUUIDs", ", buf, 2u);
  }
  v35 = MEMORY[0x24BDACB70];

  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v56 = (CLSCurationContext *)"LoadPersonAndMergeCandidateUUIDs";
    v57 = 2048;
    v58 = (float)((float)((float)((float)(v31 - v37) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

- (void)_loadNonPetFacedPersonLocalIdentifiers
{
  NSObject *v3;
  id v4;
  os_signpost_id_t v5;
  NSObject *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSSet *v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  NSSet *nonPetFacedPersonLocalIdentifiers;
  uint64_t v18;
  uint32_t denom;
  uint32_t numer;
  id v21;
  NSObject *v22;
  os_signpost_id_t spid;
  uint64_t v24;
  mach_timebase_info info;
  uint8_t buf[4];
  CLSCurationContext *v27;
  __int16 v28;
  double v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  v4 = MEMORY[0x24BDACB70];
  v5 = os_signpost_id_generate(v3);
  info = 0;
  mach_timebase_info(&info);
  v6 = v3;
  v7 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_BEGIN, v5, "LoadNonPetFacedPersonLocalIdentifiers", ", buf, 2u);
  }
  spid = v5;

  v24 = mach_absolute_time();
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMinimumVerifiedFaceCount:", 1);
  objc_msgSend(v8, "setMinimumUnverifiedFaceCount:", 1);
  v30[0] = *MEMORY[0x24BDE3858];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFetchPropertySets:", v9);

  objc_msgSend(MEMORY[0x24BDE35E0], "fetchPersonsWithOptions:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  v12 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", v11);
  if (v11)
  {
    for (i = 0; i != v11; ++i)
    {
      v14 = (void *)MEMORY[0x249506444]();
      objc_msgSend(v10, "objectAtIndexedSubscript:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSSet addObject:](v12, "addObject:", v16);

      objc_autoreleasePoolPop(v14);
    }
  }
  nonPetFacedPersonLocalIdentifiers = self->_nonPetFacedPersonLocalIdentifiers;
  self->_nonPetFacedPersonLocalIdentifiers = v12;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = self;
    _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Finished loading %@", buf, 0xCu);
  }
  v18 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v21 = MEMORY[0x24BDACB70];
  if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_END, spid, "LoadNonPetFacedPersonLocalIdentifiers", ", buf, 2u);
  }
  v22 = MEMORY[0x24BDACB70];

  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v27 = (CLSCurationContext *)"LoadNonPetFacedPersonLocalIdentifiers";
    v28 = 2048;
    v29 = (float)((float)((float)((float)(v18 - v24) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

- (id)_mergeCandidateUUIDsForPerson:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setIncludeOnlyPersonsWithVisibleKeyFaces:", 1);
  v7 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend((id)objc_opt_class(), "mergeCandidateConfidenceThreshold");
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K == %d && %K >= %f"), CFSTR("verifiedType"), 0, CFSTR("mergeCandidateConfidence"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v9);

  objc_msgSend(MEMORY[0x24BDE35E0], "fetchMergeCandidateWithConfidencePersonsForPerson:options:", v3, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v4;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PHUserFeedbackCalculator)userFeedbackCalculator
{
  return self->_userFeedbackCalculator;
}

- (CLSCurationSession)curationSession
{
  return self->_curationSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curationSession, 0);
  objc_storeStrong((id *)&self->_userFeedbackCalculator, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_personUUIDByMergeCandidateUUID, 0);
  objc_storeStrong((id *)&self->_nonPetFacedPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_hiddenOrBlockedPersonUUIDs, 0);
  objc_storeStrong((id *)&self->_verifiedPersonUUIDs, 0);
}

+ (double)mergeCandidateConfidenceThreshold
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("CLSCurationContextMergeCandidateConfidenceUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "doubleForKey:", CFSTR("CLSCurationContextMergeCandidateConfidenceUserDefaults"));
    v5 = v4;
  }
  else
  {
    v5 = *MEMORY[0x24BDE3848];
  }

  return v5;
}

@end
