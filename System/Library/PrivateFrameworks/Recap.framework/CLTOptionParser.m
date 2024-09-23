@implementation CLTOptionParser

- (CLTOptionParser)init
{
  void *v3;
  void *v4;
  CLTOptionParser *v5;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arguments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CLTOptionParser initWithArguments:](self, "initWithArguments:", v4);

  return v5;
}

- (CLTOptionParser)initWithArguments:(id)a3
{
  id v4;
  CLTOptionParser *v5;
  CLTOptionParser *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id *v12;
  void *v13;
  id *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id *v19;
  _QWORD v20[4];
  id *v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CLTOptionParser;
  v5 = -[CLTOptionParser init](&v22, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CLTOptionParser setInputArguments:](v5, "setInputArguments:", v4);
    objc_msgSend(v4, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLTOptionParser setToolName:](v6, "setToolName:", v8);

    -[CLTOptionParser setVersionString:](v6, "setVersionString:", CFSTR("0.0.1"));
    -[CLTOptionParser setUsageOptionsDescription:](v6, "setUsageOptionsDescription:", CFSTR("[options]"));
    v9 = (void *)MEMORY[0x1E0C99DE8];
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "addShorthand:", CFSTR("h"));
    objc_msgSend(v10, "addLongform:", CFSTR("help"));
    v11 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __37__CLTOptionParser_initWithArguments___block_invoke;
    v20[3] = &unk_1E4FC1FB8;
    v12 = v6;
    v21 = v12;
    objc_msgSend(v10, "setTriggerAction:", v20);
    objc_msgSend(v10, "setRighthandHelp:", CFSTR("Shows this help."));
    objc_storeStrong(v12 + 7, v10);

    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "addLongform:", CFSTR("version"));
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __37__CLTOptionParser_initWithArguments___block_invoke_2;
    v18[3] = &unk_1E4FC1FB8;
    v14 = v12;
    v19 = v14;
    objc_msgSend(v13, "setTriggerAction:", v18);
    objc_msgSend(v13, "setRighthandHelp:", CFSTR("Shows version and build time."));
    objc_storeStrong(v14 + 8, v13);

    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "addShorthand:", CFSTR("v"));
    objc_msgSend(v15, "addLongform:", CFSTR("verbose"));
    objc_msgSend(v15, "setTriggerAction:", &__block_literal_global);
    objc_msgSend(v15, "setRighthandHelp:", CFSTR("Increase verbosity, can appear multiple times."));
    objc_msgSend(v15, "setMaxAllowedOccurencies:", 3);
    objc_storeStrong(v14 + 8, v15);
    objc_msgSend(v9, "arrayWithObjects:", v10, v13, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setOptions:", v16);

  }
  return v6;
}

void __37__CLTOptionParser_initWithArguments___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  const char *v4;
  FILE **v5;

  if ((_CLTLogLevel & 0x80000000) == 0)
  {
    v1 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "helpString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringWithFormat:", CFSTR("%@"), v2);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    v5 = (FILE **)MEMORY[0x1E0C80C20];
    fputs(v4, (FILE *)*MEMORY[0x1E0C80C20]);

    fflush(*v5);
  }
  exit(0);
}

void __37__CLTOptionParser_initWithArguments___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  const char *v4;
  FILE **v5;

  if ((_CLTLogLevel & 0x80000000) == 0)
  {
    v1 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "versionLine");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringWithFormat:", CFSTR("%@\n"), v2);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    v5 = (FILE **)MEMORY[0x1E0C80C20];
    fputs(v4, (FILE *)*MEMORY[0x1E0C80C20]);

    fflush(*v5);
  }
  exit(0);
}

void __37__CLTOptionParser_initWithArguments___block_invoke_3()
{
  ++_CLTLogLevel;
}

- (NSString)versionLine
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CLTOptionParser toolName](self, "toolName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLTOptionParser versionString](self, "versionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (v%@) (build time: %s %s)"), v4, v5, "Aug  3 2024", "10:07:23");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)helpString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  -[CLTOptionParser versionLine](self, "versionLine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  -[CLTOptionParser usageString](self, "usageString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)usageLine
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CLTOptionParser toolName](self, "toolName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLTOptionParser usageOptionsDescription](self, "usageOptionsDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Usage: %@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)usageString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t i;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  CLTOptionParser *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _QWORD v41[4];

  v41[2] = *MEMORY[0x1E0C80C00];
  -[CLTOptionParser usageLine](self, "usageLine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v3;
  v41[1] = &stru_1E4FC2788;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[CLTOptionParser introductionaryDescription](self, "introductionaryDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CLTOptionParser introductionaryDescription](self, "introductionaryDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[CLTOptionParser options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v36;
    v12 = 20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "lefthandHelp");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "length");

        if (v12 <= v15)
          v12 = v15;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 20;
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = self;
  -[CLTOptionParser options](self, "options");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        v20 = v5;
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
        v22 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v21, "lefthandHelp");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringByPaddingToLength:withString:startingAtIndex:", v12, CFSTR(" "), 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "righthandHelp");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR(" %@  %@"), v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v20;
        objc_msgSend(v20, "addObject:", v26);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v17);
  }

  objc_msgSend(v5, "addObject:", &stru_1E4FC2788);
  if (-[NSArray count](v29->_additionalHelpLines, "count"))
  {
    objc_msgSend(v5, "addObjectsFromArray:", v29->_additionalHelpLines);
    objc_msgSend(v5, "addObject:", &stru_1E4FC2788);
  }
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)parse
{
  void *v3;
  void *v4;
  void (**v5)(void);
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  int v21;
  unint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void (**v33)(void);
  id v34;
  void *v35;
  void (**v36)(void);
  void *v37;
  id v39;
  const char *v40;
  FILE **v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  CLTOptionParser *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  if (-[NSArray count](self->_inputArguments, "count") == 1
    && !-[CLTOptionParser succeedWithoutArguments](self, "succeedWithoutArguments"))
  {
    -[CLTOptionParser defaultHelpOption](self, "defaultHelpOption");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "triggerAction");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
  -[NSArray objectEnumerator](self->_inputArguments, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "nextObject");
  v8 = 0;
  v9 = 0;
  v49 = self;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        do
        {
          v10 = v9;
          objc_msgSend(v6, "nextObject");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v9)
            goto LABEL_50;
        }
        while (v8 && (objc_msgSend(v8, "consumeArgument:", v9) & 1) != 0);

        if (objc_msgSend(v9, "isEqual:", CFSTR("--")))
        {
          objc_msgSend(v6, "allObjects");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v8);
LABEL_50:
          v37 = 0;
          goto LABEL_51;
        }
        if (objc_msgSend(v9, "hasPrefix:", CFSTR("-")))
          break;
        objc_msgSend(v3, "addObject:", v9);
        v8 = 0;
      }
      objc_msgSend(v9, "substringFromIndex:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v11;
      v45 = v6;
      v46 = v3;
      if ((objc_msgSend(v11, "hasPrefix:", CFSTR("-")) & 1) != 0)
      {
        objc_msgSend(v11, "substringFromIndex:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        -[CLTOptionParser options](self, "options");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v56;
          while (2)
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v56 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
              objc_msgSend(v18, "longforms");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "containsObject:", v12);

              if (v20)
              {
                objc_msgSend(v18, "triggerAction");
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                if (v35)
                {
                  objc_msgSend(v18, "triggerAction");
                  v36 = (void (**)(void))objc_claimAutoreleasedReturnValue();
                  v36[2]();

                }
                objc_msgSend(v18, "setOccurencies:", objc_msgSend(v18, "occurencies") + 1);
                v50 = v18;
                LOBYTE(v21) = 1;
                goto LABEL_40;
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
            if (v15)
              continue;
            break;
          }
          LOBYTE(v21) = 0;
          v50 = 0;
LABEL_40:
          v11 = v48;
          self = v49;
        }
        else
        {
          LOBYTE(v21) = 0;
          v50 = 0;
        }

      }
      else if (objc_msgSend(v11, "length"))
      {
        v50 = 0;
        v21 = 0;
        v22 = 0;
        do
        {
          objc_msgSend(v11, "substringWithRange:", v22, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          -[CLTOptionParser options](self, "options");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
          if (v25)
          {
            v26 = v25;
            v47 = v21;
            v27 = *(_QWORD *)v52;
            while (2)
            {
              for (j = 0; j != v26; ++j)
              {
                if (*(_QWORD *)v52 != v27)
                  objc_enumerationMutation(v24);
                v29 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
                objc_msgSend(v29, "shorthands");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = objc_msgSend(v30, "containsObject:", v23);

                if (v31)
                {
                  objc_msgSend(v29, "triggerAction");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v32)
                  {
                    objc_msgSend(v29, "triggerAction");
                    v33 = (void (**)(void))objc_claimAutoreleasedReturnValue();
                    v33[2]();

                  }
                  objc_msgSend(v29, "setOccurencies:", objc_msgSend(v29, "occurencies") + 1);
                  v34 = v29;

                  v21 = 1;
                  v50 = v34;
                  v11 = v48;
                  self = v49;
                  goto LABEL_35;
                }
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
              if (v26)
                continue;
              break;
            }
            v11 = v48;
            self = v49;
            v21 = v47;
          }
LABEL_35:

          ++v22;
        }
        while (v22 < objc_msgSend(v11, "length"));
      }
      else
      {
        LOBYTE(v21) = 0;
        v50 = 0;
      }
      v8 = v50;
      if (!v50 && (v21 & 1) == 0)
        break;

      v6 = v45;
      v3 = v46;
    }
    v6 = v45;
    v3 = v46;
    if (!-[CLTOptionParser succeedWithUnkownFlags](self, "succeedWithUnkownFlags"))
      break;

    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Option unknown: %@\n"), v9);
  v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v40 = (const char *)objc_msgSend(v39, "UTF8String");
  v41 = (FILE **)MEMORY[0x1E0C80C10];
  fputs(v40, (FILE *)*MEMORY[0x1E0C80C10]);

  v42 = (void *)MEMORY[0x1E0CB3940];
  -[CLTOptionParser usageLine](self, "usageLine");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "stringWithFormat:", CFSTR("%@\n"), v43);
  v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  fputs((const char *)objc_msgSend(v44, "UTF8String"), *v41);

  v37 = &unk_1E4FCC7B0;
  v8 = v11;
LABEL_51:

  return v37;
}

- (int)parseWithSuccessHandler:(id)a3
{
  uint64_t (**v4)(_QWORD);
  void *v5;
  void *v6;
  int v7;
  int v8;

  v4 = (uint64_t (**)(_QWORD))a3;
  -[CLTOptionParser parse](self, "parse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "intValue");
  }
  else
  {
    if (!v4)
    {
      v8 = 0;
      goto LABEL_6;
    }
    v7 = v4[2](v4);
  }
  v8 = v7;
LABEL_6:

  return v8;
}

- (void)removeAllOptions
{
  id v2;

  -[CLTOptionParser options](self, "options");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)addOption:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CLTOptionParser options](self, "options");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (NSString)toolName
{
  return self->_toolName;
}

- (void)setToolName:(id)a3
{
  objc_storeStrong((id *)&self->_toolName, a3);
}

- (NSString)versionString
{
  return self->_versionString;
}

- (void)setVersionString:(id)a3
{
  objc_storeStrong((id *)&self->_versionString, a3);
}

- (NSString)introductionaryDescription
{
  return self->_introductionaryDescription;
}

- (void)setIntroductionaryDescription:(id)a3
{
  objc_storeStrong((id *)&self->_introductionaryDescription, a3);
}

- (NSString)usageOptionsDescription
{
  return self->_usageOptionsDescription;
}

- (void)setUsageOptionsDescription:(id)a3
{
  objc_storeStrong((id *)&self->_usageOptionsDescription, a3);
}

- (BOOL)succeedWithoutArguments
{
  return self->_succeedWithoutArguments;
}

- (void)setSucceedWithoutArguments:(BOOL)a3
{
  self->_succeedWithoutArguments = a3;
}

- (BOOL)succeedWithUnkownFlags
{
  return self->_succeedWithUnkownFlags;
}

- (void)setSucceedWithUnkownFlags:(BOOL)a3
{
  self->_succeedWithUnkownFlags = a3;
}

- (NSArray)additionalHelpLines
{
  return self->_additionalHelpLines;
}

- (void)setAdditionalHelpLines:(id)a3
{
  objc_storeStrong((id *)&self->_additionalHelpLines, a3);
}

- (CLTOption)defaultHelpOption
{
  return self->_defaultHelpOption;
}

- (void)setDefaultHelpOption:(id)a3
{
  objc_storeStrong((id *)&self->_defaultHelpOption, a3);
}

- (CLTOption)defaultVersionOption
{
  return self->_defaultVersionOption;
}

- (void)setDefaultVersionOption:(id)a3
{
  objc_storeStrong((id *)&self->_defaultVersionOption, a3);
}

- (NSArray)remainingArguments
{
  return self->_remainingArguments;
}

- (void)setRemainingArguments:(id)a3
{
  objc_storeStrong((id *)&self->_remainingArguments, a3);
}

- (NSArray)inputArguments
{
  return self->_inputArguments;
}

- (void)setInputArguments:(id)a3
{
  objc_storeStrong((id *)&self->_inputArguments, a3);
}

- (NSMutableArray)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_inputArguments, 0);
  objc_storeStrong((id *)&self->_remainingArguments, 0);
  objc_storeStrong((id *)&self->_defaultVersionOption, 0);
  objc_storeStrong((id *)&self->_defaultHelpOption, 0);
  objc_storeStrong((id *)&self->_additionalHelpLines, 0);
  objc_storeStrong((id *)&self->_usageOptionsDescription, 0);
  objc_storeStrong((id *)&self->_introductionaryDescription, 0);
  objc_storeStrong((id *)&self->_versionString, 0);
  objc_storeStrong((id *)&self->_toolName, 0);
}

@end
