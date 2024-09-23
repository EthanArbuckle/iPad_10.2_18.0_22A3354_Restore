@implementation BRCThrottle

- (BRCThrottle)initWithName:(id)a3 andParameters:(id)a4
{
  BRCThrottle *v4;
  uint64_t v5;
  NSMutableDictionary *retryCounters;
  BRCMinHeap *v7;
  BRCMinHeap *retryHeap;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BRCThrottle;
  v4 = -[BRCThrottleBase initWithName:andParameters:](&v10, sel_initWithName_andParameters_, a3, a4);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 32);
    retryCounters = v4->_retryCounters;
    v4->_retryCounters = (NSMutableDictionary *)v5;

    v7 = -[BRCMinHeap initWithComparator:]([BRCMinHeap alloc], "initWithComparator:", &__block_literal_global_20);
    retryHeap = v4->_retryHeap;
    v4->_retryHeap = v7;

  }
  return v4;
}

uint64_t __42__BRCThrottle_initWithName_andParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "latestRetry");
  v6 = objc_msgSend(v4, "latestRetry");

  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

- (void)_cleanupStaleCounters:(int64_t)a3
{
  int64_t nsecsBeforeForgettingCounter;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *retryCounters;
  void *v9;
  uint64_t v10;
  id v11;

  nsecsBeforeForgettingCounter = self->super._nsecsBeforeForgettingCounter;
  -[BRCMinHeap firstObject](self->_retryHeap, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = a3 - nsecsBeforeForgettingCounter;
    while (1)
    {
      v11 = v6;
      if (objc_msgSend(v6, "latestRetry") >= v7
        && -[BRCMinHeap count](self->_retryHeap, "count") <= self->super._maximumElementCount)
      {
        break;
      }
      -[BRCMinHeap removeFirstObject](self->_retryHeap, "removeFirstObject");
      retryCounters = self->_retryCounters;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v11, "throttleHash"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](retryCounters, "removeObjectForKey:", v9);

      -[BRCMinHeap firstObject](self->_retryHeap, "firstObject");
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v10;
      if (!v10)
        goto LABEL_9;
    }
    v6 = v11;
LABEL_9:

  }
}

- (void)incrementRetryCount:(int64_t)a3
{
  void *v4;
  BRCRetryCounter *v5;
  BRCRetryCounter *v6;
  BRCThrottle *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](obj->_retryCounters, "objectForKeyedSubscript:", v4);
  v5 = (BRCRetryCounter *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    -[BRCRetryCounter incrementRetry](v5, "incrementRetry");
    -[BRCMinHeap objectWeightChanged:](obj->_retryHeap, "objectWeightChanged:", v6);
  }
  else
  {
    v6 = -[BRCRetryCounter initWithThrottleHash:]([BRCRetryCounter alloc], "initWithThrottleHash:", a3);
    -[NSMutableDictionary setObject:forKeyedSubscript:](obj->_retryCounters, "setObject:forKeyedSubscript:", v6, v4);
    -[BRCMinHeap addObject:](obj->_retryHeap, "addObject:", v6);
  }

  objc_sync_exit(obj);
}

- (int64_t)nsecsToNextRetry:(int64_t)a3 now:(int64_t)a4 increment:(BOOL)a5
{
  _BOOL4 v5;
  BRCThrottle *v8;
  NSMutableDictionary *retryCounters;
  void *v10;
  void *v11;
  int64_t v12;
  void *v14;
  NSObject *v15;
  NSString *name;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSString *v21;
  int v22;
  uint8_t buf[4];
  NSString *v24;
  __int16 v25;
  int64_t v26;
  __int16 v27;
  _BYTE v28[14];
  __int16 v29;
  void *v30;
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x24BDAC8D0];
  v8 = self;
  objc_sync_enter(v8);
  -[BRCThrottle _cleanupStaleCounters:](v8, "_cleanupStaleCounters:", a4);
  retryCounters = v8->_retryCounters;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](retryCounters, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "schedule");
  v22 = objc_msgSend(v11, "retryCount");
  objc_sync_exit(v8);

  v12 = -[BRCThrottleBase nsecsToNextRetry:retryCount:now:](v8, "nsecsToNextRetry:retryCount:now:", objc_msgSend(v11, "latestRetry"), &v22, a4);
  LODWORD(v10) = v22;
  if (v10 > objc_msgSend(v11, "retryCount") && v5)
    -[BRCThrottle incrementRetryCount:](v8, "incrementRetryCount:", a3);
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      name = v8->super._name;
      *(_DWORD *)buf = 138413058;
      v24 = name;
      v25 = 2048;
      v26 = a3;
      v27 = 1024;
      *(_DWORD *)v28 = v22;
      *(_WORD *)&v28[4] = 2112;
      *(_QWORD *)&v28[6] = v14;
      v17 = "[DEBUG] gave up on %@/%llx (retry-count:%u)%@";
      v18 = v15;
      v19 = 38;
LABEL_14:
      _os_log_debug_impl(&dword_230455000, v18, OS_LOG_TYPE_DEBUG, v17, buf, v19);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (v12 >= 100000000)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v21 = v8->super._name;
      *(_DWORD *)buf = 138413314;
      v24 = v21;
      v25 = 2048;
      v26 = a3;
      v27 = 2048;
      *(_QWORD *)v28 = v12 / 0xF4240uLL;
      *(_WORD *)&v28[8] = 1024;
      *(_DWORD *)&v28[10] = v22;
      v29 = 2112;
      v30 = v14;
      v17 = "[DEBUG] backing off %@/%llx for %llu milliseconds (retry-count:%u)%@";
      v18 = v15;
      v19 = 48;
      goto LABEL_14;
    }
LABEL_11:

  }
  return v12;
}

- (void)reset
{
  BRCThrottle *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BRCRetryCounter *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  -[BRCMinHeap removeAllObjects](v2->_retryHeap, "removeAllObjects");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMutableDictionary allKeys](v2->_retryCounters, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        v8 = -[BRCRetryCounter initWithThrottleHash:]([BRCRetryCounter alloc], "initWithThrottleHash:", objc_msgSend(v7, "unsignedLongLongValue"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_retryCounters, "setObject:forKeyedSubscript:", v8, v7);
        -[BRCMinHeap addObject:](v2->_retryHeap, "addObject:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

+ (int64_t)throttleHashFormat:(id)a3
{
  id v3;
  id v4;
  unsigned __int8 *v5;
  int v6;
  unsigned __int8 *v7;
  uint64_t i;
  uint64_t j;
  int v10;
  const char **v11;
  const char *v12;
  const char **v13;
  CC_LONG v14;
  const char **v15;
  const char **v16;
  const char **v17;
  const char *v18;
  id *v19;
  const char *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  unsigned __int8 *v25;
  int v26;
  int v27;
  int64_t v28;
  CC_SHA1_CTX c;
  const char *v31;
  const char *v32;
  const char *v33;
  int v34;
  const char **v35;
  _BYTE buf[18];
  uint64_t v37;
  uint64_t v38;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v35 = 0;
  v34 = 0;
  v32 = 0;
  v33 = 0;
  v31 = 0;
  memset(&c, 0, sizeof(c));
  CC_SHA1_Init(&c);
  v4 = objc_retainAutorelease(v3);
  v5 = (unsigned __int8 *)objc_msgSend(v4, "UTF8String");
  v35 = (const char **)&v38;
  v6 = *v5;
  if (*v5)
  {
    v7 = v5;
    while (1)
    {
      for (i = 0; v6; v6 = v7[++i])
      {
        if (v6 == 37)
          break;
      }
      if (i)
      {
        CC_SHA1_Update(&c, v7, i);
        v6 = v7[i];
      }
      if (!v6)
        goto LABEL_40;
      for (j = 0; ; ++j)
      {
        v10 = (char)v7[i + 1 + j];
        if (v10 != 108)
          break;
      }
      if (v10 > 111)
      {
        switch(v7[i + 1 + j])
        {
          case 'p':
            v11 = v35++;
            v31 = *v11;
            v12 = (const char *)&v31;
            goto LABEL_23;
          case 's':
            v17 = v35++;
            v18 = *v17;
            goto LABEL_26;
          case 'u':
          case 'x':
            goto LABEL_18;
          default:
            goto LABEL_31;
        }
      }
      if (v10 == 64)
      {
        v19 = (id *)v35++;
        v18 = (const char *)objc_msgSend(objc_retainAutorelease(*v19), "UTF8String");
LABEL_26:
        if (v18)
          v20 = v18;
        else
          v20 = "NULL";
        if (v18)
          v14 = strlen(v18);
        else
          v14 = 4;
        v12 = v20;
        goto LABEL_38;
      }
      if (v10 != 100 && v10 != 105)
      {
LABEL_31:
        brc_bread_crumbs();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v21;
          _os_log_fault_impl(&dword_230455000, v22, OS_LOG_TYPE_FAULT, "[CRIT] API MISUSE: unhandled format specifier%@", buf, 0xCu);
        }

        brc_bread_crumbs();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
        {
          v27 = (char)v7[i + 2 + j];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v27;
          *(_WORD *)&buf[8] = 2112;
          *(_QWORD *)&buf[10] = v23;
          _os_log_error_impl(&dword_230455000, v24, (os_log_type_t)0x90u, "[ERROR] unhandled format specifier %%%c\n%@", buf, 0x12u);
        }

        goto LABEL_39;
      }
LABEL_18:
      if ((_DWORD)j == 1)
        break;
      if ((_DWORD)j)
      {
        v16 = v35++;
        v32 = *v16;
        v12 = (const char *)&v32;
        goto LABEL_23;
      }
      v13 = v35++;
      v34 = *(_DWORD *)v13;
      v12 = (const char *)&v34;
      v14 = 4;
LABEL_38:
      CC_SHA1_Update(&c, v12, v14);
LABEL_39:
      v25 = &v7[i + j];
      v26 = v25[2];
      v7 = v25 + 2;
      v6 = v26;
      if (!v26)
        goto LABEL_40;
    }
    v15 = v35++;
    v33 = *v15;
    v12 = (const char *)&v33;
LABEL_23:
    v14 = 8;
    goto LABEL_38;
  }
LABEL_40:
  CC_SHA1_Final(buf, &c);
  v28 = *(_QWORD *)buf;

  return v28;
}

+ (int64_t)throttleHashBytes:(void *)a3 length:(unint64_t)a4
{
  CC_LONG v4;
  CC_SHA1_CTX v7;
  unsigned __int8 md[24];
  uint64_t v9;

  v4 = a4;
  v9 = *MEMORY[0x24BDAC8D0];
  memset(&v7, 0, sizeof(v7));
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, a3, v4);
  CC_SHA1_Final(md, &v7);
  return *(_QWORD *)md;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryHeap, 0);
  objc_storeStrong((id *)&self->_retryCounters, 0);
}

@end
