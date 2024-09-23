@implementation SCRCArgumentParser

+ (id)processIdentifier
{
  return 0;
}

+ (id)versionString
{
  return 0;
}

+ (id)commandPath
{
  void *v2;
  __CFString *v3;

  if (_Parser)
  {
    objc_msgSend((id)_Parser, "_arguments");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = CFSTR("unknown");
  }
  return v3;
}

- (SCRCArgumentParser)initWithArgc:(int)a3 argv:(const char *)a4
{
  SCRCArgumentParser *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *subcommandArray;
  SCRCArgumentParser *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SCRCArgumentParser;
  v4 = -[SCRCArgumentSubcommand init](&v17, sel_init, *(_QWORD *)&a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "processName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCArgumentParser setAppName:](v4, "setAppName:", v6);

    -[SCRCArgumentParser appName](v4, "appName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (!v8)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arguments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCArgumentParser set_arguments:](v4, "set_arguments:", v10);

    -[SCRCArgumentParser _arguments](v4, "_arguments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (!v12)
    {
LABEL_6:
      v15 = 0;
      goto LABEL_7;
    }
    v13 = objc_opt_new();
    subcommandArray = v4->__subcommandArray;
    v4->__subcommandArray = (NSMutableArray *)v13;

    -[SCRCArgumentSubcommand addOption:argument:target:action:argumentDescription:required:](v4, "addOption:argument:target:action:argumentDescription:required:", 104, 0, v4, sel__displayHelp_, CFSTR("Help."), 0);
    -[SCRCArgumentSubcommand addOption:argument:target:action:argumentDescription:required:](v4, "addOption:argument:target:action:argumentDescription:required:", 118, 0, v4, sel__displayVersion_, CFSTR("Version information."), 0);
  }
  v15 = v4;
LABEL_7:

  return v15;
}

- (void)addSubcommand:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SCRCArgumentParser _subcommandArray](self, "_subcommandArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v7);

  if ((v5 & 1) == 0)
  {
    -[SCRCArgumentParser _subcommandArray](self, "_subcommandArray");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

- (BOOL)parse
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  SCRCArgumentParser *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  uint64_t k;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
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
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  -[SCRCArgumentParser set_subcommand:](self, "set_subcommand:", 0);
  -[SCRCArgumentParser _arguments](self, "_arguments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 >= 2)
  {
    -[SCRCArgumentParser _arguments](self, "_arguments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    -[SCRCArgumentParser _subcommandArray](self, "_subcommandArray");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v56;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v56 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_msgSend(v12, "subcommandName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v6);

          if (v14)
          {
            -[SCRCArgumentParser set_subcommand:](self, "set_subcommand:", v12);
            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
  v15 = (void *)MEMORY[0x24BDBCEB8];
  -[SCRCArgumentSubcommand optionArray](self, "optionArray");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCRCArgumentParser _subcommand](self, "_subcommand");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "optionArray");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    -[SCRCArgumentParser _subcommand](self, "_subcommand");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "optionArray");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v22);

  }
  if (objc_msgSend(v17, "count"))
  {
    v23 = self;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v44 = v17;
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v24 = v17;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v52;
      while (2)
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v52 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
          objc_msgSend(v29, "option");
          v30 = objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            v31 = (void *)v30;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("-%@"), v30);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[SCRCArgumentParser _arguments](v23, "_arguments");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "containsObject:", v32);

            if (v34)
            {
              objc_msgSend(v29, "argument");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v35, "length");

              if (v36)
              {
                objc_msgSend(v45, "objectForKey:", v31);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v37 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  -[SCRCArgumentParser _subcommand](v23, "_subcommand");

LABEL_44:
                  v17 = v44;

LABEL_46:
                  v41 = 0;
                  goto LABEL_47;
                }
                objc_msgSend(v29, "setArgument:", v37);
                objc_msgSend(v46, "addObject:", v29);

              }
              else
              {
                objc_msgSend(v46, "addObject:", v29);
              }
            }
            else if (objc_msgSend(v29, "required"))
            {
              -[SCRCArgumentParser _subcommand](v23, "_subcommand");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_44;
            }

          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
        if (v26)
          continue;
        break;
      }
    }

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v24 = v46;
    v38 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v48;
      v17 = v44;
      v41 = 1;
      while (2)
      {
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v48 != v40)
            objc_enumerationMutation(v24);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * k), "process") & 1) == 0)
          {
            -[SCRCArgumentParser _subcommandArray](v23, "_subcommandArray");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "count");
            goto LABEL_46;
          }
        }
        v39 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
        if (v39)
          continue;
        break;
      }
    }
    else
    {
      v41 = 1;
      v17 = v44;
    }
LABEL_47:

  }
  else
  {
    v41 = 1;
  }

  return v41;
}

- (int)run
{
  void *v2;
  int v3;

  -[SCRCArgumentParser _subcommand](self, "_subcommand");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "run");

  return v3;
}

- (void)stop
{
  id v2;

  -[SCRCArgumentParser _subcommand](self, "_subcommand");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");

}

- (id)_displayVersion:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
}

- (id)_displayHelp:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "versionString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCArgumentParser _subcommand](self, "_subcommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SCRCArgumentParser _subcommand](self, "_subcommand");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "optionArray");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SCRCArgumentSubcommand optionArray](self, "optionArray");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v7, "sortedArrayUsingSelector:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCArgumentParser _subcommand](self, "_subcommand");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[SCRCArgumentParser _subcommand](self, "_subcommand");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subcommandName");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = CFSTR("<subcommand>");
  }

  objc_msgSend(v8, "count");
  -[SCRCArgumentParser _subcommand](self, "_subcommand");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "formattedHelpHeader");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v14 = v8;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v15)
  {
    v16 = v15;
    v39 = v13;
    v17 = v7;
    v18 = v11;
    v19 = v4;
    v20 = 0;
    v21 = *(_QWORD *)v41;
    do
    {
      v22 = 0;
      v23 = v20;
      do
      {
        if (*(_QWORD *)v41 != v21)
          objc_enumerationMutation(v14);
        v20 = *(id *)(*((_QWORD *)&v40 + 1) + 8 * v22);

        objc_msgSend(v20, "argument");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "length");

        ++v22;
        v23 = v20;
      }
      while (v16 != v22);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v16);

    v4 = v19;
    v11 = v18;
    v7 = v17;
    v13 = v39;
  }

  -[SCRCArgumentParser _subcommand](self, "_subcommand");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    v27 = v14;
  }
  else
  {
    -[SCRCArgumentParser _subcommandArray](self, "_subcommandArray");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");

    if (!v33)
      goto LABEL_18;
    -[SCRCArgumentParser _subcommandArray](self, "_subcommandArray");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "sortedArrayUsingSelector:", sel_compare_);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "objectEnumerator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "nextObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "subcommandName");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      do
      {
        objc_msgSend(v36, "length");
        objc_msgSend(v26, "nextObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "subcommandName");
        v38 = objc_claimAutoreleasedReturnValue();

        v36 = (void *)v38;
      }
      while (v38);
    }
  }

  v14 = v27;
LABEL_18:
  -[SCRCArgumentParser _subcommand](self, "_subcommand");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "formattedHelpFooter");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)setRunningAtStartup:(id)a3
{
  SCDynamicStoreRef v3;
  const __SCDynamicStore *v4;
  __CFArray *Mutable;
  int v6;
  id v7;
  id v8;
  const char *v9;
  pid_t v10;
  int v11;
  const char *v12;
  id v13;
  const char *v14;
  pid_t v15;
  id v16;
  const char *v17;
  pid_t v18;
  int v19;
  const char *v20;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v22;
  __CFRunLoop *Current;
  SCDynamicStoreContext context;

  -[SCRCArgumentParser setIsLaunchedAtLogin:](self, "setIsLaunchedAtLogin:", 1);
  memset(&context, 0, sizeof(context));
  v3 = SCDynamicStoreCreate(0, CFSTR("watchForConsoleUserChanges"), (SCDynamicStoreCallBack)_consoleUserChanged, &context);
  if (v3)
  {
    v4 = v3;
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    CFArrayAppendValue(Mutable, 0);
    CFRelease(0);
    v6 = SCDynamicStoreSetNotificationKeys(v4, Mutable, 0);
    CFRelease(Mutable);
    if (v6)
    {
      objc_msgSend((id)_Parser, "appName");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v7, "UTF8String");
      getpid();
      syslog(3, "%s[%d]: could not register notification keys\n");
    }
    else
    {
      RunLoopSource = SCDynamicStoreCreateRunLoopSource(0, v4, 0);
      if (RunLoopSource)
      {
        v22 = RunLoopSource;
        Current = CFRunLoopGetCurrent();
        CFRunLoopAddSource(Current, v22, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
        CFRelease(v22);
        goto LABEL_8;
      }
      objc_msgSend((id)_Parser, "appName");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v7, "UTF8String");
      getpid();
      syslog(3, "%s[%d]: could not create runloop source\n");
    }

    objc_msgSend((id)_Parser, "appName");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (const char *)objc_msgSend(v8, "UTF8String");
    v10 = getpid();
    v11 = SCError();
    v12 = SCErrorString(v11);
    syslog(3, "%s[%d]: error = %s\n", v9, v10, v12);

LABEL_8:
    CFRelease(v4);
    goto LABEL_9;
  }
  objc_msgSend((id)_Parser, "appName");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = (const char *)objc_msgSend(v13, "UTF8String");
  v15 = getpid();
  syslog(3, "%s[%d]: could not open session with configd\n", v14, v15);

  objc_msgSend((id)_Parser, "appName");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = (const char *)objc_msgSend(v16, "UTF8String");
  v18 = getpid();
  v19 = SCError();
  v20 = SCErrorString(v19);
  syslog(3, "%s[%d]: error = %s\n", v17, v18, v20);

LABEL_9:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isLaunchedAtLogin
{
  return self->_isLaunchedAtLogin;
}

- (void)setIsLaunchedAtLogin:(BOOL)a3
{
  self->_isLaunchedAtLogin = a3;
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSMutableArray)_subcommandArray
{
  return self->__subcommandArray;
}

- (void)set_subcommandArray:(id)a3
{
  objc_storeStrong((id *)&self->__subcommandArray, a3);
}

- (SCRCArgumentSubcommand)_subcommand
{
  return self->__subcommand;
}

- (void)set_subcommand:(id)a3
{
  objc_storeStrong((id *)&self->__subcommand, a3);
}

- (NSArray)_arguments
{
  return self->__arguments;
}

- (void)set_arguments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__arguments, 0);
  objc_storeStrong((id *)&self->__subcommand, 0);
  objc_storeStrong((id *)&self->__subcommandArray, 0);
  objc_storeStrong((id *)&self->_appName, 0);
}

@end
