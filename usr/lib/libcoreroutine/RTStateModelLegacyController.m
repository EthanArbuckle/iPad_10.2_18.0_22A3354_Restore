@implementation RTStateModelLegacyController

+ (id)pathToArchiveFor:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;

  if (a3 == 1)
  {
    v5 = CFSTR("StateModel1.archive");
  }
  else
  {
    if (a3 != 2)
      return 0;
    v5 = CFSTR("StateModel2.archive");
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "pathInCacheDirectory:", v5, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)pathToChecksumFor:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;

  if (a3 == 1)
  {
    v5 = CFSTR("StateModel1.checksum");
  }
  else
  {
    if (a3 != 2)
      return 0;
    v5 = CFSTR("StateModel2.checksum");
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "pathInCacheDirectory:", v5, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (unint64_t)crcFromData:(id)a3
{
  id v3;
  uLong v4;
  id v5;
  const Bytef *v6;
  uInt v7;

  if (!a3)
    return 0;
  v3 = a3;
  v4 = crc32(0, 0, 0);
  v5 = objc_retainAutorelease(v3);
  v6 = (const Bytef *)objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");

  return crc32(v4, v6, v7);
}

+ (BOOL)archiveExists:(int64_t)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "pathToArchiveFor:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if (!v6)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "pathToChecksumFor:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  return v9;
}

+ (BOOL)stateModelLegacyExists
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = objc_msgSend(&unk_1E932CA30, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(&unk_1E932CA30);
        if ((objc_msgSend((id)objc_opt_class(), "archiveExists:", objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5), "integerValue")) & 1) != 0)
        {
          LOBYTE(v2) = 1;
          return v2;
        }
        ++v5;
      }
      while (v3 != v5);
      v2 = objc_msgSend(&unk_1E932CA30, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      v3 = v2;
      if (v2)
        continue;
      break;
    }
  }
  return v2;
}

- (RTStateModelLegacyController)initWithLearnedLocationStore:(id)a3 mapServiceManager:(id)a4
{
  id v7;
  id v8;
  void *v9;
  RTStateModelLegacyController *v10;
  id *p_isa;
  RTStateModelLegacyController *v12;
  NSObject *v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTStateModelLegacyController initWithLearnedLocationStore:mapServiceManager:]";
      v19 = 1024;
      v20 = 174;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedLocationStore (in %s:%d)", buf, 0x12u);
    }

    if (v9)
      goto LABEL_12;
    goto LABEL_9;
  }
  if (!v8)
  {
LABEL_9:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTStateModelLegacyController initWithLearnedLocationStore:mapServiceManager:]";
      v19 = 1024;
      v20 = 175;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapServiceManager (in %s:%d)", buf, 0x12u);
    }

LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  v16.receiver = self;
  v16.super_class = (Class)RTStateModelLegacyController;
  v10 = -[RTStateModelLegacyController init](&v16, sel_init);
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_learnedLocationStore, a3);
    objc_storeStrong(p_isa + 2, a4);
    xpc_activity_unregister("com.apple.routined.sequentialClusterIdentification");
  }
  self = p_isa;
  v12 = self;
LABEL_13:

  return v12;
}

- (id)_unarchiveStateModelForArchive:(int64_t)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
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
  id v32;
  id v33;
  id v34;
  id v35[3];
  uint64_t v36;
  void *v37;
  uint64_t v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)objc_opt_class(), "archiveExists:", a3))
    return 0;
  objc_msgSend((id)objc_opt_class(), "pathToArchiveFor:", a3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v31, 0, v35);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v35[0];
  if (!v6)
  {
    objc_msgSend((id)objc_opt_class(), "pathToChecksumFor:", a3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v28, 0, &v34);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v34;
    if (v29)
    {
      v33 = 0;
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v29, &v33);
      v14 = v33;
      objc_msgSend(v13, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "finishDecoding");
      if (v14)
      {
        v16 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v14, "userInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("RTStateModelLegacyControllerErrorDomain"), 2, v17);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v15 = 0;
    }
    v18 = objc_msgSend((id)objc_opt_class(), "crcFromData:", v30);
    if (v18 == objc_msgSend(v15, "unsignedIntegerValue"))
    {
      v32 = 0;
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v30, &v32);
      v20 = v32;
      objc_msgSend(v19, "setClass:forClassName:", objc_opt_class(), CFSTR("RTStateModel"));
      objc_msgSend(v19, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "finishDecoding");
      if (v20)
      {
        v21 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v20, "userInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("RTStateModelLegacyControllerErrorDomain"), 2, v22);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      if (a4)
      {
        v23 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v18);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("actual stateModel crc, %@, %@, doesn't match expected crc, %@, %@"), v31, v24, v28, v15);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = (void *)MEMORY[0x1E0CB35C8];
        v36 = *MEMORY[0x1E0CB2D50];
        v37 = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("RTStateModelLegacyControllerErrorDomain"), 2, v27);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v11 = 0;
    }

    goto LABEL_20;
  }
  v7 = v6;
  if (a4)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("failed to init data with contents of file, %@, error, %@"), v31, v9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0CB2D50];
    v39[0] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("RTStateModelLegacyControllerErrorDomain"), 1, v29);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

    goto LABEL_21;
  }
  v11 = 0;
LABEL_21:

  return v11;
}

- (id)_getStateModelLegacyWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v23[4];
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = objc_msgSend(&unk_1E932CA48, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(&unk_1E932CA48);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v9), "integerValue");
        v25 = 0;
        -[RTStateModelLegacyController _unarchiveStateModelForArchive:error:](self, "_unarchiveStateModelForArchive:error:", v11, &v25);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v25;
        if (v13)
          objc_msgSend(v4, "addObject:", v13);
        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stateModelLut");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __62__RTStateModelLegacyController__getStateModelLegacyWithError___block_invoke;
          v23[3] = &unk_1E92A3728;
          v24 = v14;
          v16 = v14;
          objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v23);

          objc_msgSend(v12, "stateModelLut");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "removeObjectsForKeys:", v16);

        }
        v18 = objc_msgSend(v10, "version");
        if (v18 >= objc_msgSend(v12, "version"))
          v19 = v10;
        else
          v19 = v12;
        v7 = v19;

        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = objc_msgSend(&unk_1E932CA48, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  if (a3)
  {
    _RTSafeArray();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

void __62__RTStateModelLegacyController__getStateModelLegacyWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "uniqueId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

- (BOOL)_removeStateModelForArchive:(int64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  __int128 v20;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  _QWORD v32[4];

  v32[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "pathToArchiveFor:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v6;
  objc_msgSend((id)objc_opt_class(), "pathToChecksumFor:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v24;
    *(_QWORD *)&v10 = 138412546;
    v20 = v10;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v13);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
        v16 = objc_msgSend(v15, "removeItemAtPath:error:", v14, &v22);
        v17 = v22;

        if (a4 && (v16 & 1) == 0)
          *a4 = objc_retainAutorelease(v17);
        _rt_log_facility_get_os_log(RTLogFacilityStateModel);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v20;
          v28 = v14;
          v29 = 2112;
          v30 = v17;
          _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "removed item at path, %@, error, %@", buf, 0x16u);
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v11);
  }

  return 1;
}

- (BOOL)removeStateModelLegacyWithError:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  id v11;
  void *v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(&unk_1E932CA60, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(&unk_1E932CA60);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "integerValue");
        v14 = 0;
        v10 = -[RTStateModelLegacyController _removeStateModelForArchive:error:](self, "_removeStateModelForArchive:error:", v9, &v14);
        v11 = v14;
        v12 = v11;
        if (a3 && !v10)
          *a3 = objc_retainAutorelease(v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(&unk_1E932CA60, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  return 1;
}

- (BOOL)_migrateStateModelLegacy:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  RTMapServiceManager *mapServiceManager;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  dispatch_semaphore_t v33;
  id v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  dispatch_time_t v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  id v57;
  id v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  RTMapServiceManager *v64;
  void *v65;
  void *v66;
  unint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  NSObject *v71;
  RTLearnedPlace *v72;
  void *v73;
  void *v74;
  unint64_t v75;
  void *v76;
  unint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  RTLearnedPlace *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t i;
  void *v89;
  void *v90;
  _BOOL4 v91;
  void *v92;
  void *v93;
  NSObject *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t j;
  RTMigrationHelperOneStateAndEntryExitPair *v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  _BOOL4 v105;
  void *v106;
  void *v107;
  unint64_t v108;
  void *v109;
  void *v110;
  unint64_t v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  void *v118;
  double v119;
  double v120;
  void *v121;
  void *v122;
  void *v123;
  double v124;
  double v125;
  void *v126;
  void *v127;
  void *v128;
  double v129;
  void *v130;
  void *v131;
  void *v132;
  unint64_t v133;
  void *v134;
  RTLearnedVisit *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  _BOOL4 v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  RTLearnedVisit *v150;
  RTLearnedTransition *v151;
  void *v152;
  void *v153;
  RTLearnedTransition *v154;
  RTLearnedVisit *v155;
  NSObject *v156;
  uint64_t k;
  uint64_t v158;
  void *v159;
  void *v160;
  void *v161;
  id v162;
  id v163;
  NSObject *v164;
  NSObject *v165;
  void *v166;
  dispatch_time_t v167;
  id v168;
  double v169;
  double v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  NSObject *v175;
  void *v176;
  void *v177;
  void *v178;
  id v179;
  void *v180;
  NSObject *v181;
  NSObject *v182;
  void *v183;
  dispatch_time_t v184;
  id v185;
  void *v186;
  double v187;
  double v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  NSObject *v194;
  void *v195;
  void *v196;
  void *v197;
  id v198;
  void *v199;
  NSObject *v200;
  NSObject *v201;
  void *v202;
  dispatch_time_t v203;
  id v204;
  void *v205;
  double v206;
  double v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  NSObject *v213;
  void *v214;
  void *v215;
  void *v216;
  id v217;
  void *v219;
  void *v220;
  id v221;
  void *v222;
  id v223;
  void *v224;
  void *v225;
  uint64_t v226;
  void *v227;
  uint64_t v228;
  RTLearnedVisit *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  RTLearnedLocation *v233;
  RTLearnedVisit *v234;
  uint64_t v235;
  void *v236;
  void *v237;
  uint64_t v238;
  RTLearnedLocation *v239;
  dispatch_semaphore_t v240;
  id obj;
  NSObject *obja;
  id objb;
  void *v244;
  void *v245;
  id v246;
  uint64_t v247;
  uint64_t v248;
  void *v249;
  RTLearnedVisit *v250;
  void *v251;
  uint64_t v252;
  uint64_t v253;
  void *v254;
  void *v256;
  id v257;
  id v258;
  id v259;
  id v260;
  void *v261;
  uint64_t v262;
  void *v263;
  void *v264;
  _QWORD v265[4];
  id v266;
  NSObject *v267;
  _QWORD v268[4];
  id v269;
  NSObject *v270;
  _QWORD v271[4];
  id v272;
  id v273;
  NSObject *v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  id v291;
  _QWORD v292[4];
  NSObject *v293;
  __int128 *p_buf;
  id v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  _BYTE v300[128];
  _BYTE v301[128];
  void *v302;
  _BYTE v303[128];
  uint8_t v304[128];
  uint8_t v305[16];
  __int128 buf;
  uint64_t v307;
  uint64_t (*v308)(uint64_t, uint64_t);
  void (*v309)(uint64_t);
  id v310;
  _BYTE v311[128];
  _QWORD v312[4];

  v312[1] = *MEMORY[0x1E0C80C00];
  v221 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  v298 = 0u;
  v299 = 0u;
  v296 = 0u;
  v297 = 0u;
  objc_msgSend(v221, "stateModelLut");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v252 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v296, v311, 16);
  if (v252)
  {
    v248 = *(_QWORD *)v297;
    v228 = *MEMORY[0x1E0D18598];
    v230 = *MEMORY[0x1E0CB2D50];
    do
    {
      v257 = 0;
      do
      {
        if (*(_QWORD *)v297 != v248)
          objc_enumerationMutation(obj);
        v261 = *(void **)(*((_QWORD *)&v296 + 1) + 8 * (_QWORD)v257);
        objc_msgSend(v261, "uniqueId");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5 == 0;

        if (v6)
        {
          _rt_log_facility_get_os_log(RTLogFacilityStateModel);
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v261;
            _os_log_impl(&dword_1D1A22000, v56, OS_LOG_TYPE_INFO, "oneState missing identifier, %@", (uint8_t *)&buf, 0xCu);
          }

        }
        else
        {
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v307 = 0x3032000000;
          v308 = __Block_byref_object_copy__134;
          v309 = __Block_byref_object_dispose__134;
          v310 = 0;
          objc_msgSend(v261, "stateDepiction");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "geoMapItem");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            mapServiceManager = self->_mapServiceManager;
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v261, "stateDepiction");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "geoMapItem");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v261, "stateDepiction");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = +[RTLearnedLocationOfInterest mapItemSourceFromGeoMapItemSource:](RTLearnedLocationOfInterest, "mapItemSourceFromGeoMapItemSource:", objc_msgSend(v13, "mapItemSource"));
            objc_msgSend(v261, "stateDepiction");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "geocodeDate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (!v16)
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v237 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = v237;
            }
            v295 = 0;
            -[RTMapServiceManager mapItemWithIdentifier:geoMapItem:source:creationDate:error:](mapServiceManager, "mapItemWithIdentifier:geoMapItem:source:creationDate:error:", v10, v12, v14, v17, &v295);
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = v295;
            v20 = *(void **)(*((_QWORD *)&buf + 1) + 40);
            *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v18;

            if (!v16)
          }
          if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
            goto LABEL_26;
          v21 = objc_alloc(MEMORY[0x1E0D183B0]);
          objc_msgSend(v261, "stateDepiction");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "location");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "Latitude_deg");
          v25 = v24;
          objc_msgSend(v261, "stateDepiction");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "location");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "Longitude_deg");
          v29 = v28;
          objc_msgSend(v261, "stateDepiction");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "location");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "uncertainty_m");
          v244 = (void *)objc_msgSend(v21, "initWithLatitude:longitude:horizontalUncertainty:date:", v256, v25, v29, v32);

          v33 = dispatch_semaphore_create(0);
          v34 = objc_alloc(MEMORY[0x1E0D183F8]);
          v35 = (objc_class *)objc_opt_class();
          NSStringFromClass(v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)objc_msgSend(v34, "initWithUseBackgroundTraits:analyticsIdentifier:", 1, v36);

          -[RTStateModelLegacyController mapServiceManager](self, "mapServiceManager");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v292[0] = MEMORY[0x1E0C809B0];
          v292[1] = 3221225472;
          v292[2] = __63__RTStateModelLegacyController__migrateStateModelLegacy_error___block_invoke;
          v292[3] = &unk_1E9297010;
          p_buf = &buf;
          v39 = v33;
          v293 = v39;
          objc_msgSend(v38, "fetchMapItemsFromLocation:options:handler:", v244, v37, v292);

          v40 = v39;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = dispatch_time(0, 3600000000000);
          if (!dispatch_semaphore_wait(v40, v42))
            goto LABEL_22;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "timeIntervalSinceDate:", v41);
          v45 = v44;
          v46 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_124);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "filteredArrayUsingPredicate:", v47);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "firstObject");
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v46, "submitToCoreAnalytics:type:duration:", v50, 1, v45);
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v305 = 0;
            _os_log_fault_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v305, 2u);
          }

          v52 = (void *)MEMORY[0x1E0CB35C8];
          v312[0] = v230;
          *(_QWORD *)v305 = CFSTR("semaphore wait timeout");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v305, v312, 1);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "errorWithDomain:code:userInfo:", v228, 15, v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          if (v54)
          {
            v55 = objc_retainAutorelease(v54);

          }
          else
          {
LABEL_22:
            v55 = 0;
          }

          v57 = v55;
          if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
          {
            v58 = objc_alloc(MEMORY[0x1E0D27330]);
            objc_msgSend(v244, "latitude");
            v60 = v59;
            objc_msgSend(v244, "longitude");
            v62 = (void *)objc_msgSend(v58, "initWithLatitude:longitude:addressDictionary:", 0, v60, v61);
            objc_msgSend(MEMORY[0x1E0D271E8], "mapItemStorageForPlace:", v62);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = self->_mapServiceManager;
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v261, "stateDepiction");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = +[RTLearnedLocationOfInterest mapItemSourceFromGeoMapItemSource:](RTLearnedLocationOfInterest, "mapItemSourceFromGeoMapItemSource:", objc_msgSend(v66, "mapItemSource"));
            v291 = 0;
            -[RTMapServiceManager mapItemWithIdentifier:geoMapItem:source:creationDate:error:](v64, "mapItemWithIdentifier:geoMapItem:source:creationDate:error:", v65, v63, v67, v256, &v291);
            v68 = objc_claimAutoreleasedReturnValue();
            v69 = v291;
            v70 = *(void **)(*((_QWORD *)&buf + 1) + 40);
            *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v68;

          }
          if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
          {
LABEL_26:
            objc_msgSend(v256, "dateByAddingTimeInterval:", 4838400.0);
            v71 = objc_claimAutoreleasedReturnValue();
            v72 = [RTLearnedPlace alloc];
            objc_msgSend(v261, "uniqueId");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v261, "stateDepiction");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = +[RTLearnedPlace placeTypeFromType:](RTLearnedPlace, "placeTypeFromType:", objc_msgSend(v74, "type"));
            objc_msgSend(v261, "stateDepiction");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = +[RTLearnedPlace placeTypeSourceFromTypeSource:](RTLearnedPlace, "placeTypeSourceFromTypeSource:", objc_msgSend(v76, "typeSource"));
            v78 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
            objc_msgSend(v261, "stateDepiction");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "customLabel");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v72, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v73, v75, v77, v78, v80, v256, v71);

            if (v81)
            {
              -[RTLearnedPlace identifier](v81, "identifier");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v224, "setObject:forKey:", v81, v82);

              objc_msgSend(v261, "uniqueId");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v225, "setObject:forKey:", v81, v83);

            }
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityStateModel);
            v71 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v305 = 138412290;
              *(_QWORD *)&v305[4] = v261;
              _os_log_impl(&dword_1D1A22000, v71, OS_LOG_TYPE_INFO, "unable to migrate legacy geoMapItem, %@", v305, 0xCu);
            }
          }

          _Block_object_dispose(&buf, 8);
        }
        v257 = (char *)v257 + 1;
      }
      while ((id)v252 != v257);
      v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v296, v311, 16);
      v252 = v84;
    }
    while (v84);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v289 = 0u;
  v290 = 0u;
  v287 = 0u;
  v288 = 0u;
  objc_msgSend(v221, "stateModelLut");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "allValues");
  v258 = (id)objc_claimAutoreleasedReturnValue();

  v87 = objc_msgSend(v258, "countByEnumeratingWithState:objects:count:", &v287, v304, 16);
  if (v87)
  {
    v262 = *(_QWORD *)v288;
    do
    {
      for (i = 0; i != v87; ++i)
      {
        if (*(_QWORD *)v288 != v262)
          objc_enumerationMutation(v258);
        v89 = *(void **)(*((_QWORD *)&v287 + 1) + 8 * i);
        objc_msgSend(v89, "uniqueId");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = v90 == 0;

        if (v91)
        {
          _rt_log_facility_get_os_log(RTLogFacilityStateModel);
          v94 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v89;
            _os_log_impl(&dword_1D1A22000, v94, OS_LOG_TYPE_INFO, "oneState missing identifier, %@", (uint8_t *)&buf, 0xCu);
          }
        }
        else
        {
          objc_msgSend(v89, "stateDepiction");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "getAllOneVisits");
          v93 = (void *)objc_claimAutoreleasedReturnValue();

          v285 = 0u;
          v286 = 0u;
          v283 = 0u;
          v284 = 0u;
          v94 = v93;
          v95 = -[NSObject countByEnumeratingWithState:objects:count:](v94, "countByEnumeratingWithState:objects:count:", &v283, v303, 16);
          if (v95)
          {
            v96 = *(_QWORD *)v284;
            do
            {
              for (j = 0; j != v95; ++j)
              {
                if (*(_QWORD *)v284 != v96)
                  objc_enumerationMutation(v94);
                v98 = -[RTMigrationHelperOneStateAndEntryExitPair initWithOneState:entryExit:]([RTMigrationHelperOneStateAndEntryExitPair alloc], "initWithOneState:entryExit:", v89, *(_QWORD *)(*((_QWORD *)&v283 + 1) + 8 * j));
                objc_msgSend(v85, "addObject:", v98);

              }
              v95 = -[NSObject countByEnumeratingWithState:objects:count:](v94, "countByEnumeratingWithState:objects:count:", &v283, v303, 16);
            }
            while (v95);
          }

        }
      }
      v87 = objc_msgSend(v258, "countByEnumeratingWithState:objects:count:", &v287, v304, 16);
    }
    while (v87);
  }

  v220 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("self.entryExit.exit_s"), 1);
  v302 = v220;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v302, 1);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v281 = 0u;
  v282 = 0u;
  v279 = 0u;
  v280 = 0u;
  objc_msgSend(v85, "allObjects");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "sortedArrayUsingDescriptors:", v219);
  v223 = (id)objc_claimAutoreleasedReturnValue();

  v231 = objc_msgSend(v223, "countByEnumeratingWithState:objects:count:", &v279, v301, 16);
  if (v231)
  {
    v226 = *(_QWORD *)v280;
    v229 = 0;
    do
    {
      v100 = 0;
      do
      {
        if (*(_QWORD *)v280 != v226)
        {
          v101 = v100;
          objc_enumerationMutation(v223);
          v100 = v101;
        }
        v253 = v100;
        v102 = *(void **)(*((_QWORD *)&v279 + 1) + 8 * v100);
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v263 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "oneState");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "uniqueId");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = v104 == 0;

        if (v105)
        {
          _rt_log_facility_get_os_log(RTLogFacilityStateModel);
          v156 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v156, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v102;
            _os_log_impl(&dword_1D1A22000, v156, OS_LOG_TYPE_INFO, "oneState missing identifier, %@", (uint8_t *)&buf, 0xCu);
          }
        }
        else
        {
          objc_msgSend(v102, "oneState");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "stateDepiction");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = objc_msgSend(v107, "numOfDataPts");
          objc_msgSend(v102, "oneState");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "stateDepiction");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          v111 = objc_msgSend(v110, "getNumOfVisitsOverall");

          v112 = v108 / v111;
          if (v108 / v111 <= 1)
            v112 = 1;
          v238 = v112;
          v113 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend(v102, "entryExit");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "entry_s");
          objc_msgSend(v113, "dateWithTimeIntervalSinceReferenceDate:");
          obja = objc_claimAutoreleasedReturnValue();

          v115 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend(v102, "entryExit");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "exit_s");
          objc_msgSend(v115, "dateWithTimeIntervalSinceReferenceDate:");
          v259 = (id)objc_claimAutoreleasedReturnValue();

          v233 = [RTLearnedLocation alloc];
          v117 = objc_alloc(MEMORY[0x1E0D183B0]);
          objc_msgSend(v102, "oneState");
          v249 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v249, "stateDepiction");
          v245 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v245, "location");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "Latitude_deg");
          v120 = v119;
          objc_msgSend(v102, "oneState");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "stateDepiction");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "location");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "Longitude_deg");
          v125 = v124;
          objc_msgSend(v102, "oneState");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v126, "stateDepiction");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "location");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "uncertainty_m");
          v130 = (void *)objc_msgSend(v117, "initWithLatitude:longitude:horizontalUncertainty:date:", 0, v120, v125, v129);
          v239 = -[RTLearnedLocation initWithLocation:dataPointCount:confidence:](v233, "initWithLocation:dataPointCount:confidence:", v130, v238, 1.0);

          objc_msgSend(v102, "oneState");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v131, "stateDepiction");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          v133 = objc_msgSend(v132, "getNumOfVisitsOverall");

          objc_msgSend(v259, "dateByAddingTimeInterval:", dbl_1D1EED5C0[v133 > 1]);
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          v135 = -[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:]([RTLearnedVisit alloc], "initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:", v263, v239, obja, v259, v256, v134);
          if (v135)
          {
            objc_msgSend(v102, "oneState");
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v136, "uniqueId");
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v225, "objectForKey:", v137);
            v138 = (void *)objc_claimAutoreleasedReturnValue();

            if (v138)
            {
              objc_msgSend(v138, "mapItem");
              v139 = (void *)objc_claimAutoreleasedReturnValue();
              -[RTLearnedVisit setPlaceSource:](v135, "setPlaceSource:", objc_msgSend(v139, "source"));

              objc_msgSend(v138, "identifier");
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v236, "objectForKey:", v140);
              v141 = (void *)objc_claimAutoreleasedReturnValue();
              v142 = v141 == 0;

              if (v142)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v143 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v138, "identifier");
                v144 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v236, "setObject:forKey:", v143, v144);

              }
              objc_msgSend(v138, "identifier");
              v145 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v236, "objectForKey:", v145);
              v146 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v146, "addObject:", v135);

              if (v229)
              {
                objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                v147 = (void *)objc_claimAutoreleasedReturnValue();
                -[RTLearnedVisit exitDate](v229, "exitDate");
                v148 = (void *)objc_claimAutoreleasedReturnValue();
                -[RTLearnedVisit entryDate](v135, "entryDate");
                v149 = (void *)objc_claimAutoreleasedReturnValue();
                v250 = v229;
                v150 = v135;
                if (v148 && v149)
                {
                  v234 = v150;
                  v246 = v134;
                  v151 = [RTLearnedTransition alloc];
                  -[RTLearnedVisit identifier](v250, "identifier");
                  v152 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RTLearnedVisit identifier](v234, "identifier");
                  v153 = (void *)objc_claimAutoreleasedReturnValue();
                  v154 = -[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:](v151, "initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:", v147, v148, v149, v152, v153, v256, v246, 0);

                  if (v154)
                    objc_msgSend(v222, "addObject:", v154);

                  v150 = v234;
                }

              }
              v155 = v135;

              v229 = v155;
            }

          }
          v156 = obja;
        }

        v100 = v253 + 1;
      }
      while (v231 != v253 + 1);
      v231 = objc_msgSend(v223, "countByEnumeratingWithState:objects:count:", &v279, v301, 16);
    }
    while (v231);
  }
  else
  {
    v229 = 0;
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  v240 = dispatch_semaphore_create(0);
  v275 = 0u;
  v276 = 0u;
  v277 = 0u;
  v278 = 0u;
  v260 = v224;
  v247 = objc_msgSend(v260, "countByEnumeratingWithState:objects:count:", &v275, v300, 16);
  if (v247)
  {
    v264 = 0;
    objb = *(id *)v276;
    v232 = *MEMORY[0x1E0D18598];
    v235 = *MEMORY[0x1E0CB2D50];
    do
    {
      for (k = 0; k != v247; ++k)
      {
        if (*(id *)v276 != objb)
          objc_enumerationMutation(v260);
        v158 = *(_QWORD *)(*((_QWORD *)&v275 + 1) + 8 * k);
        objc_msgSend(v260, "objectForKeyedSubscript:", v158);
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v236, "objectForKey:", v158);
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v160, "count"))
        {
          -[RTStateModelLegacyController learnedLocationStore](self, "learnedLocationStore");
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          v271[0] = MEMORY[0x1E0C809B0];
          v271[1] = 3221225472;
          v271[2] = __63__RTStateModelLegacyController__migrateStateModelLegacy_error___block_invoke_78;
          v271[3] = &unk_1E929DDD0;
          v162 = v160;
          v272 = v162;
          v163 = v159;
          v273 = v163;
          v164 = v240;
          v274 = v164;
          objc_msgSend(v161, "storeVisits:place:handler:", v162, v163, v271);

          v165 = v164;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          v167 = dispatch_time(0, 3600000000000);
          v168 = v264;
          if (dispatch_semaphore_wait(v165, v167))
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v254 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v254, "timeIntervalSinceDate:", v166);
            v170 = v169;
            v251 = (void *)objc_opt_new();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_124);
            v171 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v172 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v172, "filteredArrayUsingPredicate:", v171);
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v173, "firstObject");
            v174 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v251, "submitToCoreAnalytics:type:duration:", v174, 1, v170);
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v175 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v175, OS_LOG_TYPE_FAULT))
            {
              LOWORD(buf) = 0;
              _os_log_fault_impl(&dword_1D1A22000, v175, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", (uint8_t *)&buf, 2u);
            }

            v176 = (void *)MEMORY[0x1E0CB35C8];
            *(_QWORD *)v305 = v235;
            *(_QWORD *)&buf = CFSTR("semaphore wait timeout");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &buf, v305, 1);
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v176, "errorWithDomain:code:userInfo:", v232, 15, v177);
            v178 = (void *)objc_claimAutoreleasedReturnValue();

            v168 = v264;
            if (v178)
            {
              v168 = objc_retainAutorelease(v178);

            }
          }

          v179 = v168;
          v264 = v179;
        }
        else
        {
          objc_msgSend(v227, "addObject:", v159);
        }

      }
      v247 = objc_msgSend(v260, "countByEnumeratingWithState:objects:count:", &v275, v300, 16);
    }
    while (v247);
  }
  else
  {
    v264 = 0;
  }

  if (objc_msgSend(v227, "count"))
  {
    -[RTStateModelLegacyController learnedLocationStore](self, "learnedLocationStore");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    v268[0] = MEMORY[0x1E0C809B0];
    v268[1] = 3221225472;
    v268[2] = __63__RTStateModelLegacyController__migrateStateModelLegacy_error___block_invoke_80;
    v268[3] = &unk_1E929A538;
    v269 = v227;
    v181 = v240;
    v270 = v181;
    objc_msgSend(v180, "storePlaces:handler:", v269, v268);

    v182 = v181;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = dispatch_time(0, 3600000000000);
    v185 = v264;
    if (dispatch_semaphore_wait(v182, v184))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "timeIntervalSinceDate:", v183);
      v188 = v187;
      v189 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_124);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v191, "filteredArrayUsingPredicate:", v190);
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v192, "firstObject");
      v193 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v189, "submitToCoreAnalytics:type:duration:", v193, 1, v188);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v194 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v194, OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf) = 0;
        _os_log_fault_impl(&dword_1D1A22000, v194, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", (uint8_t *)&buf, 2u);
      }

      v195 = (void *)MEMORY[0x1E0CB35C8];
      *(_QWORD *)v305 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)&buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &buf, v305, 1);
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v195, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v196);
      v197 = (void *)objc_claimAutoreleasedReturnValue();

      v185 = v264;
      if (v197)
      {
        v185 = objc_retainAutorelease(v197);

      }
    }

    v198 = v185;
    v264 = v198;
  }
  if (objc_msgSend(v222, "count"))
  {
    -[RTStateModelLegacyController learnedLocationStore](self, "learnedLocationStore");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    v265[0] = MEMORY[0x1E0C809B0];
    v265[1] = 3221225472;
    v265[2] = __63__RTStateModelLegacyController__migrateStateModelLegacy_error___block_invoke_81;
    v265[3] = &unk_1E929A538;
    v266 = v222;
    v200 = v240;
    v267 = v200;
    objc_msgSend(v199, "storeTransitions:handler:", v266, v265);

    v201 = v200;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    v203 = dispatch_time(0, 3600000000000);
    v204 = v264;
    if (dispatch_semaphore_wait(v201, v203))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "timeIntervalSinceDate:", v202);
      v207 = v206;
      v208 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_124);
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v210, "filteredArrayUsingPredicate:", v209);
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v211, "firstObject");
      v212 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v208, "submitToCoreAnalytics:type:duration:", v212, 1, v207);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v213 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v213, OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf) = 0;
        _os_log_fault_impl(&dword_1D1A22000, v213, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", (uint8_t *)&buf, 2u);
      }

      v214 = (void *)MEMORY[0x1E0CB35C8];
      *(_QWORD *)v305 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)&buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &buf, v305, 1);
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v214, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v215);
      v216 = (void *)objc_claimAutoreleasedReturnValue();

      v204 = v264;
      if (v216)
      {
        v204 = objc_retainAutorelease(v216);

      }
    }

    v217 = v204;
    v264 = v217;
  }

  return 1;
}

intptr_t __63__RTStateModelLegacyController__migrateStateModelLegacy_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __63__RTStateModelLegacyController__migrateStateModelLegacy_error___block_invoke_78(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218498;
    v23 = v5;
    v24 = 2112;
    v25 = v6;
    v26 = 2112;
    v27 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "stored %lu visits to place, %@, error, %@", buf, 0x20u);
  }
  v15 = v3;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v16 = a1;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        _rt_log_facility_get_os_log(RTLogFacilityStateModel);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          ++v10;
          *(_DWORD *)buf = 134218242;
          v23 = v10;
          v24 = 2112;
          v25 = v13;
          _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "visit %lu, %@", buf, 0x16u);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16, v15);
    }
    while (v9);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v16 + 48));
}

void __63__RTStateModelLegacyController__migrateStateModelLegacy_error___block_invoke_80(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134218242;
    v22 = v5;
    v23 = 2112;
    v24 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "stored %lu places with no visits, error %@", buf, 0x16u);
  }
  v14 = v3;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v15 = a1;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        _rt_log_facility_get_os_log(RTLogFacilityStateModel);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          ++v9;
          *(_DWORD *)buf = 134218242;
          v22 = v9;
          v23 = 2112;
          v24 = v12;
          _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "place %lu, %@", buf, 0x16u);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16, v14);
    }
    while (v8);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v15 + 40));
}

void __63__RTStateModelLegacyController__migrateStateModelLegacy_error___block_invoke_81(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    v6 = 134218242;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "stored %lu transitions, error %@", (uint8_t *)&v6, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)migrateStateModelLegacyWithError:(id *)a3
{
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  -[RTStateModelLegacyController _getStateModelLegacyWithError:](self, "_getStateModelLegacyWithError:", &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "getstateModel legacy, %@, error, %@", buf, 0x16u);
  }

  objc_msgSend(v5, "stateModelLut");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", &__block_literal_global_104);

  if (v6)
  {
    v10 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v6);
  }
  else
  {
    v10 = -[RTStateModelLegacyController _migrateStateModelLegacy:error:](self, "_migrateStateModelLegacy:error:", v5, a3);
  }

  return v10;
}

void __65__RTStateModelLegacyController_migrateStateModelLegacyWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 134218242;
    v9 = a3 + 1;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "state %lu, %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(v4, "stateDepiction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getAllOneVisits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &__block_literal_global_85);

}

void __65__RTStateModelLegacyController_migrateStateModelLegacyWithError___block_invoke_83(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134218242;
    v7 = a3 + 1;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "visit %lu, %@", (uint8_t *)&v6, 0x16u);
  }

}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (void)setLearnedLocationStore:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationStore, a3);
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_mapServiceManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
}

@end
