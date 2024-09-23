@implementation WBSOnDeviceSearchSuggestionsModel

- (WBSOnDeviceSearchSuggestionsModel)initWithModelFileAtPath:(id)a3
{
  id v4;
  WBSOnDeviceSearchSuggestionsModel *v5;
  uint64_t v6;
  NSFileHandle *modelFileHandle;
  NSFileHandle *v8;
  void *v9;
  id v10;
  unsigned __int8 *v11;
  unsigned int v12;
  unsigned int v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  WBSOnDeviceSearchSuggestionsModel *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v22;
  uint64_t v23;
  id v24;
  objc_super v25;
  uint8_t buf[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)WBSOnDeviceSearchSuggestionsModel;
  v5 = -[WBSOnDeviceSearchSuggestionsModel init](&v25, sel_init);
  if (!v5)
  {
LABEL_15:
    v18 = 0;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingAtPath:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  modelFileHandle = v5->_modelFileHandle;
  v5->_modelFileHandle = (NSFileHandle *)v6;

  v8 = v5->_modelFileHandle;
  if (!v8)
  {
    v19 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[WBSOnDeviceSearchSuggestionsModel initWithModelFileAtPath:].cold.1((uint64_t)v4, v19, v20);
    goto LABEL_15;
  }
  v24 = 0;
  -[NSFileHandle readDataUpToLength:error:](v8, "readDataUpToLength:error:", 2, &v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v24;
  if (v10 || objc_msgSend(v9, "length") != 2)
  {
    v16 = (id)WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "safari_privacyPreservingError");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSOnDeviceSearchSuggestionsModel initWithModelFileAtPath:].cold.4((uint64_t)v4, v17, buf, v16);
    }

  }
  else
  {
    v11 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v9), "bytes");
    v12 = *v11;
    v5->_addressSize = v12;
    v13 = v11[1];
    v5->_scoreSize = v13;
    if (v12 - 5 > 0xFFFFFFFB)
    {
      if (v13 - 5 > 0xFFFFFFFB)
      {
        v18 = v5;
        goto LABEL_12;
      }
      v22 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[WBSOnDeviceSearchSuggestionsModel initWithModelFileAtPath:].cold.3((uint64_t)v4, v22, v23);
    }
    else
    {
      v14 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[WBSOnDeviceSearchSuggestionsModel initWithModelFileAtPath:].cold.2((uint64_t)v4, v14, v15);
    }
  }
  v18 = 0;
LABEL_12:

LABEL_16:
  return v18;
}

- (vector<_WBSSearchSuggestionCandidate,)readTreeNodeWithCandidate:()vector<_WBSSearchSuggestionCandidate
{
  vector<_WBSSearchSuggestionCandidate, std::allocator<_WBSSearchSuggestionCandidate>> *v6;
  int v7;
  int v8;
  _WBSSearchSuggestionCandidate *var1;
  uint64_t v10;
  _WBSSearchSuggestionCandidate *v11;
  _WBSSearchSuggestionCandidate *v12;
  uint64_t v13;
  _WBSSearchSuggestionCandidate *v14;
  uint64_t v15;
  BOOL v16;
  __CFString *v17;
  uint64_t v18;
  BOOL v19;
  __CFString *v20;
  char v21;

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  if (!a4->var2)
  {
    v6 = self;
    v21 = 0;
    v19 = 0;
    v18 = 0;
    v20 = &stru_1E4B40D18;
    v7 = unk_1EE73FCF8(self, "_readMaxScoreAsRootAtAddress:withLeafCandidate:success:", a4->var1, &v18, &v21);
    if (v21)
    {
      v8 = v7;
      if (!v19)
        goto LABEL_14;
      objc_storeStrong((id *)&v20, a4->var3);
      var1 = retstr->var1;
      if (var1 >= retstr->var2.var0)
      {
        v11 = (_WBSSearchSuggestionCandidate *)std::vector<_WBSSearchSuggestionCandidate>::__push_back_slow_path<_WBSSearchSuggestionCandidate const&>((unint64_t *)retstr, &v18);
      }
      else
      {
        if (!var1)
        {
LABEL_18:
          __break(1u);
          return self;
        }
        v10 = v18;
        var1->var2 = v19;
        *(_QWORD *)&var1->var0 = v10;
        var1->var3 = v20;
        v11 = var1 + 1;
      }
      retstr->var1 = v11;
LABEL_14:
      while (1)
      {
        v16 = 0;
        v15 = 0;
        v17 = &stru_1E4B40D18;
        v17 = (__CFString *)a4->var3;

        LODWORD(v15) = v8;
        self = (vector<_WBSSearchSuggestionCandidate, std::allocator<_WBSSearchSuggestionCandidate>> *)unk_1EE73FD00(v6, "_readNextChild:", &v15);
        if ((self & 1) == 0)
          break;
        v12 = retstr->var1;
        if (v12 >= retstr->var2.var0)
        {
          v14 = (_WBSSearchSuggestionCandidate *)std::vector<_WBSSearchSuggestionCandidate>::__push_back_slow_path<_WBSSearchSuggestionCandidate const&>((unint64_t *)retstr, &v15);
        }
        else
        {
          if (!v12)
            goto LABEL_18;
          v13 = v15;
          v12->var2 = v16;
          *(_QWORD *)&v12->var0 = v13;
          v12->var3 = v17;
          v14 = v12 + 1;
        }
        retstr->var1 = v14;

      }
    }

  }
  return self;
}

- (BOOL)_readNextChild:(_WBSSearchSuggestionCandidate *)a3
{
  uint64_t v5;
  BOOL v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id var3;
  NSFileHandle *modelFileHandle;
  void *v13;
  id v14;
  unsigned __int8 v15;
  uint64_t v16;
  size_t v17;
  NSFileHandle *v18;
  void *v19;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const void *v32;
  unsigned __int8 *v33;
  unsigned __int8 *v34;
  unsigned int v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  char v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v46 = 0;
  v5 = -[WBSOnDeviceSearchSuggestionsModel _readNextNumberOfBytesAsInt:success:](self, "_readNextNumberOfBytesAsInt:success:", 1, &v46);
  if (v46)
    v6 = (_DWORD)v5 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    -[WBSOnDeviceSearchSuggestionsModel _readNextNumberOfBytesAsString:success:](self, "_readNextNumberOfBytesAsString:success:", v5, &v46);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (!v46)
    {
      v7 = 0;
LABEL_31:

      return v7;
    }
    objc_msgSend(a3->var3, "stringByAppendingString:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    var3 = a3->var3;
    a3->var3 = v10;

    modelFileHandle = self->_modelFileHandle;
    v45 = 0;
    -[NSFileHandle readDataUpToLength:error:](modelFileHandle, "readDataUpToLength:error:", 1, &v45);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v45;
    if (objc_msgSend(v13, "length") != 1 || v14)
    {
      v22 = (id)WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v14, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSOnDeviceSearchSuggestionsModel _readNextChild:].cold.1();
      }

    }
    else
    {
      v15 = *(_BYTE *)objc_msgSend(objc_retainAutorelease(v13), "bytes");
      v16 = 20;
      if ((v15 & 1) == 0)
        v16 = 16;
      v17 = *(unsigned int *)((char *)&self->super.isa + v16);
      if ((v17 - 2) < 4)
      {
        v18 = self->_modelFileHandle;
        v44 = 0;
        -[NSFileHandle readDataUpToLength:error:](v18, "readDataUpToLength:error:", (v17 - 1), &v44);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v44;
        if (objc_msgSend(v19, "length") == (_DWORD)v17 - 1 && v14 == 0)
        {
          v32 = (const void *)objc_msgSend(objc_retainAutorelease(v19), "bytes");
          v33 = (unsigned __int8 *)malloc_type_malloc(v17, 0x3FDF8503uLL);
          v34 = v33;
          if (v33)
          {
            *v33 = v15;
            memcpy(v33 + 1, v32, (v17 - 1));
            v35 = byteArrayToInteger(v34, v17) >> 1;
            free(v34);
            if ((v15 & 1) != 0)
            {
              a3->var1 = v35;
              a3->var2 = 0;
              v7 = 1;
            }
            else
            {
              a3->var0 = v35;
              v7 = 1;
              a3->var2 = 1;
            }
            goto LABEL_21;
          }
          v36 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            -[WBSOnDeviceSearchSuggestionsModel _readNextChild:].cold.3(v36, v37, v38, v39, v40, v41, v42, v43);
        }
        else
        {
          v21 = (id)WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v14, "safari_privacyPreservingDescription");
            objc_claimAutoreleasedReturnValue();
            -[WBSOnDeviceSearchSuggestionsModel _readNextChild:].cold.1();
          }

        }
        v7 = 0;
LABEL_21:

LABEL_30:
        goto LABEL_31;
      }
      v23 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[WBSOnDeviceSearchSuggestionsModel _readNextChild:].cold.4(v23, v24, v25, v26, v27, v28, v29, v30);
      v14 = 0;
    }
    v7 = 0;
    goto LABEL_30;
  }
  return 0;
}

- (unsigned)_readMaxScoreAsRootAtAddress:(unsigned int)a3 withLeafCandidate:(_WBSSearchSuggestionCandidate *)a4 success:(BOOL *)a5
{
  void (**v8)(_QWORD, _QWORD);
  NSFileHandle *modelFileHandle;
  id v10;
  NSObject *v11;
  unsigned int v12;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  id v17;
  _QWORD v18[5];
  _BYTE v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __92__WBSOnDeviceSearchSuggestionsModel__readMaxScoreAsRootAtAddress_withLeafCandidate_success___block_invoke;
  v18[3] = &__block_descriptor_40_e8_v12__0B8l;
  v18[4] = a5;
  v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A8599ED0](v18, a2);
  modelFileHandle = self->_modelFileHandle;
  v17 = 0;
  -[NSFileHandle seekToOffset:error:](modelFileHandle, "seekToOffset:error:", a3, &v17);
  v10 = v17;
  if (v10)
  {
    v11 = (id)WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSOnDeviceSearchSuggestionsModel _readMaxScoreAsRootAtAddress:withLeafCandidate:success:].cold.1();
    }

    v8[2](v8, 0);
    goto LABEL_5;
  }
  v19[0] = 0;
  v14 = -[WBSOnDeviceSearchSuggestionsModel _readNextNumberOfBytesAsInt:success:](self, "_readNextNumberOfBytesAsInt:success:", self->_scoreSize, v19);
  if (v19[0])
  {
    v15 = v14;
    if ((v14 & 1) == 0)
    {
LABEL_11:
      v8[2](v8, 1);
      v12 = v15 >> 1;
      goto LABEL_6;
    }
    v16 = -[WBSOnDeviceSearchSuggestionsModel _readNextNumberOfBytesAsInt:success:](self, "_readNextNumberOfBytesAsInt:success:", self->_scoreSize, v19);
    if (v19[0])
    {
      a4->var2 = 1;
      a4->var0 = v16;
      goto LABEL_11;
    }
  }
  v8[2](v8, 0);
LABEL_5:
  v12 = -1;
LABEL_6:

  return v12;
}

uint64_t __92__WBSOnDeviceSearchSuggestionsModel__readMaxScoreAsRootAtAddress_withLeafCandidate_success___block_invoke(uint64_t result, char a2)
{
  _BYTE *v2;

  v2 = *(_BYTE **)(result + 32);
  if (v2)
    *v2 = a2;
  return result;
}

- (unsigned)_readNextNumberOfBytesAsInt:(unsigned int)a3 success:(BOOL *)a4
{
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD);
  NSFileHandle *modelFileHandle;
  void *v9;
  id v10;
  NSObject *v12;
  id v14;
  _QWORD v15[9];

  v15[8] = *MEMORY[0x1E0C80C00];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__WBSOnDeviceSearchSuggestionsModel__readNextNumberOfBytesAsInt_success___block_invoke;
  v15[3] = &__block_descriptor_40_e8_v12__0B8l;
  v15[4] = a4;
  v6 = MEMORY[0x1A8599ED0](v15, a2);
  v7 = (void (**)(_QWORD, _QWORD))v6;
  if (a3)
  {
    modelFileHandle = self->_modelFileHandle;
    v14 = 0;
    -[NSFileHandle readDataUpToLength:error:](modelFileHandle, "readDataUpToLength:error:", a3, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    if (objc_msgSend(v9, "length") == a3 && v10 == 0)
    {
      v7[2](v7, 1);
      a3 = byteArrayToInteger((unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v9), "bytes"), a3);
    }
    else
    {
      v12 = (id)WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSOnDeviceSearchSuggestionsModel _readNextNumberOfBytesAsInt:success:].cold.1();
      }

      v7[2](v7, 0);
      a3 = 0;
    }

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
  }

  return a3;
}

uint64_t __73__WBSOnDeviceSearchSuggestionsModel__readNextNumberOfBytesAsInt_success___block_invoke(uint64_t result, char a2)
{
  _BYTE *v2;

  v2 = *(_BYTE **)(result + 32);
  if (v2)
    *v2 = a2;
  return result;
}

- (id)_readNextNumberOfBytesAsString:(unsigned int)a3 success:(BOOL *)a4
{
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD);
  NSFileHandle *modelFileHandle;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v17;
  _QWORD v18[9];

  v18[8] = *MEMORY[0x1E0C80C00];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __76__WBSOnDeviceSearchSuggestionsModel__readNextNumberOfBytesAsString_success___block_invoke;
  v18[3] = &__block_descriptor_40_e8_v12__0B8l;
  v18[4] = a4;
  v6 = MEMORY[0x1A8599ED0](v18, a2);
  v7 = (void (**)(_QWORD, _QWORD))v6;
  if (a3)
  {
    modelFileHandle = self->_modelFileHandle;
    v9 = a3;
    v17 = 0;
    -[NSFileHandle readDataUpToLength:error:](modelFileHandle, "readDataUpToLength:error:", a3, &v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v17;
    if (objc_msgSend(v10, "length") == v9 && v11 == 0)
    {
      v7[2](v7, 1);
      v15 = objc_msgSend(objc_retainAutorelease(v10), "bytes");
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v15, v9, 4);
    }
    else
    {
      v13 = (id)WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSOnDeviceSearchSuggestionsModel _readNextNumberOfBytesAsString:success:].cold.1();
      }

      v7[2](v7, 0);
      v14 = 0;
    }

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
    v14 = 0;
  }

  return v14;
}

uint64_t __76__WBSOnDeviceSearchSuggestionsModel__readNextNumberOfBytesAsString_success___block_invoke(uint64_t result, char a2)
{
  _BYTE *v2;

  v2 = *(_BYTE **)(result + 32);
  if (v2)
    *v2 = a2;
  return result;
}

- (unsigned)scoreSize
{
  return self->_scoreSize;
}

- (unsigned)addressSize
{
  return self->_addressSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelFileHandle, 0);
}

- (void)initWithModelFileAtPath:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, a2, a3, "Unable to open model file at path: %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)initWithModelFileAtPath:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, a2, a3, "Invalid address size specified in model file at path: %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)initWithModelFileAtPath:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, a2, a3, "Invalid score size specified in model file at path: %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)initWithModelFileAtPath:(uint8_t *)buf .cold.4(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Unable to read model header values for file at path: %{public}@ with error: %{public}@", buf, 0x16u);

  OUTLINED_FUNCTION_2_0();
}

- (void)_readNextChild:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A3D90000, v3, (uint64_t)v3, "Failed to read child node: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

- (void)_readNextChild:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, a1, a3, "Failed to allocate block to re-assemble score or address block", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)_readNextChild:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, a1, a3, "Failed to read child node: invalid number of bytes to assemble score or address for candidate node", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)_readMaxScoreAsRootAtAddress:withLeafCandidate:success:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A3D90000, v3, (uint64_t)v3, "Failed to seek to address in file: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

- (void)_readNextNumberOfBytesAsInt:success:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A3D90000, v3, (uint64_t)v3, "Failed to read in bytes as integer %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

- (void)_readNextNumberOfBytesAsString:success:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A3D90000, v3, (uint64_t)v3, "Failed to bytes as strings: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

@end
