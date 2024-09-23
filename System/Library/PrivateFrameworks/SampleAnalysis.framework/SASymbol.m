@implementation SASymbol

- (id)addInlineSourceInfoWithOffsetIntoSegment:(uint64_t)a3 length:(int)a4 lineNum:(int)a5 columnNum:(void *)a6 filePath:
{
  id v9;
  id *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  int v22;
  NSObject *v23;
  id v24;
  id v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v35[6];
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a6;
  if (!a1)
  {
LABEL_25:
    v17 = 0;
    goto LABEL_21;
  }
  if (!a3)
  {
    v22 = *__error();
    _sa_logt();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "debugDescription");
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315906;
      v37 = objc_msgSend(v24, "UTF8String");
      v38 = 2080;
      v39 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
      v40 = 1024;
      v41 = a4;
      v42 = 1024;
      v43 = a5;
      _os_log_error_impl(&dword_1B9BE0000, v23, OS_LOG_TYPE_ERROR, "%s: inlining 0-length source info %s:%d,%d", buf, 0x22u);

    }
    *__error() = v22;
    objc_msgSend(a1, "debugDescription");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v26 = objc_msgSend(v25, "UTF8String");
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _SASetCrashLogMessage(4485, "%s: inlining 0-length source info %s:%d,%d", v27, v28, v29, v30, v31, v32, v26);

    _os_crash();
    __break(1u);
    goto LABEL_25;
  }
  v10 = a1;
  objc_sync_enter(v10);
  v11 = v10[4];
  if (!v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v13 = v10[4];
    v10[4] = (id)v12;

    v11 = v10[4];
  }
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __87__SASymbol_addInlineSourceInfoWithOffsetIntoSegment_length_lineNum_columnNum_filePath___block_invoke;
  v35[3] = &__block_descriptor_48_e22_q16__0__SASourceInfo_8l;
  v35[4] = a2;
  v35[5] = a3;
  v14 = SABinarySearchArray(v11, 1536, (uint64_t)v35);
  v15 = v14;
  if (v14)
  {
    v16 = v14 - 1;
    while (1)
    {
      objc_msgSend(v10[4], "objectAtIndexedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "offsetIntoSegment") != a2 || objc_msgSend(v17, "length") != a3)
        break;
      if (v9)
      {
        objc_msgSend(v17, "filePath");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(v17, "filePath");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "isEqualToString:", v19)
            && objc_msgSend(v17, "lineNum") == a4)
          {
            v20 = objc_msgSend(v17, "columnNum") == a5;

            if (v20)
              goto LABEL_20;
          }
          else
          {

          }
        }
      }

      if (--v16 == -1)
        goto LABEL_19;
    }

  }
LABEL_19:
  +[SASourceInfo sourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:]((uint64_t)SASourceInfo, a2, a3, a4, a5, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10[4], "insertObject:atIndex:", v17, v15);
LABEL_20:
  objc_sync_exit(v10);

LABEL_21:
  return v17;
}

- (id)addNonInlineSourceInfoWithOffsetIntoSegment:(uint64_t)a3 length:(int)a4 lineNum:(int)a5 columnNum:(void *)a6 filePath:
{
  id v11;
  id *v12;
  id v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  int v17;
  void *v18;
  unint64_t v19;
  int v20;
  NSObject *v21;
  int v22;
  void *v23;
  uint64_t v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v31;
  uint64_t v32;
  void *v33;
  int v34;
  _QWORD v35[5];
  uint8_t buf[4];
  id v37;
  __int16 v38;
  _BYTE v39[10];
  _BYTE v40[10];
  __int16 v41;
  unint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  if (!a1)
  {
    v18 = 0;
    goto LABEL_19;
  }
  v12 = a1;
  objc_sync_enter(v12);
  v13 = v12[4];
  if (!v13)
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v15 = v12[4];
    v12[4] = (id)v14;

    v13 = v12[4];
  }
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __90__SASymbol_addNonInlineSourceInfoWithOffsetIntoSegment_length_lineNum_columnNum_filePath___block_invoke;
  v35[3] = &__block_descriptor_40_e22_q16__0__SASourceInfo_8l;
  v35[4] = a2;
  v16 = SABinarySearchArray(v13, 1280, (uint64_t)v35);
  if (v16 >= objc_msgSend(v12[4], "count"))
    goto LABEL_11;
  v17 = a5;
  objc_msgSend(v12[4], "objectAtIndexedSubscript:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "offsetIntoSegment") != a2)
  {
    v19 = a3 + a2;
    if (a3 + a2 > objc_msgSend(v18, "offsetIntoSegment"))
    {
      v20 = *__error();
      _sa_logt();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v18, "debugDescription");
        v32 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        v37 = v11;
        v38 = 1024;
        *(_DWORD *)v39 = a4;
        *(_WORD *)&v39[4] = 1024;
        *(_DWORD *)&v39[6] = v17;
        *(_WORD *)v40 = 2048;
        *(_QWORD *)&v40[2] = a2;
        v41 = 2048;
        v42 = v19;
        v43 = 2112;
        v44 = v32;
        v33 = (void *)v32;
        _os_log_error_impl(&dword_1B9BE0000, v21, OS_LOG_TYPE_ERROR, "new source info %@:%d,%d (0x%llx-0x%llx) overlaps existing %@", buf, 0x36u);

      }
      *__error() = v20;
      a3 = objc_msgSend(v18, "offsetIntoSegment") - a2;
    }

    a5 = v17;
LABEL_11:
    if (v16)
    {
      v34 = a4;
      v22 = a5;
      objc_msgSend(v12[4], "objectAtIndexedSubscript:", v16 - 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "offsetIntoSegment");
      if (objc_msgSend(v23, "length") + v24 > a2)
      {
        v25 = *__error();
        _sa_logt();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v23, "debugDescription");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413570;
          v37 = v31;
          v38 = 2112;
          *(_QWORD *)v39 = v11;
          *(_WORD *)&v39[8] = 1024;
          *(_DWORD *)v40 = v34;
          *(_WORD *)&v40[4] = 1024;
          *(_DWORD *)&v40[6] = v22;
          v41 = 2048;
          v42 = a2;
          v43 = 2048;
          v44 = a3 + a2;
          _os_log_error_impl(&dword_1B9BE0000, v26, OS_LOG_TYPE_ERROR, "existing source info %@ overlaps new %@:%d,%d (0x%llx-0x%llx)", buf, 0x36u);

        }
        *__error() = v25;
        v27 = objc_msgSend(v23, "offsetIntoSegment");
        v28 = objc_msgSend(v23, "length");
        v29 = objc_msgSend(v23, "offsetIntoSegment");
        a3 = a3 + a2 - (v27 + v28);
        a2 = objc_msgSend(v23, "length") + v29;
      }

      a5 = v22;
      a4 = v34;
    }
    +[SASourceInfo sourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:]((uint64_t)SASourceInfo, a2, a3, a4, a5, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12[4], "insertObject:atIndex:", v18, v16);
  }
  objc_sync_exit(v12);

LABEL_19:
  return v18;
}

+ (_QWORD)symbolWithOffsetIntoSegment:(uint64_t)a3 length:(void *)a4 name:
{
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;

  v6 = a4;
  v7 = objc_alloc_init((Class)objc_opt_self());
  v7[1] = a2;
  v7[2] = a3;
  v8 = objc_msgSend(v6, "copy");

  v9 = (void *)v7[3];
  v7[3] = v8;

  return v7;
}

uint64_t __51__SASymbol_nonInlineSourceInfoAtOffsetIntoSegment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = objc_msgSend(v3, "offsetIntoSegment");
  if (v4 >= objc_msgSend(v3, "length") + v5)
  {
    v7 = 1;
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6 >= objc_msgSend(v3, "offsetIntoSegment"))
      v7 = 0;
    else
      v7 = -1;
  }

  return v7;
}

uint64_t __90__SASymbol_addNonInlineSourceInfoWithOffsetIntoSegment_length_lineNum_columnNum_filePath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 <= objc_msgSend(v3, "offsetIntoSegment"))
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6 >= objc_msgSend(v3, "offsetIntoSegment"))
      v5 = 0;
    else
      v5 = -1;
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

uint64_t __87__SASymbol_addInlineSourceInfoWithOffsetIntoSegment_length_lineNum_columnNum_filePath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  _BOOL8 v10;

  v3 = a2;
  v4 = objc_msgSend(v3, "offsetIntoSegment");
  v5 = *(_QWORD *)(a1 + 32);
  if (v5 <= v4)
  {
    if (v5 >= v4)
    {
      v7 = objc_msgSend(v3, "length");
      v8 = *(_QWORD *)(a1 + 40);
      v9 = v8 > v7;
      v10 = v8 < v7;
      if (v9)
        v6 = -1;
      else
        v6 = v10;
    }
    else
    {
      v6 = -1;
    }
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)debugDescription
{
  id v3;
  const __CFString *name;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_name)
    name = (const __CFString *)self->_name;
  else
    name = CFSTR("???");
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ (0x%llx-0x%llx, %lu source infos)"), name, self->_offsetIntoSegment, self->_length + self->_offsetIntoSegment, -[NSMutableArray count](self->_sourceInfos, "count"));
}

- (unint64_t)offsetIntoTextSegment
{
  return self->_offsetIntoSegment;
}

- (unint64_t)offsetIntoSegment
{
  return self->_offsetIntoSegment;
}

- (unint64_t)length
{
  return self->_length;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceInfos, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
