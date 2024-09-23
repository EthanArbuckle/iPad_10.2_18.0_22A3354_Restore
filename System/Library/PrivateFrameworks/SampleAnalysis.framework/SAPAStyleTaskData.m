@implementation SAPAStyleTaskData

+ (id)classDictionaryKey
{
  return CFSTR("PASampleTaskData");
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5;
  id v6;

  v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleTaskData"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleTaskData"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2;

  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleTaskData"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  const __CFString *v5;
  id v6;

  if (!a3)
  {
    v5 = CFSTR("NULL serializedTask_v2");
    goto LABEL_6;
  }
  if (*(_QWORD *)a3 >> 1 != 143727010)
  {
    v5 = CFSTR("Bad SAPAStyleTaskData magic");
LABEL_6:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), v5, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  return objc_alloc_init(SAPAStyleTaskData);
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  const char *v27;
  BOOL v28;
  _BYTE *Property;
  uint64_t v30;
  uint64_t v31;
  SAPAStyleTaskData *v32;
  unint64_t v33;
  char *v34;
  void *v35;
  void *v36;
  void *v37;
  id *v38;
  SATaskState *v39;
  SATaskState *taskState;
  void *v41;
  id v42;
  unint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id *v49;
  const char *v50;
  uint64_t v51;
  id v52;
  id *v53;
  void *v54;
  id *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _BYTE *v61;
  unint64_t v62;
  void *v63;
  int v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  NSArray *threadStates;
  const __CFString *v69;
  id v70;
  SAPAStyleTaskData *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id selfa;
  void *v77;
  id obj;
  uint64_t v79;
  uint64_t v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  if (!a3 || !v9 || (v11 = v10) == 0)
  {
    v69 = CFSTR("Invalid args");
    goto LABEL_80;
  }
  v12 = *((_QWORD *)a3 + 1);
  if (v12 > 0xFFFFFFFFFFFFFFFDLL || *((_QWORD *)a3 + 2) == -2)
  {
    v69 = CFSTR("Invalid index found");
    goto LABEL_80;
  }
  v13 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v9, v11, v13, 0);
  selfa = (id)objc_claimAutoreleasedReturnValue();
  if (!selfa)
  {
    v69 = CFSTR("Could not get time insensitive instance");
    goto LABEL_80;
  }
  v14 = *((_QWORD *)a3 + 2);
  v15 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v14, v9, v11, v15, 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)a3 != 287454020)
  {
    if (*(_QWORD *)a3 == 287454021)
    {
      v16 = 36;
      goto LABEL_11;
    }
    v69 = CFSTR("Bad SAPAStyleTaskData magic");
LABEL_80:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), v69, 0);
    v70 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v70);
  }
  v16 = 32;
LABEL_11:
  v17 = (char *)a3 + v16;
  v18 = *((_QWORD *)a3 + 3);
  v19 = (void *)objc_opt_class();
  v73 = v11;
  SASerializableNewMutableArrayFromIndexList((uint64_t)v17, v18, v9, v11, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v86, v91, 16);
  if (v21)
  {
    v23 = v21;
    v24 = *(_QWORD *)v87;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v87 != v24)
          objc_enumerationMutation(v20);
        v26 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
        if (-[SATaskState isPidSuspended](self->_taskState, "isPidSuspended"))
        {
          if (!v26)
            continue;
        }
        else
        {
          if (-[SATaskState suspendCount](self->_taskState, "suspendCount"))
            v28 = v26 == 0;
          else
            v28 = 1;
          if (v28)
            continue;
        }
        Property = objc_getProperty(v26, v27, 16, 1);
        if (Property)
          Property[11] |= 0x40u;
      }
      v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v86, v91, 16);
    }
    while (v23);
  }
  v74 = v9;
  if (*(_QWORD *)a3 >= 0x11223345uLL && *((_DWORD *)a3 + 8))
  {
    v30 = *((_QWORD *)a3 + 3);
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", *((unsigned int *)a3 + 8));
    if (*((_DWORD *)a3 + 8))
    {
      v32 = self;
      v33 = 0;
      v34 = &v17[8 * v30];
      v35 = (void *)v31;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)&v34[4 * v33]);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addObject:", v36);

        ++v33;
      }
      while (v33 < *((unsigned int *)a3 + 8));
      v37 = v35;
      self = v32;
    }
    else
    {
      v37 = (void *)v31;
    }
  }
  else
  {
    v37 = 0;
  }
  v38 = (id *)objc_getProperty(selfa, v22, 8, 1);
  v72 = v37;
  +[SATaskState stateWithPAStyleTaskPrivateData:donatingUniquePids:]((uint64_t)SATaskState, v75, v37);
  v39 = (SATaskState *)objc_claimAutoreleasedReturnValue();
  taskState = self->_taskState;
  self->_taskState = v39;

  if (v38)
  {
    objc_msgSend(v38[1], "addObject:", self->_taskState);
    objc_msgSend(v38[1], "count");
  }
  v71 = self;
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v20, "count"));
  v42 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  obj = v20;
  v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
  if (v80)
  {
    v43 = 0x1E0CB3000uLL;
    v79 = *(_QWORD *)v83;
    v81 = v42;
    v77 = v41;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v83 != v79)
          objc_enumerationMutation(obj);
        v45 = *(_QWORD **)(*((_QWORD *)&v82 + 1) + 8 * v44);
        objc_msgSend(v38, "threads");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (v45)
          v47 = v45[3];
        else
          v47 = 0;
        objc_msgSend(*(id *)(v43 + 2024), "numberWithUnsignedLongLong:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "objectForKeyedSubscript:", v48);
        v49 = (id *)objc_claimAutoreleasedReturnValue();

        if (!v49)
        {
          if (v45)
            v51 = v45[3];
          else
            v51 = 0;
          +[SAThread threadWithId:]((uint64_t)SAThread, v51);
          v49 = (id *)objc_claimAutoreleasedReturnValue();
          -[SATask addThread:]((uint64_t)v38, v49);
        }
        if (v45)
          v52 = objc_getProperty(v45, v50, 16, 1);
        else
          v52 = 0;
        v53 = (id *)v52;
        objc_msgSend(v41, "addObject:", v53);
        objc_msgSend(v49, "threadStates");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "lastObject");
        v55 = (id *)objc_claimAutoreleasedReturnValue();

        v28 = v55 == v53;
        v42 = v81;
        if (!v28)
        {
          if (v49)
          {
            objc_msgSend(v49[1], "addObject:", v53);
            v56 = objc_msgSend(v49[1], "count") - 1;
            if (!v45)
              goto LABEL_60;
          }
          else
          {
            v56 = 0;
            if (!v45)
              goto LABEL_60;
          }
          if (v45[4])
          {
            objc_msgSend(v38, "dispatchQueues");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v43 + 2024), "numberWithUnsignedLongLong:", v45[4]);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "objectForKeyedSubscript:", v58);
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v59)
            {
              +[SADispatchQueue dispatchQueueWithId:]((uint64_t)SADispatchQueue, v45[4]);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              -[SATask addDispatchQueue:]((uint64_t)v38, v59);
            }
            +[SARecipeState stateWithThread:threadStateIndex:]((uint64_t)SADispatchQueueState, v49, v56);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            if (v59)
              -[SARecipe addState:hasConcurrentExecution:]((uint64_t)v59, v60, 0);
            v43 = 0x1E0CB3000uLL;
            if (v53)
              objc_storeWeak(v53 + 14, v59);

            v41 = v77;
            v42 = v81;
          }
        }
LABEL_60:
        if (objc_msgSend(v53, "hasDispatchQueue"))
        {
          objc_msgSend(v53, "dispatchQueue");
          v61 = (_BYTE *)objc_claimAutoreleasedReturnValue();
          v62 = v43;
          objc_msgSend(*(id *)(v43 + 2024), "numberWithUnsignedLongLong:", objc_msgSend(v61, "identifier"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v42, "containsObject:", v63);

          if (v64)
          {
            if (v61)
              v61[24] = 1;
          }
          else
          {
            objc_msgSend(*(id *)(v62 + 2024), "numberWithUnsignedLongLong:", objc_msgSend(v61, "identifier"));
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "addObject:", v65);

          }
          v43 = 0x1E0CB3000;
        }

        ++v44;
      }
      while (v80 != v44);
      v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
      v80 = v66;
    }
    while (v66);
  }

  v67 = objc_msgSend(v41, "copy");
  threadStates = v71->_threadStates;
  v71->_threadStates = (NSArray *)v67;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadStates, 0);
  objc_storeStrong((id *)&self->_taskState, 0);
}

@end
