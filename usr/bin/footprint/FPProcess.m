@implementation FPProcess

- (FPProcess)init
{
  FPProcess *v2;
  FPProcess *v3;
  NSMutableArray *v4;
  NSMutableArray *errors;
  NSMutableArray *v6;
  NSMutableArray *warnings;
  NSMutableArray *v8;
  NSMutableArray *globalErrors;
  FPProcess *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FPProcess;
  v2 = -[FPProcess init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    -[FPProcess setMemoryRegions:](v2, "setMemoryRegions:", 0);
    v4 = objc_opt_new(NSMutableArray);
    errors = v3->_errors;
    v3->_errors = v4;

    v6 = objc_opt_new(NSMutableArray);
    warnings = v3->_warnings;
    v3->_warnings = v6;

    v8 = objc_opt_new(NSMutableArray);
    globalErrors = v3->_globalErrors;
    v3->_globalErrors = v8;

    v3->_idleExitStatus = 0;
    v10 = v3;
  }

  return v3;
}

- (FPProcess)initWithBsdInfo:(proc_bsdinfo *)a3
{
  FPProcess *v4;
  FPProcess *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *displayString;
  FPProcess *v10;

  v4 = -[FPProcess init](self, "init");
  v5 = v4;
  if (v4)
  {
    -[FPProcess setPid:](v4, "setPid:", a3->pbi_pid);
    v5->_is64bit = (a3->pbi_flags & 0x10) != 0;
    if (!-[FPProcess _populateTask](v5, "_populateTask"))
    {
      v10 = 0;
      goto LABEL_6;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FPProcess _nameForBsdInfo:](FPProcess, "_nameForBsdInfo:", a3));
    -[FPProcess setName:](v5, "setName:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FPProcess name](v5, "name"));
    v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ [%d]"), v7, -[FPProcess pid](v5, "pid")));
    displayString = v5->_displayString;
    v5->_displayString = (NSString *)v8;

    v5->_pageSize = -[FPProcess _gatherPageSize](v5, "_gatherPageSize");
  }
  v10 = v5;
LABEL_6:

  return v10;
}

- (unint64_t)_gatherPageSize
{
  return vm_kernel_page_size;
}

+ (FPProcess)processWithBsdInfo:(proc_bsdinfo *)a3
{
  __objc2_class **v3;

  v3 = &off_1000280B0;
  if ((a3->pbi_flags & 1) != 0)
    v3 = off_1000280A8;
  return (FPProcess *)objc_msgSend(objc_alloc(*v3), "initWithBsdInfo:", a3);
}

+ (FPProcess)processWithPid:(int)a3
{
  int v4;
  void *v5;
  _OWORD v7[8];
  uint64_t v8;

  v8 = 0;
  memset(v7, 0, sizeof(v7));
  v4 = sub_100007C24(a3, v7);
  v5 = 0;
  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "processWithBsdInfo:", v7));
  return (FPProcess *)v5;
}

- (void)_addGlobalError:(id)a3
{
  -[NSMutableArray addObject:](self->_globalErrors, "addObject:", a3);
}

- (unint64_t)hash
{
  return self->_pid;
}

- (BOOL)isEqual:(id)a3
{
  int pid;

  pid = self->_pid;
  return pid == objc_msgSend(a3, "pid");
}

- (BOOL)_populateTask
{
  return 0;
}

- (void)gatherData
{
  -[FPProcess gatherData:extendedInfoProvider:](self, "gatherData:extendedInfoProvider:", 1, 0);
}

- (id)globalErrors
{
  return self->_globalErrors;
}

- (id)errors
{
  return +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", self->_errors);
}

- (id)warnings
{
  return self->_warnings;
}

+ (id)_nameForBsdInfo:(proc_bsdinfo *)a3
{
  char *v4;
  char *v5;
  size_t v6;
  size_t v7;
  BOOL v9;
  size_t v10;
  BOOL v12;
  id v13;
  void *v14;
  __CFString *v16;
  size_t size;
  size_t v18;
  int v19[2];
  uint32_t pbi_pid;

  *(_QWORD *)v19 = 0x800000001;
  size = 0;
  v18 = 8;
  if (!sysctl(v19, 2u, &size, &v18, 0, 0))
  {
    *(_QWORD *)v19 = 0x3100000001;
    pbi_pid = a3->pbi_pid;
    v4 = (char *)malloc_type_malloc(size, 0x142F4A9CuLL);
    if (v4)
    {
      v5 = v4;
      if (!sysctl(v19, 3u, v4, &size, 0, 0))
      {
        v6 = 0;
        v5[size - 1] = 0;
        do
        {
          v7 = v6;
          if (v5[v6++])
            v9 = size > v7;
          else
            v9 = 0;
        }
        while (v9);
        if (size > v7)
        {
          do
          {
            v10 = v6 - 1;
            if (v5[v6++ - 1])
              v12 = 0;
            else
              v12 = size > v10;
          }
          while (v12);
          if (size > v10)
          {
            v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", &v5[v6 - 2]);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));

            free(v5);
            return v14;
          }
        }
      }
      free(v5);
    }
  }
  v16 = sub_100007D1C((uint64_t)FPProcess, (uint64_t)a3);
  return (id)objc_claimAutoreleasedReturnValue(v16);
}

- (id)asNumber
{
  return +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", self->_pid);
}

+ (id)allProcessesExcludingPids:(id)a3
{
  id v3;
  unsigned int *v4;
  unsigned int *v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v15;
  void *v17;
  unint64_t v18;

  v3 = a3;
  v18 = 0;
  v4 = (unsigned int *)sub_10000806C(&v18);
  if (v4)
  {
    v5 = v4;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    v6 = v18;
    if (v18)
    {
      v7 = 0;
      v8 = 1;
      do
      {
        v9 = v5[34 * v7 + 3];
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9, v17));
        v11 = objc_msgSend(v3, "containsObject:", v10);

        if ((v11 & 1) == 0)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[FPProcess processWithBsdInfo:](FPProcess, "processWithBsdInfo:", &v5[34 * v7]));
          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9));
            objc_msgSend(v17, "setObject:forKey:", v12, v13);

          }
        }
        v7 = v8;
      }
      while (v6 > v8++);
    }
    free(v5);
    v15 = v17;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)pidsForStringDescriptions:(id)a3 errors:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  unsigned int v12;
  char v13;
  char v14;
  unsigned int *v15;
  uint64_t v16;
  id v17;
  void *v18;
  unsigned int v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  NSMutableArray *v33;
  id obj;
  unsigned int *v35;
  id *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *context;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  int v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  _BYTE v54[128];
  _BYTE v55[128];

  v6 = a3;
  v53 = 0;
  v35 = (unsigned int *)sub_10000806C(&v53);
  if (v35)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v36 = a4;
    if (a4)
      v33 = objc_opt_new(NSMutableArray);
    else
      v33 = 0;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v32 = v6;
    obj = v6;
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    if (!v39)
      goto LABEL_44;
    v8 = v53;
    v37 = v53;
    v38 = *(_QWORD *)v50;
    while (1)
    {
      for (i = 0; i != v39; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v38)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(objc_alloc((Class)NSScanner), "initWithString:", v10);
        v48 = -1;
        v12 = objc_msgSend(v11, "scanInt:", &v48);
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        context = objc_autoreleasePoolPush();
        v42 = v11;
        if (v8)
        {
          v40 = i;
          v13 = 0;
          v14 = 0;
          v15 = v35;
          while (1)
          {
            v16 = v15[3];
            v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_nameForBsdInfo:", v15));
            if (objc_msgSend(v10, "isEqualToString:", v17))
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v16));
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v18);
              v13 = 1;
            }
            else
            {
              if (!objc_msgSend(v17, "containsString:", v10))
              {
                if ((_DWORD)v16 == v48)
                  v19 = v12;
                else
                  v19 = 0;
                if (v19 == 1)
                {
                  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
                  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v16));
                  objc_msgSend(v7, "setObject:forKeyedSubscript:", v29, v30);

                  i = v40;
                  goto LABEL_41;
                }
                goto LABEL_23;
              }
              v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v16));
              objc_msgSend(v43, "setObject:forKeyedSubscript:", v10, v18);
            }

            v14 = 1;
LABEL_23:
            v15 += 34;

            if (!--v8)
            {
              if (!((v36 == 0) | v14 & 1))
              {
                v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unable to find pid for process matching '%@'"), v10);
                -[NSMutableArray addObject:](v33, "addObject:", v20);

              }
              i = v40;
              if ((v13 & 1) != 0)
                goto LABEL_42;
              goto LABEL_30;
            }
          }
        }
        if (v36)
        {
          v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unable to find pid for process matching '%@'"), v10);
          -[NSMutableArray addObject:](v33, "addObject:", v21);

        }
LABEL_30:
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v17 = v43;
        v22 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v23; j = (char *)j + 1)
            {
              if (*(_QWORD *)v45 != v24)
                objc_enumerationMutation(v17);
              v26 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)j);
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v26));

              if (!v27)
              {
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v26));
                objc_msgSend(v7, "setObject:forKeyedSubscript:", v28, v26);

              }
            }
            v23 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
          }
          while (v23);
        }
LABEL_41:

LABEL_42:
        objc_autoreleasePoolPop(context);

        v8 = v37;
      }
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      if (!v39)
      {
LABEL_44:

        if (v36 && -[NSMutableArray count](v33, "count"))
          *v36 = -[NSMutableArray copy](v33, "copy");
        free(v35);

        v6 = v32;
        goto LABEL_48;
      }
    }
  }
  v7 = 0;
  if (a4)
    *a4 = &off_10002C108;
LABEL_48:

  return v7;
}

+ (id)childPidsForPids:(id)a3
{
  id v3;
  char *v4;
  id v5;
  void *v6;
  unint64_t i;
  char *v8;
  int v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  void *v17;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  unint64_t v25;
  _BYTE v26[128];

  v3 = a3;
  v25 = 0;
  v4 = (char *)sub_10000806C(&v25);
  if (v4)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v5 = objc_msgSend(v3, "mutableCopy");
    v19 = objc_alloc_init((Class)NSMutableArray);
    if (v5)
    {
      while (1)
      {
        v6 = v5;
        if (!objc_msgSend(v5, "count", v19))
          break;
        if (v25)
        {
          for (i = 0; i < v25; ++i)
          {
            v8 = &v4[136 * i];
            v9 = *((_DWORD *)v8 + 4);
            v10 = *((int *)v8 + 3);
            v23 = 0u;
            v24 = 0u;
            v21 = 0u;
            v22 = 0u;
            v11 = v6;
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
            if (v12)
            {
              v13 = v12;
              v14 = *(_QWORD *)v22;
              while (2)
              {
                for (j = 0; j != v13; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v22 != v14)
                    objc_enumerationMutation(v11);
                  if (v9 == objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j), "longValue"))
                  {
                    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v10));
                    if ((objc_msgSend(v3, "containsObject:", v16) & 1) == 0
                      && (objc_msgSend(v20, "containsObject:", v16) & 1) == 0)
                    {
                      objc_msgSend(v19, "addObject:", v16);
                    }

                    goto LABEL_19;
                  }
                }
                v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
                if (v13)
                  continue;
                break;
              }
            }
LABEL_19:

          }
        }
        objc_msgSend(v20, "addObjectsFromArray:", v19);
        objc_msgSend(v6, "removeAllObjects");
        v5 = v19;

        v19 = v6;
        if (!v5)
        {
          v17 = 0;
          v19 = v6;
          goto LABEL_24;
        }
      }
      v17 = v5;
    }
    else
    {
      v17 = 0;
    }
LABEL_24:
    free(v4);
    v4 = v20;

  }
  return v4;
}

+ (id)removeIdleExitCleanProcessesFrom:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v4 = objc_msgSend(v3, "mutableCopy");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectEnumerator", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "idleExitStatus") == 2)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v10, "pid")));
          objc_msgSend(v4, "removeObjectForKey:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (NSDictionary)auxData
{
  return (NSDictionary *)&__NSDictionary0__struct;
}

- (BOOL)_isAlive
{
  return 0;
}

- (BOOL)breakDownPhysFootprint
{
  return sub_100011E4C();
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = -[FPProcess pid](self, "pid");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FPProcess name](self, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FPProcess[%d] %@"), v3, v4));

  return v5;
}

- (id)extendedInfoForRegionType:(int)a3 at:(unint64_t)a4 extendedInfoProvider:(id)a5
{
  return 0;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)is64bit
{
  return self->_is64bit;
}

- (void)setIs64bit:(BOOL)a3
{
  self->_is64bit = a3;
}

- (BOOL)isTranslated
{
  return self->_isTranslated;
}

- (void)setIsTranslated:(BOOL)a3
{
  self->_isTranslated = a3;
}

- (FPSharedCache)sharedCache
{
  return self->_sharedCache;
}

- (void)setSharedCache:(id)a3
{
  objc_storeStrong((id *)&self->_sharedCache, a3);
}

- (NSArray)memoryRegions
{
  return self->_memoryRegions;
}

- (void)setMemoryRegions:(id)a3
{
  objc_storeStrong((id *)&self->_memoryRegions, a3);
}

- (int)idleExitStatus
{
  return self->_idleExitStatus;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (void)setDisplayString:(id)a3
{
  objc_storeStrong((id *)&self->_displayString, a3);
}

- (unint64_t)pageSize
{
  return self->_pageSize;
}

- (void)setPageSize:(unint64_t)a3
{
  self->_pageSize = a3;
}

- (BOOL)hiddenFromDisplay
{
  return self->_hiddenFromDisplay;
}

- (void)setHiddenFromDisplay:(BOOL)a3
{
  self->_hiddenFromDisplay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_memoryRegions, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_globalErrors, 0);
  objc_storeStrong((id *)&self->_warnings, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_sharedCache, 0);
}

@end
