@implementation SAMountStatusTracker

- (SAMountStatusTracker)init
{
  SAMountStatusTracker *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mountStatusDict;
  NSMutableSet *v5;
  NSMutableSet *threadsSeen;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SAMountStatusTracker;
  v2 = -[SAMountStatusTracker init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mountStatusDict = v2->_mountStatusDict;
    v2->_mountStatusDict = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    threadsSeen = v2->_threadsSeen;
    v2->_threadsSeen = v5;

  }
  return v2;
}

- (void)addMountStatus:(void *)a3 forTimestamp:
{
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  uint64_t v21;
  int v22;
  NSObject *v23;
  SAMountStatus *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  SAMountSnapshot *v34;
  id v35;
  id *v36;
  double *v37;
  unint64_t v38;
  double v39;
  id v40;
  unint64_t v41;
  void *v42;
  void *v43;
  SAMountSnapshot *v44;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  __int128 v55;
  void *v57;
  _QWORD *v58;
  id v59;
  id v60;
  uint64_t v61;
  void *v62;
  _BYTE v63[22];
  __int16 v64;
  int v65;
  __int16 v66;
  int v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  if (a1)
  {
    v6 = *a2;
    if (*a2)
    {
      v7 = 0;
      *(_QWORD *)&v5 = 134218754;
      v55 = v5;
      v8 = a2;
      v58 = a2;
      while (1)
      {
        v9 = *(int *)(*(_QWORD *)v6 + 52) + ((unint64_t)*(unsigned int *)(*(_QWORD *)v6 + 48) << 32);
        v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", v9);
        objc_msgSend(*(id *)(a1 + 16), "objectForKey:");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (_QWORD *)a2[v7];
        if (v10)
          break;
        SANSStringForCString((void *)(*v11 + 88));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        SANSStringForCString((void *)(*(_QWORD *)*v8 + 72));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v16)
          v19 = v17 == 0;
        else
          v19 = 1;
        if (!v19)
        {
          v61 = v7;
          v21 = *(_QWORD *)(*v8 + 8);
          if (*(_DWORD *)(v21 + 516) || *(_DWORD *)(v21 + 520))
          {
            v22 = *__error();
            _sa_logt();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              v52 = *(_QWORD *)(*v8 + 8);
              v53 = *(_QWORD *)*v8 + 88;
              v54 = *(_DWORD *)(v52 + 516);
              LODWORD(v52) = *(_DWORD *)(v52 + 520);
              *(_DWORD *)v63 = v55;
              *(_QWORD *)&v63[4] = v9;
              *(_WORD *)&v63[12] = 2080;
              *(_QWORD *)&v63[14] = v53;
              v64 = 1024;
              v65 = v54;
              v66 = 1024;
              v67 = v52;
              _os_log_debug_impl(&dword_1B9BE0000, v23, OS_LOG_TYPE_DEBUG, "New mount 0x%llx %s unresponsive for %d seconds, blocking %d threads", v63, 0x22u);
            }

            *__error() = v22;
          }
          v24 = [SAMountStatus alloc];
          v25 = v16;
          v26 = v18;
          if (v24)
          {
            *(_QWORD *)v63 = v24;
            *(_QWORD *)&v63[8] = SAMountStatus;
            v12 = objc_msgSendSuper2((objc_super *)v63, sel_init);
            a2 = v58;
            if (v12)
            {
              v27 = objc_msgSend(v25, "copy");
              v28 = (void *)*((_QWORD *)v12 + 2);
              *((_QWORD *)v12 + 2) = v27;

              objc_storeStrong((id *)v12 + 3, v18);
              v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v30 = (void *)*((_QWORD *)v12 + 1);
              *((_QWORD *)v12 + 1) = v29;

            }
          }
          else
          {
            v12 = 0;
            a2 = v58;
          }

          objc_msgSend(*(id *)(a1 + 16), "setObject:forKey:", v12, v62);
          if (v12)
          {
LABEL_25:
            v31 = *(_QWORD *)(*v8 + 8);
            v60 = v12;
            v32 = (void *)*((_QWORD *)v12 + 1);
            v33 = v59;
            v34 = [SAMountSnapshot alloc];
            v35 = v33;
            if (v34 && v31)
            {
              *(_QWORD *)v63 = v34;
              *(_QWORD *)&v63[8] = SAMountSnapshot;
              v36 = (id *)objc_msgSendSuper2((objc_super *)v63, sel_init);
              v37 = (double *)v36;
              if (v36)
              {
                v57 = v32;
                objc_storeStrong(v36 + 1, a3);
                objc_msgSend(v35, "machAbsTimeSeconds");
                LODWORD(v38) = *(_DWORD *)(v31 + 516);
                v37[2] = v39 - (double)v38;
                v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                if (*(_DWORD *)(v31 + 520))
                {
                  v41 = 0;
                  do
                  {
                    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", *(_QWORD *)(v31 + 528 + 8 * v41));
                    if ((objc_msgSend(v40, "containsObject:", v42) & 1) == 0)
                      objc_msgSend(v40, "addObject:", v42);

                    ++v41;
                  }
                  while (v41 < *(unsigned int *)(v31 + 520));
                }
                v43 = (void *)*((_QWORD *)v37 + 3);
                *((_QWORD *)v37 + 3) = v40;

                v32 = v57;
                a2 = v58;
              }
              v34 = v37;
              v44 = v34;
            }
            else
            {
              v44 = 0;
            }

            objc_msgSend(v32, "addObject:", v44);
          }
          else
          {
            v60 = 0;
          }
          v45 = *(_QWORD *)(*v8 + 8);
          v20 = v60;
          if (*(_DWORD *)(v45 + 520))
          {
            v46 = 0;
            do
            {
              v47 = *(void **)(a1 + 8);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v45 + 8 * v46 + 528), v55);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "addObject:", v48);

              ++v46;
              v45 = *(_QWORD *)(*v8 + 8);
            }
            while (v46 < *(unsigned int *)(v45 + 520));
          }
          v7 = v61;
          goto LABEL_41;
        }

        v20 = 0;
        a2 = v58;
LABEL_41:

        v8 = &a2[++v7];
        v6 = *v8;
        if (!*v8)
          goto LABEL_45;
      }
      v12 = (id)v10;
      v61 = v7;
      v13 = v11[1];
      if (*(_DWORD *)(v13 + 516) || *(_DWORD *)(v13 + 520))
      {
        v14 = *__error();
        _sa_logt();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          v49 = *(_QWORD *)(*v8 + 8);
          v50 = *(_QWORD *)*v8 + 88;
          v51 = *(_DWORD *)(v49 + 516);
          LODWORD(v49) = *(_DWORD *)(v49 + 520);
          *(_DWORD *)v63 = v55;
          *(_QWORD *)&v63[4] = v9;
          *(_WORD *)&v63[12] = 2080;
          *(_QWORD *)&v63[14] = v50;
          v64 = 1024;
          v65 = v51;
          v66 = 1024;
          v67 = v49;
          _os_log_debug_impl(&dword_1B9BE0000, v15, OS_LOG_TYPE_DEBUG, "Existing mount 0x%llx %s unresponsive for %d seconds, blocking %d threads", v63, 0x22u);
        }

        *__error() = v14;
      }
      goto LABEL_25;
    }
  }
LABEL_45:

}

- (uint64_t)hasUnresponsiveMountsForThreadID:(uint64_t)result
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (result)
  {
    v2 = *(void **)(result + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "containsObject:", v3);

    return v4;
  }
  return result;
}

- (void)enumerateMountsBlockingThread:(void *)a3 betweenStartTime:(void *)a4 endTime:(void *)a5 block:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  BOOL v19;
  id obj;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = v13;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v27;
LABEL_4:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v16));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __85__SAMountStatusTracker_enumerateMountsBlockingThread_betweenStartTime_endTime_block___block_invoke_2;
        v21[3] = &unk_1E7149C30;
        v25 = a2;
        v23 = v11;
        v18 = v17;
        v22 = v18;
        v24 = &v30;
        -[SAMountStatus enumerateSnapshotsBetweenStartTime:endTime:block:]((uint64_t)v18, v9, v10, v21);
        v19 = *((_BYTE *)v31 + 24) == 0;

        if (!v19)
          break;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v14)
            goto LABEL_4;
          break;
        }
      }
    }

    _Block_object_dispose(&v30, 8);
  }

}

uint64_t __85__SAMountStatusTracker_enumerateMountsBlockingThread_betweenStartTime_endTime_block___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __85__SAMountStatusTracker_enumerateMountsBlockingThread_betweenStartTime_endTime_block___block_invoke_2(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  const char *v7;
  id Property;
  uint64_t v9;
  const char *v10;
  id v11;
  void *v12;
  id v13;

  if (a2)
  {
    v5 = *(void **)(a2 + 24);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[7]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6);

    if ((_DWORD)v5)
    {
      Property = (id)a1[4];
      v9 = a1[5];
      if (Property)
        Property = objc_getProperty(Property, v7, 16, 1);
      v11 = Property;
      v12 = (void *)a1[4];
      if (v12)
        v13 = objc_getProperty(v12, v10, 24, 1);
      else
        v13 = 0;
      (*(void (**)(uint64_t, id, id, uint64_t))(v9 + 16))(v9, v11, v13, *(_QWORD *)(a1[6] + 8) + 24);

      *a3 = 1;
    }
  }
}

- (void)enumerateUnresponsiveMountsBetweenStartTime:(void *)a3 endTime:(void *)a4 block:
{
  void (**v7)(id, id, id, _QWORD, char *);
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  id v15;
  SEL v16;
  id Property;
  id v18;
  uint64_t v19;
  id obj;
  id v21;
  id v22;
  char v23;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v22 = a2;
  v21 = a3;
  v7 = a4;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_30);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v9;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v36;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v36 != v11)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v12));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 0;
          v30 = &v29;
          v31 = 0x3032000000;
          v32 = __Block_byref_object_copy__5;
          v33 = __Block_byref_object_dispose__5;
          v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v25 = 0;
          v26 = &v25;
          v27 = 0x2020000000;
          v28 = 0;
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __82__SAMountStatusTracker_enumerateUnresponsiveMountsBetweenStartTime_endTime_block___block_invoke_31;
          v24[3] = &unk_1E7149C78;
          v24[4] = &v25;
          v24[5] = &v29;
          -[SAMountStatus enumerateSnapshotsBetweenStartTime:endTime:block:]((uint64_t)v13, v22, v21, v24);
          if (*((_BYTE *)v26 + 24))
          {
            v23 = 0;
            if (v13)
            {
              v15 = objc_getProperty(v13, v14, 16, 1);
              Property = objc_getProperty(v13, v16, 24, 1);
            }
            else
            {
              v15 = 0;
              Property = 0;
            }
            v18 = Property;
            v7[2](v7, v15, v18, v30[5], &v23);

            if (v23)
            {
              _Block_object_dispose(&v25, 8);
              _Block_object_dispose(&v29, 8);

              goto LABEL_17;
            }
          }
          _Block_object_dispose(&v25, 8);
          _Block_object_dispose(&v29, 8);

          ++v12;
        }
        while (v10 != v12);
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        v10 = v19;
      }
      while (v19);
    }
LABEL_17:

  }
}

uint64_t __82__SAMountStatusTracker_enumerateUnresponsiveMountsBetweenStartTime_endTime_block___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __82__SAMountStatusTracker_enumerateUnresponsiveMountsBetweenStartTime_endTime_block___block_invoke_31(uint64_t a1, void *a2)
{
  id *v3;
  id *v4;
  double v5;
  const char *v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3[3], "count"))
    {
      v5 = *((double *)v4 + 2);
      objc_msgSend(v4[1], "machAbsTimeSeconds");
      if (v5 < v7)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
        v16 = 0u;
        v17 = 0u;
        v14 = 0u;
        v15 = 0u;
        v8 = objc_getProperty(v4, v6, 24, 1);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v15;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v15 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
              if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "containsObject:", v13, (_QWORD)v14) & 1) == 0)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v13);
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          }
          while (v10);
        }

      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mountStatusDict, 0);
  objc_storeStrong((id *)&self->_threadsSeen, 0);
}

+ (id)classDictionaryKey
{
  return CFSTR("PASerializedMountStatusTracker");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return (16 * -[NSMutableDictionary count](self->_mountStatusDict, "count")) | 4;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v8;
  NSMutableDictionary *mountStatusDict;
  id v10;
  int v12;
  NSObject *v13;
  id v14;
  id v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  $F6598839ED8FD5B3E67122CA84917FAC *v38;
  __int16 v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  unint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (-[SAMountStatusTracker sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v12 = *__error();
    _sa_logt();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[SAMountStatusTracker debugDescription](self, "debugDescription");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v41 = objc_msgSend(v14, "UTF8String");
      v42 = 2048;
      v43 = -[SAMountStatusTracker sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      v44 = 2048;
      v45 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v13, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v12;
    -[SAMountStatusTracker debugDescription](self, "debugDescription");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = objc_msgSend(v15, "UTF8String");
    -[SAMountStatusTracker sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(471, "%s: size %lu != buffer length %lu", v17, v18, v19, v20, v21, v22, v16);

    _os_crash();
    __break(1u);
LABEL_7:
    v23 = *__error();
    _sa_logt();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      -[SAMountStatusTracker debugDescription](self, "debugDescription");
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v26 = objc_msgSend(v25, "UTF8String");
      v27 = -[NSMutableDictionary count](self->_mountStatusDict, "count");
      *(_DWORD *)buf = 136315394;
      v41 = v26;
      v42 = 2048;
      v43 = v27;
      _os_log_error_impl(&dword_1B9BE0000, v24, OS_LOG_TYPE_ERROR, "%s: %lu mountStatuDicts", buf, 0x16u);

    }
    *__error() = v23;
    -[SAMountStatusTracker debugDescription](self, "debugDescription");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29 = objc_msgSend(v28, "UTF8String");
    -[NSMutableDictionary count](self->_mountStatusDict, "count");
    _SASetCrashLogMessage(476, "%s: %lu mountStatuDicts", v30, v31, v32, v33, v34, v35, v29);

    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 257;
  if ((unint64_t)-[NSMutableDictionary count](self->_mountStatusDict, "count") >= 0xFFFF)
    goto LABEL_7;
  a3->var2 = -[NSMutableDictionary count](self->_mountStatusDict, "count");
  mountStatusDict = self->_mountStatusDict;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __105__SAMountStatusTracker_Serialization__addSelfToBuffer_bufferLength_withCompletedSerializationDictionary___block_invoke;
  v36[3] = &unk_1E7149CE8;
  v39 = 0;
  v37 = v8;
  v38 = a3 + 1;
  v10 = v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mountStatusDict, "enumerateKeysAndObjectsUsingBlock:", v36);

  return 1;
}

void __105__SAMountStatusTracker_Serialization__addSelfToBuffer_bufferLength_withCompletedSerializationDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;

  v5 = a3;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16 * *(unsigned __int16 *)(a1 + 48)) = objc_msgSend(a2, "unsignedLongLongValue");
  v6 = SASerializableIndexForPointerFromSerializationDictionary(v5, *(void **)(a1 + 32));

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16 * *(unsigned __int16 *)(a1 + 48) + 8) = v6;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  void *v4;
  _BOOL4 v5;
  NSMutableDictionary *mountStatusDict;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "classDictionaryKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v7, self, v4);

  if (v5)
  {
    mountStatusDict = self->_mountStatusDict;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__SAMountStatusTracker_Serialization__addSelfToSerializationDictionary___block_invoke;
    v8[3] = &unk_1E7149D10;
    v9 = v7;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mountStatusDict, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
}

uint64_t __72__SAMountStatusTracker_Serialization__addSelfToSerializationDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "addSelfToSerializationDictionary:", *(_QWORD *)(a1 + 32));
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v5;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint8_t buf[4];
  unint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (*(unsigned __int8 *)a3 >= 2u)
    goto LABEL_11;
  if (a4 <= 3)
  {
    v7 = *__error();
    _sa_logt();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v25 = a4;
      v26 = 2048;
      v27 = 4;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAMountStatusTracker struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(509, "bufferLength %lu < serialized SAMountStatusTracker struct %lu", v8, v9, v10, v11, v12, v13, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  v5 = (uint64_t)a3;
  if (((8 * *((unsigned __int16 *)a3 + 1)) | 4uLL) > a4)
  {
LABEL_8:
    v14 = *__error();
    _sa_logt();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *(unsigned __int16 *)(v5 + 2);
      *(_DWORD *)buf = 134218240;
      v25 = a4;
      v26 = 2048;
      v27 = v16;
      _os_log_error_impl(&dword_1B9BE0000, v15, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAMountStatusTracker struct with %lu mounts", buf, 0x16u);
    }

    *__error() = v14;
    _SASetCrashLogMessage(510, "bufferLength %lu < serialized SAMountStatusTracker struct with %lu mounts", v17, v18, v19, v20, v21, v22, a4);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAMountStatusTracker version"), 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  return objc_alloc_init(SAMountStatusTracker);
}

- (void)fillInThreadsSeen
{
  NSMutableSet *v3;
  NSMutableSet *threadsSeen;
  NSMutableDictionary *mountStatusDict;
  _QWORD v6[5];

  v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  threadsSeen = self->_threadsSeen;
  self->_threadsSeen = v3;

  mountStatusDict = self->_mountStatusDict;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__SAMountStatusTracker_Serialization__fillInThreadsSeen__block_invoke;
  v6[3] = &unk_1E7149D10;
  v6[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mountStatusDict, "enumerateKeysAndObjectsUsingBlock:", v6);
}

void __56__SAMountStatusTracker_Serialization__fillInThreadsSeen__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id Property;
  const char *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v20 = a2;
  Property = a3;
  v7 = Property;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  if (Property)
    Property = objc_getProperty(Property, v6, 8, 1);
  v8 = Property;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v8);
        v14 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * v13);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        if (v14)
          v14 = objc_getProperty(v14, v10, 24, 1);
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v22;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v22 != v18)
                objc_enumerationMutation(v15);
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v19++));
            }
            while (v17 != v19);
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v17);
        }

        ++v13;
      }
      while (v13 != v11);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v11);
  }

}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *mountStatusDict;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  uint8_t buf[4];
  unint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v38 = a5;
  v10 = a6;
  if (*(unsigned __int8 *)a3 >= 2u)
    goto LABEL_14;
  if (a4 <= 3)
  {
    v21 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v40 = a4;
      v41 = 2048;
      v42 = 4;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAMountStatusTracker struct %lu", buf, 0x16u);
    }

    *__error() = v21;
    _SASetCrashLogMessage(533, "bufferLength %lu < serialized SAMountStatusTracker struct %lu", v22, v23, v24, v25, v26, v27, a4);
    _os_crash();
    __break(1u);
    goto LABEL_11;
  }
  if (((8 * *((unsigned __int16 *)a3 + 1)) | 4uLL) > a4)
  {
LABEL_11:
    v28 = *__error();
    _sa_logt();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = *((unsigned __int16 *)a3 + 1);
      *(_DWORD *)buf = 134218240;
      v40 = a4;
      v41 = 2048;
      v42 = v30;
      _os_log_error_impl(&dword_1B9BE0000, v29, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAMountStatusTracker struct with %lu mounts", buf, 0x16u);
    }

    *__error() = v28;
    _SASetCrashLogMessage(534, "bufferLength %lu < serialized SAMountStatusTracker struct with %lu mounts", v31, v32, v33, v34, v35, v36, a4);
    _os_crash();
    __break(1u);
LABEL_14:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAMountStatusTracker version"), 0);
    v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v37);
  }
  v11 = v10;
  v12 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", *((unsigned __int16 *)a3 + 1));
  mountStatusDict = self->_mountStatusDict;
  self->_mountStatusDict = v12;

  if (*((_WORD *)a3 + 1))
  {
    v14 = 0;
    v15 = (unint64_t *)((char *)a3 + 12);
    do
    {
      v16 = *v15;
      v17 = (void *)objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v16, v38, v11, v17, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = self->_mountStatusDict;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(v15 - 1));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v18, v20);

      ++v14;
      v15 += 2;
    }
    while (v14 < *((unsigned __int16 *)a3 + 1));
  }
  -[SAMountStatusTracker fillInThreadsSeen](self, "fillInThreadsSeen");

}

- (void)populateReferencesUsingPAStyleSerializedMountStatusTracker:(void *)a3 andDeserializationDictionary:(void *)a4 andDataBufferDictionary:
{
  id v7;
  uint64_t v8;
  void *v9;
  unsigned __int16 v10;
  _QWORD *v11;
  unint64_t v12;
  void *v13;
  void *Property;
  const char *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  int v24;
  id v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v7 = a4;
  if (a1)
  {
    if (*(_DWORD *)(a2 + 8) >= 0xFFFFu)
    {
      v20 = *__error();
      _sa_logt();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(a1, "debugDescription");
        v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v23 = objc_msgSend(v22, "UTF8String");
        v24 = *(_DWORD *)(a2 + 8);
        *(_DWORD *)buf = 136315394;
        v35 = v23;
        v36 = 1024;
        v37 = v24;
        _os_log_error_impl(&dword_1B9BE0000, v21, OS_LOG_TYPE_ERROR, "%s: %u mounts", buf, 0x12u);

      }
      *__error() = v20;
      objc_msgSend(a1, "debugDescription");
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v26 = objc_msgSend(v25, "UTF8String");
      _SASetCrashLogMessage(547, "%s: %u mounts", v27, v28, v29, v30, v31, v32, v26);

      _os_crash();
      __break(1u);
    }
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", *(unsigned int *)(a2 + 8));
    v9 = (void *)a1[2];
    a1[2] = v8;

    if (*(_DWORD *)(a2 + 8))
    {
      v10 = 0;
      do
      {
        v11 = (_QWORD *)(a2 + 12 + 16 * v10);
        v12 = v11[1];
        v13 = (void *)objc_opt_class();
        _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v33, v7, v13, 0);
        Property = (void *)objc_claimAutoreleasedReturnValue();
        v16 = Property;
        if (Property)
          Property = objc_getProperty(Property, v15, 8, 1);
        v17 = Property;
        v18 = (void *)a1[2];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *v11);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19);

        ++v10;
      }
      while (*(_DWORD *)(a2 + 8) > v10);
    }
    objc_msgSend(a1, "fillInThreadsSeen");
  }

}

- (void)iterateAllTimestamps:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v6[1] = 3221225472;
    v6[2] = __60__SAMountStatusTracker_Serialization__iterateAllTimestamps___block_invoke;
    v6[3] = &unk_1E7149D38;
    v5 = v3;
    v6[0] = MEMORY[0x1E0C809B0];
    v7 = v3;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

    v3 = v5;
  }

}

void __60__SAMountStatusTracker_Serialization__iterateAllTimestamps___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id Property;
  const char *v7;
  void *v8;
  id v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  Property = a3;
  v8 = Property;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  if (Property)
    Property = objc_getProperty(Property, v7, 8, 1);
  v9 = Property;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v14);
        v16 = *(_QWORD *)(a1 + 32);
        if (v15)
          v17 = objc_getProperty(v15, v11, 8, 1);
        else
          v17 = 0;
        (*(void (**)(uint64_t, id))(v16 + 16))(v16, v17);
        ++v14;
      }
      while (v12 != v14);
      v18 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v12 = v18;
    }
    while (v18);
  }

}

@end
