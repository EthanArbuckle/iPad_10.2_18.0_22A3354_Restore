@implementation _PASArgParser

- (_PASArgParser)initWithHandler:(id)a3
{
  id v5;
  _PASArgParser *v6;
  uint64_t v7;
  NSMutableArray *registeredSubcommands;
  uint64_t v9;
  NSMutableArray *registeredOptions;
  uint64_t v11;
  NSMutableSet *requiredOptions;
  uint64_t v13;
  id handler;
  void *v16;
  objc_super v17;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASArgParser.m"), 340, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  v17.receiver = self;
  v17.super_class = (Class)_PASArgParser;
  v6 = -[_PASArgParser init](&v17, sel_init);
  if (v6)
  {
    v7 = objc_opt_new();
    registeredSubcommands = v6->_registeredSubcommands;
    v6->_registeredSubcommands = (NSMutableArray *)v7;

    v9 = objc_opt_new();
    registeredOptions = v6->_registeredOptions;
    v6->_registeredOptions = (NSMutableArray *)v9;

    v11 = objc_opt_new();
    requiredOptions = v6->_requiredOptions;
    v6->_requiredOptions = (NSMutableSet *)v11;

    v13 = MEMORY[0x1A1AFDE78](v5);
    handler = v6->_handler;
    v6->_handler = (id)v13;

  }
  return v6;
}

- (id)description
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("_PASArgParser"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_registeredOptions, "count"))
  {
    objc_msgSend(v3, "appendString:", CFSTR("\n  Registered Options:\n"));
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v4 = self->_registeredOptions;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "appendFormat:", CFSTR("    %@\n"), *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v6);
    }

  }
  if (-[NSMutableArray count](self->_registeredSubcommands, "count"))
  {
    objc_msgSend(v3, "appendString:", CFSTR("\n  Registered Subcommands:\n"));
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = self->_registeredSubcommands;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v3, "appendFormat:", CFSTR("    %@\n"), *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++));
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v11);
    }

  }
  return v3;
}

- (void)registerSubcommand:(id)a3
{
  -[NSMutableArray addObject:](self->_registeredSubcommands, "addObject:", a3);
}

- (void)registerOption:(id)a3
{
  NSMutableSet *requiredOptions;
  void *v5;
  id v6;

  v6 = a3;
  -[NSMutableArray addObject:](self->_registeredOptions, "addObject:", v6);
  if (objc_msgSend(v6, "required"))
  {
    requiredOptions = self->_requiredOptions;
    objc_msgSend(v6, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](requiredOptions, "addObject:", v5);

  }
}

- (id)optionShortHelp
{
  return makeOptionShortHelp(self->_registeredOptions);
}

- (id)optionLongHelp
{
  return makeOptionLongHelp(self->_registeredOptions);
}

- (id)subcommandLongHelp
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  if (-[NSMutableArray count](self->_registeredSubcommands, "count"))
    objc_msgSend(v3, "appendString:", CFSTR("\nSubcommand Details:\n"));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_registeredSubcommands;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "helpDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("  %@ -- %@\n"), v10, v11, (_QWORD)v13);

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)naiveUsageHelpWithPositionalArgString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("Usage:\n  "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v7);

  if (-[NSMutableArray count](self->_registeredSubcommands, "count"))
    objc_msgSend(v5, "appendString:", CFSTR(" [SUBCOMMAND]"));
  -[_PASArgParser optionShortHelp](self, "optionShortHelp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v8);

  if (v4)
    objc_msgSend(v5, "appendString:", v4);
  objc_msgSend(v5, "appendString:", CFSTR("\n"));
  -[_PASArgParser subcommandLongHelp](self, "subcommandLongHelp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v9);

  -[_PASArgParser optionLongHelp](self, "optionLongHelp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v10);

  return v5;
}

- (int)invokeHandlerWithArguments:(const char *)a3 count:(int)a4 parseErrorCode:(int)a5 error:(id *)a6
{
  int v9;
  _DWORD *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  char v22;
  id v23;
  _PASArgParser *v24;
  id v25;
  void *v26;
  int v27;
  int v28;
  int v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  const char *name;
  option *v37;
  id v38;
  int v39;
  int *flag;
  const char *v41;
  void *v42;
  id v43;
  char *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  const char **v72;
  void *v73;
  void *v74;
  id v75;
  id *v76;
  int v77;
  _PASArgToplevelHandlerParams *v79;
  uint64_t (**v80)(_QWORD, _QWORD, _QWORD);
  void *v81;
  char v83;
  _PASArgParser *v85;
  id v87;
  uint64_t v88;
  void *v89;
  id v90;
  char *v91;
  int v92;
  const char **v93;
  void *v94;
  NSMutableArray *v95;
  void *v96;
  char v97;
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  option *v103;
  int v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  _BYTE v115[128];
  _BYTE v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v9 = 1;
  *MEMORY[0x1E0C844E0] = 1;
  v10 = (_DWORD *)MEMORY[0x1E0C844D8];
  *MEMORY[0x1E0C844D8] = 0;
  *MEMORY[0x1E0C844E8] = 0;
  *MEMORY[0x1E0C844F0] = 1;
  v11 = (void *)objc_opt_new();
  v96 = (void *)objc_opt_new();
  v12 = 0x1E0CB3000uLL;
  v93 = a3;
  v94 = v11;
  v85 = self;
  v92 = a4;
  if (a4 < 2)
  {
    v23 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3[1]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "handleFailureInMethod:object:file:lineNumber:description:", a2, v85, CFSTR("_PASArgParser.m"), 478, CFSTR("possibleSubcommand: stringWithUTF8String unexpectedly returned nil"));

      self = v85;
    }
    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    v14 = self->_registeredSubcommands;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v105, v116, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v106;
      while (2)
      {
        v18 = v12;
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v106 != v17)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
          objc_msgSend(v20, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", v13);

          if ((v22 & 1) != 0)
          {
            v23 = v20;

            if (v23)
            {
              v9 = 0;
              ++*MEMORY[0x1E0C844E0];
            }
            else
            {
              v9 = 1;
            }
            v11 = v94;
            self = v85;
            v12 = v18;
            goto LABEL_18;
          }
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v105, v116, 16);
        v12 = v18;
        if (v16)
          continue;
        break;
      }
    }

    v23 = 0;
    v9 = 1;
    v11 = v94;
    self = v85;
LABEL_18:
    a3 = v93;
    a4 = v92;
  }
  *v10 = 0;
  v104 = 0;
  v103 = 0;
  -[_PASArgParser _argumentParseTemplate:longArgs:](self, "_argumentParseTemplate:longArgs:", v23, &v103);
  v24 = self;
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v91 = (char *)objc_msgSend(v25, "UTF8String");

  if (v9)
  {
    v95 = v24->_registeredOptions;
    v89 = (void *)-[NSMutableSet mutableCopy](v24->_requiredOptions, "mutableCopy");
  }
  else
  {
    objc_msgSend(v23, "registeredOptions");
    v95 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "requiredOptions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = (void *)objc_msgSend(v26, "mutableCopy");

  }
  v83 = v9;
  v87 = v23;
  v97 = 0;
  v90 = 0;
  v88 = *MEMORY[0x1E0CB2D68];
LABEL_23:
  v27 = getopt_long(a4, (char *const *)a3, v91, v103, &v104);
  if (v27 == -1)
  {
    v63 = v87;
    goto LABEL_58;
  }
  v28 = v27;
  if (v27 == 63)
    v29 = *MEMORY[0x1E0C844E8];
  else
    v29 = v27;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v30 = v95;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v99, v115, 16);
  if (!v31)
    goto LABEL_56;
  v32 = v31;
  v33 = *(_QWORD *)v100;
  while (2)
  {
    for (j = 0; j != v32; ++j)
    {
      if (*(_QWORD *)v100 != v33)
        objc_enumerationMutation(v30);
      v35 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * j);
      name = v103->name;
      if (v103->name)
      {
        v37 = v103 + 1;
        while (1)
        {
          objc_msgSend(v35, "name");
          v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v39 = strcmp(name, (const char *)objc_msgSend(v38, "UTF8String"));

          if (!v39)
          {
            flag = v37[-1].flag;
            if (flag)
            {
              if (*flag == 1)
                break;
            }
          }
          v41 = v37->name;
          ++v37;
          name = v41;
          if (!v41)
            goto LABEL_38;
        }
        *flag = 0;
LABEL_44:
        if (objc_msgSend(v35, "required"))
        {
          objc_msgSend(v35, "name");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "removeObject:", v45);

        }
        objc_msgSend(v35, "argMetavar");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = v94;
        v12 = 0x1E0CB3000uLL;
        a4 = v92;
        if (v46)
        {
          v47 = (void *)MEMORY[0x1E0CB3940];
          if (v28 == 63 || !*MEMORY[0x1E0C844D0])
          {
            objc_msgSend(v35, "name");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "stringWithFormat:", CFSTR("Option: \"%@\" missing required argument"), v55);
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            v56 = (void *)MEMORY[0x1E0CB35C8];
            v113 = v88;
            v114 = v54;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "errorWithDomain:code:userInfo:", CFSTR("_PASArgParser"), 0, v57);
            v58 = objc_claimAutoreleasedReturnValue();

            v49 = 0;
            v90 = (id)v58;
            goto LABEL_54;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
          v48 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v48 = objc_claimAutoreleasedReturnValue();
        }
        v49 = (void *)v48;
        objc_msgSend(v35, "name");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "setObject:forKeyedSubscript:", v49, v50);

        objc_msgSend(v35, "name");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "isEqualToString:", CFSTR("help"));

        v97 |= v52;
        objc_msgSend(v35, "shortName");
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v53)
        {
LABEL_55:
          a3 = v93;

          goto LABEL_23;
        }
        objc_msgSend(v35, "shortName");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "setObject:forKeyedSubscript:", v49, v54);
LABEL_54:

        goto LABEL_55;
      }
LABEL_38:
      objc_msgSend(v35, "shortName");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        objc_msgSend(v35, "shortName");
        v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v44 = (char *)objc_msgSend(v43, "UTF8String");

        if (v29 == *v44)
          goto LABEL_44;
      }
    }
    v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v99, v115, 16);
    if (v32)
      continue;
    break;
  }
LABEL_56:

  v12 = 0x1E0CB3000uLL;
  a3 = v93;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unrecognized option: (%s)"), v93[*MEMORY[0x1E0C844E0] - 1]);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)MEMORY[0x1E0CB35C8];
  v111 = v88;
  v112 = v59;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "errorWithDomain:code:userInfo:", CFSTR("_PASArgParser"), 0, v61);
  v62 = objc_claimAutoreleasedReturnValue();

  v90 = (id)v62;
  v11 = v94;
  v63 = v87;
  a4 = v92;
LABEL_58:
  if ((v97 & 1) == 0 && objc_msgSend(v89, "count"))
  {
    objc_msgSend(v89, "allObjects");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "_pas_componentsJoinedByString:", CFSTR(", "));
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v12 + 2368), "stringWithFormat:", CFSTR("Missing required options: %@"), v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (void *)MEMORY[0x1E0CB35C8];
    v109 = v88;
    v110 = v66;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "errorWithDomain:code:userInfo:", CFSTR("_PASArgParser"), 0, v68);
    v69 = objc_claimAutoreleasedReturnValue();

    v63 = v87;
    v90 = (id)v69;
  }
  v70 = (int)*MEMORY[0x1E0C844E0];
  if (a4 > (int)v70)
  {
    v71 = a4 - v70;
    v72 = &a3[v70];
    do
    {
      objc_msgSend(*(id *)(v12 + 2368), "stringWithUTF8String:", *v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v73)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "handleFailureInMethod:object:file:lineNumber:description:", a2, v85, CFSTR("_PASArgParser.m"), 585, CFSTR("posArgStr: stringWithUTF8String unexpectedly returned nil"));

        v63 = v87;
      }
      objc_msgSend(v96, "addObject:", v73);

      ++v72;
      --v71;
    }
    while (v71);
  }
  free(v103);
  v75 = v90;
  if (v90)
  {
    v76 = a6;
    v77 = a5;
    if (a6)
      goto LABEL_68;
  }
  else
  {
    if ((v83 & 1) != 0)
    {
      v79 = -[_PASArgToplevelHandlerParams initWithParser:options:positionalArguments:]([_PASArgToplevelHandlerParams alloc], "initWithParser:options:positionalArguments:", v85, v11, v96);
      v77 = (*((uint64_t (**)(void))v85->_handler + 2))();
      v75 = 0;
    }
    else
    {
      v79 = -[_PASArgSubcommandHandlerParams initWithSubcommand:options:positionalArguments:]([_PASArgSubcommandHandlerParams alloc], "initWithSubcommand:options:positionalArguments:", v63, v11, v96);
      objc_msgSend(v63, "handler");
      v80 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v98 = 0;
      v77 = ((uint64_t (**)(_QWORD, _PASArgToplevelHandlerParams *, id *))v80)[2](v80, v79, &v98);
      v75 = v98;

    }
    v76 = a6;

    if (a6)
    {
LABEL_68:
      v75 = objc_retainAutorelease(v75);
      *v76 = v75;
    }
  }

  return v77;
}

- (id)_argumentParseTemplate:(id)a3 longArgs:(option *)a4
{
  id v7;
  void *v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  option *v11;
  option *v12;
  unint64_t v13;
  int *p_val;
  char *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  id v25;

  v7 = a3;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASArgParser.m"), 622, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("longArgsRef"));

  }
  v8 = (void *)objc_opt_new();
  if (v7)
  {
    objc_msgSend(v7, "registeredOptions");
    v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = self->_registeredOptions;
  }
  v10 = v9;
  v11 = (option *)malloc_type_calloc(-[NSMutableArray count](v9, "count") + 1, 0x20uLL, 0x10500402E37B38AuLL);
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v25);
  }
  v12 = v11;
  if (-[NSMutableArray count](v10, "count"))
  {
    v13 = 0;
    p_val = &v12->val;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", v13);
      v15 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "name");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *((_QWORD *)p_val - 3) = objc_msgSend(v16, "UTF8String");

      objc_msgSend(v15, "argMetavar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(p_val - 4) = v17 != 0;

      objc_msgSend(v15, "shortName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        *((_QWORD *)p_val - 1) = 0;
        objc_msgSend(v15, "shortName");
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *p_val = *(char *)objc_msgSend(v19, "UTF8String");

      }
      else
      {
        *((_QWORD *)p_val - 1) = v15 + 8;
        *p_val = 1;
      }
      objc_msgSend(v15, "shortName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v15, "shortName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appendString:", v21);

        objc_msgSend(v15, "argMetavar");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
          objc_msgSend(v8, "appendString:", CFSTR(":"));
      }

      ++v13;
      p_val += 8;
    }
    while (v13 < -[NSMutableArray count](v10, "count"));
  }
  *a4 = v12;

  return v8;
}

- (NSMutableArray)registeredSubcommands
{
  return self->_registeredSubcommands;
}

- (NSMutableArray)registeredOptions
{
  return self->_registeredOptions;
}

- (NSMutableSet)requiredOptions
{
  return self->_requiredOptions;
}

- (void)setRequiredOptions:(id)a3
{
  objc_storeStrong((id *)&self->_requiredOptions, a3);
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_requiredOptions, 0);
  objc_storeStrong((id *)&self->_registeredOptions, 0);
  objc_storeStrong((id *)&self->_registeredSubcommands, 0);
}

+ (id)BOOLValueForArgument:(id)a3 error:(id *)a4
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASArgParser.m"), 285, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[argument isKindOfClass:[NSString class]]"));

      }
      v8 = v7;
      objc_msgSend(v8, "lowercaseString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("yes")) & 1) != 0)
      {

      }
      else
      {
        v10 = objc_msgSend(v8, "isEqualToString:", CFSTR("1"));

        if ((v10 & 1) == 0)
        {
          objc_msgSend(v8, "lowercaseString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v12, "isEqualToString:", CFSTR("no")) & 1) != 0)
          {

          }
          else
          {
            v13 = objc_msgSend(v8, "isEqualToString:", CFSTR("0"));

            if ((v13 & 1) == 0)
            {
              if (a4)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Argument value \"%@\" cannot be converted to BOOLean."), v8);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = (void *)MEMORY[0x1E0CB35C8];
                v18 = *MEMORY[0x1E0CB2D68];
                v19[0] = v14;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("_PASArgParser"), 0, v16);
                *a4 = (id)objc_claimAutoreleasedReturnValue();

                a4 = 0;
              }
              goto LABEL_10;
            }
          }
          a4 = (id *)MEMORY[0x1E0C9AAA0];
LABEL_10:

          goto LABEL_11;
        }
      }
      a4 = (id *)MEMORY[0x1E0C9AAB0];
      goto LABEL_10;
    }
  }
  a4 = 0;
LABEL_11:

  return a4;
}

+ (id)numberValueForArgument:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASArgParser.m"), 308, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[argument isKindOfClass:[NSString class]]"));

    }
    v9 = v7;
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "numberFromString:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 && !v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Argument value \"%@\" cannot be converted to a number."), v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2D68];
      v17[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("_PASArgParser"), 0, v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)enumValueForArgument:(id)a3 withMapping:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASArgParser.m"), 326, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[argument isKindOfClass:[NSString class]]"));

    }
    v12 = v9;
    objc_msgSend(v10, "objectForKeyedSubscript:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v13;
    if (a5 && !v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Argument value \"%@\" does not correspond an enum value."), v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0CB2D68];
      v20[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("_PASArgParser"), 0, v16);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (_PASArgParser)parserWithHandler:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHandler:", v4);

  return (_PASArgParser *)v5;
}

+ (id)simpleParserWithHelpGenerator:(id)a3 version:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASArgParser.m"), 360, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __63___PASArgParser_simpleParserWithHelpGenerator_version_handler___block_invoke;
  v20[3] = &unk_1E442FC08;
  v12 = v9;
  v22 = v12;
  v13 = v10;
  v21 = v13;
  v14 = v11;
  v23 = v14;
  objc_msgSend(a1, "parserWithHandler:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PASArgOption optionWithName:shortName:help:](_PASArgOption, "optionWithName:shortName:help:", CFSTR("help"), CFSTR("h"), CFSTR("Display a help page."));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerOption:", v16);

  if (v13)
  {
    +[_PASArgOption optionWithName:shortName:help:](_PASArgOption, "optionWithName:shortName:help:", CFSTR("version"), CFSTR("V"), CFSTR("Display the program name and version."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerOption:", v17);

  }
  return v15;
}

@end
