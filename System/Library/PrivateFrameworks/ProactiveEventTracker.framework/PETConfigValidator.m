@implementation PETConfigValidator

+ (BOOL)configIsValid:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  BOOL v15;
  NSObject *v16;
  const char *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[8];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("version"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
LABEL_16:
      v15 = 0;
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v16 = MEMORY[0x1E0C81028];
    v17 = "unexpected type of config version!";
LABEL_24:
    _os_log_error_impl(&dword_18FAB0000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_16;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("message_groups"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v7 = objc_opt_isKindOfClass();

  if ((v7 & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v16 = MEMORY[0x1E0C81028];
    v17 = "unexpected type of message groups configuration!";
    goto LABEL_24;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("message_groups"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v8, "allValues", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "unexpected type of message group configuration!", buf, 2u);
          }
LABEL_20:
          v15 = 0;
          goto LABEL_21;
        }
        if (!objc_msgSend((id)objc_opt_class(), "_groupConfigIsValid:", v14))
          goto LABEL_20;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      v15 = 1;
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    v15 = 1;
  }
LABEL_21:

LABEL_22:
  return v15;
}

+ (BOOL)_groupConfigIsValid:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  BOOL v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[16];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("device_sampling"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "unexpected type of group device sampling!", buf, 2u);
    }
    v17 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("device_sampling_seed"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "unexpected type of group seed device sampling!", buf, 2u);
      }
      v17 = 0;
    }
    else
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("message_sampling"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "unexpected type of group message sampling!", buf, 2u);
        }
        v17 = 0;
      }
      else
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sampling_limit"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "unexpected type of sampling limit!", buf, 2u);
          }
          v17 = 0;
        }
        else
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sig_figs"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "unexpected type of sig_figs!", buf, 2u);
            }
            v17 = 0;
          }
          else
          {
            objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("aggregated"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "unexpected type of aggregated!", buf, 2u);
              }
              v17 = 0;
            }
            else
            {
              objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("message_whitelist"));
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "unexpected type of message whitelist!", buf, 2u);
                }
                v17 = 0;
              }
              else
              {
                v21 = v9;
                v22 = v8;
                v25 = 0u;
                v26 = 0u;
                v23 = 0u;
                v24 = 0u;
                v20 = v10;
                objc_msgSend(v10, "allValues");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
                if (v12)
                {
                  v13 = v12;
                  v14 = *(_QWORD *)v24;
                  v19 = v7;
                  while (2)
                  {
                    for (i = 0; i != v13; ++i)
                    {
                      if (*(_QWORD *)v24 != v14)
                        objc_enumerationMutation(v11);
                      v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        v7 = v19;
                        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "unexpected type of message config!", buf, 2u);
                        }
                        v17 = 0;
                        goto LABEL_51;
                      }
                      if (!objc_msgSend((id)objc_opt_class(), "_messageConfigIsValid:", v16))
                      {
                        v17 = 0;
                        v7 = v19;
                        goto LABEL_51;
                      }
                    }
                    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
                    v17 = 1;
                    v7 = v19;
                    if (v13)
                      continue;
                    break;
                  }
                }
                else
                {
                  v17 = 1;
                }
LABEL_51:

                v9 = v21;
                v8 = v22;
                v10 = v20;
              }

            }
          }

        }
      }

    }
  }

  return v17;
}

+ (BOOL)_messageConfigIsValid:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t j;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[16];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("device_sampling"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "unexpected type of device sampling!", buf, 2u);
    }
    v28 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("device_sampling_seed"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "unexpected type of seed device sampling!", buf, 2u);
      }
      v28 = 0;
    }
    else
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("message_sampling"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "unexpected type of message sampling!", buf, 2u);
        }
        v28 = 0;
      }
      else
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sig_figs"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "unexpected type of sig figs!", buf, 2u);
          }
          v28 = 0;
        }
        else
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("aggregated"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "unexpected type of aggregated!", buf, 2u);
            }
            v28 = 0;
          }
          else
          {
            objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("field_whitelist"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "unexpected type of field whitelist!", buf, 2u);
              }
              v28 = 0;
            }
            else
            {
              v34 = v8;
              v35 = v7;
              v36 = v9;
              v45 = 0u;
              v46 = 0u;
              v47 = 0u;
              v48 = 0u;
              v10 = v9;
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
              if (v11)
              {
                v12 = v11;
                v13 = *(_QWORD *)v46;
                while (2)
                {
                  for (i = 0; i != v12; ++i)
                  {
                    if (*(_QWORD *)v46 != v13)
                      objc_enumerationMutation(v10);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "unexpected type of field in field whitelist!", buf, 2u);
                      }
                      v28 = 0;
                      v15 = v10;
                      goto LABEL_62;
                    }
                  }
                  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
                  if (v12)
                    continue;
                  break;
                }
              }

              objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hist_buckets"));
              v15 = (id)objc_claimAutoreleasedReturnValue();
              if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "unexpected type of histogram buckets!", buf, 2u);
                }
                v28 = 0;
LABEL_62:
                v8 = v34;
                v7 = v35;
              }
              else
              {
                v32 = v6;
                v41 = 0u;
                v42 = 0u;
                v43 = 0u;
                v44 = 0u;
                v15 = v15;
                v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
                if (v16)
                {
                  v17 = v16;
                  v18 = *(_QWORD *)v42;
                  while (2)
                  {
                    v19 = v15;
                    for (j = 0; j != v17; ++j)
                    {
                      if (*(_QWORD *)v42 != v18)
                        objc_enumerationMutation(v19);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "unexpected type of bucket in histogram buckets!", buf, 2u);
                        }
                        v28 = 0;
                        v15 = v19;
                        v29 = v19;
                        v8 = v34;
                        v7 = v35;
                        v6 = v32;
                        goto LABEL_83;
                      }
                    }
                    v15 = v19;
                    v17 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
                    if (v17)
                      continue;
                    break;
                  }
                }

                objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("nested_fields"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  v30 = v21;
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "unexpected type of nested fields!", buf, 2u);
                  }
                  v28 = 0;
                  v8 = v34;
                  v7 = v35;
                  v6 = v32;
                  v29 = v30;
                }
                else
                {
                  v37 = 0u;
                  v38 = 0u;
                  v39 = 0u;
                  v40 = 0u;
                  v22 = v21;
                  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
                  if (v23)
                  {
                    v24 = v23;
                    v33 = *(_QWORD *)v38;
                    v6 = v32;
                    while (2)
                    {
                      for (k = 0; k != v24; ++k)
                      {
                        if (*(_QWORD *)v38 != v33)
                          objc_enumerationMutation(v22);
                        v26 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * k);
                        if (!objc_msgSend(v26, "integerValue"))
                        {
                          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                          {
                            *(_WORD *)buf = 0;
                            _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "unexpected value of field string in nested fields!", buf, 2u);
                          }
                          goto LABEL_81;
                        }
                        objc_msgSend(v22, "objectForKeyedSubscript:", v26);
                        v27 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v27)
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                            {
                              *(_WORD *)buf = 0;
                              _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "unexpected value of message name in nested fields!", buf, 2u);
                            }

LABEL_81:
                            v28 = 0;
                            goto LABEL_82;
                          }
                        }

                      }
                      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
                      v28 = 1;
                      if (v24)
                        continue;
                      break;
                    }
                  }
                  else
                  {
                    v28 = 1;
                    v6 = v32;
                  }
LABEL_82:

                  v29 = v22;
                  v8 = v34;
                  v7 = v35;
                }
LABEL_83:

              }
              v9 = v36;
            }

          }
        }

      }
    }

  }
  return v28;
}

@end
