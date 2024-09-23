@implementation RPConnectionMetrics

- (RPConnectionMetrics)init
{
  RPConnectionMetrics *v2;
  RPConnectionMetrics *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *reportQueue;
  NSMutableDictionary *v8;
  NSMutableDictionary *rttMetrics;
  dispatch_source_t v10;
  OS_dispatch_source *reportTimer;
  NSObject *v12;
  RPConnectionMetrics *v13;
  RPConnectionMetrics *v14;
  _QWORD handler[4];
  RPConnectionMetrics *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)RPConnectionMetrics;
  v2 = -[RPConnectionMetrics init](&v18, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_reportLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = dispatch_queue_create("RPConnectionMetrics", v5);
    reportQueue = v3->_reportQueue;
    v3->_reportQueue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    rttMetrics = v3->_rttMetrics;
    v3->_rttMetrics = v8;

    v10 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v3->_reportQueue);
    reportTimer = v3->_reportTimer;
    v3->_reportTimer = (OS_dispatch_source *)v10;

    v12 = v3->_reportTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __27__RPConnectionMetrics_init__block_invoke;
    handler[3] = &unk_1E5F4EC60;
    v13 = v3;
    v17 = v13;
    dispatch_source_set_event_handler(v12, handler);
    CUDispatchTimerSet();
    dispatch_resume((dispatch_object_t)v3->_reportTimer);
    v13->_eventCount = 0;
    v14 = v13;

  }
  return v3;
}

uint64_t __27__RPConnectionMetrics_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reportMetrics");
}

+ (id)sharedMetrics
{
  if (sharedMetrics_sOnce != -1)
    dispatch_once(&sharedMetrics_sOnce, &__block_literal_global_2);
  return (id)gMetrics;
}

void __36__RPConnectionMetrics_sharedMetrics__block_invoke()
{
  RPConnectionMetrics *v0;
  void *v1;

  v0 = objc_alloc_init(RPConnectionMetrics);
  v1 = (void *)gMetrics;
  gMetrics = (uint64_t)v0;

}

- (unsigned)lengthToBucketIndex:(unint64_t)a3
{
  char v3;
  unsigned __int8 v4;

  if (a3 < 0x7D001)
    v3 = 3;
  else
    v3 = 4;
  if (a3 <= 0x19000)
    v3 = 2;
  if (a3 >= 0x2801)
    v4 = v3;
  else
    v4 = 1;
  if (a3 < 0x401)
    return 0;
  return v4;
}

- (unsigned)linkTypeToBucketIndex:(int)a3
{
  char v3;
  unsigned __int8 v4;

  if ((a3 & 0xFFFFFFFE) == 8)
    v3 = 3;
  else
    v3 = 4;
  if (a3 == 6)
    v3 = 2;
  if (a3 == 4)
    v4 = 1;
  else
    v4 = v3;
  if ((a3 - 1) >= 2)
    return v4;
  else
    return 0;
}

- (unsigned)rttToBucketIndex:(unint64_t)a3
{
  char v3;
  char v4;
  char v5;
  unsigned __int8 v6;

  if (a3 < 0x1F5)
    v3 = 4;
  else
    v3 = 5;
  if (a3 >= 0xC9)
    v4 = v3;
  else
    v4 = 3;
  if (a3 >= 0x65)
    v5 = v4;
  else
    v5 = 2;
  if (a3 >= 0x33)
    v6 = v5;
  else
    v6 = 1;
  if (a3 < 0xB)
    return 0;
  return v6;
}

- (void)logConnectionWithDeviceModelFrom:(id)a3 deviceModelTo:(id)a4 error:(id)a5 initiator:(id)a6 isOnDemand:(BOOL)a7 isStereoPair:(BOOL)a8 lifetime:(unint64_t)a9 linkType:(int)a10
{
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _BOOL4 v29;
  os_unfair_lock_t lock;
  _QWORD v31[8];
  _QWORD v32[10];

  v29 = a8;
  v10 = a7;
  v32[8] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = (__CFString *)a6;
  lock = &self->_reportLock;
  os_unfair_lock_lock(&self->_reportLock);
  if (v17)
  {
    v28 = v17;
    NSAppendPrintF();
    v19 = (__CFString *)0;
  }
  else
  {
    v19 = CFSTR("NoError");
  }
  if (v18)
    v20 = v18;
  else
    v20 = CFSTR("Uknown");
  v21 = -[RPConnectionMetrics linkTypeToBucketIndex:](self, "linkTypeToBucketIndex:", a10, v28);
  v31[0] = CFSTR("deviceModelFrom");
  v31[1] = CFSTR("deviceModelTo");
  v22 = v15;
  v32[0] = v15;
  v32[1] = v16;
  v31[2] = CFSTR("error");
  v31[3] = CFSTR("initiator");
  v32[2] = v19;
  v32[3] = v20;
  v31[4] = CFSTR("isOnDemand");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v23;
  v31[5] = CFSTR("isStereoPair");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v29);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[5] = v24;
  v31[6] = CFSTR("lifetime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[6] = v25;
  v31[7] = CFSTR("linkType");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", LinkTypeLabels[v21], 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[7] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  CUMetricsLog();
  os_unfair_lock_unlock(lock);

}

- (void)logMessageForClient:(id)a3 length:(unint64_t)a4 linkType:(int)a5
{
  uint64_t v5;
  os_unfair_lock_s *p_reportLock;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v5 = *(_QWORD *)&a5;
  v14[3] = *MEMORY[0x1E0C80C00];
  p_reportLock = &self->_reportLock;
  v9 = a3;
  os_unfair_lock_lock(p_reportLock);
  LODWORD(v5) = -[RPConnectionMetrics linkTypeToBucketIndex:](self, "linkTypeToBucketIndex:", v5);
  v14[0] = v9;
  v13[0] = CFSTR("client");
  v13[1] = CFSTR("lengthKB");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4 >> 10);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  v13[2] = CFSTR("linkType");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", LinkTypeLabels[v5], 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  CUMetricsLog();
  os_unfair_lock_unlock(p_reportLock);

}

- (void)logRequestOnLinkType:(int)a3 length:(unint64_t)a4 rtt:(unint64_t)a5
{
  uint64_t v7;
  os_unfair_lock_s *p_reportLock;
  unint64_t v10;
  int v11;
  int v12;
  int v13;
  void *v14;
  NSMutableDictionary *rttMetrics;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v7 = *(_QWORD *)&a3;
  p_reportLock = &self->_reportLock;
  os_unfair_lock_lock(&self->_reportLock);
  v10 = self->_eventCount + 1;
  self->_eventCount = v10;
  if (v10 > 0x19)
  {
    v11 = -[RPConnectionMetrics linkTypeToBucketIndex:](self, "linkTypeToBucketIndex:", v7);
    v12 = -[RPConnectionMetrics lengthToBucketIndex:](self, "lengthToBucketIndex:", a4);
    v13 = -[RPConnectionMetrics rttToBucketIndex:](self, "rttToBucketIndex:", a5);
    v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s,%s,%s"), LinkTypeLabels[v11], LengthLabels[v12], RTTLabels[v13]);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_rttMetrics, "objectForKeyedSubscript:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    rttMetrics = self->_rttMetrics;
    if (v14)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](rttMetrics, "objectForKeyedSubscript:", v19);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedIntegerValue");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17 + 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rttMetrics, "setObject:forKeyedSubscript:", v18, v19);

    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](rttMetrics, "setObject:forKeyedSubscript:", &unk_1E5F6A318, v19);
    }
    self->_sendReport = 1;
    os_unfair_lock_unlock(p_reportLock);

  }
  else
  {
    os_unfair_lock_unlock(p_reportLock);
  }
}

- (void)reportMetrics
{
  os_unfair_lock_s *p_reportLock;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *rttMetrics;
  os_unfair_lock_s *lock;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  _QWORD v24[4];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  p_reportLock = &self->_reportLock;
  os_unfair_lock_lock(&self->_reportLock);
  if (self->_sendReport)
  {
    lock = p_reportLock;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[NSMutableDictionary allKeys](self->_rttMetrics, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v20 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(","));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v23[0] = CFSTR("rttCount");
          -[NSMutableDictionary objectForKey:](self->_rttMetrics, "objectForKey:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = v10;
          v23[1] = CFSTR("linkType");
          objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v24[1] = v11;
          v23[2] = CFSTR("lengthBytes");
          objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v24[2] = v12;
          v23[3] = CFSTR("rttMs");
          objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v24[3] = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          CUMetricsLog();
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v5);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    rttMetrics = self->_rttMetrics;
    self->_rttMetrics = v15;

    self->_sendReport = 0;
    self->_eventCount = 0;
    os_unfair_lock_unlock(lock);
  }
  else
  {
    os_unfair_lock_unlock(p_reportLock);
  }
}

- (NSMutableDictionary)rttMetrics
{
  return self->_rttMetrics;
}

- (void)setRttMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_rttMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rttMetrics, 0);
  objc_storeStrong((id *)&self->_reportTimer, 0);
  objc_storeStrong((id *)&self->_reportQueue, 0);
}

@end
