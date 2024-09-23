id PPSStoreLog()
{
  if (PPSStoreLog_onceToken != -1)
    dispatch_once(&PPSStoreLog_onceToken, &__block_literal_global_13_0);
  return (id)PPSStoreLog___logObj;
}

void sub_24399F720(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("++metricsByIDSync++"));
  _Unwind_Resume(a1);
}

void sub_24399FEC4(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("++metricsByIDSync++"));
  _Unwind_Resume(a1);
}

void sub_2439A1610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2439A28E0(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("++metricsByIDSync++"));
  _Unwind_Resume(a1);
}

id logHandle()
{
  if (logHandle_onceToken != -1)
    dispatch_once(&logHandle_onceToken, &__block_literal_global_47);
  return (id)logHandle___logObj;
}

void __logHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PerfPowerServicesMetadata", "MetadataDecl");
  v1 = (void *)logHandle___logObj;
  logHandle___logObj = (uint64_t)v0;

}

id PPSStorageLog()
{
  if (PPSStorageLog_onceToken != -1)
    dispatch_once(&PPSStorageLog_onceToken, &__block_literal_global_3_1);
  return (id)PPSStorageLog___logObj;
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id OUTLINED_FUNCTION_5(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t PPSPBRoundingReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v23 = 0;
        v24 = 0;
        v25 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
            break;
          v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
          *(_QWORD *)(a2 + v26) = v27 + 1;
          v25 |= (unint64_t)(v28 & 0x7F) << v23;
          if ((v28 & 0x80) == 0)
            goto LABEL_41;
          v23 += 7;
          v14 = v24++ >= 9;
          if (v14)
          {
            v25 = 0;
            goto LABEL_43;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5))
          v25 = 0;
LABEL_43:
        *(_QWORD *)(a1 + 8) = v25;
      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 20) |= 2u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_37;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_39;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_39:
        *(_DWORD *)(a1 + 16) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL PPSPBEnumTupleReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPSPBMetricTypeReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v23 = 0;
        v24 = 0;
        v25 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
            break;
          v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
          *(_QWORD *)(a2 + v26) = v27 + 1;
          v25 |= (unint64_t)(v28 & 0x7F) << v23;
          if ((v28 & 0x80) == 0)
            goto LABEL_41;
          v23 += 7;
          v14 = v24++ >= 9;
          if (v14)
          {
            v25 = 0;
            goto LABEL_43;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5))
          v25 = 0;
LABEL_43:
        *(_QWORD *)(a1 + 8) = v25;
      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 20) |= 2u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_37;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_39;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_39:
        *(_DWORD *)(a1 + 16) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id PPSSQLStoreLog()
{
  if (PPSSQLStoreLog_onceToken != -1)
    dispatch_once(&PPSSQLStoreLog_onceToken, &__block_literal_global_1);
  return (id)PPSSQLStoreLog___logObj;
}

id performStatement(sqlite3_stmt *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v26;

  v2 = (void *)objc_opt_new();
  columnNamesForStatement(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v4 = sqlite3_column_count(a1);
  while (1)
  {
    while (1)
    {
      v5 = sqlite3_step(a1);
      if (v5 != 100)
        break;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)v4 >= 1)
      {
        for (i = 0; i != v4; ++i)
        {
          objc_msgSend(v3, "objectAtIndexedSubscript:", i);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          valueForStatementColumn(a1, i);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v8);

        }
      }
      objc_msgSend(v2, "addObject:", v6);

    }
    if (v5 != 5)
      break;
    if (v26 > 4)
      goto LABEL_14;
    ++v26;
    sqlite3_sleep(10);
  }
  if (v5 != 11)
  {
    if (v26 < 6)
      goto LABEL_17;
LABEL_14:
    PPSSQLStoreLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      performStatement_cold_1(v10, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_16;
  }
  PPSSQLStoreLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    performStatement_cold_2(v10, v11, v12, v13, v14, v15, v16, v17);
LABEL_16:

  v2 = 0;
LABEL_17:

  return v2;
}

id columnNamesForStatement(sqlite3_stmt *a1)
{
  void *v2;
  int v3;
  int v4;
  int i;
  void *v6;

  v2 = (void *)objc_opt_new();
  v3 = sqlite3_column_count(a1);
  if (v3 >= 1)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_name(a1, i));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v6);

    }
  }
  return v2;
}

id valueForStatementColumn(sqlite3_stmt *a1, int a2)
{
  int v4;
  void *v5;
  const void *v6;

  v4 = sqlite3_column_type(a1, a2) - 1;
  v5 = 0;
  switch(v4)
  {
    case 0:
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", sqlite3_column_int64(a1, a2));
      break;
    case 1:
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", sqlite3_column_double(a1, a2));
      break;
    case 2:
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", sqlite3_column_text(a1, a2));
      break;
    case 4:
      return v5;
    default:
      v6 = sqlite3_column_blob(a1, a2);
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v6, sqlite3_column_bytes(a1, a2));
      break;
  }
  return v5;
}

uint64_t PPSPBMetricHistoryReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  PPSPBMetric *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(PPSPBMetric);
        objc_msgSend(a1, "addMetrics:", v17);
        if (!PBReaderPlaceMark() || (PPSPBMetricReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_2439A8F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return objc_opt_class();
}

uint64_t PPSPBEnumMappingReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  PPSPBEnumTuple *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(PPSPBEnumTuple);
        objc_msgSend(a1, "addEnumMap:", v17);
        if (!PBReaderPlaceMark() || !PPSPBEnumTupleReadFrom((uint64_t)v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPSPBUnitReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPSPBSourceReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPSPBCadenceTupleReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v23 = 0;
        v24 = 0;
        v25 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
            break;
          v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
          *(_QWORD *)(a2 + v26) = v27 + 1;
          v25 |= (unint64_t)(v28 & 0x7F) << v23;
          if ((v28 & 0x80) == 0)
            goto LABEL_41;
          v23 += 7;
          v14 = v24++ >= 9;
          if (v14)
          {
            v25 = 0;
            goto LABEL_43;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5))
          v25 = 0;
LABEL_43:
        *(_QWORD *)(a1 + 8) = v25;
      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 20) |= 2u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_37;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_39;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_39:
        *(_DWORD *)(a1 + 16) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPSPBGroupingDimensionsReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  void *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(a1, "addGroupBy:", v17);

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPSPBCadenceReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  PPSPBCadenceTuple *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(PPSPBCadenceTuple);
        objc_msgSend(a1, "addCadences:", v17);
        if (!PBReaderPlaceMark() || (PPSPBCadenceTupleReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_2439BDE98(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("++metricsByIDSync++"));
  _Unwind_Resume(a1);
}

id PPSMetricLog()
{
  if (PPSMetricLog_onceToken != -1)
    dispatch_once(&PPSMetricLog_onceToken, &__block_literal_global_6);
  return (id)PPSMetricLog___logObj;
}

id PPSClientInterfaceLog()
{
  if (PPSClientInterfaceLog_onceToken != -1)
    dispatch_once(&PPSClientInterfaceLog_onceToken, &__block_literal_global_8);
  return (id)PPSClientInterfaceLog___logObj;
}

uint64_t PPSPBMetricReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  PPSPBUnit *v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  char v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  uint64_t result;
  char v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char v73;
  void *v74;
  char v75;
  unsigned int v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  char v80;
  char v81;
  unsigned int v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  char v86;
  char v87;
  unsigned int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char v93;
  char v94;
  unsigned int v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  char v100;
  char v101;
  unsigned int v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  char v106;
  uint64_t v107;
  BOOL v108;
  uint64_t v109;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 120;
        goto LABEL_98;
      case 2u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 160;
        goto LABEL_98;
      case 3u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 40;
        goto LABEL_98;
      case 4u:
        *(_WORD *)(a1 + 188) |= 1u;
        v20 = *v3;
        v21 = *(_QWORD *)(a2 + v20);
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v22 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v22 = 0;
        }
        *(_QWORD *)(a1 + 8) = v22;
        goto LABEL_197;
      case 5u:
        v23 = 0;
        v24 = 0;
        v25 = 0;
        *(_WORD *)(a1 + 188) |= 4u;
        while (2)
        {
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          v28 = v27 + 1;
          if (v27 == -1 || v28 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
            *(_QWORD *)(a2 + v26) = v28;
            v25 |= (unint64_t)(v29 & 0x7F) << v23;
            if (v29 < 0)
            {
              v23 += 7;
              v15 = v24++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_146;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_146:
        v107 = 48;
        goto LABEL_196;
      case 6u:
        v30 = objc_alloc_init(PPSPBUnit);
        objc_storeStrong((id *)(a1 + 176), v30);
        if (!PBReaderPlaceMark() || (PPSPBUnitReadFrom((uint64_t)v30, a2) & 1) == 0)
          goto LABEL_202;
        goto LABEL_114;
      case 7u:
        v30 = objc_alloc_init(PPSPBCadence);
        objc_storeStrong((id *)(a1 + 32), v30);
        if (!PBReaderPlaceMark() || (PPSPBCadenceReadFrom(v30, a2) & 1) == 0)
          goto LABEL_202;
        goto LABEL_114;
      case 8u:
        v31 = 0;
        v32 = 0;
        v25 = 0;
        *(_WORD *)(a1 + 188) |= 0x10u;
        while (2)
        {
          v33 = *v3;
          v34 = *(_QWORD *)(a2 + v33);
          v35 = v34 + 1;
          if (v34 == -1 || v35 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
            *(_QWORD *)(a2 + v33) = v35;
            v25 |= (unint64_t)(v36 & 0x7F) << v31;
            if (v36 < 0)
            {
              v31 += 7;
              v15 = v32++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_150;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_150:
        v107 = 56;
        goto LABEL_196;
      case 9u:
        v37 = 0;
        v38 = 0;
        v25 = 0;
        *(_WORD *)(a1 + 188) |= 0x400u;
        while (2)
        {
          v39 = *v3;
          v40 = *(_QWORD *)(a2 + v39);
          v41 = v40 + 1;
          if (v40 == -1 || v41 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v42 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v40);
            *(_QWORD *)(a2 + v39) = v41;
            v25 |= (unint64_t)(v42 & 0x7F) << v37;
            if (v42 < 0)
            {
              v37 += 7;
              v15 = v38++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_154;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_154:
        v107 = 152;
        goto LABEL_196;
      case 0xAu:
        v43 = 0;
        v44 = 0;
        v25 = 0;
        *(_WORD *)(a1 + 188) |= 0x800u;
        while (2)
        {
          v45 = *v3;
          v46 = *(_QWORD *)(a2 + v45);
          v47 = v46 + 1;
          if (v46 == -1 || v47 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v46);
            *(_QWORD *)(a2 + v45) = v47;
            v25 |= (unint64_t)(v48 & 0x7F) << v43;
            if (v48 < 0)
            {
              v43 += 7;
              v15 = v44++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_158;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_158:
        v107 = 168;
        goto LABEL_196;
      case 0xBu:
        v49 = 0;
        v50 = 0;
        v25 = 0;
        *(_WORD *)(a1 + 188) |= 0x80u;
        while (2)
        {
          v51 = *v3;
          v52 = *(_QWORD *)(a2 + v51);
          v53 = v52 + 1;
          if (v52 == -1 || v53 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v54 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v52);
            *(_QWORD *)(a2 + v51) = v53;
            v25 |= (unint64_t)(v54 & 0x7F) << v49;
            if (v54 < 0)
            {
              v49 += 7;
              v15 = v50++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_162;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_162:
        v107 = 112;
        goto LABEL_196;
      case 0xCu:
        v30 = objc_alloc_init(PPSPBSource);
        objc_storeStrong((id *)(a1 + 144), v30);
        if (!PBReaderPlaceMark() || (PPSPBSourceReadFrom((uint64_t)v30, a2) & 1) == 0)
          goto LABEL_202;
        goto LABEL_114;
      case 0xDu:
        v55 = 0;
        v56 = 0;
        v25 = 0;
        *(_WORD *)(a1 + 188) |= 8u;
        while (2)
        {
          v57 = *v3;
          v58 = *(_QWORD *)(a2 + v57);
          v59 = v58 + 1;
          if (v58 == -1 || v59 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v60 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v58);
            *(_QWORD *)(a2 + v57) = v59;
            v25 |= (unint64_t)(v60 & 0x7F) << v55;
            if (v60 < 0)
            {
              v55 += 7;
              v15 = v56++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_166;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_166:
        v107 = 52;
        goto LABEL_196;
      case 0xEu:
        v61 = 0;
        v62 = 0;
        v25 = 0;
        *(_WORD *)(a1 + 188) |= 0x20u;
        while (2)
        {
          v63 = *v3;
          v64 = *(_QWORD *)(a2 + v63);
          v65 = v64 + 1;
          if (v64 == -1 || v65 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v66 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v64);
            *(_QWORD *)(a2 + v63) = v65;
            v25 |= (unint64_t)(v66 & 0x7F) << v61;
            if (v66 < 0)
            {
              v61 += 7;
              v15 = v62++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_170;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_170:
        v107 = 60;
        goto LABEL_196;
      case 0x10u:
        v30 = objc_alloc_init(PPSPBRounding);
        objc_storeStrong((id *)(a1 + 136), v30);
        if (!PBReaderPlaceMark() || (PPSPBRoundingReadFrom((uint64_t)v30, a2) & 1) == 0)
          goto LABEL_202;
        goto LABEL_114;
      case 0x11u:
        v68 = 0;
        v69 = 0;
        v25 = 0;
        *(_WORD *)(a1 + 188) |= 0x100u;
        while (2)
        {
          v70 = *v3;
          v71 = *(_QWORD *)(a2 + v70);
          v72 = v71 + 1;
          if (v71 == -1 || v72 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v73 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v71);
            *(_QWORD *)(a2 + v70) = v72;
            v25 |= (unint64_t)(v73 & 0x7F) << v68;
            if (v73 < 0)
            {
              v68 += 7;
              v15 = v69++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_174;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_174:
        v107 = 128;
        goto LABEL_196;
      case 0x12u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 96;
        goto LABEL_98;
      case 0x13u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 72;
        goto LABEL_98;
      case 0x14u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 24;
LABEL_98:
        v74 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_197;
      case 0x15u:
        v75 = 0;
        v76 = 0;
        v25 = 0;
        *(_WORD *)(a1 + 188) |= 0x200u;
        while (2)
        {
          v77 = *v3;
          v78 = *(_QWORD *)(a2 + v77);
          v79 = v78 + 1;
          if (v78 == -1 || v79 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v80 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v78);
            *(_QWORD *)(a2 + v77) = v79;
            v25 |= (unint64_t)(v80 & 0x7F) << v75;
            if (v80 < 0)
            {
              v75 += 7;
              v15 = v76++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_178;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_178:
        v107 = 132;
        goto LABEL_196;
      case 0x16u:
        v30 = objc_alloc_init(PPSPBEnumMapping);
        objc_storeStrong((id *)(a1 + 64), v30);
        if (!PBReaderPlaceMark() || (PPSPBEnumMappingReadFrom(v30, a2) & 1) == 0)
          goto LABEL_202;
        goto LABEL_114;
      case 0x17u:
        v30 = objc_alloc_init(PPSPBGroupingDimensions);
        objc_storeStrong((id *)(a1 + 88), v30);
        if (!PBReaderPlaceMark() || (PPSPBGroupingDimensionsReadFrom(v30, a2) & 1) == 0)
          goto LABEL_202;
        goto LABEL_114;
      case 0x18u:
        v30 = objc_alloc_init(PPSPBMetricType);
        objc_storeStrong((id *)(a1 + 104), v30);
        if (PBReaderPlaceMark() && (PPSPBMetricTypeReadFrom((uint64_t)v30, a2) & 1) != 0)
        {
LABEL_114:
          PBReaderRecallMark();

LABEL_197:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_202:

        return 0;
      case 0x19u:
        v81 = 0;
        v82 = 0;
        v25 = 0;
        *(_WORD *)(a1 + 188) |= 2u;
        while (2)
        {
          v83 = *v3;
          v84 = *(_QWORD *)(a2 + v83);
          v85 = v84 + 1;
          if (v84 == -1 || v85 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v86 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v84);
            *(_QWORD *)(a2 + v83) = v85;
            v25 |= (unint64_t)(v86 & 0x7F) << v81;
            if (v86 < 0)
            {
              v81 += 7;
              v15 = v82++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_182;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_182:
        v107 = 16;
        goto LABEL_196;
      case 0x1Au:
        v87 = 0;
        v88 = 0;
        v89 = 0;
        *(_WORD *)(a1 + 188) |= 0x2000u;
        while (2)
        {
          v90 = *v3;
          v91 = *(_QWORD *)(a2 + v90);
          v92 = v91 + 1;
          if (v91 == -1 || v92 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v93 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v91);
            *(_QWORD *)(a2 + v90) = v92;
            v89 |= (unint64_t)(v93 & 0x7F) << v87;
            if (v93 < 0)
            {
              v87 += 7;
              v15 = v88++ >= 9;
              if (v15)
              {
                v89 = 0;
                goto LABEL_186;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v89 = 0;
LABEL_186:
        v108 = v89 != 0;
        v109 = 185;
        goto LABEL_191;
      case 0x1Bu:
        v94 = 0;
        v95 = 0;
        v96 = 0;
        *(_WORD *)(a1 + 188) |= 0x1000u;
        while (2)
        {
          v97 = *v3;
          v98 = *(_QWORD *)(a2 + v97);
          v99 = v98 + 1;
          if (v98 == -1 || v99 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v100 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v98);
            *(_QWORD *)(a2 + v97) = v99;
            v96 |= (unint64_t)(v100 & 0x7F) << v94;
            if (v100 < 0)
            {
              v94 += 7;
              v15 = v95++ >= 9;
              if (v15)
              {
                v96 = 0;
                goto LABEL_190;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v96 = 0;
LABEL_190:
        v108 = v96 != 0;
        v109 = 184;
LABEL_191:
        *(_BYTE *)(a1 + v109) = v108;
        goto LABEL_197;
      case 0x1Cu:
        v101 = 0;
        v102 = 0;
        v25 = 0;
        *(_WORD *)(a1 + 188) |= 0x40u;
        while (2)
        {
          v103 = *v3;
          v104 = *(_QWORD *)(a2 + v103);
          v105 = v104 + 1;
          if (v104 == -1 || v105 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v106 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v104);
            *(_QWORD *)(a2 + v103) = v105;
            v25 |= (unint64_t)(v106 & 0x7F) << v101;
            if (v106 < 0)
            {
              v101 += 7;
              v15 = v102++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_195;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_195:
        v107 = 80;
LABEL_196:
        *(_DWORD *)(a1 + v107) = v25;
        goto LABEL_197;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_197;
    }
  }
}

uint64_t PPSPBMetricStreamReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  PPSPBMetricHistory *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        *(_BYTE *)(a1 + 24) |= 1u;
        v19 = *v3;
        v20 = *(_QWORD *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v20);
          *(_QWORD *)(a2 + v19) = v20 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v21 = 0;
        }
        *(_QWORD *)(a1 + 8) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        v18 = objc_alloc_init(PPSPBMetricHistory);
        objc_msgSend((id)a1, "addMetricHistory:", v18);
        if (!PBReaderPlaceMark() || (PPSPBMetricHistoryReadFrom(v18, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void performStatement_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_24399D000, a1, a3, "SQL Timeout", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void performStatement_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_24399D000, a1, a3, "Corrupt db file", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x24BE7AF80]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x24BE7AF90]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x24BE7AFA8]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x24BE7AFD8]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x24BE7AFE8]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x24BE7AFF0]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x24BE7B008]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x24BE7B018]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x24BE7B030]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x24BE7B038]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x24BE7B048]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x24BEDCE78](cls, outCount);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x24BDADBA8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerateClasses(const void *image, const char *namePrefix, Protocol *conformingTo, Class subclassing, void *block)
{
  MEMORY[0x24BEDD058](image, namePrefix, conformingTo, subclassing, block);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x24BEDD4B8](property);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x24BEDE010](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x24BEDE020](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE028](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE038](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x24BEDE048](a1, *(_QWORD *)&iCol);
  return result;
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE058](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x24BEDE060](a1, *(_QWORD *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE068](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE078](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x24BEDE108](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x24BEDE118](a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x24BEDE148](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x24BEDE1C0](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_sleep(int a1)
{
  return MEMORY[0x24BEDE278](*(_QWORD *)&a1);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
}

