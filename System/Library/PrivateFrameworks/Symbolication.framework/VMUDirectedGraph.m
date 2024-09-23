@implementation VMUDirectedGraph

+ (id)_archivedBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5
{
  id v5;
  int v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  int v13;
  uint64_t v14;
  uint64_t *v15;
  id v16;
  double v17;
  double v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  double v22;
  FILE *v23;
  FILE *v24;
  _QWORD v26[12];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  z_stream v31;
  _QWORD v32[7];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v5 = (id)a4;
  if (a4)
  {
    v7 = a5 & 1;
    if ((a5 & 4) != 0)
      v7 = 2;
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__9;
    v41 = __Block_byref_object_dispose__9;
    v42 = 0;
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = v7;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v9 = v8;
    v10 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __VMUCompressedBuffer_block_invoke;
    v32[3] = &unk_1E4E03CA0;
    v32[5] = &v37;
    v32[6] = v5;
    v32[4] = &v33;
    v11 = MEMORY[0x1A85A995C](v32);
    v12 = (void (**)(_QWORD))v11;
    v13 = *((_DWORD *)v34 + 6);
    if (v13 == 1)
    {
      v27 = 0;
      v28 = (uint64_t)&v27;
      v29 = 0x9010000000;
      memset(&v31.avail_in, 0, 104);
      v30 = &unk_1A4E39779;
      v31.next_in = (Bytef *)a3;
      v31.avail_in = v5;
      v14 = deflateInit2_(&v31, 1, 8, 31, 9, 0, "1.2.12", 112);
      if ((_DWORD)v14)
      {
        NSLog(CFSTR("Unable to initialize deflate: %d (%s)"), v14, *(_QWORD *)(v28 + 80));
        _Block_object_dispose(&v27, 8);
        v5 = 0;
LABEL_21:

        _Block_object_dispose(&v33, 8);
        _Block_object_dispose(&v37, 8);

        return v5;
      }
      v26[6] = v10;
      v26[7] = 3221225472;
      v26[8] = __VMUCompressedBuffer_block_invoke_2;
      v26[9] = &unk_1E4E03CC8;
      v26[10] = &v27;
      v26[11] = deflateBound((z_streamp)(v28 + 32), (uLong)v5);
      v12[2](v12);
      _Block_object_dispose(&v27, 8);
    }
    else if (v13 == 2)
    {
      v27 = v10;
      v28 = 3221225472;
      v29 = (uint64_t)__VMUCompressedBuffer_block_invoke_3;
      v30 = &__block_descriptor_56_e9_Q16__0_v8l;
      v31.next_in = (Bytef *)a3;
      *(_QWORD *)&v31.avail_in = v5;
      v31.total_in = (unint64_t)((double)(unint64_t)v5 * 1.2);
      (*(void (**)(uint64_t))(v11 + 16))(v11);
    }
    v15 = v38;
    if (!v38[5])
    {
      *((_DWORD *)v34 + 6) = 0;
      v26[0] = v10;
      v26[1] = 3221225472;
      v26[2] = __VMUCompressedBuffer_block_invoke_4;
      v26[3] = &__block_descriptor_48_e9_Q16__0_v8l;
      v26[4] = a3;
      v26[5] = v5;
      ((void (*)(void (**)(_QWORD), id, _QWORD, _QWORD *))v12[2])(v12, v5, 0, v26);
      v15 = v38;
    }
    if (kVMUPrintArchivingTiming)
    {
      v16 = (id)v15[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v18 = v17;
      v19 = objc_msgSend(v16, "length");
      v20 = v19;
      if (v19 <= (unint64_t)v5)
        v21 = (unint64_t)v5;
      else
        v21 = v19;
      v22 = v18 - v9;
      if (v22 <= 0.0)
      {
        v24 = (FILE *)*MEMORY[0x1E0C80C10];
        VMUMemorySizeString(v5);
        VMUMemorySizeString(v20);
        fprintf(v24, "Compressed %s to %s (%2.1f%% reduction) in %3.6fs\n");
      }
      else
      {
        VMUMemorySizeString((unint64_t)((double)(v21 - v19) / v22));
        v23 = (FILE *)*MEMORY[0x1E0C80C10];
        VMUMemorySizeString(v5);
        VMUMemorySizeString(v20);
        fprintf(v23, "Compressed %s to %s (%2.1f%% reduction @ %s saved/s) in %3.6fs\n");
      }

      v15 = v38;
    }
    v5 = (id)v15[5];
    goto LABEL_21;
  }
  return v5;
}

+ (void)_copyUnarchived:(id)a3 length:(unint64_t *)a4 options:(unint64_t)a5
{
  id v6;
  double v7;
  double v8;
  id v9;
  unsigned int *v10;
  size_t v11;
  Bytef *v12;
  BOOL v13;
  unint64_t v14;
  unsigned int v15;
  Bytef *v16;
  unsigned int v17;
  Bytef *v18;
  id v19;
  uint64_t v20;
  unsigned int v21;
  uInt v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  compression_status v26;
  uint64_t v27;
  void *v28;
  id v29;
  double v30;
  double v31;
  unint64_t v32;
  unint64_t v33;
  double v34;
  FILE *v35;
  const char *v36;
  const char *v37;
  z_stream strm;

  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "length") <= 0xF)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v8 = v7;
  v9 = objc_retainAutorelease(v6);
  v10 = (unsigned int *)objc_msgSend(v9, "bytes");
  v12 = (Bytef *)v10[1];
  v11 = v10[2];
  v13 = !(_DWORD)v11 || (_DWORD)v12 == 0;
  if (v13
    || (v14 = *v10, v15 = v10[3], objc_msgSend(v9, "length") < (unint64_t)((_DWORD)v12 + v14)))
  {
LABEL_7:
    if (a4)
    {
      v16 = 0;
      *a4 = 0;
      goto LABEL_45;
    }
LABEL_44:
    v16 = 0;
    goto LABEL_45;
  }
  v16 = (Bytef *)malloc_type_malloc(v11, 0x15C7163AuLL);
  v17 = HIWORD(v15);
  if (!HIWORD(v15))
  {
    v24 = objc_msgSend(v9, "length");
    if (v24 >= v14 && (_DWORD)v12 == (_DWORD)v11 && v24 - v14 >= v11)
    {
      memcpy(v16, (const void *)(objc_msgSend(objc_retainAutorelease(v9), "bytes") + v14), v11);
      v18 = (Bytef *)v11;
      goto LABEL_34;
    }
    NSLog(CFSTR("Malformed non-compressed header"));
    goto LABEL_33;
  }
  if (v17 != 2)
  {
    v18 = (Bytef *)v11;
    if (v17 != 1)
      goto LABEL_34;
    v19 = objc_retainAutorelease(v9);
    v20 = objc_msgSend(v19, "bytes");
    v21 = objc_msgSend(v19, "length");
    memset(&strm.avail_in, 0, 104);
    strm.next_in = (Bytef *)(v20 + v14);
    v22 = v21 - v14;
    if (v21 < v14)
      v22 = 0;
    strm.avail_in = v22;
    v23 = inflateInit2_(&strm, 31, "1.2.12", 112);
    if ((_DWORD)v23)
    {
      NSLog(CFSTR("Unable to initialize inflate: %d (%s)"), v23, strm.msg);
    }
    else
    {
      strm.next_out = v16;
      strm.avail_out = v11;
      v27 = inflate(&strm, 4);
      inflateEnd(&strm);
      v18 = (Bytef *)v11;
      if ((_DWORD)v27 == 1)
        goto LABEL_34;
      NSLog(CFSTR("Unable to decompress data: %d (%s)"), v27, strm.msg);
    }
    goto LABEL_33;
  }
  v25 = objc_msgSend(objc_retainAutorelease(v9), "bytes");
  memset(&strm, 0, 40);
  if (compression_stream_init((compression_stream *)&strm, COMPRESSION_STREAM_DECODE, COMPRESSION_LZFSE) == COMPRESSION_STATUS_ERROR)
  {
    NSLog(CFSTR("Unable to initialize compression stream."));
LABEL_33:
    v18 = 0;
    goto LABEL_34;
  }
  strm.total_in = v25 + v14;
  strm.next_out = v12;
  strm.next_in = v16;
  *(_QWORD *)&strm.avail_in = v11;
  v26 = compression_stream_process((compression_stream *)&strm, 0);
  if (v26 == COMPRESSION_STATUS_ERROR)
  {
    NSLog(CFSTR("Error. Compression failed."));
    goto LABEL_33;
  }
  if (v26 == COMPRESSION_STATUS_OK)
  {
    NSLog(CFSTR("Error. Compression output buffer full."));
    goto LABEL_33;
  }
  if (v26 != COMPRESSION_STATUS_END || (v18 = (Bytef *)(strm.next_in - v16), strm.next_in <= v16))
    v18 = 0;
  compression_stream_destroy((compression_stream *)&strm);
LABEL_34:
  if (kVMUPrintArchivingTiming)
  {
    v28 = (void *)MEMORY[0x1E0C99D68];
    v29 = v9;
    objc_msgSend(v28, "timeIntervalSinceReferenceDate");
    v31 = v30;
    v32 = objc_msgSend(v29, "length");

    if (v32 <= v11)
      v33 = v11;
    else
      v33 = v32;
    v34 = 100.0 - (double)v32 * 100.0 / (double)v33;
    v35 = (FILE *)*MEMORY[0x1E0C80C10];
    v36 = (const char *)VMUMemorySizeString(v32);
    v37 = (const char *)VMUMemorySizeString(v11);
    fprintf(v35, "Decompressed %s to %s (reversed %2.1f%% reduction) in %3.6fs\n", v36, v37, v34, v31 - v8);
  }
  if (a4)
    *a4 = (unint64_t)v18;
  if (v18 != (Bytef *)v11 || !v18)
  {
    free(v16);
    goto LABEL_44;
  }
LABEL_45:

  return v16;
}

+ (id)_archivedObject:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v5;
  id v6;
  Bytef *v7;
  id v8;
  int v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void (**v14)(_QWORD);
  int v15;
  uint64_t v16;
  uint64_t *v17;
  id v18;
  double v19;
  double v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  double v24;
  FILE *v25;
  FILE *v26;
  _QWORD v28[12];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  z_stream v33;
  _QWORD v34[7];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (Bytef *)objc_msgSend(v6, "bytes");
  v8 = (id)objc_msgSend(v6, "length");
  if (v8)
  {
    v9 = v4 & 1;
    if ((v4 & 4) != 0)
      v9 = 2;
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__9;
    v43 = __Block_byref_object_dispose__9;
    v44 = 0;
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = v9;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v11 = v10;
    v12 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __VMUCompressedBuffer_block_invoke;
    v34[3] = &unk_1E4E03CA0;
    v34[5] = &v39;
    v34[6] = v8;
    v34[4] = &v35;
    v13 = MEMORY[0x1A85A995C](v34);
    v14 = (void (**)(_QWORD))v13;
    v15 = *((_DWORD *)v36 + 6);
    if (v15 == 1)
    {
      v29 = 0;
      v30 = (uint64_t)&v29;
      v31 = 0x9010000000;
      memset(&v33.avail_in, 0, 104);
      v32 = &unk_1A4E39779;
      v33.next_in = v7;
      v33.avail_in = v8;
      v16 = deflateInit2_(&v33, 1, 8, 31, 9, 0, "1.2.12", 112);
      if ((_DWORD)v16)
      {
        NSLog(CFSTR("Unable to initialize deflate: %d (%s)"), v16, *(_QWORD *)(v30 + 80));
        _Block_object_dispose(&v29, 8);
        v8 = 0;
LABEL_21:

        _Block_object_dispose(&v35, 8);
        _Block_object_dispose(&v39, 8);

        goto LABEL_22;
      }
      v28[6] = v12;
      v28[7] = 3221225472;
      v28[8] = __VMUCompressedBuffer_block_invoke_2;
      v28[9] = &unk_1E4E03CC8;
      v28[10] = &v29;
      v28[11] = deflateBound((z_streamp)(v30 + 32), (uLong)v8);
      v14[2](v14);
      _Block_object_dispose(&v29, 8);
    }
    else if (v15 == 2)
    {
      v29 = v12;
      v30 = 3221225472;
      v31 = (uint64_t)__VMUCompressedBuffer_block_invoke_3;
      v32 = &__block_descriptor_56_e9_Q16__0_v8l;
      v33.next_in = v7;
      *(_QWORD *)&v33.avail_in = v8;
      v33.total_in = (unint64_t)((double)(unint64_t)v8 * 1.2);
      (*(void (**)(uint64_t))(v13 + 16))(v13);
    }
    v17 = v40;
    if (!v40[5])
    {
      *((_DWORD *)v36 + 6) = 0;
      v28[0] = v12;
      v28[1] = 3221225472;
      v28[2] = __VMUCompressedBuffer_block_invoke_4;
      v28[3] = &__block_descriptor_48_e9_Q16__0_v8l;
      v28[4] = v7;
      v28[5] = v8;
      ((void (*)(void (**)(_QWORD), id, _QWORD, _QWORD *))v14[2])(v14, v8, 0, v28);
      v17 = v40;
    }
    if (kVMUPrintArchivingTiming)
    {
      v18 = (id)v17[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v20 = v19;
      v21 = objc_msgSend(v18, "length");
      v22 = v21;
      if (v21 <= (unint64_t)v8)
        v23 = (unint64_t)v8;
      else
        v23 = v21;
      v24 = v20 - v11;
      if (v24 <= 0.0)
      {
        v26 = (FILE *)*MEMORY[0x1E0C80C10];
        VMUMemorySizeString(v8);
        VMUMemorySizeString(v22);
        fprintf(v26, "Compressed %s to %s (%2.1f%% reduction) in %3.6fs\n");
      }
      else
      {
        VMUMemorySizeString((unint64_t)((double)(v23 - v21) / v24));
        v25 = (FILE *)*MEMORY[0x1E0C80C10];
        VMUMemorySizeString(v8);
        VMUMemorySizeString(v22);
        fprintf(v25, "Compressed %s to %s (%2.1f%% reduction @ %s saved/s) in %3.6fs\n");
      }

      v17 = v40;
    }
    v8 = (id)v17[5];
    goto LABEL_21;
  }
LABEL_22:

  return v8;
}

+ (id)_unarchivedObject:(id)a3 ofClass:(Class)a4 options:(unint64_t)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = a3;
  objc_msgSend(v8, "setWithObject:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_unarchivedObject:ofClasses:options:", v9, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_unarchivedObject:(id)a3 ofClasses:(id)a4 options:(unint64_t)a5
{
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  id v11;
  unsigned int *v12;
  Bytef *v13;
  size_t v14;
  unint64_t v16;
  unsigned int v17;
  Bytef *v18;
  unsigned int v19;
  Bytef *v20;
  id v21;
  id v22;
  uint64_t v23;
  unsigned int v24;
  uInt v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  compression_status v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  double v34;
  double v35;
  unint64_t v36;
  unint64_t v37;
  double v38;
  FILE *v39;
  const char *v40;
  FILE *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  objc_class *v49;
  void *v50;
  void *v51;
  void *v52;
  const char *v54;
  void *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  z_stream strm;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  if ((unint64_t)objc_msgSend(v8, "length") < 0x10)
    goto LABEL_44;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v10 = v9;
  v11 = objc_retainAutorelease(v8);
  v12 = (unsigned int *)objc_msgSend(v11, "bytes");
  v13 = (Bytef *)v12[1];
  v14 = v12[2];
  if (!(_DWORD)v14 || (_DWORD)v13 == 0)
    goto LABEL_44;
  v16 = *v12;
  v17 = v12[3];
  if (objc_msgSend(v11, "length") < (unint64_t)((_DWORD)v13 + v16))
    goto LABEL_44;
  v18 = (Bytef *)malloc_type_malloc(v14, 0x15C7163AuLL);
  v19 = HIWORD(v17);
  if (!HIWORD(v17))
  {
    v27 = objc_msgSend(v11, "length");
    if (v27 >= v16 && (_DWORD)v13 == (_DWORD)v14 && v27 - v16 >= v14)
    {
      memcpy(v18, (const void *)(objc_msgSend(objc_retainAutorelease(v11), "bytes") + v16), v14);
      v20 = (Bytef *)v14;
      goto LABEL_34;
    }
    NSLog(CFSTR("Malformed non-compressed header"));
    goto LABEL_33;
  }
  if (v19 != 2)
  {
    v20 = (Bytef *)v14;
    if (v19 != 1)
      goto LABEL_34;
    v21 = v7;
    v22 = objc_retainAutorelease(v11);
    v23 = objc_msgSend(v22, "bytes");
    v24 = objc_msgSend(v22, "length");
    memset(&strm.avail_in, 0, 104);
    strm.next_in = (Bytef *)(v23 + v16);
    v25 = v24 - v16;
    if (v24 < v16)
      v25 = 0;
    strm.avail_in = v25;
    v26 = inflateInit2_(&strm, 31, "1.2.12", 112);
    if ((_DWORD)v26)
    {
      NSLog(CFSTR("Unable to initialize inflate: %d (%s)"), v26, strm.msg);
    }
    else
    {
      strm.next_out = v18;
      strm.avail_out = v14;
      v30 = inflate(&strm, 4);
      inflateEnd(&strm);
      v20 = (Bytef *)v14;
      if ((_DWORD)v30 == 1)
      {
LABEL_30:
        v7 = v21;
        goto LABEL_34;
      }
      NSLog(CFSTR("Unable to decompress data: %d (%s)"), v30, strm.msg);
    }
    v20 = 0;
    goto LABEL_30;
  }
  v28 = objc_msgSend(objc_retainAutorelease(v11), "bytes");
  memset(&strm, 0, 40);
  if (compression_stream_init((compression_stream *)&strm, COMPRESSION_STREAM_DECODE, COMPRESSION_LZFSE) == COMPRESSION_STATUS_ERROR)
  {
    NSLog(CFSTR("Unable to initialize compression stream."));
LABEL_33:
    v20 = 0;
    goto LABEL_34;
  }
  strm.total_in = v28 + v16;
  strm.next_out = v13;
  strm.next_in = v18;
  *(_QWORD *)&strm.avail_in = v14;
  v29 = compression_stream_process((compression_stream *)&strm, 0);
  if (v29 == COMPRESSION_STATUS_ERROR)
  {
    NSLog(CFSTR("Error. Compression failed."));
    goto LABEL_33;
  }
  if (v29 == COMPRESSION_STATUS_OK)
  {
    NSLog(CFSTR("Error. Compression output buffer full."));
    goto LABEL_33;
  }
  if (v29 != COMPRESSION_STATUS_END || (v20 = (Bytef *)(strm.next_in - v18), strm.next_in <= v18))
    v20 = 0;
  compression_stream_destroy((compression_stream *)&strm);
LABEL_34:
  if (kVMUPrintArchivingTiming)
  {
    v31 = (void *)MEMORY[0x1E0C99D68];
    v32 = v7;
    v33 = v11;
    objc_msgSend(v31, "timeIntervalSinceReferenceDate");
    v35 = v34;
    v36 = objc_msgSend(v33, "length");

    if (v36 <= v14)
      v37 = v14;
    else
      v37 = v36;
    v38 = 100.0 - (double)v36 * 100.0 / (double)v37;
    v39 = (FILE *)*MEMORY[0x1E0C80C10];
    v40 = (const char *)VMUMemorySizeString(v36);
    v54 = (const char *)VMUMemorySizeString(v14);
    v41 = v39;
    v7 = v32;
    fprintf(v41, "Decompressed %s to %s (reversed %2.1f%% reduction) in %3.6fs\n", v40, v54, v38, v35 - v10);
  }
  if (v20 != (Bytef *)v14 || !v20)
  {
    free(v18);
LABEL_44:

    goto LABEL_45;
  }

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v18, v14, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_46;
  }
LABEL_45:
  v42 = 0;
LABEL_46:

  if (objc_msgSend(v42, "length"))
  {
    v55 = v42;
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v42, 0);
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v56 = v7;
    v44 = v7;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v46; ++i)
        {
          if (*(_QWORD *)v58 != v47)
            objc_enumerationMutation(v44);
          v49 = *(objc_class **)(*((_QWORD *)&v57 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", class_getName(v49));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v50, "containsString:", CFSTR("VMU")))
          {
            if (objc_msgSend(v50, "hasPrefix:", CFSTR("DVT_")))
              objc_msgSend(v50, "substringFromIndex:", 4);
            else
              objc_msgSend(CFSTR("DVT_"), "stringByAppendingString:", v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setClass:forClassName:", v49, v50);
            objc_msgSend(v43, "setClass:forClassName:", v49, v51);

          }
        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      }
      while (v46);
    }

    objc_msgSend(v43, "decodeObjectOfClasses:forKey:", v44, *MEMORY[0x1E0CB2CD0]);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = v55;
    v7 = v56;
  }
  else
  {
    v52 = 0;
  }

  return v52;
}

- (VMUDirectedGraph)initWithNodes:(unsigned int)a3
{
  VMUDirectedGraph *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VMUDirectedGraph;
  result = -[VMUDirectedGraph init](&v5, sel_init);
  if (result)
  {
    if (a3)
    {
      result->_nodeCount = a3;
      result->_nextNodeName = a3;
      result->_graphIs64bit = 1;
      *(int64x2_t *)&result->_graphCompatibilityVersion = vdupq_n_s64(2uLL);
    }
    else
    {

      return 0;
    }
  }
  return result;
}

- (void)setGraphCompatibilityVersion:(int64_t)a3
{
  self->_graphCompatibilityVersion = a3;
}

- (void)setGraphVersion:(int64_t)a3
{
  self->_graphVersion = a3;
}

+ (id)directedGraphWithData:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v14;

  v11 = a3;
  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPlistRepresentation:error:", v11, a4);
  }
  else if (a4)
  {
    VMUDirectedGraphErrorWithExtraUserInfo(1u, 0, CFSTR("Data parameter cannot be nil."), v6, v7, v8, v9, v10, v14);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)decapsulatePlistData:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  if ((unint64_t)objc_msgSend(v5, "length") > 0x30)
  {
    v7 = objc_retainAutorelease(v5);
    if (*(_QWORD *)objc_msgSend(v7, "bytes") != 0x48504152474D454DLL)
    {
      v6 = v7;
      goto LABEL_5;
    }
    v10 = objc_retainAutorelease(v7);
    v11 = (uint64_t *)objc_msgSend(v10, "bytes");
    if (v11[1])
    {
      if (a4)
      {
        VMUDirectedGraphErrorWithExtraUserInfo(1u, 0, CFSTR("Version %llu of memory graph is not supported by the currently installed tools"), v12, v13, v14, v15, v16, v11[1]);
LABEL_18:
        v8 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      }
    }
    else
    {
      v17 = v11[2];
      if (v17 != -1)
      {
        v12 = v11[3];
        if (v12 != -1 && v12 + v17 != -1)
        {
          objc_msgSend(v10, "subdataWithRange:");
          v6 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_5;
        }
      }
      if (a4)
      {
        VMUDirectedGraphErrorWithExtraUserInfo(1u, 0, CFSTR("This platform cannot map in the memory graph plist at offset %llu of size %llu"), v12, v13, v14, v15, v16, v11[2]);
        goto LABEL_18;
      }
    }
    v8 = 0;
    goto LABEL_6;
  }
  v6 = v5;
LABEL_5:
  v8 = v6;
LABEL_6:

  return v8;
}

- (id)decapsulateSupplementalData:(id)a3 forTag:(const char *)a4
{
  id v5;
  id v6;
  void *v7;
  id v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  const char *v20;
  char __dst[8];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((unint64_t)objc_msgSend(v5, "length") < 0x31)
    goto LABEL_3;
  v6 = objc_retainAutorelease(v5);
  if (*(_QWORD *)objc_msgSend(v6, "bytes") != 0x48504152474D454DLL)
    goto LABEL_3;
  v9 = objc_retainAutorelease(v6);
  v10 = objc_msgSend(v9, "bytes");
  if (!*(_DWORD *)(v10 + 40))
    goto LABEL_3;
  v11 = v10;
  v12 = 0;
  while (1)
  {
    v13 = *(_QWORD *)(v11 + 32) + v12 * *(unsigned __int16 *)(v11 + 44);
    if (v13 + 32 < (unint64_t)objc_msgSend(v9, "length"))
    {
      v14 = objc_retainAutorelease(v9);
      v15 = objc_msgSend(v14, "bytes");
      if (strlen(a4) >= 9)
        -[VMUDirectedGraph decapsulateSupplementalData:forTag:].cold.1();
      v16 = (_QWORD *)(v15 + v13);
      strncpy(__dst, a4, 8uLL);
      if (*(_QWORD *)__dst == *v16)
        break;
    }
    if (++v12 >= *(_DWORD *)(v11 + 40))
      goto LABEL_3;
  }
  v17 = v16[2];
  if (v17 == -1 || ((v18 = v16[3], v18 != -1) ? (v19 = v18 + v17 == -1) : (v19 = 1), v19))
  {
LABEL_3:
    v7 = 0;
  }
  else
  {
    objc_msgSend(v14, "subdataWithRange:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (kVMUPrintArchivingTiming)
    {
      v20 = "";
      if (!v16[3])
        v20 = "STACK LOGS FAILED TO SAVE";
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Full Stack Log History] dataOffset: %llu  dataSize: %llu  %s\n\n", v16[2], v16[3], v20);
    }
  }

  return v7;
}

+ (BOOL)encapsulateData:(id)a3 to:(id)a4 withSupplementalDataTag:(const char *)a5 error:(id *)a6 dataGeneratorBlock:(id)a7
{
  id v11;
  id v12;
  unsigned int (**v13)(id, _QWORD *);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  BOOL v20;
  const char *v22;
  int v23;
  const char *v24;
  int v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD v36[2];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  void *v40;
  _QWORD v41[4];
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = (unsigned int (**)(id, _QWORD *))a7;
  v14 = objc_msgSend(v11, "length");
  v15 = v14 + 48;
  v42 = xmmword_1A4E21D70;
  v43 = 48;
  v44 = objc_msgSend(v11, "length");
  v45 = v14 + 48;
  v46 = 0x30002000000001;
  if (nsfilehandle_write(v12, (uint64_t)&v42, 48, (uint64_t)a6)
    && objc_msgSend(v12, "writeData:error:", v11, a6))
  {
    v16 = -(int)v14 & 0xFLL;
    v37 = 0;
    v38 = &v37;
    v39 = 0x4010000000;
    v17 = v14 + v16 + 80;
    v40 = &unk_1A4E39779;
    v41[0] = 0;
    v41[1] = 0;
    v41[2] = v17;
    v41[3] = 0;
    if (strlen(a5) > 8)
    {
      v22 = "strlen(tag) <= 8";
      v23 = 310;
    }
    else
    {
      strncpy((char *)v41, a5, 8uLL);
      if (objc_msgSend(v12, "offsetInFile") == v15)
      {
        if (!nsfilehandle_write(v12, (uint64_t)(v38 + 4), 32, (uint64_t)a6)
          || (*(_QWORD *)((char *)v36 + 7) = 0,
              v36[0] = 0,
              (nsfilehandle_write(v12, (uint64_t)v36, v16, (uint64_t)a6) & 1) == 0))
        {
          v20 = 0;
LABEL_19:
          _Block_object_dispose(&v37, 8);
          goto LABEL_20;
        }
        if (objc_msgSend(v12, "offsetInFile") == v17)
        {
          if ((objc_msgSend(v12, "offsetInFile") & 0xF) == 0)
          {
            v30 = 0;
            v31 = &v30;
            v32 = 0x3032000000;
            v33 = __Block_byref_object_copy__9;
            v34 = __Block_byref_object_dispose__9;
            v35 = 0;
            v26[0] = MEMORY[0x1E0C809B0];
            v26[1] = 3221225472;
            v26[2] = __88__VMUDirectedGraph_encapsulateData_to_withSupplementalDataTag_error_dataGeneratorBlock___block_invoke;
            v26[3] = &unk_1E4E03BB8;
            v18 = v12;
            v27 = v18;
            v28 = &v30;
            v29 = &v37;
            if (v13[2](v13, v26))
            {
              if (a6)
              {
                v19 = (void *)v31[5];
                if (v19)
                {
                  v20 = 0;
                  *a6 = objc_retainAutorelease(v19);
LABEL_18:

                  _Block_object_dispose(&v30, 8);
                  goto LABEL_19;
                }
              }
            }
            else
            {
              objc_msgSend(v18, "seekToFileOffset:", v15);
              if (nsfilehandle_write(v18, (uint64_t)(v38 + 4), 32, (uint64_t)a6))
              {
                objc_msgSend(v18, "seekToEndOfFile");
                v20 = 1;
                goto LABEL_18;
              }
            }
            v20 = 0;
            goto LABEL_18;
          }
          v24 = "([fh offsetInFile] % 16) == 0";
          v25 = 323;
        }
        else
        {
          v24 = "[fh offsetInFile] == supplementalDataOffset";
          v25 = 322;
        }
        __assert_rtn("+[VMUDirectedGraph encapsulateData:to:withSupplementalDataTag:error:dataGeneratorBlock:]", "VMUDirectedGraph.m", v25, v24);
      }
      v22 = "[fh offsetInFile] == supplementalHeaderOffset";
      v23 = 312;
    }
    __assert_rtn("+[VMUDirectedGraph encapsulateData:to:withSupplementalDataTag:error:dataGeneratorBlock:]", "VMUDirectedGraph.m", v23, v22);
  }
  v20 = 0;
LABEL_20:

  return v20;
}

uint64_t __88__VMUDirectedGraph_encapsulateData_to_withSupplementalDataTag_error_dataGeneratorBlock___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t result;
  id obj;

  v5 = (void *)a1[4];
  v6 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v6 + 40);
  v7 = nsfilehandle_write(v5, a2, a3, (uint64_t)&obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
    return 5;
  result = 0;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 56) += a3;
  return result;
}

- (id)decapsulateIPSheaderInData:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  int v29;
  __CFString *v30;
  void *v31;
  uint64_t v33;
  id v34;

  v5 = objc_retainAutorelease(a3);
  if (!objc_msgSend(v5, "bytes"))
    goto LABEL_25;
  v5 = objc_retainAutorelease(v5);
  if (*(_BYTE *)objc_msgSend(v5, "bytes") != 123)
    goto LABEL_25;
  v5 = objc_retainAutorelease(v5);
  v6 = objc_msgSend(v5, "bytes");
  if (*(_BYTE *)(objc_msgSend(v5, "length") + v6 - 1) != 10)
    goto LABEL_25;
  v5 = objc_retainAutorelease(v5);
  v7 = (char *)memchr((void *)objc_msgSend(v5, "bytes"), 10, objc_msgSend(v5, "length"));
  if (!v7)
    goto LABEL_25;
  v8 = v7;
  v5 = objc_retainAutorelease(v5);
  v9 = &v8[-objc_msgSend(v5, "bytes")];
  objc_msgSend(v5, "subdataWithRange:", 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v10, 1, &v34);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v34;
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v13 = v11;
    v14 = objc_msgSend(v5, "length");
    objc_msgSend(v13, "objectForKey:", CFSTR("length"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = &v9[(int)(objc_msgSend(v15, "intValue") + 2)];

    if ((char *)v14 == v16)
    {
      objc_msgSend(v13, "objectForKey:", CFSTR("bug_type"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_msgSend(v27, "isEqualToString:", CFSTR("154")) & 1) != 0)
      {
        objc_msgSend(v5, "subdataWithRange:", v9 + 1, objc_msgSend(v5, "length") - (_QWORD)v9 - 2);
        v28 = objc_claimAutoreleasedReturnValue();

        v29 = 0;
        v5 = (id)v28;
      }
      else
      {
        v29 = 1;
        if (a4)
        {
          VMUDirectedGraphErrorWithExtraUserInfo(1u, 0, CFSTR("Invalid bug type in IPS header."), v22, v23, v24, v25, v26, v33);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }

      goto LABEL_22;
    }
    if (!a4)
    {
      v29 = 1;
      goto LABEL_22;
    }
    v30 = CFSTR("IPS length is invalid.");
  }
  else
  {
    if (!a4)
    {
      v29 = 1;
      goto LABEL_23;
    }
    objc_msgSend(v12, "localizedDescription");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v33 = (uint64_t)v13;
    v30 = CFSTR("Invalid IPS header: %@");
  }
  v29 = 1;
  VMUDirectedGraphErrorWithExtraUserInfo(1u, 0, v30, v17, v18, v19, v20, v21, v33);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

LABEL_23:
  if (!v29)
  {
LABEL_25:
    v5 = v5;
    v31 = v5;
    goto LABEL_26;
  }
  v31 = 0;
LABEL_26:

  return v31;
}

- (VMUDirectedGraph)initWithPlistRepresentation:(id)a3
{
  return -[VMUDirectedGraph initWithPlistRepresentation:error:](self, "initWithPlistRepresentation:error:", a3, 0);
}

- (VMUDirectedGraph)initWithPlistRepresentation:(id)a3 error:(id *)a4
{
  VMUDirectedGraph *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t graphCompatibilityVersion;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSDictionary *additionalProperties;
  void *v37;
  int v38;
  unsigned int nodeCount;
  int v40;
  char v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  VMUDirectedGraph *v56;
  void *v57;
  VMUDirectedGraph *v58;
  int64_t graphVersion;
  VMUDirectedGraph *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  uint64_t v69;
  id v70;
  id v71;
  _QWORD v72[2];
  _QWORD v73[3];

  v6 = self;
  v73[2] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1A85A9758](self, a2);
  v71 = 0;
  -[VMUDirectedGraph decapsulateIPSheaderInData:error:](v6, "decapsulateIPSheaderInData:error:", a3, &v71);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v71;
  if (!v8)
  {
    v17 = 0;
    v18 = 0;
LABEL_34:
    objc_autoreleasePoolPop(v7);
    goto LABEL_35;
  }
  -[VMUDirectedGraph decapsulateSupplementalData:forTag:](v6, "decapsulateSupplementalData:forTag:", v8, "DISKLOGS");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && !objc_msgSend(v10, "length"))
  {
    VMUDirectedGraphErrorWithExtraUserInfo(4u, 0, CFSTR("Memgraph file contained full stack log history header, but failed to store the actual stack log data."), v12, v13, v14, v15, v16, v62);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
  }
  else
  {
    v17 = 0;
  }
  v70 = v9;
  -[VMUDirectedGraph decapsulatePlistData:error:](v6, "decapsulatePlistData:error:", v8, &v70);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v70;

  if (!v18)
  {
LABEL_33:

    v9 = v19;
    goto LABEL_34;
  }
  v68 = 0;
  v69 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v18, 0, &v69, &v68);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v68;

  if (!v20)
  {
LABEL_32:

    v19 = v21;
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    VMUDirectedGraphErrorWithExtraUserInfo(1u, 0, CFSTR("File does not contain a memory graph in the correct format"), v22, v23, v24, v25, v26, v62);
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = v21;
LABEL_31:

    v21 = (id)v43;
    goto LABEL_32;
  }
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("graphCompatibilityVersion"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v6->_graphCompatibilityVersion = objc_msgSend(v27, "integerValue");

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("graphEncodingVersion"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v6->_graphVersion = objc_msgSend(v28, "integerValue");

  graphCompatibilityVersion = v6->_graphCompatibilityVersion;
  if (!graphCompatibilityVersion || graphCompatibilityVersion >= 3)
  {
    v72[0] = CFSTR("VMUDirectedGraphCompatibilityVersionNumberInGraphKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v72[1] = CFSTR("VMUDirectedGraphToolCompatibilityVersionKey");
    v73[0] = v45;
    v73[1] = &unk_1E4E207B8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6->_graphCompatibilityVersion)
      VMUDirectedGraphErrorWithExtraUserInfo(3u, v44, CFSTR("The graph version (%ld) is too new.  The latest graph version this tool supports is %d."), v46, v47, v48, v49, v50, v6->_graphCompatibilityVersion);
    else
      VMUDirectedGraphErrorWithExtraUserInfo(2u, v44, CFSTR("File does not contain memory graph version information (not in correct format)"), v46, v47, v48, v49, v50, v62);
    v43 = objc_claimAutoreleasedReturnValue();

    goto LABEL_31;
  }
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("nodes"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v6->_nodeCount = objc_msgSend(v30, "unsignedIntValue");

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("nodeNamespaceSize"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v6->_nextNodeName = objc_msgSend(v31, "unsignedIntValue");

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("edges"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v6->_externalEdges = objc_msgSend(v32, "unsignedIntValue");

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("edgeNamespaceSize"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v6->_nextEdgeName = objc_msgSend(v33, "unsignedIntValue");

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("additionalProperties"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "copy");
  additionalProperties = v6->_additionalProperties;
  v6->_additionalProperties = (NSDictionary *)v35;

  objc_msgSend(v20, "objectForKey:", CFSTR("graphIs64bit"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v37;
  if (v37)
  {
    v38 = objc_msgSend(v37, "BOOLValue");
    v6->_graphIs64bit = v38;
    if ((v38 & 1) == 0 && (nodeCount = v6->_nodeCount, nodeCount > 0x3FFFFFFE)
      || ((nodeCount = v6->_nextNodeName, nodeCount < 0x3FFFFFFF) ? (v40 = 1) : (v40 = v38), v40 != 1))
    {
      v42 = "node";
      goto LABEL_28;
    }
    nodeCount = v6->_nextEdgeName;
    if (nodeCount < 0x15555555)
      v41 = 1;
    else
      v41 = v38;
    if ((v41 & 1) == 0)
    {
      v42 = "reference";
LABEL_28:
      NSLog(CFSTR("Memory graph has bizarrely high %s count %zu\n"), v42, nodeCount);
      VMUDirectedGraphErrorWithExtraUserInfo(1u, 0, CFSTR("Memory graph is too large to open"), v51, v52, v53, v54, v55, v63);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v56 = 0;
      goto LABEL_41;
    }
  }
  else
  {
    v6->_graphIs64bit = 1;
  }
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("details"));
  v64 = objc_claimAutoreleasedReturnValue();
  graphVersion = v6->_graphVersion;
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("options"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v21;
  v61 = -[VMUDirectedGraph initWithArchived:version:options:diskLogs:error:](v6, "initWithArchived:version:options:diskLogs:error:", v64, graphVersion, objc_msgSend(v65, "unsignedIntValue"), v11, &v67);
  v9 = v67;

  v56 = v61;
  v21 = (id)v64;
  v6 = v56;
LABEL_41:

  objc_autoreleasePoolPop(v7);
  if (v56)
  {
    v58 = v56;

    if (!a4)
    {
      v57 = v17;
      goto LABEL_38;
    }
    v57 = v17;
    if (!v17)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_35:
  v57 = v17;

  v58 = 0;
  if (a4)
  {
    v17 = v9;
    if (v9)
LABEL_37:
      *a4 = objc_retainAutorelease(v17);
  }
LABEL_38:

  return v58;
}

- (VMUDirectedGraph)initWithArchived:(id)a3 version:(int64_t)a4 options:(unint64_t)a5 diskLogs:(id)a6 error:(id *)a7
{
  id v11;
  VMUDirectedGraph *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  BOOL v16;
  uint64_t edgeCount;
  void *v18;
  unint64_t v19;
  _VMUDirectedGraphEdge *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unsigned int nextNodeName;
  char v27;
  unsigned int v28;
  BOOL v29;
  unsigned int v30;
  BOOL v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unint64_t v35;
  unsigned int v36;
  int v37;
  int v38;
  _DWORD *p_var2;
  unsigned int v40;
  int v41;
  int v42;
  VMUDirectedGraph *v43;
  void *v44;
  void *v45;
  unsigned int *deadNodes;
  unint64_t v47;
  unint64_t v48;
  int v49;
  unsigned __int8 *v50;
  unsigned int v51;
  uint8x8_t v52;
  unint64_t v54;
  objc_super v55;
  uint64_t v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v55.receiver = self;
  v55.super_class = (Class)VMUDirectedGraph;
  v12 = -[VMUDirectedGraph init](&v55, sel_init);
  if (!v12)
  {
LABEL_51:
    v43 = v12;
    goto LABEL_52;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("directedGraphInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("compactEdgeList"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v54 = 0;
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sparseEdgeList"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_edges = (_VMUDirectedGraphEdge *)+[VMUDirectedGraph _copyUnarchived:length:options:](VMUDirectedGraph, "_copyUnarchived:length:options:", v18, &v54, a5);

    v19 = v54 / 0xC;
    v12->_edgeCount = v54 / 0xC;
    v12->_edgeCapacity = v19;
    if (kVMUPrintArchivingTiming)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Sparse Edges] Edge Count: %u\n\n");
    goto LABEL_42;
  }
  v15 = -[VMUDirectedGraph edgeNamespaceSize](v12, "edgeNamespaceSize");
  v12->_edgeCount = v15;
  v12->_edgeCapacity = v15;
  v16 = -[VMUDirectedGraph graphIs64bit](v12, "graphIs64bit");
  edgeCount = v12->_edgeCount;
  if (v16 || edgeCount < 0x15555555)
  {
    if ((_DWORD)edgeCount)
      v20 = (_VMUDirectedGraphEdge *)malloc_type_malloc(12 * edgeCount, 0x10000403E1C8BA9uLL);
    else
      v20 = 0;
    v12->_edges = v20;
    v54 = 0;
    v21 = +[VMUDirectedGraph _copyUnarchived:length:options:](VMUDirectedGraph, "_copyUnarchived:length:options:", v14, &v54, a5);
    v22 = v21;
    v23 = v12->_edgeCount;
    if (v54 < 4 * v23)
    {
      free(v21);
      if (a7)
      {
        v24 = (void *)MEMORY[0x1E0CB35C8];
        v56 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.Symbolication.VMUDirectedGraph"), 1, v25);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[VMUDirectedGraph initWithArchived:version:options:diskLogs:error:].cold.1();
      goto LABEL_39;
    }
    nextNodeName = v12->_nextNodeName;
    if (nextNodeName)
    {
      v27 = 0;
      v28 = v12->_nextNodeName;
      do
      {
        ++v27;
        v29 = v28 > 1;
        v28 >>= 1;
      }
      while (v29);
      if (a4 >= 2)
      {
LABEL_30:
        if ((_DWORD)v23)
        {
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v38 = 0;
          p_var2 = &v12->_edges->var2;
          do
          {
            v40 = *((_DWORD *)v21 + v36);
            if ((v40 & 0x80000000) != 0)
            {
              ++v37;
              v38 = v40 & 0x7FFFFFFF;
              v41 = *((_DWORD *)v21 + v36 + 1) & 0x7FFFFFFF;
              v42 = 2;
            }
            else
            {
              v38 += v40 >> v27;
              v41 = v40 & ~(-1 << v27);
              v42 = 1;
            }
            *(p_var2 - 2) = v35;
            *(p_var2 - 1) = v38;
            *p_var2 = v41;
            p_var2 += 3;
            v36 += v42;
            ++v35;
          }
          while (v35 < v12->_edgeCount);
        }
        goto LABEL_40;
      }
      v30 = 0;
      do
      {
        ++v30;
        v31 = nextNodeName >= 2;
        nextNodeName >>= 1;
      }
      while (v31);
    }
    else
    {
      v30 = 0;
      v27 = 0;
      if (a4 >= 2)
        goto LABEL_30;
    }
    if ((_DWORD)v23)
    {
      v32 = 0;
      v33 = v12->_edgeCount;
      do
      {
        ++v32;
        v29 = v33 > 1;
        v33 >>= 1;
      }
      while (v29);
      if (v30 <= v32)
      {
        v27 = 0;
        v34 = v12->_edgeCount;
        do
        {
          ++v27;
          v29 = v34 > 1;
          v34 >>= 1;
        }
        while (v29);
        goto LABEL_30;
      }
    }
    else if (!v30)
    {
LABEL_40:
      free(v21);
      if (kVMUPrintArchivingTiming)
        fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Dense Edges] Compact: %d Large: %d (%2.2f%%)\n\n");
LABEL_42:
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("inverted"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v12->_inverted = objc_msgSend(v44, "BOOLValue");

      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("deadNodes"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v12->_deadNodes = +[VMUDirectedGraph _copyUnarchived:length:options:](VMUDirectedGraph, "_copyUnarchived:length:options:", v45, 0, a5);

      deadNodes = (unsigned int *)v12->_deadNodes;
      if (deadNodes && kVMUPrintArchivingTiming)
      {
        v47 = *deadNodes;
        if ((_DWORD)v47)
        {
          v48 = 0;
          v49 = 0;
          v50 = (unsigned __int8 *)(deadNodes + 1);
          do
          {
            v51 = *v50++;
            v52 = (uint8x8_t)vcnt_s8((int8x8_t)v51);
            v52.i16[0] = vaddlv_u8(v52);
            v49 += v52.i32[0];
            v48 += 8;
          }
          while (v48 < v47);
        }
        else
        {
          v49 = 0;
        }
        fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Dead Nodes Marking Map] Count: %u\n\n", v49);
      }
      v12->_indexedEdges = -1;

      goto LABEL_51;
    }
    NSLog(CFSTR("memgraph file is malformed - unable to deserialize."));
    free(v22);
    goto LABEL_39;
  }
  NSLog(CFSTR("Memory graph has bizarrely high %s count %zu\n"), "reference", edgeCount);
LABEL_39:

  v43 = 0;
LABEL_52:

  return v43;
}

- (void)archiveDictionaryRepresentation:(id)a3 options:(unint64_t)a4
{
  void *v6;
  uint64_t edgeCount;
  unsigned int nextNodeName;
  char v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  unsigned int v18;
  _VMUDirectedGraphEdge *v19;
  unsigned int var1;
  BOOL v21;
  unsigned int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unsigned int *deadNodes;
  unint64_t v27;
  unint64_t v28;
  int v29;
  unsigned __int8 *v30;
  unsigned int v31;
  uint8x8_t v32;
  void *v33;
  id v34;

  v34 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a4 & 2) != 0)
    goto LABEL_29;
  edgeCount = self->_edgeCount;
  if ((_DWORD)edgeCount == self->_nextEdgeName && (self->_nextNodeName & 0x80000000) == 0)
  {
    -[VMUDirectedGraph _reorderEdgesNaturally](self, "_reorderEdgesNaturally");
    nextNodeName = self->_nextNodeName;
    if (nextNodeName)
    {
      v9 = 0;
      do
      {
        ++v9;
        v10 = nextNodeName > 1;
        nextNodeName >>= 1;
      }
      while (v10);
    }
    else
    {
      v9 = 0;
    }
    v12 = self->_edgeCount;
    if ((_DWORD)v12)
    {
      v13 = malloc_type_malloc(8 * v12, 0x6D61922EuLL);
      v14 = v13;
      if (self->_edgeCount)
      {
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 0;
        do
        {
          if (v15 * 12)
          {
            v19 = &self->_edges[v15];
            var1 = v19[-1].var1;
            LODWORD(v19) = v19->var1;
            v21 = v19 >= var1;
            v22 = (_DWORD)v19 - var1;
            if (!v21)
              v22 = -1;
          }
          else
          {
            v22 = -1;
          }
          if (v22 <= (0x80000000 >> v9) - 1)
          {
            *((_DWORD *)v13 + v18) = (self->_edges[v15].var2 | (v22 << v9)) & 0x7FFFFFFF;
          }
          else
          {
            ++v17;
            *((_DWORD *)v13 + v18++) = self->_edges[v15].var1 | 0x80000000;
            *((_DWORD *)v13 + v18) = self->_edges[v15].var2 | 0x80000000;
          }
          ++v18;
          ++v16;
          ++v15;
        }
        while (v16 < self->_edgeCount);
        v23 = 4 * v18;
        goto LABEL_25;
      }
    }
    else
    {
      v14 = 0;
    }
    v23 = 0;
LABEL_25:
    +[VMUDirectedGraph _archivedBytes:length:options:](VMUDirectedGraph, "_archivedBytes:length:options:", v14, v23, a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("compactEdgeList"));

    if (v14)
      free(v14);
    if (kVMUPrintArchivingTiming)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Dense Edges] Compact: %d Large: %d (%2.2f%%)\n\n");
    goto LABEL_29;
  }
  +[VMUDirectedGraph _archivedBytes:length:options:](VMUDirectedGraph, "_archivedBytes:length:options:", self->_edges, 12 * edgeCount, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("sparseEdgeList"));

  if (kVMUPrintArchivingTiming)
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Sparse Edges] Edge Count: %u\n\n");
LABEL_29:
  if (self->_nodeCount != self->_nextNodeName)
  {
    +[VMUDirectedGraph _archivedBytes:length:options:](VMUDirectedGraph, "_archivedBytes:length:options:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v25, CFSTR("deadNodes"));

    if (kVMUPrintArchivingTiming)
    {
      deadNodes = (unsigned int *)self->_deadNodes;
      v27 = *deadNodes;
      if ((_DWORD)v27)
      {
        v28 = 0;
        v29 = 0;
        v30 = (unsigned __int8 *)(deadNodes + 1);
        do
        {
          v31 = *v30++;
          v32 = (uint8x8_t)vcnt_s8((int8x8_t)v31);
          v32.i16[0] = vaddlv_u8(v32);
          v29 += v32.i32[0];
          v28 += 8;
        }
        while (v28 < v27);
      }
      else
      {
        v29 = 0;
      }
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "[Dead Nodes Marking Map] Count: %u\n\n", v29);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_inverted);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v33, CFSTR("inverted"));

  objc_msgSend(v34, "setObject:forKeyedSubscript:", v6, CFSTR("directedGraphInfo"));
}

- (id)plistRepresentationWithOptions:(unint64_t)a3
{
  return -[VMUDirectedGraph plistRepresentationWithOptions:fromOriginalMemgraph:](self, "plistRepresentationWithOptions:fromOriginalMemgraph:", a3, 0);
}

- (id)plistRepresentationWithOptions:(unint64_t)a3 fromOriginalMemgraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSDictionary *additionalProperties;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  id v41;

  v6 = a4;
  v7 = (void *)MEMORY[0x1A85A9758]();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_graphVersion);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("graphEncodingVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_graphCompatibilityVersion);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("graphCompatibilityVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_graphIs64bit);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("graphIs64bit"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_nodeCount);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("nodes"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_nextNodeName);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("nodeNamespaceSize"));

  if ((a3 & 2) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_externalEdges);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("edges"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_nextEdgeName);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("edgeNamespaceSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("options"));

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUDirectedGraph archiveDictionaryRepresentation:options:](self, "archiveDictionaryRepresentation:options:", v17, a3);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("details"));
  additionalProperties = self->_additionalProperties;
  if (additionalProperties)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", additionalProperties, CFSTR("additionalProperties"));
  if (!v6)
    goto LABEL_9;
  v19 = (void *)MEMORY[0x1E0CB38B0];
  -[VMUDirectedGraph decapsulatePlistData:error:](self, "decapsulatePlistData:error:", v6, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v19, "propertyListWithData:options:format:error:", v20, 0, 0, &v41);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v41;

  if (!v21)
  {
    objc_msgSend(v22, "localizedFailureReason");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = VMUDirectedGraphErrorWithExtraUserInfo(1u, 0, CFSTR("Unable to deserialize the memgraph %@"), v30, v31, v32, v33, v34, (uint64_t)v29);

LABEL_12:
    v28 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v36 = VMUDirectedGraphErrorWithExtraUserInfo(1u, 0, CFSTR("File does not contain a memory graph in the correct format"), v23, v24, v25, v26, v27, v38);
    goto LABEL_12;
  }
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __72__VMUDirectedGraph_plistRepresentationWithOptions_fromOriginalMemgraph___block_invoke;
  v39[3] = &unk_1E4E029D0;
  v40 = v8;
  objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v39);

LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v8, 200, 0, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  objc_autoreleasePoolPop(v7);
  return v28;
}

void __72__VMUDirectedGraph_plistRepresentationWithOptions_fromOriginalMemgraph___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v7);

}

- (void)dealloc
{
  void *deadNodes;
  unsigned int *nodeAdjIndex;
  _VMUDirectedGraphEdge *edges;
  objc_super v6;

  deadNodes = self->_deadNodes;
  if (deadNodes)
  {
    free(deadNodes);
    self->_deadNodes = 0;
  }
  nodeAdjIndex = self->_nodeAdjIndex;
  if (nodeAdjIndex)
  {
    free(nodeAdjIndex);
    self->_nodeAdjIndex = 0;
  }
  edges = self->_edges;
  if (edges)
  {
    free(edges);
    self->_edges = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)VMUDirectedGraph;
  -[VMUDirectedGraph dealloc](&v6, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  unsigned int *deadNodes;
  unsigned int v6;
  _DWORD *v7;
  unsigned int *v8;
  unsigned int v9;
  unint64_t v10;
  char *v11;
  _BYTE *v12;
  unint64_t v13;
  char v14;
  unsigned int edgeCount;
  void *v16;
  uint64_t v17;
  void *v18;

  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNodes:", self->_nextNodeName);
  *(_DWORD *)(v4 + 24) = self->_nodeCount;
  deadNodes = (unsigned int *)self->_deadNodes;
  if (deadNodes)
  {
    v6 = *deadNodes;
    v7 = malloc_type_calloc(1uLL, ((*deadNodes + 7) >> 3) + 4, 0xFF42C4F3uLL);
    *v7 = v6;
    *(_QWORD *)(v4 + 40) = v7;
    v8 = (unsigned int *)self->_deadNodes;
    v9 = *v8;
    if (v6 < *v8)
      v9 = v6;
    v10 = v9 + 7;
    if (v10 >= 8)
    {
      v11 = (char *)(v8 + 1);
      v12 = v7 + 1;
      v13 = v10 >> 3;
      do
      {
        v14 = *v11++;
        *v12++ |= v14;
        --v13;
      }
      while (v13);
    }
  }
  edgeCount = self->_edgeCount;
  *(_DWORD *)(v4 + 28) = edgeCount;
  *(_DWORD *)(v4 + 32) = edgeCount;
  *(_DWORD *)(v4 + 36) = self->_externalEdges;
  *(_DWORD *)(v4 + 52) = self->_nextEdgeName;
  v16 = malloc_type_malloc(12 * self->_edgeCount, 0x10000403E1C8BA9uLL);
  *(_QWORD *)(v4 + 64) = v16;
  memcpy(v16, self->_edges, 12 * self->_edgeCount);
  *(_QWORD *)(v4 + 80) = -1;
  v17 = -[NSDictionary copy](self->_additionalProperties, "copy");
  v18 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = v17;

  *(_BYTE *)(v4 + 92) = self->_inverted;
  *(_BYTE *)(v4 + 93) = self->_graphIs64bit;
  return (id)v4;
}

- (unsigned)addNode
{
  unsigned int nextNodeName;

  ++self->_nodeCount;
  nextNodeName = self->_nextNodeName;
  self->_nextNodeName = nextNodeName + 1;
  return nextNodeName;
}

- (void)_internalAddEdgeFromNode:(unsigned int)a3 toNode:(unsigned int)a4 withName:
{
  void **v7;
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int *v15;

  if (result)
  {
    v7 = result;
    v8 = *((_DWORD *)result + 7);
    v9 = *((unsigned int *)result + 8);
    if (v8 >= v9)
    {
      LODWORD(v10) = 2 * v9;
      if ((2 * v9) <= 0x100)
        v10 = 256;
      else
        v10 = v10;
      v11 = v9 + 174762;
      if (v11 >= v10)
        v12 = v10;
      else
        v12 = v11;
      result = (void **)malloc_type_realloc(result[8], 12 * v12, 0x10000403E1C8BA9uLL);
      v7[8] = result;
      if (!result)
      {
        NSLog(CFSTR("Out of memory: failed to expand references array from %u to %u edges"), *((unsigned int *)v7 + 8), v12);
        abort();
      }
      *((_DWORD *)v7 + 8) = v12;
      v8 = *((_DWORD *)v7 + 7);
    }
    else
    {
      result = (void **)result[8];
    }
    if (*((_BYTE *)v7 + 92))
      v13 = a2;
    else
      v13 = a3;
    if (*((_BYTE *)v7 + 92))
      v14 = a3;
    else
      v14 = a2;
    v15 = (unsigned int *)result + 3 * v8;
    *v15 = a4;
    v15[1] = v14;
    v15[2] = v13;
    ++*((_DWORD *)v7 + 7);
    if (a4 <= 0xFFFFFFFA)
      ++*((_DWORD *)v7 + 9);
  }
  return result;
}

- (unsigned)addEdgeFromNode:(unsigned int)a3 toNode:(unsigned int)a4
{
  unsigned int nextNodeName;
  unsigned int result;
  unsigned int *deadNodes;
  unsigned int v9;

  nextNodeName = self->_nextNodeName;
  if (nextNodeName <= a3 || nextNodeName <= a4)
    return -1;
  deadNodes = (unsigned int *)self->_deadNodes;
  if (deadNodes)
  {
    if (*deadNodes > a3 && ((*((unsigned __int8 *)deadNodes + (a3 >> 3) + 4) >> (a3 & 7)) & 1) != 0
      || *deadNodes > a4 && ((*((unsigned __int8 *)deadNodes + (a4 >> 3) + 4) >> (a4 & 7)) & 1) != 0)
    {
      return -1;
    }
  }
  if (self->_inverted)
    v9 = a4;
  else
    v9 = a3;
  if (!self->_inverted)
    a3 = a4;
  -[VMUDirectedGraph _internalAddEdgeFromNode:toNode:withName:]((void **)&self->super.isa, v9, a3, self->_nextEdgeName);
  result = self->_nextEdgeName;
  self->_nextEdgeName = result + 1;
  return result;
}

- (void)_removeEdges:(id)a3
{
  unint64_t v3;
  unsigned int edgeCount;
  unsigned int i;
  _VMUDirectedGraphEdge *v7;
  _VMUDirectedGraphEdge *edges;
  _VMUDirectedGraphEdge *v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int var2;
  _VMUDirectedGraphEdge *v13;
  unsigned int v14;
  _VMUDirectedGraphEdge *v15;
  unsigned int v16;
  unsigned int (**v17)(id, _QWORD, unint64_t);

  v17 = (unsigned int (**)(id, _QWORD, unint64_t))a3;
  if (v17)
  {
    edgeCount = self->_edgeCount;
    if (edgeCount)
    {
      for (i = 0; i < edgeCount; ++i)
      {
        v7 = &self->_edges[i];
        v3 = v3 & 0xFFFFFFFF00000000 | v7->var2;
        if (v17[2](v17, *(_QWORD *)&v7->var0, v3))
        {
          edges = self->_edges;
          v9 = &edges[i];
          if (v9->var0 <= 0xFFFFFFFA)
            --self->_externalEdges;
          v10 = self->_edgeCount - 1;
          self->_edgeCount = v10;
          v11 = *(_QWORD *)&v9->var0;
          var2 = v9->var2;
          v13 = &edges[v10];
          v14 = v13->var2;
          *(_QWORD *)&v9->var0 = *(_QWORD *)&v13->var0;
          v9->var2 = v14;
          v15 = &self->_edges[self->_edgeCount];
          v15->var2 = var2;
          *(_QWORD *)&v15->var0 = v11;
          --i;
        }
        edgeCount = self->_edgeCount;
      }
    }
    if (edgeCount < self->_edgeCapacity >> 1)
    {
      v16 = ((double)edgeCount * 1.05);
      self->_edgeCapacity = v16;
      self->_edges = (_VMUDirectedGraphEdge *)malloc_type_realloc(self->_edges, 12 * v16, 0x10000403E1C8BA9uLL);
    }
  }

}

- (void)_faultDeadNodeMap
{
  unint64_t v2;
  unsigned int *deadNodes;
  unsigned int v5;
  unsigned int nextNodeName;
  unsigned int v7;
  _DWORD *v8;
  unsigned int *v9;
  unsigned int v10;
  unint64_t v11;
  char *v12;
  _BYTE *v13;
  unint64_t v14;
  char v15;
  unsigned int v16;

  deadNodes = (unsigned int *)self->_deadNodes;
  if (deadNodes)
  {
    v5 = *deadNodes;
    nextNodeName = self->_nextNodeName;
    if (v5 >= nextNodeName)
      return;
    v7 = ((double)nextNodeName * 1.25);
    v8 = malloc_type_calloc(1uLL, ((v7 + 7) >> 3) + 4, 0xFF42C4F3uLL);
    *v8 = v7;
    v9 = (unsigned int *)self->_deadNodes;
    v10 = *v9;
    if (v7 < *v9)
      v10 = v7;
    v11 = v10 + 7;
    if (v11 >= 8)
    {
      v12 = (char *)(v9 + 1);
      v13 = v8 + 1;
      v14 = v11 >> 3;
      do
      {
        v15 = *v12++;
        *v13++ |= v15;
        --v14;
      }
      while (v14);
      v9 = (unsigned int *)self->_deadNodes;
    }
    free(v9);
  }
  else
  {
    LODWORD(v2) = self->_nextNodeName;
    v16 = ((double)v2 * 1.05);
    v8 = malloc_type_calloc(1uLL, ((v16 + 7) >> 3) + 4, 0xFF42C4F3uLL);
    *v8 = v16;
  }
  self->_deadNodes = v8;
}

- (void)deadNodeMap
{
  return self->_deadNodes;
}

- (void)removeMarkedNodes:(void *)a3
{
  unsigned int nextNodeName;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned int v8;
  unint64_t v9;
  char *v10;
  _BYTE *v11;
  unint64_t v12;
  char v13;
  _DWORD *deadNodes;
  int v15;
  unint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  int v19;
  _DWORD *v20;
  int v21;
  int v22;
  unint64_t v23;
  _BYTE *v24;
  char *v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  int v31;
  unint64_t edgeCount;
  uint64_t v33;
  unint64_t i;
  _VMUDirectedGraphEdge *edges;
  unint64_t var2;
  unint64_t var1;
  int8x8_t v38;
  _DWORD *v39;
  int v40;
  unint64_t v41;
  int v42;
  unsigned __int8 *v43;
  unsigned __int8 *v44;
  unint64_t v45;
  int v46;
  int v47;
  _QWORD v48[5];

  if (a3)
  {
    -[VMUDirectedGraph _faultDeadNodeMap](self, "_faultDeadNodeMap");
    nextNodeName = self->_nextNodeName;
    v6 = (unsigned __int8 *)malloc_type_calloc(1uLL, ((nextNodeName + 7) >> 3) + 4, 0xFF42C4F3uLL);
    v7 = v6;
    *(_DWORD *)v6 = nextNodeName;
    v8 = *(_DWORD *)a3;
    if (nextNodeName < *(_DWORD *)a3)
      v8 = nextNodeName;
    v9 = v8 + 7;
    if (v9 >= 8)
    {
      v10 = (char *)a3 + 4;
      v11 = v6 + 4;
      v12 = v9 >> 3;
      do
      {
        v13 = *v10++;
        *v11++ |= v13;
        --v12;
      }
      while (v12);
    }
    deadNodes = self->_deadNodes;
    v15 = *deadNodes;
    v16 = (*deadNodes + 7);
    if (v16 >= 8)
    {
      v17 = deadNodes + 1;
      v18 = v16 >> 3;
      if (v16 >> 3 <= 1)
        v18 = 1;
      do
      {
        *v17 = ~*v17;
        ++v17;
        --v18;
      }
      while (v18);
    }
    v19 = v15 & 7;
    if (v19)
      *((_BYTE *)deadNodes + (v16 >> 3) + 3) ^= -1 << v19;
    v20 = self->_deadNodes;
    v21 = *(_DWORD *)v6;
    v22 = *v20;
    if (*(_DWORD *)v6 >= *v20)
      v21 = *v20;
    v23 = (v21 + 7);
    if (v23 >= 8)
    {
      v24 = v6 + 4;
      v25 = (char *)(v20 + 1);
      v26 = v23 >> 3;
      do
      {
        v27 = *v25++;
        *v24++ &= v27;
        --v26;
      }
      while (v26);
      v20 = self->_deadNodes;
      v22 = *v20;
    }
    v28 = (v22 + 7);
    if (v28 >= 8)
    {
      v29 = v20 + 1;
      v30 = v28 >> 3;
      if (v28 >> 3 <= 1)
        v30 = 1;
      do
      {
        *v29 = ~*v29;
        ++v29;
        --v30;
      }
      while (v30);
    }
    v31 = v22 & 7;
    if (v31)
      *((_BYTE *)v20 + (v28 >> 3) + 3) ^= -1 << v31;
    edgeCount = self->_edgeCount;
    if ((_DWORD)edgeCount)
    {
      v33 = 0;
      for (i = 0; i < edgeCount; ++i)
      {
        edges = self->_edges;
        if (edges[v33].var0 == -3)
        {
          var2 = edges[v33].var2;
          if (*(_DWORD *)v6 > var2 && ((v6[(var2 >> 3) + 4] >> (var2 & 7)) & 1) != 0)
          {
            var1 = edges[v33].var1;
            if (*(_DWORD *)v6 > var1)
            {
              v6[(var1 >> 3) + 4] |= 1 << (var1 & 7);
              edgeCount = self->_edgeCount;
            }
          }
        }
        ++v33;
      }
    }
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __38__VMUDirectedGraph_removeMarkedNodes___block_invoke;
    v48[3] = &__block_descriptor_40_e34_B20__0__VMUDirectedGraphEdge_III_8l;
    v48[4] = v6;
    -[VMUDirectedGraph _removeEdges:](self, "_removeEdges:", v48);
    v39 = self->_deadNodes;
    v40 = *v39;
    if (*v39 >= *(_DWORD *)v7)
      v40 = *(_DWORD *)v7;
    v41 = (v40 + 7);
    if (v41 >= 8)
    {
      v42 = 0;
      v43 = v7 + 4;
      v44 = (unsigned __int8 *)(v39 + 1);
      v45 = v41 >> 3;
      do
      {
        v46 = *v43++;
        v47 = *v44;
        v38.i32[0] = v46 & ~v47;
        v38 = vcnt_s8(v38);
        v38.i16[0] = vaddlv_u8((uint8x8_t)v38);
        v42 += v38.i32[0];
        *v44++ = v47 | v46;
        --v45;
      }
      while (v45);
    }
    else
    {
      v42 = 0;
    }
    self->_nodeCount -= v42;
    free(v7);
    if (self->_insideSearch)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("VMUDestructiveMutationWhileEnumeratingException"), CFSTR("Destructive mutation attempted while traversing graph!"));
    else
      self->_indexedEdges = -1;
  }
}

uint64_t __38__VMUDirectedGraph_removeMarkedNodes___block_invoke(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int *v3;

  v3 = *(unsigned int **)(a1 + 32);
  if (*v3 > HIDWORD(a2) && ((*((unsigned __int8 *)v3 + (HIDWORD(a2) >> 3) + 4) >> (BYTE4(a2) & 7)) & 1) != 0)
    return 1;
  if (*v3 <= a3)
    return 0;
  return (*((unsigned __int8 *)v3 + (a3 >> 3) + 4) >> (a3 & 7)) & 1;
}

- (void)removeMarkedEdges:(void *)a3
{
  _QWORD v4[5];

  if (a3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __38__VMUDirectedGraph_removeMarkedEdges___block_invoke;
    v4[3] = &__block_descriptor_40_e34_B20__0__VMUDirectedGraphEdge_III_8l;
    v4[4] = a3;
    -[VMUDirectedGraph _removeEdges:](self, "_removeEdges:", v4);
    if (self->_insideSearch)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("VMUDestructiveMutationWhileEnumeratingException"), CFSTR("Destructive mutation attempted while traversing graph!"));
    else
      self->_indexedEdges = -1;
  }
}

uint64_t __38__VMUDirectedGraph_removeMarkedEdges___block_invoke(uint64_t a1, unsigned int a2)
{
  unsigned int *v2;

  v2 = *(unsigned int **)(a1 + 32);
  if (*v2 <= a2)
    return 0;
  else
    return (*((unsigned __int8 *)v2 + (a2 >> 3) + 4) >> (a2 & 7)) & 1;
}

- (BOOL)isNodePresent:(unsigned int)a3
{
  unsigned int *deadNodes;

  if (self->_nextNodeName <= a3)
    return 0;
  deadNodes = (unsigned int *)self->_deadNodes;
  return !deadNodes
      || *deadNodes <= a3
      || ((*((unsigned __int8 *)deadNodes + (a3 >> 3) + 4) >> (a3 & 7)) & 1) == 0
      || -[VMUDirectedGraph parentGroupForNode:](self, "parentGroupForNode:") != -1;
}

- (unsigned)addGroupNodeForNodes:(const unsigned int *)a3 count:(unsigned int)a4
{
  unsigned int nextNodeName;
  unsigned int *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const unsigned int *v10;
  unint64_t v11;
  unsigned int v12;
  _DWORD *deadNodes;
  uint64_t v14;
  unint64_t v15;
  _DWORD *v16;
  uint64_t v17;
  int v18;
  int v19;

  nextNodeName = -1;
  if (a3 && a4 >= 2)
  {
    v5 = (unsigned int *)a3;
    v7 = 0;
    nextNodeName = self->_nextNodeName;
    v8 = a4;
    v9 = a4;
    v10 = a3;
    while (1)
    {
      v12 = *v10++;
      v11 = v12;
      if (v12 < nextNodeName)
      {
        deadNodes = self->_deadNodes;
        if (!deadNodes
          || *deadNodes <= v11
          || ((*((unsigned __int8 *)deadNodes + (v11 >> 3) + 4) >> (v11 & 7)) & 1) == 0)
        {
          break;
        }
      }
      v14 = v7;
LABEL_10:
      v7 = v14;
      if (!--v9)
        return -1;
    }
    v14 = 1;
    if (!(_DWORD)v7)
      goto LABEL_10;
    ++self->_nodeCount;
    self->_nextNodeName = nextNodeName + 1;
    -[VMUDirectedGraph _faultDeadNodeMap](self, "_faultDeadNodeMap");
    while (1)
    {
      v15 = *v5;
      if (v15 < self->_nextNodeName)
      {
        v16 = self->_deadNodes;
        if (*v16 <= v15)
          goto LABEL_17;
        v17 = (v15 >> 3) + 4;
        v18 = *((unsigned __int8 *)v16 + v17);
        v19 = 1 << (v15 & 7);
        if ((v19 & v18) == 0)
          break;
      }
LABEL_18:
      ++v5;
      if (!--v8)
        return nextNodeName;
    }
    *((_BYTE *)v16 + v17) = v18 | v19;
LABEL_17:
    --self->_nodeCount;
    -[VMUDirectedGraph _internalAddEdgeFromNode:toNode:withName:]((void **)&self->super.isa, nextNodeName, *v5, 0xFFFFFFFE);
    goto LABEL_18;
  }
  return nextNodeName;
}

- (void)ungroupNode:(unsigned int)a3
{
  unsigned int *deadNodes;
  unsigned int *v6;
  _QWORD v7[6];
  unsigned int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  deadNodes = (unsigned int *)self->_deadNodes;
  if (deadNodes
    && self->_nextNodeName > a3
    && (*deadNodes <= a3 || ((*((unsigned __int8 *)deadNodes + (a3 >> 3) + 4) >> (a3 & 7)) & 1) == 0))
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __32__VMUDirectedGraph_ungroupNode___block_invoke;
    v7[3] = &unk_1E4E03C00;
    v8 = a3;
    v7[4] = self;
    v7[5] = &v9;
    -[VMUDirectedGraph _removeEdges:](self, "_removeEdges:", v7);
    if (*((_BYTE *)v10 + 24))
    {
      v6 = (unsigned int *)self->_deadNodes;
      if (*v6 > a3)
        *((_BYTE *)v6 + (a3 >> 3) + 4) |= 1 << (a3 & 7);
      --self->_nodeCount;
      if (self->_insideSearch)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("VMUDestructiveMutationWhileEnumeratingException"), CFSTR("Destructive mutation attempted while traversing graph!"));
      else
        self->_indexedEdges = -1;
    }
    _Block_object_dispose(&v9, 8);
  }
}

uint64_t __32__VMUDirectedGraph_ungroupNode___block_invoke(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int *v3;
  uint64_t v4;

  if (__PAIR64__(*(_DWORD *)(a1 + 48), -2) != a2)
    return 0;
  v3 = *(unsigned int **)(*(_QWORD *)(a1 + 32) + 40);
  if (*v3 > a3)
    *((_BYTE *)v3 + (a3 >> 3) + 4) &= ~(1 << (a3 & 7));
  v4 = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 24);
  return v4;
}

- (void)setInverted:(BOOL)a3
{
  self->_inverted = a3;
  if (self->_insideSearch)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("VMUDestructiveMutationWhileEnumeratingException"), CFSTR("Destructive mutation attempted while traversing graph!"));
  else
    self->_indexedEdges = -1;
}

- (BOOL)inverted
{
  return self->_inverted;
}

- (unsigned)pointerSize
{
  if (self->_graphIs64bit)
    return 8;
  else
    return 4;
}

- (BOOL)_adjustAdjacencyMap
{
  unsigned int nextNodeName;
  unsigned int indexedNodeSpace;
  BOOL v6;
  uint64_t v7;
  unsigned int *nodeAdjIndex;
  unint64_t v10;
  int v11;
  unsigned int *p_var1;
  int v13;
  unsigned int *v14;
  unsigned int *v15;
  int v16;
  unint64_t edgeCount;
  unsigned int v18;
  unsigned int edgeCapacity;
  BOOL v20;
  unint64_t v21;
  unsigned int v22;
  unsigned int *v23;
  _VMUDirectedGraphEdge *v24;
  unsigned int v25;
  unsigned int v26;
  int v27;
  unint64_t v28;
  _VMUDirectedGraphEdge *edges;
  _VMUDirectedGraphEdge *v30;
  unsigned int *v31;
  unint64_t v32;
  uint64_t var1;
  unsigned int v34;
  _VMUDirectedGraphEdge *v35;
  uint64_t v36;
  unsigned int *v37;
  _VMUDirectedGraphEdge *v38;
  uint64_t var2;
  unsigned int v40;
  _VMUDirectedGraphEdge *v41;
  uint64_t v42;
  _VMUDirectedGraphEdge *v43;
  unsigned int *v44;
  _VMUDirectedGraphEdge *v45;
  unsigned int *p_var2;
  unsigned int *v47;
  uint64_t v48;
  unsigned int v49;
  _VMUDirectedGraphEdge *v50;
  uint64_t v51;
  unint64_t v52;
  int v53;
  unsigned int v54;
  unsigned int *v55;
  unsigned int *v56;
  unsigned int v57;
  unsigned int *v58;
  _VMUDirectedGraphEdge *v59;
  uint64_t v60;
  unint64_t i;
  unsigned int *deadNodes;
  unint64_t v63;
  _VMUDirectedGraphEdge *v64;
  unsigned int *v65;
  unint64_t v66;
  unsigned int v67;
  unint64_t v68;
  unsigned int v69;
  _VMUDirectedGraphEdge *v70;
  unsigned int v71;
  _VMUDirectedGraphEdge *v72;
  uint64_t v73;
  unsigned int v74;

  nextNodeName = self->_nextNodeName;
  if (nextNodeName)
  {
    indexedNodeSpace = self->_indexedNodeSpace;
    if (indexedNodeSpace < nextNodeName || indexedNodeSpace == -1)
    {
      self->_indexedNodeSpace = nextNodeName;
      v6 = -[VMUDirectedGraph graphIs64bit](self, "graphIs64bit");
      v7 = self->_indexedNodeSpace;
      if (!v6 && v7 >= 0x3FFFFFFF)
      {
        NSLog(CFSTR("Memory graph has bizarrely high %s count %zu\n"), "node", v7);
        return 0;
      }
      nodeAdjIndex = (unsigned int *)malloc_type_realloc(self->_nodeAdjIndex, 4 * v7, 0x100004052888210uLL);
      self->_nodeAdjIndex = nodeAdjIndex;
      indexedNodeSpace = self->_indexedNodeSpace;
    }
    else
    {
      nodeAdjIndex = self->_nodeAdjIndex;
    }
    bzero(nodeAdjIndex, 4 * indexedNodeSpace);
    if (self->_edgeCount)
    {
      v10 = 0;
      v11 = 0;
      p_var1 = &self->_edges->var1;
      do
      {
        v13 = *(p_var1 - 1);
        if (v13 != -3)
        {
          if (v13 == -2)
          {
            v11 += 3;
            v14 = self->_nodeAdjIndex;
            v15 = p_var1 + 1;
            ++v14[*p_var1];
            v16 = 2;
          }
          else
          {
            v14 = self->_nodeAdjIndex;
            if (self->_inverted)
              v15 = p_var1 + 1;
            else
              v15 = p_var1;
            v16 = 1;
          }
          v14[*v15] += v16;
        }
        p_var1 += 3;
        ++v10;
        edgeCount = self->_edgeCount;
      }
      while (v10 < edgeCount);
    }
    else
    {
      v11 = 0;
      LODWORD(edgeCount) = 0;
    }
    v18 = self->_externalEdges + v11;
    if (self->_edgeCapacity <= v18)
      edgeCapacity = self->_externalEdges + v11;
    else
      edgeCapacity = self->_edgeCapacity;
    self->_edgeCapacity = edgeCapacity;
    if (edgeCapacity)
      v20 = 1;
    else
      v20 = (edgeCount | v11) == 0;
    if (!v20)
      -[VMUDirectedGraph _adjustAdjacencyMap].cold.1();
    if (self->_indexedNodeSpace)
    {
      v21 = 0;
      v22 = 0;
      v23 = self->_nodeAdjIndex;
      do
      {
        v22 += v23[v21];
        v23[v21++] = v22;
      }
      while (v21 < self->_indexedNodeSpace);
      edgeCapacity = self->_edgeCapacity;
    }
    if (edgeCapacity)
      v24 = (_VMUDirectedGraphEdge *)malloc_type_malloc(12 * edgeCapacity, 0x10000403E1C8BA9uLL);
    else
      v24 = 0;
    v25 = self->_edgeCount;
    if (v25)
    {
      v26 = 0;
      v27 = -1;
      do
      {
        v28 = v25 + v27;
        edges = self->_edges;
        v30 = &edges[v28];
        if (v30->var0 != -3)
        {
          if (v30->var0 == -2)
          {
            v31 = self->_nodeAdjIndex;
            v32 = v28;
            var1 = edges[v32].var1;
            v34 = v31[var1] - 1;
            v31[var1] = v34;
            v35 = &v24[v34];
            v36 = *(_QWORD *)&v30->var0;
            v35->var2 = v30->var2;
            *(_QWORD *)&v35->var0 = v36;
            v37 = self->_nodeAdjIndex;
            v38 = &self->_edges[v32];
            LODWORD(v36) = v38->var1;
            var2 = v38->var2;
            v40 = v37[var2] - 1;
            v37[var2] = v40;
            v41 = &v24[v40];
            v41->var0 = -3;
            v41->var1 = var2;
            v41->var2 = v36;
            v42 = v38->var2;
            LODWORD(v41) = v37[v42] - 1;
            v37[v42] = v41;
            v43 = &v24[v41];
            v43->var0 = -3;
            v43->var1 = var2;
            v43->var2 = v36;
          }
          else
          {
            v44 = self->_nodeAdjIndex;
            v45 = &edges[v28];
            p_var2 = &v45->var2;
            v47 = &v45->var1;
            if (self->_inverted)
              v47 = p_var2;
            v48 = *v47;
            v49 = v44[v48] - 1;
            v44[v48] = v49;
            v50 = &v24[v49];
            v51 = *(_QWORD *)&v30->var0;
            v50->var2 = v30->var2;
            *(_QWORD *)&v50->var0 = v51;
          }
        }
        ++v26;
        v25 = self->_edgeCount;
        --v27;
      }
      while (v26 < v25);
    }
    self->_edgeCount = v18;
    if (v11 && v18)
    {
      v52 = 0;
      v53 = 0;
      v54 = 0;
      v55 = &v24->var1;
      do
      {
        v56 = v55;
        if (self->_inverted)
        {
          v56 = &v24[v52].var2;
          if (*(v55 - 1) > 0xFFFFFFFA)
            v56 = v55;
        }
        v57 = *v56;
        if (v54 == v57)
        {
          v58 = v55 - 1;
          if (*(v55 - 1) == -3)
          {
            v74 = v55[1];
            v73 = *(_QWORD *)v58;
            v59 = &v24[v53];
            v60 = *(_QWORD *)&v59->var0;
            v55[1] = v59->var2;
            *(_QWORD *)v58 = v60;
            *(_QWORD *)&v59->var0 = v73;
            v59->var2 = v74;
            ++v53;
            v18 = self->_edgeCount;
          }
        }
        else
        {
          v54 = v57;
          v53 = v52;
        }
        ++v52;
        v55 += 3;
      }
      while (v52 < v18);
      if (v18)
      {
        for (i = 0; i < v18; ++i)
        {
          if (v24[i].var0 == -3 && v24[i].var1 != -1)
          {
            deadNodes = (unsigned int *)self->_deadNodes;
            v63 = *deadNodes;
            v64 = &v24[i];
            v67 = v64->var2;
            v65 = &v64->var2;
            v66 = v67;
            if (v63 > v67)
            {
              v68 = v66;
              do
              {
                if (((*((unsigned __int8 *)deadNodes + (v68 >> 3) + 4) >> (v68 & 7)) & 1) == 0)
                  break;
                v68 = v24[self->_nodeAdjIndex[v68]].var2;
              }
              while (v63 > v68);
              if (v63 > v66)
              {
                do
                {
                  if (((*((unsigned __int8 *)deadNodes + (v66 >> 3) + 4) >> (v66 & 7)) & 1) == 0)
                    break;
                  v69 = self->_nodeAdjIndex[v66];
                  *v65 = v68;
                  v70 = &v24[v69];
                  v71 = v70->var2;
                  v65 = &v70->var2;
                  v66 = v71;
                }
                while (*deadNodes > (unint64_t)v71);
                v18 = self->_edgeCount;
              }
            }
          }
        }
      }
    }
    v72 = self->_edges;
    if (v72)
    {
      free(v72);
      v18 = self->_edgeCount;
    }
    self->_edges = v24;
    self->_indexedEdges = v18;
  }
  else
  {
    self->_indexedEdges = 0;
  }
  return 1;
}

- (void)_renormalize
{
  size_t v3;
  void *v4;
  size_t v5;
  void *v6;
  unsigned int nextNodeName;
  _DWORD *v8;
  uint64_t v9;
  unint64_t v10;
  _VMUDirectedGraphEdge *edges;
  unint64_t var1;
  unint64_t var2;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unsigned int *deadNodes;
  uint64_t v18;
  int v19;
  unint64_t edgeCount;
  unint64_t v21;
  _VMUDirectedGraphEdge *v22;
  uint64_t v23;
  unsigned int var0;
  unsigned int externalEdges;
  int v26;
  int __pattern4;

  v3 = 4 * self->_nextNodeName;
  v4 = malloc_type_malloc(v3, 0x100004052888210uLL);
  __pattern4 = -1;
  memset_pattern4(v4, &__pattern4, v3);
  v5 = 4 * self->_nextEdgeName;
  v6 = malloc_type_malloc(v5, 0x100004052888210uLL);
  v26 = -1;
  memset_pattern4(v6, &v26, v5);
  nextNodeName = self->_nextNodeName;
  v8 = malloc_type_calloc(1uLL, ((nextNodeName + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *v8 = nextNodeName;
  if (self->_edgeCount)
  {
    v9 = 0;
    v10 = 0;
    do
    {
      edges = self->_edges;
      var1 = edges[v9].var1;
      if (nextNodeName > var1)
      {
        *((_BYTE *)v8 + (var1 >> 3) + 4) |= 1 << (var1 & 7);
        edges = self->_edges;
      }
      var2 = edges[v9].var2;
      if (nextNodeName > var2)
        *((_BYTE *)v8 + (var2 >> 3) + 4) |= 1 << (var2 & 7);
      ++v10;
      ++v9;
    }
    while (v10 < self->_edgeCount);
  }
  v14 = self->_nextNodeName;
  if ((_DWORD)v14)
  {
    v15 = 0;
    v16 = 0;
    deadNodes = (unsigned int *)self->_deadNodes;
    do
    {
      if (!deadNodes
        || v15 >= *deadNodes
        || (v18 = (v15 >> 3) + 4,
            v19 = 1 << (v15 & 7),
            (v19 & *((_BYTE *)deadNodes + v18)) == 0)
        || v15 < *v8 && (v19 & *((_BYTE *)v8 + v18)) != 0)
      {
        *((_DWORD *)v4 + v15) = v16;
        v16 = (v16 + 1);
        v14 = self->_nextNodeName;
      }
      ++v15;
    }
    while (v15 < v14);
  }
  else
  {
    v16 = 0;
  }
  free(v8);
  edgeCount = self->_edgeCount;
  if ((_DWORD)edgeCount)
  {
    v21 = 0;
    v22 = self->_edges;
    do
    {
      var0 = v22->var0;
      ++v22;
      v23 = var0;
      if (var0 <= 0xFFFFFFFA)
      {
        *((_DWORD *)v6 + v23) = v21;
        edgeCount = self->_edgeCount;
      }
      ++v21;
    }
    while (v21 < edgeCount);
  }
  -[VMUDirectedGraph _renameWithNodeMap:nodeNamespace:edgeMap:edgeNamespace:](self, "_renameWithNodeMap:nodeNamespace:edgeMap:edgeNamespace:", v4, v16, v6, self->_externalEdges);
  free(v4);
  free(v6);
  externalEdges = self->_externalEdges;
  self->_nextNodeName = v16;
  self->_nextEdgeName = externalEdges;
  if (self->_insideSearch)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("VMUDestructiveMutationWhileEnumeratingException"), CFSTR("Destructive mutation attempted while traversing graph!"));
  else
    self->_indexedEdges = -1;
}

- (void)_renameWithNodeMap:(unsigned int *)a3 nodeNamespace:(unsigned int)a4 edgeMap:(unsigned int *)a5 edgeNamespace:(unsigned int)a6
{
  unsigned int v10;
  void *deadNodes;
  uint64_t v12;
  unint64_t v13;
  _VMUDirectedGraphEdge *edges;
  _VMUDirectedGraphEdge *v15;
  uint64_t var2;
  uint64_t var0;
  unsigned int *v18;
  unsigned int v19;
  unint64_t v20;

  if (self->_nextEdgeName != a6)
  {
    if (a6 <= 0x10)
      v10 = 16;
    else
      v10 = a6;
    self->_edgeCapacity = v10;
    self->_edges = (_VMUDirectedGraphEdge *)malloc_type_realloc(self->_edges, 12 * v10, 0x10000403E1C8BA9uLL);
  }
  deadNodes = self->_deadNodes;
  if (deadNodes)
  {
    free(deadNodes);
    self->_deadNodes = 0;
  }
  if (self->_edgeCount)
  {
    v12 = 0;
    v13 = 0;
    do
    {
      edges = self->_edges;
      if (a3)
      {
        v15 = &edges[v12];
        var2 = edges[v12].var2;
        v15->var1 = a3[edges[v12].var1];
        v15->var2 = a3[var2];
      }
      var0 = edges[v12].var0;
      if (a5 && var0 <= 0xFFFFFFFA)
      {
        edges[v12].var0 = a5[var0];
      }
      else if ((_DWORD)var0 == -2)
      {
        v18 = (unsigned int *)self->_deadNodes;
        if (v18)
        {
          v19 = *v18;
        }
        else
        {
          v18 = (unsigned int *)malloc_type_calloc(1uLL, ((a4 + 7) >> 3) + 4, 0xFF42C4F3uLL);
          *v18 = a4;
          self->_deadNodes = v18;
          edges = self->_edges;
          v19 = a4;
        }
        v20 = edges[v12].var2;
        if (v19 > v20)
          *((_BYTE *)v18 + (v20 >> 3) + 4) |= 1 << (v20 & 7);
      }
      ++v13;
      ++v12;
    }
    while (v13 < self->_edgeCount);
  }
}

- (unsigned)enumerateNodesWithBlock:(id)a3
{
  void (**v4)(id, uint64_t, unsigned __int8 *);
  int insideSearch;
  unsigned int indexedEdges;
  BOOL v7;
  unsigned int nodeCount;
  unsigned int indexedNodeSpace;
  unsigned int v10;
  uint64_t v11;
  _DWORD *deadNodes;
  int v13;
  unsigned __int8 v16;

  v4 = (void (**)(id, uint64_t, unsigned __int8 *))a3;
  if (v4)
  {
    insideSearch = self->_insideSearch;
    if (!insideSearch)
    {
      indexedEdges = self->_indexedEdges;
      v7 = indexedEdges != -1 && indexedEdges >= self->_edgeCount;
      if (v7 && self->_indexedNodeSpace >= self->_nextNodeName)
      {
        insideSearch = 0;
      }
      else
      {
        -[VMUDirectedGraph _adjustAdjacencyMap](self, "_adjustAdjacencyMap");
        insideSearch = self->_insideSearch;
      }
    }
    self->_insideSearch = insideSearch + 1;
    v16 = 0;
    indexedNodeSpace = self->_indexedNodeSpace;
    if (indexedNodeSpace)
    {
      nodeCount = 0;
      v10 = 1;
      do
      {
        v11 = v10 - 1;
        deadNodes = self->_deadNodes;
        if (deadNodes
          && *deadNodes > v11
          && ((*((unsigned __int8 *)deadNodes + ((v10 - 1) >> 3) + 4) >> ((v10 - 1) & 7)) & 1) != 0)
        {
          v13 = 0;
        }
        else
        {
          v4[2](v4, v11, &v16);
          ++nodeCount;
          indexedNodeSpace = self->_indexedNodeSpace;
          v13 = v16;
        }
        v7 = v10++ >= indexedNodeSpace;
      }
      while (!v7 && v13 == 0);
      insideSearch = self->_insideSearch - 1;
    }
    else
    {
      nodeCount = 0;
    }
    self->_insideSearch = insideSearch;
  }
  else
  {
    nodeCount = self->_nodeCount;
  }

  return nodeCount;
}

- (unsigned)reverseEnumerateNodesWithBlock:(id)a3
{
  void (**v4)(id, uint64_t, char *);
  uint64_t v5;
  int insideSearch;
  unsigned int indexedEdges;
  unsigned int nodeCount;
  uint64_t v9;
  _DWORD *deadNodes;
  unsigned int v11;
  char v13;

  v4 = (void (**)(id, uint64_t, char *))a3;
  if (v4)
  {
    LODWORD(v5) = self->_indexedNodeSpace;
    if ((_DWORD)v5)
    {
      insideSearch = self->_insideSearch;
      if (!insideSearch)
      {
        indexedEdges = self->_indexedEdges;
        if (indexedEdges == -1 || indexedEdges < self->_edgeCount || v5 < self->_nextNodeName)
        {
          -[VMUDirectedGraph _adjustAdjacencyMap](self, "_adjustAdjacencyMap");
          insideSearch = self->_insideSearch;
          LODWORD(v5) = self->_indexedNodeSpace;
        }
        else
        {
          insideSearch = 0;
        }
      }
      nodeCount = 0;
      self->_insideSearch = insideSearch + 1;
      v13 = 0;
LABEL_12:
      v9 = (v5 - 1);
      while ((_DWORD)v9 != -1)
      {
        v5 = v9;
        deadNodes = self->_deadNodes;
        if (deadNodes)
        {
          if (*deadNodes > v5)
          {
            v11 = *((unsigned __int8 *)deadNodes + (v5 >> 3) + 4);
            v9 = (v5 - 1);
            if (((v11 >> (v5 & 7)) & 1) != 0)
              continue;
          }
        }
        v4[2](v4, v5, &v13);
        ++nodeCount;
        if (!v13)
          goto LABEL_12;
        break;
      }
      --self->_insideSearch;
    }
    else
    {
      nodeCount = 0;
    }
  }
  else
  {
    nodeCount = self->_nodeCount;
  }

  return nodeCount;
}

- (unsigned)enumerateMembersOfGroupNode:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (**v9)(_QWORD, _QWORD, _QWORD);
  int insideSearch;
  unsigned int indexedEdges;
  BOOL v12;
  int v13;
  unsigned int *nodeAdjIndex;
  uint64_t v15;
  unsigned int indexedNodeSpace;
  unsigned int *p_indexedEdges;
  unsigned int *v18;
  unint64_t v19;
  int v20;
  unsigned int v21;
  uint64_t v22;
  unint64_t v23;
  _VMUDirectedGraphEdge *edges;
  _VMUDirectedGraphEdge *v25;
  uint64_t v27;
  int v28;
  unsigned __int8 v30;

  v6 = (uint64_t)a4;
  v9 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))v6;
  insideSearch = self->_insideSearch;
  if (!insideSearch)
  {
    indexedEdges = self->_indexedEdges;
    v12 = indexedEdges != -1 && indexedEdges >= self->_edgeCount;
    if (v12 && self->_indexedNodeSpace >= self->_nextNodeName)
    {
      insideSearch = 0;
    }
    else
    {
      v6 = -[VMUDirectedGraph _adjustAdjacencyMap](self, "_adjustAdjacencyMap");
      insideSearch = self->_insideSearch;
    }
  }
  v13 = 0;
  self->_insideSearch = insideSearch + 1;
  v30 = 0;
  nodeAdjIndex = self->_nodeAdjIndex;
  v15 = nodeAdjIndex[a3];
  indexedNodeSpace = self->_indexedNodeSpace;
  if (indexedNodeSpace > a3)
  {
    p_indexedEdges = &self->_indexedEdges;
    v18 = &nodeAdjIndex[a3 + 1];
    if (a3 + 1 < indexedNodeSpace)
      p_indexedEdges = v18;
    v13 = *p_indexedEdges - v15;
  }
  v19 = (v13 + v15);
  if (v15 >= v19)
  {
    v21 = 0;
  }
  else
  {
    v20 = 0;
    v21 = 0;
    v22 = v15;
    v23 = v15 + 1;
    do
    {
      edges = self->_edges;
      if (!edges)
        -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:].cold.1(v6, v7, v8);
      v25 = &edges[v22];
      if (v25->var0 >= 0xFFFFFFFB || !self->_inverted)
        v27 = 8;
      else
        v27 = 4;
      if (v25->var0 == -2)
      {
        if (v9)
        {
          v6 = ((uint64_t (**)(_QWORD, _QWORD, unsigned __int8 *))v9)[2](v9, *(unsigned int *)((char *)&v25->var0 + v27), &v30);
          v20 = v30;
        }
        ++v21;
        v28 = v20;
      }
      else
      {
        v28 = 0;
      }
      if (v23 >= v19)
        break;
      ++v22;
      ++v23;
    }
    while (!v28);
    insideSearch = self->_insideSearch - 1;
  }
  self->_insideSearch = insideSearch;

  return v21;
}

- (unsigned)parentGroupForNode:(unsigned int)a3
{
  int insideSearch;
  unsigned int indexedEdges;
  BOOL v7;
  unsigned int indexedNodeSpace;
  unsigned int *nodeAdjIndex;
  unsigned int *p_indexedEdges;
  unsigned int v11;
  _VMUDirectedGraphEdge *edges;
  unsigned int v13;
  unsigned int result;

  insideSearch = self->_insideSearch;
  if (!insideSearch)
  {
    indexedEdges = self->_indexedEdges;
    v7 = indexedEdges != -1 && indexedEdges >= self->_edgeCount;
    if (v7 && self->_indexedNodeSpace >= self->_nextNodeName)
    {
      insideSearch = 0;
    }
    else
    {
      -[VMUDirectedGraph _adjustAdjacencyMap](self, "_adjustAdjacencyMap");
      insideSearch = self->_insideSearch;
    }
  }
  self->_insideSearch = insideSearch + 1;
  indexedNodeSpace = self->_indexedNodeSpace;
  if (indexedNodeSpace > a3
    && ((nodeAdjIndex = self->_nodeAdjIndex, a3 + 1 >= indexedNodeSpace)
      ? (p_indexedEdges = &self->_indexedEdges)
      : (p_indexedEdges = &nodeAdjIndex[a3 + 1]),
        (v11 = nodeAdjIndex[a3], *p_indexedEdges - v11 >= 2)
     && (edges = self->_edges, v13 = v11 + 1, edges[v13].var0 == -3)))
  {
    result = edges[v13].var2;
  }
  else
  {
    result = -1;
  }
  self->_insideSearch = insideSearch;
  return result;
}

- (unsigned)edgeCount
{
  if (self->_deadNodes)
    return -[VMUDirectedGraph enumerateEdgesWithBlock:](self, "enumerateEdgesWithBlock:", 0);
  else
    return self->_edgeCount;
}

- (unsigned)enumerateEdgesWithBlock:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t var2;
  uint64_t (**v7)(_QWORD);
  int insideSearch;
  unsigned int indexedEdges;
  BOOL v10;
  unint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unint64_t i;
  _VMUDirectedGraphEdge *edges;
  _BOOL4 inverted;
  unsigned int var0;
  unsigned int *p_var1;
  _BOOL4 v19;
  BOOL v20;
  unsigned int *p_var2;
  uint64_t v22;
  uint64_t v23;
  unsigned int *nodeAdjIndex;
  unsigned int indexedNodeSpace;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unsigned int v30;
  unsigned int v32;

  v4 = (uint64_t)a3;
  v7 = (uint64_t (**)(_QWORD))v4;
  insideSearch = self->_insideSearch;
  if (!insideSearch)
  {
    indexedEdges = self->_indexedEdges;
    v10 = indexedEdges != -1 && indexedEdges >= self->_edgeCount;
    if (v10 && self->_indexedNodeSpace >= self->_nextNodeName)
    {
      insideSearch = 0;
    }
    else
    {
      v4 = -[VMUDirectedGraph _adjustAdjacencyMap](self, "_adjustAdjacencyMap");
      insideSearch = self->_insideSearch;
    }
  }
  self->_insideSearch = insideSearch + 1;
  v11 = self->_indexedEdges;
  if (!(_DWORD)v11)
  {
    v13 = 0;
    goto LABEL_52;
  }
  v12 = 0;
  v13 = 0;
  for (i = 1; ; ++i)
  {
    edges = self->_edges;
    if (!edges)
      -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:].cold.1(v4, v5, var2);
    inverted = self->_inverted;
    p_var1 = &edges[v12].var1;
    var0 = edges[v12].var0;
    v19 = var0 < 0xFFFFFFFB;
    v20 = !inverted || !v19;
    if (inverted && v19)
      p_var2 = &edges[v12].var2;
    else
      p_var2 = &edges[v12].var1;
    v22 = *p_var2;
    if (v20)
      p_var1 = &edges[v12].var2;
    v23 = *p_var1;
    if (var0 == -2)
    {
      var2 = v22;
    }
    else
    {
      nodeAdjIndex = self->_nodeAdjIndex;
      indexedNodeSpace = self->_indexedNodeSpace;
      if (v22 >= indexedNodeSpace)
        goto LABEL_25;
      v26 = v11;
      if ((int)v22 + 1 < indexedNodeSpace)
        v26 = nodeAdjIndex[v22 + 1];
      v27 = nodeAdjIndex[v22];
      if (v26 == v27)
      {
LABEL_25:
        var2 = v22;
      }
      else
      {
        var2 = v22;
        if (edges[v27].var0 == -3)
          var2 = edges[v27].var2;
      }
      if (v23 < indexedNodeSpace)
      {
        v28 = v11;
        if ((int)v23 + 1 < indexedNodeSpace)
          v28 = nodeAdjIndex[v23 + 1];
        v29 = nodeAdjIndex[v23];
        if (v28 != v29 && edges[v29].var0 == -3)
        {
          v30 = edges[v29].var2;
          goto LABEL_33;
        }
      }
    }
    v30 = v23;
LABEL_33:
    if (v30 == (_DWORD)v23 && (_DWORD)var2 == (_DWORD)v22)
      v32 = edges[v12].var0;
    else
      v32 = -4;
    if ((_DWORD)var2 == v30)
      v5 = v32;
    else
      v5 = var0;
    if (v5 <= 0xFFFFFFFA)
    {
      if (v7)
      {
        v4 = v7[2](v7);
        v11 = self->_indexedEdges;
      }
      ++v13;
    }
    if (i >= v11)
      break;
    ++v12;
  }
  insideSearch = self->_insideSearch - 1;
LABEL_52:
  self->_insideSearch = insideSearch;

  return v13;
}

- (void)_internalAccessRawEdgesWithBlock:(id)a3
{
  id v4;
  int insideSearch;
  unsigned int indexedEdges;
  BOOL v7;
  id v8;

  v4 = a3;
  insideSearch = self->_insideSearch;
  v8 = v4;
  if (!insideSearch)
  {
    indexedEdges = self->_indexedEdges;
    v7 = indexedEdges != -1 && indexedEdges >= self->_edgeCount;
    if (v7 && self->_indexedNodeSpace >= self->_nextNodeName)
    {
      insideSearch = 0;
    }
    else
    {
      -[VMUDirectedGraph _adjustAdjacencyMap](self, "_adjustAdjacencyMap");
      v4 = v8;
      insideSearch = self->_insideSearch;
    }
  }
  self->_insideSearch = insideSearch + 1;
  (*((void (**)(id, _VMUDirectedGraphEdge *, _QWORD))v4 + 2))(v4, self->_edges, self->_indexedEdges);
  --self->_insideSearch;

}

- (unsigned)_internalEnumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (**v9)(_QWORD);
  unsigned int nextNodeName;
  int insideSearch;
  unsigned int indexedEdges;
  unsigned int v13;
  unsigned int *deadNodes;
  unsigned int v15;
  _VMUDirectedGraphEdge *v16;
  unsigned int *v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int indexedNodeSpace;
  unsigned int *nodeAdjIndex;
  unsigned int *p_indexedEdges;
  unsigned int v24;
  unsigned int v25;
  _VMUDirectedGraphEdge *edges;
  unsigned int v27;
  int var2;
  unsigned int v29;
  unsigned int *v30;
  unsigned int v31;
  uint64_t v32;
  unsigned int *v33;
  unint64_t v34;
  unsigned int v35;
  uint64_t v36;
  unsigned int *v37;
  BOOL v38;
  unsigned int *v39;
  int v40;
  unint64_t v41;
  _VMUDirectedGraphEdge *v42;
  _BOOL4 inverted;
  _VMUDirectedGraphEdge *v44;
  unsigned int *p_var2;
  unsigned int *p_var1;
  unsigned int var0;
  _BOOL4 v48;
  BOOL v49;
  unsigned int *v50;
  uint64_t v51;
  uint64_t (**v52)(_QWORD);
  unsigned int v53;
  unsigned int *v54;
  unsigned int v55;
  unsigned int *v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int v61;
  unsigned int v62;
  unsigned int v63;
  unsigned int v64;
  int v68;
  unsigned int v69;
  unsigned int v70;

  v70 = a3;
  v6 = (uint64_t)a4;
  v9 = (uint64_t (**)(_QWORD))v6;
  if (a3 == -1 || (nextNodeName = self->_nextNodeName, nextNodeName <= a3))
  {
    v13 = 0;
  }
  else
  {
    insideSearch = self->_insideSearch;
    if (!insideSearch)
    {
      indexedEdges = self->_indexedEdges;
      if (indexedEdges == -1 || indexedEdges < self->_edgeCount || self->_indexedNodeSpace < nextNodeName)
      {
        v6 = -[VMUDirectedGraph _adjustAdjacencyMap](self, "_adjustAdjacencyMap");
        insideSearch = self->_insideSearch;
      }
      else
      {
        insideSearch = 0;
      }
    }
    self->_insideSearch = insideSearch + 1;
    deadNodes = (unsigned int *)self->_deadNodes;
    if (deadNodes
      && *deadNodes > a3
      && ((*((unsigned __int8 *)deadNodes + (a3 >> 3) + 4) >> (a3 & 7)) & 1) != 0
      && ((v15 = self->_indexedNodeSpace, v15 <= a3)
       || ((v17 = self->_nodeAdjIndex, v16 = self->_edges, a3 + 1 >= v15)
         ? (v18 = &self->_indexedEdges)
         : (v18 = &v17[a3 + 1]),
           !v16 || (v19 = *v18, v20 = v17[a3], v19 == v20) || v16[v20].var0 != -3 || v16[v20].var2 == a3)))
    {
      v13 = 0;
      v70 = -1;
    }
    else
    {
      indexedNodeSpace = self->_indexedNodeSpace;
      if (indexedNodeSpace <= a3)
      {
        v13 = 0;
      }
      else
      {
        nodeAdjIndex = self->_nodeAdjIndex;
        if (a3 + 1 >= indexedNodeSpace)
          p_indexedEdges = &self->_indexedEdges;
        else
          p_indexedEdges = &nodeAdjIndex[a3 + 1];
        v24 = *p_indexedEdges;
        v25 = nodeAdjIndex[a3];
        if (v24 - v25 >= 2 && (edges = self->_edges, v27 = v25 + 1, edges[v27].var0 == -3))
          var2 = edges[v27].var2;
        else
          var2 = -1;
        v68 = var2;
        v69 = 0;
        v29 = 0;
        v30 = &v70;
        v31 = 1;
        do
        {
          v32 = v30[--v31];
          v33 = self->_nodeAdjIndex;
          v34 = v33[v32];
          v35 = self->_indexedNodeSpace;
          if (v32 >= v35)
          {
            v40 = 0;
          }
          else
          {
            v36 = v32 + 1;
            v37 = &v33[v36];
            v38 = v36 >= v35;
            v39 = &self->_indexedEdges;
            if (!v38)
              v39 = v37;
            v40 = *v39 - v34;
          }
          v41 = (v40 + v34);
          if (v34 < v41)
          {
            do
            {
              v42 = self->_edges;
              if (!v42)
                -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:].cold.1(v6, v7, v8);
              inverted = self->_inverted;
              v44 = &v42[v34];
              p_var2 = &v44->var2;
              var0 = v44->var0;
              p_var1 = &v44->var1;
              v7 = var0;
              v48 = var0 < 0xFFFFFFFB;
              v49 = !inverted || !v48;
              if (inverted && v48)
                v50 = p_var2;
              else
                v50 = p_var1;
              if (v49)
                p_var1 = p_var2;
              v51 = *p_var1;
              if ((_DWORD)v7 == -2)
              {
                if (v31 >= v29)
                {
                  v52 = v9;
                  if (2 * v29 <= 0x10)
                    v53 = 16;
                  else
                    v53 = 2 * v29;
                  if (v29)
                    v54 = v30;
                  else
                    v54 = 0;
                  v6 = (uint64_t)malloc_type_realloc(v54, 4 * v53, 0x100004052888210uLL);
                  v30 = (unsigned int *)v6;
                  v29 = v53;
                  v9 = v52;
                }
                v30[v31++] = v51;
              }
              else if (v7 <= 0xFFFFFFFA)
              {
                v8 = *v50;
                v55 = self->_indexedNodeSpace;
                if (v51 >= v55)
                  goto LABEL_66;
                v56 = self->_nodeAdjIndex;
                v57 = self->_indexedEdges;
                if ((int)v51 + 1 < v55)
                  v57 = v56[v51 + 1];
                v58 = v56[v51];
                if (v57 - v58 < 2 || v42[v58 + 1].var0 != -3)
                  goto LABEL_66;
                v59 = v42[v58 + 1].var2;
                if (v59 == -1 || v59 == v68)
                  goto LABEL_66;
                do
                {
                  v61 = v59;
                  if (v59 >= v55)
                    break;
                  v62 = v59 + 1;
                  v63 = self->_indexedEdges;
                  if (v62 < v55)
                    v63 = v56[v62];
                  v64 = v56[v61];
                  if (v63 - v64 < 2 || v42[v64 + 1].var0 != -3)
                    break;
                  v59 = v42[v64 + 1].var2;
                }
                while (v59 != -1 && v59 != v68);
                if (v70 != v61 || v61 == (_DWORD)v51)
                {
LABEL_66:
                  if (v9)
                    v6 = v9[2](v9);
                  ++v69;
                }
              }
              ++v34;
            }
            while (v34 < v41);
          }
        }
        while (v31);
        if (v29)
          free(v30);
        insideSearch = self->_insideSearch - 1;
        v13 = v69;
      }
    }
    self->_insideSearch = insideSearch;
  }

  return v13;
}

- (unsigned)enumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  unsigned int v8;
  _QWORD v10[4];
  id v11;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__VMUDirectedGraph_enumerateEdgesOfNode_withBlock___block_invoke;
    v10[3] = &unk_1E4E03C28;
    v11 = v6;
    v8 = -[VMUDirectedGraph _internalEnumerateEdgesOfNode:withBlock:](self, "_internalEnumerateEdgesOfNode:withBlock:", v4, v10);

  }
  else
  {
    v8 = -[VMUDirectedGraph _internalEnumerateEdgesOfNode:withBlock:](self, "_internalEnumerateEdgesOfNode:withBlock:", v4, 0);
  }

  return v8;
}

uint64_t __51__VMUDirectedGraph_enumerateEdgesOfNode_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)withNodeMarkingMap:(id)a3
{
  unsigned int nextNodeName;
  void (**v4)(id, _DWORD *);
  _DWORD *v5;

  if (a3)
  {
    nextNodeName = self->_nextNodeName;
    v4 = (void (**)(id, _DWORD *))a3;
    v5 = malloc_type_calloc(1uLL, ((nextNodeName + 7) >> 3) + 4, 0xFF42C4F3uLL);
    *v5 = nextNodeName;
    v4[2](v4, v5);

    free(v5);
  }
}

- (void)withEdgeMarkingMap:(id)a3
{
  unsigned int nextEdgeName;
  void (**v4)(id, _DWORD *);
  _DWORD *v5;

  if (a3)
  {
    nextEdgeName = self->_nextEdgeName;
    v4 = (void (**)(id, _DWORD *))a3;
    v5 = malloc_type_calloc(1uLL, ((nextEdgeName + 7) >> 3) + 4, 0xFF42C4F3uLL);
    *v5 = nextEdgeName;
    v4[2](v4, v5);

    free(v5);
  }
}

- (void)_dfsCore:(unsigned int)a3 colors:(char *)a4 visitBlock:(id)a5 examineBlock:(id)a6
{
  uint64_t v8;
  uint64_t (**v10)(void);
  uint64_t v11;
  unsigned int indexedNodeSpace;
  unsigned int *nodeAdjIndex;
  unsigned int *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int indexedEdges;
  unsigned int *v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  _VMUDirectedGraphEdge *edges;
  unsigned int *v26;
  _BOOL4 inverted;
  _VMUDirectedGraphEdge *v28;
  unsigned int *p_var2;
  unsigned int v30;
  unsigned int *p_var1;
  unsigned int var0;
  _BOOL4 v33;
  BOOL v34;
  unsigned int *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int var2;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  uint64_t v44;
  unsigned int v46;
  uint64_t v47;
  char *v48;
  unsigned int v49;
  BOOL v50;
  unsigned int *v51;
  _VMUDirectedGraphEdge *v52;
  _VMUDirectedGraphEdge *v53;
  uint64_t v54;
  int v55;
  _VMUDirectedGraphEdge *v56;
  uint64_t v57;
  int v58;
  _VMUDirectedGraphEdge *v59;
  BOOL v60;
  uint64_t v61;
  unsigned int v62;
  uint64_t (**v63)(void);
  unsigned int *p_indexedEdges;
  uint64_t (**v65)(id, uint64_t, _QWORD);

  v8 = *(_QWORD *)&a3;
  v65 = (uint64_t (**)(id, uint64_t, _QWORD))a5;
  v10 = (uint64_t (**)(void))a6;
  v11 = v65[2](v65, v8, a4[v8]);
  a4[v8] = v11;
  indexedNodeSpace = self->_indexedNodeSpace;
  if (indexedNodeSpace > v8)
  {
    nodeAdjIndex = self->_nodeAdjIndex;
    p_indexedEdges = &self->_indexedEdges;
    v14 = (int)v8 + 1 >= indexedNodeSpace ? &self->_indexedEdges : &nodeAdjIndex[(v8 + 1)];
    if (*v14 != nodeAdjIndex[v8])
    {
      if (indexedNodeSpace <= 0x10)
        v15 = 16;
      else
        v15 = self->_indexedNodeSpace;
      v16 = (uint64_t)malloc_type_malloc(4 * v15, 0x100004052888210uLL);
      v19 = self->_nodeAdjIndex[v8];
      *(_DWORD *)v16 = v19;
      indexedEdges = self->_indexedEdges;
      if (indexedEdges == -1)
        -[VMUDirectedGraph _dfsCore:colors:visitBlock:examineBlock:].cold.1();
      v21 = (unsigned int *)v16;
      v63 = v10;
      if (v19 >= indexedEdges)
      {
LABEL_84:
        free(v21);
        v10 = v63;
        goto LABEL_85;
      }
      v22 = 0;
      v62 = v15;
      while (1)
      {
        v23 = v21[v22];
        if (v23 == -1)
        {
          if (!v22)
            -[VMUDirectedGraph _dfsCore:colors:visitBlock:examineBlock:].cold.2();
          v24 = v21[--v22];
        }
        else
        {
          v24 = v21[v22];
        }
        edges = self->_edges;
        if (!edges)
          -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:].cold.1(v16, v17, v18);
        v26 = self->_nodeAdjIndex;
        inverted = self->_inverted;
        v28 = &edges[v24];
        p_var2 = &v28->var2;
        var0 = v28->var0;
        p_var1 = &v28->var1;
        v30 = var0;
        v33 = var0 < 0xFFFFFFFB;
        v34 = !inverted || !v33;
        if (inverted && v33)
          v35 = p_var2;
        else
          v35 = p_var1;
        v36 = *v35;
        if (v34)
          p_var1 = p_var2;
        v37 = *p_var1;
        if (v30 == -2)
        {
          v38 = v37;
          var2 = v36;
        }
        else
        {
          v40 = self->_indexedNodeSpace;
          if (v36 >= v40)
            goto LABEL_30;
          v41 = indexedEdges;
          if ((int)v36 + 1 < v40)
            v41 = v26[v36 + 1];
          v42 = v26[v36];
          if (v41 == v42)
          {
LABEL_30:
            var2 = v36;
          }
          else
          {
            v16 = edges[v42].var0;
            var2 = v36;
            if ((_DWORD)v16 == -3)
              var2 = edges[v42].var2;
          }
          if (v37 < v40)
          {
            if ((int)v37 + 1 < v40)
              indexedEdges = v26[v37 + 1];
            v43 = v26[v37];
            if (indexedEdges != v43 && edges[v43].var0 == -3)
            {
              v38 = edges[v43].var2;
              v44 = v38;
              goto LABEL_39;
            }
          }
          v38 = v37;
        }
        v44 = v37;
LABEL_39:
        if ((_DWORD)v44 == (_DWORD)v37 && var2 == (_DWORD)v36)
          v46 = v30;
        else
          v46 = -4;
        if (var2 == (_DWORD)v44)
          v17 = v46;
        else
          v17 = v30;
        v47 = var2;
        if (v23 != -1)
        {
          if (v17 <= 0xFFFFFFFA)
          {
            v48 = &a4[v38];
            v16 = v63[2]();
            if ((_DWORD)v16)
            {
              v16 = v65[2](v65, v44, *v48);
              v18 = v16;
              *v48 = v16;
              v49 = self->_indexedNodeSpace;
              if (v44 < v49)
              {
                v26 = self->_nodeAdjIndex;
                v50 = (int)v44 + 1 >= v49;
                v51 = &self->_indexedEdges;
                if (!v50)
                  v51 = &v26[(v44 + 1)];
                if (*v51 != v26[v38])
                {
LABEL_77:
                  if (++v22 >= v62)
                  {
                    v62 *= 2;
                    v16 = (uint64_t)malloc_type_realloc(v21, 4 * v62, 0x100004052888210uLL);
                    v21 = (unsigned int *)v16;
                    v26 = self->_nodeAdjIndex;
                  }
                  v58 = v26[v38];
                  goto LABEL_80;
                }
              }
              v16 = v65[2](v65, v44, v16);
              *v48 = v16;
            }
          }
          else if ((_DWORD)v17 == -2)
          {
            goto LABEL_77;
          }
        }
        v52 = self->_edges;
        if (v24 + 1 >= self->_indexedEdges)
        {
          if (!v52)
            -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:].cold.1(v16, v17, v18);
LABEL_69:
          v59 = &v52[v24];
          v60 = v59->var0 >= 0xFFFFFFFB || !self->_inverted;
          v61 = 4;
          if (!v60)
            v61 = 8;
          if (*(unsigned int *)((char *)&v59->var0 + v61) == (_DWORD)v47)
          {
            v16 = v65[2](v65, v47, a4[v47]);
            a4[v47] = v16;
          }
          v58 = -1;
          goto LABEL_80;
        }
        if (!v52)
          -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:].cold.1(v16, v17, v18);
        v53 = &v52[v24 + 1];
        if (self->_inverted && v53->var0 < 0xFFFFFFFB)
          v54 = 8;
        else
          v54 = 4;
        v55 = *(unsigned int *)((char *)&v53->var0 + v54);
        v56 = &v52[v24];
        if (self->_inverted && v56->var0 < 0xFFFFFFFB)
          v57 = 8;
        else
          v57 = 4;
        if (v55 != *(unsigned int *)((char *)&v56->var0 + v57))
          goto LABEL_69;
        v58 = v21[v22] + 1;
LABEL_80:
        v21[v22] = v58;
        indexedEdges = *p_indexedEdges;
        if (*v21 >= *p_indexedEdges)
          goto LABEL_84;
      }
    }
  }
  a4[v8] = v65[2](v65, v8, v11);
LABEL_85:

}

- (void)_bfsCore:(unsigned int)a3 colors:(char *)a4 visitBlock:(id)a5 examineBlock:(id)a6
{
  uint64_t v8;
  uint64_t (**v10)(_QWORD);
  unsigned int indexedNodeSpace;
  _DWORD *v12;
  _DWORD *v13;
  uint64_t v14;
  uint64_t var2;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int *nodeAdjIndex;
  uint64_t v20;
  unsigned int v21;
  unsigned int *p_indexedEdges;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _VMUDirectedGraphEdge *edges;
  unsigned int v28;
  _BOOL4 inverted;
  unsigned int var0;
  unsigned int *p_var1;
  _BOOL4 v32;
  BOOL v33;
  unsigned int *p_var2;
  uint64_t v35;
  uint64_t v36;
  unsigned int *v37;
  unsigned int indexedEdges;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  uint64_t v42;
  unsigned int v44;
  unsigned int v45;
  char *v46;
  _VMUDirectedGraphEdge *v47;
  BOOL v48;
  unsigned int *v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t (**v52)(id, uint64_t, _QWORD);
  char *v53;

  v8 = *(_QWORD *)&a3;
  v52 = (uint64_t (**)(id, uint64_t, _QWORD))a5;
  v10 = (uint64_t (**)(_QWORD))a6;
  if (self->_indexedNodeSpace <= 0x10)
    indexedNodeSpace = 16;
  else
    indexedNodeSpace = self->_indexedNodeSpace;
  v12 = malloc_type_malloc(4 * indexedNodeSpace, 0x100004052888210uLL);
  v13 = (_DWORD *)v52[2](v52, v8, a4[v8]);
  v16 = 0;
  v53 = a4;
  a4[v8] = (char)v13;
  *v12 = v8;
  v17 = 1;
  do
  {
    v18 = v12[v16];
    nodeAdjIndex = self->_nodeAdjIndex;
    v20 = nodeAdjIndex[v18];
    v21 = self->_indexedNodeSpace;
    if (v18 >= v21)
    {
      v23 = 0;
    }
    else
    {
      p_indexedEdges = &self->_indexedEdges;
      if ((int)v18 + 1 < v21)
        p_indexedEdges = &nodeAdjIndex[v18 + 1];
      v23 = *p_indexedEdges - v20;
    }
    ++v16;
    v24 = (v23 + v20);
    if (v20 < v24)
    {
      v51 = v18;
      v25 = v20;
      v26 = v24 - v20;
      while (1)
      {
        edges = self->_edges;
        if (!edges)
          -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:].cold.1((uint64_t)v13, v14, var2);
        v28 = self->_indexedNodeSpace;
        inverted = self->_inverted;
        p_var1 = &edges[v25].var1;
        var0 = edges[v25].var0;
        v32 = var0 < 0xFFFFFFFB;
        v33 = !inverted || !v32;
        if (inverted && v32)
          p_var2 = &edges[v25].var2;
        else
          p_var2 = &edges[v25].var1;
        v35 = *p_var2;
        if (v33)
          p_var1 = &edges[v25].var2;
        v36 = *p_var1;
        if (var0 == -2)
        {
          var2 = v35;
        }
        else
        {
          v37 = self->_nodeAdjIndex;
          indexedEdges = self->_indexedEdges;
          if (v35 >= v28)
            goto LABEL_25;
          v39 = self->_indexedEdges;
          if ((int)v35 + 1 < v28)
            v39 = v37[v35 + 1];
          v40 = v37[v35];
          if (v39 == v40)
          {
LABEL_25:
            var2 = v35;
          }
          else
          {
            var2 = v35;
            if (edges[v40].var0 == -3)
              var2 = edges[v40].var2;
          }
          if (v36 < v28)
          {
            if ((int)v36 + 1 < v28)
              indexedEdges = v37[v36 + 1];
            v41 = v37[v36];
            if (indexedEdges != v41 && edges[v41].var0 == -3)
            {
              v42 = edges[v41].var2;
              goto LABEL_33;
            }
          }
        }
        v42 = v36;
LABEL_33:
        if ((_DWORD)v42 == (_DWORD)v36 && (_DWORD)var2 == (_DWORD)v35)
          v44 = edges[v25].var0;
        else
          v44 = -4;
        if ((_DWORD)var2 == (_DWORD)v42)
          v14 = v44;
        else
          v14 = var0;
        if (v14 >= 0xFFFFFFFB)
        {
          if ((_DWORD)v14 == -2)
            v45 = v42;
          else
            v45 = -1;
LABEL_48:
          if (v45 < v28)
          {
            if (v17 >= indexedNodeSpace)
            {
              if (v16 <= indexedNodeSpace >> 1)
              {
                indexedNodeSpace *= 2;
                v13 = malloc_type_realloc(v12, 4 * indexedNodeSpace, 0x100004052888210uLL);
                v12 = v13;
              }
              else
              {
                v17 -= v16;
                v13 = memmove(v12, &v12[v16], 4 * v17);
                v16 = 0;
              }
            }
            v12[v17++] = v42;
          }
          goto LABEL_57;
        }
        v46 = &v53[v42];
        v13 = (_DWORD *)v10[2](v10);
        if ((_DWORD)v13)
        {
          v13 = (_DWORD *)v52[2](v52, v42, *v46);
          *v46 = (char)v13;
          v28 = self->_indexedNodeSpace;
          v45 = v42;
          goto LABEL_48;
        }
LABEL_57:
        ++v25;
        if (!--v26)
        {
          nodeAdjIndex = self->_nodeAdjIndex;
          v21 = self->_indexedNodeSpace;
          v18 = v51;
          break;
        }
      }
    }
    if (v18 < v21)
    {
      v47 = self->_edges;
      v48 = (int)v18 + 1 >= v21;
      v49 = &self->_indexedEdges;
      if (!v48)
        v49 = &nodeAdjIndex[(v18 + 1)];
      if (v47)
      {
        v50 = nodeAdjIndex[v18];
        if (*v49 != v50 && v47[v50].var0 == -3 && (_DWORD)v18 != v47[v50].var2)
          continue;
      }
    }
    v13 = (_DWORD *)v52[2](v52, v18, v53[v18]);
    v53[v18] = (char)v13;
  }
  while (v16 != v17);
  free(v12);

}

- (void)_searchMainLoop:(unsigned int)a3 action:(id)a4
{
  uint64_t v4;
  id v6;
  size_t nextNodeName;
  void *v8;
  void *v9;
  _DWORD *deadNodes;
  id v11;
  _QWORD v12[4];
  id v13;
  void *v14;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  nextNodeName = self->_nextNodeName;
  if ((_DWORD)nextNodeName)
  {
    v11 = v6;
    v8 = malloc_type_calloc(nextNodeName, 1uLL, 0x100004077774924uLL);
    v9 = v8;
    if ((_DWORD)v4 == -1)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __43__VMUDirectedGraph__searchMainLoop_action___block_invoke;
      v12[3] = &unk_1E4E03C50;
      v14 = v8;
      v13 = v11;
      -[VMUDirectedGraph enumerateNodesWithBlock:](self, "enumerateNodesWithBlock:", v12);

    }
    else if (self->_indexedNodeSpace > v4)
    {
      deadNodes = self->_deadNodes;
      if (!deadNodes
        || *deadNodes <= v4
        || ((*((unsigned __int8 *)deadNodes + (v4 >> 3) + 4) >> (v4 & 7)) & 1) == 0)
      {
        (*((void (**)(id, uint64_t, void *))v11 + 2))(v11, v4, v8);
      }
    }
    free(v9);
    v6 = v11;
  }

}

uint64_t __43__VMUDirectedGraph__searchMainLoop_action___block_invoke(uint64_t result, unsigned int a2)
{
  if (!*(_BYTE *)(*(_QWORD *)(result + 40) + a2))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)depthFirstSearch:(unsigned int)a3 nodeVisitBlock:(id)a4 edgeVisitBlock:(id)a5
{
  uint64_t v6;
  id v9;
  void *v10;
  int insideSearch;
  unsigned int indexedEdges;
  objc_class *v13;
  void *v14;
  const char *Name;
  uint64_t v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v6 = *(_QWORD *)&a3;
  v17 = a4;
  v9 = a5;
  v10 = v17;
  if (v17 && v9)
  {
    insideSearch = self->_insideSearch;
    if (!insideSearch)
    {
      indexedEdges = self->_indexedEdges;
      if (indexedEdges == -1 || indexedEdges < self->_edgeCount || self->_indexedNodeSpace < self->_nextNodeName)
      {
        -[VMUDirectedGraph _adjustAdjacencyMap](self, "_adjustAdjacencyMap");
        v10 = v17;
        insideSearch = self->_insideSearch;
      }
      else
      {
        insideSearch = 0;
      }
    }
    v16 = MEMORY[0x1E0C809B0];
    self->_insideSearch = insideSearch + 1;
    v18[0] = v16;
    v18[1] = 3221225472;
    v18[2] = __67__VMUDirectedGraph_depthFirstSearch_nodeVisitBlock_edgeVisitBlock___block_invoke;
    v18[3] = &unk_1E4E03C78;
    v18[4] = self;
    v19 = v10;
    v20 = v9;
    -[VMUDirectedGraph _searchMainLoop:action:](self, "_searchMainLoop:action:", v6, v18);
    --self->_insideSearch;

  }
  else
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    Name = sel_getName(a2);
    NSLog(CFSTR("-[%@ %s]: %s"), v14, Name, "^block parameters must be non-nil.");

  }
}

uint64_t __67__VMUDirectedGraph_depthFirstSearch_nodeVisitBlock_edgeVisitBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dfsCore:colors:visitBlock:examineBlock:", a2, a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)breadthFirstSearch:(unsigned int)a3 nodeVisitBlock:(id)a4 edgeVisitBlock:(id)a5
{
  uint64_t v6;
  id v9;
  void *v10;
  int insideSearch;
  unsigned int indexedEdges;
  objc_class *v13;
  void *v14;
  const char *Name;
  uint64_t v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v6 = *(_QWORD *)&a3;
  v17 = a4;
  v9 = a5;
  v10 = v17;
  if (v17 && v9)
  {
    insideSearch = self->_insideSearch;
    if (!insideSearch)
    {
      indexedEdges = self->_indexedEdges;
      if (indexedEdges == -1 || indexedEdges < self->_edgeCount || self->_indexedNodeSpace < self->_nextNodeName)
      {
        -[VMUDirectedGraph _adjustAdjacencyMap](self, "_adjustAdjacencyMap");
        v10 = v17;
        insideSearch = self->_insideSearch;
      }
      else
      {
        insideSearch = 0;
      }
    }
    v16 = MEMORY[0x1E0C809B0];
    self->_insideSearch = insideSearch + 1;
    v18[0] = v16;
    v18[1] = 3221225472;
    v18[2] = __69__VMUDirectedGraph_breadthFirstSearch_nodeVisitBlock_edgeVisitBlock___block_invoke;
    v18[3] = &unk_1E4E03C78;
    v18[4] = self;
    v19 = v10;
    v20 = v9;
    -[VMUDirectedGraph _searchMainLoop:action:](self, "_searchMainLoop:action:", v6, v18);
    --self->_insideSearch;

  }
  else
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    Name = sel_getName(a2);
    NSLog(CFSTR("-[%@ %s]: %s"), v14, Name, "^block parameters must be non-nil.");

  }
}

uint64_t __69__VMUDirectedGraph_breadthFirstSearch_nodeVisitBlock_edgeVisitBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_bfsCore:colors:visitBlock:examineBlock:", a2, a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_reorderEdgesNaturally
{
  uint64_t edgeCount;
  uint64_t v4;
  int v5;
  _VMUDirectedGraphEdge *edges;
  char v7;
  unsigned int var0;
  unsigned int edgeCapacity;
  unsigned int v10;
  size_t v11;
  _VMUDirectedGraphEdge *v12;
  _VMUDirectedGraphEdge *v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  _VMUDirectedGraphEdge *v17;
  unsigned int v18;
  _VMUDirectedGraphEdge *v19;
  uint64_t v20;
  uint64_t v21;
  _VMUDirectedGraphEdge *v22;
  _VMUDirectedGraphEdge *v23;

  edgeCount = self->_edgeCount;
  if ((_DWORD)edgeCount)
  {
    v4 = 0;
    v5 = 0;
    edges = self->_edges;
    v7 = 1;
    do
    {
      var0 = edges->var0;
      ++edges;
      v7 &= v4 == var0;
      if (var0 == 4294967294)
        ++v5;
      ++v4;
    }
    while (edgeCount != v4);
    if ((v7 & 1) == 0)
    {
      edgeCapacity = self->_edgeCapacity;
      v10 = self->_externalEdges + v5;
      v11 = edgeCapacity <= v10 ? v10 : edgeCapacity;
      self->_edgeCapacity = v11;
      if ((_DWORD)v11)
      {
        v12 = (_VMUDirectedGraphEdge *)malloc_type_calloc(v11, 0xCuLL, 0x10000403E1C8BA9uLL);
        if (v12)
        {
          v13 = v12;
          if (self->_edgeCount)
          {
            v14 = 0;
            v15 = 0;
            v16 = 0;
            do
            {
              v17 = &self->_edges[v14];
              v18 = v17->var0;
              if (v17->var0 != -3)
              {
                if (v18 == -2)
                {
                  v19 = &v12[v16 + self->_externalEdges - 1];
                  v20 = *(_QWORD *)&v17->var0;
                  v19->var2 = v17->var2;
                  *(_QWORD *)&v19->var0 = v20;
                  ++v16;
                }
                else
                {
                  v21 = *(_QWORD *)&v17->var0;
                  v22 = &v12[v18];
                  v22->var2 = v17->var2;
                  *(_QWORD *)&v22->var0 = v21;
                }
              }
              ++v15;
              ++v14;
            }
            while (v15 < self->_edgeCount);
          }
          v23 = self->_edges;
          if (v23)
            free(v23);
          self->_edges = v13;
        }
      }
    }
  }
}

- (void)_dumpAdjacencyList
{
  unint64_t v3;
  unsigned int *p_indexedEdges;
  unsigned int *nodeAdjIndex;
  uint64_t v6;
  unint64_t indexedNodeSpace;
  unsigned int *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _VMUDirectedGraphEdge *edges;
  _VMUDirectedGraphEdge *v16;
  unsigned int *p_var2;
  unsigned int *p_var1;
  unsigned int v19;
  unsigned int var0;
  _BOOL4 inverted;
  _BOOL4 v22;
  BOOL v23;
  unsigned int *v24;
  const char *v25;

  if (self->_nextNodeName)
  {
    v3 = 0;
    p_indexedEdges = &self->_indexedEdges;
    do
    {
      nodeAdjIndex = self->_nodeAdjIndex;
      v6 = nodeAdjIndex[v3];
      indexedNodeSpace = self->_indexedNodeSpace;
      if (v3 >= indexedNodeSpace)
      {
        v9 = 0;
      }
      else
      {
        v8 = &nodeAdjIndex[v3 + 1];
        if (v3 + 1 >= indexedNodeSpace)
          v8 = p_indexedEdges;
        v9 = *v8 - v6;
      }
      v10 = (v9 + v6);
      v11 = printf("node: %d at %d (%d edges leaving)\n", v3, v6, v9);
      if (v6 < v10)
      {
        v14 = v6;
        do
        {
          edges = self->_edges;
          if (!edges)
            -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:].cold.1(v11, v12, v13);
          v16 = &edges[v14];
          p_var2 = &v16->var2;
          var0 = v16->var0;
          p_var1 = &v16->var1;
          v19 = var0;
          inverted = self->_inverted;
          v22 = var0 < 0xFFFFFFFB;
          v23 = !inverted || !v22;
          if (inverted && v22)
            v24 = p_var2;
          else
            v24 = p_var1;
          if (v23)
            p_var1 = p_var2;
          if (v19 == -3)
            v25 = " [group up]";
          else
            v25 = "";
          if (v19 == -2)
            v25 = " [group contain]";
          v11 = printf("%d: %d -> %d%s\n", v6++, *v24, *p_var1, v25);
          ++v14;
        }
        while (v10 != v6);
      }
      ++v3;
    }
    while (v3 < self->_nextNodeName);
  }
}

- (void)invertEdges
{
  -[VMUDirectedGraph setInverted:](self, "setInverted:", -[VMUDirectedGraph inverted](self, "inverted") ^ 1);
}

- (id)subgraphWithMarkedNodes:(void *)a3
{
  void *v4;
  void *v5;
  int v6;
  unint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  int v10;
  int v11;
  unint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  int v15;

  v4 = (void *)-[VMUDirectedGraph copy](self, "copy");
  v5 = v4;
  if (a3)
  {
    v6 = *(_DWORD *)a3;
    v7 = (*(_DWORD *)a3 + 7);
    if (v7 >= 8)
    {
      v8 = (char *)a3 + 4;
      v9 = v7 >> 3;
      if (v7 >> 3 <= 1)
        v9 = 1;
      do
      {
        *v8 = ~*v8;
        ++v8;
        --v9;
      }
      while (v9);
    }
    v10 = v6 & 7;
    if (v10)
      *((_BYTE *)a3 + (v7 >> 3) + 3) ^= -1 << v10;
    objc_msgSend(v4, "removeMarkedNodes:", a3);
    v11 = *(_DWORD *)a3;
    v12 = (*(_DWORD *)a3 + 7);
    if (v12 >= 8)
    {
      v13 = (char *)a3 + 4;
      v14 = v12 >> 3;
      if (v12 >> 3 <= 1)
        v14 = 1;
      do
      {
        *v13 = ~*v13;
        ++v13;
        --v14;
      }
      while (v14);
    }
    v15 = v11 & 7;
    if (v15)
      *((_BYTE *)a3 + (v12 >> 3) + 3) ^= -1 << v15;
  }
  return v5;
}

- (id)renormalizedGraph
{
  void *v2;

  v2 = (void *)-[VMUDirectedGraph copy](self, "copy");
  objc_msgSend(v2, "_renormalize");
  return v2;
}

- (id)invertedGraph
{
  void *v3;

  v3 = (void *)-[VMUDirectedGraph copy](self, "copy");
  objc_msgSend(v3, "setInverted:", -[VMUDirectedGraph inverted](self, "inverted") ^ 1);
  return v3;
}

- (unsigned)nodeCount
{
  return self->_nodeCount;
}

- (unsigned)nodeNamespaceSize
{
  return self->_nextNodeName;
}

- (unsigned)edgeNamespaceSize
{
  return self->_nextEdgeName;
}

- (NSDictionary)additionalProperties
{
  return self->_additionalProperties;
}

- (void)setAdditionalProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)graphIs64bit
{
  return self->_graphIs64bit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalProperties, 0);
}

- (void)decapsulateSupplementalData:forTag:.cold.1()
{
  __assert_rtn("-[VMUDirectedGraph decapsulateSupplementalData:forTag:]", "VMUDirectedGraph.m", 252, "strlen(tag) <= 8");
}

- (void)initWithArchived:version:options:diskLogs:error:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
}

- (void)_adjustAdjacencyMap
{
  __assert_rtn("-[VMUDirectedGraph _adjustAdjacencyMap]", "VMUDirectedGraph.m", 930, "_edgeCapacity || (!groupEdges && !_edgeCount)");
}

- (void)enumerateMembersOfGroupNode:(uint64_t)a3 withBlock:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_1("_internalEdge", "VMUDirectedGraph.m", a3, "edgeList");
}

- (void)_dfsCore:colors:visitBlock:examineBlock:.cold.1()
{
  __assert_rtn("-[VMUDirectedGraph _dfsCore:colors:visitBlock:examineBlock:]", "VMUDirectedGraph.m", 1326, "_indexedEdges < VMUGraphNameNone");
}

- (void)_dfsCore:colors:visitBlock:examineBlock:.cold.2()
{
  __assert_rtn("-[VMUDirectedGraph _dfsCore:colors:visitBlock:examineBlock:]", "VMUDirectedGraph.m", 1332, "agendaIdx != 0");
}

@end
