void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t dscsym_iterate_buffer(uint64_t a1, uint64_t a2, unsigned __int8 *a3, _QWORD *a4, _QWORD *a5, void *a6)
{
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  id v24;

  v11 = a6;
  if (a4)
    *a4 = -1;
  if (a5)
    *a5 = 0;
  if (a3)
    uuid_clear(a3);
  if (a1 && a2)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", a1, a2, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v12, 0, 0, &v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v24;
    if (!isValidDict(v13))
    {
      v21 = *__error();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        dscsym_iterate_buffer_cold_3(v14);
      *__error() = v21;
      v19 = 9;
      goto LABEL_26;
    }
    if (a3)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Cache_UUID_String"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((isValidString(v15) & 1) == 0)
      {
        v22 = *__error();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          dscsym_iterate_buffer_cold_2();
        *__error() = v22;

        v19 = 22;
        goto LABEL_26;
      }
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v15);
      objc_msgSend(v16, "getUUIDBytes:", a3);

    }
    if (a4)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Unslid_Base_Address"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Unslid_Base_Address"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = objc_msgSend(v18, "longLongValue");

      }
    }
    v19 = _dscsym_dict_iterate(v13, v11);
LABEL_26:

    goto LABEL_27;
  }
  v20 = *__error();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    dscsym_iterate_buffer_cold_1();
  *__error() = v20;
  v19 = 22;
LABEL_27:

  return v19;
}

BOOL isValidDict(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  v2 = v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v1, "count") != 0;

  return v2;
}

uint64_t isValidString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = objc_msgSend(v1, "isEqualToString:", &stru_1EA3F0258) ^ 1;
  else
    v2 = 0;

  return v2;
}

uint64_t _dscsym_dict_iterate(void *a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  int valid;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  int v47;
  int v48;
  int v49;
  uint64_t v50;
  int v51;
  int v52;
  uint64_t v53;
  int v54;
  int v55;
  __int128 v57;
  void *v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id obj;
  void *v67;
  uint64_t (**v68)(id, _QWORD *, uint64_t, const char *, uint64_t, uint64_t);
  uint64_t v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t buf[4];
  int v80;
  __int16 v81;
  _QWORD *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  void *v86;
  _BYTE v87[128];
  _QWORD v88[2];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v68 = a2;
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("Binaries"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (isValidArray(v3))
  {
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v58 = v3;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
    if (!v5)
    {
      v29 = 0;
      goto LABEL_80;
    }
    v7 = v5;
    v8 = 0x1E0CB3000uLL;
    v9 = *(_QWORD *)v76;
    *(_QWORD *)&v6 = 68157954;
    v57 = v6;
    v59 = *(_QWORD *)v76;
    v60 = v4;
    while (1)
    {
      v10 = 0;
      v61 = v7;
      do
      {
        if (*(_QWORD *)v76 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v10);
        if (!isValidDict(v11))
        {
          v54 = *__error();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            _dscsym_dict_iterate_cold_3();
          *__error() = v54;
          goto LABEL_79;
        }
        v88[0] = 0;
        v88[1] = 0;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("UUID_String"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((isValidString(v12) & 1) == 0)
        {
          v55 = *__error();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            _dscsym_dict_iterate_cold_2();
          goto LABEL_78;
        }
        v13 = (void *)objc_msgSend(objc_alloc(*(Class *)(v8 + 2600)), "initWithUUIDString:", v12);
        if (!v13)
        {
          v55 = *__error();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            _dscsym_dict_iterate_cold_1();
LABEL_78:
          *__error() = v55;

LABEL_79:
          v29 = 1;
          goto LABEL_80;
        }
        v64 = v13;
        objc_msgSend(v13, "getUUIDBytes:", v88);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Path"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v14;
        if (isValidString(v14))
        {
          v69 = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
        }
        else
        {
          v15 = *__error();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 68158210;
            v80 = 16;
            v81 = 2096;
            v82 = v88;
            v83 = 2112;
            v84 = v65;
            _os_log_impl(&dword_1DBD21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "binary %{uuid_t}.16P has no path %@", buf, 0x1Cu);
          }
          v69 = 0;
          *__error() = v15;
        }
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Segments"), v57);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        v63 = v10;
        if (v16 && !isValidArray(v16))
        {
          v18 = v17;
          v19 = *__error();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 68158210;
            v80 = 16;
            v81 = 2096;
            v82 = v88;
            v83 = 2048;
            v84 = v18;
            _os_log_error_impl(&dword_1DBD21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "binary %{uuid_t}.16P segments_array invalid %p", buf, 0x1Cu);
          }
          *__error() = v19;

          v17 = 0;
        }
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Load_Address"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        valid = isValidNumber(v20);
        v70 = v20;
        v67 = v17;
        if (valid)
        {
          v22 = v20;
          v23 = v12;
          v24 = objc_msgSend(v22, "unsignedLongLongValue");
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Text_Segment_Size"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (isValidNumber(v25))
          {
            v26 = objc_msgSend(v25, "unsignedLongLongValue");
          }
          else
          {
            v30 = *__error();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 68158210;
              v80 = 16;
              v81 = 2096;
              v82 = v88;
              v83 = 2112;
              v84 = v25;
              _os_log_impl(&dword_1DBD21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "binary %{uuid_t}.16P has no text size %@", buf, 0x1Cu);
            }
            v31 = __error();
            v26 = 0;
            *v31 = v30;
          }
          v32 = v68[2](v68, v88, v69, "__TEXT", v24, v26);

          v12 = v23;
          v20 = v70;
          if (v32)
          {
            v28 = 0;
            v29 = 2;
            goto LABEL_62;
          }
        }
        else if (!v17)
        {
          v27 = *__error();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 68158210;
            v80 = 16;
            v81 = 2096;
            v82 = v88;
            v83 = 2112;
            v84 = v20;
            _os_log_error_impl(&dword_1DBD21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "binary %{uuid_t}.16P has no load address %@", buf, 0x1Cu);
          }
          v28 = 0;
          *__error() = v27;
          v29 = 1;
          goto LABEL_62;
        }
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        obj = v67;
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
        if (!v33)
          goto LABEL_46;
        v34 = v33;
        v35 = *(_QWORD *)v72;
        v62 = v12;
        while (2)
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v72 != v35)
              objc_enumerationMutation(obj);
            v37 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
            if (!isValidDict(v37))
            {
              v47 = *__error();
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 68158210;
                v80 = 16;
                v81 = 2096;
                v82 = v88;
                v83 = 2048;
                v84 = v37;
                _os_log_error_impl(&dword_1DBD21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "binary %{uuid_t}.16P segment dict invalid %p", buf, 0x1Cu);
              }
              *__error() = v47;
              goto LABEL_57;
            }
            objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Name"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if ((isValidString(v38) & 1) == 0)
            {
              v48 = *__error();
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v57;
                v80 = 16;
                v81 = 2096;
                v82 = v88;
                _os_log_error_impl(&dword_1DBD21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "binary %{uuid_t}.16P segment has no name", buf, 0x12u);
              }
              *__error() = v48;
              goto LABEL_56;
            }
            if (!valid || (objc_msgSend(v38, "isEqualToString:", CFSTR("__TEXT")) & 1) == 0)
            {
              objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Load_Address"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              if ((isValidNumber(v39) & 1) == 0)
              {
                v49 = *__error();
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 68158466;
                  v80 = 16;
                  v81 = 2096;
                  v82 = v88;
                  v83 = 2112;
                  v84 = v38;
                  v85 = 2112;
                  v86 = v39;
                  _os_log_error_impl(&dword_1DBD21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "binary %{uuid_t}.16P segment %@ has no load address %@", buf, 0x26u);
                }
                *__error() = v49;

LABEL_56:
LABEL_57:
                v9 = v59;
                v4 = v60;
                v8 = 0x1E0CB3000;
                v7 = v61;
                v12 = v62;
                v50 = v63;

                v28 = 0;
                v29 = 1;
                goto LABEL_63;
              }
              v40 = objc_msgSend(v39, "unsignedLongLongValue");
              objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Size"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              if ((isValidNumber(v39) & 1) == 0)
              {
                v51 = *__error();
                v8 = 0x1E0CB3000;
                v7 = v61;
                v50 = v63;
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 68158466;
                  v80 = 16;
                  v81 = 2096;
                  v82 = v88;
                  v83 = 2112;
                  v84 = v38;
                  v85 = 2112;
                  v86 = v41;
                  _os_log_error_impl(&dword_1DBD21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "binary %{uuid_t}.16P segment %@ has no size %@", buf, 0x26u);
                }
                *__error() = v51;

                v28 = 0;
                v29 = 1;
                v9 = v59;
                v4 = v60;
                v12 = v62;
                goto LABEL_63;
              }
              v42 = objc_msgSend(v41, "unsignedLongLongValue");
              v43 = objc_retainAutorelease(v38);
              v44 = objc_msgSend(v43, "UTF8String");
              v45 = v42;
              v20 = v70;
              v46 = v68[2](v68, v88, v69, (const char *)v44, v40, v45);

              if (v46)
              {

                v29 = 0;
                v28 = 1;
                v9 = v59;
                v4 = v60;
                v8 = 0x1E0CB3000;
                v7 = v61;
                v12 = v62;
                goto LABEL_62;
              }
            }

          }
          v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
          v9 = v59;
          v4 = v60;
          v8 = 0x1E0CB3000;
          v12 = v62;
          if (v34)
            continue;
          break;
        }
LABEL_46:

        v29 = 0;
        v28 = 1;
        v7 = v61;
LABEL_62:
        v50 = v63;
LABEL_63:

        if (!v28)
        {
LABEL_80:

          v53 = (v29 << 31 >> 31) & 0x16;
          v3 = v58;
          goto LABEL_81;
        }
        v10 = v50 + 1;
      }
      while (v10 != v7);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
      v29 = 0;
      if (!v7)
        goto LABEL_80;
    }
  }
  v52 = *__error();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    _dscsym_dict_iterate_cold_4();
  *__error() = v52;
  v53 = 22;
LABEL_81:

  return v53;
}

uint64_t dscsym_iterate(const char *a1, unsigned __int8 *a2, _QWORD *a3, _QWORD *a4, void *a5)
{
  id v9;
  int is_null;
  id v11;
  id v12;
  char v13;
  uint64_t v14;
  int v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  int v33;
  int v34;
  int v35;
  int v36;
  _QWORD v38[4];
  uint8_t buf[8];
  __int128 v40;
  void *v41;
  id v42;
  _QWORD *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (a3)
    *a3 = -1;
  if (a4)
    *a4 = 0;
  is_null = uuid_is_null(a2);
  if (!v9 || is_null)
  {
    v15 = *__error();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      dscsym_iterate_cold_1((uint64_t)a2, (uint64_t)v9);
    *__error() = v15;
    v14 = 22;
  }
  else
  {
    if (a1)
      goto LABEL_15;
    v11 = v9;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v38[3] = a3;
    if (a3)
      *a3 = -1;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v40 = 3221225472;
    *((_QWORD *)&v40 + 1) = ___dscsym_iterate_live_shared_cache_with_uuid_block_invoke;
    v41 = &unk_1EA3F00D8;
    v43 = v38;
    v12 = v11;
    v42 = v12;
    v13 = _dscsym_dyld_shared_cache_with_uuid((uint64_t)a2, buf);

    _Block_object_dispose(v38, 8);
    if ((v13 & 1) == 0)
    {
LABEL_15:
      v16 = _dscsym_copy_dscsym_path_for_uuid(a1, a2);
      v17 = access(v16, 4);
      if ((_DWORD)v17)
      {
        v14 = *__error();
        free(v16);
        v21 = *__error();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68158210;
          *(_DWORD *)&buf[4] = 16;
          LOWORD(v40) = 2096;
          *(_QWORD *)((char *)&v40 + 2) = a2;
          WORD5(v40) = 1024;
          HIDWORD(v40) = v14;
          _os_log_impl(&dword_1DBD21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "unable to read dscsym %{uuid_t}.16P: %{errno}d", buf, 0x18u);
        }
        *__error() = v21;
      }
      else
      {
        v22 = (void *)MEMORY[0x1DF0B93F8](v17, v18, v19, v20);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v16);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          free(v16);
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v24)
          {
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Cache_UUID_String"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if ((isValidString(v26) & 1) != 0)
            {
              v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v26);
              v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a2);
              v29 = (void *)v28;
              if (v27 && v28 && (objc_msgSend(v27, "isEqual:", v28) & 1) != 0)
              {
                if (a3)
                {
                  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Unslid_Base_Address"));
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = v30 == 0;

                  if (!v31)
                  {
                    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Unslid_Base_Address"));
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    *a3 = objc_msgSend(v32, "longLongValue");

                  }
                }
                v14 = _dscsym_dict_iterate(v25, v9);
              }
              else
              {
                v36 = *__error();
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  dscsym_iterate_cold_4();
                *__error() = v36;
                v14 = 22;
              }

            }
            else
            {
              v35 = *__error();
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                dscsym_iterate_cold_5();
              *__error() = v35;
              v14 = 22;
            }

          }
          else
          {
            v34 = *__error();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              dscsym_iterate_cold_3();
            *__error() = v34;
            v14 = 22;
          }

        }
        else
        {
          v33 = *__error();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            dscsym_iterate_cold_2();
          *__error() = v33;
          free(v16);
          v14 = 22;
        }

        objc_autoreleasePoolPop(v22);
      }
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

void sub_1DBD22D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

char *_dscsym_copy_dscsym_path_for_uuid(const char *a1, unsigned __int8 *uu)
{
  char *result;
  char *v4;
  char out[40];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  memset(out, 0, 37);
  uuid_unparse(uu, out);
  if (a1)
    asprintf(&v4, "%s/%s%s", a1, "DSCSYM-", out);
  else
    asprintf(&v4, "%s/%s%s", "/private/var/db/dscsym", "DSCSYM-", out);
  result = v4;
  if (!v4)
    _dscsym_copy_dscsym_path_for_uuid_cold_1();
  return result;
}

uint64_t dscsym_copy_dscsym_files(const char *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v4 = (char *)_dscsym_directory_copy(a1, 1);
  dscsym_save_dscsyms_for_current_caches(a1);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __dscsym_copy_dscsym_files_block_invoke;
  v7[3] = &unk_1EA3EFF58;
  v7[4] = &v8;
  v7[5] = a2;
  _dscsym_foreach_dscsym_file(v4, v7);
  if (v4 != "/private/var/db/dscsym")
    free(v4);
  v5 = *((unsigned int *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v5;
}

void sub_1DBD22F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const char *_dscsym_directory_copy(const char *a1, int a2)
{
  const char *result;
  uid_t v5;
  int v6;
  char *v7;
  int v8;
  stat v9;
  char *v10;
  uint8_t buf[4];
  char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  if (!a1 || !strcmp(a1, "/"))
  {
    result = "/private/var/db/dscsym";
    v10 = "/private/var/db/dscsym";
    if (!a2)
      return result;
LABEL_7:
    memset(&v9, 0, sizeof(v9));
    if (stat(result, &v9))
    {
      v5 = geteuid();
      v6 = *__error();
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v12 = v10;
          _os_log_impl(&dword_1DBD21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "dscsym unable to create directory %s: not root", buf, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v7 = v10;
          v8 = *__error();
          *(_DWORD *)buf = 136315394;
          v12 = v7;
          v13 = 1024;
          v14 = v8;
          _os_log_impl(&dword_1DBD21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "creating dscsym directory %s (stat said: %{errno}d)", buf, 0x12u);
        }
        *__error() = v6;
        if (!mkdir(v10, 0x1EDu))
          return v10;
        v6 = *__error();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          _dscsym_directory_copy_cold_1();
      }
      *__error() = v6;
    }
    return v10;
  }
  asprintf(&v10, "%s%s", a1, "/private/var/db/dscsym");
  result = v10;
  if (!v10)
    _dscsym_copy_dscsym_path_for_uuid_cold_1();
  if (a2)
    goto LABEL_7;
  return result;
}

uint64_t dscsym_save_dscsyms_for_current_caches(const char *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  time_t v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[6];
  int v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v1 = (char *)_dscsym_directory_copy(a1, 1);
  v2 = MEMORY[0x1E0C809B0];
  dyld_for_each_installed_shared_cache_with_system_path();
  v3 = v12[3];
  v4 = *((_DWORD *)v8 + 6);
  v5 = time(0);
  v15[0] = v2;
  v15[1] = 3221225472;
  v15[2] = ___dscsym_remove_obsolete_caches_block_invoke;
  v15[3] = &__block_descriptor_52_e9_i16__0r_8l;
  v16 = v4;
  v15[4] = v3;
  v15[5] = v5 - 1209600;
  _dscsym_foreach_dscsym_file(v1, v15);
  free((void *)v12[3]);
  if (v1 != "/private/var/db/dscsym")
    free(v1);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return 0;
}

void sub_1DBD23258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void _dscsym_foreach_dscsym_file(const char *a1, void *a2)
{
  unsigned int (**v3)(id, char *);
  DIR *v4;
  int *v5;
  dirent *v6;
  NSObject *v7;
  const char *d_name;
  int v9;
  int v10;
  int v11;
  uint8_t buf[4];
  uint64_t v13;
  char __str[1024];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = opendir(a1);
  v5 = __error();
  if (v4)
  {
    *v5 = 0;
    v6 = readdir(v4);
    if (v6)
    {
      v7 = MEMORY[0x1E0C81028];
      do
      {
        d_name = v6->d_name;
        if (!strncmp(v6->d_name, "DSCSYM-", 7uLL))
        {
          snprintf(__str, 0x400uLL, "%s/%s", a1, d_name);
          if (v3[2](v3, __str))
            goto LABEL_14;
          v9 = 0;
        }
        else
        {
          v9 = *__error();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
            _dscsym_foreach_dscsym_file_cold_3(buf, (uint64_t)d_name, &v13);
        }
        *__error() = v9;
        v6 = readdir(v4);
      }
      while (v6);
    }
    if (*__error())
    {
      v10 = *__error();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        _dscsym_foreach_dscsym_file_cold_2();
      *__error() = v10;
    }
LABEL_14:
    closedir(v4);
  }
  else
  {
    v11 = *v5;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      _dscsym_foreach_dscsym_file_cold_1();
    *__error() = v11;
  }

}

uint64_t __dscsym_copy_dscsym_files_block_invoke(uint64_t a1, char *__s1)
{
  char *v4;
  char *v5;
  int v6;
  int v7;
  uint64_t result;
  int v9;
  char *to;

  v4 = strdup(__s1);
  v5 = basename(v4);
  to = 0;
  v6 = asprintf(&to, "%s/%s", *(const char **)(a1 + 40), v5);
  free(v4);
  if (v6 == -1)
  {
    v9 = *__error();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __dscsym_copy_dscsym_files_block_invoke_cold_1();
    *__error() = v9;
    result = 12;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 12;
  }
  else
  {
    if (copyfile(__s1, to, 0, 0x100000Au))
    {
      v7 = *__error();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __dscsym_copy_dscsym_files_block_invoke_cold_2();
      *__error() = v7;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *__error();
    }
    free(to);
    return 0;
  }
  return result;
}

uint64_t dscsym_mmap_dscsym_for_uuid(const char *a1, unsigned __int8 *a2, _QWORD *a3, _QWORD *a4)
{
  void *v8;
  char *v9;
  char *v10;
  int v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;
  int v15;
  int *v16;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;
  off_t v23;
  uint64_t v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  unsigned __int8 *v28;
  __int16 v29;
  char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v24 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  *a3 = 0;
  *a4 = 0;
  v8 = (void *)MEMORY[0x1DF0B93F8]();
  v9 = (char *)_dscsym_directory_copy(a1, a1 == 0);
  v10 = _dscsym_copy_dscsym_path_for_uuid(v9, a2);
  if (v9 != "/private/var/db/dscsym")
    free(v9);
  v11 = _dscsym_mmap_file(v10, &v24, &v23);
  v12 = v20;
  *((_DWORD *)v20 + 6) = v11;
  if (!v11)
  {
    *a3 = v24;
    *a4 = v23;
    v15 = *__error();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68158210;
      v26 = 16;
      v27 = 2096;
      v28 = a2;
      v29 = 2080;
      v30 = v10;
      _os_log_impl(&dword_1DBD21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "dscsym %{uuid_t}.16P mapped from file %s", buf, 0x1Cu);
    }
    v16 = __error();
    goto LABEL_13;
  }
  v13 = 2;
  if (!a1)
  {
    *((_DWORD *)v12 + 6) = 2;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __dscsym_mmap_dscsym_for_uuid_block_invoke;
    v18[3] = &unk_1EA3EFF80;
    v18[4] = &v19;
    v18[5] = v10;
    _dscsym_dyld_shared_cache_with_uuid((uint64_t)a2, v18);
    if (!*((_DWORD *)v20 + 6))
    {
      v14 = _dscsym_mmap_file(v10, &v24, &v23);
      *((_DWORD *)v20 + 6) = v14;
      if (!v14)
      {
        *a3 = v24;
        *a4 = v23;
        v15 = *__error();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 68158210;
          v26 = 16;
          v27 = 2096;
          v28 = a2;
          v29 = 2080;
          v30 = v10;
          _os_log_impl(&dword_1DBD21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "dscsym %{uuid_t}.16P mapped from file %s", buf, 0x1Cu);
        }
        v16 = __error();
LABEL_13:
        v13 = 0;
        *v16 = v15;
      }
    }
  }
  free(v10);
  objc_autoreleasePoolPop(v8);
  _Block_object_dispose(&v19, 8);
  return v13;
}

void sub_1DBD237F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _dscsym_mmap_file(const char *a1, _QWORD *a2, off_t *a3)
{
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t result;
  int v11;
  void *v12;
  void *v13;
  stat v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = open(a1, 0);
  if (v6 == -1)
  {
    v8 = *__error();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v9 = *__error();
      v14.st_dev = 136315394;
      *(_QWORD *)&v14.st_mode = a1;
      WORD2(v14.st_ino) = 1024;
      *(_DWORD *)((char *)&v14.st_ino + 6) = v9;
      _os_log_impl(&dword_1DBD21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "dscsym unable to open %s: %{errno}d", (uint8_t *)&v14, 0x12u);
    }
    goto LABEL_7;
  }
  v7 = v6;
  memset(&v14, 0, sizeof(v14));
  if (fstat(v6, &v14))
  {
    v8 = *__error();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      _dscsym_mmap_file_cold_3();
LABEL_7:
    *__error() = v8;
    return *__error();
  }
  if (v14.st_size < 0x7FFFFFFFFFFFFFFFuLL)
  {
    v12 = mmap(0, v14.st_size, 1, 1, v7, 0);
    if (v12 == (void *)-1)
    {
      v8 = *__error();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        _dscsym_mmap_file_cold_2();
      goto LABEL_7;
    }
    v13 = v12;
    close(v7);
    result = 0;
    *a2 = v13;
    *a3 = v14.st_size;
  }
  else
  {
    v11 = *__error();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      _dscsym_mmap_file_cold_1();
    *__error() = v11;
    return 27;
  }
  return result;
}

uint64_t _dscsym_dyld_shared_cache_with_uuid(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4 = a2;
  dyld_for_each_installed_shared_cache_with_system_path();

  v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_1DBD23AC4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __dscsym_mmap_dscsym_for_uuid_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = _dscsym_create_dsc_file_for_shared_cache(a2, *(_QWORD *)(a1 + 40));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t _dscsym_create_dsc_file_for_shared_cache(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1DF0B93F8]();
  v18 = 0;
  _dscsym_iterate_dyld_shared_cache(a1, (unint64_t)&v18, 0);
  v5 = v18;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a2);
    if (v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E48]), "initToFileAtPath:append:", v8, 0);
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "open");
        v19 = 0;
        v11 = objc_msgSend(MEMORY[0x1E0CB38B0], "writePropertyList:toStream:format:options:error:", v7, v10, 200, 0, &v19);
        v12 = v19;
        objc_msgSend(v10, "close");
        v13 = *__error();
        if (v11)
        {
          v14 = 0;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v21 = a2;
            v22 = 2048;
            v23 = v11;
            _os_log_impl(&dword_1DBD21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Wrote out new dscsym for shared cache to %s (%{bytes}ld)", buf, 0x16u);
            v14 = 0;
          }
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            _dscsym_create_dsc_file_for_shared_cache_cold_3(a2, v12);
          v14 = 9;
        }
        *__error() = v13;

      }
      else
      {
        v16 = *__error();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          _dscsym_create_dsc_file_for_shared_cache_cold_2();
        *__error() = v16;
        v14 = 12;
      }

    }
    else
    {
      v15 = *__error();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        _dscsym_create_dsc_file_for_shared_cache_cold_1();
      *__error() = v15;
      v14 = 12;
    }

  }
  else
  {
    v14 = 2;
  }

  objc_autoreleasePoolPop(v4);
  return v14;
}

uint64_t dscsym_generate_dscsym_file()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  int v5;

  v2 = 0;
  v3 = &v2;
  v4 = 0x2020000000;
  v5 = 2;
  dyld_shared_cache_for_file();
  v0 = *((unsigned int *)v3 + 6);
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1DBD23DFC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __dscsym_generate_dscsym_file_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = _dscsym_generate_dscsym_file(a2, *(const char **)(a1 + 40), *(char ***)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t _dscsym_generate_dscsym_file(uint64_t a1, const char *a2, char **a3)
{
  int v6;
  char *v7;
  char *v8;
  uint64_t dsc_file_for_shared_cache;
  uint64_t v10;
  int v11;
  unsigned __int8 uu[8];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3)
    *a3 = 0;
  *(_QWORD *)uu = 0;
  v14 = 0;
  dyld_shared_cache_copy_uuid();
  v6 = *__error();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    _dscsym_generate_dscsym_file_cold_2();
  *__error() = v6;
  v7 = _dscsym_copy_dscsym_path_for_uuid(a2, uu);
  if (!v7)
    return 12;
  v8 = v7;
  if (!access(v7, 0))
  {
    v11 = *__error();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      _dscsym_generate_dscsym_file_cold_1();
    *__error() = v11;
    if (!a3)
    {
      free(v8);
      return 0;
    }
    v10 = 0;
    goto LABEL_15;
  }
  dsc_file_for_shared_cache = _dscsym_create_dsc_file_for_shared_cache(a1, (uint64_t)v8);
  v10 = dsc_file_for_shared_cache;
  if (a3 && !(_DWORD)dsc_file_for_shared_cache)
  {
LABEL_15:
    *a3 = v8;
    return v10;
  }
  free(v8);
  return v10;
}

uint64_t __dscsym_save_dscsyms_for_current_caches_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = malloc_type_realloc(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 24), 16* (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24)+ 1), 0x1000040451B5BE8uLL);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    _dscsym_copy_dscsym_path_for_uuid_cold_1();
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  dyld_shared_cache_copy_uuid();
  return _dscsym_generate_dscsym_file(a2, *(const char **)(a1 + 48), 0);
}

uint64_t dscsym_buffer_iterate_binaries(uint64_t a1, uint64_t a2, unsigned __int8 *a3, void *a4)
{
  return dscsym_buffer_iterate(a1, a2, a3, 0, a4);
}

uint64_t dscsym_buffer_iterate(uint64_t a1, uint64_t a2, unsigned __int8 *a3, _QWORD *a4, void *a5)
{
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;

  v9 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __dscsym_buffer_iterate_block_invoke;
  v13[3] = &unk_1EA3EFFF8;
  v14 = v9;
  v10 = v9;
  v11 = dscsym_iterate_buffer(a1, a2, a3, a4, 0, v13);

  return v11;
}

uint64_t __dscsym_buffer_iterate_block_invoke(uint64_t a1, int a2, int a3, char *__s1)
{
  if (!strcmp(__s1, "__TEXT"))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return 0;
}

uint64_t dscsym_iterate_binaries(const char *a1, unsigned __int8 *a2, void *a3)
{
  return dscsym_uuid_iterate(a1, a2, 0, a3);
}

uint64_t dscsym_uuid_iterate(const char *a1, unsigned __int8 *a2, _QWORD *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;

  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __dscsym_uuid_iterate_block_invoke;
  v11[3] = &unk_1EA3EFFF8;
  v12 = v7;
  v8 = v7;
  v9 = dscsym_iterate(a1, a2, a3, 0, v11);

  return v9;
}

uint64_t __dscsym_uuid_iterate_block_invoke(uint64_t a1, int a2, int a3, char *__s1)
{
  if (!strcmp(__s1, "__TEXT"))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return 0;
}

BOOL isValidArray(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  v2 = v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v1, "count") != 0;

  return v2;
}

uint64_t isValidNumber(void *a1)
{
  id v1;
  char isKindOfClass;

  if (a1)
  {
    v1 = a1;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

void _dscsym_iterate_dyld_shared_cache(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!(a2 | v5))
    _dscsym_copy_dscsym_path_for_uuid_cold_1();
  v6 = (void *)v5;
  if (a2)
  {
    v7 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3));
    *(_QWORD *)a2 = v7;
    v13 = 0;
    v14 = 0;
    dyld_shared_cache_copy_uuid();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &v13);
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("Cache_UUID_String"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", MEMORY[0x1DF0B9380](a1));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("Unslid_Base_Address"));

  }
  else
  {
    v7 = 0;
  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v11 = v7;
  v12 = v6;
  dyld_shared_cache_for_each_image();

  _Block_object_dispose(&v13, 8);
}

void sub_1DBD24520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___dscsym_iterate_dyld_shared_cache_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  __int128 v14;
  _QWORD v15[4];
  id v16;
  id v17;
  __int128 v18;
  unsigned __int8 *v19;
  uint64_t v20;
  unsigned __int8 uu[8];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) || !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    *(_QWORD *)uu = 0;
    v22 = 0;
    if (dyld_image_copy_uuid())
    {
      if (!uuid_is_null(uu))
      {
        v4 = MEMORY[0x1DF0B9350](a2);
        if (*(_QWORD *)(a1 + 32))
        {
          v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 5);
          v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uu);
          objc_msgSend(v6, "UUIDString");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("UUID_String"));

          if (v4)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("Path"));

          }
          v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("Segments"));
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("Binaries"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v10)
          {
            v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2300);
            objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, CFSTR("Binaries"));
          }
          objc_msgSend(v10, "addObject:", v5);

        }
        else
        {
          v5 = 0;
          v9 = 0;
        }
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = ___dscsym_iterate_dyld_shared_cache_block_invoke_2;
        v15[3] = &unk_1EA3F0020;
        v16 = v5;
        v17 = v9;
        v14 = *(_OWORD *)(a1 + 40);
        v11 = (id)v14;
        v18 = v14;
        v19 = uu;
        v20 = v4;
        v12 = v9;
        v13 = v5;
        MEMORY[0x1DF0B9344](a2, v15);

      }
    }
  }
}

void ___dscsym_iterate_dyld_shared_cache_block_invoke_2(uint64_t a1, char *__s2, uint64_t a3, uint64_t a4)
{
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  if (__s2)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      if (!strcmp("__TEXT", __s2))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, CFSTR("Load_Address"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, CFSTR("Text_Segment_Size"));
      }
      else
      {
        v8 = *(void **)(a1 + 40);
        v9 = objc_alloc(MEMORY[0x1E0C99D80]);
        if (CachedNSStringForCString_onceToken != -1)
          dispatch_once(&CachedNSStringForCString_onceToken, &__block_literal_global);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", __s2);
        if (v10)
        {
          objc_msgSend((id)CachedNSStringForCString_cachedStrings, "member:", v10);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          if (!v11)
          {
            v11 = v10;
            objc_msgSend((id)CachedNSStringForCString_cachedStrings, "addObject:", v11);
          }
        }
        else
        {
          v11 = 0;
        }

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", v11, CFSTR("Name"), v13, CFSTR("Load_Address"), v14, CFSTR("Size"), 0);
        objc_msgSend(v8, "addObject:", v15);

      }
    }
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v16 = *(_QWORD *)(a1 + 48);
      if (v16)
      {
        if ((*(unsigned int (**)(uint64_t, _QWORD, _QWORD, char *, uint64_t, uint64_t))(v16 + 16))(v16, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), __s2, a3, a4))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
        }
      }
    }
  }
}

uint64_t ___dscsym_remove_obsolete_caches_block_invoke(uint64_t a1, char *a2)
{
  int v4;
  __darwin_time_t tv_sec;
  uint64_t v6;
  unint64_t v7;
  int v8;
  int v9;
  int v10;
  stat v12;
  uuid_string_t out;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  memset(&v12, 0, sizeof(v12));
  if (stat(a2, &v12))
  {
    v4 = *__error();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      ___dscsym_remove_obsolete_caches_block_invoke_cold_4();
    *__error() = v4;
    return 0;
  }
  tv_sec = v12.st_birthtimespec.tv_sec;
  if (*(_DWORD *)(a1 + 48))
  {
    v6 = 0;
    v7 = 0;
    while (1)
    {
      memset(out, 0, sizeof(out));
      uuid_unparse((const unsigned __int8 *)(*(_QWORD *)(a1 + 32) + v6), out);
      if (strstr(a2, out))
        break;
      ++v7;
      v6 += 16;
      if (v7 >= *(unsigned int *)(a1 + 48))
        goto LABEL_9;
    }
    v10 = *__error();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      ___dscsym_remove_obsolete_caches_block_invoke_cold_3();
    goto LABEL_17;
  }
LABEL_9:
  if (tv_sec >= *(_QWORD *)(a1 + 40))
  {
    v10 = *__error();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      ___dscsym_remove_obsolete_caches_block_invoke_cold_2();
LABEL_17:
    *__error() = v10;
    return 0;
  }
  v8 = unlink(a2);
  v9 = *__error();
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      ___dscsym_remove_obsolete_caches_block_invoke_cold_1();
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)out = 136315394;
    *(_QWORD *)&out[4] = a2;
    *(_WORD *)&out[12] = 2048;
    *(_QWORD *)&out[14] = tv_sec;
    _os_log_impl(&dword_1DBD21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Unlinked old dscsym %s created at %{time_t}ld", (uint8_t *)out, 0x16u);
  }
  *__error() = v9;
  return 0;
}

uint64_t ___dscsym_dyld_shared_cache_with_uuid_block_invoke(uint64_t result)
{
  uint64_t v1;
  unsigned __int8 uu2[8];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v1 = result;
    *(_QWORD *)uu2 = 0;
    v3 = 0;
    dyld_shared_cache_copy_uuid();
    result = uuid_compare(*(const unsigned __int8 **)(v1 + 48), uu2);
    if (!(_DWORD)result)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = 1;
      return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
    }
  }
  return result;
}

void ___dscsym_iterate_live_shared_cache_with_uuid_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = MEMORY[0x1DF0B9380](a2);
  _dscsym_iterate_dyld_shared_cache(a2, 0, *(void **)(a1 + 32));
}

int *OUTLINED_FUNCTION_12()
{
  return __error();
}

void OUTLINED_FUNCTION_15(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_16()
{
  return _os_assert_log();
}

void dscsym_iterate_buffer_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_1DBD21000, MEMORY[0x1E0C81028], v0, "buffer %p length %ld", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void dscsym_iterate_buffer_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2(&dword_1DBD21000, MEMORY[0x1E0C81028], v0, "dscsym has no uuid %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void dscsym_iterate_buffer_cold_3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "debugDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2(&dword_1DBD21000, MEMORY[0x1E0C81028], v2, "dscsym deserialization failed: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3();
}

void _dscsym_dict_iterate_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2(&dword_1DBD21000, MEMORY[0x1E0C81028], v0, "binary unable to parse uuid %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void _dscsym_dict_iterate_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2(&dword_1DBD21000, MEMORY[0x1E0C81028], v0, "binary has no uuid %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void _dscsym_dict_iterate_cold_3()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1DBD21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "binary_dict invalid", v0, 2u);
}

void _dscsym_dict_iterate_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2(&dword_1DBD21000, MEMORY[0x1E0C81028], v0, "binaries_array invalid %p", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void dscsym_iterate_cold_1(uint64_t a1, uint64_t a2)
{
  void *v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1DF0B94E8](a2);
  v4[0] = 68158210;
  v4[1] = 16;
  v5 = 2096;
  v6 = a1;
  v7 = 2048;
  v8 = v3;
  _os_log_fault_impl(&dword_1DBD21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "uuid %{uuid_t}.16P callback %p", (uint8_t *)v4, 0x1Cu);

  OUTLINED_FUNCTION_14();
}

void dscsym_iterate_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_1DBD21000, MEMORY[0x1E0C81028], v0, "dscsym %{uuid_t}.16P unable to create NSString from path %s", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void dscsym_iterate_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1(&dword_1DBD21000, MEMORY[0x1E0C81028], v0, "dscsym %{uuid_t}.16P file invalid", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void dscsym_iterate_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1DBD21000, MEMORY[0x1E0C81028], v0, "dscsym %{uuid_t}.16P uuid mismatch %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void dscsym_iterate_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1DBD21000, MEMORY[0x1E0C81028], v0, "dscsym %{uuid_t}.16P uuid invalid %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void _dscsym_copy_dscsym_path_for_uuid_cold_1()
{
  OUTLINED_FUNCTION_16();
  _os_crash();
  __break(1u);
}

void _dscsym_directory_copy_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  __error();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DBD21000, MEMORY[0x1E0C81028], v0, "dscsym unable to create directory %s: %{errno}d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void _dscsym_foreach_dscsym_file_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DBD21000, MEMORY[0x1E0C81028], v0, "Unable to open dscsym directory %s: %{errno}d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void _dscsym_foreach_dscsym_file_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DBD21000, MEMORY[0x1E0C81028], v0, "Unable to read cache directory %s: %{errno}d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void _dscsym_foreach_dscsym_file_cold_3(uint8_t *buf, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)buf = 136315138;
  *a3 = a2;
  _os_log_debug_impl(&dword_1DBD21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "File %s isn't a dscsym file", buf, 0xCu);
}

void __dscsym_copy_dscsym_files_block_invoke_cold_1()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_1DBD21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "dscsym unable to asprintf copy destination path: %{errno}d", (uint8_t *)v1, 8u);
}

void __dscsym_copy_dscsym_files_block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __error();
  OUTLINED_FUNCTION_4(&dword_1DBD21000, MEMORY[0x1E0C81028], v0, "Unable to copy dscsym file %s to %s: %{errno}d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_14();
}

void _dscsym_mmap_file_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10(&dword_1DBD21000, MEMORY[0x1E0C81028], v0, "dscsym file too large %s: %{bytes}lld", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void _dscsym_mmap_file_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DBD21000, MEMORY[0x1E0C81028], v0, "dscsym unable to mmap %s: %{errno}d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void _dscsym_mmap_file_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DBD21000, MEMORY[0x1E0C81028], v0, "dscsym unable to fstat %s: %{errno}d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void _dscsym_create_dsc_file_for_shared_cache_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2(&dword_1DBD21000, MEMORY[0x1E0C81028], v0, "Unable to create string for dscsym path %s", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void _dscsym_create_dsc_file_for_shared_cache_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2(&dword_1DBD21000, MEMORY[0x1E0C81028], v0, "Unable to create stream for dscsym path %s", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void _dscsym_create_dsc_file_for_shared_cache_cold_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a2, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10(&dword_1DBD21000, MEMORY[0x1E0C81028], v2, "Unable to save shared cache dscsym %s: %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_3();
}

void _dscsym_generate_dscsym_file_cold_1()
{
  uint8_t v0[40];
  uint64_t v1;

  v1 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_1DBD21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "dscsym already exists for %{uuid_t}.16P: %s", v0, 0x1Cu);
  OUTLINED_FUNCTION_6();
}

void _dscsym_generate_dscsym_file_cold_2()
{
  uint8_t v0[24];
  uint64_t v1;

  v1 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_13();
  _os_log_debug_impl(&dword_1DBD21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "checking cache file %{uuid_t}.16P", v0, 0x12u);
  OUTLINED_FUNCTION_5();
}

void ___dscsym_remove_obsolete_caches_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __error();
  OUTLINED_FUNCTION_4(&dword_1DBD21000, MEMORY[0x1E0C81028], v0, "Unable to unlink old dscsym %s created at %{time_t}ld: %{errno}d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_14();
}

void ___dscsym_remove_obsolete_caches_block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15(&dword_1DBD21000, MEMORY[0x1E0C81028], v0, "Not unlinking old dscsym %s created at %{time_t}ld", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void ___dscsym_remove_obsolete_caches_block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15(&dword_1DBD21000, MEMORY[0x1E0C81028], v0, "Not unlinking live dscsym %s created at %{time_t}ld", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

void ___dscsym_remove_obsolete_caches_block_invoke_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DBD21000, MEMORY[0x1E0C81028], v0, "Unable to stat dscsym file %s: %{errno}d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1E0C80FF0]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
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

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

char *__cdecl basename(char *a1)
{
  return (char *)MEMORY[0x1E0C816D8](a1);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1E0C82B18](from, to, state, *(_QWORD *)&flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

uint64_t dyld_for_each_installed_shared_cache_with_system_path()
{
  return MEMORY[0x1E0C83098]();
}

uint64_t dyld_image_copy_uuid()
{
  return MEMORY[0x1E0C830D8]();
}

uint64_t dyld_image_for_each_segment_info()
{
  return MEMORY[0x1E0C830E0]();
}

uint64_t dyld_image_get_installname()
{
  return MEMORY[0x1E0C830F0]();
}

uint64_t dyld_shared_cache_copy_uuid()
{
  return MEMORY[0x1E0C83160]();
}

uint64_t dyld_shared_cache_for_each_image()
{
  return MEMORY[0x1E0C83178]();
}

uint64_t dyld_shared_cache_for_file()
{
  return MEMORY[0x1E0C83180]();
}

uint64_t dyld_shared_cache_get_base_address()
{
  return MEMORY[0x1E0C83188]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C844C0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C85008](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

void uuid_clear(uuid_t uu)
{
  MEMORY[0x1E0C85A00](uu);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1E0C85A08](uu1, uu2);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1E0C85A30](uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A40](uu, out);
}

