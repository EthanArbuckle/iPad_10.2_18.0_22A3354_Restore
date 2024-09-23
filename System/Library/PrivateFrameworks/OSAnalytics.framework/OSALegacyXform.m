@implementation OSALegacyXform

- (OSALegacyXform)init
{
  OSALegacyXform *v2;
  uint64_t v3;
  NSMutableDictionary *templates;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OSALegacyXform;
  v2 = -[OSALegacyXform init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    templates = v2->_templates;
    v2->_templates = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (BOOL)prepareTemplate:(id)a3 forLogType:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;

  v7 = a4;
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("\n"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](self->_templates, "setValue:forKey:", v8, v7);

  return 0;
}

- (id)formatFrame:(id)a3 withImages:(id)a4 macosStyle:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  const __CFString *v33;
  void *v34;
  int v35;
  const __CFString *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  __CFString *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint8_t buf[4];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("imageIndex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", (int)objc_msgSend(v9, "intValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("name"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = (__CFString *)v12;
  else
    v13 = CFSTR("???");
  if ((unint64_t)-[__CFString length](v13, "length") < 0x1F)
  {
    -[__CFString stringByPaddingToLength:withString:startingAtIndex:](v13, "stringByPaddingToLength:withString:startingAtIndex:", 30, CFSTR(" "), 0);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a5)
      goto LABEL_12;
    v14 = (void *)MEMORY[0x1E0CB3940];
    -[__CFString substringFromIndex:](v13, "substringFromIndex:", -[__CFString length](v13, "length") - 27);
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("...%@"), v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v13 = (__CFString *)v15;
  }

  v13 = (__CFString *)v16;
LABEL_12:
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("base"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "unsignedLongLongValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("imageOffset"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "unsignedLongLongValue");

  v21 = v18 + v20;
  if ((unint64_t)objc_msgSend(v7, "count") < 3)
  {
    if (v18 && v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p + %llu"), v18, v20);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v21)
        v21 = v20;
      v23 = CFSTR("???");
    }
  }
  else
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("symbol"));
    v46 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("symbolLocation"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v11;
    v47 = v18 + v20;
    if (v22)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = objc_msgSend(v22, "unsignedLongLongValue");
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v22;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "*** ignoring non-numeric symbolLocation: '%@'", buf, 0xCu);
      }
    }
    v45 = v10;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sourceFile"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sourceLine"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    v43 = v22;
    v27 = &stru_1E4DEECB8;
    if (v24 && v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (%@:%@)"), v24, v25);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("inline"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    v30 = (void *)v46;
    if (v46)
    {
      v31 = (void *)MEMORY[0x1E0CB3940];
      v32 = objc_msgSend(v28, "BOOLValue");
      v33 = CFSTR(" [inlined]");
      if (!v32)
        v33 = &stru_1E4DEECB8;
      objc_msgSend(v31, "stringWithFormat:", CFSTR("%@ + %llu%@%@"), v46, v20, v27, v33);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v18 && v20)
      {
        v34 = (void *)MEMORY[0x1E0CB3940];
        v35 = objc_msgSend(v28, "BOOLValue");
        v36 = CFSTR(" [inlined]");
        if (!v35)
          v36 = &stru_1E4DEECB8;
        objc_msgSend(v34, "stringWithFormat:", CFSTR("%p + %llu%@%@"), v47 - v20, v20, v27, v36);
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v37 = v47;
        if (!v47)
          v37 = v20;
        v47 = v37;
        v23 = CFSTR("???");
      }
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("region"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v38)
      {
        v40 = v38;

        v13 = v40;
      }

      v30 = 0;
    }

    v11 = v44;
    v10 = v45;
    v21 = v47;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\t%18p %@"), v13, v21, v23);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (id)formatCallstacks:(id)a3 withImages:(id)a4 macosStyle:(BOOL)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v40;
  const __CFString *v41;
  uint64_t v42;
  uint64_t v43;
  id obj;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  _BOOL4 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v51 = a5;
  v62 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v50 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v7;
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v46)
  {
    v45 = *(_QWORD *)v57;
    LODWORD(v9) = -1;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v57 != v45)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v10);
        v9 = (v9 + 1);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("name"));
        v12 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("queue"));
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v13;
        v49 = v10;
        v47 = (void *)v13;
        v48 = (void *)v12;
        if (v51)
        {
          v15 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("triggered"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = CFSTR(" Crashed");
          if (!v16)
            v17 = &stru_1E4DEECB8;
          v18 = CFSTR(": ");
          if (!(v12 | v14))
            v18 = &stru_1E4DEECB8;
          if (v12)
            v19 = (const __CFString *)v12;
          else
            v19 = &stru_1E4DEECB8;
          v20 = CFSTR(" Dispatch queue: ");
          if (v14)
          {
            v21 = (const __CFString *)v14;
          }
          else
          {
            v20 = &stru_1E4DEECB8;
            v21 = &stru_1E4DEECB8;
          }
          objc_msgSend(v15, "stringWithFormat:", CFSTR("Thread %d%@:%@%@%@%@"), v9, v17, v18, v19, v20, v21);
        }
        else
        {
          if (v12 | v13)
          {
            if (v12)
              v22 = (const __CFString *)v12;
            else
              v22 = &stru_1E4DEECB8;
            v23 = CFSTR(" Dispatch queue: ");
            if (v13)
            {
              v24 = (const __CFString *)v13;
            }
            else
            {
              v23 = &stru_1E4DEECB8;
              v24 = &stru_1E4DEECB8;
            }
            v40 = v23;
            v41 = v24;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Thread %d name:  %@%@%@"), v9, v22);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v25);

          }
          v26 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("triggered"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = CFSTR(" Crashed");
          if (!v16)
            v27 = &stru_1E4DEECB8;
          objc_msgSend(v26, "stringWithFormat:", CFSTR("Thread %d%@:"), v9, v27, v40, v41, v42, v43);
        }
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v28);

        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("frames"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v53;
          v33 = 0xFFFFFFFFLL;
          do
          {
            for (i = 0; i != v31; ++i)
            {
              if (*(_QWORD *)v53 != v32)
                objc_enumerationMutation(v29);
              v35 = (void *)MEMORY[0x1E0CB3940];
              -[OSALegacyXform formatFrame:withImages:macosStyle:](self, "formatFrame:withImages:macosStyle:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i), v50, v51);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "stringWithFormat:", CFSTR("%-3d %@"), v33 + i + 1, v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v37);

            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
            v33 = (v33 + i);
          }
          while (v31);
        }
        objc_msgSend(v8, "addObject:", &stru_1E4DEECB8);

        v10 = v49 + 1;
      }
      while (v49 + 1 != v46);
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    }
    while (v46);
  }

  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (id)formatImages:(id)a3 macosStyle:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  int v23;
  const __CFString *v24;
  void *v25;
  int v26;
  const __CFString *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  __CFString *v35;
  _BOOL4 v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v4 = a4;
  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v40 = (void *)objc_opt_new();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v5;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v41)
  {
    v39 = *(_QWORD *)v45;
    v36 = v4;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v45 != v39)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("uuid"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (!v4)
        {
          objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_1E4DEECB8);
          v10 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v10;
        }
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("base"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "unsignedLongLongValue");
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("size"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v12 + objc_msgSend(v13, "unsignedLongLongValue") - 1;

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name"));
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("arch"));
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("path"));
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v42 = (void *)v16;
        v43 = v11;
        if (v4)
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CFBundleIdentifier"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "length"))
          {
            v20 = v19;

            v15 = v20;
          }
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CFBundleShortVersionString"));
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!-[__CFString length](v21, "length"))
          {

            v21 = CFSTR("*");
          }
          v22 = (void *)MEMORY[0x1E0CB3940];
          if (v15)
          {
            v23 = 0;
            v24 = v15;
          }
          else if (v18)
          {
            -[__CFString lastPathComponent](v18, "lastPathComponent");
            v23 = 1;
            v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v24 = v35;
          }
          else
          {
            v23 = 0;
            v24 = CFSTR("???");
          }
          v28 = CFSTR("???");
          if (v18)
            v28 = v18;
          objc_msgSend(v22, "stringWithFormat:", CFSTR("%18p - %18p %@ (%@) <%@> %@"), v12, v14, v24, v21, v9, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v29);

          if (v23)
          v4 = v36;
LABEL_33:

          goto LABEL_34;
        }
        v25 = (void *)MEMORY[0x1E0CB3940];
        if (v15)
        {
          v26 = 0;
          v27 = v15;
        }
        else if (v17)
        {
          -[__CFString lastPathComponent](v17, "lastPathComponent");
          v26 = 1;
          v38 = objc_claimAutoreleasedReturnValue();
          v27 = (const __CFString *)v38;
        }
        else
        {
          v26 = 0;
          v27 = CFSTR("???");
        }
        v30 = CFSTR("unknown-arch");
        if (v16)
          v30 = (const __CFString *)v16;
        v31 = CFSTR("???");
        if (v18)
          v31 = v18;
        objc_msgSend(v25, "stringWithFormat:", CFSTR("%18p - %18p %@ %@  <%@> %@"), v12, v14, v27, v30, v9, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addObject:", v32);

        v19 = (void *)v38;
        if (v26)
          goto LABEL_33;
LABEL_34:

      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v41);
  }

  objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (id)formatArm32ThreadState:(id)a3 index:(int)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;

  v50 = *(_QWORD *)&a4;
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("r"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("value"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v58, "unsignedIntValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("value"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v56, "unsignedIntValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("value"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v54, "unsignedIntValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 3);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("value"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v52, "unsignedIntValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 4);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("value"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v49, "unsignedIntValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 5);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("value"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v46, "unsignedIntValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 6);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("value"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v43, "unsignedIntValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 7);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("value"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v39, "unsignedIntValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 8);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("value"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v36, "unsignedIntValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("value"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v33, "unsignedIntValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 10);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("value"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v29, "unsignedIntValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 11);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("value"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v26, "unsignedIntValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ip"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("value"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v23, "unsignedIntValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sp"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("value"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v20, "unsignedIntValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lr"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pc"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("value"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cpsr"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("value"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "stringWithFormat:", CFSTR("Thread %d crashed with ARM Thread State (32-bit):\n    r0: 0x%08x    r1: 0x%08x      r2: 0x%08x      r3: 0x%08x\n    r4: 0x%08x    r5: 0x%08x      r6: 0x%08x      r7: 0x%08x\n    r8: 0x%08x    r9: 0x%08x     r10: 0x%08x     r11: 0x%08x\n    ip: 0x%08x    sp: 0x%08x      lr: 0x%08x      pc: 0x%08x\n  cpsr: 0x%08x"), v50, v45, v42, v40, v38, v35, v32, v30, v27, v25, v22, v19, v17, v16, v6, v8,
    v11,
    objc_msgSend(v13, "unsignedIntValue"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)formatArm64ThreadState:(id)a3 index:(int)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;

  v98 = *(_QWORD *)&a4;
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("x"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "objectForKeyedSubscript:", CFSTR("value"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend(v118, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("value"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend(v116, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "objectForKeyedSubscript:", CFSTR("value"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v114, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 3);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("value"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v112, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 4);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "objectForKeyedSubscript:", CFSTR("value"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v110, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 5);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("value"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v108, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 6);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("value"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend(v106, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 7);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("value"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v104, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 8);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("value"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v102, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 9);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("value"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v100, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 10);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("value"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v97, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 11);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("value"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v94, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 12);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("value"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v90, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 13);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("value"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v87, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 14);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("value"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v84, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 15);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("value"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v80, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 16);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("value"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v77, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 17);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("value"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v74, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 18);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("value"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v70, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 19);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("value"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v67, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 20);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("value"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v64, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 21);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("value"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v60, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 22);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("value"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v57, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 23);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("value"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v54, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 24);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("value"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v50, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 25);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("value"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v47, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 26);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("value"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v43, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 27);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("value"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v40, "unsignedLongLongValue");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 28);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("value"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v37, "unsignedLongLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fp"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("value"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v33, "unsignedLongLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lr"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("value"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v30, "unsignedLongLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sp"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("value"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v27, "unsignedLongLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pc"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("value"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v24, "unsignedLongLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cpsr"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("value"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v21, "unsignedIntValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("far"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedLongLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("esr"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("value"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("esr"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("description"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "stringWithFormat:", CFSTR("Thread %d crashed with ARM Thread State (64-bit):\n    x0: 0x%016qx   x1: 0x%016qx   x2: 0x%016qx   x3: 0x%016qx\n    x4: 0x%016qx   x5: 0x%016qx   x6: 0x%016qx   x7: 0x%016qx\n    x8: 0x%016qx   x9: 0x%016qx  x10: 0x%016qx  x11: 0x%016qx\n   x12: 0x%016qx  x13: 0x%016qx  x14: 0x%016qx  x15: 0x%016qx\n   x16: 0x%016qx  x17: 0x%016qx  x18: 0x%016qx  x19: 0x%016qx\n   x20: 0x%016qx  x21: 0x%016qx  x22: 0x%016qx  x23: 0x%016qx\n   x24: 0x%016qx  x25: 0x%016qx  x26: 0x%016qx  x27: 0x%016qx\n   x28: 0x%016qx   fp: 0x%016llx   lr: 0x%016llx\n    sp: 0x%016llx   pc: 0x%016llx cpsr: 0x%08x\n   far: 0x%016llx  esr: 0x%08x %@"), v98, v93, v91, v88, v86, v83, v81, v79, v76, v73, v71, v69, v66, v63, v61, v59,
    v56,
    v53,
    v51,
    v49,
    v46,
    v44,
    v41,
    v39,
    v36,
    v34,
    v31,
    v29,
    v25,
    v23,
    v20,
    v19,
    v18,
    v17,
    v6,
    v9,
    v12,
    v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)formatX86ThreadState:(id)a3 index:(int)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  __CFString *v83;
  void *v84;
  void *v85;

  v80 = *(_QWORD *)&a4;
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rosetta"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v5;
  if (v5)
  {
    v6 = v5;
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tmp0"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("value"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v82, "unsignedLongLongValue");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tmp1"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("value"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedLongLongValue");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tmp2"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("value"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("\n tmp0: 0x%016qx tmp1: 0x%016qx tmp2: 0x%016qx\n"), v9, v12, objc_msgSend(v14, "unsignedLongLongValue"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trap"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("description"));
    v16 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    v85 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cr2"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("value"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v10, "unsignedLongLongValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cpu"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("value"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v13, "intValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("err"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("value"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntValue");
    v74 = v16;
    if (!v16)
      v16 = &stru_1E4DEECB8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trap"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("value"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "stringWithFormat:", CFSTR("  cr2: 0x%016qx\n  \nLogical CPU:     %d\nError Code:      0x%08x %@\nTrap Number:     %d\n"), v78, v76, v18, v16, objc_msgSend(v20, "intValue"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)v74;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rip"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("value"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = v22;
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%016qx"), objc_msgSend(v22, "unsignedLongLongValue"));
    v83 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v83 = CFSTR("<unavailable>     ");
  }
  v65 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rax"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("value"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v75, "unsignedLongLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rbx"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("value"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v72, "unsignedLongLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rcx"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("value"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v70, "unsignedLongLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rdx"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("value"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v68, "unsignedLongLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rdi"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("value"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v66, "unsignedLongLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rsi"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("value"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v63, "unsignedLongLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rbp"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("value"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v60, "unsignedLongLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rsp"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("value"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v56, "unsignedLongLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("r8"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("value"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v53, "unsignedLongLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("r9"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("value"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v50, "unsignedLongLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("r10"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("value"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v46, "unsignedLongLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("r11"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("value"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v43, "unsignedLongLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("r12"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("value"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v40, "unsignedLongLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("r13"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("value"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v36, "unsignedLongLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("r14"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("value"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "unsignedLongLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("r15"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("value"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "unsignedLongLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rflags"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("value"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "stringWithFormat:", CFSTR("Thread %d crashed with X86 Thread State (64-bit):\n  rax: 0x%016qx  rbx: 0x%016qx  rcx: 0x%016qx  rdx: 0x%016qx\n  rdi: 0x%016qx  rsi: 0x%016qx  rbp: 0x%016qx  rsp: 0x%016qx\n   r8: 0x%016qx   r9: 0x%016qx  r10: 0x%016qx  r11: 0x%016qx\n  r12: 0x%016qx  r13: 0x%016qx  r14: 0x%016qx  r15: 0x%016qx\n  rip: %@  rfl: 0x%016qx%@"), v80, v62, v59, v57, v54, v52, v49, v47, v45, v42, v39, v37, v35, v34, v23, v26,
    v29,
    v83,
    objc_msgSend(v31, "unsignedLongLongValue"),
    v84);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)formatLastException:(id)a3 withImages:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    v12 = 0xFFFFFFFFLL;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(obj);
        v14 = (void *)MEMORY[0x1E0CB3940];
        -[OSALegacyXform formatFrame:withImages:macosStyle:](self, "formatFrame:withImages:macosStyle:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13), v7, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%-3d %@"), v12 + v13 + 1, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v16);

        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v12 = (v12 + v13);
    }
    while (v10);
  }

  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)formatLastBranchState:(id)a3 index:(int)a4 withImages:(id)a5
{
  __CFString *v5;
  uint64_t v7;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v28;
  id v29;
  void *v30;
  void *v31;

  v7 = *(_QWORD *)&a4;
  v8 = a3;
  v29 = a5;
  v9 = (void *)objc_opt_new();
  v10 = 0x1E0CB3000uLL;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Thread %d last branch register state:"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v9;
  objc_msgSend(v9, "addObject:", v11);

  if (objc_msgSend(v8, "count"))
  {
    v12 = 0;
    v26 = v8;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = *(void **)(v10 + 2368);
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v15 = objc_claimAutoreleasedReturnValue();
      -[OSALegacyXform formatFrame:withImages:macosStyle:](self, "formatFrame:withImages:macosStyle:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[OSALegacyXform formatFrame:withImages:macosStyle:](self, "formatFrame:withImages:macosStyle:", v17, v29, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v14, "count");
      if (v19)
      {
        v20 = *(void **)(v10 + 2368);
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("(%@)"), v30);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v21 = v5;
      }
      else
      {
        v21 = &stru_1E4DEECB8;
      }
      v22 = (void *)v15;
      objc_msgSend(v31, "stringWithFormat:", CFSTR("  [%02d] (%@) -> (%@)\t%@"), v12, v16, v18, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObject:", v23);

      if (v19)
      {

      }
      ++v12;
      v8 = v26;
      v10 = 0x1E0CB3000;
    }
    while (objc_msgSend(v26, "count") > v12);
  }
  objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_hexDump:(id)a3 offset:(int)a4 indicator:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unsigned int v11;
  unint64_t v12;
  __int128 v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  char __str[4];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _OWORD v24[2];
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v23 = 0u;
  memset(v24, 0, 28);
  v21 = 0u;
  v22 = 0u;
  *(_DWORD *)__str = 0;
  if (objc_msgSend(v7, "count"))
  {
    v9 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "intValue");

      v12 = v9 & 0xF;
      if ((_DWORD)v12 == 9)
      {
        BYTE9(v22) = 45;
      }
      else if ((v9 & 0xF) == 0)
      {
        strcpy((char *)v24 + 15, "    ");
        *(_QWORD *)&v13 = 0x2020202020202020;
        *((_QWORD *)&v13 + 1) = 0x2020202020202020;
        v23 = v13;
        v24[0] = v13;
        v21 = v13;
        v22 = v13;
      }
      if (v11 > 0x7F)
        v14 = __maskrune(v11, 0x40000uLL);
      else
        v14 = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v11 + 60) & 0x40000;
      if (v14)
        v15 = v11;
      else
        v15 = 46;
      snprintf(__str, 4uLL, "%02x%c", v11, v15);
      v16 = (3 * v12);
      *(_WORD *)((char *)&v21 + v16 + 2) = *(_WORD *)__str;
      *(_BYTE *)((v12 | (unint64_t)&v21) + 0x33) = __str[2];
      if (a4 == v9)
      {
        v17 = (char *)&v21 + v16;
        v17[1] = 91;
        v17[4] = 93;
        if (v5)
          __sprintf_chk((char *)&v24[1] + 3, 0, 9uLL, "\t<==");
      }
      if ((_DWORD)v12 == 15 || v9 == objc_msgSend(v7, "count") - 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &v21);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v18);

      }
      ++v9;
    }
    while (objc_msgSend(v7, "count") > v9);
  }

  return v8;
}

- (id)formatInstructionState:(id)a3 index:(int)a4
{
  uint64_t v4;
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
  void *v18;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("instructionStream"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cacheLine"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Thread %d instruction stream:"), v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v10);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bytes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("offset"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OSALegacyXform _hexDump:offset:indicator:](self, "_hexDump:offset:indicator:", v11, objc_msgSend(v12, "intValue"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v13);

    if (v9)
    {
      objc_msgSend(v7, "addObject:", CFSTR("  Cacheline:"));
LABEL_6:
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("bytes"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("offset"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[OSALegacyXform _hexDump:offset:indicator:](self, "_hexDump:offset:indicator:", v15, objc_msgSend(v16, "intValue"), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v17);

    }
  }
  else if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Thread %d instruction stream (single cacheline):"), v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v14);

    goto LABEL_6;
  }
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_getValueForKey:(id)a3 fromBody:(id)a4 orHeader:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(&unk_1E4DFEF18, "containsObject:", v8))
  {
    v11 = v9;
    if (objc_msgSend(v8, "hasPrefix:", CFSTR("metadata:")))
    {
      v16 = v10;

      objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("metadata:"), &stru_1E4DEECB8);
      v17 = objc_claimAutoreleasedReturnValue();

      v11 = v16;
      v8 = (id)v17;
    }
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("."));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v12 = v18;
    v20 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v31;
      v28 = v10;
      v29 = v9;
      while (2)
      {
        v23 = 0;
        v24 = v19 - 1;
        v19 -= v21;
        v25 = v11;
        do
        {
          if (*(_QWORD *)v31 != v22)
            objc_enumerationMutation(v12);
          if (v24 == v23)
            goto LABEL_18;
          objc_msgSend(v25, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v23));
          v11 = (id)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

LABEL_18:
            v11 = v25;
            v10 = v28;
            v9 = v29;
            goto LABEL_19;
          }

          ++v23;
          v25 = v11;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        v10 = v28;
        v9 = v29;
        if (v21)
          continue;
        break;
      }
    }
LABEL_19:

    objc_msgSend(v12, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11;
    v15 = v14;
    goto LABEL_20;
  }
  -[OSALegacyXform _getValueForKey:fromBody:orHeader:](self, "_getValueForKey:fromBody:orHeader:", CFSTR("faultingThread"), v9, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("threads"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", (int)objc_msgSend(v11, "intValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v8;
LABEL_20:
    objc_msgSend(v13, "objectForKeyedSubscript:", v15, v28, v29, (_QWORD)v30);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }
  v26 = 0;
LABEL_21:

  return v26;
}

- (BOOL)transformJSON:(id)a3 header:(id)a4 error:(id *)a5 streamingBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("bug_type"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_templates, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_new();
  if (v14)
  {
    v16 = -[OSALegacyXform transformLines:withDefinitions:body:header:error:streamingBlock:](self, "transformLines:withDefinitions:body:header:error:streamingBlock:", v14, v15, v10, v11, a5, v12);
  }
  else
  {
    if (a5)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@' template not found"), v13, *MEMORY[0x1E0CB2D50]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("OSALegacyXform"), 1, v19);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v16 = 0;
  }

  return v16;
}

- (BOOL)transformLines:(id)a3 withDefinitions:(id)a4 body:(id)a5 header:(id)a6 error:(id *)a7 streamingBlock:(id)a8
{
  id v12;
  void *v13;
  void *v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  id v28;
  uint64_t v29;
  int v30;
  int v31;
  uint64_t v32;
  void *v33;
  int v34;
  int v35;
  BOOL v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  void *v41;
  BOOL v42;
  void *v43;
  void *v44;
  BOOL v46;
  id v48;
  char v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id obj;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  id v58;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  OSALegacyXform *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  uint64_t *v69;
  char v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  uint64_t v84;
  const __CFString *v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v53 = a4;
  v60 = a5;
  v58 = a6;
  v52 = a8;
  v83 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\$\\((([^\\)\"]+|\"[^\"]+\")+)\\)"), 0, &v83);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v83;
  -[OSALegacyXform _getValueForKey:fromBody:orHeader:](self, "_getValueForKey:fromBody:orHeader:", CFSTR("osVersion.train"), v60, v58);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v13, "hasPrefix:", CFSTR("macOS"));

  -[OSALegacyXform _getValueForKey:fromBody:orHeader:](self, "_getValueForKey:fromBody:orHeader:", CFSTR("faultingThread"), v60, 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = v12;
  v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
  v46 = v56 == 0;
  if (v56)
  {
    v57 = 0;
    v14 = 0;
    v55 = *(_QWORD *)v80;
    while (1)
    {
      for (i = 0; i != v56; ++i)
      {
        if (*(_QWORD *)v80 != v55)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        if (v14)
        {
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * i), "hasPrefix:", CFSTR(")#")))
          {
            objc_msgSend(v57, "addObject:", v16);
            continue;
          }
          objc_msgSend(v53, "setObject:forKeyedSubscript:", v57, v14);

          v57 = 0;
        }
        else
        {
          if (objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * i), "hasPrefix:", CFSTR("#(")))
          {
            objc_msgSend(v16, "substringFromIndex:", 2);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_opt_new();

            v57 = (void *)v17;
            continue;
          }
          v75 = 0;
          v76 = &v75;
          v77 = 0x2020000000;
          v78 = 0;
          v18 = objc_msgSend(v16, "rangeOfString:options:", CFSTR("\\^\\([^\\)]+\\)"), 1040);
          v20 = v18;
          if (v18 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v21 = v19;
            objc_msgSend(v16, "substringWithRange:", v18 + 2, v19 - 3);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "componentsSeparatedByString:", CFSTR("&"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v76[3] = v21 + v20;
            v71 = 0u;
            v72 = 0u;
            v73 = 0u;
            v74 = 0u;
            v24 = v23;
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v71, v86, 16);
            if (v25)
            {
              v26 = *(_QWORD *)v72;
              while (2)
              {
                for (j = 0; j != v25; ++j)
                {
                  if (*(_QWORD *)v72 != v26)
                    objc_enumerationMutation(v24);
                  v28 = *(id *)(*((_QWORD *)&v71 + 1) + 8 * j);
                  if (objc_msgSend(v28, "hasPrefix:", CFSTR("!")))
                  {
                    objc_msgSend(v28, "substringFromIndex:", 1);
                    v29 = objc_claimAutoreleasedReturnValue();

                    v30 = 1;
                    v28 = (id)v29;
                  }
                  else
                  {
                    v30 = 0;
                  }
                  v31 = objc_msgSend(v28, "hasPrefix:", CFSTR("*"));
                  if (v31)
                  {
                    objc_msgSend(v28, "substringFromIndex:", 1);
                    v32 = objc_claimAutoreleasedReturnValue();

                    v28 = (id)v32;
                  }
                  -[OSALegacyXform _getValueForKey:fromBody:orHeader:](self, "_getValueForKey:fromBody:orHeader:", v28, v60, v58);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = v33 != 0;
                  if (v33)
                    v35 = v31;
                  else
                    v35 = 0;
                  if (v35 == 1)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      v34 = objc_msgSend(v33, "count") != 0;
                    else
                      v34 = objc_msgSend(v33, "BOOLValue");
                  }
                  v36 = v30 == v34;

                  if (v36)
                  {
                    v41 = v24;
                    goto LABEL_39;
                  }
                }
                v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v71, v86, 16);
                if (v25)
                  continue;
                break;
              }
            }

          }
          objc_msgSend(v16, "substringFromIndex:", v76[3]);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v76[3] = 0;
          v38 = objc_msgSend(v37, "length");
          v61[0] = MEMORY[0x1E0C809B0];
          v61[1] = 3221225472;
          v61[2] = __82__OSALegacyXform_transformLines_withDefinitions_body_header_error_streamingBlock___block_invoke;
          v61[3] = &unk_1E4DEE690;
          v39 = v52;
          v68 = v39;
          v40 = v37;
          v62 = v40;
          v69 = &v75;
          v63 = v53;
          v64 = self;
          v65 = v60;
          v66 = v58;
          v70 = v49;
          v67 = v50;
          objc_msgSend(v51, "enumerateMatchesInString:options:range:usingBlock:", v40, 0, 0, v38, v61);
          objc_msgSend(v40, "substringFromIndex:", v76[3]);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v41, "length"))
            (*((void (**)(id, void *))v52 + 2))(v39, v41);
          (*((void (**)(id, const __CFString *))v52 + 2))(v39, CFSTR("\n"));

          v24 = v68;
LABEL_39:

          _Block_object_dispose(&v75, 8);
        }
        v14 = 0;
      }
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
      if (!v56)
      {

        v42 = v14 == 0;
        if (a7 && v14)
        {
          v43 = (void *)MEMORY[0x1E0CB35C8];
          v84 = *MEMORY[0x1E0CB2D50];
          v85 = CFSTR("template has illformed definition");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "errorWithDomain:code:userInfo:", CFSTR("OSALegacyXform"), 2, v44);
          *a7 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_47;
        }
        goto LABEL_48;
      }
    }
  }
  v14 = 0;
  v57 = 0;
  v44 = obj;
LABEL_47:

  v42 = v46;
LABEL_48:

  return v42;
}

void __82__OSALegacyXform_transformLines_withDefinitions_body_header_error_streamingBlock___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  char isKindOfClass;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t k;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  id obj;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  id v80;
  _QWORD *v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  _QWORD v102[2];
  _QWORD v103[2];
  _BYTE v104[128];
  _QWORD v105[2];
  _QWORD v106[2];
  _BYTE v107[128];
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "rangeAtIndex:", 0);
  v6 = v5;
  v72 = v3;
  v7 = objc_msgSend(v3, "rangeAtIndex:", 1);
  v9 = v8;
  v10 = a1[10];
  v11 = *(_QWORD *)(*(_QWORD *)(a1[11] + 8) + 24);
  objc_msgSend((id)a1[4], "substringWithRange:", v11, v4 - v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);

  v69 = v9;
  v70 = v7;
  objc_msgSend((id)a1[4], "substringWithRange:", v7, v9);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "componentsSeparatedByString:", CFSTR("|"));
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v108, 16);
  if (!v13)
    goto LABEL_79;
  v14 = v13;
  v15 = *(_QWORD *)v98;
  v81 = a1;
  v74 = *(_QWORD *)v98;
  while (2)
  {
    v16 = 0;
    v73 = v14;
    do
    {
      if (*(_QWORD *)v98 != v15)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v16);
      objc_msgSend(v17, "componentsSeparatedByString:", CFSTR("#"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v16;
      if (objc_msgSend(v18, "count") == 2)
      {
        v19 = (void *)a1[5];
        objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
          goto LABEL_78;
        v22 = (void *)a1[6];
        objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_getValueForKey:fromBody:orHeader:", v23, a1[7], a1[8]);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v76 = v24;
          v77 = v18;
          v95 = 0u;
          v96 = 0u;
          v93 = 0u;
          v94 = 0u;
          v80 = v24;
          v25 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v93, v107, 16);
          if (v25)
          {
            v26 = v25;
            v27 = 0;
            v28 = *(_QWORD *)v94;
            do
            {
              for (i = 0; i != v26; ++i)
              {
                if (*(_QWORD *)v94 != v28)
                  objc_enumerationMutation(v80);
                v30 = *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * i);
                v31 = v81[5];
                v32 = (void *)v81[6];
                v105[0] = CFSTR("<index>");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27 + i);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v105[1] = CFSTR("<item>");
                v106[0] = v33;
                v106[1] = v30;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 2);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v92 = 0;
                objc_msgSend(v32, "transformLines:withDefinitions:body:header:error:streamingBlock:", v21, v31, v34, 0, &v92, v81[10]);
                v35 = v92;

              }
              v26 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v93, v107, 16);
              v27 = (v27 + i);
            }
            while (v26);
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_31:

            v6 = objc_msgSend((id)a1[4], "length");
            v4 = 0;
            v15 = v74;
            goto LABEL_32;
          }
          v76 = v24;
          v77 = v18;
          v90 = 0u;
          v91 = 0u;
          v88 = 0u;
          v89 = 0u;
          v38 = v24;
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v88, v104, 16);
          if (v39)
          {
            v40 = v39;
            v41 = *(_QWORD *)v89;
            do
            {
              for (j = 0; j != v40; ++j)
              {
                if (*(_QWORD *)v89 != v41)
                  objc_enumerationMutation(v38);
                v44 = v81[5];
                v43 = (void *)v81[6];
                v103[0] = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * j);
                v102[0] = CFSTR("<key>");
                v102[1] = CFSTR("<value>");
                objc_msgSend(v38, "objectForKeyedSubscript:");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v103[1] = v45;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 2);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v87 = 0;
                objc_msgSend(v43, "transformLines:withDefinitions:body:header:error:streamingBlock:", v21, v44, v46, 0, &v87, v81[10]);
                v47 = v87;

              }
              v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v88, v104, 16);
            }
            while (v40);
          }
        }
        v24 = v76;

        v18 = v77;
        v14 = v73;
        a1 = v81;
        goto LABEL_31;
      }
      if ((objc_msgSend(v17, "hasPrefix:", CFSTR("\")) & 1) == 0)
      {
        objc_msgSend((id)a1[6], "_getValueForKey:fromBody:orHeader:", v17, a1[7], a1[8]);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v37)
          goto LABEL_32;
LABEL_35:
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("threads")))
        {
          v48 = (void *)a1[6];
          objc_msgSend((id)a1[7], "objectForKeyedSubscript:", CFSTR("usedImages"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "formatCallstacks:withImages:macosStyle:", v37, v49, *((unsigned __int8 *)a1 + 96));
          v50 = objc_claimAutoreleasedReturnValue();
LABEL_37:
          v51 = (void *)v50;

          goto LABEL_52;
        }
        if (!objc_msgSend(v17, "isEqualToString:", CFSTR("threadState")))
        {
          if (objc_msgSend(v17, "isEqualToString:", CFSTR("instructionState")))
          {
            objc_msgSend((id)a1[6], "formatInstructionState:index:", v37, objc_msgSend((id)a1[9], "intValue"));
            v54 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (objc_msgSend(v17, "isEqualToString:", CFSTR("lastBranchState")))
            {
              v55 = (void *)a1[6];
              v56 = objc_msgSend((id)a1[9], "intValue");
              objc_msgSend((id)a1[7], "objectForKeyedSubscript:", CFSTR("usedImages"));
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "formatLastBranchState:index:withImages:", v37, v56, v49);
              v50 = objc_claimAutoreleasedReturnValue();
              goto LABEL_37;
            }
            if (objc_msgSend(v17, "isEqualToString:", CFSTR("lastExceptionBacktrace")))
            {
              v58 = (void *)a1[6];
              objc_msgSend((id)a1[7], "objectForKeyedSubscript:", CFSTR("usedImages"));
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "formatLastException:withImages:", v37, v49);
              v50 = objc_claimAutoreleasedReturnValue();
              goto LABEL_37;
            }
            if (objc_msgSend(v17, "hasPrefix:", CFSTR("usedImages")))
            {
              objc_msgSend((id)a1[6], "formatImages:macosStyle:", v37, *((unsigned __int8 *)a1 + 96));
              v54 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                (*(void (**)(void))(a1[10] + 16))();
LABEL_77:

LABEL_78:
                goto LABEL_79;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v37, "stringValue");
                v54 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v57 = a1[10];
                  goto LABEL_75;
                }
                if (objc_msgSend(v37, "count"))
                {
                  objc_msgSend(v37, "firstObject");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  isKindOfClass = objc_opt_isKindOfClass();

                  if ((isKindOfClass & 1) != 0)
                  {
                    v78 = v18;
                    v61 = (void *)objc_opt_new();
                    v83 = 0u;
                    v84 = 0u;
                    v85 = 0u;
                    v86 = 0u;
                    v82 = v37;
                    v62 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v83, v101, 16);
                    if (v62)
                    {
                      v63 = v62;
                      v64 = *(_QWORD *)v84;
                      do
                      {
                        for (k = 0; k != v63; ++k)
                        {
                          if (*(_QWORD *)v84 != v64)
                            objc_enumerationMutation(v82);
                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%016qx"), objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * k), "longLongValue"));
                          v66 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v61, "addObject:", v66);

                        }
                        v63 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v83, v101, 16);
                      }
                      while (v63);
                    }

                    objc_msgSend(v61, "componentsJoinedByString:", CFSTR(", "));
                    v51 = (void *)objc_claimAutoreleasedReturnValue();

                    v18 = v78;
LABEL_52:
                    v57 = a1[10];
                    if (v51)
                    {
                      (*(void (**)(_QWORD, void *))(v57 + 16))(a1[10], v51);
LABEL_76:

                      goto LABEL_77;
                    }
LABEL_75:
                    v67 = (void *)MEMORY[0x1E0CB3940];
                    objc_msgSend((id)a1[4], "substringWithRange:", v70, v69);
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v67, "stringWithFormat:", CFSTR("{%@}"), v51);
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    (*(void (**)(uint64_t, void *))(v57 + 16))(v57, v68);

                    goto LABEL_76;
                  }
                }
                objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
                v54 = objc_claimAutoreleasedReturnValue();
              }
            }
          }
          v51 = (void *)v54;
          goto LABEL_52;
        }
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("flavor"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v52, "isEqualToString:", CFSTR("ARM_THREAD_STATE64")))
        {
          objc_msgSend((id)a1[6], "formatArm64ThreadState:index:", v37, objc_msgSend((id)a1[9], "intValue"));
          v53 = objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v52, "isEqualToString:", CFSTR("ARM_THREAD_STATE32")))
        {
          objc_msgSend((id)a1[6], "formatArm32ThreadState:index:", v37, objc_msgSend((id)a1[9], "intValue"));
          v53 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!objc_msgSend(v52, "isEqualToString:", CFSTR("x86_THREAD_STATE")))
          {
            v51 = 0;
            goto LABEL_51;
          }
          objc_msgSend((id)a1[6], "formatX86ThreadState:index:", v37, objc_msgSend((id)a1[9], "intValue"));
          v53 = objc_claimAutoreleasedReturnValue();
        }
        v51 = (void *)v53;
LABEL_51:

        goto LABEL_52;
      }
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("\"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
        goto LABEL_35;
LABEL_32:

      v16 = v79 + 1;
    }
    while (v79 + 1 != v14);
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v108, 16);
    if (v14)
      continue;
    break;
  }
LABEL_79:

  *(_QWORD *)(*(_QWORD *)(a1[11] + 8) + 24) = v4 + v6;
}

+ (id)rollSchemaForward:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  uint64_t v40;
  void *v41;
  int v42;
  int v43;
  id v45;
  void *v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id obj;
  uint64_t v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  void *v78;
  uint64_t v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
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
  _QWORD v105[4];
  id v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _BYTE v118[128];
  const __CFString *v119;
  uint64_t v120;
  _BYTE v121[128];
  const __CFString *v122;
  void *v123;
  _BYTE v124[128];
  _QWORD v125[2];
  _QWORD v126[2];
  _BYTE v127[128];
  _BYTE v128[128];
  const __CFString *v129;
  void *v130;
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^([A-Z_]+), (\\[0x[0-9a-zA-Z]\\])?(.*)$"), 0, 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (id)objc_opt_new();
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  obj = v3;
  v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v131, 16);
  if (v67)
  {
    v65 = *(_QWORD *)v115;
    do
    {
      v69 = 0;
      do
      {
        if (*(_QWORD *)v115 != v65)
          objc_enumerationMutation(obj);
        v71 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * v69);
        objc_msgSend(obj, "objectForKeyedSubscript:");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v71, "isEqualToString:", CFSTR("asi")))
        {
          if (objc_msgSend(v71, "isEqualToString:", CFSTR("termination")))
          {
            v73 = v70;
            v4 = (void *)objc_opt_new();
            objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("namespace"));
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("namespace"));

            objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("code"));
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("code"));

            objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("flag"));
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("flag"));

            objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("signal"));
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            if (v8)
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("indicator"));
            objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("description"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            if (v9
              || (objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("reason")),
                  (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              v108 = 0;
              v109 = &v108;
              v110 = 0x3032000000;
              v111 = __Block_byref_object_copy__7;
              v112 = __Block_byref_object_dispose__7;
              v113 = 0;
              v10 = objc_msgSend(v9, "length");
              v105[0] = MEMORY[0x1E0C809B0];
              v105[1] = 3221225472;
              v105[2] = __36__OSALegacyXform_rollSchemaForward___block_invoke;
              v105[3] = &unk_1E4DEE6E0;
              v107 = &v108;
              v11 = v9;
              v106 = v11;
              objc_msgSend(v61, "enumerateMatchesInString:options:range:usingBlock:", v11, 0, 0, v10, v105);
              if (v109[5])
                v12 = (void *)v109[5];
              else
                v12 = v11;
              objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("|"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "valueForKey:", CFSTR("stringByTrimming"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("reasons"));

              _Block_object_dispose(&v108, 8);
            }
            objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("details"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (v15)
            {
              objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("|"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "valueForKey:", CFSTR("stringByTrimming"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("details"));

            }
            objc_msgSend(v64, "setObject:forKeyedSubscript:", v4, v71);

LABEL_23:
            goto LABEL_24;
          }
          if (objc_msgSend(v71, "isEqualToString:", CFSTR("legacyInfo")))
          {
            objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("threadTriggered"));
            v73 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("index"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "setObject:forKeyedSubscript:", v19, CFSTR("faultingThread"));

            objc_msgSend(v64, "setObject:forKeyedSubscript:", v70, v71);
            goto LABEL_23;
          }
          if (!objc_msgSend(v71, "isEqualToString:", CFSTR("threads")))
          {
            if (objc_msgSend(v71, "isEqualToString:", CFSTR("usedImages")))
            {
              v45 = v70;
              v84 = (void *)objc_opt_new();
              objc_msgSend(obj, "objectForKeyedSubscript:", CFSTR("legacyInfo"));
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("imageExtraInfo"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v87 = 0u;
              v88 = 0u;
              v85 = 0u;
              v86 = 0u;
              v73 = v45;
              v47 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v85, v118, 16);
              if (v47)
              {
                v48 = 0;
                v49 = *(_QWORD *)v86;
                do
                {
                  v50 = 0;
                  v51 = v48;
                  do
                  {
                    if (*(_QWORD *)v86 != v49)
                      objc_enumerationMutation(v73);
                    v52 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v50);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v46, "objectAtIndexedSubscript:", v51 + v50);
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      v54 = (void *)objc_msgSend(v53, "mutableCopy");

                      objc_msgSend(v52, "objectAtIndexedSubscript:", 0);
                      v55 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v54, "setObject:forKeyedSubscript:", v55, CFSTR("uuid"));

                      objc_msgSend(v52, "objectAtIndexedSubscript:", 1);
                      v56 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v54, "setObject:forKeyedSubscript:", v56, CFSTR("base"));

                      objc_msgSend(v52, "objectAtIndexedSubscript:", 2);
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v54, "setObject:forKeyedSubscript:", v57, CFSTR("source"));

                      objc_msgSend(v84, "addObject:", v54);
                    }
                    ++v50;
                  }
                  while (v47 != v50);
                  v47 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v85, v118, 16);
                  v48 = v51 + v50;
                }
                while (v47);
              }

              objc_msgSend(v64, "setObject:forKeyedSubscript:", v84, v71);
            }
            else
            {
              objc_msgSend(&unk_1E4DFEDF0, "objectForKeyedSubscript:", v71);
              v73 = (id)objc_claimAutoreleasedReturnValue();
              if (v73)
                objc_msgSend(v64, "setObject:forKeyedSubscript:", v70);
              else
                objc_msgSend(v64, "setObject:forKeyedSubscript:", v70, v71);
            }
            goto LABEL_23;
          }
          v73 = (id)objc_opt_new();
          v20 = v70;
          v101 = 0u;
          v102 = 0u;
          v103 = 0u;
          v104 = 0u;
          v60 = v20;
          v63 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v101, v128, 16);
          if (!v63)
            goto LABEL_74;
          v62 = *(_QWORD *)v102;
LABEL_29:
          v66 = 0;
          while (1)
          {
            if (*(_QWORD *)v102 != v62)
              objc_enumerationMutation(v60);
            v78 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * v66);
            v81 = (void *)objc_msgSend(v78, "mutableCopy");
            v83 = (void *)objc_opt_new();
            objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("frames"));
            v80 = (id)objc_claimAutoreleasedReturnValue();
            v99 = 0u;
            v100 = 0u;
            v97 = 0u;
            v98 = 0u;
            v21 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v97, v127, 16);
            if (v21)
            {
              v22 = *(_QWORD *)v98;
              do
              {
                for (i = 0; i != v21; ++i)
                {
                  if (*(_QWORD *)v98 != v22)
                    objc_enumerationMutation(v80);
                  v24 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v25 = v24;
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v125[0] = CFSTR("imageIndex");
                      objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      v126[0] = v26;
                      v125[1] = CFSTR("imageOffset");
                      objc_msgSend(v24, "objectAtIndexedSubscript:", 1);
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      v126[1] = v27;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v126, v125, 2);
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      v25 = (id)objc_msgSend(v28, "mutableCopy");

                      if ((unint64_t)objc_msgSend(v24, "count") >= 3)
                      {
                        objc_msgSend(v24, "objectAtIndexedSubscript:", 2);
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v25, "addEntriesFromDictionary:", v29);

                      }
                    }
                    else
                    {
                      v25 = 0;
                    }
                  }
                  objc_msgSend(v83, "addObject:", v25);
                  objc_msgSend(v81, "setObject:forKeyedSubscript:", v83, CFSTR("frames"));

                }
                v21 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v97, v127, 16);
              }
              while (v21);
            }
            objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("triggered"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "BOOLValue");

            if (v31)
            {
              objc_msgSend(obj, "objectForKeyedSubscript:", CFSTR("threadState"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if (v32)
                break;
              objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("threadState"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if (v32)
                break;
            }
LABEL_72:
            objc_msgSend(v73, "addObject:", v81);

            if (++v66 == v63)
            {
              v63 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v101, v128, 16);
              if (!v63)
              {
LABEL_74:
                objc_msgSend(v64, "setObject:forKeyedSubscript:", v73, v71);

                goto LABEL_23;
              }
              goto LABEL_29;
            }
          }
          v74 = (void *)objc_msgSend(v32, "mutableCopy");
          v95 = 0u;
          v96 = 0u;
          v93 = 0u;
          v94 = 0u;
          v77 = v32;
          v76 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v93, v124, 16);
          if (!v76)
            goto LABEL_71;
          v75 = *(_QWORD *)v94;
          while (2)
          {
            v33 = 0;
LABEL_51:
            if (*(_QWORD *)v94 != v75)
              objc_enumerationMutation(v77);
            v79 = *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * v33);
            objc_msgSend(v77, "objectForKeyedSubscript:");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v122 = CFSTR("value");
              v123 = v34;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v123, &v122, 1);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_55;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v35 = (void *)objc_opt_new();
              v91 = 0u;
              v92 = 0u;
              v89 = 0u;
              v90 = 0u;
              v36 = v34;
              v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v89, v121, 16);
              if (v37)
              {
                v38 = *(_QWORD *)v90;
                do
                {
                  for (j = 0; j != v37; ++j)
                  {
                    if (*(_QWORD *)v90 != v38)
                      objc_enumerationMutation(v36);
                    v40 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * j);
                    v119 = CFSTR("value");
                    v120 = v40;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "addObject:", v41);

                  }
                  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v89, v121, 16);
                }
                while (v37);
              }

              v42 = objc_msgSend(v35, "count");
              if (v42 <= 28)
              {
                v43 = v42 - 29;
                do
                  objc_msgSend(v35, "addObject:", &unk_1E4DFEDC8);
                while (!__CFADD__(v43++, 1));
              }
LABEL_55:
              objc_msgSend(v74, "setObject:forKeyedSubscript:", v35, v79);

            }
            if (++v33 == v76)
            {
              v76 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v93, v124, 16);
              if (!v76)
              {
LABEL_71:

                objc_msgSend(v81, "setObject:forKeyedSubscript:", v74, CFSTR("threadState"));
                goto LABEL_72;
              }
              continue;
            }
            goto LABEL_51;
          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v129 = CFSTR("unknown");
          v130 = v70;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1);
          v72 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "setObject:forKeyedSubscript:", v72, v71);

        }
LABEL_24:

        ++v69;
      }
      while (v69 != v67);
      v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v131, 16);
      v67 = v58;
    }
    while (v58);
  }

  return v64;
}

void __36__OSALegacyXform_rollSchemaForward___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = objc_msgSend(a2, "rangeAtIndex:", 3);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v3, v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

+ (id)transformURL:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  OSALog *v8;
  void *v9;
  OSALog *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  int v52;
  const __CFString *v53;
  char **v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  void *v59;
  id v60;
  _BOOL4 v61;
  id v62;
  id v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  __CFString *v76;
  id v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  id v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  OSALegacyXform *v98;
  void *v99;
  id v100;
  void *v101;
  uint64_t v102;
  void *v103;
  id v104;
  void *v105;
  id v106;
  id v107;
  _QWORD v108[4];
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  uint64_t v114;
  const __CFString *v115;
  uint64_t v116;
  const __CFString *v117;
  uint64_t v118;
  const __CFString *v119;
  uint8_t buf[1032];
  uint64_t v121;
  _QWORD v122[4];

  v122[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = [OSALog alloc];
  objc_msgSend(v5, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = 0;
  v10 = -[OSALog initWithPath:forRouting:options:error:](v8, "initWithPath:forRouting:options:error:", v9, &stru_1E4DEECB8, &unk_1E4DFEE18, &v113);
  v11 = v113;

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to load log '%@'"), v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "augmentWithPrefix:", v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_89;
  }
  v105 = v6;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:", fileno(-[OSALog stream](v10, "stream")));
  v13 = MEMORY[0x1A85A7DE8](-[OSALog stream](v10, "stream"));
  -[OSALog metaData](v10, "metaData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (!v15)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v13;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "ips metadata not detected (%ld bytes before newline), attempting to read entire file as payload", buf, 0xCu);
    }
    v13 = 0;
  }
  objc_msgSend(v12, "seekToFileOffset:", v13);
  objc_msgSend(v12, "availableData");
  v16 = objc_claimAutoreleasedReturnValue();
  v112 = v11;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v16, 0, &v112);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v112;

  if (v17)
  {
    v102 = v16;
    v103 = v18;
    -[OSALog bugType](v10, "bugType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[OSALog metaData](v10, "metaData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[OSALog metaData](v10, "metaData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (v22)
    {
      v23 = v20;
    }
    else
    {
      v25 = (void *)objc_opt_new();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("bug_type"));
      v26 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, CFSTR("bug_type"));
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("isSimulated"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v27, CFSTR("isSimulated"));

      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("isCorpse"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v28, CFSTR("isCorpse"));

      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("incident_id"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v29, CFSTR("incident_id"));

      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("os_version"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v30, CFSTR("os_version"));

      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("platform"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v31, CFSTR("platform"));

      v23 = v25;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v32 = objc_msgSend(v23, "count");
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v32;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "synthesizing %d items from payload as metadata", buf, 8u);
      }
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("parsedData"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "this log appears to be from the DA grid, using parsedData section", buf, 2u);
        }
        v34 = v33;

        v17 = v34;
      }

      v19 = (void *)v26;
    }
    if (objc_msgSend(&unk_1E4DFEF30, "containsObject:", v19))
    {
      v99 = v7;
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("version"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = v23;
      if ((int)objc_msgSend(v35, "intValue") >= 2)
      {

        goto LABEL_28;
      }
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("variantVersion"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "intValue");

      if (v37 > 1)
      {
        v23 = v100;
        goto LABEL_28;
      }
      +[OSALegacyXform rollSchemaForward:](OSALegacyXform, "rollSchemaForward:", v17);
      v41 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v41;
      v23 = v100;
      if (v41)
      {
LABEL_28:
        v98 = objc_alloc_init(OSALegacyXform);
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("os_version"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v42, "hasPrefix:", CFSTR("macOS")))
        {
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("platform"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (v43)
          {
            objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("platform"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v44, "intValue") == 1)
            {
              v45 = 1;
            }
            else
            {
              objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("platform"));
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v96, "intValue") == 6)
              {
                v45 = 1;
              }
              else
              {
                objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("platform"));
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = objc_msgSend(v47, "intValue") == 10;

                v23 = v100;
              }

            }
          }
          else
          {
            v45 = 1;
          }

        }
        else
        {
          v45 = 0;
        }

        objc_msgSend(v105, "objectForKeyedSubscript:", OSATransformOptionMetadata);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = 0x1E0CB3000;
        if (!v48)
        {
          if (v45)
          {
LABEL_55:
            v54 = &legacyTemplate_9;
LABEL_56:
            v16 = v102;
            v40 = v98;
            objc_msgSend(*(id *)(v49 + 2368), "stringWithUTF8String:", *v54);
            v57 = objc_claimAutoreleasedReturnValue();
            v7 = v99;
            v97 = (void *)v57;
            if (!v57)
            {
              objc_msgSend(v103, "augmentWithPrefix:", CFSTR("Unable to locate template"));
              v71 = objc_claimAutoreleasedReturnValue();
              v72 = v103;
              v24 = (void *)v71;
LABEL_86:

              goto LABEL_87;
            }
            v111 = v103;
            v95 = v19;
            -[OSALegacyXform prepareTemplate:forLogType:error:](v98, "prepareTemplate:forLogType:error:", v57, v19, &v111);
            v58 = v111;

            v59 = (void *)objc_opt_new();
            v110 = v58;
            v108[0] = MEMORY[0x1E0C809B0];
            v108[1] = 3221225472;
            v108[2] = __39__OSALegacyXform_transformURL_options___block_invoke;
            v108[3] = &unk_1E4DEE708;
            v60 = v59;
            v109 = v60;
            v61 = -[OSALegacyXform transformJSON:header:error:streamingBlock:](v98, "transformJSON:header:error:streamingBlock:", v17, v23, &v110, v108);
            v62 = v110;

            v104 = v60;
            if (!v61)
            {
              objc_msgSend(v62, "augmentWithPrefix:", CFSTR("Unable to transform log"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_84;
            }
            v94 = v5;
            v63 = v60;
            objc_msgSend(v105, "objectForKeyedSubscript:", OSATransformOptionSymbolicate);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = objc_msgSend(v64, "BOOLValue");

            if (!v65)
            {
              v24 = v62;
              v23 = v100;
LABEL_70:
              objc_msgSend(v105, "objectForKeyedSubscript:", OSATransformOptionFullReport);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v75 = objc_msgSend(v74, "BOOLValue");

              if (v75)
              {
                v107 = 0;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v94, 4, &v107);
                v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v77 = v107;
                if (!v76)
                {
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                    +[OSALegacyXform transformURL:options:].cold.2(v77);
                  v76 = CFSTR("Unable to load full report.");
                }
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@\n%@\n"), CFSTR("-------------------------------------\nTranslated Report (Full Report Below)\n-------------------------------------\n"), v63, CFSTR("-----------\nFull Report\n-----------\n"), v76);
                v101 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v101 = v63;
              }
              objc_msgSend(v105, "objectForKeyedSubscript:", OSATransformOptionPersist);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v5 = v94;
              if (objc_msgSend(v78, "BOOLValue"))
              {
                v79 = objc_msgSend(v101, "length");

                if (v79)
                {
                  memcpy(buf, "/tmp/temp.XXXXXX", 0x400uLL);
                  v80 = mkstemp((char *)buf);
                  if ((_DWORD)v80 == -1)
                  {
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                      +[OSALegacyXform transformURL:options:].cold.1();
                    v88 = (void *)MEMORY[0x1E0CB35C8];
                    v118 = *MEMORY[0x1E0CB2D50];
                    v119 = CFSTR("Error creating temporary file for symbolicated log");
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1);
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v88, "errorWithDomain:code:userInfo:", CFSTR("OSALegacyXform"), 8, v81);
                    v84 = objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v80, 1);
                    objc_msgSend(v101, "dataUsingEncoding:", 4);
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    v106 = 0;
                    objc_msgSend(v81, "writeData:error:", v82, &v106);
                    v83 = v106;

                    if (v83)
                    {
                      objc_msgSend(v83, "augmentWithPrefix:", CFSTR("failed to persist symbolicated log"));
                      v84 = objc_claimAutoreleasedReturnValue();
                      v24 = v83;
                    }
                    else
                    {
                      v89 = (void *)MEMORY[0x1E0C99E98];
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buf);
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v89, "fileURLWithPath:", v24);
                      v90 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v7, "setObject:forKeyedSubscript:", v90, OSATransformResultFileURL);

                      v84 = 0;
                    }
                  }
                  v40 = v98;

                  v24 = (void *)v84;
                  v62 = v101;
                  goto LABEL_85;
                }
              }
              else
              {

              }
              v62 = v101;
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v101, OSATransformResultReport);
LABEL_84:
              v40 = v98;
LABEL_85:

              v16 = v102;
              v72 = v104;
              v19 = v95;
              goto LABEL_86;
            }
            v93 = v63;
            objc_msgSend(v63, "dataUsingEncoding:", 4);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            symbolicateSpeedTracer(v92, v105);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v91 = v66;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v66, "objectForKeyedSubscript:", OSATransformResultRadars);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v99, "setObject:forKeyedSubscript:", v67, OSATransformResultRadars);

              objc_msgSend(v66, "objectForKeyedSubscript:", OSATransformResultTracerURL);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              v7 = v99;
              objc_msgSend(v99, "setObject:forKeyedSubscript:", v68, OSATransformResultTracerURL);

              objc_msgSend(v66, "objectForKeyedSubscript:", OSATransformResultError);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v66, "objectForKeyedSubscript:", OSATransformResultReport);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = v69;
              v23 = v100;
              if (!v69)
              {
LABEL_69:
                v63 = v93;

                goto LABEL_70;
              }
              v70 = v69;
              v62 = v93;
              v93 = v70;
            }
            else
            {
              v73 = (void *)MEMORY[0x1E0CB35C8];
              v121 = *MEMORY[0x1E0CB2D50];
              v122[0] = CFSTR("No speedtracer results");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v122, &v121, 1);
              v70 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "errorWithDomain:code:userInfo:", CFSTR("OSALegacyTransform"), 1, v70);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v7 = v99;
              v23 = v100;
            }

            goto LABEL_69;
          }
LABEL_47:
          v54 = &legacyTemplate_109;
          goto LABEL_56;
        }
        v50 = (void *)objc_msgSend(v23, "mutableCopy");
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("308"), CFSTR("309"), CFSTR("409"), CFSTR("509"), 0);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "containsObject:", v19);

        if (v52)
        {
          if (v45)
            v53 = CFSTR("9");
          else
            v53 = CFSTR("109");
        }
        else
        {
          if ((objc_msgSend(v19, "isEqualToString:", CFSTR("385")) & 1) == 0)
          {
            v23 = v100;
            if (!objc_msgSend(v19, "isEqualToString:", CFSTR("327")))
            {
LABEL_52:
              objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v50, 0, 0);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              if (v55)
              {
                v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v55, 4);
                objc_msgSend(v99, "setObject:forKeyedSubscript:", v56, OSATransformResultMetadata);

                v23 = v100;
              }

              v49 = 0x1E0CB3000uLL;
              if (v45)
                goto LABEL_55;
              goto LABEL_47;
            }
            v53 = CFSTR("227");
LABEL_51:
            objc_msgSend(v50, "setObject:forKeyedSubscript:", v53, CFSTR("bug_type"));
            goto LABEL_52;
          }
          v53 = CFSTR("185");
        }
        v23 = v100;
        goto LABEL_51;
      }
      v46 = (void *)MEMORY[0x1E0CB35C8];
      v116 = *MEMORY[0x1E0CB2D50];
      v117 = CFSTR("unsupported JSON schema version");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "errorWithDomain:code:userInfo:", CFSTR("OSALegacyXform"), 4, v17);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v103;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        -[OSALog bugType](v10, "bugType");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v19;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "unsupported log type '%@' effective (%@)", buf, 0x16u);

      }
      v39 = (void *)MEMORY[0x1E0CB35C8];
      v114 = *MEMORY[0x1E0CB2D50];
      v115 = CFSTR("legacy conversion not supported for log type");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("OSALegacyXform"), 6, v40);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v16 = v102;
LABEL_87:

    goto LABEL_88;
  }
  objc_msgSend(v18, "augmentWithPrefix:", CFSTR("Unable to read JSON"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
LABEL_88:

  v11 = (id)v16;
  v6 = v105;
LABEL_89:

  if (v24)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v24, "localizedDescription");
      v85 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v86 = objc_msgSend(v85, "UTF8String");
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v86;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);

    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, OSATransformResultError);
  }

  return v7;
}

uint64_t __39__OSALegacyXform_transformURL_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templates, 0);
}

+ (void)transformURL:options:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error creating temporary file for symbolicated log", v0, 2u);
}

+ (void)transformURL:(void *)a1 options:.cold.2(void *a1)
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138543362;
  v3 = v1;
  _os_log_error_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error loading full report: %{public}@", (uint8_t *)&v2, 0xCu);

}

@end
