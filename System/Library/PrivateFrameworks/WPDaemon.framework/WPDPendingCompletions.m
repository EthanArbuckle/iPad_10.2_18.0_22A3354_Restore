@implementation WPDPendingCompletions

- (WPDPendingCompletions)initWithName:(id)a3
{
  id v5;
  WPDPendingCompletions *v6;
  WPDPendingCompletions *v7;
  uint64_t v8;
  NSMutableArray *pendingCompletions;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WPDPendingCompletions;
  v6 = -[WPDPendingCompletions init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    v7->_lastID = 0;
    v8 = objc_opt_new();
    pendingCompletions = v7->_pendingCompletions;
    v7->_pendingCompletions = (NSMutableArray *)v8;

  }
  return v7;
}

- (id)description
{
  WPDPendingCompletions *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ pending completions:%lu, last ID:%lu\n"), v2->_name, -[NSMutableArray count](v2->_pendingCompletions, "count"), v2->_lastID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)addCompletion:(id)a3
{
  id v4;
  WPDPendingCompletions *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  NSString *name;
  uint64_t v10;
  int v12;
  NSString *v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    if (-[WPDPendingCompletions lastID](v5, "lastID") == -1)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_84);
      v8 = (id)WiProxLog;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[WPDPendingCompletions addCompletion:].cold.1((uint64_t)v5->_name, (uint8_t *)&v12, -[NSMutableArray count](v5->_pendingCompletions, "count"), v8);
      v7 = 0;
    }
    else
    {
      -[WPDPendingCompletions pendingCompletions](v5, "pendingCompletions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v4);

      v7 = -[WPDPendingCompletions lastID](v5, "lastID") + 1;
      -[WPDPendingCompletions setLastID:](v5, "setLastID:", v7);
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_2);
      v8 = (id)WiProxLog;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        name = v5->_name;
        v10 = -[NSMutableArray count](v5->_pendingCompletions, "count");
        v12 = 138412802;
        v13 = name;
        v14 = 2048;
        v15 = v7;
        v16 = 2048;
        v17 = v10;
        _os_log_debug_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEBUG, "WPDSearchPartyAgent %@ added completion ID:%lu, outstanding:%lu", (uint8_t *)&v12, 0x20u);
      }
    }

    objc_sync_exit(v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)completeID:(unint64_t)a3 success:(BOOL)a4
{
  _BOOL4 v5;
  void *v7;
  WPDPendingCompletions *v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  WPDPendingCompletions *v18;
  NSObject *v19;
  unint64_t v20;
  NSString *v21;
  uint64_t v22;
  unint64_t lastID;
  NSString *name;
  uint64_t v25;
  _QWORD v26[5];
  uint8_t buf[4];
  NSString *v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  _BYTE v34[14];
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v5 = a4;
    v7 = (void *)MEMORY[0x219A0EE8C](self, a2);
    v8 = self;
    objc_sync_enter(v8);
    v9 = a3 - v8->_lastID + -[NSMutableArray count](v8->_pendingCompletions, "count");
    if (v9 <= -[NSMutableArray count](v8->_pendingCompletions, "count"))
    {
      -[NSMutableArray subarrayWithRange:](v8->_pendingCompletions, "subarrayWithRange:", 0, v9);
      v18 = (WPDPendingCompletions *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectsInRange:](v8->_pendingCompletions, "removeObjectsInRange:", 0, v9);
      if (!-[NSMutableArray count](v8->_pendingCompletions, "count"))
        v8->_lastID = 0;
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_89);
      v19 = (id)WiProxLog;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        lastID = v8->_lastID;
        name = v8->_name;
        v25 = -[NSMutableArray count](v8->_pendingCompletions, "count");
        *(_DWORD *)buf = 138413570;
        v28 = name;
        v29 = 2048;
        v30 = a3;
        v31 = 2048;
        v32 = v9;
        v33 = 1024;
        *(_DWORD *)v34 = v5;
        *(_WORD *)&v34[4] = 2048;
        *(_QWORD *)&v34[6] = lastID;
        v35 = 2048;
        v36 = v25;
        _os_log_debug_impl(&dword_2175D1000, v19, OS_LOG_TYPE_DEBUG, "WPDSearchPartyAgent %@ will complete ID:%lu (count %lu), success:%d, last ID:%lU pending:%lu", buf, 0x3Au);
      }

      objc_sync_exit(v8);
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __44__WPDPendingCompletions_completeID_success___block_invoke_90;
      v26[3] = &__block_descriptor_40_e22_v32__0___v__q_8Q16_B24l;
      v26[4] = !v5;
      -[WPDPendingCompletions enumerateObjectsUsingBlock:](v18, "enumerateObjectsUsingBlock:", v26);
      v8 = v18;
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_87_0);
      v10 = (id)WiProxLog;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v20 = v8->_lastID;
        v21 = v8->_name;
        v22 = -[NSMutableArray count](v8->_pendingCompletions, "count");
        *(_DWORD *)buf = 138413058;
        v28 = v21;
        v29 = 2048;
        v30 = a3;
        v31 = 2048;
        v32 = v20;
        v33 = 2048;
        *(_QWORD *)v34 = v22;
        _os_log_error_impl(&dword_2175D1000, v10, OS_LOG_TYPE_ERROR, "WPDSearchPartyAgent %@ NOOP unexpected completion ID:%lu, last known ID:%lu, pending count:%lu", buf, 0x2Au);
      }

      objc_sync_exit(v8);
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_85_0);
    v11 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDPendingCompletions completeID:success:].cold.1((uint64_t)self, v11, v12, v13, v14, v15, v16, v17);
  }
}

uint64_t __44__WPDPendingCompletions_completeID_success___block_invoke_90(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

- (NSMutableArray)pendingCompletions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPendingCompletions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (unint64_t)lastID
{
  return self->_lastID;
}

- (void)setLastID:(unint64_t)a3
{
  self->_lastID = a3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_pendingCompletions, 0);
}

- (void)addCompletion:(uint64_t)a3 .cold.1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 138412802;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = 0;
  *((_WORD *)buf + 11) = 2048;
  *((_QWORD *)buf + 3) = a3;
  _os_log_error_impl(&dword_2175D1000, log, OS_LOG_TYPE_ERROR, "WPDSearchPartyAgent %@ cannot increment completion ID:%lu, outstanding:%lu", buf, 0x20u);
}

- (void)completeID:(uint64_t)a3 success:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2175D1000, a2, a3, "WPDSearchPartyAgent %@ NOOP (completion ID:0)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

@end
