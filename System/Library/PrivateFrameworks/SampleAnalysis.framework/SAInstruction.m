@implementation SAInstruction

- (void)setSymbol:(void *)a3 sourceinfo:
{
  id v6;
  id *v7;
  id v8;

  v8 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = a1;
    objc_sync_enter(v7);
    objc_storeStrong(v7 + 1, a2);
    objc_storeStrong(v7 + 2, a3);
    objc_sync_exit(v7);

  }
}

- (void)checkForNewSymbol
{
  unint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  id Property;
  id v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unint64_t *v32;
  id obj;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD v40[2];
  void (*v41)(_QWORD *, void *, void *);
  void *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _QWORD v80[18];

  v80[16] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1[5];
    v65 = 0;
    v66 = &v65;
    v67 = 0x3032000000;
    v68 = __Block_byref_object_copy__2;
    v69 = __Block_byref_object_dispose__2;
    v70 = 0;
    v59 = 0;
    v60 = &v59;
    v61 = 0x3032000000;
    v62 = __Block_byref_object_copy__2;
    v63 = __Block_byref_object_dispose__2;
    v64 = 0;
    v53 = 0;
    v54 = &v53;
    v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__2;
    v57 = __Block_byref_object_dispose__2;
    v58 = 0;
    v47 = 0;
    v48 = &v47;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__2;
    v51 = __Block_byref_object_dispose__2;
    v52 = 0;
    v32 = a1;
    -[SAInstruction realSegment]((id *)a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v41 = __34__SAInstruction_checkForNewSymbol__block_invoke;
    v42 = &unk_1E71487C0;
    v43 = &v65;
    v44 = &v53;
    v45 = &v59;
    v46 = &v47;
    v39 = v40;
    v4 = v2;
    if (v2)
    {
      v5 = v2;
      objc_sync_enter(v5);
      obj = v5;
      -[SASegment nonInlineSymbolAtOffsetIntoSegment:](v5, v1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v8 = v6;
        objc_sync_enter(v8);
        v9 = v8[4];
        if (v9
          && (v80[0] = v3,
              v80[1] = 3221225472,
              v80[2] = __51__SASymbol_nonInlineSourceInfoAtOffsetIntoSegment___block_invoke,
              v80[3] = &__block_descriptor_40_e22_q16__0__SASourceInfo_8l,
              v80[4] = v1,
              v10 = SABinarySearchArray(v9, 0, (uint64_t)v80),
              v10 != 0x7FFFFFFFFFFFFFFFLL))
        {
          objc_msgSend(v8[4], "objectAtIndexedSubscript:", v10, v32);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = 0;
        }
        objc_sync_exit(v8);

        v41(v39, v8, v11);
        v12 = (void *)v5[2];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v8, "offsetIntoSegment"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v15 = v14;
        v38 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
        if (v38)
        {
          v16 = *(_QWORD *)v76;
          v36 = v7;
          v37 = v4;
          v34 = *(_QWORD *)v76;
          v35 = v15;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v76 != v16)
                objc_enumerationMutation(v15);
              v18 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v17);
              v19 = objc_msgSend(v18, "offsetIntoSegment", v32);
              if (objc_msgSend(v18, "length") + v19 > v1)
              {
                if (objc_msgSend(v18, "offsetIntoSegment") > v1)
                  goto LABEL_35;
                v73 = 0u;
                v74 = 0u;
                v71 = 0u;
                v72 = 0u;
                if (v18)
                  Property = objc_getProperty(v18, v20, 32, 1);
                else
                  Property = 0;
                v22 = Property;
                v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
                if (!v23)
                {

LABEL_30:
                  v41(v39, v18, 0);
                  goto LABEL_31;
                }
                v24 = 0;
                v25 = *(_QWORD *)v72;
                do
                {
                  for (i = 0; i != v23; ++i)
                  {
                    if (*(_QWORD *)v72 != v25)
                      objc_enumerationMutation(v22);
                    v27 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
                    v28 = objc_msgSend(v27, "offsetIntoSegment");
                    if (objc_msgSend(v27, "length") + v28 > v1)
                    {
                      if (objc_msgSend(v27, "offsetIntoSegment") > v1)
                        goto LABEL_27;
                      v41(v39, v18, v27);
                      v24 = 1;
                    }
                  }
                  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
                }
                while (v23);
LABEL_27:

                v7 = v36;
                v4 = v37;
                v16 = v34;
                v15 = v35;
                if ((v24 & 1) == 0)
                  goto LABEL_30;
              }
LABEL_31:
              ++v17;
            }
            while (v17 != v38);
            v29 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
            v38 = v29;
          }
          while (v29);
        }
LABEL_35:

      }
      objc_sync_exit(obj);

    }
    v30 = (void *)v60[5];
    if (!v30)
      v30 = (void *)v66[5];
    v31 = (void *)v48[5];
    if (!v31)
      v31 = (void *)v54[5];
    -[SAInstruction setSymbol:sourceinfo:](v32, v30, v31);
    _Block_object_dispose(&v47, 8);

    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(&v59, 8);

    _Block_object_dispose(&v65, 8);
  }
}

- (BOOL)hasOffsetIntoBinary
{
  SASegment **p_segment;
  id WeakRetained;
  id v4;
  char v5;

  p_segment = &self->_segment;
  WeakRetained = objc_loadWeakRetained((id *)&self->_segment);
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_segment);
    v5 = objc_msgSend(v4, "hasOffsetIntoBinary");

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (int64_t)offsetIntoBinary
{
  SASegment **p_segment;
  id WeakRetained;
  id v5;
  int v6;
  unint64_t offsetIntoSegment;
  id v8;
  int64_t v9;

  p_segment = &self->_segment;
  WeakRetained = objc_loadWeakRetained((id *)&self->_segment);

  if (!WeakRetained)
    return self->_offsetIntoSegment;
  v5 = objc_loadWeakRetained((id *)p_segment);
  v6 = objc_msgSend(v5, "hasOffsetIntoBinary");

  if (!v6)
    return 0x7FFFFFFFFFFFFFFFLL;
  offsetIntoSegment = self->_offsetIntoSegment;
  v8 = objc_loadWeakRetained((id *)p_segment);
  v9 = objc_msgSend(v8, "offsetIntoBinary") + offsetIntoSegment;

  return v9;
}

- (id)realSegment
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;

  v1 = a1;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 4);
    v3 = WeakRetained;
    if (WeakRetained)
    {
      v1 = (id *)WeakRetained;
    }
    else
    {
      v4 = objc_loadWeakRetained(v1 + 3);
      -[SABinary createFakeEntireBinarySegment](v4);
      v1 = (id *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v1;
}

- (BOOL)symbolicateWithOptions:(unint64_t)a3 pid:(int)a4
{
  return -[SAInstruction symbolicateWithOptions:pid:additionalCSSymbolicatorFlags:](self, "symbolicateWithOptions:pid:additionalCSSymbolicatorFlags:", a3, *(_QWORD *)&a4, 0);
}

- (BOOL)symbolicateWithOptions:(unint64_t)a3 pid:(int)a4 additionalCSSymbolicatorFlags:(unsigned int)a5
{
  BOOL v9;
  BOOL v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t offsetIntoSegment;
  id v18;
  id v19;
  id sourceInfoOrSourceInfos;
  char v21;
  id v23;
  id v24;
  uint64_t dest[2];

  if (self)
  {
    if (self->_sourceInfoOrSourceInfos)
      return 0;
    v10 = self->_symbolOrSymbols != 0;
  }
  else
  {
    v10 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_binary);
  if (!WeakRetained)
    return 0;
  v12 = WeakRetained;
  -[SABinary symbolOwnerWrapperWithOptions:pid:checkExclave:additionalCSSymbolicatorFlags:](WeakRetained, a3, a4, 1, a5);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[SAInstruction realSegment]((id *)&self->super.isa);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SASegment baseAddressInSymbolOwnerWrapper:](v14, (void *)v13);
    if (v15 == -1)
    {
      v9 = 0;
    }
    else
    {
      v16 = v15;
      v23 = 0;
      v24 = 0;
      offsetIntoSegment = self->_offsetIntoSegment;
      objc_copyStruct(dest, (const void *)(v13 + 16), 16, 1, 0);
      -[SASegment symbolicateOffsetIntoSegment:symbolOwner:segmentBaseAddress:returningSymbols:sourceInfos:](v14, offsetIntoSegment, dest[0], dest[1], v16, &v24, &v23);
      v19 = v23;
      v18 = v24;
      -[SAInstruction setSymbol:sourceinfo:](self, v24, v23);
      sourceInfoOrSourceInfos = self->_sourceInfoOrSourceInfos;
      v9 = sourceInfoOrSourceInfos != 0;
      if (sourceInfoOrSourceInfos)
        v21 = 1;
      else
        v21 = v10;
      if ((v21 & 1) == 0)
        v9 = self->_symbolOrSymbols != 0;

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __34__SAInstruction_checkForNewSymbol__block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;

  v23 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[4] + 8);
  v9 = *(_QWORD *)(v7 + 40);
  v8 = (id *)(v7 + 40);
  if (!v9)
  {
    objc_storeStrong(v8, a2);
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
    goto LABEL_16;
  }
  v10 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (v10)
  {
    objc_msgSend(v10, "addObject:", v23);
    v11 = *(_QWORD *)(a1[7] + 8);
    v12 = *(void **)(v11 + 40);
    if (v6)
    {
      objc_msgSend(*(id *)(v11 + 40), "addObject:", v6);
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v18);
LABEL_15:

    goto LABEL_16;
  }
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40), v23, 0);
  v14 = *(_QWORD *)(a1[6] + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  v16 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v17 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  v18 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = objc_msgSend(v16, "initWithObjects:", v18, v19, 0);
  v21 = *(_QWORD *)(a1[7] + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v20;

  if (!v6)
  if (!v17)
    goto LABEL_15;
LABEL_16:

}

- (unint64_t)numSymbols
{
  return -[SAInstruction enumerateSymbolsNullable:](self, 0);
}

- (uint64_t)enumerateSymbolsNullable:(void *)a1
{
  char *v2;
  unint64_t v4;
  id *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  const char *v28;
  id v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  NSObject *v38;
  const char *v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint8_t buf[4];
  const char *ClassName;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  const char *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (!a1)
  {
LABEL_38:
    v14 = 0;
    goto LABEL_25;
  }
  v5 = a1;
  objc_sync_enter(v5);
  v6 = v5[1];
  v7 = v5[2];
  objc_sync_exit(v5);

  if (!v6)
  {
    v14 = 0;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (v4)
          (*(void (**)(unint64_t, id, NSObject *, _QWORD))(v4 + 16))(v4, v6, v7, 0);
        v14 = 1;
        goto LABEL_24;
      }
    }
    else
    {
      v16 = *__error();
      _sa_logt();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        ClassName = object_getClassName(v6);
        _os_log_error_impl(&dword_1B9BE0000, v7, OS_LOG_TYPE_ERROR, "symbol is %s", buf, 0xCu);
      }

      *__error() = v16;
      v17 = object_getClassName(v6);
      _SASetCrashLogMessage(4297, "symbol is %s", v18, v19, v20, v21, v22, v23, v17);
      _os_crash();
      __break(1u);
    }
    v24 = *__error();
    _sa_logt();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "debugDescription");
      v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v2 = (char *)objc_msgSend(v26, "UTF8String");
      v27 = -[NSObject count](v7, "count");
      v28 = object_getClassName(v7);
      *(_DWORD *)buf = 136315650;
      ClassName = v2;
      v59 = 2048;
      v60 = v27;
      v61 = 2080;
      v62 = v28;
      _os_log_error_impl(&dword_1B9BE0000, v25, OS_LOG_TYPE_ERROR, "1 symbol %s, but %lu source infos (%s)", buf, 0x20u);

    }
    *__error() = v24;
    objc_msgSend(v6, "debugDescription");
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30 = objc_msgSend(v29, "UTF8String");
    v8 = -[NSObject count](v7, "count");
    object_getClassName(v7);
    _SASetCrashLogMessage(4298, "1 symbol %s, but %lu source infos (%s)", v31, v32, v33, v34, v35, v36, v30);

    _os_crash();
    __break(1u);
    goto LABEL_32;
  }
  v2 = (char *)v6;
  if (v4)
  {
    v8 = v7;
    if (!v8)
    {
LABEL_8:
      if (objc_msgSend(v2, "count"))
      {
        v10 = 0;
        while (1)
        {
          if (!v8)
            goto LABEL_13;
          -[NSObject objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11 == v12)
            break;
LABEL_14:
          objc_msgSend(v2, "objectAtIndexedSubscript:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(unint64_t, void *, void *, uint64_t))(v4 + 16))(v4, v13, v11, v10);

          if (++v10 >= (unint64_t)objc_msgSend(v2, "count"))
            goto LABEL_15;
        }

LABEL_13:
        v11 = 0;
        goto LABEL_14;
      }
LABEL_15:

      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[NSObject count](v8, "count");
      if (v9 == objc_msgSend(v2, "count"))
        goto LABEL_8;
      goto LABEL_35;
    }
LABEL_32:
    v37 = *__error();
    _sa_logt();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = object_getClassName(v8);
      *(_DWORD *)buf = 136315138;
      ClassName = v39;
      _os_log_error_impl(&dword_1B9BE0000, v38, OS_LOG_TYPE_ERROR, "symbol is array, but source info is %s", buf, 0xCu);
    }

    *__error() = v37;
    v40 = object_getClassName(v8);
    _SASetCrashLogMessage(4279, "symbol is array, but source info is %s", v41, v42, v43, v44, v45, v46, v40);
    _os_crash();
    __break(1u);
LABEL_35:
    v4 = *__error();
    _sa_logt();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      v48 = objc_msgSend(v2, "count");
      v49 = -[NSObject count](v8, "count");
      *(_DWORD *)buf = 134218240;
      ClassName = (const char *)v48;
      v59 = 2048;
      v60 = v49;
      _os_log_error_impl(&dword_1B9BE0000, v47, OS_LOG_TYPE_ERROR, "%lu symbols, but %lu source infos", buf, 0x16u);
    }

    *__error() = v4;
    v50 = objc_msgSend(v2, "count");
    -[NSObject count](v8, "count");
    _SASetCrashLogMessage(4280, "%lu symbols, but %lu source infos", v51, v52, v53, v54, v55, v56, v50);
    _os_crash();
    __break(1u);
    goto LABEL_38;
  }
LABEL_16:
  v14 = objc_msgSend(v2, "count");

LABEL_24:
LABEL_25:

  return v14;
}

- (BOOL)hasSourceInfo
{
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = self->_sourceInfoOrSourceInfos;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = v2;
    v3 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v5 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v4);
          v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99E38], "null", (_QWORD)v10);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v7 != v8)
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        v3 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v3;
}

- (unint64_t)enumerateSymbols:(id)a3
{
  return -[SAInstruction enumerateSymbolsNullable:](self, a3);
}

- (NSString)debugDescription
{
  void *v3;
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  unint64_t v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id WeakRetained;
  id *p_segment;
  id v14;
  void *v15;
  id v16;
  int v18;
  NSObject *v19;
  const char *ClassName;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *);
  void *v31;
  id v32;
  SAInstruction *v33;
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 128);
  v28 = MEMORY[0x1E0C809B0];
  v29 = 3221225472;
  v30 = __33__SAInstruction_debugDescription__block_invoke;
  v31 = &unk_1E71487E8;
  v4 = v3;
  v32 = v4;
  v33 = self;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCCC450](&v28);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(self->_symbolOrSymbols, "count"))
    {
      v6 = 0;
      v7 = 1;
      do
      {
        if ((v7 & 1) == 0)
          objc_msgSend(v4, "appendString:", CFSTR(", "));
        objc_msgSend(self->_symbolOrSymbols, "objectAtIndexedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(self->_sourceInfoOrSourceInfos, "objectAtIndexedSubscript:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9 == v10)
        {

          v9 = 0;
        }
        ((void (**)(_QWORD, void *, void *))v5)[2](v5, v8, v9);

        ++v6;
        v11 = objc_msgSend(self->_symbolOrSymbols, "count");
        v7 = 0;
      }
      while (v6 < v11);
    }
  }
  else if (self->_symbolOrSymbols)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v18 = *__error();
      _sa_logt();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        ClassName = object_getClassName(self->_symbolOrSymbols);
        *(_DWORD *)buf = 136315138;
        v35 = ClassName;
        _os_log_error_impl(&dword_1B9BE0000, v19, OS_LOG_TYPE_ERROR, "symbol is %s", buf, 0xCu);
      }

      *__error() = v18;
      v21 = object_getClassName(self->_symbolOrSymbols);
      _SASetCrashLogMessage(4332, "symbol is %s", v22, v23, v24, v25, v26, v27, v21);
      _os_crash();
      __break(1u);
    }
    ((void (**)(_QWORD, id, id))v5)[2](v5, self->_symbolOrSymbols, self->_sourceInfoOrSourceInfos);
  }
  else
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("???"));
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_segment);

  if (WeakRetained)
    p_segment = (id *)&self->_segment;
  else
    p_segment = (id *)&self->_binary;
  v14 = objc_loadWeakRetained(p_segment);
  objc_msgSend(v14, "debugDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" (%@ + %llu)"), v15, self->_offsetIntoSegment, v28, v29, v30, v31);

  v16 = v4;
  return (NSString *)v16;
}

void __33__SAInstruction_debugDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
  v9 = objc_msgSend(v6, "offsetIntoSegment");

  objc_msgSend(v5, "appendFormat:", CFSTR("%@ + %llu"), v7, v8 - v9);
  if (v12)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v12, "debugDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendFormat:", CFSTR(" (%@ + %llu)"), v11, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) - objc_msgSend(v12, "offsetIntoSegment"));

  }
}

- (unint64_t)offsetIntoTextSegment
{
  return self->_offsetIntoSegment;
}

- (SASourceInfo)sourceInfo
{
  SAInstruction *v2;
  void *v3;
  void *v4;
  id v5;
  int v7;
  NSObject *v8;
  const char *ClassName;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_sourceInfoOrSourceInfos)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v2->_sourceInfoOrSourceInfos, "firstObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3 == v4)
        v5 = 0;
      else
        v5 = v3;

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = *__error();
        _sa_logt();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          ClassName = object_getClassName(v2->_sourceInfoOrSourceInfos);
          *(_DWORD *)buf = 136315138;
          v18 = ClassName;
          _os_log_error_impl(&dword_1B9BE0000, v8, OS_LOG_TYPE_ERROR, "source info is %s", buf, 0xCu);
        }

        *__error() = v7;
        v10 = object_getClassName(v2->_sourceInfoOrSourceInfos);
        _SASetCrashLogMessage(4363, "source info is %s", v11, v12, v13, v14, v15, v16, v10);
        _os_crash();
        __break(1u);
      }
      v5 = v2->_sourceInfoOrSourceInfos;
    }
  }
  else
  {
    v5 = 0;
  }
  objc_sync_exit(v2);

  return (SASourceInfo *)v5;
}

- (SASymbol)symbol
{
  SAInstruction *v2;
  id symbolOrSymbols;
  id v4;
  int v6;
  NSObject *v7;
  const char *ClassName;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  symbolOrSymbols = v2->_symbolOrSymbols;
  if (symbolOrSymbols)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v2->_symbolOrSymbols, "firstObject");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = *__error();
        _sa_logt();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          ClassName = object_getClassName(v2->_symbolOrSymbols);
          *(_DWORD *)buf = 136315138;
          v17 = ClassName;
          _os_log_error_impl(&dword_1B9BE0000, v7, OS_LOG_TYPE_ERROR, "symbol is %s", buf, 0xCu);
        }

        *__error() = v6;
        v9 = object_getClassName(v2->_symbolOrSymbols);
        _SASetCrashLogMessage(4377, "symbol is %s", v10, v11, v12, v13, v14, v15, v9);
        _os_crash();
        __break(1u);
      }
      v4 = v2->_symbolOrSymbols;
    }
    symbolOrSymbols = v4;
  }
  objc_sync_exit(v2);

  return (SASymbol *)symbolOrSymbols;
}

- (SABinary)binary
{
  return (SABinary *)objc_loadWeakRetained((id *)&self->_binary);
}

- (SASegment)segment
{
  return (SASegment *)objc_loadWeakRetained((id *)&self->_segment);
}

- (unint64_t)offsetIntoSegment
{
  return self->_offsetIntoSegment;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_segment);
  objc_destroyWeak((id *)&self->_binary);
  objc_storeStrong(&self->_sourceInfoOrSourceInfos, 0);
  objc_storeStrong(&self->_symbolOrSymbols, 0);
}

+ (id)classDictionaryKey
{
  return CFSTR("SAInstruction");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  unint64_t v2;

  v2 = -[SAInstruction numSymbols](self, "numSymbols");
  if (v2 <= 1)
    return 99;
  else
    return 56 * v2 + 43;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  unsigned int v15;
  char *v16;
  id v17;
  int v19;
  NSObject *v20;
  id v21;
  id v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  $4945294B1543CABA893D964DCA602C0B *v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  unint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (-[SAInstruction sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v19 = *__error();
    _sa_logt();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      -[SAInstruction debugDescription](self, "debugDescription");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v34 = objc_msgSend(v21, "UTF8String");
      v35 = 2048;
      v36 = -[SAInstruction sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      v37 = 2048;
      v38 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v20, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v19;
    -[SAInstruction debugDescription](self, "debugDescription");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = objc_msgSend(v22, "UTF8String");
    -[SAInstruction sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(5497, "%s: size %lu != buffer length %lu", v24, v25, v26, v27, v28, v29, v23);

    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 1025;
  *(_QWORD *)(&a3->var1 + 1) = self->_offsetIntoSegment;
  WeakRetained = objc_loadWeakRetained((id *)&self->_binary);
  objc_msgSend(WeakRetained, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v10, "getUUIDBytes:", (char *)&a3->var2 + 2);
  else
    uuid_clear((unsigned __int8 *)&a3->var2 + 2);
  v11 = objc_loadWeakRetained((id *)&self->_segment);

  if (v11)
  {
    v12 = objc_loadWeakRetained((id *)&self->_segment);
    *(_QWORD *)((char *)&a3->var4.var6 + 2) = SASerializableIndexForPointerFromSerializationDictionary(v12, v8);

  }
  else
  {
    *(_QWORD *)((char *)&a3->var4.var6 + 2) = -1;
  }
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __98__SAInstruction_Serialization__addSelfToBuffer_bufferLength_withCompletedSerializationDictionary___block_invoke;
  v30[3] = &unk_1E7148878;
  v31 = v8;
  v32 = a3;
  v13 = v8;
  v14 = -[SAInstruction enumerateSymbols:](self, "enumerateSymbols:", v30);
  if (v14 != 1)
  {
    if (v14)
    {
      BYTE2(a3->var5) = v14 - 1;
      v15 = (v14 - 1);
      goto LABEL_13;
    }
    *(unint64_t *)((char *)&a3->var4.var1 + 2) = -1;
    *(unint64_t *)((char *)&a3->var4.var4 + 2) = -1;
  }
  v15 = 0;
  BYTE2(a3->var5) = 0;
LABEL_13:
  v16 = (char *)a3 + 56 * v15;
  v17 = objc_loadWeakRetained((id *)&self->_binary);
  *(_QWORD *)(v16 + 91) = SASerializableIndexForPointerFromSerializationDictionary(v17, v13);

  return 1;
}

void __98__SAInstruction_Serialization__addSelfToBuffer_bufferLength_withCompletedSerializationDictionary___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  v8 = v7 + 26;
  v9 = v7 + 56 * a4 + 35;
  if (a4)
    v10 = v9;
  else
    v10 = v8;
  v11 = a2;
  *(_QWORD *)v10 = objc_msgSend(v11, "offsetIntoSegment");
  *(_QWORD *)(v10 + 8) = objc_msgSend(v11, "length");
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)(v10 + 16) = SASerializableIndexForPointerFromSerializationDictionary(v12, *(void **)(a1 + 32));
  v13 = v15;
  if (v15)
  {
    *(_QWORD *)(v10 + 24) = objc_msgSend(v15, "offsetIntoSegment");
    *(_DWORD *)(v10 + 48) = objc_msgSend(v15, "lineNum");
    *(_DWORD *)(v10 + 52) = objc_msgSend(v15, "columnNum");
    *(_QWORD *)(v10 + 32) = objc_msgSend(v15, "length");
    objc_msgSend(v15, "filePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(v10 + 40) = SASerializableIndexForPointerFromSerializationDictionary(v14, *(void **)(a1 + 32));

    v13 = v15;
  }
  else
  {
    *(_QWORD *)(v10 + 40) = -1;
  }

}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  id WeakRetained;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "classDictionaryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_binary);

    if (WeakRetained)
    {
      v8 = objc_loadWeakRetained((id *)&self->_binary);
      objc_msgSend(v8, "addSelfToSerializationDictionary:", v4);

    }
    v9 = objc_loadWeakRetained((id *)&self->_segment);

    if (v9)
    {
      v10 = objc_loadWeakRetained((id *)&self->_segment);
      objc_msgSend(v10, "addSelfToSerializationDictionary:", v4);

    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__SAInstruction_Serialization__addSelfToSerializationDictionary___block_invoke;
    v11[3] = &unk_1E71488A0;
    v12 = v4;
    -[SAInstruction enumerateSymbols:](self, "enumerateSymbols:", v11);

  }
}

void __65__SAInstruction_Serialization__addSelfToSerializationDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSelfToSerializationDictionary:", *(_QWORD *)(a1 + 32));

  v6 = v8;
  if (v8)
  {
    objc_msgSend(v8, "filePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSelfToSerializationDictionary:", *(_QWORD *)(a1 + 32));

    v6 = v8;
  }

}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  id *v4;

  v4 = (id *)objc_alloc_init((Class)objc_opt_self());
  objc_storeWeak(v4 + 3, 0);
  v4[5] = 0;
  return v4;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  id v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  uint64_t v27;
  char *v28;
  int v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  uint8_t buf[4];
  unint64_t v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  if (*(unsigned __int8 *)a3 >= 5u)
    goto LABEL_32;
  if (a4 <= 0x19)
  {
    v29 = *__error();
    _sa_logt();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v52 = a4;
      v53 = 2048;
      v54 = 26;
      _os_log_error_impl(&dword_1B9BE0000, v30, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAInstruction struct %lu", buf, 0x16u);
    }

    *__error() = v29;
    _SASetCrashLogMessage(5588, "bufferLength %lu < serialized SAInstruction struct %lu", v31, v32, v33, v34, v35, v36, a4);
    _os_crash();
    __break(1u);
LABEL_29:
    v37 = *__error();
    _sa_logt();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v52 = a4;
      v53 = 2048;
      v54 = 91;
      _os_log_error_impl(&dword_1B9BE0000, v38, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAInstruction struct v3 %lu", buf, 0x16u);
    }

    *__error() = v37;
    _SASetCrashLogMessage(5618, "bufferLength %lu < serialized SAInstruction struct v3 %lu", v39, v40, v41, v42, v43, v44, a4);
    _os_crash();
    __break(1u);
LABEL_32:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAInstruction version"), 0);
    v45 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v45);
  }
  v11 = v10;
  if (*((unsigned __int8 *)a3 + 1) < 4u)
  {
    if (uuid_is_null((const unsigned __int8 *)a3 + 10))
    {
      v14 = 0;
      goto LABEL_25;
    }
    uuidForBytes((uint64_t)a3 + 10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[SABinary binaryWithUUID:absolutePath:](SABinary, "binaryWithUUID:absolutePath:", v15, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = *(_QWORD *)((char *)a3 + 56 * *((unsigned __int8 *)a3 + 90) + 91);
    v13 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v9, v11, v13, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_25;
  }
  v16 = *((unsigned __int8 *)a3 + 1);
  if (v16 < 2)
    goto LABEL_25;
  if (v16 != 2)
  {
    if (a4 > 0x5A)
    {
      v20 = (uint64_t *)gSASerializationEncodedVersionBeingDecoded();
      if (*v20 <= 30)
        *(_QWORD *)gBinaryBeingDecoded(&gBinaryBeingDecoded) = v14;
      v21 = *(_QWORD *)((char *)a3 + 82);
      v22 = (void *)objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v21, v9, v11, v22, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (*v20 <= 30)
        *(_QWORD *)gBinaryBeingDecoded(&gBinaryBeingDecoded) = 0;
      LODWORD(v24) = *((unsigned __int8 *)a3 + 90);
      goto LABEL_21;
    }
    goto LABEL_29;
  }
  -[SABinary segmentWithCleanName:](v14, CFSTR("__TEXT_EXEC"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = v17;
  }
  else
  {
    -[SABinary segmentWithCleanName:](v14, CFSTR("__TEXT"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = v19;

  LODWORD(v24) = 0;
LABEL_21:
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __128__SAInstruction_Serialization__populateReferencesUsingBuffer_bufferLength_andDeserializationDictionary_andDataBufferDictionary___block_invoke;
  v46[3] = &unk_1E71488C8;
  v47 = v9;
  v48 = v11;
  v25 = v23;
  v49 = v25;
  v14 = v14;
  v50 = v14;
  v26 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCCC450](v46);
  ((void (**)(_QWORD, char *, uint64_t))v26)[2](v26, (char *)a3 + 26, -1);
  if ((_DWORD)v24)
  {
    v27 = *(_QWORD *)((char *)a3 + 26);
    v28 = (char *)a3 + 91;
    v24 = v24;
    do
    {
      ((void (**)(_QWORD, char *, uint64_t))v26)[2](v26, v28, v27);
      v28 += 56;
      --v24;
    }
    while (v24);
  }

LABEL_25:
}

void __128__SAInstruction_Serialization__populateReferencesUsingBuffer_bufferLength_andDeserializationDictionary_andDataBufferDictionary___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  id v23;
  id v24;
  int v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a2 + 16);
  if (v6 != -1 || *(_QWORD *)a2 || *(_QWORD *)(a2 + 8))
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v9 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v6, v7, v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD **)(a1 + 48);
    if (v11)
    {
      if (a3 == -1)
      {
        -[SASegment addNonInlineSymbolWithOffsetIntoSegment:length:name:](v11, *(_QWORD *)a2, *(_QWORD *)(a2 + 8), v10);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!v10)
        {
          v25 = *__error();
          _sa_logt();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            -[SASegment nonInlineSymbolAtOffsetIntoSegment:](*(void **)(a1 + 48), a3);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "debugDescription");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 48), "debugDescription");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = 138412546;
            v31 = v28;
            v32 = 2112;
            v33 = v29;
            _os_log_error_impl(&dword_1B9BE0000, v26, OS_LOG_TYPE_ERROR, "No symbol name for inline symbol (after non-inline symbol %@ in %@)", (uint8_t *)&v30, 0x16u);

          }
          v13 = 0;
          *__error() = v25;
          goto LABEL_18;
        }
        -[SASegment addInlineSymbolWithOffsetIntoSegment:length:name:nonInlineSymbolOffsetIntoSegment:](v11, *(_QWORD *)a2, *(_QWORD *)(a2 + 8), v10, a3);
        v12 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      -[SABinary addSymbolWithOffsetIntoBinary:length:name:](*(void **)(a1 + 56), *(_QWORD *)a2, *(_QWORD *)(a2 + 8), v10);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v12;
    v14 = *(_QWORD *)(a2 + 40);
    if (v14 != -1)
    {
      v16 = *(void **)(a1 + 32);
      v15 = *(void **)(a1 + 40);
      v17 = (void *)objc_opt_class();
      SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v14, v16, v15, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(a2 + 24);
      v20 = *(_QWORD *)(a2 + 32);
      v21 = *(_DWORD *)(a2 + 48);
      v22 = *(_DWORD *)(a2 + 52);
      if (a3 == -1)
        v24 = -[SASymbol addNonInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:](v13, v19, v20, v21, v22, v18);
      else
        v23 = -[SASymbol addInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:](v13, v19, v20, v21, v22, v18);

    }
LABEL_18:

  }
}

@end
