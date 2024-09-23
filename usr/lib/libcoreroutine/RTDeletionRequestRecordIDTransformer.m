@implementation RTDeletionRequestRecordIDTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char *v12;
  NSObject *v13;
  void *v14;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    goto LABEL_12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[RTDeletionRequestRecordIDTransformer transformedValue:]";
      v21 = 1024;
      v22 = 51;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Object is not of dictionary type (in %s:%d)", buf, 0x12u);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    v7 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(v6, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __57__RTDeletionRequestRecordIDTransformer_transformedValue___block_invoke;
    v17[3] = &unk_1E92A05D0;
    v10 = v9;
    v18 = v10;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v17);
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v10, 0, &v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (char *)v16;
    if (v12)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v12;
        _os_log_fault_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_FAULT, "error while encoding json object, %@", buf, 0xCu);
      }

    }
    -[RTDeletionRequestRecordIDTransformer compressData:algorithm:](self, "compressData:algorithm:", v11, 2049);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_12:
    v14 = 0;
  }

  return v14;
}

void __57__RTDeletionRequestRecordIDTransformer_transformedValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v6, "allObjects", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "UUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v5);
}

- (id)reverseTransformedValue:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    goto LABEL_12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[RTDeletionRequestRecordIDTransformer reverseTransformedValue:]";
      v24 = 1024;
      v25 = 88;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Object is not of data type (in %s:%d)", buf, 0x12u);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[RTDeletionRequestRecordIDTransformer decompressData:algorithm:](self, "decompressData:algorithm:", v4, 2049);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, &v21);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (char *)v21;
    if (v8)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v8;
        _os_log_fault_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_FAULT, "error while decoding json object, %@", buf, 0xCu);
      }

    }
    v10 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(v7, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __64__RTDeletionRequestRecordIDTransformer_reverseTransformedValue___block_invoke;
    v19 = &unk_1E92A2AA8;
    v20 = v12;
    v13 = v12;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v16);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v13, v16, v17, v18, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_12:
    v14 = 0;
  }

  return v14;
}

void __64__RTDeletionRequestRecordIDTransformer_reverseTransformedValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        v14 = objc_alloc(MEMORY[0x1E0CB3A28]);
        v15 = (void *)objc_msgSend(v14, "initWithUUIDString:", v13, (_QWORD)v18);
        objc_msgSend(v7, "addObject:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v16 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v17, v5);

}

- (id)compressData:(id)a3 algorithm:(int)a4
{
  id v6;
  void *v7;
  size_t v8;
  uint8_t *v9;
  size_t v10;
  void *v11;
  id v12;
  size_t v13;
  _BOOL4 v14;
  unsigned int v15;
  unint64_t v16;
  size_t v17;
  size_t v18;
  size_t v19;
  char *v20;
  uint8_t *v21;
  size_t v22;
  id v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  NSObject *v30;
  void *v32;
  uint8_t buf[4];
  unint64_t v34;
  __int16 v35;
  size_t v36;
  __int16 v37;
  double v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "length");
    v9 = (uint8_t *)malloc_type_malloc(v8, 0xFE86D180uLL);
    v10 = compression_encode_scratch_buffer_size((compression_algorithm)a4);
    v11 = malloc_type_realloc(0, v10, 0x14E1C64DuLL);
    v12 = objc_retainAutorelease(v7);
    v32 = v11;
    v13 = compression_encode_buffer(v9, v8, (const uint8_t *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), v11, (compression_algorithm)a4);
    v14 = -[RTDeletionRequestRecordIDTransformer dataCompressedWithOriginalSize:compressedSize:](self, "dataCompressedWithOriginalSize:compressedSize:", objc_msgSend(v12, "length"), v13);
    v15 = objc_msgSend(v12, "length");
    v16 = v15;
    if (v14)
      v17 = v13;
    else
      v17 = 0;
    if (v14)
      v18 = v13;
    else
      v18 = v15;
    v19 = v18 + 21;
    v20 = (char *)malloc_type_malloc(v18 + 21, 0xE81CC4F4uLL);
    *(_DWORD *)v20 = -17958194;
    *(_QWORD *)(v20 + 4) = v16;
    *(_QWORD *)(v20 + 12) = v17;
    v20[20] = v14;
    v21 = v9;
    v22 = v13;
    if (!v14)
    {
      v23 = objc_retainAutorelease(v12);
      v21 = (uint8_t *)objc_msgSend(v23, "bytes");
      v22 = objc_msgSend(v23, "length");
    }
    memcpy(v20 + 21, v21, v22);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v20, v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    free(v20);
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
    if (v14)
    {
      if (v26)
      {
        *(_DWORD *)buf = 134218496;
        v34 = v16;
        v35 = 2048;
        v36 = v13;
        v37 = 2048;
        v38 = (float)((float)v16 / (float)v13);
        v27 = "compressed deletion request data, original data length, %llu, compressed data length, %llu, compression ratio, %.2fx";
        v28 = v25;
        v29 = 32;
LABEL_18:
        _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_INFO, v27, buf, v29);
      }
    }
    else if (v26)
    {
      *(_WORD *)buf = 0;
      v27 = "did not compress deletion request data";
      v28 = v25;
      v29 = 2;
      goto LABEL_18;
    }

    if (v9)
      free(v9);
    if (v32)
      free(v32);
    goto LABEL_23;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dataToCompress", buf, 2u);
  }

  v24 = 0;
LABEL_23:

  return v24;
}

- (BOOL)dataCompressedWithOriginalSize:(unint64_t)a3 compressedSize:(unint64_t)a4
{
  BOOL v4;

  if (a4)
    v4 = a4 >= a3;
  else
    v4 = 1;
  return !v4;
}

- (id)decompressData:(id)a3 algorithm:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v12;
  size_t v13;
  void *v14;
  void *v15;
  size_t v16;
  id v17;
  const uint8_t *v18;
  NSObject *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  _BYTE v23[21];
  int v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v4 = *(_QWORD *)&a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dataToDecompress", buf, 2u);
    }

    goto LABEL_7;
  }
  v24 = 0;
  objc_msgSend(v6, "getBytes:length:", &v24, 4);
  if (v24 == -559038737)
  {
    -[RTDeletionRequestRecordIDTransformer deprecatedDecompressData:algorithm:](self, "deprecatedDecompressData:algorithm:", v7, v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v10 = v8;
    goto LABEL_11;
  }
  if (v24 == 123)
  {
    v8 = v7;
    goto LABEL_10;
  }
  if (v24 != -17958194)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v22;
      _os_log_fault_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_FAULT, "Unhandled header version in %@", buf, 0xCu);

    }
LABEL_7:
    v10 = 0;
    goto LABEL_11;
  }
  *(_QWORD *)v23 = 0;
  *(_QWORD *)&v23[8] = 0;
  *(_QWORD *)&v23[13] = 0;
  objc_msgSend(v7, "getBytes:length:", v23, 21);
  if (!v23[20])
  {
    objc_msgSend(v7, "subdataWithRange:", 21, *(_QWORD *)&v23[4]);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v12 = malloc_type_malloc(*(size_t *)&v23[4], 0x24B00C88uLL);
  v13 = compression_decode_scratch_buffer_size((compression_algorithm)v4);
  v14 = malloc_type_realloc(0, v13, 0x450C7083uLL);
  objc_msgSend(v7, "subdataWithRange:", 21, *(_QWORD *)&v23[12]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)&v23[4];
  v17 = objc_retainAutorelease(v15);
  v18 = (const uint8_t *)objc_msgSend(v17, "bytes");
  if (compression_decode_buffer((uint8_t *)v12, v16, v18, *(size_t *)&v23[12], v14, (compression_algorithm)v4))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v12, *(_QWORD *)&v23[4], 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218240;
      v26 = *(void **)&v23[4];
      v27 = 2048;
      v28 = *(_QWORD *)&v23[12];
      _os_log_fault_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_FAULT, "failed to decompress deletion record data that was compresssed. original data length, %llu, compressed data length, %llu", buf, 0x16u);
    }

    if (v12)
      free(v12);
    v10 = 0;
  }
  if (v14)
    free(v14);

LABEL_11:
  return v10;
}

- (id)deprecatedDecompressData:(id)a3 algorithm:(int)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  size_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  size_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  size_t v16;
  id v17;
  NSObject *v19;
  uint8_t v20[8];
  unint64_t v21;
  uint8_t buf[16];

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v21 = 0;
    objc_msgSend(v5, "getBytes:range:", &v21, 4, 8);
    v7 = HIDWORD(v21);
    if (HIDWORD(v21))
    {
      v8 = v21;
      *(_QWORD *)buf = v21;
    }
    else
    {
      *(_QWORD *)buf = v21;
      objc_msgSend(v6, "getBytes:range:", buf, 4, 8);
      v8 = *(_QWORD *)buf;
    }
    v11 = malloc_type_malloc(v8, 0x762A731FuLL);
    v12 = compression_encode_scratch_buffer_size((compression_algorithm)a4);
    if (v12)
      v13 = malloc_type_malloc(v12, 0x5EB7E621uLL);
    else
      v13 = 0;
    if (v7)
      v14 = 8;
    else
      v14 = 12;
    objc_msgSend(v6, "subdataWithRange:", v14, objc_msgSend(v6, "length") - v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)buf;
    v17 = objc_retainAutorelease(v15);
    if (compression_decode_buffer((uint8_t *)v11, v16, (const uint8_t *)objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"), v13, (compression_algorithm)a4))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v11, *(_QWORD *)buf, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_FAULT, "Failure to decompress legacy buffer that was compresssed", v20, 2u);
      }

      if (v11)
        free(v11);
      v10 = 0;
      if (!v13)
        goto LABEL_17;
    }
    free(v13);
    goto LABEL_17;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dataToDecompress", buf, 2u);
  }

  v10 = 0;
LABEL_18:

  return v10;
}

@end
