id SZGetLoggingHandle()
{
  if (SZGetLoggingHandle_onceToken != -1)
    dispatch_once(&SZGetLoggingHandle_onceToken, &__block_literal_global_3);
  return (id)SZGetLoggingHandle_logHandle;
}

id SZGetTraceHandle()
{
  if (SZGetTraceHandle_onceToken != -1)
    dispatch_once(&SZGetTraceHandle_onceToken, &__block_literal_global_3_5);
  return (id)SZGetTraceHandle_logHandle;
}

uint64_t UNIX2DOSTime(uint64_t a1)
{
  tm *v1;
  int tm_year;
  tm v4;
  time_t v5;

  memset(&v4, 0, sizeof(v4));
  v5 = (a1 + 1) & 0xFFFFFFFFFFFFFFFELL;
  v1 = localtime_r(&v5, &v4);
  tm_year = v1->tm_year;
  if (tm_year >= 80)
    return ((tm_year << 25) + 1610612736) | (v1->tm_sec >> 1) | (32 * v1->tm_min) | (v1->tm_hour << 11) | (v1->tm_mday << 16) | ((v1->tm_mon << 21) + 0x200000);
  else
    return 2162688;
}

time_t DOS2UNIXTime(unsigned int a1)
{
  uint32x4_t v2;
  tm *v3;
  int8x16_t v4;
  time_t v6;

  v6 = time(0);
  v3 = (tm *)DOS2UNIXTime_t;
  if (!DOS2UNIXTime_t)
  {
    v3 = localtime_r(&v6, &DOS2UNIXTime_buf);
    DOS2UNIXTime_t = (uint64_t)v3;
  }
  v3->tm_isdst = -1;
  v2.i32[0] = a1;
  v4 = (int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(a1), (uint32x4_t)xmmword_1D4E78240);
  v4.i32[0] = vshlq_u32(v2, (uint32x4_t)xmmword_1D4E78230).u32[0];
  *(int8x16_t *)&v3->tm_sec = vandq_s8(v4, (int8x16_t)xmmword_1D4E78250);
  v3->tm_mon = ((a1 >> 21) & 0xF) - 1;
  v3->tm_year = (a1 >> 25) + 80;
  return mktime(v3);
}

unsigned __int16 *GetExtraFieldWithSignature(uint64_t a1, unint64_t a2, unsigned __int16 *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int16 *v6;
  uint64_t v7;

  if (a2)
  {
    v3 = 0;
    v4 = 0;
    do
    {
      v5 = v3 + 4;
      if (v3 + 4 > a2)
        break;
      v6 = (unsigned __int16 *)(a1 + v3);
      v7 = v6[1];
      if (*v6 == *a3)
      {
        if (v5 + v7 <= a2)
          return v6;
        else
          return 0;
      }
      v4 += v7 + 4;
      v3 = (unsigned __int16)v4;
    }
    while ((unsigned __int16)v4 < a2);
  }
  return 0;
}

unsigned __int16 *OpenLocalFile(uint64_t a1, uint64_t a2, char *__s, unsigned __int16 a4, char a5, int *a6)
{
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  compression_status v14;
  const char *v15;
  unsigned __int16 *v16;
  unsigned int v17;
  int v18;
  compression_algorithm v19;
  NSObject *v20;
  int v21;
  compression_status v22;
  compression_status v23;
  NSObject *v24;
  const char *v25;
  uint64_t v27;
  compression_status v28;
  int v29;
  compression_status v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = *(_QWORD *)(a2 + 64) + strlen(__s) + a4 + 30;
  v11 = *(_QWORD *)(a2 + 32);
  v12 = *(_QWORD *)(a2 + 40);
  v13 = *(unsigned int *)(a2 + 28);
  v14 = *(unsigned __int16 *)(a2 + 6);
  v15 = *(const char **)(a2 + 72);
  v16 = (unsigned __int16 *)malloc_type_calloc(1uLL, 0x78uLL, 0x10F00403766FA32uLL);
  *a6 = 0;
  v16[56] = v14;
  *((_BYTE *)v16 + 114) = a5;
  *((_QWORD *)v16 + 5) = v10;
  *((_QWORD *)v16 + 6) = v11;
  *((_QWORD *)v16 + 7) = v12;
  *((_QWORD *)v16 + 8) = 0;
  *((_QWORD *)v16 + 9) = a1;
  *((_QWORD *)v16 + 10) = 0;
  *((_QWORD *)v16 + 12) = crc32(0, 0, 0);
  *((_QWORD *)v16 + 13) = v13;
  *((_QWORD *)v16 + 11) = strdup(v15);
  if (!*((_BYTE *)v16 + 114))
  {
    v17 = v16[56];
    if (v17 > 0xD)
    {
      if (v17 != 14 && v17 != 99)
        goto LABEL_12;
    }
    else
    {
      if (!v16[56])
        return v16;
      if (v17 != 8)
      {
LABEL_12:
        v20 = SZGetLoggingHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v27 = *((_QWORD *)v16 + 11);
          v29 = 67109378;
          v30 = v14;
          v31 = 2080;
          v32 = v27;
          _os_log_error_impl(&dword_1D4E55000, v20, OS_LOG_TYPE_ERROR, "Unknown compression scheme (%d) found for file %s; must use raw mode.",
            (uint8_t *)&v29,
            0x12u);
        }
        v21 = 5;
        goto LABEL_22;
      }
    }
    *((_QWORD *)v16 + 10) = malloc_type_malloc(0x10000uLL, 0xC95C5AF3uLL);
    v18 = v16[56];
    switch(v18)
    {
      case 8:
        v19 = COMPRESSION_ZLIB;
        break;
      case 14:
        v19 = COMPRESSION_LZMA;
        break;
      case 99:
        v19 = COMPRESSION_LZFSE;
        break;
      default:
        v24 = SZGetLoggingHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v28 = v16[56];
          v29 = 67109120;
          v30 = v28;
          v25 = "Failed to get compression algorithm id for method %d";
          goto LABEL_25;
        }
LABEL_21:
        v21 = 3;
LABEL_22:
        *a6 = v21;
        free(*((void **)v16 + 11));
        free(*((void **)v16 + 10));
        free(v16);
        return 0;
    }
    v22 = compression_stream_init((compression_stream *)v16, COMPRESSION_STREAM_DECODE, v19);
    if (v22)
    {
      v23 = v22;
      v24 = SZGetLoggingHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v29 = 67109120;
        v30 = v23;
        v25 = "Failed to initialize compression: %d";
LABEL_25:
        _os_log_error_impl(&dword_1D4E55000, v24, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v29, 8u);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
  }
  return v16;
}

uint64_t ReadLocalFileData(uint64_t *a1, void *a2, size_t a3, size_t *a4)
{
  size_t v5;
  int v8;
  NSObject *v9;
  int *v10;
  char *v11;
  const char *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v16;
  unint64_t v17;
  FILE **v18;
  size_t v19;
  size_t v20;
  size_t v21;
  const Bytef *v22;
  NSObject *v23;
  compression_status v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const Bytef *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  size_t v37;
  _BOOL4 v38;
  NSObject *v39;
  uint32_t v40;
  NSObject *v41;
  NSObject *v43;
  const char *v44;
  NSObject *v45;
  uint32_t v46;
  NSObject *v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  int *v52;
  char *v53;
  NSObject *v54;
  int v56;
  uint64_t v57;
  int v58;
  int v59;
  uint8_t buf[4];
  _BYTE v61[44];
  uint64_t v62;

  v5 = a3;
  v62 = *MEMORY[0x1E0C80C00];
  v8 = *((unsigned __int16 *)a1 + 56);
  if (!*((_WORD *)a1 + 56) || *((_BYTE *)a1 + 114))
  {
    if (a1[6])
    {
      if (fseeko(*(FILE **)a1[9], a1[5], 0))
      {
        v9 = SZGetLoggingHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = __error();
          v11 = strerror(*v10);
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)v61 = v11;
          v12 = "Failed to seek to local file data: %s";
          goto LABEL_41;
        }
        return 4;
      }
      if (a1[6] < v5)
        v5 = a1[6];
      if (v5 != fread(a2, 1uLL, v5, *(FILE **)a1[9]))
      {
        v9 = SZGetLoggingHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)v61 = v5;
          v12 = "Failed to read %ld bytes of local file data";
          goto LABEL_41;
        }
        return 4;
      }
      if (!*((_WORD *)a1 + 56))
        a1[12] = crc32(a1[12], (const Bytef *)a2, v5);
      *a4 = v5;
      v37 = a1[6] - v5;
      v38 = a1[6] == v5;
      a1[5] += v5;
      a1[6] = v37;
      a1[8] += v5;
      return (2 * v38);
    }
    else
    {
      v13 = SZGetLoggingHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v14 = 2;
        _os_log_error_impl(&dword_1D4E55000, v13, OS_LOG_TYPE_ERROR, "No data remaining!", buf, 2u);
      }
      else
      {
        return 2;
      }
    }
    return v14;
  }
  if (v8 != 8 && v8 != 99 && v8 != 14)
  {
    v41 = SZGetLoggingHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v56 = *((unsigned __int16 *)a1 + 56);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v61 = v56;
      _os_log_error_impl(&dword_1D4E55000, v41, OS_LOG_TYPE_ERROR, "Unknown compression method: %d", buf, 8u);
    }
    return 5;
  }
  *a1 = (uint64_t)a2;
  a1[1] = a3;
  *a4 = 0;
  while (1)
  {
    v16 = a1[1];
    if (!v16)
      return 0;
    if (a1[3])
      goto LABEL_24;
    v17 = a1[6];
    if (!v17)
      goto LABEL_24;
    if (v17 >= 0x10000)
      v17 = 0x10000;
    v18 = (FILE **)a1[9];
    a1[2] = a1[10];
    a1[3] = v17;
    if (fseeko(*v18, a1[5], 0))
      break;
    v19 = fread((void *)a1[10], 1uLL, a1[3], *(FILE **)a1[9]);
    v20 = v19;
    if (a1[3] != v19)
    {
      v54 = SZGetLoggingHandle();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        v57 = a1[3];
        if (feof(*(FILE **)a1[9]))
          v58 = 121;
        else
          v58 = 110;
        v59 = ferror(*(FILE **)a1[9]);
        *(_DWORD *)buf = 134218752;
        *(_QWORD *)v61 = v57;
        *(_WORD *)&v61[8] = 2048;
        *(_QWORD *)&v61[10] = v20;
        *(_WORD *)&v61[18] = 1024;
        *(_DWORD *)&v61[20] = v58;
        *(_WORD *)&v61[24] = 1024;
        *(_DWORD *)&v61[26] = v59;
        v12 = "Failed to read %zu bytes of local file data; read %lu bytes; isEOF=%c; ferror=%d";
        v39 = v54;
        v40 = 34;
        goto LABEL_42;
      }
      return 4;
    }
    v21 = a1[6] - v19;
    a1[5] += v19;
    a1[6] = v21;
    v16 = a1[1];
LABEL_24:
    v22 = (const Bytef *)*a1;
    v23 = SZGetLoggingHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v29 = a1[2];
      v30 = a1[3];
      v31 = (const Bytef *)*a1;
      v32 = a1[1];
      *(_DWORD *)buf = 134218752;
      *(_QWORD *)v61 = v29;
      *(_WORD *)&v61[8] = 2048;
      *(_QWORD *)&v61[10] = v30;
      *(_WORD *)&v61[18] = 2048;
      *(_QWORD *)&v61[20] = v31;
      *(_WORD *)&v61[28] = 2048;
      *(_QWORD *)&v61[30] = v32;
      _os_log_debug_impl(&dword_1D4E55000, v23, OS_LOG_TYPE_DEBUG, "Calling compression_stream_process with src_ptr: %p, src_size: %zu, dst_ptr: %p, dst_size: %zu", buf, 0x2Au);
    }
    v24 = compression_stream_process((compression_stream *)a1, 0);
    v25 = SZGetLoggingHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v33 = a1[2];
      v34 = a1[3];
      v35 = *a1;
      v36 = a1[1];
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)v61 = v24;
      *(_WORD *)&v61[4] = 2048;
      *(_QWORD *)&v61[6] = v33;
      *(_WORD *)&v61[14] = 2048;
      *(_QWORD *)&v61[16] = v34;
      *(_WORD *)&v61[24] = 2048;
      *(_QWORD *)&v61[26] = v35;
      *(_WORD *)&v61[34] = 2048;
      *(_QWORD *)&v61[36] = v36;
      _os_log_debug_impl(&dword_1D4E55000, v25, OS_LOG_TYPE_DEBUG, "After process ret %d: src_ptr: %p, src_size: %zu, dst_ptr: %p, dst_size: %zu", buf, 0x30u);
    }
    if (v24 == COMPRESSION_STATUS_ERROR)
    {
      v43 = SZGetLoggingHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v61 = -1;
        v44 = "compression_stream_process returned %d";
        v45 = v43;
        v46 = 8;
LABEL_55:
        _os_log_error_impl(&dword_1D4E55000, v45, OS_LOG_TYPE_ERROR, v44, buf, v46);
      }
      return 3;
    }
    v26 = v16 - a1[1];
    v27 = SZGetLoggingHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v61 = v26;
      _os_log_debug_impl(&dword_1D4E55000, v27, OS_LOG_TYPE_DEBUG, "Processed %zu bytes", buf, 0xCu);
    }
    a1[12] = crc32(a1[12], v22, v26);
    *a4 += v26;
    v28 = a1[8] + v26;
    a1[8] = v28;
    if (v24 == COMPRESSION_STATUS_END)
    {
      if (!a1[6])
      {
        if (a1[7] == v28)
          return 2;
        v49 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          return 3;
        v51 = a1[7];
        v50 = a1[8];
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)v61 = v50;
        *(_WORD *)&v61[8] = 2048;
        *(_QWORD *)&v61[10] = v51;
        v44 = "Hit end at %llu, before expected size %llu";
        v45 = v49;
        v46 = 22;
        goto LABEL_55;
      }
      v47 = SZGetLoggingHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v48 = a1[6];
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v61 = v48;
        v44 = "Hit end with %llu remaining";
        v45 = v47;
        v46 = 12;
        goto LABEL_55;
      }
      return 3;
    }
  }
  v9 = SZGetLoggingHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v52 = __error();
    v53 = strerror(*v52);
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v61 = v53;
    v12 = "Failed to seek to local file data: %s";
LABEL_41:
    v39 = v9;
    v40 = 12;
LABEL_42:
    _os_log_error_impl(&dword_1D4E55000, v39, OS_LOG_TYPE_ERROR, v12, buf, v40);
  }
  return 4;
}

uint64_t CloseLocalFile(compression_stream *stream)
{
  uint64_t v2;
  unsigned int state_low;
  BOOL v5;
  NSObject *v6;
  int v7;
  compression_status v8;
  compression_status v9;
  NSObject *v10;
  uint8_t *dst_ptr;
  size_t src_size;
  const uint8_t *src_ptr;
  size_t dst_size;
  int v16;
  size_t v17;
  __int16 v18;
  size_t v19;
  __int16 v20;
  const uint8_t *v21;
  uint64_t v22;

  v2 = 0;
  v22 = *MEMORY[0x1E0C80C00];
  state_low = LOWORD(stream[2].state);
  if (state_low > 0xD)
  {
    if (state_low != 99 && state_low != 14)
      goto LABEL_20;
    goto LABEL_10;
  }
  if (LOWORD(stream[2].state))
  {
    if (state_low != 8)
      goto LABEL_20;
LABEL_10:
    if (BYTE2(stream[2].state))
      v5 = state_low == 0;
    else
      v5 = 1;
    if (!v5)
      goto LABEL_16;
  }
  if (stream[2].src_ptr == (const uint8_t *)stream[2].src_size)
  {
LABEL_16:
    v2 = 0;
    goto LABEL_20;
  }
  v6 = SZGetLoggingHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    src_ptr = stream[2].src_ptr;
    src_size = stream[2].src_size;
    dst_size = stream[2].dst_size;
    v16 = 136315650;
    v17 = dst_size;
    v18 = 2048;
    v19 = src_size;
    v20 = 2048;
    v21 = src_ptr;
    _os_log_error_impl(&dword_1D4E55000, v6, OS_LOG_TYPE_ERROR, "CRC mismatch for %s; expected 0x%lx, actual 0x%lx",
      (uint8_t *)&v16,
      0x20u);
  }
  v2 = 6;
LABEL_20:
  if (!BYTE2(stream[2].state))
  {
    v7 = LOWORD(stream[2].state);
    if (v7 == 8 || v7 == 99 || v7 == 14)
    {
      v8 = compression_stream_destroy(stream);
      if (v8)
      {
        v9 = v8;
        v10 = SZGetLoggingHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v16 = 67109120;
          LODWORD(v17) = v9;
          _os_log_error_impl(&dword_1D4E55000, v10, OS_LOG_TYPE_ERROR, "compression_stream_destroy returned %d", (uint8_t *)&v16, 8u);
        }
        v2 = 3;
      }
    }
  }
  dst_ptr = stream[2].dst_ptr;
  if (dst_ptr)
    free(dst_ptr);
  free((void *)stream[2].dst_size);
  free(stream);
  return v2;
}

_WORD *CopyLocalFileHeader(FILE **a1, uint64_t a2, int *a3)
{
  NSObject *v6;
  _DWORD *v7;
  _DWORD *v8;
  NSObject *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  off_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  NSObject *v18;
  _WORD *MutableLocalFileRecord;
  int v20;
  NSObject *v21;
  size_t v23;
  _DWORD *v24;
  __int16 v25;
  const char *v26;
  _DWORD v27[2];
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  off_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (fseeko(*a1, *(_QWORD *)(a2 + 64), 0))
  {
    v6 = SZGetLoggingHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27[0]) = 0;
      _os_log_error_impl(&dword_1D4E55000, v6, OS_LOG_TYPE_ERROR, "Failed to seek to local file record", (uint8_t *)v27, 2u);
    }
    goto LABEL_13;
  }
  v7 = malloc_type_malloc(0x1EuLL, 0x10000401E9FC43BuLL);
  if (!v7)
  {
    v18 = SZGetLoggingHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27[0]) = 0;
      v26 = "Failed to malloc LocalFileRecord";
      goto LABEL_24;
    }
LABEL_10:
    MutableLocalFileRecord = 0;
    v20 = 3;
    goto LABEL_14;
  }
  v8 = v7;
  if (fread(v7, 1uLL, 0x1EuLL, *a1) != 30)
  {
    v21 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    LOWORD(v27[0]) = 0;
    v15 = "Failed to read local file record";
LABEL_26:
    v16 = v21;
    v17 = 2;
    goto LABEL_27;
  }
  if (*v8 != 67324752)
  {
    v9 = SZGetLoggingHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(unsigned __int8 *)v8;
      v11 = *((unsigned __int8 *)v8 + 1);
      v12 = *((unsigned __int8 *)v8 + 2);
      v13 = *((unsigned __int8 *)v8 + 3);
      v14 = ftello(*a1);
      v27[0] = 67110144;
      v27[1] = v10;
      v28 = 1024;
      v29 = v11;
      v30 = 1024;
      v31 = v12;
      v32 = 1024;
      v33 = v13;
      v34 = 2048;
      v35 = v14 - 30;
      v15 = "Found invalid local file record with signature 0x%02hhx%02hhx%02hhx%02hhx at offset %lld";
      v16 = v9;
      v17 = 36;
LABEL_27:
      _os_log_error_impl(&dword_1D4E55000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)v27, v17);
    }
LABEL_12:
    free(v8);
LABEL_13:
    MutableLocalFileRecord = 0;
    v20 = 4;
    goto LABEL_14;
  }
  v23 = *((unsigned __int16 *)v8 + 14) + (unint64_t)*((unsigned __int16 *)v8 + 13);
  v24 = reallocf(v8, v23 + 30);
  if (!v24)
  {
    v18 = SZGetLoggingHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27[0]) = 0;
      v26 = "Failed to allocate full local file record";
LABEL_24:
      _os_log_error_impl(&dword_1D4E55000, v18, OS_LOG_TYPE_ERROR, v26, (uint8_t *)v27, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v8 = v24;
  if (v23 != fread((char *)v24 + 30, 1uLL, v23, *a1))
  {
    v21 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    LOWORD(v27[0]) = 0;
    v15 = "Failed to read in variable-length portion of central directory record";
    goto LABEL_26;
  }
  *a3 = 0;
  MutableLocalFileRecord = CreateMutableLocalFileRecord((uint64_t)v8);
  free(v8);
  v25 = MutableLocalFileRecord[1];
  v20 = 0;
  if ((v25 & 8) != 0)
  {
    *(_OWORD *)(MutableLocalFileRecord + 20) = *(_OWORD *)(a2 + 32);
    *((_DWORD *)MutableLocalFileRecord + 8) = *(_DWORD *)(a2 + 28);
    MutableLocalFileRecord[1] = v25 & 0xFFF7;
  }
LABEL_14:
  *a3 = v20;
  return MutableLocalFileRecord;
}

_QWORD *OpenZipFile(const char *a1, char a2)
{
  _QWORD *v4;
  FILE *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  int *v9;
  char *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  size_t v14;
  NSObject *v15;
  size_t v16;
  NSObject *v17;
  unsigned int v18;
  FILE *v19;
  NSObject *v20;
  _DWORD *v21;
  off_t *v22;
  NSObject *v23;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  off_t *v28;
  size_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  int *v33;
  char *v34;
  int *v35;
  char *v36;
  const char *v37;
  size_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  int v44;
  NSObject *v45;
  int v46;
  const char *v47;
  int *v48;
  char *v49;
  int v50;
  off_t v51;
  int *v52;
  char *v53;
  unint64_t v54;
  unint64_t v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  NSObject *v60;
  uint32_t v61;
  _DWORD *v62;
  size_t v63;
  NSObject *v64;
  off_t v65;
  const char *v66;
  NSObject *v67;
  uint32_t v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  int v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  int v80;
  int v81;
  uint64_t v82;
  NSObject *v83;
  int *v84;
  char *v85;
  size_t v86;
  NSObject *v87;
  uint64_t v88;
  uint64_t v89;
  _DWORD *v90;
  uint64_t v91;
  size_t v92;
  size_t v93;
  NSObject *v94;
  FILE *__stream;
  uint8_t buf[4];
  _BYTE v97[10];
  _BYTE v98[10];
  uint64_t v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v4 = malloc_type_calloc(1uLL, 0x60uLL, 0x10200406EBF9D83uLL);
  v5 = fopen(a1, "rb");
  *v4 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      v6 = fileno(v5);
      if (fcntl(v6, 48, 1))
      {
        v7 = SZGetLoggingHandle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v33 = __error();
          v34 = strerror(*v33);
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)v97 = v34;
          _os_log_error_impl(&dword_1D4E55000, v7, OS_LOG_TYPE_ERROR, "Failed to set F_NOCACHE on zip file FD: %s", buf, 0xCu);
        }
      }
    }
    v4[6] = -1;
    v4[3] = 0;
    if (fseeko((FILE *)*v4, -22, 2))
    {
      v8 = SZGetLoggingHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = __error();
        v10 = strerror(*v9);
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v97 = v10;
        v11 = "Failed to seek to end record: %s";
        v12 = v8;
        v13 = 12;
LABEL_25:
        _os_log_error_impl(&dword_1D4E55000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
        goto LABEL_26;
      }
      goto LABEL_26;
    }
    v4[1] = ftello((FILE *)*v4) + 22;
    v14 = fread(v4 + 7, 1uLL, 0x16uLL, (FILE *)*v4);
    if (v14 != 22)
    {
      v16 = v14;
      v17 = SZGetLoggingHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)v97 = 22;
        *(_WORD *)&v97[8] = 2048;
        *(_QWORD *)v98 = v16;
        v11 = "Failed to read end record: expected to read %lu but actually read %lu";
        v12 = v17;
        v13 = 22;
        goto LABEL_25;
      }
LABEL_26:
      v23 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        goto LABEL_27;
      *(_WORD *)buf = 0;
      v25 = "Failed to get end record";
      goto LABEL_32;
    }
    if (*((_DWORD *)v4 + 14) != 101010256)
    {
      v15 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        goto LABEL_26;
      *(_WORD *)buf = 0;
      v11 = "Failed to locate end record";
LABEL_24:
      v12 = v15;
      v13 = 2;
      goto LABEL_25;
    }
    if (*((__int16 *)v4 + 32) != -1)
    {
      v18 = *((unsigned __int16 *)v4 + 33);
      if (v18 != 0xFFFF && *((_DWORD *)v4 + 17) != -1 && *((_DWORD *)v4 + 18) != -1)
      {
LABEL_40:
        v31 = v4[10];
        if (v31)
        {
          if (v18 == 0xFFFF)
            v32 = *(_QWORD *)(v31 + 32);
          else
            v32 = v18;
          v4[2] = v32;
          LODWORD(v32) = *((_DWORD *)v4 + 17);
          if ((_DWORD)v32 == -1)
            v41 = *(_QWORD *)(v31 + 40);
          else
            v41 = *((unsigned int *)v4 + 17);
          v4[5] = v41;
          v42 = *((unsigned int *)v4 + 18);
          if ((_DWORD)v42 == -1)
          {
            v42 = *(_QWORD *)(v31 + 48);
            LODWORD(v40) = -1;
          }
          else
          {
            LODWORD(v40) = *((_DWORD *)v4 + 18);
          }
          v4[4] = v42;
          if (v4[11])
          {
            if (*(_DWORD *)(v31 + 16))
            {
              v43 = SZGetLoggingHandle();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                v44 = *(_DWORD *)(v4[10] + 16);
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v97 = v44;
                v25 = "Z64: Archive says it's disk number %d; must be 0";
LABEL_97:
                v26 = v43;
                v27 = 8;
                goto LABEL_33;
              }
              goto LABEL_27;
            }
            if (*(_DWORD *)(v31 + 20))
            {
              v43 = SZGetLoggingHandle();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                v50 = *(_DWORD *)(v4[10] + 20);
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v97 = v50;
                v25 = "Z64: Archive says central directory starts on disk disk number %d; must be 0";
                goto LABEL_97;
              }
LABEL_27:
              if (*v4)
                fclose((FILE *)*v4);
              goto LABEL_29;
            }
            if (*(_QWORD *)(v31 + 24) != *(_QWORD *)(v31 + 32))
            {
              v23 = SZGetLoggingHandle();
              if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                goto LABEL_27;
              *(_WORD *)buf = 0;
              v25 = "Z64: Archive must only span a single disk, but this disk does not have all of the central directory records.";
              goto LABEL_32;
            }
            v54 = *(_QWORD *)(v31 + 40);
            v55 = v4[1];
            if (v54 > v55)
            {
              v56 = SZGetLoggingHandle();
              if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                goto LABEL_27;
              v57 = *(_QWORD *)(v4[10] + 40);
              v58 = v4[1];
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)v97 = v57;
              *(_WORD *)&v97[8] = 2048;
              *(_QWORD *)v98 = v58;
              v25 = "Z64: Central directory says it's %ld bytes long, which is longer than file length %ld";
              goto LABEL_102;
            }
            if (*(_QWORD *)(v31 + 48) + v54 > v55)
            {
              v69 = SZGetLoggingHandle();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
              {
                v70 = v4[10];
                v72 = *(_QWORD *)(v70 + 40);
                v71 = *(_QWORD *)(v70 + 48);
                v73 = v4[1];
                *(_DWORD *)buf = 134218496;
                *(_QWORD *)v97 = v72;
                *(_WORD *)&v97[8] = 2048;
                *(_QWORD *)v98 = v71;
                *(_WORD *)&v98[8] = 2048;
                v99 = v73;
                v25 = "Z64: Central directory length (%ld) + offset (%ld) > file length %ld";
                v26 = v69;
                v27 = 32;
                goto LABEL_33;
              }
              goto LABEL_27;
            }
          }
        }
        else
        {
          v4[2] = v18;
          v32 = *((unsigned int *)v4 + 17);
          v40 = *((unsigned int *)v4 + 18);
          v4[4] = v40;
          v4[5] = v32;
        }
        if (*((_WORD *)v4 + 30))
        {
          v43 = SZGetLoggingHandle();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            v74 = *((unsigned __int16 *)v4 + 30);
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v97 = v74;
            v25 = "Archive says it's disk number %hd; must be 0";
            goto LABEL_97;
          }
          goto LABEL_27;
        }
        if (*((_WORD *)v4 + 31))
        {
          v43 = SZGetLoggingHandle();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            v75 = *((unsigned __int16 *)v4 + 31);
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v97 = v75;
            v25 = "Archive says central directory starts on disk disk number %d; must be 0";
            goto LABEL_97;
          }
          goto LABEL_27;
        }
        if (*((unsigned __int16 *)v4 + 32) == v18)
        {
          v76 = v4[1];
          if (v76 >= v32)
          {
            if (v32 + (unint64_t)v40 <= v76)
              return v4;
            v79 = SZGetLoggingHandle();
            if (!os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
              goto LABEL_27;
            v80 = *((_DWORD *)v4 + 17);
            v81 = *((_DWORD *)v4 + 18);
            v82 = v4[1];
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)v97 = v80;
            *(_WORD *)&v97[4] = 1024;
            *(_DWORD *)&v97[6] = v81;
            *(_WORD *)v98 = 2048;
            *(_QWORD *)&v98[2] = v82;
            v25 = "Central directory length (%u) + offset (%u) > file length %ld";
            v26 = v79;
            v27 = 24;
            goto LABEL_33;
          }
          v56 = SZGetLoggingHandle();
          if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            goto LABEL_27;
          v77 = *((unsigned int *)v4 + 17);
          v78 = v4[1];
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)v97 = v77;
          *(_WORD *)&v97[8] = 2048;
          *(_QWORD *)v98 = v78;
          v25 = "Central directory says it's %ld bytes long, which is longer than file length %ld";
LABEL_102:
          v26 = v56;
          v27 = 22;
          goto LABEL_33;
        }
        v23 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        *(_WORD *)buf = 0;
        v25 = "Archive must only span a single disk, but this disk does not have all of the central directory records.";
LABEL_32:
        v26 = v23;
        v27 = 2;
LABEL_33:
        _os_log_error_impl(&dword_1D4E55000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
        goto LABEL_27;
      }
    }
    v19 = (FILE *)*v4;
    if (fseeko((FILE *)*v4, -42, 2))
    {
      v20 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
LABEL_21:
        v21 = 0;
        v22 = 0;
LABEL_22:
        free(v22);
        free(v21);
        v15 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          goto LABEL_26;
        *(_WORD *)buf = 0;
        v11 = "Failed to read Zip64 end records";
        goto LABEL_24;
      }
      v48 = __error();
      v49 = strerror(*v48);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v97 = v49;
      v37 = "Failed to seek to zip64 end record locator: %s";
LABEL_63:
      _os_log_error_impl(&dword_1D4E55000, v20, OS_LOG_TYPE_ERROR, v37, buf, 0xCu);
      goto LABEL_21;
    }
    v28 = (off_t *)malloc_type_calloc(1uLL, 0x14uLL, 0x1000040A86A77D5uLL);
    if (!v28)
    {
      v20 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      v35 = __error();
      v36 = strerror(*v35);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v97 = v36;
      v37 = "Failed to allocate zip64 end record locator: %s";
      goto LABEL_63;
    }
    v22 = v28;
    v29 = fread(v28, 1uLL, 0x14uLL, v19);
    if (v29 != 20)
    {
      v38 = v29;
      v39 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        goto LABEL_46;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v97 = 20;
      *(_WORD *)&v97[8] = 2048;
      *(_QWORD *)v98 = v38;
      v47 = "Failed to read zip64 end record locator: expected to read %lu but actually read %lu";
LABEL_79:
      v60 = v39;
      v61 = 22;
      goto LABEL_80;
    }
    if (*(_DWORD *)v22 != 117853008)
    {
      v30 = SZGetLoggingHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D4E55000, v30, OS_LOG_TYPE_ERROR, "Failed to locate zip64 end record locator; what we found doesn't have the right signature.",
          buf,
          2u);
      }
      goto LABEL_39;
    }
    if (*((_DWORD *)v22 + 1))
    {
      v45 = SZGetLoggingHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v46 = *((_DWORD *)v22 + 1);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v97 = v46;
        v47 = "Expected for end record to be on disk 0, but zip64 end record locator claimed disk %d";
LABEL_77:
        v60 = v45;
        v61 = 8;
LABEL_80:
        _os_log_error_impl(&dword_1D4E55000, v60, OS_LOG_TYPE_ERROR, v47, buf, v61);
        goto LABEL_46;
      }
      goto LABEL_46;
    }
    if (*((_DWORD *)v22 + 4) != 1)
    {
      v45 = SZGetLoggingHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v59 = *((_DWORD *)v22 + 4);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v97 = v59;
        v47 = "Expected total disks to be 1, but zip64 end record locator claimed %d disks";
        goto LABEL_77;
      }
LABEL_46:
      v21 = 0;
      goto LABEL_22;
    }
    if (fseeko(v19, v22[1], 0))
    {
      v39 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        goto LABEL_46;
      v51 = v22[1];
      v52 = __error();
      v53 = strerror(*v52);
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)v97 = v51;
      *(_WORD *)&v97[8] = 2080;
      *(_QWORD *)v98 = v53;
      v47 = "Failed to seek to zip64 end record at %lld: %s";
      goto LABEL_79;
    }
    __stream = v19;
    v62 = malloc_type_calloc(1uLL, 0x38uLL, 0x100004021716A34uLL);
    if (v62)
    {
      v21 = v62;
      v63 = fread(v62, 1uLL, 0x38uLL, __stream);
      if (v63 != 56)
      {
        v86 = v63;
        v87 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
          goto LABEL_22;
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)v97 = 56;
        *(_WORD *)&v97[8] = 2048;
        *(_QWORD *)v98 = v86;
        v66 = "Failed to read zip64 end record: expected to read %lu but actually read %lu";
        v67 = v87;
        goto LABEL_113;
      }
      if (*v21 != 101075792)
      {
        v64 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          goto LABEL_22;
        v65 = v22[1];
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v97 = v65;
        v66 = "Failed to locate zip64 end record; what we found at offset %lld doesn't have the right signature.";
        v67 = v64;
        v68 = 12;
LABEL_114:
        _os_log_error_impl(&dword_1D4E55000, v67, OS_LOG_TYPE_ERROR, v66, buf, v68);
        goto LABEL_22;
      }
      v88 = *(_QWORD *)(v21 + 1);
      v89 = v88 + 12;
      if ((unint64_t)(v88 + 12) < 0x39)
      {
        if (v88 != 44)
        {
          v94 = SZGetLoggingHandle();
          if (!os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
            goto LABEL_22;
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)v97 = v89;
          *(_WORD *)&v97[8] = 2048;
          *(_QWORD *)v98 = 56;
          v66 = "Zip64 end record said it was %zu bytes; we expect at least %zu bytes";
LABEL_124:
          v67 = v94;
LABEL_113:
          v68 = 22;
          goto LABEL_114;
        }
LABEL_121:
        v4[10] = v21;
        v4[11] = v22;
        v22 = 0;
LABEL_39:
        free(v22);
        v18 = *((unsigned __int16 *)v4 + 33);
        goto LABEL_40;
      }
      v90 = reallocf(v21, v88 + 12);
      if (v90)
      {
        v21 = v90;
        v91 = v88 - 44;
        v92 = fread(v90 + 14, 1uLL, v88 - 44, __stream);
        if (v88 - 44 != v92)
        {
          v93 = v92;
          v94 = SZGetLoggingHandle();
          if (!os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
            goto LABEL_22;
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)v97 = v91;
          *(_WORD *)&v97[8] = 2048;
          *(_QWORD *)v98 = v93;
          v66 = "Failed to read extensible data in zip64 end record: expected to read %lu but actually read %lu";
          goto LABEL_124;
        }
        goto LABEL_121;
      }
      v83 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        goto LABEL_46;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v97 = v88 + 12;
      v47 = "Failed to grow zip64 end record allocation to %zu bytes";
    }
    else
    {
      v83 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        goto LABEL_46;
      v84 = __error();
      v85 = strerror(*v84);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v97 = v85;
      v47 = "Failed to allocate zip64 end record: %s";
    }
    v60 = v83;
    v61 = 12;
    goto LABEL_80;
  }
LABEL_29:
  free(v4);
  return 0;
}

void CloseZipFile(uint64_t a1)
{
  if (a1)
  {
    free(*(void **)(a1 + 80));
    free(*(void **)(a1 + 88));
    fclose(*(FILE **)a1);
    free((void *)a1);
  }
}

uint64_t GenericHashInit(uint64_t result, int a2)
{
  *(_DWORD *)(result + 212) = 0;
  *(_OWORD *)(result + 196) = 0u;
  *(_OWORD *)(result + 180) = 0u;
  *(_OWORD *)(result + 164) = 0u;
  *(_OWORD *)(result + 148) = 0u;
  *(_OWORD *)(result + 132) = 0u;
  *(_OWORD *)(result + 116) = 0u;
  *(_OWORD *)(result + 100) = 0u;
  *(_OWORD *)(result + 84) = 0u;
  *(_OWORD *)(result + 68) = 0u;
  *(_OWORD *)(result + 52) = 0u;
  *(_OWORD *)(result + 36) = 0u;
  *(_OWORD *)(result + 20) = 0u;
  *(_OWORD *)(result + 4) = 0u;
  *(_DWORD *)result = a2;
  switch(a2)
  {
    case 0:
      result = CC_MD5_Init((CC_MD5_CTX *)(result + 8));
      break;
    case 1:
      result = CC_SHA1_Init((CC_SHA1_CTX *)(result + 8));
      break;
    case 4:
      result = CC_SHA224_Init((CC_SHA256_CTX *)(result + 8));
      break;
    case 5:
      result = CC_SHA256_Init((CC_SHA256_CTX *)(result + 8));
      break;
    case 6:
      result = CC_SHA384_Init((CC_SHA512_CTX *)(result + 8));
      break;
    case 7:
      result = CC_SHA512_Init((CC_SHA512_CTX *)(result + 8));
      break;
    default:
      return result;
  }
  return result;
}

uint64_t GenericHashUpdate(uint64_t result, void *data, unint64_t a3)
{
  unint64_t v3;
  _DWORD *v5;
  CC_MD5_CTX *v6;
  uint64_t v7;

  if (a3)
  {
    v3 = a3;
    v5 = (_DWORD *)result;
    v6 = (CC_MD5_CTX *)(result + 8);
    do
    {
      if (v3 >= 0xFFFFFFFF)
        v7 = 0xFFFFFFFFLL;
      else
        v7 = v3;
      switch(*v5)
      {
        case 0:
          result = CC_MD5_Update(v6, data, v7);
          break;
        case 1:
          result = CC_SHA1_Update((CC_SHA1_CTX *)v6, data, v7);
          break;
        case 4:
          result = CC_SHA224_Update((CC_SHA256_CTX *)v6, data, v7);
          break;
        case 5:
          result = CC_SHA256_Update((CC_SHA256_CTX *)v6, data, v7);
          break;
        case 6:
          result = CC_SHA384_Update((CC_SHA512_CTX *)v6, data, v7);
          break;
        case 7:
          result = CC_SHA512_Update((CC_SHA512_CTX *)v6, data, v7);
          break;
        default:
          break;
      }
      v3 -= v7;
    }
    while (v3);
  }
  return result;
}

unsigned __int8 *GenericHashFinal(unsigned __int8 *result, uint64_t a2)
{
  switch(*(_DWORD *)a2)
  {
    case 0:
      result = (unsigned __int8 *)CC_MD5_Final(result, (CC_MD5_CTX *)(a2 + 8));
      break;
    case 1:
      result = (unsigned __int8 *)CC_SHA1_Final(result, (CC_SHA1_CTX *)(a2 + 8));
      break;
    case 4:
      result = (unsigned __int8 *)CC_SHA224_Final(result, (CC_SHA256_CTX *)(a2 + 8));
      break;
    case 5:
      result = (unsigned __int8 *)CC_SHA256_Final(result, (CC_SHA256_CTX *)(a2 + 8));
      break;
    case 6:
      result = (unsigned __int8 *)CC_SHA384_Final(result, (CC_SHA512_CTX *)(a2 + 8));
      break;
    case 7:
      result = (unsigned __int8 *)CC_SHA512_Final(result, (CC_SHA512_CTX *)(a2 + 8));
      break;
    default:
      return result;
  }
  return result;
}

char *CreateLocalFileRecord(uint64_t a1)
{
  char *v2;
  size_t v3;
  unint64_t v4;
  unsigned __int16 *ExtraFieldWithSignature;
  unsigned __int16 v6;
  char *v7;
  uint64_t v8;

  if (*(_DWORD *)(a1 + 20) == -1 || *(_DWORD *)(a1 + 24) == -1)
    __assert_rtn("CreateLocalFileRecord", "ZipStructure.c", 40, "UREAD(cdRecord->thirty_two_bit_compressed_size) < UINT32_MAX && UREAD(cdRecord->thirty_two_bit_uncompressed_size) < UINT32_MAX");
  v2 = (char *)malloc_type_calloc(1uLL, *(unsigned __int16 *)(a1 + 28) + 46, 0x73FD3DE5uLL);
  *(_DWORD *)v2 = 67324752;
  *((_WORD *)v2 + 2) = *(_WORD *)(a1 + 6);
  *((_WORD *)v2 + 3) = *(_WORD *)(a1 + 8);
  *((_WORD *)v2 + 4) = *(_WORD *)(a1 + 10);
  *(_DWORD *)(v2 + 10) = *(_DWORD *)(a1 + 12);
  *(_DWORD *)(v2 + 14) = *(_DWORD *)(a1 + 16);
  *(_DWORD *)(v2 + 18) = *(_DWORD *)(a1 + 20);
  *(_DWORD *)(v2 + 22) = *(_DWORD *)(a1 + 24);
  v3 = *(unsigned __int16 *)(a1 + 28);
  *(_DWORD *)(v2 + 26) = (unsigned __int16)v3;
  memcpy(v2 + 30, (const void *)(a1 + 46), v3);
  v4 = *(unsigned __int16 *)(a1 + 30);
  if (v4 >= 0xC)
  {
    ExtraFieldWithSignature = GetExtraFieldWithSignature(a1 + 46 + *(unsigned __int16 *)(a1 + 28), v4, &kInfoZipExtraFieldSignature);
    if (ExtraFieldWithSignature)
    {
      if (ExtraFieldWithSignature[1] >= 8u)
      {
        v6 = *ExtraFieldWithSignature;
        v7 = &v2[v3];
        v8 = *(_QWORD *)(ExtraFieldWithSignature + 2);
        *((_WORD *)v2 + 14) = 16;
        *((_WORD *)v7 + 15) = v6;
        *((_WORD *)v7 + 16) = 12;
        *(_QWORD *)(v7 + 34) = v8;
        *(_DWORD *)(v7 + 42) = 32834037;
      }
    }
  }
  return v2;
}

unsigned __int16 *GetInfoZipExtraFieldFromLF(uint64_t a1)
{
  unsigned __int16 *result;

  if (!*(_WORD *)(a1 + 28))
    return 0;
  result = GetExtraFieldWithSignature(a1 + *(unsigned __int16 *)(a1 + 26) + 30, *(unsigned __int16 *)(a1 + 28), &kInfoZipExtraFieldSignature);
  if (result)
  {
    if (result[1] < 8u)
      return 0;
  }
  return result;
}

BOOL LocalFileRecordHasZip64ExtraField(uint64_t a1)
{
  unsigned __int16 *ExtraFieldWithSignature;

  return *(_WORD *)(a1 + 28)
      && ((ExtraFieldWithSignature = GetExtraFieldWithSignature(a1 + *(unsigned __int16 *)(a1 + 26) + 30, *(unsigned __int16 *)(a1 + 28), &kZip64ExtraFieldSignature)) == 0|| ExtraFieldWithSignature[1] >= 0x10u)&& ExtraFieldWithSignature != 0;
}

unsigned __int16 *GetZip64ExtraFieldDataFromLF(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  unsigned __int16 *result;

  if (!*(_WORD *)(a1 + 28))
    return 0;
  result = GetExtraFieldWithSignature(a1 + *(unsigned __int16 *)(a1 + 26) + 30, *(unsigned __int16 *)(a1 + 28), &kZip64ExtraFieldSignature);
  if (!result)
    return result;
  if (result[1] != 16)
    return 0;
  if (a2)
    *a2 = *(_QWORD *)(result + 2);
  if (a3)
    *a3 = *(_QWORD *)(result + 6);
  return (unsigned __int16 *)1;
}

uint64_t GetLFUncompressedSize(uint64_t a1)
{
  unsigned int v2;
  uint64_t v4;

  v4 = 0;
  if (*(_DWORD *)(a1 + 18) == -1 || (v2 = *(_DWORD *)(a1 + 22), v2 == -1))
  {
    if (GetZip64ExtraFieldDataFromLF(a1, &v4, 0))
      return v4;
    return *(unsigned int *)(a1 + 22);
  }
  return v2;
}

_DWORD *CreateCDRecord(const char *a1, int a2, int a3, int a4)
{
  size_t v8;
  _DWORD *v9;
  size_t v10;
  time_t v11;
  _DWORD *v12;

  v8 = strlen(a1);
  if (v8 >> 16)
    return 0;
  v10 = v8;
  v9 = malloc_type_calloc(1uLL, v8 + 58, 0x370EF2B9uLL);
  *(_QWORD *)v9 = 0x14031E02014B50;
  v11 = time(0);
  v9[3] = UNIX2DOSTime(v11);
  *((_WORD *)v9 + 14) = v10;
  *((_WORD *)v9 + 15) = 12;
  *(_DWORD *)((char *)v9 + 38) = (a2 << 16) | 0x4000;
  memcpy((char *)v9 + 46, a1, v10);
  v12 = (_DWORD *)((char *)v9 + v10 + 46);
  *v12 = 546901;
  v12[1] = a4;
  v12[2] = a3;
  return v9;
}

void ZipStreamAddStatisticsForCDRecord(uint64_t a1, int a2, _QWORD *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 40);
  if (a3[17] < v6)
    a3[17] = v6;
  v7 = *(_QWORD *)(a1 + 32);
  if (a3[18] < v7)
    a3[18] = v7;
  v8 = a3[2] + v7;
  a3[1] += v6;
  a3[2] = v8;
  v9 = (v6 + 4095) & 0xFFFFFFFFFFFFF000 | 0x800;
  if (*(_BYTE *)(a1 + 26))
    v10 = 1024;
  else
    v10 = v9;
  v11 = SZGetLoggingHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v15 = *(_QWORD *)(a1 + 72);
    v18 = 134218242;
    v19 = v10;
    v20 = 2080;
    v21 = v15;
    _os_log_debug_impl(&dword_1D4E55000, v11, OS_LOG_TYPE_DEBUG, "Counting size %llu for %s", (uint8_t *)&v18, 0x16u);
  }
  *a3 += v10;
  ++a3[4];
  if (*(_BYTE *)(a1 + 26))
  {
    v12 = a3 + 19;
LABEL_12:
    ++*v12;
    goto LABEL_16;
  }
  v13 = 20;
  if ((*(_WORD *)(a1 + 24) & 0xF000) == 0xA000)
    v13 = 21;
  ++a3[v13];
  if (!*(_QWORD *)(a1 + 40))
  {
    v12 = a3 + 22;
    goto LABEL_12;
  }
LABEL_16:
  if (a2)
  {
    v14 = SZGetLoggingHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v16 = *(_QWORD *)(a1 + 72);
      v17 = *(unsigned __int16 *)(a1 + 24);
      v18 = 136315394;
      v19 = v16;
      v20 = 1024;
      LODWORD(v21) = v17;
      _os_log_debug_impl(&dword_1D4E55000, v14, OS_LOG_TYPE_DEBUG, "File %s has non-standard mode %o", (uint8_t *)&v18, 0x12u);
    }
    ++a3[14];
  }
}

uint64_t ZipStreamWriteLocalFile(uint64_t a1, uint64_t *a2, void ***a3, Bytef *a4, int a5, unsigned int a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  Bytef *v14;
  void **v15;
  _OWORD *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  uint64_t v21;
  unsigned __int16 *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  void *v29;
  uLong v30;
  int v31;
  int v32;
  int v34;
  unint64_t v35;
  uint64_t v36;
  int v37;
  NSObject *v38;
  const char *v39;
  int v40;
  unsigned int v41;
  Bytef *v42;
  __int16 v43;
  int v44;
  NSObject *v45;
  int64x2_t v46;
  uint64_t v47;
  void (*v48)(_QWORD, _QWORD, _QWORD);
  char *v49;
  char *v50;
  unint64_t v51;
  unsigned __int16 *v52;
  compression_stream *v53;
  int v54;
  compression_algorithm v55;
  uint8_t *v56;
  uint64_t v57;
  unint64_t v58;
  compression_stream *v59;
  int v60;
  compression_stream *v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  unint64_t v66;
  int v67;
  NSObject *v68;
  char *v69;
  const char *v70;
  const char *v71;
  _BOOL4 HasZip64ExtraField;
  int v73;
  uint64_t v74;
  compression_status v75;
  compression_status v76;
  NSObject *v77;
  int v78;
  Bytef *v79;
  unint64_t v80;
  int LocalFileData;
  const Bytef *v82;
  uint64_t v83;
  uint64_t v84;
  compression_stream *v85;
  unint64_t v86;
  Bytef *v87;
  uint64_t v88;
  NSObject *v89;
  compression_status v90;
  NSObject *v91;
  size_t v92;
  size_t v93;
  const uint8_t *src_ptr;
  size_t src_size;
  uint8_t *dst_ptr;
  size_t dst_size;
  const uint8_t *v98;
  size_t v99;
  uint8_t *v100;
  size_t v101;
  uint64_t v102;
  void (*v103)(uint64_t, _QWORD, unint64_t, unint64_t, _QWORD);
  compression_stream *v104;
  NSObject *v105;
  compression_status v106;
  NSObject *v107;
  const char *v108;
  NSObject *v109;
  uint32_t v110;
  int v111;
  NSObject *v112;
  NSObject *v113;
  uint64_t v114;
  uint64_t v115;
  int *v116;
  uint64_t v117;
  void (*v118)(uint64_t, _QWORD, _QWORD, unint64_t, _QWORD);
  int v119;
  char *v120;
  int v121;
  char *v122;
  uint64_t v123;
  int v124;
  char *v125;
  uint8_t *v126;
  int v127;
  char *v128;
  NSObject *v129;
  uint32_t v130;
  const char *v131;
  NSObject *v132;
  uint32_t v133;
  unint64_t v134;
  NSObject *v135;
  compression_status v136;
  NSObject *v137;
  size_t v138;
  size_t v139;
  const uint8_t *v140;
  size_t v141;
  uint8_t *v142;
  size_t v143;
  const uint8_t *v144;
  size_t v145;
  uint8_t *v146;
  size_t v147;
  NSObject *v148;
  NSObject *v149;
  NSObject *v151;
  uint64_t v152;
  char *v153;
  uint64_t v154;
  int v155;
  char *v156;
  int v157;
  int v158;
  NSObject *v159;
  NSObject *v160;
  uint64_t v161;
  NSObject *v162;
  int v163;
  NSObject *v164;
  uint64_t v165;
  uint64_t v166;
  unint64_t v167;
  int v168;
  NSObject *v169;
  _BOOL4 v170;
  int64x2_t v171;
  uint64_t v172;
  const char *v173;
  NSObject *v174;
  uint32_t v175;
  char *v176;
  NSObject *v177;
  int v178;
  NSObject *v179;
  char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void ***v185;
  Bytef *v186;
  char *v187;
  unsigned __int16 *v188;
  void ***v189;
  uint64_t v190;
  uint64_t v191;
  int v192;
  uint64_t v193;
  uint64_t v194;
  unint64_t v195;
  uint64_t *stream;
  int v197;
  unint64_t v198;
  int v199;
  int v200;
  Bytef *buf;
  unint64_t v202;
  uint64_t v203;
  int v205;
  unsigned int v206;
  unint64_t v207;
  Bytef *v209;
  unint64_t v210;
  unint64_t v212;
  int v213;
  uint8_t *v214;
  compression_stream *v215;
  int v216;
  _BYTE v217[12];
  _BYTE v218[48];
  uint64_t v219;

  v219 = *MEMORY[0x1E0C80C00];
  v14 = (Bytef *)malloc_type_malloc(0x20000uLL, 0x287FA4E0uLL);
  v15 = *a3;
  v16 = malloc_type_calloc(1uLL, 0x50uLL, 0x1010040BDAC2CBCuLL);
  *v16 = *(_OWORD *)v15;
  v17 = *((_OWORD *)v15 + 4);
  v19 = *((_OWORD *)v15 + 1);
  v18 = *((_OWORD *)v15 + 2);
  v16[3] = *((_OWORD *)v15 + 3);
  v16[4] = v17;
  v16[1] = v19;
  v16[2] = v18;
  *((_QWORD *)v16 + 7) = strdup((const char *)v15[7]);
  v20 = malloc_type_malloc(*((unsigned __int16 *)v15 + 32), 0xE466B180uLL);
  *((_QWORD *)v16 + 9) = v20;
  memcpy(v20, v15[9], *((unsigned __int16 *)v15 + 32));
  v21 = *a2;
  v22 = (unsigned __int16 *)malloc_type_calloc(1uLL, 0x68uLL, 0x1010040E435E96EuLL);
  v24 = *(_OWORD *)(v21 + 16);
  v23 = *(_OWORD *)(v21 + 32);
  *(_OWORD *)v22 = *(_OWORD *)v21;
  *((_OWORD *)v22 + 1) = v24;
  *((_OWORD *)v22 + 2) = v23;
  v26 = *(_OWORD *)(v21 + 64);
  v25 = *(_OWORD *)(v21 + 80);
  v27 = *(_OWORD *)(v21 + 48);
  *((_QWORD *)v22 + 12) = *(_QWORD *)(v21 + 96);
  *((_OWORD *)v22 + 4) = v26;
  *((_OWORD *)v22 + 5) = v25;
  *((_OWORD *)v22 + 3) = v27;
  *((_QWORD *)v22 + 9) = strdup(*(const char **)(v21 + 72));
  v28 = malloc_type_malloc(*(unsigned __int16 *)(v21 + 48), 0x1548507uLL);
  *((_QWORD *)v22 + 10) = v28;
  memcpy(v28, *(const void **)(v21 + 80), *(unsigned __int16 *)(v21 + 48));
  v29 = malloc_type_malloc(*(unsigned __int16 *)(v21 + 88), 0xAD38FBFDuLL);
  *((_QWORD *)v22 + 12) = v29;
  memcpy(v29, *(const void **)(v21 + 96), *(unsigned __int16 *)(v21 + 88));
  v207 = *((_QWORD *)v16 + 5);
  v212 = *((_QWORD *)v16 + 6);
  v205 = *((unsigned __int16 *)v16 + 2);
  v213 = *((_DWORD *)v16 + 8);
  v30 = crc32(0, 0, 0);
  v203 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a9 + 8) + 72))(*(_QWORD *)(*(_QWORD *)(a9 + 8) + 80));
  if (v203 < 0)
  {
    v37 = *__error();
    v38 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
LABEL_57:
      v56 = 0;
      v50 = 0;
      v57 = 0;
      goto LABEL_201;
    }
    *(_DWORD *)v218 = 136315138;
    *(_QWORD *)&v218[4] = strerror(v37);
    v39 = "Failed to get offset before writing LF record: %s";
LABEL_169:
    _os_log_error_impl(&dword_1D4E55000, v38, OS_LOG_TYPE_ERROR, v39, v218, 0xCu);
    goto LABEL_57;
  }
  v209 = a4;
  if (!a5)
  {
    if (v205 == 8 || v205 == 99 || v205 == 14)
    {
      if (*(_DWORD *)(a9 + 32) == 2)
      {
        a5 = 3;
      }
      else
      {
        a5 = 1;
        if (*(_BYTE *)(a9 + 45) && v207 > v212)
        {
          v45 = SZGetLoggingHandle();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            v154 = *((_QWORD *)v22 + 9);
            *(_DWORD *)v218 = 136315394;
            *(_QWORD *)&v218[4] = v154;
            *(_WORD *)&v218[12] = 2048;
            *(_QWORD *)&v218[14] = v207 - v212;
            _os_log_debug_impl(&dword_1D4E55000, v45, OS_LOG_TYPE_DEBUG, "%s is %llu bytes larger compressed than uncompressed; converting.",
              v218,
              0x16u);
          }
          v46 = vdupq_n_s64(1uLL);
          v46.i64[0] = v207 - v212;
          *(int64x2_t *)(a8 + 40) = vaddq_s64(v46, *(int64x2_t *)(a8 + 40));
          a5 = 2;
        }
      }
    }
    else
    {
      v71 = (const char *)*((_QWORD *)v22 + 9);
      a5 = 2;
      if (strcmp(v71, "mimetype"))
      {
        if (!strcmp(v71, "META-INF/com.apple.FixedZipMetadata.bin"))
          a5 = 2;
        else
          a5 = 3;
      }
    }
  }
  if (v212)
    v31 = a5;
  else
    v31 = 2;
  v32 = *(_DWORD *)(a9 + 32);
  if (v31 != 2 && v32 == 3)
    v31 = 4;
  if (v32)
    v34 = v31;
  else
    v34 = 2;
  v206 = v34 - 3;
  if ((v34 - 3) < 2)
  {
    *((_WORD *)v16 + 2) = *(_DWORD *)(a9 + 36);
    v35 = v212;
    v36 = a1;
  }
  else
  {
    v35 = v207;
    v36 = a1;
    if (v34 != 1)
    {
      if (v34 != 2)
        __assert_rtn("ZipStreamWriteLocalFile", "ZipStream.c", 333, "false");
      *((_WORD *)v16 + 2) = 0;
      *((_QWORD *)v16 + 5) = v212;
      v35 = v212;
    }
  }
  v40 = v22[12];
  if (*((_BYTE *)v22 + 26))
    v41 = a7;
  else
    v41 = a6;
  v42 = v209;
  if (v40 == v41)
  {
    v197 = 0;
    if (!v35)
      goto LABEL_35;
  }
  else
  {
    *((_WORD *)v16 + 14) = v40;
    v197 = 1;
    if (!v35)
    {
LABEL_35:
      v199 = 0;
      *((_WORD *)v16 + 1) &= ~8u;
      v22[2] &= ~8u;
      goto LABEL_45;
    }
  }
  if (v213 && v206 > 1)
    goto LABEL_35;
  v43 = *((_WORD *)v16 + 1);
  if (*(_BYTE *)(a9 + 47))
  {
    *((_WORD *)v16 + 1) = v43 | 8;
    v22[2] |= 8u;
    v44 = 1;
  }
  else
  {
    *((_WORD *)v16 + 1) = v43 & 0xFFF7;
    v22[2] &= ~8u;
    v44 = 2;
  }
  v199 = v44;
LABEL_45:
  v200 = v34;
  v47 = *(_QWORD *)(a9 + 8);
  v48 = *(void (**)(_QWORD, _QWORD, _QWORD))(v47 + 24);
  v210 = v35;
  if (v48)
  {
    v48(0, *((_QWORD *)v16 + 7), 0);
    v47 = *(_QWORD *)(a9 + 8);
  }
  v49 = CreateAndWriteLocalFileRecord((uint64_t)v16, v47);
  if (!v49)
  {
    v38 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      goto LABEL_57;
    v123 = *((_QWORD *)v22 + 9);
    *(_DWORD *)v218 = 136315138;
    *(_QWORD *)&v218[4] = v123;
    v39 = "Failed to write local file record for file %s to output file";
    goto LABEL_169;
  }
  v50 = v49;
  v193 = *((unsigned __int16 *)v49 + 14);
  v51 = v210;
  v194 = *((unsigned __int16 *)v49 + 13);
  if (!v210)
  {
    v189 = (void ***)a2;
    v190 = a8;
    v58 = 0;
    v56 = 0;
    v59 = 0;
    v60 = v200;
    goto LABEL_59;
  }
  v216 = 0;
  if (v209)
  {
    v52 = 0;
  }
  else
  {
    v52 = OpenLocalFile(v36, *a2, (char *)(*a3)[7], *((_WORD *)*a3 + 32), v200 == 1, &v216);
    if (v216)
    {
      v62 = SZGetLoggingHandle();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        v152 = *((_QWORD *)v22 + 9);
        *(_DWORD *)v218 = 136315138;
        *(_QWORD *)&v218[4] = v152;
        _os_log_error_impl(&dword_1D4E55000, v62, OS_LOG_TYPE_ERROR, "Failed to open local file %s", v218, 0xCu);
      }
      v56 = 0;
      v59 = 0;
      goto LABEL_197;
    }
    v51 = v210;
  }
  v185 = a3;
  stream = (uint64_t *)v52;
  if (v206 > 1)
  {
    v189 = (void ***)a2;
    v190 = a8;
    v187 = v50;
    v188 = v22;
    v56 = 0;
    v61 = 0;
  }
  else
  {
    v53 = (compression_stream *)malloc_type_calloc(1uLL, 0x28uLL, 0x10D00405C4BD7A1uLL);
    v54 = *(_DWORD *)(a9 + 36);
    switch(v54)
    {
      case 8:
        v55 = COMPRESSION_ZLIB;
        break;
      case 14:
        v55 = COMPRESSION_LZMA;
        break;
      case 99:
        v55 = COMPRESSION_LZFSE;
        break;
      default:
        v55 = 0;
        break;
    }
    v61 = v53;
    v75 = compression_stream_init(v53, COMPRESSION_STREAM_ENCODE, v55);
    if (v75)
    {
      v76 = v75;
      v77 = SZGetLoggingHandle();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v218 = 67109120;
        *(_DWORD *)&v218[4] = v76;
        _os_log_error_impl(&dword_1D4E55000, v77, OS_LOG_TYPE_ERROR, "Failed to initialize compression stream: %d", v218, 8u);
      }
      v56 = 0;
      v57 = 0;
      v59 = v61;
      goto LABEL_155;
    }
    v189 = (void ***)a2;
    v190 = a8;
    v187 = v50;
    v188 = v22;
    v56 = (uint8_t *)malloc_type_malloc(0x20000uLL, 0x692F4A98uLL);
    v51 = v210;
  }
  v78 = 0;
  v58 = 0;
  if (v209)
    v79 = v209;
  else
    v79 = v14;
  buf = v79;
  v202 = 0;
  v214 = v56;
  v186 = v14;
  v215 = v61;
  while (1)
  {
    *(_QWORD *)v217 = 0;
    if (v42)
    {
      if (v51 - v202 >= 0x20000)
        v80 = 0x20000;
      else
        v80 = v51 - v202;
      if (v80 + v202 >= v51)
        v78 = 2;
      v195 = v80;
    }
    else
    {
      LocalFileData = ReadLocalFileData(stream, buf, 0x20000uLL, (size_t *)v217);
      v78 = LocalFileData;
      if ((LocalFileData & 5) != 0)
      {
        v216 = LocalFileData;
        v151 = SZGetLoggingHandle();
        v50 = v187;
        v22 = v188;
        if (!os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
          goto LABEL_154;
        *(_DWORD *)v218 = 67109120;
        *(_DWORD *)&v218[4] = v78;
        v131 = "ReadLocalFileData returned %d";
        v132 = v151;
        v133 = 8;
        goto LABEL_180;
      }
      v195 = 0;
      v80 = *(_QWORD *)v217;
    }
    v198 = v80;
    if (!v213 && v80)
    {
      v82 = buf;
      do
      {
        if (v80 >= 0x7FFFFFFF)
          v83 = 0x7FFFFFFFLL;
        else
          v83 = v80;
        v30 = crc32(v30, v82, v83);
        v82 += v83;
        v80 -= v83;
      }
      while (v80);
    }
    if (v198)
    {
      v192 = v78;
      v202 += v198;
      v84 = *(_QWORD *)(a9 + 8);
      v56 = v214;
      v85 = v215;
      if (v215)
      {
        v86 = v198;
        v87 = buf;
LABEL_122:
        v88 = 0x7FFFFFFFFFFFFFFFLL;
        if (v86 < 0x7FFFFFFFFFFFFFFFLL)
          v88 = v86;
        v85->src_ptr = v87;
        v85->src_size = v88;
        v191 = v88;
        while (1)
        {
          v85->dst_ptr = v56;
          v85->dst_size = 0x20000;
          v89 = SZGetLoggingHandle();
          if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
          {
            src_ptr = v85->src_ptr;
            src_size = v85->src_size;
            dst_ptr = v85->dst_ptr;
            dst_size = v85->dst_size;
            *(_DWORD *)v218 = 134218752;
            *(_QWORD *)&v218[4] = src_ptr;
            *(_WORD *)&v218[12] = 2048;
            *(_QWORD *)&v218[14] = src_size;
            *(_WORD *)&v218[22] = 2048;
            *(_QWORD *)&v218[24] = dst_ptr;
            *(_WORD *)&v218[32] = 2048;
            *(_QWORD *)&v218[34] = dst_size;
            _os_log_debug_impl(&dword_1D4E55000, v89, OS_LOG_TYPE_DEBUG, "Calling compression_stream_process with src_ptr: %p, src_size: %zu, dst_ptr: %p, dst_size: %zu", v218, 0x2Au);
          }
          v90 = compression_stream_process(v85, 0);
          if (v90)
          {
            v106 = v90;
            v216 = v192;
            v107 = SZGetLoggingHandle();
            v14 = v186;
            if (!os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
              goto LABEL_153;
            *(_DWORD *)v218 = 67109120;
            *(_DWORD *)&v218[4] = v106;
            v108 = "compression_stream_process returned error %d";
            v109 = v107;
            v110 = 8;
            goto LABEL_206;
          }
          v91 = SZGetLoggingHandle();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
          {
            v98 = v215->src_ptr;
            v99 = v215->src_size;
            v100 = v215->dst_ptr;
            v101 = v215->dst_size;
            *(_QWORD *)v218 = 67110144;
            *(_WORD *)&v218[8] = 2048;
            *(_QWORD *)&v218[10] = v98;
            *(_WORD *)&v218[18] = 2048;
            *(_QWORD *)&v218[20] = v99;
            *(_WORD *)&v218[28] = 2048;
            *(_QWORD *)&v218[30] = v100;
            *(_WORD *)&v218[38] = 2048;
            *(_QWORD *)&v218[40] = v101;
            _os_log_debug_impl(&dword_1D4E55000, v91, OS_LOG_TYPE_DEBUG, "After process ret %d: src_ptr: %p, src_size: %zu, dst_ptr: %p, dst_size: %zu", v218, 0x30u);
          }
          v85 = v215;
          v92 = v215->dst_size;
          v93 = 0x20000 - v92;
          if (v92 == 0x20000)
          {
            v58 += v93;
            v56 = v214;
LABEL_135:
            v87 += v191;
            v86 -= v191;
            if (v86)
              goto LABEL_122;
            v14 = v186;
            v42 = v209;
            goto LABEL_140;
          }
          if (v93 != (*(uint64_t (**)(_QWORD, uint8_t *, size_t))(v84 + 48))(*(_QWORD *)(v84 + 80), v214, v93))break;
          v85 = v215;
          v58 += v93;
          v56 = v214;
          if (v215->dst_size)
            goto LABEL_135;
        }
        v216 = v192;
        v111 = *__error();
        v112 = SZGetLoggingHandle();
        v14 = v186;
        if (!os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
          goto LABEL_153;
        v153 = strerror(v111);
        *(_DWORD *)v218 = 136315138;
        *(_QWORD *)&v218[4] = v153;
        v108 = "fwrite failed to write out entire compressed buffer: %s";
        goto LABEL_205;
      }
      v42 = v209;
      if ((*(uint64_t (**)(_QWORD, Bytef *, unint64_t))(v84 + 48))(*(_QWORD *)(v84 + 80), buf, v198) != v198)
      {
        v216 = v192;
        v155 = *__error();
        v112 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
        {
LABEL_153:
          v113 = SZGetLoggingHandle();
          v50 = v187;
          v22 = v188;
          v56 = v214;
          if (!os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
          {
LABEL_154:
            v57 = 0;
            v59 = v215;
            goto LABEL_155;
          }
          *(_DWORD *)v218 = 134217984;
          *(_QWORD *)&v218[4] = v198;
          v131 = "Failed to write %ld bytes of local file data to output file";
          goto LABEL_179;
        }
        v156 = strerror(v155);
        *(_DWORD *)v218 = 136315138;
        *(_QWORD *)&v218[4] = v156;
        v108 = "fwrite failed to write out entire buffer: %s";
LABEL_205:
        v109 = v112;
        v110 = 12;
LABEL_206:
        _os_log_error_impl(&dword_1D4E55000, v109, OS_LOG_TYPE_ERROR, v108, v218, v110);
        goto LABEL_153;
      }
      v58 += v198;
LABEL_140:
      v78 = v192;
    }
    else
    {
      v56 = v214;
      v42 = v209;
    }
    v102 = *(_QWORD *)(a9 + 8);
    v103 = *(void (**)(uint64_t, _QWORD, unint64_t, unint64_t, _QWORD))(v102 + 24);
    v51 = v210;
    if (v103)
    {
      v103(1, *((_QWORD *)v16 + 7), v202, v210, *(_QWORD *)(v102 + 32));
      v51 = v210;
    }
    v104 = v215;
    if (v78 == 2)
      break;
    buf += v195;
    if (v51 <= v202)
    {
      v216 = v78;
      v105 = SZGetLoggingHandle();
      if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v218 = 67109120;
        *(_DWORD *)&v218[4] = v78;
        _os_log_error_impl(&dword_1D4E55000, v105, OS_LOG_TYPE_ERROR, "Consumed all data to copy without getting end of data signal; got status: %d",
          v218,
          8u);
      }
      v57 = 0;
      v50 = v187;
      goto LABEL_148;
    }
  }
  v216 = 2;
  v134 = v51 - v202;
  v50 = v187;
  v22 = v188;
  if (v51 != v202)
  {
    v113 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
      goto LABEL_154;
    *(_DWORD *)v218 = 134217984;
    *(_QWORD *)&v218[4] = v134;
    v131 = "Breaking read/write loop with %llu bytes remaining";
LABEL_179:
    v132 = v113;
    v133 = 12;
LABEL_180:
    _os_log_error_impl(&dword_1D4E55000, v132, OS_LOG_TYPE_ERROR, v131, v218, v133);
    goto LABEL_154;
  }
  if (!v215)
  {
    a3 = v185;
LABEL_214:
    v60 = v200;
    if (stream)
    {
      v157 = CloseLocalFile((compression_stream *)stream);
      v60 = v200;
      if (v157)
      {
        v158 = v157;
        v159 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
          goto LABEL_217;
        v172 = *((_QWORD *)v22 + 9);
        *(_DWORD *)v218 = 136315394;
        *(_QWORD *)&v218[4] = v172;
        *(_WORD *)&v218[12] = 1024;
        *(_DWORD *)&v218[14] = v158;
        v173 = "Failed to close local file %s: %d";
        v174 = v159;
        v175 = 18;
        goto LABEL_248;
      }
    }
    v56 = v214;
    v59 = v215;
    if (v60 != 4 && v215 && !*(_BYTE *)(a9 + 47))
    {
      if ((v205 == 8 || v205 == 99 || v205 == 14) && v58 > v207 && v207 < v212 && *(_DWORD *)(a9 + 36) == v205)
      {
        v160 = SZGetLoggingHandle();
        if (os_log_type_enabled(v160, OS_LOG_TYPE_DEBUG))
        {
          v181 = *((_QWORD *)v22 + 9);
          *(_DWORD *)v218 = 136315394;
          *(_QWORD *)&v218[4] = v181;
          *(_WORD *)&v218[12] = 2048;
          *(_QWORD *)&v218[14] = v58 - v207;
          _os_log_debug_impl(&dword_1D4E55000, v160, OS_LOG_TYPE_DEBUG, "%s is %llu bytes larger when we compressed it. Using original compressed data.", v218, 0x16u);
        }
        v161 = 1;
LABEL_256:
        if (v203 == (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a9 + 8) + 64))(*(_QWORD *)(*(_QWORD *)(a9 + 8) + 80), v203, 0))
        {
          v57 = ZipStreamWriteLocalFile(a1, v189, a3, v209, v161, a6, a7, v190, a9);
          v52 = 0;
LABEL_218:
          v56 = v214;
          v59 = v215;
          if (!v215)
            goto LABEL_199;
          goto LABEL_198;
        }
        v178 = *__error();
        v179 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v179, OS_LOG_TYPE_ERROR))
        {
LABEL_217:
          v52 = 0;
          v57 = 0;
          goto LABEL_218;
        }
        v180 = strerror(v178);
        *(_DWORD *)v218 = 136315138;
        *(_QWORD *)&v218[4] = v180;
        v173 = "Failed to seek back to start of local file header: %s";
        v174 = v179;
        v175 = 12;
LABEL_248:
        _os_log_error_impl(&dword_1D4E55000, v174, OS_LOG_TYPE_ERROR, v173, v218, v175);
        goto LABEL_217;
      }
      v167 = v58 - v212;
      if (v58 >= v212)
      {
        if (v205 == 8 || v205 == 99 || v205 == 14)
        {
          v168 = *(_DWORD *)(a9 + 36);
          v169 = SZGetLoggingHandle();
          v170 = os_log_type_enabled(v169, OS_LOG_TYPE_DEBUG);
          if (v168 == v205)
          {
            if (v170)
            {
              v182 = *((_QWORD *)v22 + 9);
              *(_DWORD *)v218 = 136315394;
              *(_QWORD *)&v218[4] = v182;
              *(_WORD *)&v218[12] = 2048;
              *(_QWORD *)&v218[14] = v58 - v212;
              _os_log_debug_impl(&dword_1D4E55000, v169, OS_LOG_TYPE_DEBUG, "%s is %llu bytes larger compressed than uncompressed; converting.",
                v218,
                0x16u);
            }
            v171 = vdupq_n_s64(1uLL);
            v171.i64[0] = v58 - v212;
            *(int64x2_t *)(v190 + 40) = vaddq_s64(v171, *(int64x2_t *)(v190 + 40));
          }
          else
          {
            if (v170)
            {
              v183 = *((_QWORD *)v22 + 9);
              *(_DWORD *)v218 = 136315650;
              *(_QWORD *)&v218[4] = v183;
              *(_WORD *)&v218[12] = 2048;
              *(_QWORD *)&v218[14] = v58 - v207;
              *(_WORD *)&v218[22] = 2048;
              *(_QWORD *)&v218[24] = v58 - v212;
              _os_log_debug_impl(&dword_1D4E55000, v169, OS_LOG_TYPE_DEBUG, "%s is %llu bytes larger with the new compression method and is %llu bytes larger than uncompressed; stor"
                "ing uncompressed.",
                v218,
                0x20u);
            }
            ++*(_QWORD *)(v190 + 56);
          }
          v161 = 2;
        }
        else
        {
          v177 = SZGetLoggingHandle();
          v161 = 2;
          if (os_log_type_enabled(v177, OS_LOG_TYPE_DEBUG))
          {
            v184 = *((_QWORD *)v22 + 9);
            *(_DWORD *)v218 = 136315394;
            *(_QWORD *)&v218[4] = v184;
            *(_WORD *)&v218[12] = 2048;
            *(_QWORD *)&v218[14] = v167;
            _os_log_debug_impl(&dword_1D4E55000, v177, OS_LOG_TYPE_DEBUG, "%s was not compressed before, and was %llu bytes larger when compressed. Storing uncompressed.", v218, 0x16u);
          }
        }
        goto LABEL_256;
      }
    }
LABEL_59:
    *((_QWORD *)v22 + 8) = v203;
    if (v206 < 2)
    {
      if (!v59)
        __assert_rtn("ZipStreamWriteLocalFile", "ZipStream.c", 617, "cmpStreamPtr");
      v22[3] = *((_WORD *)v16 + 2);
      *((_QWORD *)v22 + 4) = v58;
    }
    else
    {
      if (v60 == 1)
      {
LABEL_72:
        if (!v199)
          goto LABEL_160;
        if (v199 == 1)
        {
          *(_QWORD *)&v218[12] = 0;
          *(_QWORD *)&v218[4] = 0;
          HasZip64ExtraField = LocalFileRecordHasZip64ExtraField((uint64_t)v50);
          v73 = *((_DWORD *)v22 + 7);
          if (HasZip64ExtraField)
          {
            *(_QWORD *)&v218[4] = *((_QWORD *)v22 + 4);
            *(_QWORD *)&v218[12] = *((_QWORD *)v22 + 5);
            v74 = 20;
          }
          else
          {
            v114 = *((_QWORD *)v22 + 5);
            *(_DWORD *)&v218[4] = *((_QWORD *)v22 + 4);
            *(_DWORD *)&v218[8] = v114;
            v74 = 12;
          }
          *(_DWORD *)v218 = v73;
          *__error() = 0;
          v115 = (*(uint64_t (**)(_QWORD, const char *, uint64_t))(*(_QWORD *)(a9 + 8) + 48))(*(_QWORD *)(*(_QWORD *)(a9 + 8) + 80), "PK\a\b", 4);
          v116 = __error();
          if (v115 == 4)
          {
            *v116 = 0;
            if (v74 == (*(uint64_t (**)(_QWORD, _BYTE *, uint64_t))(*(_QWORD *)(a9 + 8) + 48))(*(_QWORD *)(*(_QWORD *)(a9 + 8) + 80), v218, v74))goto LABEL_160;
            v127 = *__error();
            v68 = SZGetLoggingHandle();
            if (!os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
              goto LABEL_196;
            v128 = strerror(v127);
            *(_DWORD *)v217 = 136315138;
            *(_QWORD *)&v217[4] = v128;
            v70 = "Failed to write data descriptor: %s";
          }
          else
          {
            v119 = *v116;
            v68 = SZGetLoggingHandle();
            if (!os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
              goto LABEL_196;
            v120 = strerror(v119);
            *(_DWORD *)v217 = 136315138;
            *(_QWORD *)&v217[4] = v120;
            v70 = "Failed to write data descriptor signature: %s";
          }
          v126 = v217;
          goto LABEL_176;
        }
        if ((*((_WORD *)v16 + 1) & 8) != 0)
          __assert_rtn("ZipStreamWriteLocalFile", "ZipStream.c", 638, "!(newLFRecord->flags & ZIP_FLAGS_BIT_EXPECT_DATA_DESCRIPTOR)");
        *((_QWORD *)v16 + 5) = v58;
        if (!v213)
          *((_DWORD *)v16 + 8) = v30;
        v63 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a9 + 8) + 72))(*(_QWORD *)(*(_QWORD *)(a9 + 8) + 80));
        if (v63 < 0)
        {
          v121 = *__error();
          v68 = SZGetLoggingHandle();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            v122 = strerror(v121);
            *(_DWORD *)v218 = 136315138;
            *(_QWORD *)&v218[4] = v122;
            v70 = "Failed to get current offset to restore after writing local file record: %s";
            goto LABEL_172;
          }
LABEL_196:
          v52 = 0;
          goto LABEL_197;
        }
        v64 = v63;
        if (v203 != (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a9 + 8) + 64))(*(_QWORD *)(*(_QWORD *)(a9 + 8) + 80), v203, 0))
        {
          v124 = *__error();
          v68 = SZGetLoggingHandle();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            v125 = strerror(v124);
            *(_DWORD *)v218 = 136315138;
            *(_QWORD *)&v218[4] = v125;
            v70 = "Failed to seek to local compressed size offset in local file header: %s";
            goto LABEL_172;
          }
          goto LABEL_196;
        }
        free(v50);
        v65 = CreateAndWriteLocalFileRecord((uint64_t)v16, *(_QWORD *)(a9 + 8));
        if (v65)
        {
          v50 = v65;
          v66 = *((unsigned __int16 *)v65 + 13) + (unint64_t)*((unsigned __int16 *)v65 + 14) + 30;
          if (v194 + v193 + 30 != v66)
          {
            v149 = SZGetLoggingHandle();
            if (!os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
              goto LABEL_196;
            v166 = *((_QWORD *)v22 + 9);
            *(_DWORD *)v218 = 136315650;
            *(_QWORD *)&v218[4] = v166;
            *(_WORD *)&v218[12] = 2048;
            *(_QWORD *)&v218[14] = v194 + v193 + 30;
            *(_WORD *)&v218[22] = 2048;
            *(_QWORD *)&v218[24] = v66;
            v70 = "LocalFileHeader for %s changed in size when we updated it! Originally wrote %zu bytes; it's now %zu bytes.";
            v126 = v218;
            v129 = v149;
            v130 = 32;
            goto LABEL_177;
          }
          if (v64 != (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a9 + 8) + 64))(*(_QWORD *)(*(_QWORD *)(a9 + 8) + 80), v64, 0))
          {
            v67 = *__error();
            v68 = SZGetLoggingHandle();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
            {
              v69 = strerror(v67);
              *(_DWORD *)v218 = 136315138;
              *(_QWORD *)&v218[4] = v69;
              v70 = "Failed to seek to end of compressed data offset in local file header: %s";
LABEL_172:
              v126 = v218;
LABEL_176:
              v129 = v68;
              v130 = 12;
LABEL_177:
              _os_log_error_impl(&dword_1D4E55000, v129, OS_LOG_TYPE_ERROR, v70, v126, v130);
              goto LABEL_196;
            }
            goto LABEL_196;
          }
LABEL_160:
          ZipStreamAddStatisticsForCDRecord((uint64_t)v22, v197, (_QWORD *)v190);
          v117 = *(_QWORD *)(a9 + 8);
          v118 = *(void (**)(uint64_t, _QWORD, _QWORD, unint64_t, _QWORD))(v117 + 24);
          if (v118)
            v118(2, *((_QWORD *)v16 + 7), *((_QWORD *)v22 + 5), v210, *(_QWORD *)(v117 + 32));
          DestroyMutableCDRecord(*v189);
          *v189 = (void **)v22;
          DestroyMutableLocalFileRecord(*a3);
          v52 = 0;
          v22 = 0;
          *a3 = (void **)v16;
          v57 = 1;
          v16 = 0;
          if (!v59)
            goto LABEL_199;
LABEL_198:
          compression_stream_destroy(v59);
          free(v59);
          goto LABEL_199;
        }
        v148 = SZGetLoggingHandle();
        if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
        {
          v165 = *((_QWORD *)v22 + 9);
          *(_DWORD *)v218 = 136315138;
          *(_QWORD *)&v218[4] = v165;
          _os_log_error_impl(&dword_1D4E55000, v148, OS_LOG_TYPE_ERROR, "Failed to write local file record for file %s to output file", v218, 0xCu);
        }
        v52 = 0;
        v50 = 0;
LABEL_197:
        v57 = 0;
        if (!v59)
          goto LABEL_199;
        goto LABEL_198;
      }
      if (v60 != 2)
        __assert_rtn("ZipStreamWriteLocalFile", "ZipStream.c", 627, "false");
      v22[3] = 0;
      *((_QWORD *)v22 + 4) = *((_QWORD *)v22 + 5);
    }
    if (!v213)
      *((_DWORD *)v22 + 7) = v30;
    goto LABEL_72;
  }
  do
  {
    v104->dst_ptr = v56;
    v104->dst_size = 0x20000;
    v135 = SZGetLoggingHandle();
    if (os_log_type_enabled(v135, OS_LOG_TYPE_DEBUG))
    {
      v140 = v104->src_ptr;
      v141 = v104->src_size;
      v142 = v104->dst_ptr;
      v143 = v104->dst_size;
      *(_DWORD *)v218 = 134218752;
      *(_QWORD *)&v218[4] = v140;
      *(_WORD *)&v218[12] = 2048;
      *(_QWORD *)&v218[14] = v141;
      *(_WORD *)&v218[22] = 2048;
      *(_QWORD *)&v218[24] = v142;
      *(_WORD *)&v218[32] = 2048;
      *(_QWORD *)&v218[34] = v143;
      _os_log_debug_impl(&dword_1D4E55000, v135, OS_LOG_TYPE_DEBUG, "Calling compression_stream_process with src_ptr: %p, src_size: %zu, dst_ptr: %p, dst_size: %zu", v218, 0x2Au);
    }
    v136 = compression_stream_process(v104, 1);
    v137 = SZGetLoggingHandle();
    if (os_log_type_enabled(v137, OS_LOG_TYPE_DEBUG))
    {
      v144 = v104->src_ptr;
      v145 = v104->src_size;
      v146 = v104->dst_ptr;
      v147 = v104->dst_size;
      *(_DWORD *)v218 = 67110144;
      *(_DWORD *)&v218[4] = v136;
      *(_WORD *)&v218[8] = 2048;
      *(_QWORD *)&v218[10] = v144;
      *(_WORD *)&v218[18] = 2048;
      *(_QWORD *)&v218[20] = v145;
      *(_WORD *)&v218[28] = 2048;
      *(_QWORD *)&v218[30] = v146;
      *(_WORD *)&v218[38] = 2048;
      *(_QWORD *)&v218[40] = v147;
      _os_log_debug_impl(&dword_1D4E55000, v137, OS_LOG_TYPE_DEBUG, "After process ret %d: src_ptr: %p, src_size: %zu, dst_ptr: %p, dst_size: %zu", v218, 0x30u);
    }
    v138 = v104->dst_size;
    if (!(v138 >> 17))
    {
      v139 = 0x20000 - v138;
      *__error() = 0;
      if (v139 != (*(uint64_t (**)(_QWORD, uint8_t *, size_t))(*(_QWORD *)(a9 + 8) + 48))(*(_QWORD *)(*(_QWORD *)(a9 + 8) + 80), v214, v139))
      {
        v163 = *__error();
        v164 = SZGetLoggingHandle();
        if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
        {
          v176 = strerror(v163);
          *(_DWORD *)v218 = 136315138;
          *(_QWORD *)&v218[4] = v176;
          _os_log_error_impl(&dword_1D4E55000, v164, OS_LOG_TYPE_ERROR, "Failed to write final compressed data: %s", v218, 0xCu);
        }
        v57 = 0;
        v14 = v186;
        v50 = v187;
        v56 = v214;
        v59 = v215;
        goto LABEL_149;
      }
      v58 += v139;
      v104 = v215;
    }
    v56 = v214;
  }
  while (v136 == COMPRESSION_STATUS_OK);
  a3 = v185;
  if (v136 == COMPRESSION_STATUS_END)
  {
    v14 = v186;
    v50 = v187;
    v22 = v188;
    goto LABEL_214;
  }
  v162 = SZGetLoggingHandle();
  v50 = v187;
  if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v218 = 67109120;
    *(_DWORD *)&v218[4] = v136;
    _os_log_error_impl(&dword_1D4E55000, v162, OS_LOG_TYPE_ERROR, "compression_stream_process with finalize did not return compression_status_end: %d", v218, 8u);
  }
  v57 = 0;
  v14 = v186;
LABEL_148:
  v59 = v215;
LABEL_149:
  v22 = v188;
LABEL_155:
  v52 = (unsigned __int16 *)stream;
  if (v59)
    goto LABEL_198;
LABEL_199:
  if (v52)
    CloseLocalFile((compression_stream *)v52);
LABEL_201:
  DestroyMutableCDRecord((void **)v22);
  DestroyMutableLocalFileRecord((void **)v16);
  free(v50);
  free(v56);
  free(v14);
  return v57;
}

BOOL ZipStreamConcoctStreamData(uint64_t a1, uint64_t a2, __int16 a3, __int16 a4, uint64_t a5, _QWORD *a6, _QWORD *a7, _QWORD *a8)
{
  int v12;
  int v13;
  _DWORD *CDRecord;
  const __CFAllocator *v15;
  __CFDictionary *Mutable;
  CFNumberRef v17;
  CFNumberRef v18;
  CFNumberRef v19;
  CFNumberRef v20;
  CFNumberRef v21;
  const void *v22;
  const void *v23;
  const __CFData *Data;
  const __CFData *v25;
  size_t Length;
  uInt v27;
  void *v28;
  const UInt8 *BytePtr;
  size_t v30;
  uLong v31;
  char *LocalFileRecord;
  NSObject *v33;
  uint8_t v35[8];
  int v36;
  __int16 v37;
  __int16 v38;
  uint64_t v39;
  uint64_t valuePtr;

  v39 = a2;
  valuePtr = a1;
  v38 = a3;
  v37 = a4;
  v12 = time(0);
  v13 = time(0);
  CDRecord = CreateCDRecord("META-INF/com.apple.ZipMetadata.plist", 33188, v12, v13);
  v15 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v17 = CFNumberCreate(v15, kCFNumberSInt64Type, &valuePtr);
  CFDictionaryAddValue(Mutable, CFSTR("RecordCount"), v17);
  CFRelease(v17);
  v18 = CFNumberCreate(v15, kCFNumberSInt64Type, &v39);
  CFDictionaryAddValue(Mutable, CFSTR("TotalUncompressedBytes"), v18);
  CFRelease(v18);
  v36 = 2;
  v19 = CFNumberCreate(v15, kCFNumberIntType, &v36);
  CFDictionaryAddValue(Mutable, CFSTR("Version"), v19);
  CFRelease(v19);
  v20 = CFNumberCreate(v15, kCFNumberSInt16Type, &v38);
  CFDictionarySetValue(Mutable, CFSTR("StandardFilePerms"), v20);
  CFRelease(v20);
  v21 = CFNumberCreate(v15, kCFNumberSInt16Type, &v37);
  CFDictionarySetValue(Mutable, CFSTR("StandardDirectoryPerms"), v21);
  CFRelease(v21);
  v22 = *(const void **)(a5 + 16);
  if (v22)
    CFDictionarySetValue(Mutable, CFSTR("CreatorToolCommandLine"), v22);
  v23 = *(const void **)(a5 + 24);
  if (v23)
    CFDictionarySetValue(Mutable, CFSTR("CreatorToolUUID"), v23);
  Data = CFPropertyListCreateData(v15, Mutable, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  v25 = Data;
  if (Data)
  {
    Length = CFDataGetLength(Data);
    if (Length >= 0xFFFFFFFF)
      __assert_rtn("ZipStreamConcoctStreamData", "ZipStream.c", 807, "dataLength < UINT32_MAX");
    v27 = Length;
    v28 = malloc_type_malloc(Length, 0x724C93EBuLL);
    BytePtr = CFDataGetBytePtr(v25);
    v30 = CFDataGetLength(v25);
    memcpy(v28, BytePtr, v30);
    CFRelease(v25);
    *((_WORD *)CDRecord + 5) = 0;
    CDRecord[5] = v27;
    CDRecord[6] = v27;
    v31 = crc32(0, 0, 0);
    CDRecord[4] = crc32(v31, (const Bytef *)v28, v27);
    *a6 = CreateMutableCDRecord((uint64_t)CDRecord);
    LocalFileRecord = CreateLocalFileRecord((uint64_t)CDRecord);
    *a7 = CreateMutableLocalFileRecord((uint64_t)LocalFileRecord);
    free(CDRecord);
    free(LocalFileRecord);
    *a8 = v28;
  }
  else
  {
    v33 = SZGetLoggingHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v35 = 0;
      _os_log_error_impl(&dword_1D4E55000, v33, OS_LOG_TYPE_ERROR, "Failed to serialize stream data", v35, 2u);
    }
    free(CDRecord);
  }
  CFRelease(Mutable);
  return v25 != 0;
}

BOOL ZipStreamConcoctFixedStreamData(uint64_t a1, _QWORD *a2, _QWORD *a3, const Bytef **a4)
{
  int v8;
  int v9;
  _DWORD *CDRecord;
  size_t v11;
  int v12;
  char *v13;
  const Bytef *v14;
  uLong v15;
  char *LocalFileRecord;

  v8 = time(0);
  v9 = time(0);
  CDRecord = CreateCDRecord("META-INF/com.apple.FixedZipMetadata.bin", 33188, v8, v9);
  v11 = gHashDigestSizes[*(unsigned __int8 *)(a1 + 44)];
  v12 = v11 + 7;
  v13 = (char *)malloc_type_malloc(v11 + 7, 0x49817E58uLL);
  v14 = (const Bytef *)v13;
  if (v13)
  {
    *(_DWORD *)v13 = 2017879117;
    v13[4] = *(_BYTE *)(a1 + 44) + 1;
    *(_WORD *)(v13 + 5) = v11;
    bzero(v13 + 7, v11);
    *((_WORD *)CDRecord + 5) = 0;
    CDRecord[5] = v12;
    CDRecord[6] = v12;
    v15 = crc32(0, 0, 0);
    CDRecord[4] = crc32(v15, v14, (int)v11 + 7);
    *a2 = CreateMutableCDRecord((uint64_t)CDRecord);
    LocalFileRecord = CreateLocalFileRecord((uint64_t)CDRecord);
    *a3 = CreateMutableLocalFileRecord((uint64_t)LocalFileRecord);
    free(LocalFileRecord);
    *a4 = v14;
  }
  free(CDRecord);
  return v14 != 0;
}

uint64_t ZipStreamShouldOrderFileEarly(const char *a1, _BYTE *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  const char *v9;
  size_t v10;
  uint64_t v11;
  const char *v12;
  int v13;

  *a2 = 0;
  if (!strncmp(a1, "com.apple.deltainstallcommands.", 0x1FuLL))
    return 1;
  if (!strncmp(a1, "Payload/", 8uLL))
  {
    if (strcmp(a1, "Payload/"))
    {
      v5 = strdup(a1 + 8);
      v6 = strchr(v5, 47);
      if (v6)
      {
        v7 = v6;
        *v6 = 0;
        v8 = rindex(v5, 46);
        if (!v8)
        {
LABEL_11:
          v4 = 0;
          *v7 = 47;
LABEL_20:
          free(v5);
          return v4;
        }
        v9 = v8;
        v10 = strlen(v8);
        v11 = 0;
        while (strlen(bundle_extensions[v11]) != v10 || strcasecmp(v9, bundle_extensions[v11]))
        {
          if (++v11 == 3)
            goto LABEL_11;
        }
        *v7 = 47;
        v13 = v7[1];
        v12 = v7 + 1;
        if (!v13
          || !strncmp(v12, "_CodeSignature/", 0xFuLL)
          || !strcmp(v12, "embedded.mobileprovision")
          || !strcmp(v12, "ResourceRules.plist"))
        {
          v4 = 1;
          goto LABEL_20;
        }
        if (!strcmp(v12, "Info.plist"))
        {
          v4 = 1;
          *a2 = 1;
          goto LABEL_20;
        }
      }
      v4 = 0;
      goto LABEL_20;
    }
    return 1;
  }
  return 0;
}

uint64_t ZipStreamWriteCentralDirectoryAndEndRecords(const __CFArray *a1, CFIndex a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  CFIndex Count;
  CFIndex i;
  unsigned __int16 *v20;
  unsigned __int16 *v21;
  unsigned int v22;
  _QWORD *v23;
  uint64_t v24;
  unsigned __int16 v25;
  unsigned __int16 v26;
  _DWORD *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  unint64_t v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  size_t v37;
  size_t v38;
  _WORD *v39;
  __int16 v40;
  unint64_t v41;
  unint64_t v42;
  unsigned int v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  _DWORD *v55;
  char *v56;
  unint64_t v57;
  void *v58;
  uint64_t v59;
  int *v60;
  int v61;
  NSObject *v62;
  int v63;
  NSObject *v64;
  const char *v65;
  int *v66;
  char *v67;
  NSObject *v68;
  _QWORD *ValueAtIndex;
  void *v70;
  _QWORD *v71;
  size_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  size_t v76;
  char *v77;
  NSObject *v78;
  const char *v79;
  int v80;
  char *v81;
  int v82;
  NSObject *v83;
  char *v84;
  const char *v85;
  uint64_t v86;
  char *v87;
  unint64_t v88;
  uint64_t v89;
  int v90;
  char *v91;
  int v92;
  int v93;
  unint64_t v94;
  unint64_t v95;
  int v96;
  char *v97;
  void *v98;
  int v99;
  NSObject *v100;
  const char *v101;
  int v102;
  char *v103;
  uint64_t v105;
  uint64_t v106;
  int v107;
  NSObject *v108;
  uint32_t v109;
  uint64_t v110;
  int *v111;
  uLong v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  char *v117;
  int v118;
  NSObject *v119;
  int v120;
  NSObject *v121;
  int v122;
  unsigned __int8 *v123;
  int v124;
  NSObject *v125;
  const char *v126;
  char *v127;
  char *v128;
  int v129;
  NSObject *v130;
  int v131;
  NSObject *v132;
  int v133;
  int v134;
  uint64_t v135;
  uint64_t v136;
  _QWORD *v137;
  unsigned __int8 *v138;
  const __CFArray *v139;
  uint64_t v140;
  _QWORD v141[3];
  uint8_t v142[4];
  char *v143;
  __int16 v144;
  char *v145;
  __int16 v146;
  char *v147;
  uint8_t buf[64];
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  uint64_t v158;
  uint64_t v159;

  v159 = *MEMORY[0x1E0C80C00];
  v141[0] = 0;
  v141[1] = 0;
  *(_QWORD *)((char *)&v141[1] + 6) = 0;
  v6 = *(_QWORD *)(a5 + 8);
  v7 = *(_QWORD *)(v6 + 80);
  if (!*(_BYTE *)(a5 + 49))
  {
    v10 = a5;
    v14 = (*(uint64_t (**)(uint64_t))(v6 + 72))(v7);
    if (v14 < 0)
    {
      v63 = *__error();
      v64 = SZGetLoggingHandle();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = strerror(v63);
        v65 = "ftello before writing central directory failed: %s";
        goto LABEL_97;
      }
      goto LABEL_98;
    }
    v15 = v14;
    v135 = v14;
    v136 = a4;
    v139 = a1;
    v140 = v10;
    if (!*(_QWORD *)v10 || *(_BYTE *)(v10 + 47))
    {
      v16 = 0;
      goto LABEL_10;
    }
    v68 = SZGetLoggingHandle();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D4E55000, v68, OS_LOG_TYPE_DEBUG, "Writing partial hash", buf, 2u);
    }
    ValueAtIndex = CFArrayGetValueAtIndex(a1, a2);
    v70 = malloc_type_malloc(0x400000uLL, 0xE65EE35BuLL);
    v158 = 0;
    v156 = 0u;
    v157 = 0u;
    v154 = 0u;
    v155 = 0u;
    v152 = 0u;
    v153 = 0u;
    v150 = 0u;
    v151 = 0u;
    v149 = 0u;
    memset(buf, 0, sizeof(buf));
    v71 = (_QWORD *)v10;
    v72 = gHashDigestSizes[*(unsigned __int8 *)(v10 + 44)];
    v137 = ValueAtIndex;
    v138 = (unsigned __int8 *)malloc_type_malloc(v72, 0xD92F0CA2uLL);
    v73 = v15 + 4;
    v74 = (v15 + 4) / *v71 * *v71;
    v75 = (char *)ValueAtIndex[8];
    v76 = (size_t)&v75[strlen(*(const char **)(a3 + 56)) + *(unsigned __int16 *)(a3 + 64)];
    v77 = (char *)(v76 + 37);
    if (v74 < (uint64_t)(v76 + 37 + v72))
    {
      v78 = SZGetLoggingHandle();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v142 = 0;
        v79 = "Not computing partial hash for last chunk because last chunk includes metadata digest";
LABEL_164:
        _os_log_debug_impl(&dword_1D4E55000, v78, OS_LOG_TYPE_DEBUG, v79, v142, 2u);
        goto LABEL_131;
      }
      goto LABEL_131;
    }
    v86 = v73 - v74;
    if (!v86)
    {
      v78 = SZGetLoggingHandle();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v142 = 0;
        v79 = "Not computing partial hash for last chunk because central directory signature ends at a chunk boundary.";
        goto LABEL_164;
      }
LABEL_131:
      v16 = 0;
      v9 = 1;
      goto LABEL_132;
    }
    if (v86 <= 0)
      __assert_rtn("ZipStreamWritePartialHashForLastChunk", "ZipStream.c", 1016, "chunkStart < hashEndOffset");
    *__error() = 0;
    if ((*(uint64_t (**)(_QWORD, void *, uint64_t))(*(_QWORD *)(v140 + 8) + 48))(*(_QWORD *)(*(_QWORD *)(v140 + 8) + 80), &kCDRecordSignature, 4) == 4)
    {
      GenericHashInit((uint64_t)buf, *(unsigned __int8 *)(v140 + 44));
      if (v74 == (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v140 + 8) + 64))(*(_QWORD *)(*(_QWORD *)(v140 + 8) + 80), v74, 0))
      {
        while (v86)
        {
          if ((unint64_t)v86 >= 0x400000)
            v88 = 0x400000;
          else
            v88 = v86;
          v89 = (*(uint64_t (**)(_QWORD, void *, unint64_t))(*(_QWORD *)(v140 + 8) + 56))(*(_QWORD *)(*(_QWORD *)(v140 + 8) + 80), v70, v88);
          if (v89 != v88)
          {
            v117 = (char *)v89;
            v118 = *__error();
            v119 = SZGetLoggingHandle();
            if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v142 = 134218498;
              v143 = (char *)v88;
              v144 = 2048;
              v145 = v117;
              v146 = 2080;
              v147 = strerror(v118);
              _os_log_error_impl(&dword_1D4E55000, v119, OS_LOG_TYPE_ERROR, "Expected to read %ld bytes, but only got %ld bytes from outfile: %s", v142, 0x20u);
            }
            v16 = 0;
            v9 = 0;
LABEL_132:
            a1 = v139;
LABEL_168:
            v123 = v138;
            v10 = v140;
LABEL_169:
            free(v70);
            free(v123);
            if (!(_DWORD)v9)
            {
LABEL_99:
              v55 = 0;
              v58 = 0;
              goto LABEL_139;
            }
LABEL_10:
            v134 = v16;
            v17 = SZGetLoggingHandle();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1D4E55000, v17, OS_LOG_TYPE_DEBUG, "Writing Central Directory", buf, 2u);
            }
            Count = CFArrayGetCount(a1);
            if (Count >= 1)
            {
              for (i = 0; i != Count; ++i)
              {
                v20 = (unsigned __int16 *)CFArrayGetValueAtIndex(a1, i);
                v21 = v20;
                v22 = v20[3];
                if (v22 > 0xD)
                {
                  v23 = (_QWORD *)(v136 + 88);
                  if (v22 != 14)
                  {
                    v23 = (_QWORD *)(v136 + 80);
                    if (v22 != 99)
LABEL_20:
                      v23 = (_QWORD *)(v136 + 96);
                  }
                }
                else
                {
                  v23 = (_QWORD *)(v136 + 64);
                  if (v20[3])
                  {
                    v23 = (_QWORD *)(v136 + 72);
                    if (v22 != 8)
                      goto LABEL_20;
                  }
                }
                ++*v23;
                v24 = *(_QWORD *)(v10 + 8);
                *(_QWORD *)buf = 0;
                v25 = 8 * (*((_QWORD *)v20 + 5) > 0xFFFFFFFEuLL);
                if (*((_QWORD *)v20 + 4) > 0xFFFFFFFEuLL)
                  v25 += 8;
                if (*((_QWORD *)v20 + 8) > 0xFFFFFFFEuLL)
                  v25 += 8;
                if (*((_DWORD *)v20 + 13) <= 0xFFFEu)
                  v26 = v25;
                else
                  v26 = v25 | 4;
                v27 = 0;
                if (_GetExtraFieldOfLength(v20 + 44, &kZip64ExtraFieldSignature, v26, buf))
                {
                  v28 = *(_QWORD *)buf;
                  if (*(_QWORD *)buf)
                  {
                    v29 = *((_QWORD *)v21 + 5);
                    if (v29 < 0xFFFFFFFF)
                    {
                      v30 = (unint64_t *)(*(_QWORD *)buf + 4);
                    }
                    else
                    {
                      *(_QWORD *)(*(_QWORD *)buf + 4) = v29;
                      v30 = (unint64_t *)(v28 + 12);
                    }
                    v31 = *((_QWORD *)v21 + 4);
                    if (v31 >= 0xFFFFFFFF)
                      *v30++ = v31;
                    v32 = *((_QWORD *)v21 + 8);
                    if (v32 >= 0xFFFFFFFF)
                      *v30++ = v32;
                    v33 = *((_DWORD *)v21 + 13);
                    if (v33 >= 0xFFFF)
                      *(_DWORD *)v30 = v33;
                  }
                  *(_QWORD *)buf = 0;
                  v27 = 0;
                  if (_GetExtraFieldOfLength(v21 + 44, &kInfoZipExtraFieldSignature, 8 * (*((_QWORD *)v21 + 2) != *((_QWORD *)v21 + 1)), buf))
                  {
                    v34 = *(_QWORD *)buf;
                    if (*(_QWORD *)buf)
                    {
                      v35 = *((_QWORD *)v21 + 1);
                      if (v35 > 0xFFFFFFFE)
                        LODWORD(v35) = -1;
                      *(_DWORD *)(*(_QWORD *)buf + 4) = v35;
                      v36 = *((_QWORD *)v21 + 2);
                      if (v36 > 0xFFFFFFFE)
                        LODWORD(v36) = -1;
                      *(_DWORD *)(v34 + 8) = v36;
                    }
                    v37 = strlen(*((const char **)v21 + 9));
                    if (v37 >= 0x10000)
                      __assert_rtn("CreateCDRecordFromMutable", "MutableZipStructure.c", 379, "file_name_length <= UINT16_MAX");
                    v38 = v37;
                    v39 = malloc_type_malloc(v37 + v21[44] + v21[24] + 46, 0x795FBF1BuLL);
                    v27 = v39;
                    *(_DWORD *)v39 = 33639248;
                    v39[2] = *v21;
                    if (v26)
                      v40 = 45;
                    else
                      v40 = v21[1];
                    v39[3] = v40;
                    v39[4] = v21[2];
                    v39[5] = v21[3];
                    *((_DWORD *)v39 + 3) = UNIX2DOSTime(*((_QWORD *)v21 + 2));
                    v27[4] = *((_DWORD *)v21 + 7);
                    v41 = *((_QWORD *)v21 + 4);
                    if (v41 >= 0xFFFFFFFF)
                      LODWORD(v41) = -1;
                    v27[5] = v41;
                    v42 = *((_QWORD *)v21 + 5);
                    if (v42 >= 0xFFFFFFFF)
                      LODWORD(v42) = -1;
                    v27[6] = v42;
                    *((_WORD *)v27 + 14) = v38;
                    *((_WORD *)v27 + 15) = v21[44];
                    *((_WORD *)v27 + 16) = v21[24];
                    v43 = *((_DWORD *)v21 + 13);
                    if (v43 >= 0xFFFF)
                      LOWORD(v43) = -1;
                    *((_WORD *)v27 + 17) = v43;
                    *((_WORD *)v27 + 18) = v21[28];
                    *(_DWORD *)((char *)v27 + 38) = (v21[12] << 16) | 0x4000;
                    v44 = *((_QWORD *)v21 + 8);
                    if (v44 >= 0xFFFFFFFF)
                      LODWORD(v44) = -1;
                    *(_DWORD *)((char *)v27 + 42) = v44;
                    memcpy((char *)v27 + 46, *((const void **)v21 + 9), v38);
                    memcpy((char *)v27 + v38 + 46, *((const void **)v21 + 12), v21[44]);
                    memcpy((char *)v27 + v38 + v21[44] + 46, *((const void **)v21 + 10), v21[24]);
                  }
                }
                v45 = *((unsigned __int16 *)v27 + 14)
                    + (unint64_t)*((unsigned __int16 *)v27 + 15)
                    + *((unsigned __int16 *)v27 + 16)
                    + 46;
                v46 = (*(uint64_t (**)(_QWORD, _DWORD *, unint64_t))(v24 + 48))(*(_QWORD *)(v24 + 80), v27, v45);
                if (v46 == v45)
                  v47 = 0;
                else
                  v47 = v27;
                free(v47);
                if (v46 != v45 || !v27)
                {
                  v64 = SZGetLoggingHandle();
                  if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
                  {
                    v66 = __error();
                    v67 = strerror(*v66);
                    *(_DWORD *)buf = 136315138;
                    *(_QWORD *)&buf[4] = v67;
                    v65 = "Failed to write central directory record: %s";
                    goto LABEL_97;
                  }
                  goto LABEL_98;
                }
                free(v27);
                a1 = v139;
                v10 = v140;
              }
            }
            v48 = SZGetLoggingHandle();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1D4E55000, v48, OS_LOG_TYPE_DEBUG, "Writing end of central directory records", buf, 2u);
            }
            v49 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v10 + 8) + 72))(*(_QWORD *)(*(_QWORD *)(v10 + 8)
                                                                                              + 80));
            v50 = v135;
            if (v49 < 0)
            {
              v80 = *__error();
              v64 = SZGetLoggingHandle();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
              {
                v81 = strerror(v80);
                *(_DWORD *)buf = 136315138;
                *(_QWORD *)&buf[4] = v81;
                v65 = "ftello after writing central directory failed: %s";
LABEL_97:
                _os_log_error_impl(&dword_1D4E55000, v64, OS_LOG_TYPE_ERROR, v65, buf, 0xCu);
              }
LABEL_98:
              v9 = 0;
              goto LABEL_99;
            }
            v51 = v49;
            v52 = v49 - v135;
            v53 = SZGetLoggingHandle();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            {
              v106 = *(_QWORD *)(v136 + 136);
              v105 = *(_QWORD *)(v136 + 144);
              *(_DWORD *)buf = 134219008;
              *(_QWORD *)&buf[4] = Count;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v135;
              *(_WORD *)&buf[22] = 2048;
              *(_QWORD *)&buf[24] = v52;
              *(_WORD *)&buf[32] = 2048;
              *(_QWORD *)&buf[34] = v105;
              *(_WORD *)&buf[42] = 2048;
              *(_QWORD *)&buf[44] = v106;
              _os_log_debug_impl(&dword_1D4E55000, v53, OS_LOG_TYPE_DEBUG, "Zip64 triggers: total_cd_records %lu; cd_offset %lld; cd_length %llu; max compressed_size %llu; max unco"
                "mpressed_size %llu",
                buf,
                0x34u);
            }
            if (v135 <= 4294967294
              && Count <= 65534
              && v52 <= 4294967294
              && *(_QWORD *)(v136 + 136) <= 0xFFFFFFFEuLL
              && *(_QWORD *)(v136 + 144) <= 0xFFFFFFFEuLL)
            {
              v58 = 0;
              v55 = 0;
              memset((char *)v141 + 4, 0, 18);
              LODWORD(v141[0]) = 101010256;
              goto LABEL_116;
            }
            v54 = SZGetLoggingHandle();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1D4E55000, v54, OS_LOG_TYPE_DEBUG, "Writing Zip64 records", buf, 2u);
            }
            *(_BYTE *)(v136 + 200) = 1;
            v55 = malloc_type_calloc(1uLL, 0x14uLL, 0x1000040A86A77D5uLL);
            v55[4] = 1;
            *v55 = 117853008;
            v56 = (char *)malloc_type_calloc(1uLL, 0x38uLL, 0x100004021716A34uLL);
            *(_DWORD *)v56 = 101075792;
            *(_QWORD *)(v56 + 4) = 44;
            *((_DWORD *)v56 + 3) = 2949918;
            *((_QWORD *)v55 + 1) = v51;
            *((_QWORD *)v56 + 3) = Count;
            *((_QWORD *)v56 + 4) = Count;
            *((_QWORD *)v56 + 5) = v52;
            *((_QWORD *)v56 + 6) = v135;
            v57 = *(_QWORD *)(v56 + 4) + 12;
            if (v57 >= 0x7FFFFFFFFFFFFFFFLL)
              __assert_rtn("ZipStreamWriteCentralDirectoryAndEndRecords", "ZipStream.c", 1242, "writeSize < INTPTR_MAX");
            v58 = v56;
            *__error() = 0;
            v59 = (*(uint64_t (**)(_QWORD, void *, unint64_t))(*(_QWORD *)(v10 + 8) + 48))(*(_QWORD *)(*(_QWORD *)(v10 + 8) + 80), v58, v57);
            v60 = __error();
            if (v57 == v59)
            {
              *v60 = 0;
              if ((*(uint64_t (**)(_QWORD, _DWORD *, uint64_t))(*(_QWORD *)(v10 + 8) + 48))(*(_QWORD *)(*(_QWORD *)(v10 + 8) + 80), v55, 20) == 20)
              {
                memset((char *)v141 + 4, 0, 18);
                LODWORD(v141[0]) = 101010256;
                if (Count >= 0x10000)
                  LOWORD(Count) = -1;
                v50 = v135;
LABEL_116:
                LOWORD(v141[1]) = Count;
                WORD1(v141[1]) = Count;
                v92 = -1;
                if (v52 >= 0xFFFFFFFFLL)
                  v93 = -1;
                else
                  v93 = v52;
                if (v50 < 0xFFFFFFFFLL)
                  v92 = v50;
                HIDWORD(v141[1]) = v93;
                LODWORD(v141[2]) = v92;
                *__error() = 0;
                if ((*(uint64_t (**)(_QWORD, _QWORD *, uint64_t))(*(_QWORD *)(v10 + 8) + 48))(*(_QWORD *)(*(_QWORD *)(v10 + 8) + 80), v141, 22) == 22)
                {
                  v94 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v10 + 8) + 72))(*(_QWORD *)(*(_QWORD *)(v10 + 8) + 80));
                  if ((v94 & 0x8000000000000000) == 0)
                  {
                    if (!*(_QWORD *)v10 || v134)
                    {
                      v95 = v50 + 4;
                    }
                    else
                    {
                      v95 = *(_QWORD *)v10 + (unint64_t)v50 / *(_QWORD *)v10 * *(_QWORD *)v10;
                      if (v95 >= v94)
                        v95 = v94;
                    }
                    *(_QWORD *)(v136 + 128) = v95;
                    *(_QWORD *)(v136 + 104) = v94 - v50;
                    v9 = 1;
                    goto LABEL_139;
                  }
                  v102 = *__error();
                  v83 = SZGetLoggingHandle();
                  if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
                  {
                    v103 = strerror(v102);
                    *(_DWORD *)buf = 136315138;
                    *(_QWORD *)&buf[4] = v103;
                    v85 = "Failed to determine offset of output file: %s";
LABEL_137:
                    _os_log_error_impl(&dword_1D4E55000, v83, OS_LOG_TYPE_ERROR, v85, buf, 0xCu);
                  }
                }
                else
                {
                  v96 = *__error();
                  v83 = SZGetLoggingHandle();
                  if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
                  {
                    v97 = strerror(v96);
                    *(_DWORD *)buf = 136315138;
                    *(_QWORD *)&buf[4] = v97;
                    v85 = "Failed to write end record: %s";
                    goto LABEL_137;
                  }
                }
              }
              else
              {
                v90 = *__error();
                v83 = SZGetLoggingHandle();
                if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
                {
                  v91 = strerror(v90);
                  *(_DWORD *)buf = 136315138;
                  *(_QWORD *)&buf[4] = v91;
                  v85 = "Failed to write zip64 end record locator: %s";
                  goto LABEL_137;
                }
              }
            }
            else
            {
              v82 = *v60;
              v83 = SZGetLoggingHandle();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
              {
                v84 = strerror(v82);
                *(_DWORD *)buf = 136315138;
                *(_QWORD *)&buf[4] = v84;
                v85 = "Failed to write zip64 end record: %s";
                goto LABEL_137;
              }
            }
            v9 = 0;
LABEL_139:
            free(v58);
            free(v55);
            return v9;
          }
          GenericHashUpdate((uint64_t)buf, v70, v88);
          v86 -= v88;
          if (v86 < 0)
            __assert_rtn("ZipStreamWritePartialHashForLastChunk", "ZipStream.c", 1048, "remaining >= 0");
        }
        v87 = (char *)(v76 + 30);
        GenericHashFinal(v138, (uint64_t)buf);
        v110 = (*(uint64_t (**)(_QWORD, char *, _QWORD))(*(_QWORD *)(v140 + 8) + 64))(*(_QWORD *)(*(_QWORD *)(v140 + 8) + 80), v77, 0);
        v111 = __error();
        if (v77 != (char *)v110)
        {
          v98 = v70;
          v120 = *v111;
          v121 = SZGetLoggingHandle();
          if (!os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
            goto LABEL_166;
          *(_DWORD *)v142 = 134218242;
          v143 = v77;
          v144 = 2080;
          v145 = strerror(v120);
          v101 = "Failed to seek to digest offset %llu in fixed metadata: %s";
          v108 = v121;
          v109 = 22;
          goto LABEL_146;
        }
        *v111 = 0;
        if (v72 == (*(uint64_t (**)(_QWORD, unsigned __int8 *, size_t))(*(_QWORD *)(v140 + 8) + 48))(*(_QWORD *)(*(_QWORD *)(v140 + 8) + 80), v138, v72))
        {
          v10 = v140;
          if (v87 == (char *)(*(uint64_t (**)(_QWORD, char *, _QWORD))(*(_QWORD *)(v140 + 8) + 64))(*(_QWORD *)(*(_QWORD *)(v140 + 8) + 80), v87, 0))
          {
            v112 = crc32(0, 0, 0);
            v113 = *(_QWORD *)(a3 + 48);
            while (v113 >= 1)
            {
              if ((unint64_t)v113 >= 0x400000)
                v114 = 0x400000;
              else
                v114 = v113;
              v115 = (*(uint64_t (**)(_QWORD, void *, uint64_t))(*(_QWORD *)(v10 + 8) + 56))(*(_QWORD *)(*(_QWORD *)(v10 + 8) + 80), v70, v114);
              v116 = v70;
              if (v115 != v114)
              {
                v128 = (char *)v115;
                v129 = *__error();
                v130 = SZGetLoggingHandle();
                if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v142 = 134218498;
                  v143 = (char *)v114;
                  v144 = 2048;
                  v145 = v128;
                  v146 = 2080;
                  v147 = strerror(v129);
                  _os_log_error_impl(&dword_1D4E55000, v130, OS_LOG_TYPE_ERROR, "Expected to read %ld bytes, but only got %ld bytes from outfile: %s", v142, 0x20u);
                }
                v16 = 0;
                v9 = 0;
                a1 = v139;
                v70 = v116;
                goto LABEL_168;
              }
              v112 = crc32(v112, (const Bytef *)v70, v114);
              v113 -= v114;
              v10 = v140;
              if (v113 < 0)
                __assert_rtn("ZipStreamWritePartialHashForLastChunk", "ZipStream.c", 1089, "remaining >= 0");
            }
            v98 = v70;
            *(_DWORD *)(a3 + 32) = v112;
            if (v75 == (char *)(*(uint64_t (**)(_QWORD, char *, _QWORD))(*(_QWORD *)(v10 + 8) + 64))(*(_QWORD *)(*(_QWORD *)(v10 + 8) + 80), v75, 0))
            {
              v127 = CreateAndWriteLocalFileRecord(a3, *(_QWORD *)(v10 + 8));
              if (v127)
              {
                free(v127);
                *((_DWORD *)v137 + 7) = *(_DWORD *)(a3 + 32);
                if ((*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v140 + 8) + 64))(*(_QWORD *)(*(_QWORD *)(v140 + 8) + 80), v135, 0) == v135)
                {
                  v16 = 1;
                  v9 = 1;
                  goto LABEL_167;
                }
                v133 = *__error();
                v100 = SZGetLoggingHandle();
                if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v142 = 136315138;
                  v143 = strerror(v133);
                  v101 = "Failed to seek to the beginning of the central directory: %s";
                  goto LABEL_145;
                }
                goto LABEL_166;
              }
              v132 = SZGetLoggingHandle();
              if (!os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
                goto LABEL_166;
              *(_WORD *)v142 = 0;
              v101 = "Failed to write updated fixed metadata LF record";
              v108 = v132;
              v109 = 2;
              goto LABEL_146;
            }
            v131 = *__error();
            v125 = SZGetLoggingHandle();
            if (!os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
              goto LABEL_184;
            *(_DWORD *)v142 = 134218242;
            v143 = v75;
            v144 = 2080;
            v145 = strerror(v131);
            v126 = "Failed to seek to fixed metadata LF header at offset %llu: %s";
          }
          else
          {
            v98 = v70;
            v124 = *__error();
            v125 = SZGetLoggingHandle();
            if (!os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
            {
LABEL_184:
              v16 = 0;
              v9 = 0;
              v123 = v138;
              a1 = v139;
              v70 = v98;
              goto LABEL_169;
            }
            *(_DWORD *)v142 = 134218242;
            v143 = v87;
            v144 = 2080;
            v145 = strerror(v124);
            v126 = "Failed to seek to beginning of fixed metadata file data %llu: %s";
          }
          _os_log_error_impl(&dword_1D4E55000, v125, OS_LOG_TYPE_ERROR, v126, v142, 0x16u);
          goto LABEL_184;
        }
        v98 = v70;
        v122 = *__error();
        v100 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
          goto LABEL_166;
        *(_DWORD *)v142 = 136315138;
        v143 = strerror(v122);
        v101 = "Failed to write digest to fixed metadata: %s";
      }
      else
      {
        v98 = v70;
        v107 = *__error();
        v100 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
          goto LABEL_166;
        *(_DWORD *)v142 = 136315138;
        v143 = strerror(v107);
        v101 = "Failed to seek to start of last partial chunk before CD: %s";
      }
    }
    else
    {
      v98 = v70;
      v99 = *__error();
      v100 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
        goto LABEL_166;
      *(_DWORD *)v142 = 136315138;
      v143 = strerror(v99);
      v101 = "Failed to write out first CD record signature: %s";
    }
LABEL_145:
    v108 = v100;
    v109 = 12;
LABEL_146:
    _os_log_error_impl(&dword_1D4E55000, v108, OS_LOG_TYPE_ERROR, v101, v142, v109);
LABEL_166:
    v16 = 0;
    v9 = 0;
LABEL_167:
    a1 = v139;
    v70 = v98;
    goto LABEL_168;
  }
  if ((*(uint64_t (**)(uint64_t, void *, uint64_t))(v6 + 48))(v7, &kCDRecordSignature, 4) == 4)
  {
    v8 = SZGetLoggingHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D4E55000, v8, OS_LOG_TYPE_DEBUG, "Wrote central directory header to trigger stream end", buf, 2u);
    }
    return 1;
  }
  else
  {
    v61 = *__error();
    v62 = SZGetLoggingHandle();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = strerror(v61);
      _os_log_error_impl(&dword_1D4E55000, v62, OS_LOG_TYPE_ERROR, "Failed to write central directory record signature: %s", buf, 0xCu);
    }
    return 0;
  }
}

uint64_t ZipStreamConfigureOutput(_QWORD *a1, char a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  NSObject *v9;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)a1;
  if (v2 != 1)
  {
    v5 = SZGetLoggingHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v11[0] = 67109120;
      v11[1] = v2;
      v6 = "Only version 1 of callbacks struct is supported; you specified %hhu";
      v7 = v5;
      v8 = 8;
LABEL_15:
      _os_log_error_impl(&dword_1D4E55000, v7, OS_LOG_TYPE_ERROR, v6, (uint8_t *)v11, v8);
    }
    return 0;
  }
  v3 = a1[5];
  if (!v3)
  {
    if (a1[6] && (a1[7] && a1[8] && a1[12] || a2) && a1[9])
      return 1;
    v9 = SZGetLoggingHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11[0]) = 0;
      v6 = "Must specify either outFILE or appropriate output contexts in configuration struct. HINT: you must specify wr"
           "ite and tell callbacks for non-seakable output; you must specify all for seekable output.";
      v7 = v9;
      v8 = 2;
      goto LABEL_15;
    }
    return 0;
  }
  a1[6] = ZipStreamFILEWriteCallback;
  a1[7] = ZipStreamFILEReadCallback;
  a1[8] = ZipStreamFILESeekCallback;
  a1[9] = ZipStreamFILETellCallback;
  a1[10] = v3;
  a1[11] = ZipStreamFILEFlushCallback;
  v4 = 1;
  a1[12] = ZipStreamFILETruncateCallback;
  return v4;
}

size_t ZipStreamFILEWriteCallback(FILE *__stream, void *__ptr, size_t a3)
{
  size_t v3;
  NSObject *v4;
  __int16 v6[8];

  v3 = a3;
  if (fwrite(__ptr, 1uLL, a3, __stream) != a3)
    return -1;
  if ((v3 & 0x8000000000000000) != 0)
  {
    v4 = SZGetLoggingHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6[0] = 0;
      _os_log_error_impl(&dword_1D4E55000, v4, OS_LOG_TYPE_ERROR, "fwrite returned result > INTPTR_MAX and so is not representable as a ssize_t", (uint8_t *)v6, 2u);
    }
    return -1;
  }
  return v3;
}

size_t ZipStreamFILEReadCallback(FILE *__stream, void *__ptr, size_t a3)
{
  size_t v3;
  NSObject *v4;
  __int16 v6[8];

  v3 = a3;
  if (fread(__ptr, 1uLL, a3, __stream) != a3)
    return -1;
  if ((v3 & 0x8000000000000000) != 0)
  {
    v4 = SZGetLoggingHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6[0] = 0;
      _os_log_error_impl(&dword_1D4E55000, v4, OS_LOG_TYPE_ERROR, "fread returned result > INTPTR_MAX and so is not representable as a ssize_t", (uint8_t *)v6, 2u);
    }
    return -1;
  }
  return v3;
}

off_t ZipStreamFILESeekCallback(FILE *__stream, off_t a2, int a3)
{
  if ((a2 || a3 != 1) && fseeko(__stream, a2, a3) == -1)
    return -1;
  else
    return ftello(__stream);
}

uint64_t ZipStreamFILETruncateCallback(FILE *a1, off_t a2)
{
  int v3;

  v3 = fileno(a1);
  return ftruncate(v3, a2);
}

void ZipStreamCallPreflightResultCallback(uint64_t a1, uint64_t a2, uint64_t a3, __int16 a4)
{
  const __CFAllocator *v5;
  CFNumberRef v6;
  CFNumberRef v7;
  CFNumberRef v8;
  CFDictionaryRef v9;
  __int16 v10;
  uint64_t v11;
  uint64_t valuePtr;
  void *values[3];
  void *keys[4];

  keys[3] = *(void **)MEMORY[0x1E0C80C00];
  v11 = a3;
  valuePtr = a2;
  v10 = a4;
  if (*(_QWORD *)(a1 + 8))
  {
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt64Type, &valuePtr);
    v7 = CFNumberCreate(v5, kCFNumberSInt64Type, &v11);
    v8 = CFNumberCreate(v5, kCFNumberSInt16Type, &v10);
    keys[0] = CFSTR("PreflightResultTotalFileCount");
    keys[1] = CFSTR("PreflightResultTotalFileSize");
    keys[2] = CFSTR("PreflightTargetPathMode");
    values[0] = v6;
    values[1] = v7;
    values[2] = v8;
    v9 = CFDictionaryCreate(v5, (const void **)keys, (const void **)values, 3, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    (*(void (**)(CFDictionaryRef, _QWORD))(a1 + 8))(v9, *(_QWORD *)(a1 + 16));
    CFRelease(v6);
    CFRelease(v7);
    CFRelease(v8);
    CFRelease(v9);
  }
}

_WORD *CreateMutableLocalFileRecord(uint64_t a1)
{
  _WORD *v2;
  unsigned __int16 *InfoZipExtraFieldFromLF;
  time_t v4;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;

  v2 = malloc_type_calloc(1uLL, 0x50uLL, 0x1010040BDAC2CBCuLL);
  *v2 = *(_WORD *)(a1 + 4);
  v2[1] = *(_WORD *)(a1 + 6);
  v2[2] = *(_WORD *)(a1 + 8);
  InfoZipExtraFieldFromLF = GetInfoZipExtraFieldFromLF(a1);
  if (!InfoZipExtraFieldFromLF)
  {
    v4 = DOS2UNIXTime(*(_DWORD *)(a1 + 10));
    *((_QWORD *)v2 + 1) = v4;
    *((_QWORD *)v2 + 2) = v4;
    goto LABEL_5;
  }
  *((_QWORD *)v2 + 1) = *((unsigned int *)InfoZipExtraFieldFromLF + 1);
  *((_QWORD *)v2 + 2) = *((unsigned int *)InfoZipExtraFieldFromLF + 2);
  if (InfoZipExtraFieldFromLF[1] < 0xCu)
  {
LABEL_5:
    *((_DWORD *)v2 + 6) = -1;
    goto LABEL_6;
  }
  v2[12] = InfoZipExtraFieldFromLF[6];
  v2[13] = InfoZipExtraFieldFromLF[7];
LABEL_6:
  *((_BYTE *)v2 + 30) = *(_BYTE *)(*(unsigned __int16 *)(a1 + 26) + a1 + 29) == 47;
  *((_DWORD *)v2 + 8) = *(_DWORD *)(a1 + 14);
  v11 = 0;
  v12 = 0;
  v5 = *(unsigned int *)(a1 + 18);
  if ((_DWORD)v5 != -1)
  {
    LODWORD(v6) = *(_DWORD *)(a1 + 22);
    if ((_DWORD)v6 != -1)
      goto LABEL_11;
  }
  if (!GetZip64ExtraFieldDataFromLF(a1, &v11, &v12))
  {
    LODWORD(v6) = *(_DWORD *)(a1 + 22);
LABEL_11:
    v6 = v6;
    v11 = v6;
    v12 = v5;
    goto LABEL_12;
  }
  v6 = v11;
  v5 = v12;
LABEL_12:
  *((_QWORD *)v2 + 5) = v5;
  *((_QWORD *)v2 + 6) = v6;
  v2[32] = *(_WORD *)(a1 + 28);
  v7 = *(unsigned __int16 *)(a1 + 26);
  v8 = malloc_type_calloc(v7 + 1, 1uLL, 0xCB3B20E1uLL);
  memcpy(v8, (const void *)(a1 + 30), v7);
  *((_QWORD *)v2 + 7) = v8;
  v9 = malloc_type_malloc(*(unsigned __int16 *)(a1 + 28), 0xCD3ECFDCuLL);
  *((_QWORD *)v2 + 9) = v9;
  memcpy(v9, (const void *)(a1 + 30 + *(unsigned __int16 *)(a1 + 26)), *(unsigned __int16 *)(a1 + 28));
  return v2;
}

void DestroyMutableLocalFileRecord(void **a1)
{
  if (a1)
  {
    free(a1[7]);
    free(a1[9]);
    free(a1);
  }
}

uint64_t _GetExtraFieldOfLength(unsigned __int16 *a1, unsigned __int16 *a2, unsigned int a3, _QWORD *a4)
{
  unsigned int v8;
  _WORD *ExtraFieldWithSignature;
  unsigned __int16 v10;
  unsigned __int16 v11;
  size_t v12;
  uint64_t v13;

  v8 = *a1;
  ExtraFieldWithSignature = GetExtraFieldWithSignature(*((_QWORD *)a1 + 1), *a1, a2);
  if (ExtraFieldWithSignature)
  {
    v10 = ExtraFieldWithSignature[1];
    if ((unsigned __int16)(a3 - 1) < v10)
      goto LABEL_13;
    v11 = v10 + 4;
    if (v8 > (unsigned __int16)(v10 + 4))
    {
      memmove(ExtraFieldWithSignature, (char *)ExtraFieldWithSignature + (unsigned __int16)(v10 + 4), (unsigned __int16)(v10 + 4));
      v8 = *a1;
    }
    if (v8 < v11)
      __assert_rtn("_RemoveExtraField", "MutableZipStructure.c", 81, "fieldLength <= extraInfo->length");
    LOWORD(v8) = v8 - v11;
    *a1 = v8;
  }
  if (a3)
  {
    v12 = a3 + (unint64_t)(unsigned __int16)v8 + 4;
    if (v12 >> 16)
    {
      ExtraFieldWithSignature = 0;
LABEL_14:
      v13 = 0;
      goto LABEL_15;
    }
    ExtraFieldWithSignature = reallocf(*((void **)a1 + 1), v12);
    *((_QWORD *)a1 + 1) = ExtraFieldWithSignature;
    if (!ExtraFieldWithSignature)
      goto LABEL_14;
    ExtraFieldWithSignature = (_WORD *)((char *)ExtraFieldWithSignature + *a1);
    *a1 = v12;
    *ExtraFieldWithSignature = *a2;
    ExtraFieldWithSignature[1] = a3;
  }
  else
  {
    ExtraFieldWithSignature = 0;
  }
LABEL_13:
  v13 = 1;
LABEL_15:
  *a4 = ExtraFieldWithSignature;
  return v13;
}

char *CreateAndWriteLocalFileRecord(uint64_t a1, uint64_t a2)
{
  int v4;
  unsigned int v5;
  unsigned __int16 *v6;
  uint64_t v7;
  char *v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  size_t v13;
  size_t v14;
  char *v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;
  BOOL v19;
  char *v20;
  char *v21;
  char v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;

  v26 = 0;
  if (*(_QWORD *)(a1 + 40) <= 0xFFFFFFFEuLL && *(_QWORD *)(a1 + 48) < 0xFFFFFFFFuLL)
  {
    v5 = 0;
    v4 = 1;
  }
  else
  {
    v4 = 0;
    v5 = 16;
  }
  v6 = (unsigned __int16 *)(a1 + 64);
  if (_GetExtraFieldOfLength((unsigned __int16 *)(a1 + 64), &kZip64ExtraFieldSignature, v5, &v26))
  {
    v7 = v26;
    if (v26)
    {
      *(_QWORD *)(v26 + 4) = *(_QWORD *)(a1 + 48);
      *(_QWORD *)(v7 + 12) = *(_QWORD *)(a1 + 40);
    }
    v26 = 0;
    v8 = 0;
    if (_GetExtraFieldOfLength((unsigned __int16 *)(a1 + 64), &kStreamingZipLFExtraFieldSignature, 2 * (*(_WORD *)(a1 + 28) != 0), &v26))
    {
      if (v26)
        *(_WORD *)(v26 + 4) = *(_WORD *)(a1 + 28);
      v9 = 8 * (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a1 + 8));
      if (*(__int16 *)(a1 + 24) != -1 && *(unsigned __int16 *)(a1 + 26) != 0xFFFF)
        v9 = 12;
      v26 = 0;
      v8 = 0;
      if (_GetExtraFieldOfLength((unsigned __int16 *)(a1 + 64), &kInfoZipExtraFieldSignature, v9, &v26))
      {
        v10 = v26;
        if (v26)
        {
          v11 = *(_QWORD *)(a1 + 8);
          if (v11 > 0xFFFFFFFE)
            LODWORD(v11) = -1;
          *(_DWORD *)(v26 + 4) = v11;
          v12 = *(_QWORD *)(a1 + 16);
          if (v12 > 0xFFFFFFFE)
            LODWORD(v12) = -1;
          *(_DWORD *)(v10 + 8) = v12;
          if (v9 == 12)
          {
            *(_WORD *)(v10 + 12) = *(_WORD *)(a1 + 24);
            *(_WORD *)(v10 + 14) = *(_WORD *)(a1 + 26);
          }
        }
        v13 = strlen(*(const char **)(a1 + 56));
        if (v13 >= 0x10000)
          __assert_rtn("CreateLocalFileRecordFromMutable", "MutableZipStructure.c", 188, "file_name_length <= UINT16_MAX");
        v14 = v13;
        v15 = (char *)malloc_type_malloc(v13 + *v6 + 30, 0x270560D7uLL);
        v8 = v15;
        *(_DWORD *)v15 = 67324752;
        if (v4)
          v16 = *(_WORD *)a1;
        else
          v16 = 45;
        *((_WORD *)v15 + 2) = v16;
        *((_WORD *)v15 + 3) = *(_WORD *)(a1 + 2);
        *((_WORD *)v15 + 4) = *(_WORD *)(a1 + 4);
        *(_DWORD *)(v15 + 10) = UNIX2DOSTime(*(_QWORD *)(a1 + 16));
        v23 = v4 ^ 1;
        if ((*(_WORD *)(a1 + 2) & 8) == 0)
          v23 = 1;
        if ((v23 & 1) != 0 || !*(_WORD *)(a1 + 4))
        {
          *(_DWORD *)(v8 + 14) = *(_DWORD *)(a1 + 32);
          v25 = *(_QWORD *)(a1 + 40);
          if (v25 >= 0xFFFFFFFF)
            LODWORD(v25) = -1;
          *(_DWORD *)(v8 + 18) = v25;
          v24 = *(_QWORD *)(a1 + 48);
          if (v24 >= 0xFFFFFFFF)
            LODWORD(v24) = -1;
        }
        else
        {
          LODWORD(v24) = 0;
          *(_QWORD *)(v8 + 14) = 0;
        }
        *(_DWORD *)(v8 + 22) = v24;
        *((_WORD *)v8 + 13) = v14;
        memcpy(v8 + 30, *(const void **)(a1 + 56), v14);
        if (!strcmp(*(const char **)(a1 + 56), "mimetype"))
        {
          *((_WORD *)v8 + 14) = 0;
        }
        else
        {
          *((_WORD *)v8 + 14) = *(_WORD *)(a1 + 64);
          memcpy(&v8[v14 + 30], *(const void **)(a1 + 72), *(unsigned __int16 *)(a1 + 64));
        }
      }
    }
  }
  else
  {
    v8 = 0;
  }
  v17 = *((unsigned __int16 *)v8 + 13) + (unint64_t)*((unsigned __int16 *)v8 + 14) + 30;
  v18 = (*(uint64_t (**)(_QWORD, char *, unint64_t))(a2 + 48))(*(_QWORD *)(a2 + 80), v8, v17);
  v19 = v18 == v17;
  if (v18 == v17)
    v20 = 0;
  else
    v20 = v8;
  if (v19)
    v21 = v8;
  else
    v21 = 0;
  free(v20);
  return v21;
}

_WORD *CreateMutableCDRecord(uint64_t a1)
{
  _WORD *v2;
  unsigned __int16 *ExtraFieldWithSignature;
  time_t v4;
  int v5;
  int v6;
  uint64_t v7;
  unsigned __int16 *v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned __int16 *v12;
  uint64_t v13;
  unsigned __int16 *v14;
  int v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v2 = malloc_type_calloc(1uLL, 0x68uLL, 0x1010040E435E96EuLL);
  *v2 = *(_WORD *)(a1 + 4);
  v2[1] = *(_WORD *)(a1 + 6);
  v2[2] = *(_WORD *)(a1 + 8);
  v2[3] = *(_WORD *)(a1 + 10);
  if (*(_WORD *)(a1 + 30)
    && (ExtraFieldWithSignature = GetExtraFieldWithSignature(a1 + *(unsigned __int16 *)(a1 + 28) + 46, *(unsigned __int16 *)(a1 + 30), &kInfoZipExtraFieldSignature)) != 0&& ExtraFieldWithSignature[1] >= 8u)
  {
    *((_QWORD *)v2 + 2) = *((unsigned int *)ExtraFieldWithSignature + 2);
    v4 = *((unsigned int *)ExtraFieldWithSignature + 1);
  }
  else
  {
    v4 = DOS2UNIXTime(*(_DWORD *)(a1 + 12));
    *((_QWORD *)v2 + 2) = v4;
  }
  *((_QWORD *)v2 + 1) = v4;
  if (*(_BYTE *)(a1 + 5) != 3 && *(_BYTE *)(a1 + 5)
    || (v5 = HIWORD(*(_DWORD *)(a1 + 38)), v6 = v5 & 0xF000, v6 != 0x4000) && v6 != 40960 && v6 != 0x8000
    || !v5)
  {
    if (*(_BYTE *)(*(unsigned __int16 *)(a1 + 28) + a1 + 45) == 47)
      LOWORD(v5) = 16893;
    else
      LOWORD(v5) = -32332;
  }
  v2[12] = v5 & 0xF1FF;
  *((_BYTE *)v2 + 26) = *(_BYTE *)(*(unsigned __int16 *)(a1 + 28) + a1 + 45) == 47;
  *((_DWORD *)v2 + 7) = *(_DWORD *)(a1 + 16);
  v7 = *(unsigned int *)(a1 + 20);
  if ((_DWORD)v7 == -1)
  {
    if (*(_WORD *)(a1 + 30)
      && (v8 = GetExtraFieldWithSignature(a1 + *(unsigned __int16 *)(a1 + 28) + 46, *(unsigned __int16 *)(a1 + 30), &kZip64ExtraFieldSignature)) != 0&& ((v9 = *(_DWORD *)(a1 + 24), v9 != -1) ? (v10 = 8) : (v10 = 16), v10 <= v8[1]))
    {
      v7 = *(_QWORD *)&v8[4 * (v9 == -1) + 2];
    }
    else
    {
      v7 = 0xFFFFFFFFLL;
    }
  }
  *((_QWORD *)v2 + 4) = v7;
  v11 = *(unsigned int *)(a1 + 24);
  if ((_DWORD)v11 == -1)
  {
    if (*(_WORD *)(a1 + 30)
      && (v12 = GetExtraFieldWithSignature(a1 + *(unsigned __int16 *)(a1 + 28) + 46, *(unsigned __int16 *)(a1 + 30), &kZip64ExtraFieldSignature)) != 0&& v12[1] >= 8u)
    {
      v11 = *(_QWORD *)(v12 + 2);
    }
    else
    {
      v11 = 0xFFFFFFFFLL;
    }
  }
  *((_QWORD *)v2 + 5) = v11;
  v2[44] = *(_WORD *)(a1 + 30);
  v2[24] = *(_WORD *)(a1 + 32);
  *((_DWORD *)v2 + 13) = *(unsigned __int16 *)(a1 + 34);
  v2[28] = *(_WORD *)(a1 + 36);
  v13 = *(unsigned int *)(a1 + 42);
  if ((_DWORD)v13 == -1)
  {
    if (!*(_WORD *)(a1 + 30))
      goto LABEL_39;
    v14 = GetExtraFieldWithSignature(a1 + *(unsigned __int16 *)(a1 + 28) + 46, *(unsigned __int16 *)(a1 + 30), &kZip64ExtraFieldSignature);
    if (!v14)
      goto LABEL_39;
    v16 = *(_DWORD *)(a1 + 20);
    v15 = *(_DWORD *)(a1 + 24);
    if (v15 == -1)
      v17 = 16;
    else
      v17 = 8;
    if (v16 == -1)
      v17 += 8;
    if (v14[1] >= v17)
    {
      LODWORD(v18) = 8 * (v15 == -1);
      if (v16 == -1)
        v18 = (v18 + 8);
      else
        v18 = v18;
      v13 = *(_QWORD *)((char *)v14 + v18 + 4);
    }
    else
    {
LABEL_39:
      v13 = 0xFFFFFFFFLL;
    }
  }
  *((_QWORD *)v2 + 8) = v13;
  v19 = malloc_type_calloc(*(unsigned __int16 *)(a1 + 28) + 1, 1uLL, 0xB4C978A6uLL);
  memcpy(v19, (const void *)(a1 + 46), *(unsigned __int16 *)(a1 + 28));
  *((_QWORD *)v2 + 9) = v19;
  v20 = malloc_type_malloc(*(unsigned __int16 *)(a1 + 30), 0x955D5096uLL);
  *((_QWORD *)v2 + 12) = v20;
  memcpy(v20, (const void *)(a1 + 46 + *(unsigned __int16 *)(a1 + 28)), *(unsigned __int16 *)(a1 + 30));
  v21 = malloc_type_malloc(*(unsigned __int16 *)(a1 + 32), 0x5D785B4EuLL);
  *((_QWORD *)v2 + 10) = v21;
  memcpy(v21, (const void *)(a1 + 46 + *(unsigned __int16 *)(a1 + 32) + *(unsigned __int16 *)(a1 + 30)), *(unsigned __int16 *)(a1 + 32));
  return v2;
}

void DestroyMutableCDRecord(void **a1)
{
  if (a1)
  {
    free(a1[9]);
    free(a1[12]);
    free(a1[10]);
    free(a1);
  }
}

uint64_t _ReadOriginalCentralDirectory(uint64_t a1, void ****a2, size_t *a3, _QWORD *a4, size_t *a5, size_t *a6, _WORD *a7, _WORD *a8)
{
  size_t v11;
  const __CFAllocator *v12;
  const __CFDictionary *Mutable;
  uint64_t v14;
  size_t v15;
  off_t v16;
  _DWORD *v17;
  _DWORD *v18;
  size_t v19;
  _DWORD *v20;
  off_t v21;
  off_t v22;
  _WORD *MutableCDRecord;
  char v24;
  unint64_t v25;
  unint64_t v26;
  const char *v27;
  size_t *v28;
  unint64_t v29;
  const __CFDictionary *v30;
  char *v31;
  __CFDictionary *v32;
  const __CFDictionary *v33;
  __int16 v34;
  __int16 v35;
  uint64_t v36;
  NSObject *v37;
  void ***v38;
  const __CFDictionary *v39;
  NSObject *v40;
  NSObject *v41;
  const char *v42;
  NSObject *v43;
  const char *v44;
  NSObject *v45;
  int v46;
  int v47;
  int v48;
  NSObject *v49;
  uint32_t v50;
  int v51;
  NSObject *v52;
  void ***v53;
  size_t *v55;
  size_t *v61;
  void ***v62;
  const __CFDictionary *theDict;
  __int128 context;
  int v65;
  __int16 v66;
  int v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v11 = *(_QWORD *)(a1 + 16);
  v62 = (void ***)malloc_type_calloc(v11, 8uLL, 0x2004093837F09uLL);
  v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
  theDict = CFDictionaryCreateMutable(v12, 0, 0, 0);
  v14 = 0;
  v15 = 0;
  v61 = a5;
  *a5 = -1;
  v55 = a6;
  *a6 = -1;
  do
  {
    while (1)
    {
      if (v15 >= v11)
      {
        v37 = SZGetLoggingHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          LODWORD(context) = 134217984;
          *(_QWORD *)((char *)&context + 4) = v11;
          _os_log_error_impl(&dword_1D4E55000, v37, OS_LOG_TYPE_ERROR, "Too many CD records found in file; expected %llu",
            (uint8_t *)&context,
            0xCu);
        }
        v38 = v62;
        if (v11)
          goto LABEL_54;
        goto LABEL_58;
      }
      v16 = *(_QWORD *)(a1 + 48);
      if (v16 == -1)
      {
        v16 = *(_QWORD *)(a1 + 32);
        *(_QWORD *)(a1 + 48) = v16;
        *(_QWORD *)(a1 + 24) = 0;
      }
      if (fseeko(*(FILE **)a1, v16, 0))
      {
        v39 = Mutable;
        v40 = SZGetLoggingHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          LOWORD(context) = 0;
          _os_log_error_impl(&dword_1D4E55000, v40, OS_LOG_TYPE_ERROR, "Failed to seek to central directory record", (uint8_t *)&context, 2u);
        }
        v18 = 0;
LABEL_49:
        v51 = 4;
LABEL_50:
        v38 = v62;
LABEL_51:
        *(_QWORD *)(a1 + 48) = -1;
        *(_QWORD *)(a1 + 24) = 0;
        free(v18);
        v52 = SZGetLoggingHandle();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          LODWORD(context) = 67109120;
          DWORD1(context) = v51;
          _os_log_error_impl(&dword_1D4E55000, v52, OS_LOG_TYPE_ERROR, "CopyNextCDRecord returned error %d", (uint8_t *)&context, 8u);
        }
        Mutable = v39;
LABEL_54:
        v53 = v38;
        do
        {
          if (*v53)
            DestroyMutableCDRecord(*v53);
          ++v53;
          --v11;
        }
        while (v11);
LABEL_58:
        free(v38);
        v36 = 0;
        goto LABEL_59;
      }
      v17 = malloc_type_malloc(0x2EuLL, 0x10000401E1C372CuLL);
      if (!v17)
      {
        v39 = Mutable;
        v41 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
LABEL_44:
          v18 = 0;
          v51 = 3;
          goto LABEL_50;
        }
        LOWORD(context) = 0;
        v42 = "Failed to allocate record";
LABEL_61:
        _os_log_error_impl(&dword_1D4E55000, v41, OS_LOG_TYPE_ERROR, v42, (uint8_t *)&context, 2u);
        goto LABEL_44;
      }
      v18 = v17;
      if (fread(v17, 1uLL, 0x2EuLL, *(FILE **)a1) != 46)
      {
        v43 = SZGetLoggingHandle();
        v38 = v62;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v39 = Mutable;
          LOWORD(context) = 0;
          v44 = "Failed to read central directory record";
LABEL_63:
          v49 = v43;
          v50 = 2;
          goto LABEL_64;
        }
LABEL_46:
        v39 = Mutable;
LABEL_47:
        free(v18);
        v18 = 0;
        v51 = 4;
        goto LABEL_51;
      }
      if (*v18 != 33639248)
      {
        v45 = SZGetLoggingHandle();
        v38 = v62;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v39 = Mutable;
          v46 = *((unsigned __int8 *)v18 + 1);
          v47 = *((unsigned __int8 *)v18 + 2);
          v48 = *((unsigned __int8 *)v18 + 3);
          *(_QWORD *)&context = __PAIR64__(*(unsigned __int8 *)v18, 67109888);
          WORD4(context) = 1024;
          *(_DWORD *)((char *)&context + 10) = v46;
          HIWORD(context) = 1024;
          v65 = v47;
          v66 = 1024;
          v67 = v48;
          v44 = "Found invalid central directory record with signature 0x%02hhx%02hhx%02hhx%02hhx";
          v49 = v45;
          v50 = 26;
LABEL_64:
          _os_log_error_impl(&dword_1D4E55000, v49, OS_LOG_TYPE_ERROR, v44, (uint8_t *)&context, v50);
          goto LABEL_47;
        }
        goto LABEL_46;
      }
      v19 = *((unsigned __int16 *)v18 + 15)
          + (unint64_t)*((unsigned __int16 *)v18 + 14)
          + *((unsigned __int16 *)v18 + 16);
      v20 = reallocf(v18, v19 + 46);
      if (!v20)
      {
        v39 = Mutable;
        v41 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          goto LABEL_44;
        LOWORD(context) = 0;
        v42 = "Failed to allocate full central directory record";
        goto LABEL_61;
      }
      v18 = v20;
      if (v19 != fread((char *)v20 + 46, 1uLL, v19, *(FILE **)a1))
      {
        v43 = SZGetLoggingHandle();
        v38 = v62;
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          goto LABEL_46;
        v39 = Mutable;
        LOWORD(context) = 0;
        v44 = "Failed to read in variable-length portion of central directory record";
        goto LABEL_63;
      }
      v21 = ftello(*(FILE **)a1);
      *(_QWORD *)(a1 + 48) = v21;
      v22 = *(_QWORD *)(a1 + 40) + *(_QWORD *)(a1 + 32);
      if (v22 == v21)
      {
        *(_QWORD *)(a1 + 48) = -1;
        *(_QWORD *)(a1 + 24) = 0;
        MutableCDRecord = CreateMutableCDRecord((uint64_t)v18);
        v24 = 1;
      }
      else
      {
        if (v21 > v22)
        {
          v39 = Mutable;
          goto LABEL_49;
        }
        v25 = *(_QWORD *)(a1 + 16);
        v26 = *(_QWORD *)(a1 + 24) + 1;
        *(_QWORD *)(a1 + 24) = v26;
        if (v26 > v25)
          __assert_rtn("CopyNextCDRecord", "ParseZipFile.c", 496, "ctx->cd_records_processed <= ctx->total_cd_records");
        MutableCDRecord = CreateMutableCDRecord((uint64_t)v18);
        v24 = 0;
      }
      free(v18);
      v27 = (const char *)*((_QWORD *)MutableCDRecord + 9);
      if (!strcmp("META-INF/", v27))
      {
        v28 = v61;
LABEL_24:
        *v28 = v15;
        break;
      }
      if (!strcmp("mimetype", v27))
      {
        v28 = v55;
        goto LABEL_24;
      }
      if (strcmp("META-INF/com.apple.ZipMetadata.plist", v27) && strcmp("META-INF/com.apple.FixedZipMetadata.bin", v27))
        break;
      DestroyMutableCDRecord((void **)MutableCDRecord);
      --v11;
      if ((v24 & 1) != 0)
        goto LABEL_28;
    }
    v62[v15++] = (void **)MutableCDRecord;
    v29 = (unsigned __int16)MutableCDRecord[12];
    v30 = Mutable;
    if (*((_BYTE *)MutableCDRecord + 26))
      Mutable = theDict;
    v31 = (char *)CFDictionaryGetValue(Mutable, (const void *)(unsigned __int16)MutableCDRecord[12]) + 1;
    v32 = Mutable;
    Mutable = v30;
    CFDictionarySetValue(v32, (const void *)v29, v31);
    v14 += *((_QWORD *)MutableCDRecord + 5);
  }
  while ((v24 & 1) == 0);
LABEL_28:
  if (v15 != v11)
    __assert_rtn("_ReadOriginalCentralDirectory", "ConvertZipToStream.c", 245, "cdIndex == origCDRecordCount");
  context = 0uLL;
  CFDictionaryApplyFunction(Mutable, (CFDictionaryApplierFunction)_FindHighestCount, &context);
  v33 = Mutable;
  v34 = WORD4(context);
  context = 0uLL;
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_FindHighestCount, &context);
  v35 = WORD4(context);
  *a2 = v62;
  *a3 = v11;
  *a4 = v14;
  *a7 = v34;
  Mutable = v33;
  *a8 = v35;
  v36 = 1;
LABEL_59:
  CFRelease(Mutable);
  CFRelease(theDict);
  return v36;
}

uint64_t _SortZipEntries(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  BOOL v5;
  const char *v6;
  const char *v7;
  char *v8;
  char *v9;
  char *v10;
  const char *v11;
  const char *v12;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  if (!(*a1 | *a2))
    return 0;
  if (v2)
    v4 = 1;
  else
    v4 = v3 == 0;
  if (!v4)
    return 0xFFFFFFFFLL;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 0;
  if (v5)
    return 1;
  v6 = *(const char **)(v2 + 72);
  v7 = *(const char **)(v3 + 72);
  result = _SortLateIfPrefix(v6, v7, "__MACOSX/", 9uLL);
  if (!(_DWORD)result)
  {
    v8 = rindex(v6, 47);
    v9 = rindex(v7, 47);
    v10 = v9;
    if (v8)
      *v8 = 0;
    if (v9)
      *v9 = 0;
    if (strcmp(v6, v7)
      || (v8 ? (v11 = v8 + 1) : (v11 = v6),
          v10 ? (v12 = v10 + 1) : (v12 = v7),
          result = _SortLateIfPrefix(v11, v12, "._", 2uLL),
          !(_DWORD)result))
    {
      if (v8)
        *v8 = 47;
      if (v10)
        *v10 = 47;
      return strcmp(v6, v7);
    }
  }
  return result;
}

BOOL _GetCDIndexOfBundleExecutableForInfoPlist(FILE **a1, uint64_t a2, unint64_t a3, uint64_t a4, _QWORD *a5)
{
  char *v5;
  size_t v6;
  NSObject *v7;
  UInt8 *v8;
  compression_stream *v9;
  void **v10;
  const __CFData *v11;
  const __CFDictionary *v12;
  const __CFString *v13;
  CFStringRef v14;
  BOOL v15;
  _WORD *v21;
  uint64_t *v22;
  BOOL v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  NSObject *v28;
  int v29;
  int v30;
  int v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  int v36;
  NSObject *v37;
  size_t v38;
  const __CFAllocator *v39;
  const __CFData *v40;
  const __CFDictionary *v41;
  CFTypeID TypeID;
  char *v43;
  char *v44;
  CFStringRef v45;
  const void *Value;
  const void *v47;
  const __CFString *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v54;
  NSObject *v55;
  const char *v56;
  NSObject *v57;
  const char *v58;
  NSObject *v59;
  uint32_t v60;
  NSObject *v61;
  NSObject *v62;
  uint64_t v63;
  CFTypeID v64;
  UInt8 *bytes;
  uint8_t v66[8];
  size_t v67;
  CFErrorRef error;
  int v69;
  uint8_t buf[4];
  char *v71;
  __int16 v72;
  size_t v73;
  __int16 v74;
  size_t v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v5 = *(char **)(a4 + 72);
  v69 = 0;
  error = 0;
  v6 = *(_QWORD *)(a4 + 40);
  if (v6 < 0x40000001)
  {
    bytes = (UInt8 *)malloc_type_malloc(*(_QWORD *)(a4 + 40), 0x1CCC7DF3uLL);
    v21 = CopyLocalFileHeader(a1, a4, &v69);
    if (!v21)
    {
      v28 = SZGetLoggingHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v71 = v5;
        v72 = 1024;
        LODWORD(v73) = v69;
        _os_log_error_impl(&dword_1D4E55000, v28, OS_LOG_TYPE_ERROR, "Failed to get local file record for info plist %s: %d", buf, 0x12u);
      }
      v9 = 0;
      v10 = 0;
      goto LABEL_43;
    }
    v10 = (void **)v21;
    v22 = (uint64_t *)OpenLocalFile((uint64_t)a1, a4, *((char **)v21 + 7), v21[32], 0, &v69);
    v9 = (compression_stream *)v22;
    if (v22)
      v23 = v69 == 0;
    else
      v23 = 0;
    if (!v23)
    {
      v24 = SZGetLoggingHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v25 = "Failed to open plist file in zip archive";
        v26 = v24;
        v27 = 2;
LABEL_21:
        _os_log_error_impl(&dword_1D4E55000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
        goto LABEL_43;
      }
      goto LABEL_43;
    }
    v67 = 0;
    v29 = ReadLocalFileData(v22, bytes, v6, &v67);
    if (v29 != 2)
    {
      v36 = v29;
      v37 = SZGetLoggingHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v71 = v5;
        v72 = 1024;
        LODWORD(v73) = v36;
        v25 = "Failed to read file data for info plist %s: %d";
        v26 = v37;
        v27 = 18;
        goto LABEL_21;
      }
LABEL_43:
      v11 = 0;
LABEL_44:
      v12 = 0;
LABEL_45:
      v13 = 0;
      v14 = 0;
      goto LABEL_46;
    }
    v30 = CloseLocalFile(v9);
    v69 = v30;
    if (v30)
    {
      v31 = v30;
      v32 = SZGetLoggingHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v71) = v31;
        v33 = "Failed to close local file: %d";
        v34 = v32;
        v35 = 8;
LABEL_41:
        _os_log_error_impl(&dword_1D4E55000, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);
        goto LABEL_42;
      }
      goto LABEL_42;
    }
    v38 = v67;
    if (v67 != v6)
    {
      v51 = SZGetLoggingHandle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v71 = v5;
        v72 = 2048;
        v73 = v38;
        v74 = 2048;
        v75 = v6;
        v33 = "Failed to read full info plist %s; read %ld bytes; expected %lld bytes";
        v34 = v51;
        v35 = 32;
        goto LABEL_41;
      }
LABEL_42:
      v9 = 0;
      goto LABEL_43;
    }
    v39 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v40 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], bytes, v6, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
    if (!v40)
    {
      v52 = SZGetLoggingHandle();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v33 = "Failed to create data from uncompressed bytes";
        v34 = v52;
        v35 = 2;
        goto LABEL_41;
      }
      goto LABEL_42;
    }
    v11 = v40;
    v41 = (const __CFDictionary *)CFPropertyListCreateWithData(v39, v40, 0, 0, &error);
    if (!v41)
    {
      v54 = SZGetLoggingHandle();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v71 = v5;
        _os_log_error_impl(&dword_1D4E55000, v54, OS_LOG_TYPE_ERROR, "Failed to deserialize Info plist %s", buf, 0xCu);
      }
      v9 = 0;
      goto LABEL_44;
    }
    v12 = v41;
    TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v12))
    {
      v43 = strrchr(v5, 47);
      if (v43)
      {
        *v43 = 0;
        v44 = v43;
        v45 = CFStringCreateWithFileSystemRepresentation(v39, v5);
        *v44 = 47;
        if (v45)
        {
          v14 = v45;
          Value = CFDictionaryGetValue(v12, (const void *)*MEMORY[0x1E0C9AE70]);
          if (Value)
          {
            v47 = Value;
            v64 = CFStringGetTypeID();
            if (v64 == CFGetTypeID(v47))
            {
              v48 = CFStringCreateWithFormat(v39, 0, CFSTR("%@/%@"), v14, v47);
              if (v48)
              {
                v13 = v48;
                if (CFStringGetFileSystemRepresentation(v48, (char *)buf, 1024))
                {
                  v49 = 0;
                  v15 = 1;
                  while (1)
                  {
                    v50 = *(_QWORD *)(a2 + 8 * v49);
                    if (v50)
                    {
                      if (!strcmp(*(const char **)(v50 + 72), (const char *)buf))
                        break;
                    }
                    v15 = ++v49 < a3;
                    if (a3 == v49)
                      goto LABEL_82;
                  }
                  v63 = v49;
                  v9 = 0;
                  *a5 = v63;
                  goto LABEL_47;
                }
                v62 = SZGetLoggingHandle();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)v66 = 0;
                  _os_log_error_impl(&dword_1D4E55000, v62, OS_LOG_TYPE_ERROR, "Failed to convert CF executable path string to C string", v66, 2u);
                }
LABEL_82:
                v9 = 0;
LABEL_46:
                v15 = 0;
LABEL_47:
                v8 = bytes;
                goto LABEL_48;
              }
              v61 = SZGetLoggingHandle();
              if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
              {
LABEL_79:
                v9 = 0;
                v13 = 0;
                goto LABEL_46;
              }
              *(_WORD *)buf = 0;
              v58 = "Failed to construct path to bundle executable";
              v59 = v61;
              v60 = 2;
LABEL_77:
              _os_log_error_impl(&dword_1D4E55000, v59, OS_LOG_TYPE_ERROR, v58, buf, v60);
              goto LABEL_79;
            }
            v57 = SZGetLoggingHandle();
            if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
              goto LABEL_79;
            *(_DWORD *)buf = 136315138;
            v71 = v5;
            v58 = "CFBundleExecutable was not a CFString for plist %s";
          }
          else
          {
            v57 = SZGetLoggingHandle();
            if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
              goto LABEL_79;
            *(_DWORD *)buf = 136315138;
            v71 = v5;
            v58 = "Plist %s did not contain a value for kCFBundleExecutableKey";
          }
          v59 = v57;
          v60 = 12;
          goto LABEL_77;
        }
        v55 = SZGetLoggingHandle();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v71 = v5;
          v56 = "Failed to create CF string from plist path %s";
          goto LABEL_70;
        }
LABEL_71:
        v9 = 0;
        goto LABEL_45;
      }
      v55 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        goto LABEL_71;
      *(_DWORD *)buf = 136315138;
      v71 = v5;
      v56 = "Failed to find last slash in plist path %s";
    }
    else
    {
      v55 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        goto LABEL_71;
      *(_DWORD *)buf = 136315138;
      v71 = v5;
      v56 = "Plist %s did not contain a dictionary";
    }
LABEL_70:
    _os_log_error_impl(&dword_1D4E55000, v55, OS_LOG_TYPE_ERROR, v56, buf, 0xCu);
    goto LABEL_71;
  }
  v7 = SZGetLoggingHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v71 = v5;
    _os_log_error_impl(&dword_1D4E55000, v7, OS_LOG_TYPE_ERROR, "Found plist at %s greater than 1 GB in size; something must be wrong.",
      buf,
      0xCu);
  }
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
LABEL_48:
  free(v8);
  DestroyMutableLocalFileRecord(v10);
  if (v11)
    CFRelease(v11);
  if (v12)
    CFRelease(v12);
  if (error)
    CFRelease(error);
  error = 0;
  if (v14)
    CFRelease(v14);
  if (v13)
    CFRelease(v13);
  if (v9)
    CloseLocalFile(v9);
  return v15;
}

uint64_t _SortLateIfPrefix(const char *a1, const char *a2, char *__s2, size_t __n)
{
  _BOOL4 v7;
  int v8;
  int v9;
  unsigned int v10;

  v7 = strncmp(a1, __s2, __n) == 0;
  v8 = strncmp(a2, __s2, __n);
  if (v8)
    v9 = 1;
  else
    v9 = v7;
  v10 = v9 - 1;
  if (v7 && v8 != 0)
    return 1;
  else
    return v10;
}

void _AddIndexToDictionary(const void *a1, uint64_t a2, __CFDictionary *a3)
{
  CFNumberRef v6;
  NSObject *v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a2 != -1)
  {
    if (a2 < 0)
    {
      v7 = SZGetLoggingHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v8 = 134217984;
        *(_QWORD *)&v8[4] = a2;
        _os_log_error_impl(&dword_1D4E55000, v7, OS_LOG_TYPE_ERROR, "can't represent index %llu as an SInt64\n", v8, 0xCu);
      }
    }
    else
    {
      *(_QWORD *)v8 = a2;
      v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt64Type, v8);
      CFDictionarySetValue(a3, a1, v6);
      CFRelease(v6);
    }
  }
}

uint64_t _Prescan(char *a1, const __CFArray *a2, _WORD *a3, _WORD *a4, _QWORD *a5, _QWORD *a6)
{
  const __CFAllocator *v11;
  const __CFDictionary *Mutable;
  const __CFDictionary *v13;
  FTS *v14;
  FTSENT *v15;
  FTSENT *v16;
  unsigned int fts_info;
  char *v18;
  int v19;
  const void *st_mode;
  char *Value;
  CFStringRef v22;
  int v23;
  NSObject *v24;
  int *v25;
  char *v26;
  NSObject *v27;
  const char *v28;
  uint32_t v29;
  NSObject *v30;
  CFStringRef v31;
  NSObject *v32;
  void *v33;
  const __CFData *v34;
  int v35;
  void *v36;
  off_t v37;
  const __CFData *v38;
  const __CFDictionary *v39;
  const __CFDictionary *v40;
  char *v41;
  char *v42;
  CFStringRef v43;
  const void *v44;
  const void *v45;
  CFTypeID v46;
  NSObject *v47;
  int *v48;
  char *v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  off_t v54;
  int *v55;
  char *v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *v59;
  const char *v60;
  NSObject *v61;
  uint32_t v62;
  NSObject *v63;
  const char *v64;
  NSObject *v65;
  NSObject *v66;
  int *v67;
  char *v68;
  const char *v69;
  NSObject *v70;
  int *v71;
  char *v72;
  NSObject *v73;
  uint32_t v74;
  char *fts_path;
  char *v76;
  _QWORD *v77;
  __int16 v78;
  __int16 v79;
  NSObject *v80;
  uint64_t v81;
  NSObject *v82;
  int v84;
  void *v85;
  CFStringRef v86;
  const __CFDictionary *cf;
  int v88;
  const __CFString *v89;
  CFStringRef v90;
  CFTypeRef TypeID;
  const __CFDictionary *v92;
  const __CFDictionary *v93;
  _QWORD *v94;
  char *buffer;
  void *key;
  const __CFAllocator *bytesDeallocator;
  _WORD *v98;
  uint64_t v99;
  uint64_t v100;
  size_t v102;
  char v103;
  CFTypeRef v104;
  stat v105;
  char *v106[2];
  int buf;
  off_t st_size;
  __int16 v109;
  char *v110;
  __int16 v111;
  char *v112;
  char __str[1032];
  uint64_t v114;
  CFRange v115;

  v114 = *MEMORY[0x1E0C80C00];
  v106[0] = a1;
  v106[1] = 0;
  v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
  v13 = CFDictionaryCreateMutable(v11, 0, 0, 0);
  v102 = strlen(a1);
  v14 = fts_open(v106, 84, 0);
  if (v14)
  {
    v98 = a4;
    v99 = 0;
    v100 = 0;
    key = (void *)*MEMORY[0x1E0C9AE70];
    bytesDeallocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE20];
    while (1)
    {
      do
      {
        while (1)
        {
          v15 = fts_read(v14);
          if (!v15)
          {
            if (*__error())
            {
              v70 = SZGetLoggingHandle();
              if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                goto LABEL_103;
              v71 = __error();
              v72 = strerror(*v71);
              *(_DWORD *)__str = 136315138;
              *(_QWORD *)&__str[4] = v72;
              v69 = "fts_read returned NULL and set errno: %s";
              v73 = v70;
              v74 = 12;
              goto LABEL_97;
            }
            *(_QWORD *)__str = 0;
            *(_QWORD *)&__str[8] = 0;
            CFDictionaryApplyFunction(Mutable, (CFDictionaryApplierFunction)_FindHighestCount, __str);
            v77 = a6;
            v78 = *(_WORD *)&__str[8];
            *(_QWORD *)__str = 0;
            *(_QWORD *)&__str[8] = 0;
            CFDictionaryApplyFunction(v13, (CFDictionaryApplierFunction)_FindHighestCount, __str);
            v79 = *(_WORD *)&__str[8];
            *a3 = v78;
            *v98 = v79;
            *a5 = v100;
            *v77 = v99;
            v80 = SZGetLoggingHandle();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)__str = 134217984;
              *(_QWORD *)&__str[4] = v100;
              _os_log_debug_impl(&dword_1D4E55000, v80, OS_LOG_TYPE_DEBUG, "Prescan says record count should be %llu", (uint8_t *)__str, 0xCu);
            }
            v81 = 1;
            if (Mutable)
              goto LABEL_104;
            goto LABEL_105;
          }
          v16 = v15;
          fts_info = v15->fts_info;
          if (fts_info > 0xD)
            goto LABEL_102;
          if (((1 << fts_info) & 0x3102) != 0)
            break;
          if (fts_info != 6)
          {
            if (((1 << fts_info) & 0x490) != 0)
            {
              v66 = SZGetLoggingHandle();
              if (!os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                goto LABEL_103;
              fts_path = v16->fts_path;
              v76 = strerror(v16->fts_errno);
              *(_DWORD *)__str = 136315394;
              *(_QWORD *)&__str[4] = fts_path;
              *(_WORD *)&__str[12] = 2080;
              *(_QWORD *)&__str[14] = v76;
              v69 = "fts_read gave error for file %s: %s";
              goto LABEL_96;
            }
LABEL_102:
            v82 = SZGetLoggingHandle();
            if (!os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
              goto LABEL_103;
            v84 = v16->fts_info;
            *(_DWORD *)__str = 67109120;
            *(_DWORD *)&__str[4] = v84;
            v69 = "fts_read returned unhandled fts_info value %d";
            v73 = v82;
            v74 = 8;
            goto LABEL_97;
          }
        }
      }
      while (!v15->fts_level);
      buffer = _CopyArchivePath((uint64_t)v15->fts_path, v102, v15->fts_statp->st_mode);
      if ((_IsExcludedFileName(buffer) & 1) != 0)
      {
        v18 = buffer;
        goto LABEL_45;
      }
      v93 = Mutable;
      v94 = a6;
      v19 = v16->fts_info;
      if (v19 == 1)
        Mutable = v13;
      st_mode = (const void *)v16->fts_statp->st_mode;
      Value = (char *)CFDictionaryGetValue(Mutable, st_mode);
      CFDictionarySetValue(Mutable, st_mode, Value + 1);
      v92 = v13;
      if (v19 != 1)
        v99 += v16->fts_statp->st_size;
      v18 = buffer;
      v22 = CFStringCreateWithFileSystemRepresentation(v11, buffer);
      v115.length = CFArrayGetCount(a2);
      v115.location = 0;
      Mutable = v93;
      a6 = v94;
      if (!CFArrayContainsValue(a2, v115, v22))
      {
        v103 = 0;
        if (ZipStreamShouldOrderFileEarly(buffer, &v103))
        {
          CFArrayAppendValue(a2, v22);
          if (v103)
            break;
        }
      }
LABEL_42:
      if (v22)
        CFRelease(v22);
      ++v100;
      v13 = v92;
LABEL_45:
      free(v18);
    }
    v89 = v22;
    bzero(__str, 0x400uLL);
    memset(&v105, 0, sizeof(v105));
    v104 = 0;
    snprintf(__str, 0x400uLL, "%s/%s", a1, buffer);
    v23 = open(__str, 0, 0);
    if (v23 < 0)
    {
      v30 = SZGetLoggingHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v48 = __error();
        v49 = strerror(*v48);
        buf = 136315394;
        st_size = (off_t)__str;
        v109 = 2080;
        v110 = v49;
        _os_log_error_impl(&dword_1D4E55000, v30, OS_LOG_TYPE_ERROR, "Failed to open Info.plist at path %s: %s", (uint8_t *)&buf, 0x16u);
      }
      v90 = 0;
      v31 = 0;
      v18 = buffer;
      goto LABEL_35;
    }
    v88 = v23;
    if (fstat(v23, &v105))
    {
      v24 = SZGetLoggingHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = __error();
        v26 = strerror(*v25);
        buf = 136315394;
        st_size = (off_t)__str;
        v109 = 2080;
        v110 = v26;
        v27 = v24;
        v28 = "Failed to stat Info.plist at path %s: %s";
        v29 = 22;
LABEL_28:
        _os_log_error_impl(&dword_1D4E55000, v27, OS_LOG_TYPE_ERROR, v28, (uint8_t *)&buf, v29);
        goto LABEL_29;
      }
      goto LABEL_29;
    }
    if (v105.st_size >= 524288000)
    {
      v32 = SZGetLoggingHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        buf = 134217984;
        st_size = v105.st_size;
        v27 = v32;
        v28 = "Found Info.plist but it was too big (larger than 500 MB): was %lld bytes";
        v29 = 12;
        goto LABEL_28;
      }
LABEL_29:
      v33 = 0;
      v34 = 0;
      v86 = 0;
      cf = 0;
      v90 = 0;
      v35 = v88;
LABEL_30:
      close(v35);
      free(v33);
      v18 = buffer;
      if (v34)
        CFRelease(v34);
      if (cf)
        CFRelease(cf);
      v31 = v86;
LABEL_35:
      if (v104)
        CFRelease(v104);
      v104 = 0;
      if (v31)
        CFRelease(v31);
      if (v90)
        CFRelease(v90);
      v22 = v89;
      goto LABEL_42;
    }
    v36 = malloc_type_malloc(v105.st_size, 0xB9D05B6CuLL);
    v37 = v105.st_size;
    if (v37 != read(v88, v36, v105.st_size))
    {
      v47 = SZGetLoggingHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v54 = v105.st_size;
        v55 = __error();
        v56 = strerror(*v55);
        buf = 134218498;
        st_size = v54;
        a6 = v94;
        v109 = 2080;
        v110 = __str;
        v111 = 2080;
        v112 = v56;
        _os_log_error_impl(&dword_1D4E55000, v47, OS_LOG_TYPE_ERROR, "Failed to read %lld bytes from Info.plist at path %s: %s", (uint8_t *)&buf, 0x20u);
      }
      v86 = 0;
      cf = 0;
      v90 = 0;
      v35 = v88;
      v33 = v36;
      v34 = 0;
      goto LABEL_30;
    }
    v85 = v36;
    v38 = CFDataCreateWithBytesNoCopy(v11, (const UInt8 *)v36, v105.st_size, bytesDeallocator);
    if (v38)
    {
      v34 = v38;
      v39 = (const __CFDictionary *)CFPropertyListCreateWithData(v11, v38, 0, 0, (CFErrorRef *)&v104);
      if (v39)
      {
        v40 = v39;
        TypeID = (CFTypeRef)CFDictionaryGetTypeID();
        cf = v40;
        if (TypeID == (CFTypeRef)CFGetTypeID(v40))
        {
          v41 = strrchr(buffer, 47);
          if (v41)
          {
            v42 = v41;
            *v41 = 0;
            v43 = CFStringCreateWithFileSystemRepresentation(v11, buffer);
            *v42 = 47;
            v86 = v43;
            if (!v43)
            {
              v57 = SZGetLoggingHandle();
              if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
              {
                v86 = 0;
                goto LABEL_80;
              }
              buf = 136315138;
              st_size = (off_t)__str;
              _os_log_error_impl(&dword_1D4E55000, v57, OS_LOG_TYPE_ERROR, "Failed to create CF string from plist path %s", (uint8_t *)&buf, 0xCu);
              v86 = 0;
LABEL_86:
              v90 = 0;
              Mutable = v93;
              goto LABEL_82;
            }
            v44 = CFDictionaryGetValue(v40, key);
            if (v44)
            {
              v45 = v44;
              v46 = CFStringGetTypeID();
              if (v46 == CFGetTypeID(v45))
              {
                v90 = CFStringCreateWithFormat(v11, 0, CFSTR("%@/%@"), v86, v45);
                if (v90)
                {
                  CFArrayAppendValue(a2, v90);
LABEL_81:
                  Mutable = v93;
LABEL_82:
                  a6 = v94;
                  goto LABEL_67;
                }
                v65 = SZGetLoggingHandle();
                if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                {
LABEL_80:
                  v90 = 0;
                  goto LABEL_81;
                }
                LOWORD(buf) = 0;
                v59 = v65;
                v60 = "Failed to construct path to bundle executable";
                v62 = 2;
                goto LABEL_77;
              }
              v61 = SZGetLoggingHandle();
              if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                goto LABEL_80;
              buf = 136315138;
              st_size = (off_t)__str;
              v59 = v61;
              v60 = "CFBundleExecutable was not a CFString for plist %s";
            }
            else
            {
              v58 = SZGetLoggingHandle();
              if (!os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
                goto LABEL_80;
              buf = 136315138;
              st_size = (off_t)__str;
              v59 = v58;
              v60 = "Plist %s did not contain a value for kCFBundleExecutableKey";
            }
            v62 = 12;
LABEL_77:
            _os_log_error_impl(&dword_1D4E55000, v59, OS_LOG_TYPE_ERROR, v60, (uint8_t *)&buf, v62);
            goto LABEL_86;
          }
          v53 = SZGetLoggingHandle();
          if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            v86 = 0;
            v90 = 0;
            goto LABEL_67;
          }
          buf = 136315138;
          st_size = (off_t)buffer;
          v63 = v53;
          v64 = "Failed to find last slash in plist path %s";
          goto LABEL_84;
        }
        v52 = SZGetLoggingHandle();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          buf = 136315138;
          st_size = (off_t)__str;
          v63 = v52;
          v64 = "Plist %s did not contain a dictionary";
LABEL_84:
          _os_log_error_impl(&dword_1D4E55000, v63, OS_LOG_TYPE_ERROR, v64, (uint8_t *)&buf, 0xCu);
        }
LABEL_66:
        v86 = 0;
        v90 = 0;
LABEL_67:
        v35 = v88;
        v33 = v85;
        goto LABEL_30;
      }
      v51 = SZGetLoggingHandle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        buf = 136315138;
        st_size = (off_t)__str;
        _os_log_error_impl(&dword_1D4E55000, v51, OS_LOG_TYPE_ERROR, "Failed to deserialize Info plist %s", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      v50 = SZGetLoggingHandle();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl(&dword_1D4E55000, v50, OS_LOG_TYPE_ERROR, "Failed to create data from malloc allocation", (uint8_t *)&buf, 2u);
      }
      v34 = 0;
    }
    cf = 0;
    goto LABEL_66;
  }
  v66 = SZGetLoggingHandle();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
  {
    v67 = __error();
    v68 = strerror(*v67);
    *(_DWORD *)__str = 136315394;
    *(_QWORD *)&__str[4] = a1;
    *(_WORD *)&__str[12] = 2080;
    *(_QWORD *)&__str[14] = v68;
    v69 = "fts_open failed for path %s: %s";
LABEL_96:
    v73 = v66;
    v74 = 22;
LABEL_97:
    _os_log_error_impl(&dword_1D4E55000, v73, OS_LOG_TYPE_ERROR, v69, (uint8_t *)__str, v74);
  }
LABEL_103:
  v81 = 0;
  if (Mutable)
LABEL_104:
    CFRelease(Mutable);
LABEL_105:
  if (v13)
    CFRelease(v13);
  if (v14)
    fts_close(v14);
  return v81;
}

uint64_t _WriteLocalFile(const char *a1, const char *a2, size_t a3, int a4, void *a5, void *a6, __int16 a7, __int16 a8, uint64_t a9, uint64_t a10, unsigned __int16 a11, unsigned __int16 a12, CFMutableArrayRef theArray)
{
  void **v20;
  void **v21;
  int v22;
  const __CFString *v23;
  char *v24;
  void *v25;
  const char *v26;
  int v27;
  int v28;
  char *v29;
  char *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  NSObject *v36;
  uint64_t v37;
  const char *v39;
  ssize_t v40;
  char v41;
  NSObject *v42;
  size_t v43;
  void *v44;
  NSObject *v45;
  int *v46;
  char *v47;
  int *v48;
  char *v49;
  NSObject *v50;
  const char *v51;
  NSObject *v52;
  uint32_t v53;
  NSObject *v54;
  int *v55;
  char *v56;
  void *value;
  void **v59;
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  size_t v63;
  __int16 v64;
  char *v65;
  char buffer[1024];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  value = 0;
  v20 = (void **)malloc_type_calloc(1uLL, 0x50uLL, 0x1010040BDAC2CBCuLL);
  v21 = v20;
  v59 = v20;
  *(_WORD *)v20 = 20;
  v20[1] = a5;
  v20[2] = a6;
  v22 = a4 & 0xF000;
  *((_WORD *)v20 + 12) = a7;
  *((_WORD *)v20 + 13) = a8;
  *((_BYTE *)v20 + 30) = v22 == 0x4000;
  if (v22 == 0x4000)
  {
    if (a4 != a12)
      *((_WORD *)v20 + 14) = a4;
  }
  else
  {
    if (a4 != a11)
      *((_WORD *)v20 + 14) = a4;
    if (v22 == 0x8000)
    {
      v20[5] = (void *)a3;
      v20[6] = (void *)a3;
    }
    else
    {
      v20[5] = 0;
      v20[6] = 0;
    }
  }
  *((_WORD *)v20 + 2) = 0;
  *((_DWORD *)v20 + 8) = 0;
  *((_WORD *)v20 + 1) |= 0x800u;
  v23 = CFStringCreateWithFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
  if (!CFStringGetCString(v23, buffer, 1024, 0x8000100u))
  {
    v32 = SZGetLoggingHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v61 = (uint64_t)a2;
      v33 = "Failed to get path %s as UTF8 string";
      v34 = v32;
      v35 = 12;
LABEL_51:
      _os_log_error_impl(&dword_1D4E55000, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  v21[7] = strdup(buffer);
  v24 = (char *)malloc_type_calloc(1uLL, 0x68uLL, 0x1010040E435E96EuLL);
  if (!v24)
  {
    value = 0;
    v36 = SZGetLoggingHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v33 = "Failed to create mutable CD record from LF record";
      v34 = v36;
      v35 = 2;
      goto LABEL_51;
    }
    goto LABEL_21;
  }
  v25 = v24;
  *(_WORD *)v24 = 798;
  *((_WORD *)v24 + 1) = *(_WORD *)v21;
  *((_DWORD *)v24 + 1) = *(_DWORD *)((char *)v21 + 2);
  *(_OWORD *)(v24 + 8) = *(_OWORD *)(v21 + 1);
  *((_WORD *)v24 + 12) = *((_WORD *)v21 + 14);
  v24[26] = *((_BYTE *)v21 + 30);
  *((_DWORD *)v24 + 7) = *((_DWORD *)v21 + 8);
  *((_OWORD *)v24 + 2) = *(_OWORD *)(v21 + 5);
  *((_QWORD *)v24 + 9) = strdup((const char *)v21[7]);
  value = v25;
  *((_WORD *)v25 + 12) = a4;
  if (v22 == 40960)
  {
    v39 = a1;
    v40 = readlink(a1, buffer, 0x400uLL);
    if (v40 < 0)
    {
      v45 = SZGetLoggingHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v46 = __error();
        v47 = strerror(*v46);
        *(_DWORD *)buf = 136315394;
        v61 = (uint64_t)v39;
        v62 = 2080;
        v63 = (size_t)v47;
        v33 = "Failed to read symlink destination for file \"%s\": %s";
LABEL_47:
        v34 = v45;
        v35 = 22;
        goto LABEL_51;
      }
LABEL_21:
      DestroyMutableLocalFileRecord(v21);
      goto LABEL_22;
    }
    v21[5] = (void *)v40;
    v21[6] = (void *)v40;
    v28 = -1;
    v31 = -1;
    v30 = buffer;
    *((_QWORD *)v25 + 4) = v40;
    *((_QWORD *)v25 + 5) = v40;
  }
  else if (v22 == 0x8000)
  {
    if (a3)
    {
      v26 = a1;
      v27 = open(a1, 0, 0);
      if ((v27 & 0x80000000) == 0)
      {
        v28 = v27;
        if (a3 == -1)
        {
          v50 = SZGetLoggingHandle();
          if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
LABEL_53:
            close(v28);
            goto LABEL_21;
          }
          *(_DWORD *)buf = 134218242;
          v61 = -1;
          v62 = 2080;
          v63 = (size_t)v26;
          v51 = "File with size %lld is to big to map: %s";
          v52 = v50;
          v53 = 22;
        }
        else
        {
          v29 = (char *)mmap(0, a3, 1, 1026, v27, 0);
          if (v29 != (char *)-1)
          {
            v30 = v29;
            v31 = (uint64_t)v29;
            goto LABEL_29;
          }
          v54 = SZGetLoggingHandle();
          if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            goto LABEL_53;
          v55 = __error();
          v56 = strerror(*v55);
          *(_DWORD *)buf = 136315650;
          v61 = (uint64_t)a1;
          v62 = 2048;
          v63 = a3;
          v64 = 2080;
          v65 = v56;
          v51 = "Failed to map file \"%s\" of size %llu: %s";
          v52 = v54;
          v53 = 32;
        }
        _os_log_error_impl(&dword_1D4E55000, v52, OS_LOG_TYPE_ERROR, v51, buf, v53);
        goto LABEL_53;
      }
      v45 = SZGetLoggingHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v48 = __error();
        v49 = strerror(*v48);
        *(_DWORD *)buf = 136315394;
        v61 = (uint64_t)v26;
        v62 = 2080;
        v63 = (size_t)v49;
        v33 = "Failed to open file: \"%s\" : %s";
        goto LABEL_47;
      }
      goto LABEL_21;
    }
    buffer[0] = 0;
    v28 = -1;
    v31 = -1;
    v30 = buffer;
  }
  else
  {
    v30 = 0;
    v28 = -1;
    v31 = -1;
  }
LABEL_29:
  v41 = ZipStreamWriteLocalFile(0, (uint64_t *)&value, &v59, (Bytef *)v30, 0, a11, a12, a9, a10);
  if ((v41 & 1) != 0)
  {
    if (*(_BYTE *)(a10 + 49))
      DestroyMutableCDRecord((void **)value);
    else
      CFArrayAppendValue(theArray, value);
    v43 = a3;
  }
  else
  {
    v42 = SZGetLoggingHandle();
    v43 = a3;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v44 = v59[7];
      *(_DWORD *)buf = 136315138;
      v61 = (uint64_t)v44;
      _os_log_error_impl(&dword_1D4E55000, v42, OS_LOG_TYPE_ERROR, "Failed to write local file named %s to archive", buf, 0xCu);
    }
  }
  if (v31 != -1)
    munmap((void *)v31, v43);
  if ((v28 & 0x80000000) == 0)
    close(v28);
  DestroyMutableLocalFileRecord(v59);
  if ((v41 & 1) != 0)
  {
    v37 = 1;
    if (!v23)
      return v37;
    goto LABEL_23;
  }
LABEL_22:
  DestroyMutableCDRecord((void **)value);
  v37 = 0;
  if (v23)
LABEL_23:
    CFRelease(v23);
  return v37;
}

char *_CopyArchivePath(uint64_t a1, uint64_t a2, __int16 a3)
{
  uint64_t v3;
  const char *v4;
  char *v6;

  if (*(_BYTE *)(a1 + a2) == 47)
    v3 = a2 + 1;
  else
    v3 = a2;
  v6 = 0;
  v4 = (const char *)(a1 + v3);
  if ((a3 & 0xF000) != 0x4000)
    return strdup(v4);
  asprintf(&v6, "%s/", v4);
  return v6;
}

uint64_t _IsExcludedFileName(char *__s2)
{
  NSObject *v3;
  int v4;
  char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (strcmp("META-INF/", __s2)
    && strcmp("META-INF/com.apple.ZipMetadata.plist", __s2)
    && strcmp("META-INF/com.apple.FixedZipMetadata.bin", __s2)
    && strcmp("mimetype", __s2))
  {
    return 0;
  }
  v3 = SZGetLoggingHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = __s2;
    _os_log_debug_impl(&dword_1D4E55000, v3, OS_LOG_TYPE_DEBUG, "Path %s is excluded", (uint8_t *)&v4, 0xCu);
  }
  return 1;
}

uint64_t _IsOrderedEarly(char *buffer, const __CFArray *a2)
{
  const __CFArray *v2;
  CFStringRef v4;
  NSObject *v5;
  int v7;
  char *v8;
  uint64_t v9;
  CFRange v10;

  v9 = *MEMORY[0x1E0C80C00];
  if (!a2)
    return 0;
  v2 = a2;
  v4 = CFStringCreateWithFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x1E0C9AE00], buffer);
  v10.length = CFArrayGetCount(v2);
  v10.location = 0;
  LODWORD(v2) = CFArrayContainsValue(v2, v10, v4);
  CFRelease(v4);
  if (!(_DWORD)v2)
    return 0;
  v5 = SZGetLoggingHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315138;
    v8 = buffer;
    _os_log_debug_impl(&dword_1D4E55000, v5, OS_LOG_TYPE_DEBUG, "Path %s was ordered early", (uint8_t *)&v7, 0xCu);
  }
  return 1;
}

unint64_t _FindHighestCount(unint64_t result, unint64_t a2, unint64_t *a3)
{
  if (*a3 < a2)
  {
    *a3 = a2;
    a3[1] = result;
  }
  return result;
}

CFArrayRef SZArchiverCopyStatsKeys()
{
  uint64_t v0;
  __CFString ***v1;
  __CFString **v2;
  _OWORD v4[13];
  uint64_t v5;

  v0 = 0;
  v5 = *MEMORY[0x1E0C80C00];
  v1 = &sStatsData;
  memset(v4, 0, sizeof(v4));
  do
  {
    v2 = *v1;
    v1 += 5;
    *(_QWORD *)((char *)v4 + v0) = *v2;
    v0 += 8;
  }
  while (v0 != 208);
  return CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)v4, 26, MEMORY[0x1E0C9B378]);
}

CFArrayRef SZArchiverCopyStatsDescriptions()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t Length;
  void *v3;
  uint64_t v4;
  char **v5;
  const __CFAllocator *v6;
  CFStringRef *v7;
  size_t v8;
  const char *v9;
  char *v10;
  CFArrayRef v11;
  uint64_t i;
  void *values[2];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v0 = 0;
  v1 = 0;
  v27 = *MEMORY[0x1E0C80C00];
  do
  {
    Length = CFStringGetLength(*(&sStatsData)[v0]);
    if (Length > v1)
      v1 = Length;
    v0 += 5;
  }
  while (v0 != 130);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  *(_OWORD *)values = 0u;
  v3 = malloc_type_malloc(v1 + 4, 0x8911849FuLL);
  v4 = 0;
  v5 = &off_1E98B0880;
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  do
  {
    v7 = (CFStringRef *)*(v5 - 4);
    v8 = v1 - CFStringGetLength(*v7) + 4;
    memset(v3, 32, v8);
    *((_BYTE *)v3 + v8) = 0;
    v9 = "CFNumber:uint64_t";
    if (v4 == 13)
      v9 = "CFNumber:int64_t";
    if (v4 == 14)
      v9 = "CFNumber:double";
    if (v4 == 21)
      v9 = "CFBoolean     ";
    v10 = *v5;
    v5 += 5;
    values[v4++] = (void *)CFStringCreateWithFormat(v6, 0, CFSTR("       %@%s%s\t%s"), *v7, v3, v9, v10, values[0], values[1], v15, v16, v17, v18, v19, v20, v21, v22, v23, v24,
                             v25,
                             v26,
                             v27);
  }
  while (v4 != 26);
  v11 = CFArrayCreate(v6, (const void **)values, 26, MEMORY[0x1E0C9B378]);
  for (i = 0; i != 26; ++i)
    CFRelease(values[i]);
  free(v3);
  return v11;
}

uint64_t SZArchiverConvertZipArchiveToStreamable(const char *a1, unsigned __int8 *a2, const __CFDictionary *a3, CFDictionaryRef *a4)
{
  uint64_t result;
  NSObject *v8;
  NSObject *v9;
  int *v10;
  char *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __CFArray *Mutable;
  const __CFArray *v23;
  size_t v24;
  void ***v25;
  void ***v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  CFIndex Count;
  int v31;
  int v32;
  _DWORD *CDRecord;
  _WORD *MutableCDRecord;
  char *LocalFileRecord;
  char *v36;
  const void **v37;
  uint64_t i;
  const void *v39;
  const char *v40;
  uint64_t v41;
  const void *v42;
  _QWORD *v43;
  NSObject *v44;
  NSObject *v45;
  const char *v46;
  NSObject *v47;
  uint32_t v48;
  NSObject *v49;
  CFIndex v50;
  _QWORD *ValueAtIndex;
  uint64_t v52;
  NSObject *v53;
  int v54;
  void ***p_MutableLocalFileRecord;
  Bytef *v56;
  NSObject *v57;
  CFIndex v58;
  char v59;
  void ***v60;
  size_t v61;
  void ***v62;
  CFIndex j;
  void **v64;
  uint64_t v65;
  unsigned int (*v66)(_QWORD);
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  NSObject *v70;
  const char *v71;
  NSObject *v72;
  int v73;
  NSObject *v74;
  char *v75;
  int v76;
  char *v77;
  int v78;
  char *v79;
  NSObject *v80;
  NSObject *v81;
  Bytef *v82;
  uint64_t v83;
  Bytef *v84;
  CFIndex v85;
  CFIndex v86;
  unsigned int v87;
  unsigned int v88;
  _OWORD v89[6];
  uint64_t v90;
  _OWORD v91[2];
  __int128 v92;
  __int128 v93;
  uint64_t v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  stat v108;
  int v109;
  void **v110;
  const void *v111;
  int v112;
  size_t v113;
  size_t v114;
  void **MutableLocalFileRecord;
  Bytef *v116;
  void **v117;
  void **v118;
  Bytef *v119;
  void **v120;
  void **v121;
  void ***v122;
  uint64_t v123;
  size_t v124;
  uint8_t buf[4];
  uint64_t v126;
  __int16 v127;
  CFIndex v128;
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v90 = 0;
  memset(v89, 0, sizeof(v89));
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v94 = 0;
  v92 = 0u;
  v93 = 0u;
  memset(v91, 0, sizeof(v91));
  result = _UpgradeCallbacksToCurrent(a2, (uint64_t)v89);
  if (!(_DWORD)result)
    return result;
  result = _ConvertOptionsToConfiguration(a3, (uint64_t)v91);
  if (!(_DWORD)result)
    return result;
  *((_QWORD *)&v91[0] + 1) = v89;
  memset(&v108, 0, sizeof(v108));
  if (!ZipStreamConfigureOutput(v89, SHIBYTE(v92)))
    goto LABEL_29;
  if (*(_QWORD *)&v91[0] && HIBYTE(v92))
  {
    v8 = SZGetLoggingHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D4E55000, v8, OS_LOG_TYPE_ERROR, "Ignoring hashed chunk size supplied because output seeking is disallowed.", buf, 2u);
    }
    *(_QWORD *)&v91[0] = 0;
  }
  if (lstat(a1, &v108))
  {
    v9 = SZGetLoggingHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = __error();
      v11 = strerror(*v10);
      *(_DWORD *)buf = 136315394;
      v126 = (uint64_t)a1;
      v127 = 2080;
      v128 = (CFIndex)v11;
      v12 = "Failed to stat %s : %s";
      v13 = v9;
      v14 = 22;
LABEL_28:
      _os_log_error_impl(&dword_1D4E55000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
      goto LABEL_29;
    }
    goto LABEL_29;
  }
  if ((v108.st_mode & 0xF000) != 0x8000)
  {
    v28 = SZGetLoggingHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v126 = (uint64_t)a1;
      v127 = 1024;
      LODWORD(v128) = v108.st_mode;
      v12 = "Object at input path %s was not a file; mode 0%ho";
      v13 = v28;
      v14 = 18;
      goto LABEL_28;
    }
LABEL_29:
    v16 = 0;
LABEL_30:
    CloseZipFile(v16);
    return 0;
  }
  v15 = OpenZipFile(a1, SBYTE14(v92));
  if (!v15)
  {
    v29 = SZGetLoggingHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v126 = (uint64_t)a1;
      v12 = "Failed to open zip file %s";
      v13 = v29;
      v14 = 12;
      goto LABEL_28;
    }
    goto LABEL_29;
  }
  v16 = (uint64_t)v15;
  ZipStreamCallPreflightResultCallback(*((uint64_t *)&v91[0] + 1), *(_QWORD *)(v16 + 16), *(_QWORD *)(v16 + 8), v108.st_mode);
  v123 = 0;
  v124 = 0;
  v121 = 0;
  v122 = 0;
  v119 = 0;
  v120 = 0;
  v117 = 0;
  v118 = 0;
  MutableLocalFileRecord = 0;
  v116 = 0;
  v113 = -1;
  v114 = -1;
  v112 = 0;
  if (!_ReadOriginalCentralDirectory(v16, &v122, &v124, &v123, &v114, &v113, (_WORD *)&v112 + 1, &v112))
  {
    v23 = 0;
    v21 = 0;
    goto LABEL_86;
  }
  v17 = v124;
  v18 = v114;
  v19 = 1;
  if (v114 == -1)
    v19 = 2;
  v20 = v19 + v124;
  if (*(_QWORD *)&v91[0])
    v21 = v20 + 1;
  else
    v21 = v20;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v124 + 3, 0);
  v23 = Mutable;
  v24 = v113;
  if (v113 != -1)
  {
    v25 = v122;
    CFArrayAppendValue(Mutable, v122[v113]);
    v25[v24] = 0;
  }
  if (v18 == -1)
  {
    Count = CFArrayGetCount(v23);
    v31 = time(0);
    v32 = time(0);
    CDRecord = CreateCDRecord("META-INF/", 16877, v31, v32);
    MutableCDRecord = CreateMutableCDRecord((uint64_t)CDRecord);
    CFArrayAppendValue(v23, MutableCDRecord);
    LocalFileRecord = CreateLocalFileRecord((uint64_t)CDRecord);
    MutableLocalFileRecord = (void **)CreateMutableLocalFileRecord((uint64_t)LocalFileRecord);
    v36 = LocalFileRecord;
    v27 = Count;
    free(v36);
    free(CDRecord);
  }
  else
  {
    v26 = v122;
    CFArrayAppendValue(v23, v122[v18]);
    v26[v18] = 0;
    v27 = -1;
  }
  v87 = (unsigned __int16)v112;
  v88 = HIWORD(v112);
  if (!ZipStreamConcoctStreamData(v21, v123, SHIWORD(v112), v112, (uint64_t)v91, &v121, &v120, &v119))
  {
    v45 = SZGetLoggingHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v46 = "Failed to concoct stream data";
LABEL_52:
      v47 = v45;
      v48 = 2;
LABEL_80:
      _os_log_error_impl(&dword_1D4E55000, v47, OS_LOG_TYPE_ERROR, v46, buf, v48);
    }
LABEL_86:
    v59 = 0;
    goto LABEL_87;
  }
  v86 = CFArrayGetCount(v23);
  CFArrayAppendValue(v23, v121);
  v121 = 0;
  v85 = -1;
  if (*(_QWORD *)&v91[0] && !HIBYTE(v92))
  {
    if (!ZipStreamConcoctFixedStreamData((uint64_t)v91, &v118, &v117, (const Bytef **)&v116))
    {
      v45 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        goto LABEL_86;
      *(_WORD *)buf = 0;
      v46 = "Failed to concoct fixed stream data";
      goto LABEL_52;
    }
    v85 = CFArrayGetCount(v23);
    CFArrayAppendValue(v23, v118);
    v118 = 0;
  }
  v37 = (const void **)v122;
  if (v17)
  {
    v83 = v27;
    for (i = 0; i != v17; ++i)
    {
      v39 = v37[i];
      if (v39)
      {
        v40 = (const char *)*((_QWORD *)v39 + 9);
        LOBYTE(v110) = 0;
        if (ZipStreamShouldOrderFileEarly(v40, &v110))
        {
          CFArrayAppendValue(v23, v37[i]);
          v41 = (uint64_t)v37[i];
          v37[i] = 0;
          if ((_BYTE)v110)
          {
            v111 = 0;
            if (_GetCDIndexOfBundleExecutableForInfoPlist((FILE **)v16, (uint64_t)v37, v17, v41, &v111))
            {
              v42 = v111;
              v43 = v37[(_QWORD)v111];
              *((_QWORD *)&v102 + 1) = v43[5];
              CFArrayAppendValue(v23, v43);
              v37[(_QWORD)v42] = 0;
            }
            else
            {
              v44 = SZGetLoggingHandle();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315138;
                v126 = (uint64_t)v40;
                _os_log_debug_impl(&dword_1D4E55000, v44, OS_LOG_TYPE_DEBUG, "Failed to find executable for bundle Info.plist %s", buf, 0xCu);
              }
            }
          }
        }
      }
    }
    qsort(v37, v17, 8uLL, (int (__cdecl *)(const void *, const void *))_SortZipEntries);
    v27 = v83;
    do
    {
      if (*v37)
      {
        CFArrayAppendValue(v23, *v37);
        *v37 = 0;
      }
      ++v37;
      --v17;
    }
    while (v17);
  }
  else
  {
    qsort(v122, 0, 8uLL, (int (__cdecl *)(const void *, const void *))_SortZipEntries);
  }
  v49 = SZGetLoggingHandle();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D4E55000, v49, OS_LOG_TYPE_DEBUG, "Writing local files", buf, 2u);
  }
  if (v21 != CFArrayGetCount(v23))
  {
    v57 = SZGetLoggingHandle();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      v58 = CFArrayGetCount(v23);
      *(_DWORD *)buf = 134218240;
      v126 = v21;
      v127 = 2048;
      v128 = v58;
      v46 = "Mismatched record count: expected %llu records, but we have %ld records";
      v47 = v57;
      v48 = 22;
      goto LABEL_80;
    }
    goto LABEL_86;
  }
  if (v21)
  {
    v50 = 0;
    v82 = v116;
    v84 = v119;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v23, v50);
      v110 = 0;
      v111 = ValueAtIndex;
      v109 = 0;
      v52 = ValueAtIndex[9];
      v53 = SZGetLoggingHandle();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v126 = v52;
        _os_log_debug_impl(&dword_1D4E55000, v53, OS_LOG_TYPE_DEBUG, "Processing file %s", buf, 0xCu);
      }
      if (v86 == v50)
      {
        v54 = 0;
        p_MutableLocalFileRecord = &v120;
        v56 = v84;
      }
      else if (v85 == v50)
      {
        v54 = 0;
        p_MutableLocalFileRecord = &v117;
        v56 = v82;
      }
      else if (v27 == v50)
      {
        v54 = 0;
        v56 = 0;
        p_MutableLocalFileRecord = &MutableLocalFileRecord;
      }
      else
      {
        v110 = (void **)CopyLocalFileHeader((FILE **)v16, (uint64_t)ValueAtIndex, &v109);
        if (!v110)
        {
          v81 = SZGetLoggingHandle();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v126) = v109;
            _os_log_error_impl(&dword_1D4E55000, v81, OS_LOG_TYPE_ERROR, "CopyLocalFileHeader returned error %d", buf, 8u);
          }
          goto LABEL_122;
        }
        v56 = 0;
        v54 = 1;
        p_MutableLocalFileRecord = &v110;
      }
      if ((ZipStreamWriteLocalFile(v16, (uint64_t *)&v111, p_MutableLocalFileRecord, v56, 0, v88, v87, (uint64_t)&v95, (uint64_t)v91) & 1) == 0)break;
      CFArraySetValueAtIndex(v23, v50, v111);
      if (v54)
        DestroyMutableLocalFileRecord(v110);
      if (v21 == ++v50)
        goto LABEL_83;
    }
    v80 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    {
      if (!v54)
        goto LABEL_122;
      goto LABEL_121;
    }
    *(_DWORD *)buf = 136315138;
    v126 = v52;
    _os_log_error_impl(&dword_1D4E55000, v80, OS_LOG_TYPE_ERROR, "Failed to write local file %s", buf, 0xCu);
    if (v54)
LABEL_121:
      free(v110);
LABEL_122:
    v59 = 0;
    goto LABEL_87;
  }
LABEL_83:
  if ((ZipStreamWriteCentralDirectoryAndEndRecords(v23, v85, (uint64_t)v117, (uint64_t)&v95, (uint64_t)v91) & 1) == 0)
  {
    v45 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_86;
    *(_WORD *)buf = 0;
    v46 = "Failed to finish writing archive.";
    goto LABEL_52;
  }
  v59 = 1;
LABEL_87:
  v60 = v122;
  if (v122)
  {
    v61 = v124;
    if (v124)
    {
      v62 = v122;
      do
      {
        if (*v62)
          DestroyMutableCDRecord(*v62);
        ++v62;
        --v61;
      }
      while (v61);
    }
    free(v60);
  }
  if (v23)
  {
    if (v21)
    {
      for (j = 0; j != v21; ++j)
      {
        v64 = (void **)CFArrayGetValueAtIndex(v23, j);
        DestroyMutableCDRecord(v64);
      }
    }
    CFRelease(v23);
  }
  DestroyMutableCDRecord(v121);
  DestroyMutableLocalFileRecord(v120);
  free(v119);
  DestroyMutableCDRecord(v118);
  DestroyMutableLocalFileRecord(v117);
  free(v116);
  DestroyMutableLocalFileRecord(MutableLocalFileRecord);
  if ((v59 & 1) == 0)
  {
    v70 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    *(_DWORD *)buf = 136315138;
    v126 = (uint64_t)a1;
    v71 = "Failed to process file %s";
    v72 = v70;
LABEL_118:
    _os_log_error_impl(&dword_1D4E55000, v72, OS_LOG_TYPE_ERROR, v71, buf, 0xCu);
    goto LABEL_30;
  }
  v65 = *((_QWORD *)&v91[0] + 1);
  v66 = *(unsigned int (**)(_QWORD))(*((_QWORD *)&v91[0] + 1) + 88);
  if (v66)
  {
    if (v66(*(_QWORD *)(*((_QWORD *)&v91[0] + 1) + 80)) == -1)
    {
      v76 = *__error();
      v74 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        goto LABEL_30;
      v77 = strerror(v76);
      *(_DWORD *)buf = 136315138;
      v126 = (uint64_t)v77;
      v71 = "Failed to flush output: %s";
      goto LABEL_117;
    }
    v65 = *((_QWORD *)&v91[0] + 1);
  }
  v67 = (*(uint64_t (**)(_QWORD))(v65 + 72))(*(_QWORD *)(v65 + 80));
  if (v67 < 0)
  {
    v73 = *__error();
    v74 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    v75 = strerror(v73);
    *(_DWORD *)buf = 136315138;
    v126 = (uint64_t)v75;
    v71 = "Failed to get offset in file at end of writing: %s";
    goto LABEL_117;
  }
  v68 = v67;
  if (!HIBYTE(v92)
    && (*(unsigned int (**)(_QWORD, uint64_t))(*((_QWORD *)&v91[0] + 1) + 96))(*(_QWORD *)(*((_QWORD *)&v91[0] + 1) + 80), v67))
  {
    v78 = *__error();
    v74 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    v79 = strerror(v78);
    *(_DWORD *)buf = 136315138;
    v126 = (uint64_t)v79;
    v71 = "Failed to truncate output: %s";
LABEL_117:
    v72 = v74;
    goto LABEL_118;
  }
  *((_QWORD *)&v96 + 1) = v68;
  v69 = *(_QWORD *)(v16 + 8);
  *((_QWORD *)&v106 + 1) = v68 - v69;
  *(double *)&v107 = (double)v68 / (double)v69 * 100.0;
  CloseZipFile(v16);
  if (a4)
    *a4 = _ConvertStatsToDict((uint64_t)&v95);
  return 1;
}

BOOL _UpgradeCallbacksToCurrent(unsigned __int8 *a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  _BOOL8 result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  NSObject *v13;
  int v14;
  _DWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*a1 == 1)
  {
    v8 = *(_OWORD *)a1;
    v9 = *((_OWORD *)a1 + 2);
    *(_OWORD *)(a2 + 16) = *((_OWORD *)a1 + 1);
    *(_OWORD *)(a2 + 32) = v9;
    *(_OWORD *)a2 = v8;
    v10 = *((_OWORD *)a1 + 3);
    v11 = *((_OWORD *)a1 + 4);
    v12 = *((_OWORD *)a1 + 5);
    *(_QWORD *)(a2 + 96) = *((_QWORD *)a1 + 12);
    *(_OWORD *)(a2 + 64) = v11;
    *(_OWORD *)(a2 + 80) = v12;
    *(_OWORD *)(a2 + 48) = v10;
    return 1;
  }
  else if (*a1)
  {
    v13 = SZGetLoggingHandle();
    result = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (result)
    {
      v14 = *a1;
      v15[0] = 67109120;
      v15[1] = v14;
      _os_log_error_impl(&dword_1D4E55000, v13, OS_LOG_TYPE_ERROR, "Don't know how to handle callbacks struct version %hhu", (uint8_t *)v15, 8u);
      return 0;
    }
  }
  else
  {
    v3 = *((_OWORD *)a1 + 1);
    *(_OWORD *)a2 = *(_OWORD *)a1;
    *(_OWORD *)(a2 + 16) = v3;
    v4 = *((_OWORD *)a1 + 2);
    v5 = *((_OWORD *)a1 + 4);
    v6 = *((_QWORD *)a1 + 10);
    *(_OWORD *)(a2 + 48) = *((_OWORD *)a1 + 3);
    *(_OWORD *)(a2 + 64) = v5;
    *(_OWORD *)(a2 + 32) = v4;
    result = 1;
    *(_BYTE *)a2 = 1;
    *(_QWORD *)(a2 + 88) = 0;
    *(_QWORD *)(a2 + 96) = 0;
    *(_QWORD *)(a2 + 80) = v6;
  }
  return result;
}

uint64_t _ConvertOptionsToConfiguration(const __CFDictionary *a1, uint64_t a2)
{
  const __CFNumber *Value;
  uint64_t result;
  const __CFString *v6;
  const __CFString *v7;
  int v8;
  const __CFNumber *v9;
  _DWORD *v10;
  const __CFString *v11;
  const __CFString *v12;
  char v13;
  const __CFString *v14;
  const __CFString *v15;
  int v16;
  const void *v17;

  Value = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("HashedChunkSize"));
  if (Value)
  {
    result = CFNumberGetValue(Value, kCFNumberLongLongType, (void *)a2);
    if (!(_DWORD)result)
      return result;
  }
  *(_QWORD *)(a2 + 16) = CFDictionaryGetValue(a1, CFSTR("CommandLineString"));
  *(_QWORD *)(a2 + 24) = CFDictionaryGetValue(a1, CFSTR("ExecutableUUID"));
  v6 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("CompressionOptions"));
  if (v6 && (v7 = v6, CFStringCompare(v6, CFSTR("ForceUncompressed"), 0)))
  {
    if (CFStringCompare(v7, CFSTR("PreserveCompression"), 0))
    {
      if (CFStringCompare(v7, CFSTR("TryRecompress"), 0))
      {
        if (CFStringCompare(v7, CFSTR("ForceCompressed"), 0))
          return 0;
        v8 = 3;
      }
      else
      {
        v8 = 2;
      }
    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }
  *(_DWORD *)(a2 + 32) = v8;
  v9 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("ZlibCompressionLevel"));
  v10 = (_DWORD *)(a2 + 40);
  if (v9)
  {
    result = CFNumberGetValue(v9, kCFNumberIntType, (void *)(a2 + 40));
    if (!(_DWORD)result)
      return result;
    if (*v10 > 9u)
      return 0;
  }
  else
  {
    *v10 = 9;
  }
  v11 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("HashType"));
  if (!v11)
    goto LABEL_31;
  v12 = v11;
  if (CFStringCompare(v11, CFSTR("MD5"), 0) == kCFCompareEqualTo)
  {
    v13 = 0;
    goto LABEL_30;
  }
  if (CFStringCompare(v12, CFSTR("SHA1"), 0) == kCFCompareEqualTo)
  {
    v13 = 1;
    goto LABEL_30;
  }
  if (CFStringCompare(v12, CFSTR("SHA224"), 0) == kCFCompareEqualTo)
  {
    v13 = 4;
    goto LABEL_30;
  }
  if (CFStringCompare(v12, CFSTR("SHA256"), 0) == kCFCompareEqualTo)
  {
    v13 = 5;
    goto LABEL_30;
  }
  if (CFStringCompare(v12, CFSTR("SHA384"), 0) == kCFCompareEqualTo)
  {
    v13 = 6;
    goto LABEL_30;
  }
  if (CFStringCompare(v12, CFSTR("SHA512"), 0))
    return 0;
  v13 = 7;
LABEL_30:
  *(_BYTE *)(a2 + 44) = v13;
LABEL_31:
  v14 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("CompressionMethod"));
  if (v14 && (v15 = v14, CFStringCompare(v14, CFSTR("DEFLATE"), 0)))
  {
    if (CFStringCompare(v15, CFSTR("LZFSE"), 0))
    {
      if (CFStringCompare(v15, CFSTR("LZMA"), 0))
        return 0;
      v16 = 14;
    }
    else
    {
      v16 = 99;
    }
  }
  else
  {
    v16 = 8;
  }
  *(_DWORD *)(a2 + 36) = v16;
  _FetchAndSetBoolean(a1, CFSTR("UncompressBloatedFiles"), (BOOL *)(a2 + 45), 1);
  _FetchAndSetBoolean(a1, CFSTR("NoCache"), (BOOL *)(a2 + 46), 0);
  _FetchAndSetBoolean(a1, CFSTR("NoSeekOutput"), (BOOL *)(a2 + 47), 0);
  _FetchAndSetBoolean(a1, CFSTR("SkipPrescan"), (BOOL *)(a2 + 48), 0);
  _FetchAndSetBoolean(a1, CFSTR("NoCentralDirectory"), (BOOL *)(a2 + 49), 0);
  v17 = CFDictionaryGetValue(a1, CFSTR("CustomPathOrdering"));
  if (v17)
    *(_BYTE *)(a2 + 48) = 1;
  *(_QWORD *)(a2 + 56) = v17;
  _FetchAndSetBoolean(a1, CFSTR("IncludeContainingDirectory"), (BOOL *)(a2 + 64), 0);
  _FetchAndSetBoolean(a1, CFSTR("FollowAllSymlinks"), (BOOL *)(a2 + 65), 0);
  return 1;
}

CFDictionaryRef _ConvertStatsToDict(uint64_t a1)
{
  uint64_t v2;
  const __CFAllocator *v3;
  unint64_t v4;
  const __CFNumber *v5;
  const __CFNumber *v6;
  CFNumberRef v7;
  CFDictionaryRef v8;
  uint64_t i;
  _OWORD v11[13];
  void *keys[2];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v2 = 0;
  v25 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  *(_OWORD *)keys = 0u;
  memset(v11, 0, sizeof(v11));
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v4 = 0x1FFFFFFFFFFFFF7EuLL;
  v5 = (const __CFNumber *)*MEMORY[0x1E0C9AE50];
  v6 = (const __CFNumber *)*MEMORY[0x1E0C9AE40];
  do
  {
    keys[v2] = *(&sStatsData)[v4 + 130];
    if (v4 == 0x1FFFFFFFFFFFFFE7)
    {
      if ((*(_BYTE *)(a1 + 200) & 1) != 0)
        v7 = v5;
      else
        v7 = v6;
      CFRetain(v7);
    }
    else
    {
      v7 = CFNumberCreate(v3, (CFNumberType)(&sStatsData)[v4 + 131], (char *)(&sStatsData)[v4 + 133] + a1);
    }
    *(_QWORD *)((char *)v11 + v2 * 8) = v7;
    ++v2;
    v4 += 5;
  }
  while (v4 * 8);
  v8 = CFDictionaryCreate(v3, (const void **)keys, (const void **)v11, 26, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  for (i = 0; i != 208; i += 8)
    CFRelease(*(CFTypeRef *)((char *)v11 + i));
  return v8;
}

const void *_FetchAndSetBoolean(const __CFDictionary *a1, const void *a2, BOOL *a3, BOOL a4)
{
  const void *result;

  result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    result = (const void *)CFEqual(result, (CFTypeRef)*MEMORY[0x1E0C9AE50]);
    a4 = (_DWORD)result != 0;
  }
  *a3 = a4;
  return result;
}

uint64_t SZArchiverCreateStreamableZip(const char *a1, unsigned __int8 *a2, const __CFDictionary *a3, CFDictionaryRef *a4)
{
  uint64_t result;
  const __CFAllocator *v8;
  const __CFArray *Mutable;
  size_t v10;
  uint64_t v11;
  NSObject *v12;
  int *v13;
  char *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  int v18;
  NSObject *v19;
  char *v20;
  NSObject *v21;
  __CFArray *v22;
  char *v23;
  void **v24;
  FTS *v25;
  int v26;
  void *v27;
  CFIndex v28;
  CFIndex v29;
  CFIndex i;
  void **v31;
  void *v32;
  void **v33;
  void *v34;
  mode_t st_mode;
  int v36;
  CFIndex v37;
  off_t st_size;
  NSObject *v39;
  uint64_t v40;
  void *tv_sec;
  __int16 st_gid;
  __int16 st_uid;
  unsigned int v44;
  unsigned int v45;
  CFIndex Count;
  CFIndex v47;
  const __CFString *ValueAtIndex;
  CFStringRef v49;
  char *v50;
  const __CFString *v51;
  const __CFString *v52;
  int FileSystemRepresentation;
  int v54;
  CFIndex v55;
  char *const *v56;
  char *const *v57;
  CFIndex v58;
  const __CFString *v59;
  NSObject *v60;
  const char *v61;
  char *v62;
  char *v63;
  int v64;
  uint64_t v65;
  unsigned int (*v66)(_QWORD);
  uint64_t v67;
  uint64_t v68;
  FTS *v69;
  FTSENT *v70;
  FTSENT *v71;
  unsigned int fts_info;
  BOOL v73;
  int v75;
  void **p_st_atimespec;
  off_t *p_st_size;
  uid_t *p_st_uid;
  void **p_st_mtimespec;
  gid_t *p_st_gid;
  stat *fts_statp;
  NSObject *v82;
  char *v83;
  char *v84;
  const char *v85;
  NSObject *v86;
  uint32_t v87;
  uint8_t *v88;
  NSObject *v89;
  uint32_t v90;
  NSObject *v91;
  NSObject *v92;
  const char *v93;
  NSObject *v94;
  NSObject *v95;
  NSObject *v96;
  NSObject *v97;
  int *v98;
  char *v99;
  NSObject *v100;
  const char *v101;
  NSObject *v102;
  uint32_t v103;
  int v104;
  NSObject *v105;
  char *v106;
  int v107;
  char *v108;
  int v109;
  char *v110;
  int v111;
  char *v112;
  NSObject *v113;
  int *v114;
  char *v115;
  NSObject *v116;
  char *fts_path;
  int *v118;
  char *v119;
  int v120;
  CFIndex v121;
  CFIndex v122;
  unsigned __int16 v123;
  unsigned __int16 v124;
  _OWORD v125[6];
  uint64_t v126;
  _OWORD v127[2];
  __int128 v128;
  CFArrayRef theArray[2];
  uint64_t v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  char *v144;
  stat v145;
  stat v146;
  void *v147;
  void **v148;
  void **v149;
  void *value;
  off_t v151;
  uint64_t v152;
  __int16 v153[2];
  uint8_t v154[4];
  char *v155;
  __int16 v156;
  stat *v157;
  __int16 v158;
  char *v159;
  stat buf[7];
  _QWORD v161[2];
  char __s[1024];
  char __str[1024];
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  v126 = 0;
  memset(v125, 0, sizeof(v125));
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  v140 = 0u;
  v141 = 0u;
  v142 = 0u;
  v143 = 0u;
  v130 = 0;
  v128 = 0u;
  *(_OWORD *)theArray = 0u;
  memset(v127, 0, sizeof(v127));
  result = _UpgradeCallbacksToCurrent(a2, (uint64_t)v125);
  if (!(_DWORD)result)
    return result;
  result = _ConvertOptionsToConfiguration(a3, (uint64_t)v127);
  if (!(_DWORD)result)
    return result;
  *((_QWORD *)&v127[0] + 1) = v125;
  *(_DWORD *)v153 = 0;
  v152 = 0;
  v151 = 0;
  value = 0;
  v149 = 0;
  v148 = 0;
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  v147 = 0;
  bzero(__str, 0x400uLL);
  memset(&v146, 0, sizeof(v146));
  memset(&v145, 0, sizeof(v145));
  bzero(__s, 0x400uLL);
  v161[0] = __s;
  v161[1] = 0;
  if (!realpath_DARWIN_EXTSN(a1, __s))
  {
    v18 = *__error();
    v19 = SZGetLoggingHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = strerror(v18);
      buf[0].st_dev = 136315906;
      *(_QWORD *)&buf[0].st_mode = a1;
      WORD2(buf[0].st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&buf[0].st_ino + 6) = (__darwin_ino64_t)__s;
      HIWORD(buf[0].st_gid) = 2080;
      *(_QWORD *)&buf[0].st_rdev = v20;
      LOWORD(buf[0].st_atimespec.tv_sec) = 1024;
      *(_DWORD *)((char *)&buf[0].st_atimespec.tv_sec + 2) = v18;
      v15 = "Realpath for \"%s\" failed at \"%s\" : %s (%d)";
      v16 = v19;
      v17 = 38;
      goto LABEL_49;
    }
LABEL_12:
    v22 = 0;
LABEL_13:
    v23 = 0;
    v24 = 0;
LABEL_14:
    v25 = 0;
LABEL_15:
    v26 = 0;
    goto LABEL_16;
  }
  v10 = strlen(__s);
  if (!v10)
  {
    v21 = SZGetLoggingHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0].st_dev) = 0;
      v15 = "Source path supplied was an empty string";
      v16 = v21;
      v17 = 2;
      goto LABEL_49;
    }
    goto LABEL_12;
  }
  v11 = v10;
  if (!ZipStreamConfigureOutput(*((_QWORD **)&v127[0] + 1), SHIBYTE(v128)))
    goto LABEL_12;
  if (lstat(__s, &v146))
  {
    v12 = SZGetLoggingHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = __error();
      v14 = strerror(*v13);
      buf[0].st_dev = 136315394;
      *(_QWORD *)&buf[0].st_mode = __s;
      WORD2(buf[0].st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&buf[0].st_ino + 6) = (__darwin_ino64_t)v14;
      v15 = "Failed to stat source path %s : %s";
      v16 = v12;
      v17 = 22;
LABEL_49:
      _os_log_error_impl(&dword_1D4E55000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)buf, v17);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  st_mode = v146.st_mode;
  v36 = v146.st_mode & 0xF000;
  if (v36 == 0x4000)
  {
    if ((_BYTE)v130)
      v11 = strrchr(__s, 47) - __s;
    if (!LOBYTE(theArray[0]))
    {
      if (!_Prescan(__s, Mutable, &v153[1], v153, &v152, &v151))
        goto LABEL_12;
      v37 = v152;
      st_size = v151;
      st_mode = v146.st_mode;
      goto LABEL_52;
    }
LABEL_45:
    st_size = 0;
    v37 = 16;
    v152 = 16;
    v153[0] = 16877;
    v153[1] = -32348;
    goto LABEL_55;
  }
  if (v36 != 0x8000)
  {
    v39 = SZGetLoggingHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      buf[0].st_dev = 67109120;
      *(_DWORD *)&buf[0].st_mode = v146.st_mode;
      v15 = "Unsupported type for source path: mode = 0%ho";
      v16 = v39;
      v17 = 8;
      goto LABEL_49;
    }
    goto LABEL_12;
  }
  if (LOBYTE(theArray[0]))
    goto LABEL_45;
  v153[1] = v146.st_mode;
  v153[0] = 16877;
  v37 = 1;
  v152 = 1;
  st_size = v146.st_size;
  v151 = v146.st_size;
LABEL_52:
  v40 = 2;
  if (!HIBYTE(v128))
    v40 = 3;
  ZipStreamCallPreflightResultCallback(*((uint64_t *)&v127[0] + 1), v40 + v37, st_size, st_mode);
LABEL_55:
  v22 = CFArrayCreateMutable(v8, v37, 0);
  snprintf(__str, 0x400uLL, "%s/mimetype", __s);
  if (!lstat(__str, &v145)
    && (_WriteLocalFile(__str, "mimetype", v145.st_size, v145.st_mode, (void *)v145.st_atimespec.tv_sec, (void *)v145.st_mtimespec.tv_sec, v145.st_uid, v145.st_gid, (uint64_t)&v131, (uint64_t)v127, v153[1], v153[0], v22) & 1) == 0)
  {
    v60 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    LOWORD(buf[0].st_dev) = 0;
    v61 = "Failed to write mimetype file out to archive";
    goto LABEL_140;
  }
  snprintf(__str, 0x400uLL, "%s/%s", __s, "META-INF/");
  if (lstat(__str, &v145))
  {
    memset(&v145, 0, sizeof(v145));
    v145.st_mode = 16877;
    tv_sec = (void *)time(0);
    v145.st_mtimespec.tv_sec = (__darwin_time_t)tv_sec;
    st_gid = 501;
    *(int32x2_t *)&v145.st_uid = vdup_n_s32(0x1F5u);
    st_uid = 501;
  }
  else
  {
    tv_sec = (void *)v145.st_mtimespec.tv_sec;
    st_uid = v145.st_uid;
    st_gid = v145.st_gid;
  }
  v44 = (unsigned __int16)v153[1];
  v45 = (unsigned __int16)v153[0];
  if ((_WriteLocalFile(__str, "META-INF/", v145.st_size, v145.st_mode, (void *)v145.st_atimespec.tv_sec, tv_sec, st_uid, st_gid, (uint64_t)&v131, (uint64_t)v127, v153[1], v153[0], v22) & 1) == 0)
  {
    v60 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    LOWORD(buf[0].st_dev) = 0;
    v61 = "Failed to write metadata directory to archive";
    goto LABEL_140;
  }
  if (!ZipStreamConcoctStreamData(v37, st_size, v44, v45, (uint64_t)v127, &value, &v149, &v147))
  {
    v60 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    LOWORD(buf[0].st_dev) = 0;
    v61 = "failed to create stream metadata";
    goto LABEL_140;
  }
  v27 = v147;
  if ((ZipStreamWriteLocalFile(0, (uint64_t *)&value, &v149, (Bytef *)v147, 0, v44, v45, (uint64_t)&v131, (uint64_t)v127) & 1) == 0)
  {
    v60 = SZGetLoggingHandle();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0].st_dev) = 0;
      v61 = "Failed to write stream metadata";
LABEL_140:
      v88 = (uint8_t *)buf;
LABEL_141:
      v89 = v60;
      v90 = 2;
LABEL_142:
      _os_log_error_impl(&dword_1D4E55000, v89, OS_LOG_TYPE_ERROR, v61, v88, v90);
      goto LABEL_13;
    }
LABEL_94:
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    if (!v27)
      goto LABEL_18;
    goto LABEL_17;
  }
  CFArrayAppendValue(v22, value);
  value = 0;
  free(v27);
  v147 = 0;
  DestroyMutableLocalFileRecord(v149);
  v149 = 0;
  Count = -1;
  if (*(_QWORD *)&v127[0] && !HIBYTE(v128))
  {
    if (!ZipStreamConcoctFixedStreamData((uint64_t)v127, &value, &v148, (const Bytef **)&v147))
    {
      v60 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      LOWORD(buf[0].st_dev) = 0;
      v61 = "Failed to concoct fixed stream data";
      goto LABEL_140;
    }
    v27 = v147;
    if ((ZipStreamWriteLocalFile(0, (uint64_t *)&value, &v148, (Bytef *)v147, 0, v44, v45, (uint64_t)&v131, (uint64_t)v127) & 1) != 0)
    {
      Count = CFArrayGetCount(v22);
      CFArrayAppendValue(v22, value);
      value = 0;
      free(v27);
      v147 = 0;
      goto LABEL_68;
    }
    v60 = SZGetLoggingHandle();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0].st_dev) = 0;
      v61 = "Failed to write stream metadata";
      goto LABEL_140;
    }
    goto LABEL_94;
  }
LABEL_68:
  v121 = Count;
  v123 = v45;
  v124 = v44;
  if (Mutable)
  {
    v122 = CFArrayGetCount(Mutable);
    if (v122 >= 1)
    {
      v47 = 0;
      while (1)
      {
        bzero(buf, 0x400uLL);
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(Mutable, v47);
        v49 = CFStringCreateWithFileSystemRepresentation(0, __s);
        if (!v49)
          break;
        v50 = (char *)v49;
        v51 = CFStringCreateWithFormat(v8, 0, CFSTR("%@/%@"), v49, ValueAtIndex);
        if (!v51)
        {
          v95 = SZGetLoggingHandle();
          if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v154 = 138412546;
            v155 = v50;
            v156 = 2112;
            v157 = (stat *)ValueAtIndex;
            _os_log_error_impl(&dword_1D4E55000, v95, OS_LOG_TYPE_ERROR, "unable to create fullPath from: %@ and %@", v154, 0x16u);
          }
          CFRelease(v50);
          goto LABEL_13;
        }
        v52 = v51;
        FileSystemRepresentation = CFStringGetFileSystemRepresentation(v51, __str, 1024);
        CFRelease(v50);
        CFRelease(v52);
        if (!FileSystemRepresentation)
        {
          v60 = SZGetLoggingHandle();
          if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            goto LABEL_13;
          *(_WORD *)v154 = 0;
          v61 = "Failed to convert full path to C string";
LABEL_174:
          v88 = v154;
          goto LABEL_141;
        }
        if (!CFStringGetFileSystemRepresentation(ValueAtIndex, (char *)buf, 1024))
        {
          v60 = SZGetLoggingHandle();
          if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            goto LABEL_13;
          *(_WORD *)v154 = 0;
          v61 = "Failed to convert archive path to C string";
          goto LABEL_174;
        }
        LOWORD(v45) = v123;
        LOWORD(v44) = v124;
        if (!lstat(__str, &v145)
          && (_WriteLocalFile(__str, (const char *)buf, v145.st_size, v145.st_mode, (void *)v145.st_atimespec.tv_sec, (void *)v145.st_mtimespec.tv_sec, v145.st_uid, v145.st_gid, (uint64_t)&v131, (uint64_t)v127, v124, v123, v22) & 1) == 0)
        {
          v60 = SZGetLoggingHandle();
          if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            goto LABEL_13;
          *(_WORD *)v154 = 0;
          v61 = "Failed to write mimetype file out to archive";
          goto LABEL_174;
        }
        if (v122 == ++v47)
          goto LABEL_78;
      }
      v94 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      *(_DWORD *)v154 = 136315138;
      v155 = __s;
      v61 = "unable to create dirPathStr from: %s";
      v88 = v154;
      v89 = v94;
      v90 = 12;
      goto LABEL_142;
    }
  }
LABEL_78:
  v54 = v146.st_mode;
  if ((v146.st_mode & 0xF000) != 0x4000)
  {
    v62 = strrchr(__s, 47);
    if (v62)
      v63 = v62;
    else
      v63 = __s;
    v64 = _WriteLocalFile(__s, v63, v146.st_size, v54, (void *)v146.st_atimespec.tv_sec, (void *)v146.st_mtimespec.tv_sec, v146.st_uid, v146.st_gid, (uint64_t)&v131, (uint64_t)v127, v44, v45, v22);
    v23 = 0;
    if (!v64)
    {
      v26 = 0;
      v24 = 0;
      v25 = 0;
      goto LABEL_16;
    }
    v24 = 0;
    v25 = 0;
LABEL_103:
    if ((ZipStreamWriteCentralDirectoryAndEndRecords(v22, v121, (uint64_t)v148, (uint64_t)&v131, (uint64_t)v127) & 1) == 0)
    {
      v91 = SZGetLoggingHandle();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf[0].st_dev) = 0;
        v85 = "Failed to write end of archive.";
        v86 = v91;
        v87 = 2;
LABEL_181:
        _os_log_error_impl(&dword_1D4E55000, v86, OS_LOG_TYPE_ERROR, v85, (uint8_t *)buf, v87);
        goto LABEL_183;
      }
      goto LABEL_183;
    }
    v65 = *((_QWORD *)&v127[0] + 1);
    v66 = *(unsigned int (**)(_QWORD))(*((_QWORD *)&v127[0] + 1) + 88);
    if (v66)
    {
      if (v66(*(_QWORD *)(*((_QWORD *)&v127[0] + 1) + 80)) == -1)
      {
        v109 = *__error();
        v97 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
          goto LABEL_183;
        v110 = strerror(v109);
        buf[0].st_dev = 136315138;
        *(_QWORD *)&buf[0].st_mode = v110;
        v85 = "Failed to flush output: %s";
        goto LABEL_180;
      }
      v65 = *((_QWORD *)&v127[0] + 1);
    }
    v67 = (*(uint64_t (**)(_QWORD))(v65 + 72))(*(_QWORD *)(v65 + 80));
    if ((v67 & 0x8000000000000000) == 0)
    {
      v68 = v67;
      if (HIBYTE(v128)
        || !(*(unsigned int (**)(_QWORD, uint64_t))(*((_QWORD *)&v127[0] + 1) + 96))(*(_QWORD *)(*((_QWORD *)&v127[0] + 1) + 80), v67))
      {
        v23 = 0;
        *((_QWORD *)&v132 + 1) = v68;
        v26 = 1;
        goto LABEL_16;
      }
      v111 = *__error();
      v97 = SZGetLoggingHandle();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
      {
        v112 = strerror(v111);
        buf[0].st_dev = 136315138;
        *(_QWORD *)&buf[0].st_mode = v112;
        v85 = "Failed to truncate output: %s";
        goto LABEL_180;
      }
LABEL_183:
      v23 = 0;
      goto LABEL_15;
    }
    v107 = *__error();
    v97 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
      goto LABEL_183;
    v108 = strerror(v107);
    buf[0].st_dev = 136315138;
    *(_QWORD *)&buf[0].st_mode = v108;
    v85 = "Failed to get offset in file at end of writing: %s";
LABEL_180:
    v86 = v97;
    v87 = 12;
    goto LABEL_181;
  }
  if (!theArray[1])
  {
    v24 = 0;
    v57 = (char *const *)v161;
LABEL_114:
    v69 = fts_open(v57, 84, 0);
    if (!v69)
    {
      v96 = SZGetLoggingHandle();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v114 = __error();
        v115 = strerror(*v114);
        buf[0].st_dev = 136315394;
        *(_QWORD *)&buf[0].st_mode = __s;
        WORD2(buf[0].st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&buf[0].st_ino + 6) = (__darwin_ino64_t)v115;
        _os_log_error_impl(&dword_1D4E55000, v96, OS_LOG_TYPE_ERROR, "fts_open failed for path %s: %s", (uint8_t *)buf, 0x16u);
      }
      v23 = 0;
      goto LABEL_14;
    }
    v25 = v69;
    while (1)
    {
      v70 = fts_read(v25);
      if (!v70)
      {
        if (!*__error())
          goto LABEL_103;
        v97 = SZGetLoggingHandle();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        {
          v98 = __error();
          v99 = strerror(*v98);
          buf[0].st_dev = 136315138;
          *(_QWORD *)&buf[0].st_mode = v99;
          v85 = "fts_read returned NULL and set errno: %s";
          goto LABEL_180;
        }
        goto LABEL_183;
      }
      v71 = v70;
      fts_info = v70->fts_info;
      if (fts_info > 0xD)
        break;
      if (((1 << fts_info) & 0x3102) != 0)
      {
        if (v70->fts_level)
          v73 = 0;
        else
          v73 = theArray[1] == 0;
        if (!v73 || v130 != 0)
        {
          v23 = _CopyArchivePath((uint64_t)v70->fts_path, v11, v70->fts_statp->st_mode);
          if ((_IsExcludedFileName(v23) & 1) == 0 && (_IsOrderedEarly(v23, Mutable) & 1) == 0)
          {
            memset(buf, 0, 144);
            if (v71->fts_info != 12 || !BYTE1(v130))
              goto LABEL_132;
            if (stat(v71->fts_path, buf))
            {
              v116 = SZGetLoggingHandle();
              if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
              {
                fts_path = v71->fts_path;
                v118 = __error();
                v119 = strerror(*v118);
                *(_DWORD *)v154 = 136315394;
                v155 = fts_path;
                v156 = 2080;
                v157 = (stat *)v119;
                _os_log_error_impl(&dword_1D4E55000, v116, OS_LOG_TYPE_ERROR, "stat failed for path %s: %s", v154, 0x16u);
              }
              goto LABEL_15;
            }
            v75 = buf[0].st_mode;
            p_st_size = &buf[0].st_size;
            p_st_atimespec = (void **)&buf[0].st_atimespec;
            p_st_mtimespec = (void **)&buf[0].st_mtimespec;
            p_st_uid = &buf[0].st_uid;
            p_st_gid = &buf[0].st_gid;
            if ((buf[0].st_mode & 0xF000) != 0x8000)
            {
LABEL_132:
              fts_statp = v71->fts_statp;
              p_st_gid = &fts_statp->st_gid;
              p_st_uid = &fts_statp->st_uid;
              p_st_mtimespec = (void **)&fts_statp->st_mtimespec;
              p_st_atimespec = (void **)&fts_statp->st_atimespec;
              p_st_size = &fts_statp->st_size;
              v75 = fts_statp->st_mode;
            }
            if ((_WriteLocalFile(v71->fts_path, v23, *p_st_size, v75, *p_st_atimespec, *p_st_mtimespec, *p_st_uid, *p_st_gid, (uint64_t)&v131, (uint64_t)v127, v124, v123, v22) & 1) == 0)goto LABEL_15;
          }
          free(v23);
        }
      }
      else if (fts_info != 6)
      {
        if (((1 << fts_info) & 0x490) != 0)
        {
          v82 = SZGetLoggingHandle();
          if (!os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
            goto LABEL_183;
          v83 = v71->fts_path;
          v84 = strerror(v71->fts_errno);
          buf[0].st_dev = 136315394;
          *(_QWORD *)&buf[0].st_mode = v83;
          WORD2(buf[0].st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&buf[0].st_ino + 6) = (__darwin_ino64_t)v84;
          v85 = "fts_read gave error for file %s: %s";
          v86 = v82;
          v87 = 22;
          goto LABEL_181;
        }
        break;
      }
    }
    v113 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
      goto LABEL_183;
    v120 = v71->fts_info;
    buf[0].st_dev = 67109120;
    *(_DWORD *)&buf[0].st_mode = v120;
    v85 = "fts_read returned unhandled fts_info value %d";
    v86 = v113;
    v87 = 8;
    goto LABEL_181;
  }
  v55 = CFArrayGetCount(theArray[1]);
  bzero(buf, 0x400uLL);
  if (v55 <= 0)
  {
    v92 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      goto LABEL_163;
    *(_WORD *)v154 = 0;
    v93 = "The custom path ordering array is empty";
LABEL_185:
    _os_log_error_impl(&dword_1D4E55000, v92, OS_LOG_TYPE_ERROR, v93, v154, 2u);
    goto LABEL_163;
  }
  v56 = (char *const *)malloc_type_calloc(v55 + 1, 8uLL, 0x10040436913F5uLL);
  if (v56)
  {
    v57 = v56;
    v58 = 0;
    while (1)
    {
      v59 = (const __CFString *)CFArrayGetValueAtIndex(theArray[1], v58);
      if (!CFStringGetFileSystemRepresentation(v59, (char *)buf, 1024))
      {
        v100 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
          goto LABEL_164;
        *(_WORD *)v154 = 0;
        v101 = "Failed to convert path to C string";
        v102 = v100;
        v103 = 2;
        goto LABEL_169;
      }
      v144 = 0;
      if (asprintf(&v144, "%s/%s", __s, (const char *)buf) < 0)
        break;
      v57[v58++] = v144;
      if (v55 == v58)
      {
        v57[v55] = 0;
        v24 = (void **)v57;
        goto LABEL_114;
      }
    }
    v104 = *__error();
    v105 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
      goto LABEL_164;
    v106 = strerror(v104);
    *(_DWORD *)v154 = 136315650;
    v155 = __s;
    v156 = 2080;
    v157 = buf;
    v158 = 2080;
    v159 = v106;
    v101 = "Failed to create path from %s/%s : %s";
    v102 = v105;
    v103 = 32;
LABEL_169:
    _os_log_error_impl(&dword_1D4E55000, v102, OS_LOG_TYPE_ERROR, v101, v154, v103);
    goto LABEL_164;
  }
  v92 = SZGetLoggingHandle();
  if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v154 = 0;
    v93 = "Malloc failed for path buffer array";
    goto LABEL_185;
  }
LABEL_163:
  v57 = 0;
LABEL_164:
  v23 = 0;
  v25 = 0;
  v26 = 0;
  v24 = (void **)v57;
LABEL_16:
  v27 = v147;
  if (v147)
LABEL_17:
    free(v27);
LABEL_18:
  DestroyMutableCDRecord((void **)value);
  DestroyMutableLocalFileRecord(v149);
  DestroyMutableLocalFileRecord(v148);
  if (v22)
  {
    v28 = CFArrayGetCount(v22);
    if (v28)
    {
      v29 = v28;
      for (i = 0; i != v29; ++i)
      {
        v31 = (void **)CFArrayGetValueAtIndex(v22, i);
        DestroyMutableCDRecord(v31);
      }
    }
    CFRelease(v22);
  }
  free(v23);
  if (Mutable)
    CFRelease(Mutable);
  if (v25)
    fts_close(v25);
  if (v24)
  {
    v32 = *v24;
    if (*v24)
    {
      v33 = v24 + 1;
      do
      {
        free(v32);
        *(v33 - 1) = 0;
        v34 = *v33++;
        v32 = v34;
      }
      while (v34);
    }
    free(v24);
  }
  if (!v26)
    return 0;
  if (a4)
    *a4 = _ConvertStatsToDict((uint64_t)&v131);
  return 1;
}

uint64_t SZArchiverExtractFile()
{
  uint64_t v0;
  CFDictionaryRef *v1;
  CFDictionaryRef *v2;
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  size_t v5;
  size_t v6;
  const char *v7;
  unsigned __int8 *v8;
  uint64_t result;
  FILE **v10;
  FILE **v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  _WORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  NSObject *v18;
  char v19;
  NSObject *v20;
  __CFArray *Mutable;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  unsigned __int8 ShouldOrderFileEarly;
  CFStringRef v29;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t v33;
  NSObject *v34;
  const __CFAllocator *v35;
  __CFDictionary *v36;
  const __CFData *Data;
  const __CFData *v38;
  CFIndex Length;
  uint64_t v40;
  const UInt8 *BytePtr;
  int v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  size_t v46;
  void **v47;
  NSObject *v48;
  NSObject *v49;
  size_t v50;
  size_t v51;
  uint64_t *v52;
  int v53;
  size_t v54;
  NSObject *v55;
  NSObject *v56;
  const char *v57;
  NSObject *v58;
  uint32_t v59;
  int v60;
  NSObject *v61;
  char *v62;
  NSObject *v63;
  char *v64;
  int v65;
  _QWORD *v66;
  _OWORD v67[6];
  uint64_t v68;
  _OWORD v69[2];
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  _OWORD v73[13];
  int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  size_t v80;
  size_t v81;
  int v82;
  uint8_t v83[4];
  char *v84;
  uint8_t buf[4];
  size_t v86;
  __int16 v87;
  size_t v88;
  uint64_t v89;

  v0 = MEMORY[0x1E0C80A78]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v7 = (const char *)v0;
  v89 = *MEMORY[0x1E0C80C00];
  v68 = 0;
  memset(v67, 0, sizeof(v67));
  memset(v73, 0, sizeof(v73));
  v72 = 0;
  v70 = 0u;
  v71 = 0u;
  memset(v69, 0, sizeof(v69));
  result = _UpgradeCallbacksToCurrent(v8, (uint64_t)v67);
  if (!(_DWORD)result)
    return result;
  result = _ConvertOptionsToConfiguration(v4, (uint64_t)v69);
  if (!(_DWORD)result)
    return result;
  *((_QWORD *)&v69[0] + 1) = v67;
  if (!ZipStreamConfigureOutput(v67, SHIBYTE(v70)))
    goto LABEL_15;
  v10 = (FILE **)OpenZipFile(v7, SBYTE14(v70));
  if (!v10)
  {
    v20 = SZGetLoggingHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v86 = (size_t)v7;
      _os_log_error_impl(&dword_1D4E55000, v20, OS_LOG_TYPE_ERROR, "Failed to open zip file %s", buf, 0xCu);
    }
LABEL_15:
    v11 = 0;
LABEL_16:
    CloseZipFile((uint64_t)v11);
    return 0;
  }
  v11 = v10;
  v79 = 0;
  v80 = 0;
  v77 = -1;
  v78 = 0;
  v75 = -1;
  v76 = -1;
  v74 = 0;
  if (!_ReadOriginalCentralDirectory((uint64_t)v10, (void ****)&v78, &v80, &v79, (size_t *)&v77, (size_t *)&v76, (_WORD *)&v74 + 1, &v74))goto LABEL_50;
  if (v6 != -1)
  {
    v12 = v80;
    if (v80 <= v6)
    {
      v34 = SZGetLoggingHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        v86 = v6;
        v87 = 2048;
        v88 = v12 - 1;
        _os_log_error_impl(&dword_1D4E55000, v34, OS_LOG_TYPE_ERROR, "Central directory index %llu is out of range, must be between 0 and %llu", buf, 0x16u);
      }
      v19 = 0;
    }
    else
    {
      v13 = *((_QWORD *)v78 + v6);
      v14 = *((_QWORD *)&v69[0] + 1);
      v82 = 2;
      printf("Extracting %s\n", *(const char **)(v13 + 72));
      v15 = CopyLocalFileHeader(v11, v13, &v82);
      v16 = v15;
      if (v15)
      {
        v17 = (uint64_t *)OpenLocalFile((uint64_t)v11, v13, *((char **)v15 + 7), v15[32], 0, &v82);
        if (v82)
        {
          v18 = SZGetLoggingHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D4E55000, v18, OS_LOG_TYPE_ERROR, "Failed to open local file", buf, 2u);
          }
          v19 = 0;
        }
        else
        {
          v66 = v16;
          v50 = v16[6];
          if (v50)
          {
            v51 = 0;
            while (1)
            {
              v81 = 0;
              v52 = v17;
              v53 = ReadLocalFileData(v17, buf, 0x1000uLL, &v81);
              if ((v53 & 5) != 0)
                break;
              v54 = v81;
              if (v81)
              {
                if (v54 != (*(uint64_t (**)(_QWORD, uint8_t *, size_t))(v14 + 48))(*(_QWORD *)(v14 + 80), buf, v81))
                {
                  v60 = *__error();
                  v61 = SZGetLoggingHandle();
                  if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                    goto LABEL_84;
                  v64 = strerror(v60);
                  *(_DWORD *)v83 = 136315138;
                  v84 = v64;
                  v57 = "fwrite failed to write out entire buffer: %s";
                  v58 = v61;
                  v59 = 12;
                  goto LABEL_94;
                }
                v51 += v54;
              }
              v17 = v52;
              if (v51 >= v50)
              {
                if (v53 != 2)
                  goto LABEL_78;
                if (v51 == v50)
                {
                  v19 = 1;
                }
                else
                {
                  v63 = SZGetLoggingHandle();
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    v86 = v51;
                    v87 = 2048;
                    v88 = v50;
                    _os_log_error_impl(&dword_1D4E55000, v63, OS_LOG_TYPE_ERROR, "Failed to read entire file size; expected %llu, got %llu",
                      buf,
                      0x16u);
                  }
                  v19 = 0;
                }
                goto LABEL_86;
              }
            }
            v56 = SZGetLoggingHandle();
            if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            {
LABEL_84:
              v19 = 0;
              goto LABEL_85;
            }
            *(_DWORD *)v83 = 67109120;
            LODWORD(v84) = v53;
            v57 = "ReadLocalFileData returned %d";
            v58 = v56;
            v59 = 8;
LABEL_94:
            _os_log_error_impl(&dword_1D4E55000, v58, OS_LOG_TYPE_ERROR, v57, v83, v59);
            goto LABEL_84;
          }
          v53 = 0;
LABEL_78:
          v52 = v17;
          v55 = SZGetLoggingHandle();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v86) = v53;
            _os_log_error_impl(&dword_1D4E55000, v55, OS_LOG_TYPE_ERROR, "Failed to read file data: %d", buf, 8u);
          }
          v19 = 0;
LABEL_85:
          v17 = v52;
LABEL_86:
          v16 = v66;
        }
        if (v17)
          CloseLocalFile((compression_stream *)v17);
      }
      else
      {
        v49 = SZGetLoggingHandle();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v86) = v82;
          _os_log_error_impl(&dword_1D4E55000, v49, OS_LOG_TYPE_ERROR, "Failed to get local file record: %d", buf, 8u);
        }
        v19 = 0;
      }
      free(v16);
    }
    goto LABEL_51;
  }
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v22 = v80;
  if (!v80)
  {
    v25 = -1;
    goto LABEL_41;
  }
  v23 = 0;
  v24 = v78;
  v65 = HIWORD(v74);
  v25 = -1;
  v26 = (unsigned __int16)v74;
  do
  {
    v27 = v24[v23];
    if (!v27)
      goto LABEL_32;
    if (v25 == -1)
    {
      buf[0] = 0;
      ShouldOrderFileEarly = ZipStreamShouldOrderFileEarly(*(const char **)(v27 + 72), buf);
      if ((ShouldOrderFileEarly & (buf[0] != 0)) != 0)
        v25 = v23;
      else
        v25 = -1;
      v27 = v24[v23];
    }
    v29 = CFStringCreateWithFileSystemRepresentation(0, *(const char **)(v27 + 72));
    CFArrayAppendValue(Mutable, v29);
    CFRelease(v29);
    v30 = v24[v23];
    v31 = *(unsigned __int16 *)(v30 + 24);
    if (*(_BYTE *)(v30 + 26))
    {
      if (v31 != v26)
        goto LABEL_30;
    }
    else if (v31 != v65)
    {
LABEL_30:
      v32 = 1;
      goto LABEL_31;
    }
    v32 = 0;
LABEL_31:
    ZipStreamAddStatisticsForCDRecord(v30, v32, v73);
LABEL_32:
    ++v23;
  }
  while (v22 != v23);
  if (v25 == -1)
  {
LABEL_41:
    v33 = -1;
    goto LABEL_42;
  }
  if (_GetCDIndexOfBundleExecutableForInfoPlist(v11, (uint64_t)v24, v22, v24[v25], &v75))
    v33 = v75;
  else
    v33 = -1;
LABEL_42:
  v35 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v36 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(v36, CFSTR("paths"), Mutable);
  _AddIndexToDictionary(CFSTR("META-INF"), v77, v36);
  _AddIndexToDictionary(CFSTR("mimetype"), v76, v36);
  _AddIndexToDictionary(CFSTR("Info.plist"), v25, v36);
  _AddIndexToDictionary(CFSTR("Executable"), v33, v36);
  Data = CFPropertyListCreateData(v35, v36, kCFPropertyListXMLFormat_v1_0, 0, 0);
  if (Data)
  {
    v38 = Data;
    Length = CFDataGetLength(Data);
    *__error() = 0;
    v40 = *((_QWORD *)&v69[0] + 1);
    BytePtr = CFDataGetBytePtr(v38);
    if (Length != (*(uint64_t (**)(_QWORD, const UInt8 *, CFIndex))(v40 + 48))(*(_QWORD *)(v40 + 80), BytePtr, Length))
    {
      v42 = *__error();
      v43 = SZGetLoggingHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v62 = strerror(v42);
        *(_DWORD *)buf = 136315138;
        v86 = (size_t)v62;
        _os_log_error_impl(&dword_1D4E55000, v43, OS_LOG_TYPE_ERROR, "Failed to write entire output dictionary: %s", buf, 0xCu);
      }
    }
    CFRelease(v38);
  }
  else
  {
    v44 = SZGetLoggingHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D4E55000, v44, OS_LOG_TYPE_ERROR, "Failed to create output dictionary", buf, 2u);
    }
  }
  CFRelease(v36);
LABEL_50:
  v19 = 1;
LABEL_51:
  v45 = v78;
  if (v78)
  {
    v46 = v80;
    if (v80)
    {
      v47 = (void **)v78;
      do
      {
        if (*v47)
          free(*v47);
        ++v47;
        --v46;
      }
      while (v46);
    }
    free(v45);
  }
  if ((v19 & 1) == 0)
  {
    v48 = SZGetLoggingHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v86 = (size_t)v7;
      _os_log_error_impl(&dword_1D4E55000, v48, OS_LOG_TYPE_ERROR, "Failed to process file %s", buf, 0xCu);
    }
    goto LABEL_16;
  }
  CloseZipFile((uint64_t)v11);
  if (v2)
    *v2 = _ConvertStatsToDict((uint64_t)v73);
  return 1;
}

void sub_1D4E62194(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D4E63008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 176), 8);
  _Unwind_Resume(a1);
}

id _CreateError(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (v17)
    v19 = objc_msgSend(v17, "mutableCopy");
  else
    v19 = objc_opt_new();
  v20 = (void *)v19;
  if (v18)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v18, &a9);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CB2D50]);

  }
  if (v16)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("SZExtractorFunctionNameErrorKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("SZExtractorSourceFileLineErrorKey"));

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v15, a4, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1D4E6561C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a49, 8);
  _Unwind_Resume(a1);
}

void sub_1D4E66C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t _CheckRealpathHasBasePrefix(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t i;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _QWORD *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  id v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  char *v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;
  id v50;
  char __s[1024];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  bzero(__s, 0x400uLL);
  v7 = objc_retainAutorelease(v5);
  if (realpath_DARWIN_EXTSN((const char *)objc_msgSend(v7, "fileSystemRepresentation"), __s) || *__error() == 2)
  {
    v35 = a3;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFileSystemRepresentation:length:", __s, strlen(__s));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "pathComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v6, "pathComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v37;
      v34 = v9;
      while (2)
      {
        v16 = v7;
        v17 = v6;
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v37 != v15)
            objc_enumerationMutation(v11);
          v19 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          if (v14 + i < (unint64_t)objc_msgSend(v10, "count"))
          {
            objc_msgSend(v10, "objectAtIndexedSubscript:", v14 + i);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v19, "isEqualToString:", v20);

            if ((v21 & 1) != 0)
              continue;
          }
          SZGetLoggingHandle();
          v24 = objc_claimAutoreleasedReturnValue();
          v6 = v17;
          v7 = v16;
          v9 = v34;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            v33 = objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation");
            *(_DWORD *)buf = 136315650;
            v43 = v33;
            v44 = 2112;
            v45 = (char *)v34;
            v46 = 2112;
            v47 = v6;
            _os_log_error_impl(&dword_1D4E55000, v24, OS_LOG_TYPE_ERROR, "Rejecting \"%s\" because its resolved path \"%@\" points outside or to the unzip dir %@", buf, 0x20u);
          }

          v40 = *MEMORY[0x1E0CB2AA0];
          v41 = v7;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation");
          _CreateError((uint64_t)"_CheckRealpathHasBasePrefix", 442, CFSTR("SZExtractorErrorDomain"), 5, 0, v25, CFSTR("Rejecting \"%s\" because its resolved path \"%@\" points outside or to the unzip dir %@"), v27, v26);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = 0;
          goto LABEL_17;
        }
        v14 += i;
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
        v22 = 0;
        v23 = 1;
        v6 = v17;
        v7 = v16;
        v9 = v34;
        if (v13)
          continue;
        break;
      }
    }
    else
    {
      v22 = 0;
      v23 = 1;
    }
LABEL_17:

    a3 = v35;
  }
  else
  {
    v29 = *__error();
    SZGetLoggingHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v43 = objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation");
      v44 = 2080;
      v45 = strerror(v29);
      _os_log_error_impl(&dword_1D4E55000, v30, OS_LOG_TYPE_ERROR, "Call to realpath failed for suspicious path %s: %s", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v29, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = *MEMORY[0x1E0CB2AA0];
    v50 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation");
    strerror(v29);
    _CreateError((uint64_t)"_CheckRealpathHasBasePrefix", 430, CFSTR("SZExtractorErrorDomain"), 5, v9, v10, CFSTR("Call to realpath failed for suspicious path %s: %s"), v32, v31);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
  }

  if (a3 && (v23 & 1) == 0)
    *a3 = objc_retainAutorelease(v22);

  return v23;
}

uint64_t __Block_byref_object_copy__427(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__428(uint64_t a1)
{

}

id _CopyStreamBytesToRecord(uint64_t a1, uint64_t a2, void *a3, const void **a4, size_t *a5)
{
  size_t v9;
  id v10;
  uint64_t v11;
  size_t v12;
  void *v13;
  void *v14;

  v9 = *a5;
  v10 = a3;
  v11 = objc_msgSend(v10, "thisStageBytesComplete");
  if (v9 >= a2 - v11)
    v12 = a2 - v11;
  else
    v12 = v9;
  memcpy((void *)(a1 + objc_msgSend(v10, "thisStageBytesComplete")), *a4, v12);
  objc_msgSend(v10, "setThisStageBytesComplete:", objc_msgSend(v10, "thisStageBytesComplete") + v12);
  objc_msgSend(v10, "unsureData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendBytes:length:", *a4, v12);

  objc_msgSend(v10, "setCurrentOffset:", objc_msgSend(v10, "currentOffset") + v12);
  objc_msgSend(v10, "updateHashFromOffset:withBytes:length:", objc_msgSend(v10, "currentOffset") - v12, *a4, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    *a4 = (char *)*a4 + v12;
    *a5 -= v12;
  }
  return v14;
}

uint64_t _GetUncompressedSize(void *a1)
{
  id v1;
  uint64_t v2;
  _BOOL4 HasZip64ExtraField;
  uint64_t v4;
  uint64_t LFUncompressedSize;

  v1 = a1;
  v2 = objc_msgSend(v1, "currentLFRecord");
  if (*(_WORD *)(objc_msgSend(v1, "currentLFRecord") + 8)
    && objc_msgSend(v1, "currentLFRequiresDataDescriptor"))
  {
    if (objc_msgSend(v1, "streamState") <= 3)
      __assert_rtn("_GetUncompressedSize", "StreamingUnzipper.m", 339, "currentState.streamState > kStreamStateIncompleteDataDescriptor");
    if (!objc_msgSend(v1, "dataDescriptor"))
      __assert_rtn("_GetUncompressedSize", "StreamingUnzipper.m", 340, "NULL != currentState.dataDescriptor");
    HasZip64ExtraField = LocalFileRecordHasZip64ExtraField(objc_msgSend(v1, "currentLFRecord"));
    v4 = objc_msgSend(v1, "dataDescriptor");
    if (HasZip64ExtraField)
      LFUncompressedSize = *(_QWORD *)(v4 + 16);
    else
      LFUncompressedSize = *(unsigned int *)(v4 + 12);
  }
  else
  {
    LFUncompressedSize = GetLFUncompressedSize(v2);
  }

  return LFUncompressedSize;
}

uint64_t _GetCompressedSize(void *a1)
{
  id v1;
  uint64_t v2;
  _BOOL4 HasZip64ExtraField;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = a1;
  v2 = objc_msgSend(v1, "currentLFRecord");
  if (*(_WORD *)(objc_msgSend(v1, "currentLFRecord") + 8)
    && objc_msgSend(v1, "currentLFRequiresDataDescriptor"))
  {
    if (objc_msgSend(v1, "streamState") <= 3)
      __assert_rtn("_GetCompressedSize", "StreamingUnzipper.m", 356, "currentState.streamState > kStreamStateIncompleteDataDescriptor");
    if (!objc_msgSend(v1, "dataDescriptor"))
      __assert_rtn("_GetCompressedSize", "StreamingUnzipper.m", 357, "NULL != currentState.dataDescriptor");
    HasZip64ExtraField = LocalFileRecordHasZip64ExtraField(objc_msgSend(v1, "currentLFRecord"));
    v4 = objc_msgSend(v1, "dataDescriptor");
    if (HasZip64ExtraField)
      v5 = *(_QWORD *)(v4 + 8);
    else
      v5 = *(unsigned int *)(v4 + 8);
  }
  else
  {
    v7 = 0;
    v5 = *(unsigned int *)(v2 + 18);
    if (((_DWORD)v5 == -1 || *(_DWORD *)(v2 + 22) == -1) && GetZip64ExtraFieldDataFromLF(v2, 0, &v7))
      v5 = v7;
  }

  return v5;
}

id GetFileNameStringFromLocalFileRecord(_WORD *a1)
{
  size_t v2;
  unsigned __int8 *v3;
  uint64_t v4;
  char v5;
  int v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  NSObject *v11;
  NSObject *v13;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  unsigned __int8 *v28;
  __int16 v29;
  size_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = (unsigned __int16)a1[13];
  v3 = (unsigned __int8 *)malloc_type_calloc(v2 + 1, 1uLL, 0xCB3B20E1uLL);
  memcpy(v3, a1 + 15, v2);
  if (!v3)
  {
    SZGetLoggingHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D4E55000, v11, OS_LOG_TYPE_ERROR, "Failed to get name from local file record.", buf, 2u);
    }

    return 0;
  }
  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  do
  {
    v8 = v3[v4];
    if ((char)v3[v4] < 0)
    {
      v5 = 1;
    }
    else if (v2 != v4 && !v3[v4])
    {
      SZGetLoggingHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v28 = v3;
        v29 = 2048;
        v30 = v2;
        v31 = 2048;
        v32 = v4;
        _os_log_error_impl(&dword_1D4E55000, v13, OS_LOG_TYPE_ERROR, "Found NUL in path %s length %zu at %zu", buf, 0x20u);
      }

LABEL_43:
      v10 = 0;
      goto LABEL_66;
    }
    switch(v7)
    {
      case 0:
        if (v8 == 47)
          v7 = 0;
        else
          v7 = 3;
        if (v8 == 46)
          v7 = 1;
        break;
      case 1:
        if (v8 == 47)
          v7 = 0;
        else
          v7 = 3;
        if (v8 == 46)
          v7 = 2;
        break;
      case 2:
        if (v8 == 47)
          v7 = 0;
        else
          v7 = 3;
        if (v8 == 47)
          v9 = 1;
        else
          v9 = v6;
        if (v3[v4])
        {
          v6 = v9;
        }
        else
        {
          v7 = 0;
          v6 = 1;
        }
        break;
      case 3:
        if (v8 == 47)
          v7 = 0;
        else
          v7 = 3;
        break;
      default:
        break;
    }
    ++v4;
  }
  while (v2 + 1 != v4);
  if ((v5 & 1) != 0)
  {
    if (!(((a1[3] & 0x800) == 0) | v6 & 1))
    {
LABEL_36:
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v3, v2, 4);
      goto LABEL_66;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_36;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v3, v2, 4);
  if (!v10)
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    v10 = (void *)objc_msgSend(v15, "initWithBytes:length:encoding:", v3, v2, objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
    if (!v10)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v3, v2, CFStringConvertEncodingToNSStringEncoding(0x600u));
      if (!v10)
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v3, v2, CFStringConvertEncodingToNSStringEncoding(0x400u));
        if (!v10)
        {
          SZGetLoggingHandle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v28 = v3;
            _os_log_error_impl(&dword_1D4E55000, v24, OS_LOG_TYPE_ERROR, "Failed to convert path to string: %s", buf, 0xCu);
          }

          goto LABEL_43;
        }
      }
    }
  }
  if ((v6 & 1) != 0)
  {
    v26 = v10;
    objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("/"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v25, "mutableCopy");
    v17 = objc_msgSend(v16, "count");
    if (v17)
    {
      v18 = v17;
      for (i = 0; i != v18; ++i)
      {
        v20 = objc_msgSend(v16, "count");
        if (v20)
        {
          v21 = v20;
          v22 = 0;
          while (1)
          {
            objc_msgSend(v16, "objectAtIndex:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v23, "isEqualToString:", CFSTR("..")))
              break;
            if (v22
              && ((objc_msgSend(v23, "isEqualToString:", CFSTR(".")) & 1) != 0
               || objc_msgSend(v23, "isEqualToString:", &stru_1E98B2FF0)))
            {
              goto LABEL_62;
            }

            if (v21 == ++v22)
              goto LABEL_64;
          }
          objc_msgSend(v16, "removeObjectAtIndex:", v22);
          if (!v22)
            goto LABEL_63;
          --v22;
LABEL_62:
          objc_msgSend(v16, "removeObjectAtIndex:", v22);
LABEL_63:

        }
LABEL_64:
        ;
      }
    }
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR("/"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_66:
  free(v3);
  return v10;
}

uint64_t _GetCRC32(void *a1)
{
  id v1;
  uint64_t v2;
  unsigned int *v3;
  uint64_t v4;

  v1 = a1;
  v2 = objc_msgSend(v1, "currentLFRecord");
  if (objc_msgSend(v1, "currentLFRequiresDataDescriptor"))
  {
    if (objc_msgSend(v1, "streamState") <= 3)
      __assert_rtn("_GetCRC32", "StreamingUnzipper.m", 322, "currentState.streamState > kStreamStateIncompleteDataDescriptor");
    if (!objc_msgSend(v1, "dataDescriptor"))
      __assert_rtn("_GetCRC32", "StreamingUnzipper.m", 323, "NULL != currentState.dataDescriptor");
    LocalFileRecordHasZip64ExtraField(objc_msgSend(v1, "currentLFRecord"));
    v3 = (unsigned int *)(objc_msgSend(v1, "dataDescriptor") + 4);
  }
  else
  {
    v3 = (unsigned int *)(v2 + 14);
  }
  v4 = *v3;

  return v4;
}

id StringFromDigest(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2;
  void *i;
  unsigned int v5;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", a2);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); v2; --v2)
  {
    v5 = *a1++;
    objc_msgSend(i, "appendFormat:", CFSTR("%02x"), v5);
  }
  return i;
}

uint64_t _GetAndValidatePathDepth(const char *a1, int a2, int *a3)
{
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  char *__stringp;

  v6 = strndup(a1, 0x400uLL);
  __stringp = v6;
  if (!v6)
    return 0;
  v7 = v6;
  if (*v6 == 47 || !*a1)
  {
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  while (1)
  {
    v8 = strsep(&__stringp, "/");
    if (!v8)
      break;
    if (*v8)
    {
      if (*v8 != 46)
        goto LABEL_10;
      if (v8[1])
      {
        if (v8[1] == 46 && !v8[2])
        {
          --a2;
          goto LABEL_11;
        }
LABEL_10:
        ++a2;
      }
    }
LABEL_11:
    if (a2 < 1)
      goto LABEL_14;
  }
  *a3 = a2;
  v9 = 1;
LABEL_15:
  free(v7);
  return v9;
}

void sub_1D4E70F38(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _RemoveAndRecreateDirectoryAtPath(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  char v31;
  id v32;
  int v33;
  int v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  char v52;
  uint64_t v53;
  char *v54;
  id v55;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  id v63;
  id v64;
  uint64_t v65;
  void *v66;
  uint8_t buf[4];
  uint64_t v68;
  __int16 v69;
  _WORD v70[17];

  *(_QWORD *)&v70[13] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v65 = *MEMORY[0x1E0CB2AA8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 16877);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_retainAutorelease(v3);
  v7 = open((const char *)objc_msgSend(v6, "fileSystemRepresentation"), 256);
  if (v7 < 0)
  {
    v12 = *__error();
    SZGetLoggingHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v53 = objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation");
      v54 = strerror(v12);
      *(_DWORD *)buf = 136315394;
      v68 = v53;
      v69 = 2080;
      *(_QWORD *)v70 = v54;
      _os_log_error_impl(&dword_1D4E55000, v13, OS_LOG_TYPE_ERROR, "Failed to open %s : %s", buf, 0x16u);
    }

    v14 = (void *)*MEMORY[0x1E0CB2FE0];
    v15 = objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation");
    strerror(v12);
    _CreateError((uint64_t)"_GetDataProtectionClassForPath", 586, v14, v12, 0, 0, CFSTR("Failed to open %s : %s"), v16, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v7;
    v9 = fcntl(v7, 63);
    if ((v9 & 0x80000000) == 0)
    {
      v10 = v9;
      close(v8);

      v11 = 1;
      goto LABEL_14;
    }
    v18 = *__error();
    SZGetLoggingHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v57 = objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation");
      v58 = strerror(v18);
      *(_DWORD *)buf = 136315394;
      v68 = v57;
      v69 = 2080;
      *(_QWORD *)v70 = v58;
      _os_log_error_impl(&dword_1D4E55000, v19, OS_LOG_TYPE_ERROR, "Failed to get protection class on %s : %s", buf, 0x16u);
    }

    v14 = (void *)*MEMORY[0x1E0CB2FE0];
    v20 = objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation");
    strerror(v18);
    _CreateError((uint64_t)"_GetDataProtectionClassForPath", 593, v14, v18, 0, 0, CFSTR("Failed to get protection class on %s : %s"), v21, v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    close(v8);
  }
  v22 = objc_retainAutorelease(v17);

  v23 = v22;
  objc_msgSend(v23, "domain");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v14 != (void *)v24)
  {
    v25 = v24;
    goto LABEL_29;
  }
  v26 = objc_msgSend(v23, "code");

  if (v26 != 2)
    goto LABEL_30;

  v11 = 0;
  v10 = 0xFFFFFFFFLL;
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0;
  v28 = objc_msgSend(v27, "removeItemAtPath:error:", v6, &v64);
  v23 = v64;

  if ((v28 & 1) != 0)
  {
LABEL_15:
    v29 = v23;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v23;
    v31 = objc_msgSend(v30, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, v5, &v63);
    v23 = v63;

    if ((v31 & 1) != 0)
    {
      if (!v11)
      {
        v45 = 1;
        goto LABEL_42;
      }
      v32 = objc_retainAutorelease(v6);
      v33 = open((const char *)objc_msgSend(v32, "fileSystemRepresentation"), 256);
      if (v33 < 0)
      {
        v46 = *__error();
        SZGetLoggingHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v61 = objc_msgSend(objc_retainAutorelease(v32), "fileSystemRepresentation");
          v62 = strerror(v46);
          *(_DWORD *)buf = 136315394;
          v68 = v61;
          v69 = 2080;
          *(_QWORD *)v70 = v62;
          _os_log_error_impl(&dword_1D4E55000, v47, OS_LOG_TYPE_ERROR, "Failed to open %s : %s", buf, 0x16u);
        }

        v48 = (void *)*MEMORY[0x1E0CB2FE0];
        v49 = objc_msgSend(objc_retainAutorelease(v32), "fileSystemRepresentation");
        strerror(v46);
        _CreateError((uint64_t)"_SetDataProtectionClassOnPath", 615, v48, v46, 0, 0, CFSTR("Failed to open %s : %s"), v50, v49);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v34 = v33;
        if (!fcntl(v33, 64, v10))
        {
          close(v34);
          v52 = 1;
          v51 = v23;
LABEL_38:

          v55 = v51;
          if ((v52 & 1) != 0)
          {
            v45 = 1;
            v23 = v55;
            goto LABEL_42;
          }
          v23 = v55;
          if (!a2)
          {
LABEL_41:
            v45 = 0;
            goto LABEL_42;
          }
          goto LABEL_31;
        }
        v35 = *__error();
        SZGetLoggingHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v59 = objc_msgSend(objc_retainAutorelease(v32), "fileSystemRepresentation");
          v60 = strerror(v35);
          *(_DWORD *)buf = 136315650;
          v68 = v59;
          v69 = 1024;
          *(_DWORD *)v70 = v10;
          v70[2] = 2080;
          *(_QWORD *)&v70[3] = v60;
          _os_log_error_impl(&dword_1D4E55000, v36, OS_LOG_TYPE_ERROR, "Failed to set protection class on %s to %d: %s", buf, 0x1Cu);
        }

        v37 = (void *)*MEMORY[0x1E0CB2FE0];
        v38 = objc_msgSend(objc_retainAutorelease(v32), "fileSystemRepresentation");
        strerror(v35);
        _CreateError((uint64_t)"_SetDataProtectionClassOnPath", 621, v37, v35, 0, 0, CFSTR("Failed to set protection class on %s to %d: %s"), v39, v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        close(v34);
      }
      v51 = objc_retainAutorelease(v40);

      v52 = 0;
      goto LABEL_38;
    }
    SZGetLoggingHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_DWORD *)buf = 138412546;
    v68 = (uint64_t)v6;
    v69 = 2112;
    *(_QWORD *)v70 = v23;
    v43 = "Failed to create extraction directory at path %@: %@";
    goto LABEL_44;
  }
  v41 = (void *)*MEMORY[0x1E0CB28A8];
  objc_msgSend(v23, "domain");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41 == v42)
  {
    v44 = objc_msgSend(v23, "code");

    if (v44 == 4)
    {

      v23 = 0;
      goto LABEL_15;
    }
  }
  else
  {

  }
  SZGetLoggingHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v68 = (uint64_t)v6;
    v69 = 2112;
    *(_QWORD *)v70 = v23;
    v43 = "Failed to remove bad extraction path at %@: %@";
LABEL_44:
    _os_log_error_impl(&dword_1D4E55000, v25, OS_LOG_TYPE_ERROR, v43, buf, 0x16u);
  }
LABEL_29:

LABEL_30:
  if (!a2)
    goto LABEL_41;
LABEL_31:
  v23 = objc_retainAutorelease(v23);
  v45 = 0;
  *a2 = v23;
LABEL_42:

  return v45;
}

uint64_t _ValidateDictionaryKeyValueType(void *a1, void *a2, objc_class *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v10;
  objc_class *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a1, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    SZGetLoggingHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromClass(a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v5;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v12;
      _os_log_error_impl(&dword_1D4E55000, v8, OS_LOG_TYPE_ERROR, "Value of key %@ in options dictionary was not an object of type %@. Was %@", (uint8_t *)&v13, 0x20u);

    }
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

id FetchGroupIDs(_QWORD *a1)
{
  int v2;
  int v3;
  void *v4;
  uint64_t v5;
  gid_t *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  char *v14;
  uint64_t v15;
  uint8_t buf[4];
  char *v18;
  gid_t v19[16];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = getgroups(16, v19);
  if (v2 != -1)
  {
    v3 = v2;
    v4 = (void *)objc_opt_new();
    if (v3 >= 1)
    {
      v5 = v3;
      v6 = v19;
      do
      {
        v7 = *v6++;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v8);

        --v5;
      }
      while (v5);
    }
    v9 = (void *)objc_msgSend(v4, "copy");
    v10 = 0;
    if (!a1)
      goto LABEL_12;
LABEL_10:
    if (!v9)
      *a1 = objc_retainAutorelease(v10);
    goto LABEL_12;
  }
  v11 = *__error();
  SZGetLoggingHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v18 = strerror(v11);
    _os_log_error_impl(&dword_1D4E55000, v12, OS_LOG_TYPE_ERROR, "Failed to get current group access list: %s", buf, 0xCu);
  }

  v13 = (void *)*MEMORY[0x1E0CB2FE0];
  v14 = strerror(v11);
  _CreateError((uint64_t)"FetchGroupIDs", 250, v13, v11, 0, 0, CFSTR("Failed to get current group access list: %s"), v15, (uint64_t)v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v9 = 0;
  if (a1)
    goto LABEL_10;
LABEL_12:

  return v9;
}

void sub_1D4E76248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,id location)
{
  id *v37;
  id *v38;

  objc_destroyWeak(v38);
  objc_destroyWeak(v37);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4E76A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80310](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80318](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80320](c, data, *(_QWORD *)&len);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80330](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80338](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80340](c, data, *(_QWORD *)&len);
}

int CC_SHA224_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80350](md, c);
}

int CC_SHA224_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80358](c);
}

int CC_SHA224_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80360](c, data, *(_QWORD *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1E0C80390](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1E0C80398](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C803A0](c, data, *(_QWORD *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1E0C803B0](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1E0C803B8](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C803C0](c, data, *(_QWORD *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D10](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DD0](theArray, idx, value);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x1E0C98F30](*(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x1E0C99008](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C990E0](string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1E0C81008]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1E0C81068]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C82638](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x1E0DE5290](stream);
}

uint64_t compression_stream_get_state_size()
{
  return MEMORY[0x1E0DE5298]();
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE52A0](stream, *(_QWORD *)&operation, *(_QWORD *)&algorithm);
}

uint64_t compression_stream_is_state_valid()
{
  return MEMORY[0x1E0DE52A8]();
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x1E0DE52B0](stream, *(_QWORD *)&flags);
}

uint64_t compression_stream_reinit()
{
  return MEMORY[0x1E0DE52B8]();
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x1E0DE92B0](crc, buf, *(_QWORD *)&len);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1E0C832D0](*(_QWORD *)&a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C832E0](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x1E0C83340](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1E0C83348](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1E0C833B0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x1E0C83538](__stream, a2, *(_QWORD *)&__whence);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83548](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x1E0C83588](__stream);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1E0C835A0](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1E0C835A8](a1, *(_QWORD *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1E0C835B0](a1);
}

int futimes(int a1, const timeval *a2)
{
  return MEMORY[0x1E0C835D8](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

int getgroups(int a1, gid_t a2[])
{
  return MEMORY[0x1E0C836A0](*(_QWORD *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83840](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int lchmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C83B30](a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C83B38](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83BB0](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

int lutimes(const char *a1, const timeval *a2)
{
  return MEMORY[0x1E0C83C48](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x1E0C84198](path, omode);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x1E0C841C8](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D18](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1E0C84D48](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x1E0C84F88](__base, __nel, __width, __compar);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1E0C85018](a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1E0C85030](__ptr, __size);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x1E0C850F0](path, name, *(_QWORD *)&options);
}

char *__cdecl rindex(const char *a1, int a2)
{
  return (char *)MEMORY[0x1E0C85130](a1, *(_QWORD *)&a2);
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1E0C85180]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B8](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1E0C855F0](__stringp, __delim);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85718](a1, a2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

