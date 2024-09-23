@implementation MemoryResourceException

- (BOOL)generateMemoryGraphWithContentLevel:(unsigned int)a3 memgraphFailedReasonOut:(unint64_t *)a4
{
  uint64_t v5;
  uint64_t v7;
  void *v8;
  char v9;
  id v10;
  NSString *gcoreFilePath;
  void *v12;
  id v13;
  void *v14;
  unint64_t v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  char v21;
  id v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  NSString *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  _BYTE v31[14];
  uint64_t v32;

  v5 = *(_QWORD *)&a3;
  v32 = *MEMORY[0x24BDAC8D0];
  if (!self->_task && !self->_gcoreCapture)
    return 0;
  v7 = VMUGetFlagsForAllVMRegionStatistics() | 0x5C000;
  if (!self->_gcoreCapture)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3428]), "initWithTask:options:", self->_task, v7);
    if (!v14)
    {
LABEL_9:
      if (a4)
      {
        v15 = 5;
        if (!self->_gcoreCapture)
          v15 = 2;
        *a4 = v15;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error generating VMUTaskMemoryScanner. Aborting memgraph generation.", buf, 2u);
      }
      return 0;
    }
LABEL_19:
    objc_msgSend(v14, "setScanningMask:", VMUScanningMaskForAllReferences());
    objc_msgSend(v14, "setExactScanningEnabled:", 1);
    objc_msgSend(v14, "setAbandonedMarkingEnabled:", 0);
    objc_msgSend(v14, "setMaxInteriorOffset:", *MEMORY[0x24BDB03C8]);
    objc_msgSend(v14, "setObjectContentLevel:", v5);
    if ((v5 & 0xFFFFFFFE) != 2)
    {
      v20 = 5;
LABEL_33:
      v28 = 0;
      v21 = objc_msgSend(v14, "addAllNodesFromTaskWithError:", &v28);
      v22 = v28;
      if ((v21 & 1) != 0)
      {
        objc_msgSend(v14, "processSnapshotGraphWithOptions:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v23 != 0;
        if (v23)
        {
          if (!self->_gcoreCapture)
            objc_msgSend(v14, "detachFromTask");
          objc_storeStrong((id *)&self->_memoryGraph, v23);
        }
        else
        {
          objc_msgSend(v14, "detachFromTask");
          if (a4)
          {
            v25 = 6;
            if (!self->_gcoreCapture)
              v25 = 3;
            *a4 = v25;
          }
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error generating VMUProcessObjectGraph. Aborting memgraph generation.", buf, 2u);
          }
        }

      }
      else
      {
        if (a4)
        {
          v24 = 6;
          if (!self->_gcoreCapture)
            v24 = 3;
          *a4 = v24;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v31 = v22;
          _os_log_error_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error adding nodes to VMUTaskMemoryScanner. Aborting memgraph generation. Error: %@", buf, 0xCu);
        }
        v16 = 0;
      }

      return v16;
    }
    if ((_DWORD)v5 == 2)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
LABEL_32:
        v20 = 7;
        goto LABEL_33;
      }
      sub_2134500AC((uint64_t)self);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v31 = v17;
      v18 = MEMORY[0x24BDACB70];
      v19 = "Generating readOnlyContent memgraph for %@";
    }
    else
    {
      if ((_DWORD)v5 != 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_32;
      sub_2134500AC((uint64_t)self);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v31 = v17;
      v18 = MEMORY[0x24BDACB70];
      v19 = "Generating fullContent memgraph for %@";
    }
    _os_log_impl(&dword_21344C000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);

    goto LABEL_32;
  }
  if (self->_gcoreFilePath)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "fileExistsAtPath:", self->_gcoreFilePath);

    if ((v9 & 1) != 0)
    {
      v10 = objc_alloc(MEMORY[0x24BEB3420]);
      gcoreFilePath = self->_gcoreFilePath;
      v29 = 0;
      v12 = (void *)objc_msgSend(v10, "initWithCorePath:originalBinaryPaths:error:", gcoreFilePath, 0, &v29);
      v13 = v29;
      if (v13 || !v12)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v31 = 5;
          *(_WORD *)&v31[4] = 2112;
          *(_QWORD *)&v31[6] = v13;
          _os_log_error_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error generating VMUTask from gcore. Aborting memgraph generation. (RME Error #%i: MREMemgraphFailedReasonFailedGCoreTaskMemoryScanner) Error: %@", buf, 0x12u);
        }
        *a4 = 5;

        return 0;
      }
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3428]), "initWithVMUTask:options:", v12, v7);

      if (!v14)
        goto LABEL_9;
      goto LABEL_19;
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v27 = self->_gcoreFilePath;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v31 = v27;
    *(_WORD *)&v31[8] = 1024;
    *(_DWORD *)&v31[10] = 4;
    _os_log_error_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Invalid gcore file path (%@). Aborting memgraph generation. (RME Error #%i: MREMemgraphFailedReasonFailedGCoreGeneration)", buf, 0x12u);
  }
  v16 = 0;
  *a4 = 4;
  return v16;
}

- (id)_symbolOwners
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFAllocator *v8;
  uint64_t i;
  const __CFString *v10;
  CFUUIDRef v11;
  CFUUIDRef v12;
  void *v13;
  __CFString *v14;
  CFURLRef v15;
  CFURLRef v16;
  CFTypeRef v17;
  _QWORD *v18;
  void *v19;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[NSDictionary objectForKeyedSubscript:](self->_executionStack, "objectForKeyedSubscript:", qword_254B9C380);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
    v21 = v3;
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v26;
      v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v24 = *MEMORY[0x24BE29FA8];
      v23 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v26 != v7)
            objc_enumerationMutation(v4);
          v10 = *(const __CFString **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v11 = CFUUIDCreateFromString(v8, v10);
          if (v11)
          {
            v12 = v11;
            objc_msgSend(v4, "objectForKeyedSubscript:", v10);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v24);
            v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

            if (v14 && (v15 = CFURLCreateWithFileSystemPath(v8, v14, kCFURLPOSIXPathStyle, 0)) != 0)
            {
              v16 = v15;
              v17 = CFRetain(v15);
              v18 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
              *v18 = 0;
              v18[1] = 0;
              CSSymbolicatorForeachSymbolicatorWithURL();
              CFRelease(v16);
              if (v17)
                CFRelease(v17);
              CFRelease(v12);
              if ((CSIsNull() & 1) != 0)
              {
                free(v18);
              }
              else
              {
                v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:deallocator:", v18, 16, &unk_24CFC8630);
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v19, v10);

              }
              v7 = v23;
            }
            else
            {
              CFRelease(v12);
            }

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v6);
    }

    v3 = v21;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)prettyPrintBacktrace:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __CFString *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t Name;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *context;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  MemoryResourceException *v48;
  void *v49;
  void *v50;
  uint64_t v51;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_executionStack, "objectForKeyedSubscript:", qword_254B9C368);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_executionStack, "objectForKeyedSubscript:", qword_254B9C370);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_executionStack, "objectForKeyedSubscript:", qword_254B9C380);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_executionStack, "objectForKeyedSubscript:", qword_254B9C378);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MemoryResourceException _symbolOwners](self, "_symbolOwners");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = 0;
  }
  if (objc_msgSend(v5, "count"))
  {
    v7 = 0;
    v46 = *MEMORY[0x24BE29FB0];
    v48 = self;
    v37 = v6;
    v38 = v5;
    while (1)
    {
      v8 = MEMORY[0x2199B3174]();
      objc_msgSend(v39, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length"))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Thread %d name:  %@"), v7, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "addObject:", v10);

      }
      v11 = (void *)MEMORY[0x24BDD17C8];
      v40 = v9;
      context = (void *)v8;
      if (v6)
      {
        v12 = objc_msgSend(v6, "integerValue") != v7;
        v13 = &stru_24CFC95F8;
        if (!v12)
          v13 = CFSTR(" Attributed");
      }
      else
      {
        v13 = &stru_24CFC95F8;
      }
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Thread %d%@:"), v7, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "addObject:", v14);

      v42 = v7;
      objc_msgSend(v5, "objectAtIndex:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count"))
        break;
LABEL_41:
      objc_msgSend(v50, "addObject:", &stru_24CFC95F8);

      objc_autoreleasePoolPop(context);
      v7 = v42 + 1;
      v5 = v38;
      v6 = v37;
      if (objc_msgSend(v38, "count") <= (unint64_t)(v42 + 1))
        goto LABEL_44;
    }
    v16 = 0;
    v49 = v15;
    while (1)
    {
      objc_msgSend(v15, "objectAtIndex:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", qword_254B9C340);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v18, "unsignedLongLongValue");

      objc_msgSend(v17, "objectForKeyedSubscript:", qword_254B9C360);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_msgSend(v47, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
        {
          objc_msgSend(v20, "objectForKey:", v46);
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v22)
            goto LABEL_21;
        }
      }
      else
      {
        v21 = 0;
      }
      v22 = CFSTR("???");
LABEL_21:
      if ((unint64_t)-[__CFString length](v22, "length") < 0x1F)
      {
        -[__CFString stringByPaddingToLength:withString:startingAtIndex:](v22, "stringByPaddingToLength:withString:startingAtIndex:", 30, CFSTR(" "), 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = (void *)MEMORY[0x24BDD17C8];
        -[__CFString substringFromIndex:](v22, "substringFromIndex:", -[__CFString length](v22, "length") - 27);
        v24 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("...%@"), v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = (__CFString *)v24;
      }

      objc_msgSend(v21, "objectForKey:", CFSTR("StartAddress"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "unsignedLongLongValue");

      objc_msgSend(v17, "objectForKey:", qword_254B9C350);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", qword_254B9C348);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "unsignedLongLongValue");

      if (v28)
        goto LABEL_33;
      if (v19)
      {
        objc_msgSend(v44, "objectForKeyedSubscript:", v19);
        v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v31, "bytes");

      }
      if ((CSIsNull() & 1) != 0)
        goto LABEL_32;
      v45 = v27;
      v32 = v27 - CSSymbolOwnerGetBaseAddress();
      CSSymbolOwnerGetSymbolWithAddress();
      if ((CSIsNull() & 1) != 0)
      {
        v27 = v45;
LABEL_32:
        v28 = CFSTR("???");
        goto LABEL_33;
      }
      v43 = v32;
      Name = CSSymbolGetName();
      v27 = v45;
      if (!Name)
        goto LABEL_32;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", Name);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v30 = CSSymbolGetRange() + v43;
      if (!v28)
        goto LABEL_32;
LABEL_33:
      if (v30)
      {
        if (v48->_is64Bit)
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%-3d %@\t%#018qx %@ + %qd%@"), v16, v25, v51, v28, v51 - v30, &stru_24CFC95F8);
        else
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%-3d %@\t%#010lx %@ + %ld%@"), v16, v25, v51, v28, v51 - v30, &stru_24CFC95F8);
      }
      else if (v48->_is64Bit)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%-3d %@\t%#018qx %#qx + %qd%@"), v16, v25, v51, v27, v51 - v27, &stru_24CFC95F8);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%-3d %@\t%#010lx %#lx + %ld%@"), v16, v25, v51, v27, v51 - v27, &stru_24CFC95F8);
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v49;
      objc_msgSend(v50, "addObject:", v34);

      if (objc_msgSend(v49, "count") <= (unint64_t)++v16)
        goto LABEL_41;
    }
  }
  objc_msgSend(v50, "addObject:", CFSTR("Backtrace not available"));
LABEL_44:
  objc_msgSend(v50, "componentsJoinedByString:", CFSTR("\n"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (id)prettyPrintBinaryImages
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  const __CFString *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id obj;
  uint64_t v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  -[NSDictionary objectForKeyedSubscript:](self->_executionStack, "objectForKeyedSubscript:", qword_254B9C380);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "count"))
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count") + 1);
    objc_msgSend(v30, "addObject:", CFSTR("Binary Images:"));
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v27 = v3;
    objc_msgSend(v3, "allValues");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v37;
      v33 = *MEMORY[0x24BE29FA0];
      v28 = *MEMORY[0x24BE29FA8];
      v29 = *MEMORY[0x24BE29FB0];
      do
      {
        v7 = 0;
        v31 = v5;
        do
        {
          if (*(_QWORD *)v37 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v7);
          v9 = (void *)MEMORY[0x2199B3174]();
          objc_msgSend(v8, "objectForKey:", CFSTR("StartAddress"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v8, "objectForKey:", v33);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_24CFC95F8);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v12, "lowercaseString");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              v14 = objc_msgSend(v10, "unsignedLongLongValue");
              objc_msgSend(v8, "objectForKey:", v29);
              v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "objectForKey:", CFSTR("Size"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = v9;
              v17 = objc_msgSend(v16, "unsignedLongLongValue");

              v34 = (void *)MEMORY[0x24BDD17C8];
              v18 = v14 + v17 - 1;
              v19 = v6;
              if (v15)
                v20 = v15;
              else
                v20 = CFSTR("???");
              objc_msgSend(v8, "objectForKey:", qword_254B9C358);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "objectForKey:", v28);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v20;
              v6 = v19;
              objc_msgSend(v34, "stringWithFormat:", CFSTR("%p - %p %@ %@  <%@> %@"), v14, v18, v26, v21, v13, v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "addObject:", v23);

              v5 = v31;
              v9 = v35;

            }
          }

          objc_autoreleasePoolPop(v9);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v5);
    }

    objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v3 = v27;
  }
  else
  {
    v24 = CFSTR("Binary Images not found");
  }

  return v24;
}

- (id)prettyPrintIOSurfaceInfo
{
  void *v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  int v14;
  unsigned int v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  NSArray *obj;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char __str[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if (self->_ioSurfaceInfo)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("IOSurface info for %@ [%d] (Count: %lu):\n"), self->_execName, self->_pid, -[NSArray count](self->_ioSurfaceInfo, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v3;
    objc_msgSend(v3, "appendString:", v4);

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = self->_ioSurfaceInfo;
    v29 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v29)
    {
      v27 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v35 != v27)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", qword_254B9C388);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", qword_254B9C398);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", qword_254B9C3A0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", qword_254B9C3B0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", qword_254B9C3A8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", qword_254B9C390);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v10, "unsignedIntValue");
          v14 = v13;
          v15 = HIBYTE(v13);
          if ((v13 & 0x80000000) != 0)
            v16 = __maskrune(HIBYTE(v13), 0x800uLL);
          else
            v16 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v15 + 60) & 0x800;
          v32 = v10;
          if (v16)
          {
            __str[0] = v15;
            __str[1] = BYTE2(v14);
            __str[2] = BYTE1(v14);
            __str[3] = v14;
            __str[4] = 0;
          }
          else
          {
            snprintf(__str, 5uLL, "%4d", v14);
          }
          v17 = (void *)MEMORY[0x24BDD17C8];
          v18 = objc_msgSend(v7, "intValue");
          v31 = v7;
          v19 = objc_msgSend(v8, "intValue");
          v30 = v8;
          v20 = objc_msgSend(v9, "intValue");
          objc_msgSend(v11, "unsignedLongLongValue");
          NSLocalizedFileSizeDescription();
          v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v22 = objc_msgSend(v21, "UTF8String");
          v23 = objc_retainAutorelease(v12);
          objc_msgSend(v17, "stringWithFormat:", CFSTR("  Surface ID: %08x,  dims: %4d x %4d,  fmt: %s,  size: %7s,  name: %-40.40s\n"), v18, v19, v20, __str, v22, objc_msgSend(v23, "UTF8String"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v28, "appendString:", v24);
        }
        v29 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v29);
    }

  }
  else
  {
    v28 = 0;
  }
  return v28;
}

- (id)prettyPrintIOAccelMemoryInfo
{
  NSArray *ioAccelMemoryInfo;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  char v16;
  const __CFString *v17;
  int v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  __CFString *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  id obj;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
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

  v62 = *MEMORY[0x24BDAC8D0];
  ioAccelMemoryInfo = self->_ioAccelMemoryInfo;
  if (ioAccelMemoryInfo && -[NSArray count](ioAccelMemoryInfo, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("IOAccel Memory info for %@ [%d] (Count: %lu):\n"), self->_execName, self->_pid, -[NSArray count](self->_ioAccelMemoryInfo, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v5);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s %s %s %s %s %s\n"), "Size      ", "Resident  ", "Dirty     ", "IOSurfaceID", "     State", "Description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v4;
    objc_msgSend(v4, "appendString:", v6);

    objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", 57, CFSTR(" "), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray sortedArrayUsingComparator:](self->_ioAccelMemoryInfo, "sortedArrayUsingComparator:", &unk_24CFC8670);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v40)
    {
      v38 = *(_QWORD *)v57;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v57 != v38)
            objc_enumerationMutation(obj);
          v49 = v8;
          v9 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v8);
          objc_msgSend(v9, "objectForKeyedSubscript:", qword_254B9C3D0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", qword_254B9C3E0);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", qword_254B9C3D8);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", qword_254B9C3B8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", qword_254B9C3E8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", qword_254B9C3F0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", qword_254B9C3C0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "unsignedLongLongValue"))
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v11, "unsignedLongLongValue"));
            v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v15 = CFSTR("-");
          }
          v48 = v11;
          v16 = objc_msgSend(v12, "BOOLValue");
          v17 = CFSTR("Wired");
          if ((v16 & 1) == 0)
          {
            v18 = objc_msgSend(v13, "BOOLValue");
            v17 = CFSTR("Normal");
            if (v18)
              v17 = CFSTR("Purgeable");
          }
          v45 = (__CFString *)v17;
          v46 = v13;
          v47 = v12;
          objc_msgSend(MEMORY[0x24BDD16A8], "string");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          v20 = v14;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v53;
            v24 = 1;
            do
            {
              v25 = 0;
              do
              {
                if (*(_QWORD *)v53 != v23)
                  objc_enumerationMutation(v20);
                v26 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v25);
                if ((v24 & 1) == 0)
                  objc_msgSend(v19, "appendString:", v7);
                objc_msgSend(v19, "appendString:", v26);
                v24 = 0;
                ++v25;
              }
              while (v22 != v25);
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
              v24 = 0;
            }
            while (v22);
          }

          v43 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v10, "unsignedLongLongValue");
          NSLocalizedFileSizeDescription();
          v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v41 = objc_msgSend(v42, "UTF8String");
          objc_msgSend(v51, "unsignedLongLongValue");
          NSLocalizedFileSizeDescription();
          v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v44 = v10;
          v28 = objc_msgSend(v27, "UTF8String");
          objc_msgSend(v50, "unsignedLongLongValue");
          NSLocalizedFileSizeDescription();
          v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v30 = objc_msgSend(v29, "UTF8String");
          v31 = objc_retainAutorelease(v15);
          v32 = -[__CFString UTF8String](v31, "UTF8String");
          v33 = -[__CFString UTF8String](v45, "UTF8String");
          v34 = objc_retainAutorelease(v19);
          objc_msgSend(v43, "stringWithFormat:", CFSTR("%-*s %-*s %-*s %*s %*s %s\n"), 10, v41, 10, v28, 10, v30, 11, v32, 10, v33, objc_msgSend(v34, "UTF8String"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "appendString:", v35);
          v8 = v49 + 1;
        }
        while (v49 + 1 != v40);
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      }
      while (v40);
    }

  }
  else
  {
    v39 = 0;
  }
  return v39;
}

- (id)createMetaDataDict
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *v8;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, qword_254B9C228);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_pid);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, qword_254B9C230);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_ppid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, qword_254B9C238);

  v7 = qword_254B9C248;
  v8 = self->_execPath;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, v7);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_execName, qword_254B9C240);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_bundleID, qword_254B9C250);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_coalitionBundleID, qword_254B9C258);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_upTime);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, qword_254B9C288);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dirtyFlags);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, qword_254B9C298);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_is64Bit);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, qword_254B9C290);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_limitValue);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, qword_254B9C270);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_exceptionType);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, qword_254B9C260);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_memgraphError, qword_254B9C268);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_hwModel, qword_254B9C278);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_osVersion, qword_254B9C280);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_ledgerPhysFootprint);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, qword_254B9C2C0);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_ledgerPhysFootprintPeak);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, qword_254B9C2C8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_ledgerInternal);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, qword_254B9C2D0);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_ledgerInternalCompressed);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, qword_254B9C2D8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_ledgerAlternateAccounting);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, qword_254B9C2E0);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_ledgerAlternateAccountingCompressed);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, qword_254B9C2E8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_ledgerPurgeableNonvolatile);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, qword_254B9C2F0);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_ledgerPurgeableNonvolatileCompressed);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, qword_254B9C2F8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_ledgerIOKitMapped);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, qword_254B9C308);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_ledgerPageTable);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, qword_254B9C300);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_ledgerWiredMem);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, qword_254B9C310);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_ledgerNetworkNonvolatile);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, qword_254B9C318);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_ledgerNetworkNonvolatileCompressed);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, qword_254B9C320);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_footprintOutput, qword_254B9C2B8);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_executionStack, qword_254B9C2A0);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_osLogs, qword_254B9C2A8);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_ioSurfaceInfo, qword_254B9C328);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_ioAccelMemoryInfo, qword_254B9C330);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_ioAccelMemoryInfoErrors, qword_254B9C338);
  objc_storeStrong((id *)&self->_cachedMetaDataDict, v3);

  return v3;
}

- (id)createLiteMetaDataDict
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_execName, qword_254B9C240);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_bundleID, qword_254B9C250);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_ledgerPhysFootprint);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, qword_254B9C2C0);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_ledgerPhysFootprintPeak);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, qword_254B9C2C8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_exceptionType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, qword_254B9C260);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isMSLEnabled);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, qword_254B9C2B0);

  return v3;
}

- (BOOL)saveLogFileWithHandle:(id)a3 error:(id *)a4
{
  return -[MemoryResourceException _saveLogFileWithHandle:error:](self, "_saveLogFileWithHandle:error:", a3, a4) == 0;
}

- (int64_t)_saveLogFileWithHandle:(id)a3 error:(id *)a4
{
  id v6;
  VMUProcessObjectGraph *memoryGraph;
  void *v8;
  id v9;
  int64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint8_t buf[8];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    memoryGraph = self->_memoryGraph;
    if (memoryGraph)
    {
      -[VMUProcessObjectGraph plistRepresentationWithOptions:](memoryGraph, "plistRepresentationWithOptions:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v8, 1, 0, a4);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v9)
          {
            v10 = 0;
LABEL_17:
            -[MemoryResourceException createMetaDataDict](self, "createMetaDataDict");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, qword_254B9C220);

            objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v9, 200, 0, a4);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
              objc_msgSend(v6, "writeData:", v14);
            else
              v10 = 2;

            goto LABEL_21;
          }
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error converting serialized plist data to an NSDictionary object!", buf, 2u);
          }

        }
LABEL_16:
        v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v10 = 1;
        goto LABEL_17;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error serializing memgraph to plist representation!", buf, 2u);
      }
    }
    v8 = 0;
    goto LABEL_16;
  }
  if (a4)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = MREErrorDomain;
    v17 = *MEMORY[0x24BDD0FC8];
    v18[0] = CFSTR("File handle is nil");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 2, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v10 = 2;
LABEL_21:

    goto LABEL_22;
  }
  v10 = 2;
LABEL_22:

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[MemoryResourceException releaseAnalyzedTask](self, "releaseAnalyzedTask");
  v3.receiver = self;
  v3.super_class = (Class)MemoryResourceException;
  -[MemoryResourceException dealloc](&v3, sel_dealloc);
}

+ (id)resourceExceptionFromTask:(unsigned int)a3 error:(id *)a4
{
  ipc_space_t *v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v11;
  MemoryResourceException *v12;
  task_suspension_token_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  mach_port_name_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int *v27;
  _BYTE *v28;
  uint64_t v29;
  void *v30;
  double v31;
  uint64_t v32;
  int v33;
  __darwin_time_t tv_sec;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  _BOOL4 v46;
  int v47;
  __darwin_suseconds_t v48;
  task_suspension_token_t suspend_token;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  _BOOL4 v55;
  timeval buffer[2];
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  if (a3 - 1 >= 0xFFFFFFFE)
  {
    if (a4)
    {
      v7 = (void *)MEMORY[0x24BDD1540];
      v8 = MREErrorDomain;
      v9 = 9;
      goto LABEL_7;
    }
    goto LABEL_12;
  }
  v6 = (ipc_space_t *)MEMORY[0x24BDAEC58];
  if (mach_port_mod_refs(*MEMORY[0x24BDAEC58], a3, 0, 1))
  {
    if (a4)
    {
      v7 = (void *)MEMORY[0x24BDD1540];
      v8 = MREErrorDomain;
      v9 = 3;
LABEL_7:
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, v9, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
    goto LABEL_12;
  }
  suspend_token = 0;
  if (task_suspend2(a3, &suspend_token))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", MREErrorDomain, 3, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    mach_port_mod_refs(*v6, a3, 0, -1);
    goto LABEL_12;
  }
  v12 = [MemoryResourceException alloc];
  if (v12)
  {
    v13 = suspend_token;
    v14 = -[MemoryResourceException init](v12, "init");
    v11 = v14;
    if (!v14)
      return (id)v11;
    *(_QWORD *)(v14 + 136) = 1;
    *(_DWORD *)(v14 + 20) = a3;
    *(_DWORD *)(v14 + 24) = v13;
    if (qword_253D9AA08 != -1)
      dispatch_once(&qword_253D9AA08, &unk_24CFC8700);
    objc_storeStrong((id *)(v11 + 120), (id)qword_253D9A9F8);
    objc_storeStrong((id *)(v11 + 128), (id)qword_253D9AA00);
    buffer[0].tv_sec = 0;
    *(_QWORD *)&buffer[0].tv_usec = 0;
    if (!gettimeofday(buffer, 0))
    {
      sub_213450730(buffer[0].tv_sec, buffer[0].tv_usec);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(v11 + 192);
      *(_QWORD *)(v11 + 192) = v15;

    }
    v17 = *(unsigned int *)(v11 + 20);
    buffer[0].tv_sec = MEMORY[0x24BDAC760];
    *(_QWORD *)&buffer[0].tv_usec = 3221225472;
    buffer[1].tv_sec = (__darwin_time_t)sub_213450AFC;
    *(_QWORD *)&buffer[1].tv_usec = &unk_24CFC85D0;
    v57 = v11;
    if (!sub_21344FF8C(v17, buffer))
    {
      v22 = *(_DWORD *)(v11 + 20);
      if (v22
        && !pid_for_task(v22, (int *)(v11 + 28))
        && !proc_get_dirty(*(_DWORD *)(v11 + 28), (uint32_t *)(v11 + 36)))
      {
        sub_2134505E8(*(_DWORD *)(v11 + 28));
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(v11 + 72);
        *(_QWORD *)(v11 + 72) = v23;

        objc_msgSend(*(id *)(v11 + 72), "lastPathComponent");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(v11 + 64);
        *(_QWORD *)(v11 + 64) = v25;

        v27 = (int *)sub_213450664(*(_DWORD *)(v11 + 28));
        if (v27)
        {
          v28 = v27;
          *(_DWORD *)(v11 + 32) = v27[140];
          sub_213450730(*(_QWORD *)v27, v27[2]);
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = *(void **)(v11 + 184);
          *(_QWORD *)(v11 + 184) = v29;

          objc_msgSend(*(id *)(v11 + 192), "timeIntervalSinceDate:", *(_QWORD *)(v11 + 184));
          v32 = (uint64_t)v31;
          if (v31 <= 0.0)
            v32 = -1;
          *(_QWORD *)(v11 + 112) = v32;
          *(_BYTE *)(v11 + 16) = (v28[32] & 4) != 0;
          free(v28);
        }
        *(_QWORD *)(v11 + 96) = 0;
        v33 = *(_DWORD *)(v11 + 28);
        v57 = 0;
        memset(buffer, 0, sizeof(buffer));
        if (proc_pidinfo(v33, 20, 1uLL, buffer, 40) == 40)
          tv_sec = buffer[0].tv_sec;
        else
          tv_sec = 1;
        *(_QWORD *)(v11 + 176) = tv_sec;
        sub_21345078C(tv_sec);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        sub_2134507F0(*(_DWORD *)(v11 + 32), *(void **)(v11 + 72), v35);
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = *(void **)(v11 + 80);
        *(_QWORD *)(v11 + 80) = v36;

        sub_21345090C(v35);
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = *(void **)(v11 + 88);
        *(_QWORD *)(v11 + 88) = v38;

        v40 = sub_213450990(*(unsigned int *)(v11 + 20), *(_DWORD *)(v11 + 28), *(void **)(v11 + 64));
        *(_BYTE *)(v11 + 17) = v40;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        {
          v48 = *(_DWORD *)(v11 + 28);
          LODWORD(buffer[0].tv_sec) = 136315650;
          *(__darwin_time_t *)((char *)&buffer[0].tv_sec + 4) = (__darwin_time_t)"-[MemoryResourceException extractTaskInfo]";
          *((_WORD *)&buffer[0].tv_usec + 2) = 1024;
          *(__darwin_suseconds_t *)((char *)&buffer[0].tv_usec + 6) = v48;
          WORD1(buffer[1].tv_sec) = 1024;
          HIDWORD(buffer[1].tv_sec) = v40;
          _os_log_debug_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s - for pid (%i), isMSLEnabled = %{BOOL}d", (uint8_t *)buffer, 0x18u);
        }
        *(_BYTE *)(v11 + 18) = 0;

      }
      return (id)v11;
    }
    objc_msgSend(*(id *)(v11 + 192), "timeIntervalSinceDate:", *(_QWORD *)(v11 + 184));
    v19 = (uint64_t)v18;
    if (v18 <= 0.0)
      v19 = -1;
    *(_QWORD *)(v11 + 112) = v19;
    v20 = *(_QWORD *)(v11 + 200);
    if (v20)
    {
      if (v20 >> 61 != 3)
        goto LABEL_41;
      v21 = (v20 >> 58) & 7;
      if (v21 == 1)
      {
        if ((v20 & 0xFF000000) != 0)
          v20 = 2;
        else
          v20 = 4;
        if ((*(_DWORD *)(v11 + 36) & 0xD) == 1)
          ++v20;
        goto LABEL_47;
      }
      if (v21 == 2)
        v20 = 6;
      else
LABEL_41:
        v20 = 7;
    }
LABEL_47:
    *(_QWORD *)(v11 + 96) = v20;
    sub_21345078C(*(_QWORD *)(v11 + 176));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2134507F0(*(_DWORD *)(v11 + 32), *(void **)(v11 + 72), v41);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = *(void **)(v11 + 80);
    *(_QWORD *)(v11 + 80) = v42;

    sub_21345090C(v41);
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = *(void **)(v11 + 88);
    *(_QWORD *)(v11 + 88) = v44;

    v46 = sub_213450990(*(unsigned int *)(v11 + 20), *(_DWORD *)(v11 + 28), *(void **)(v11 + 64));
    *(_BYTE *)(v11 + 17) = v46;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v47 = *(_DWORD *)(v11 + 28);
      *(_DWORD *)buf = 136315650;
      v51 = "-[MemoryResourceException extractCorpseInfo]";
      v52 = 1024;
      v53 = v47;
      v54 = 1024;
      v55 = v46;
      _os_log_debug_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s - for pid (%i), isMSLEnabled = %{BOOL}d", buf, 0x18u);
    }

    return (id)v11;
  }
LABEL_12:
  v11 = 0;
  return (id)v11;
}

- (void)populateAdditionalMetadataWithDiagnostics:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[MemoryResourceException _populateAddtionalMetadataWithOptions:timeoutSecs:](self, "_populateAddtionalMetadataWithOptions:timeoutSecs:", 0, 60);
  if (v3)
    MEMORY[0x24BEDD108](self, sel__generateMemgraphWithContentLevel_timeoutSecs_memgraphFailedReasonOut_);
}

- (void)_populateAddtionalMetadataWithOptions:(unint64_t)a3 timeoutSecs:(unint64_t)a4
{
  void *v4;
  void *v5;
  unint64_t ledgerPageTable;
  FPFootprint *v7;
  void *v8;
  FPFootprint *v9;
  void *v10;
  MREOutputFormatterInMemory *v11;
  id *p_isa;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  kern_return_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  unsigned int v24;
  void *i;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  CFUUIDBytes *CFUUIDBytes;
  const __CFUUID *v32;
  __CFString *v33;
  void *v34;
  _BOOL4 v35;
  uint64_t Name;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  uint64_t Path;
  void *v41;
  __CFString *v42;
  const __CFString *v43;
  uint64_t Architecture;
  const NXArchInfo *v45;
  __CFString *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  NSDictionary *v50;
  void *v51;
  NSDictionary *executionStack;
  void *v53;
  NSArray *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  NSArray *ioSurfaceInfo;
  dispatch_time_t v70;
  NSObject *v71;
  id v72;
  NSArray *ioAccelMemoryInfo;
  uint64_t v74;
  void *v75;
  NSObject *dsema;
  char v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  unsigned int v87;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  id v95;
  id v96;
  void *v97;
  void *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _QWORD v103[5];
  NSObject *v104;
  _BYTE v105[128];
  uint8_t buf[32];
  __int128 v107;
  void *v108;
  void **v109;
  uint64_t v110;
  uint64_t v111;
  mach_msg_type_number_t thread_info_outCnt[2];
  __int128 v113;
  uint64_t v114;
  uint64_t v115;

  v78 = a3;
  v115 = *MEMORY[0x24BDAC8D0];
  sub_2134500AC((uint64_t)self);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v79;
    _os_log_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Generating footprint for %@", buf, 0xCu);
  }
  if (self && self->_task)
  {
    +[FPFootprint setBreakDownPhysFootprint:](FPFootprint, "setBreakDownPhysFootprint:", 1);
    +[FPFootprint setSharingAnalysisDisabled:](FPFootprint, "setSharingAnalysisDisabled:", 1);
    +[FPFootprint setVmRegionInfoFlags:](FPFootprint, "setVmRegionInfoFlags:", 1);
    v4 = sub_2134563A4([FPCorpseProcess alloc], self->_task, self->_pid, self->_execName, self->_dirtyFlags, self->_procFlags);
    v5 = v4;
    if (v4)
    {
      ledgerPageTable = self->_ledgerPageTable;
      v113 = *(_OWORD *)&self->_ledgerPhysFootprint;
      *(_QWORD *)thread_info_outCnt = ledgerPageTable;
      v114 = 0;
      objc_msgSend(v4, "addLedgerData:count:", thread_info_outCnt, 4);
      v7 = [FPFootprint alloc];
      v108 = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v108, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[FPFootprint initWithProcesses:](v7, "initWithProcesses:", v8);

      -[FPFootprint gatherData:](v9, "gatherData:", 1);
      -[FPFootprint analyzeData](v9, "analyzeData");
      sub_21345E8AC();
      sub_2134616F0(v9, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v107 = 0u;
        memset(buf, 0, sizeof(buf));
        sub_21345F974((uint64_t)FPFootprint, v10, (uint64_t)buf);
        v11 = objc_alloc_init(MREOutputFormatterInMemory);
        p_isa = (id *)&v11->super.isa;
        if (v11)
        {
          -[MREOutputFormatterInMemory printSummaryCategories:total:hadErrors:](v11, "printSummaryCategories:total:hadErrors:", v10, buf, 0);
          objc_storeStrong((id *)&self->_footprintOutput, p_isa[2]);
        }

      }
    }

  }
  dsema = dispatch_semaphore_create(0);
  if ((v78 & 2) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v79;
      _os_log_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Starting IOAccel memory info collection (asynchronous) for %@", buf, 0xCu);
    }
    v13 = (void *)MEMORY[0x24BE51398];
    dispatch_get_global_queue(0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = MEMORY[0x24BDAC760];
    v103[1] = 3221225472;
    v103[2] = sub_2134541FC;
    v103[3] = &unk_24CFC8698;
    v103[4] = self;
    v104 = dsema;
    objc_msgSend(v13, "collectDataWithCompletionQueue:completionBlock:", v14, v103);

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v79;
    _os_log_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Generating backtrace info for %@", buf, 0xCu);
  }
  if (!self)
    goto LABEL_73;
  v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3418]), "initWithPID:task:processName:is64Bit:options:", self->_pid, self->_task, self->_execName, self->_is64Bit, 64);
  objc_msgSend(v89, "sampleAllThreadsOnce");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend(v86, "count");
  if (!v85)
    goto LABEL_72;
  objc_msgSend(v89, "symbolicator");
  if (!CSIsNull())
  {
    CSRetain();
    goto LABEL_25;
  }
  CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData();
  CSSymbolicatorCreateWithTaskFlagsAndNotification();
  if (!CSIsNull())
  {
LABEL_25:
    v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v85);
    v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v85);
    v96 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v15 = 0;
    v87 = -1;
    v81 = *MEMORY[0x24BE29FB0];
    v82 = *MEMORY[0x24BE29FA0];
    v80 = *MEMORY[0x24BE29FA8];
    while (1)
    {
      v90 = v15;
      objc_msgSend(v86, "objectAtIndexedSubscript:");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v94, "thread");
      v17 = v16;
      if (self->_crashedThreadId && (v87 & 0x80000000) != 0)
      {
        memset(buf, 0, 24);
        thread_info_outCnt[0] = 6;
        v18 = thread_info(v16, 4u, (thread_info_t)buf, thread_info_outCnt);
        v19 = *(_QWORD *)buf;
        if (v18)
          v19 = -1;
        if (v19 == self->_crashedThreadId)
          v20 = v90;
        else
          v20 = v87;
        v87 = v20;
      }
      objc_msgSend(v89, "threadNameForThread:", v17);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v92, "length");
      objc_msgSend(v89, "dispatchQueueNameForSerialNumber:", objc_msgSend(v94, "dispatchQueueSerialNumber"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v91, "length");
      v93 = objc_alloc_init(MEMORY[0x24BDD16A8]);
      if (v21)
      {
        objc_msgSend(v93, "appendString:", v92);
        if (v22)
        {
          objc_msgSend(v93, "appendString:", CFSTR("  "));
LABEL_38:
          objc_msgSend(v93, "appendFormat:", CFSTR("Dispatch queue: %@"), v91);
        }
      }
      else if (v22)
      {
        goto LABEL_38;
      }
      objc_msgSend(v84, "addObject:", v93);
      v23 = (uint64_t *)objc_msgSend(v94, "backtrace");
      v24 = objc_msgSend(v94, "backtraceLength");
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v24);
      for (i = (void *)objc_claimAutoreleasedReturnValue(); v24; --v24)
      {
        v26 = *v23;
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, qword_254B9C340);

        CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
        v29 = v96;
        v30 = v27;
        if ((CSIsNull() & 1) == 0)
        {
          CFUUIDBytes = (CFUUIDBytes *)CSSymbolOwnerGetCFUUIDBytes();
          if (CFUUIDBytes && (v32 = CFUUIDCreateFromUUIDBytes(0, *CFUUIDBytes)) != 0)
          {
            v33 = (__CFString *)CFUUIDCreateString(0, v32);
            CFRelease(v32);
            if (v33)
            {
              objc_msgSend(v30, "setObject:forKeyedSubscript:", v33, qword_254B9C360);
              objc_msgSend(v29, "objectForKeyedSubscript:", v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = v34 == 0;

              if (v35)
              {
                v95 = objc_alloc_init(MEMORY[0x24BDBCED8]);
                objc_msgSend(v95, "setObject:forKeyedSubscript:", v33, v82);
                objc_msgSend(v29, "setObject:forKeyedSubscript:", v95, v33);
                Name = CSSymbolOwnerGetName();
                if (Name)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", Name);
                  v37 = objc_claimAutoreleasedReturnValue();
                  v38 = (void *)v37;
                  if (v37)
                    v39 = (const __CFString *)v37;
                  else
                    v39 = CFSTR("nonprintable-binary");
                  objc_msgSend(v95, "setObject:forKeyedSubscript:", v39, v81);

                }
                Path = CSSymbolOwnerGetPath();
                if (Path)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", Path);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "stringByStandardizingPath");
                  v42 = (__CFString *)objc_claimAutoreleasedReturnValue();

                  if (v42)
                    v43 = v42;
                  else
                    v43 = CFSTR("nonprintable-path");
                  objc_msgSend(v95, "setObject:forKeyedSubscript:", v43, v80);

                }
                Architecture = CSSymbolOwnerGetArchitecture();
                v45 = NXGetArchInfoFromCpuType(Architecture, SHIDWORD(Architecture));
                if (v45 && v45->name)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
                  v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v46 = CFSTR("unknown-arch");
                }
                if (v46)
                  v47 = v46;
                else
                  v47 = CFSTR("nonprintable-arch");
                objc_msgSend(v95, "setObject:forKeyedSubscript:", v47, qword_254B9C358);
                *(_QWORD *)thread_info_outCnt = 0;
                *(_QWORD *)&v113 = thread_info_outCnt;
                *((_QWORD *)&v113 + 1) = 0x2020000000;
                v114 = 0;
                v108 = 0;
                v109 = &v108;
                v110 = 0x2020000000;
                v111 = 0;
                *(_QWORD *)buf = MEMORY[0x24BDAC760];
                *(_QWORD *)&buf[8] = 3221225472;
                *(_QWORD *)&buf[16] = sub_213455CD0;
                *(_QWORD *)&buf[24] = &unk_24CFC86C0;
                *(_QWORD *)&v107 = thread_info_outCnt;
                *((_QWORD *)&v107 + 1) = &v108;
                CSSymbolOwnerForeachSegment();
                if (*(_QWORD *)(v113 + 24) || v109[3])
                {
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v95, "setObject:forKeyedSubscript:", v48, CFSTR("StartAddress"));

                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", (char *)v109[3] - *(_QWORD *)(v113 + 24) + 1);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v95, "setObject:forKeyedSubscript:", v49, CFSTR("Size"));

                }
                _Block_object_dispose(&v108, 8);
                _Block_object_dispose(thread_info_outCnt, 8);

              }
            }
          }
          else
          {
            v33 = 0;
          }

        }
        objc_msgSend(i, "addObject:", v30);

        ++v23;
      }
      objc_msgSend(v83, "addObject:", i);

      v15 = v90 + 1;
      if (v90 + 1 == v85)
      {
        CSRelease();
        v50 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
        -[NSDictionary setObject:forKeyedSubscript:](v50, "setObject:forKeyedSubscript:", v83, qword_254B9C368);
        -[NSDictionary setObject:forKeyedSubscript:](v50, "setObject:forKeyedSubscript:", v84, qword_254B9C370);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v87);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v50, "setObject:forKeyedSubscript:", v51, qword_254B9C378);

        -[NSDictionary setObject:forKeyedSubscript:](v50, "setObject:forKeyedSubscript:", v96, qword_254B9C380);
        executionStack = self->_executionStack;
        self->_executionStack = v50;

        goto LABEL_72;
      }
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to create symbolicator", buf, 2u);
  }
LABEL_72:

LABEL_73:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v79;
    _os_log_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Collecting IOSurface info for %@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD8DF0], "surfaceDescriptions");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_pid);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "objectForKeyedSubscript:", v53);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  if (v98)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v98, "count"));
    v54 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    v55 = v98;
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v99, v105, 16);
    if (v56)
    {
      v57 = *(_QWORD *)v100;
      do
      {
        for (j = 0; j != v56; ++j)
        {
          if (*(_QWORD *)v100 != v57)
            objc_enumerationMutation(v55);
          v59 = *(id *)(*((_QWORD *)&v99 + 1) + 8 * j);
          objc_opt_self();
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v59, "surfaceID"));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "setObject:forKeyedSubscript:", v61, qword_254B9C388);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v59, "pixelFormat"));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "setObject:forKeyedSubscript:", v62, qword_254B9C3B0);

          objc_msgSend(v59, "name");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "setObject:forKeyedSubscript:", v63, qword_254B9C390);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v59, "width"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "setObject:forKeyedSubscript:", v64, qword_254B9C398);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v59, "height"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "setObject:forKeyedSubscript:", v65, qword_254B9C3A0);

          v66 = (void *)MEMORY[0x24BDD16E0];
          v67 = objc_msgSend(v59, "allocationSize");

          objc_msgSend(v66, "numberWithUnsignedLongLong:", v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "setObject:forKeyedSubscript:", v68, qword_254B9C3A8);

          -[NSArray addObject:](v54, "addObject:", v60);
        }
        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v99, v105, 16);
      }
      while (v56);
    }

    ioSurfaceInfo = self->_ioSurfaceInfo;
    self->_ioSurfaceInfo = v54;

  }
  if ((v78 & 2) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Waiting for IOAccel memory info collection to finish...", buf, 2u);
    }
    v70 = dispatch_time(0, 1000000000 * a4);
    dispatch_semaphore_wait(dsema, v70);
    v71 = MEMORY[0x24BDACB70];
    v72 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      ioAccelMemoryInfo = self->_ioAccelMemoryInfo;
      if (ioAccelMemoryInfo)
        v74 = -[NSArray count](ioAccelMemoryInfo, "count");
      else
        v74 = 0;
      sub_2134500AC((uint64_t)self);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v74;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v75;
      _os_log_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IOAccel memory info collection complete. Found a total of %lu entries for %@", buf, 0x16u);

    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[MemoryResourceException _populateAddtionalMetadataWithOptions:timeoutSecs:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v79;
    _os_log_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Finished %s for %@", buf, 0x16u);
  }

}

- (void)_generateMemgraphWithContentLevel:(unsigned int)a3 timeoutSecs:(unint64_t)a4 memgraphFailedReasonOut:(unint64_t *)a5
{
  uint64_t v6;
  char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  char *v12;
  uint64_t v13;

  v6 = *(_QWORD *)&a3;
  v13 = *MEMORY[0x24BDAC8D0];
  sub_2134500AC((uint64_t)self);
  v8 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Generating memgraph for %@", (uint8_t *)&v9, 0xCu);
  }
  -[MemoryResourceException generateMemoryGraphWithContentLevel:memgraphFailedReasonOut:](self, "generateMemoryGraphWithContentLevel:memgraphFailedReasonOut:", v6, a5);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[MemoryResourceException _generateMemgraphWithContentLevel:timeoutSecs:memgraphFailedReasonOut:]";
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Finished %s for %@", (uint8_t *)&v9, 0x16u);
  }

}

- (void)releaseAnalyzedTask
{
  task_suspension_token_t suspensionToken;
  mach_port_name_t task;

  suspensionToken = self->_suspensionToken;
  if (suspensionToken)
  {
    task_resume2(suspensionToken);
    self->_suspensionToken = 0;
  }
  task = self->_task;
  if (task)
  {
    mach_port_mod_refs(*MEMORY[0x24BDAEC58], task, 0, -1);
    self->_task = 0;
  }
}

- (BOOL)isFirstParty
{
  NSString *execName;
  NSString *bundleID;
  const __CFString *v6;

  execName = self->_execName;
  if (!execName || -[NSString hasPrefix:](execName, "hasPrefix:", CFSTR("com.apple.WebKit.")))
    return 0;
  bundleID = self->_bundleID;
  if (bundleID)
  {
    v6 = CFSTR("com.apple.");
  }
  else
  {
    bundleID = self->_execPath;
    if (!bundleID)
      return 0;
    v6 = CFSTR("/System/");
  }
  return -[NSString hasPrefix:](bundleID, "hasPrefix:", v6);
}

+ (id)resourceExceptionFromLogFileHandle:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MemoryResourceException *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  id v18;
  uint64_t v19;
  NSString *execName;
  uint64_t v21;
  NSString *execPath;
  void *v23;
  __CFString *v24;
  void *v25;
  const __CFString **v26;
  uint64_t *v27;
  void *v28;
  objc_super v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "readDataToEndOfFileAndReturnError:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v7, 0, 0, a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v11 = 0;
LABEL_27:

          goto LABEL_28;
        }
        v14 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(*a4, "localizedDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("File is malformed - %@"), v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = (void *)MEMORY[0x24BDD1540];
        v17 = MREErrorDomain;
        v35 = *MEMORY[0x24BDD0FC8];
        v36 = v9;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 1, v10);
        v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

        goto LABEL_27;
      }
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3410]), "initWithPlistRepresentation:", v7);
      objc_msgSend(v8, "objectForKeyedSubscript:", qword_254B9C220);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
LABEL_25:
            v11 = 0;
            goto LABEL_26;
          }
          v23 = (void *)MEMORY[0x24BDD1540];
          v24 = MREErrorDomain;
          v33 = *MEMORY[0x24BDD0FC8];
          v34 = CFSTR("Metadata is malformed");
          v25 = (void *)MEMORY[0x24BDBCE70];
          v26 = &v34;
          v27 = &v33;
LABEL_24:
          objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 1, v28);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_25;
        }
        v11 = (MemoryResourceException *)sub_213454918((id *)[MemoryResourceException alloc], v10, v9, a4);
      }
      else
      {
        v11 = [MemoryResourceException alloc];
        v18 = v9;
        if (v11)
        {
          v30.receiver = v11;
          v30.super_class = (Class)MemoryResourceException;
          v11 = objc_msgSendSuper2(&v30, sel_init);
          if (v11)
          {
            objc_msgSend(v18, "processName");
            v19 = objc_claimAutoreleasedReturnValue();
            execName = v11->_execName;
            v11->_execName = (NSString *)v19;

            v11->_pid = objc_msgSend(v18, "pid");
            objc_msgSend(v18, "executablePath");
            v21 = objc_claimAutoreleasedReturnValue();
            execPath = v11->_execPath;
            v11->_execPath = (NSString *)v21;

            v11->_upTime = -1;
            *(_OWORD *)&v11->_exceptionType = xmmword_2134672D0;
            v11->_ledgerPhysFootprint = objc_msgSend(v18, "physicalFootprint");
            v11->_ledgerPhysFootprintPeak = objc_msgSend(v18, "physicalFootprintPeak");
            objc_storeStrong((id *)&v11->_memoryGraph, v9);
            v11->_task = 0;
          }
        }

      }
      if (!a4 || v11)
        goto LABEL_26;
      if (*a4)
        goto LABEL_25;
      v23 = (void *)MEMORY[0x24BDD1540];
      v24 = MREErrorDomain;
      v31 = *MEMORY[0x24BDD0FC8];
      v32 = CFSTR("Unable to analyze diagnostic");
      v25 = (void *)MEMORY[0x24BDBCE70];
      v26 = &v32;
      v27 = &v31;
      goto LABEL_24;
    }
    v11 = 0;
LABEL_28:

    goto LABEL_29;
  }
  if (a4)
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = MREErrorDomain;
    v37 = *MEMORY[0x24BDD0FC8];
    v38[0] = CFSTR("File does not exist");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 11, v7);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  v11 = 0;
LABEL_29:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  VMUProcessObjectGraph *v5;
  id *v6;

  -[MemoryResourceException createMetaDataDict](self, "createMetaDataDict", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self->_memoryGraph;
  v6 = sub_213454918((id *)[MemoryResourceException alloc], v4, v5, 0);

  return v6;
}

+ (void)extractExecNameAndBundleIDMinimal:(unsigned int)a3 execNameOut:(id *)a4 bundleIDOut:(id *)a5
{
  void *v7;
  _DWORD *v8;
  int v9;
  unint64_t v10;
  void *v11;
  int x;
  _OWORD buffer[2];
  uint64_t v14;

  *a4 = 0;
  *a5 = 0;
  x = 0;
  if (!pid_for_task(a3, &x))
  {
    sub_2134505E8(x);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v8 = sub_213450664(x);
    if (v8)
    {
      v9 = v8[140];
      v14 = 0;
      memset(buffer, 0, sizeof(buffer));
      if (proc_pidinfo(x, 20, 1uLL, buffer, 40) == 40)
        v10 = *(_QWORD *)&buffer[0];
      else
        v10 = 1;
      sub_21345078C(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      sub_2134507F0(v9, v7, v11);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
}

- (VMUProcessObjectGraph)memoryGraph
{
  return (VMUProcessObjectGraph *)objc_getProperty(self, a2, 48, 1);
}

- (NSDictionary)executionStack
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)execName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)execPath
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)coalitionBundleID
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (int64_t)exceptionType
{
  return self->_exceptionType;
}

- (unint64_t)limitValue
{
  return self->_limitValue;
}

- (int64_t)upTime
{
  return self->_upTime;
}

- (BOOL)is64Bit
{
  return self->_is64Bit;
}

- (NSString)hwModel
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSDictionary)osVersion
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (BOOL)isMSLEnabled
{
  return self->_isMSLEnabled;
}

- (void)setIsMSLEnabled:(BOOL)a3
{
  self->_isMSLEnabled = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (unsigned)task
{
  return self->_task;
}

- (unsigned)suspensionToken
{
  return self->_suspensionToken;
}

- (NSDictionary)footprintOutput
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (NSArray)ioSurfaceInfo
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (NSArray)ioAccelMemoryInfo
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (NSArray)ioAccelMemoryInfoErrors
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (int)pid
{
  return self->_pid;
}

- (int)ppid
{
  return self->_ppid;
}

- (unint64_t)cid
{
  return self->_cid;
}

- (NSDate)startTime
{
  return (NSDate *)objc_getProperty(self, a2, 184, 1);
}

- (NSDate)currentTime
{
  return (NSDate *)objc_getProperty(self, a2, 192, 1);
}

- (unsigned)dirtyFlags
{
  return self->_dirtyFlags;
}

- (unsigned)procFlags
{
  return self->_procFlags;
}

- (int64_t)exceptionCode0
{
  return self->_exceptionCode0;
}

- (unint64_t)crashedThreadId
{
  return self->_crashedThreadId;
}

- (unint64_t)ledgerPhysFootprint
{
  return self->_ledgerPhysFootprint;
}

- (unint64_t)ledgerPhysFootprintPeak
{
  return self->_ledgerPhysFootprintPeak;
}

- (unint64_t)ledgerInternal
{
  return self->_ledgerInternal;
}

- (unint64_t)ledgerInternalCompressed
{
  return self->_ledgerInternalCompressed;
}

- (unint64_t)ledgerAlternateAccounting
{
  return self->_ledgerAlternateAccounting;
}

- (unint64_t)ledgerAlternateAccountingCompressed
{
  return self->_ledgerAlternateAccountingCompressed;
}

- (unint64_t)ledgerPurgeableNonvolatile
{
  return self->_ledgerPurgeableNonvolatile;
}

- (unint64_t)ledgerPurgeableNonvolatileCompressed
{
  return self->_ledgerPurgeableNonvolatileCompressed;
}

- (unint64_t)ledgerPageTable
{
  return self->_ledgerPageTable;
}

- (unint64_t)ledgerIOKitMapped
{
  return self->_ledgerIOKitMapped;
}

- (unint64_t)ledgerWiredMem
{
  return self->_ledgerWiredMem;
}

- (unint64_t)ledgerNetworkNonvolatile
{
  return self->_ledgerNetworkNonvolatile;
}

- (unint64_t)ledgerNetworkNonvolatileCompressed
{
  return self->_ledgerNetworkNonvolatileCompressed;
}

- (NSArray)osLogs
{
  return (NSArray *)objc_getProperty(self, a2, 320, 1);
}

- (NSDictionary)cachedMetaDataDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 328, 1);
}

- (NSString)memgraphError
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (void)setMemgraphError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (NSString)liteDiagFilePath
{
  return (NSString *)objc_getProperty(self, a2, 344, 1);
}

- (void)setLiteDiagFilePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (BOOL)gcoreCapture
{
  return self->_gcoreCapture;
}

- (void)setGcoreCapture:(BOOL)a3
{
  self->_gcoreCapture = a3;
}

- (NSString)gcoreFilePath
{
  return (NSString *)objc_getProperty(self, a2, 352, 1);
}

- (void)setGcoreFilePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gcoreFilePath, 0);
  objc_storeStrong((id *)&self->_liteDiagFilePath, 0);
  objc_storeStrong((id *)&self->_memgraphError, 0);
  objc_storeStrong((id *)&self->_cachedMetaDataDict, 0);
  objc_storeStrong((id *)&self->_osLogs, 0);
  objc_storeStrong((id *)&self->_currentTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_ioAccelMemoryInfoErrors, 0);
  objc_storeStrong((id *)&self->_ioAccelMemoryInfo, 0);
  objc_storeStrong((id *)&self->_ioSurfaceInfo, 0);
  objc_storeStrong((id *)&self->_footprintOutput, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_hwModel, 0);
  objc_storeStrong((id *)&self->_coalitionBundleID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_execPath, 0);
  objc_storeStrong((id *)&self->_execName, 0);
  objc_storeStrong((id *)&self->_executionStack, 0);
  objc_storeStrong((id *)&self->_memoryGraph, 0);
}

@end
