@implementation BioLogLegacy

- (BioLogLegacy)init
{
  const char *v3;
  NSObject *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *logQueue;
  objc_super v8;

  v3 = (const char *)logQueueLabel;
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (OS_dispatch_queue *)dispatch_queue_create(v3, v4);
  logQueue = self->_logQueue;
  self->_logQueue = v5;

  if (self->_logQueue)
  {
    v8.receiver = self;
    v8.super_class = (Class)BioLogLegacy;
    return -[BioLogLegacy init](&v8, sel_init);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "_logQueue", ", "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/BioLog/BioLog.m", 3193, 0);

    return 0;
  }
}

- (id)logQueue
{
  return self->_logQueue;
}

- (void)dispatchLogEventAsync:(id)a3 withCurrentTimestamp:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  NSObject *logQueue;
  id v9;
  _QWORD block[5];
  id v11;
  uint64_t v12;

  v4 = a4;
  v6 = a3;
  if (v4)
    v7 = mach_absolute_time();
  else
    v7 = 0;
  logQueue = self->_logQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__BioLogLegacy_dispatchLogEventAsync_withCurrentTimestamp___block_invoke;
  block[3] = &unk_251CA07F0;
  v11 = v6;
  v12 = v7;
  block[4] = self;
  v9 = v6;
  dispatch_async(logQueue, block);

}

void __59__BioLogLegacy_dispatchLogEventAsync_withCurrentTimestamp___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x24BD27898]();
  objc_msgSend(*(id *)(a1 + 32), "setAbsoluteTimeOverride:", *(_QWORD *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setAbsoluteTimeOverride:", 0);
  objc_autoreleasePoolPop(v2);
}

- (void)closeLogFile
{
  NSObject *logQueue;
  _QWORD block[5];

  logQueue = self->_logQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__BioLogLegacy_closeLogFile__block_invoke;
  block[3] = &unk_251CA06E0;
  block[4] = self;
  dispatch_sync(logQueue, block);
}

id __28__BioLogLegacy_closeLogFile__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v2, sel_closeLogFile);
}

- (void)logLogStart
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __27__BioLogLegacy_logLogStart__block_invoke;
  v2[3] = &unk_251CA06E0;
  v2[4] = self;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v2, 1);
}

id __27__BioLogLegacy_logLogStart__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v2, sel_logLogStartSync);
}

- (void)logUnlockedStateWithIdentities:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  BioLogLegacy *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__BioLogLegacy_logUnlockedStateWithIdentities___block_invoke;
  v6[3] = &unk_251CA0818;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v6, 1);

}

id __47__BioLogLegacy_logUnlockedStateWithIdentities___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v3, sel_logUnlockedStateWithIdentities_, v1);
}

- (void)logStatusMessage:(int)a3 withData:(id)a4 timestamp:(unint64_t)a5 forClients:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  BioLogLegacy *v17;
  unint64_t v18;
  int v19;

  v10 = a4;
  v11 = a6;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __63__BioLogLegacy_logStatusMessage_withData_timestamp_forClients___block_invoke;
  v14[3] = &unk_251CA0840;
  v19 = a3;
  v15 = v10;
  v16 = v11;
  v17 = self;
  v18 = a5;
  v12 = v11;
  v13 = v10;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v14, 0);

}

id __63__BioLogLegacy_logStatusMessage_withData_timestamp_forClients___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v1 = *(unsigned int *)(a1 + 64);
  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6.receiver = *(id *)(a1 + 48);
  v6.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v6, sel_logStatusMessage_withData_timestamp_forClients_, v1, v3, v2, v4);
}

- (void)logTemplateListFromIdentities:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id obj;
  _QWORD v23[4];
  id v24;
  id v25;
  BioLogLegacy *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(obj);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v9), "userID");
        objc_msgSend(v5, "allKeys");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "containsObject:", v12);

        if ((v13 & 1) == 0)
        {
          if (self->super._compact
            || (-[BiometricKitXPCServerMesa getSerialisedTemplatesForUser:](self->super._server, "getSerialisedTemplatesForUser:", v10), (v14 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v14 = objc_claimAutoreleasedReturnValue();
            v3 = (void *)v14;
            v15 = 0;
            v16 = 1;
          }
          else
          {
            v15 = (void *)v14;
            v16 = 0;
          }
          v17 = v14;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v10);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v17, v18);

          if (v16)
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v7);
  }

  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __46__BioLogLegacy_logTemplateListFromIdentities___block_invoke;
  v23[3] = &unk_251CA0868;
  v24 = v5;
  v25 = obj;
  v26 = self;
  v19 = obj;
  v20 = v5;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v23, 1);

}

id __46__BioLogLegacy_logTemplateListFromIdentities___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 48);
  v4.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v4, sel_logTemplateLists_fromIdentities_, v2, v1);
}

- (void)logThermalLevel:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __32__BioLogLegacy_logThermalLevel___block_invoke;
  v3[3] = &unk_251CA0890;
  v4 = a3;
  v3[4] = self;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v3, 1);
}

id __32__BioLogLegacy_logThermalLevel___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v3, sel_logThermalLevel_, v1);
}

- (void)logDisplayState:(BOOL)a3 withTimestamp:(unint64_t)a4
{
  _QWORD v4[6];
  BOOL v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__BioLogLegacy_logDisplayState_withTimestamp___block_invoke;
  v4[3] = &unk_251CA08B8;
  v5 = a3;
  v4[4] = self;
  v4[5] = a4;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v4, 0);
}

id __46__BioLogLegacy_logDisplayState_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(unsigned __int8 *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v4, sel_logDisplayState_withTimestamp_, v1, v2);
}

- (void)logPowerState:(BOOL)a3 withTimestamp:(unint64_t)a4
{
  _QWORD v4[6];
  BOOL v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__BioLogLegacy_logPowerState_withTimestamp___block_invoke;
  v4[3] = &unk_251CA08B8;
  v5 = a3;
  v4[4] = self;
  v4[5] = a4;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v4, 0);
}

id __44__BioLogLegacy_logPowerState_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(unsigned __int8 *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v4, sel_logPowerStateSync_withTimestamp_, v1, v2);
}

- (void)logSaveTemplateListWithDetails:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  BioLogLegacy *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__BioLogLegacy_logSaveTemplateListWithDetails___block_invoke;
  v6[3] = &unk_251CA0818;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v6, 1);

}

id __47__BioLogLegacy_logSaveTemplateListWithDetails___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v3, sel_logSaveTemplateListWithDetails_, v1);
}

- (void)logSaveTemplateListError:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __41__BioLogLegacy_logSaveTemplateListError___block_invoke;
  v3[3] = &unk_251CA08E0;
  v4 = a3;
  v3[4] = self;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v3, 1);
}

id __41__BioLogLegacy_logSaveTemplateListError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v3, sel_logSaveTemplateListError_, v1);
}

- (void)logWakeGestureState:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __36__BioLogLegacy_logWakeGestureState___block_invoke;
  v3[3] = &unk_251CA0788;
  v3[4] = self;
  v3[5] = a3;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v3, 1);
}

id __36__BioLogLegacy_logWakeGestureState___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v3, sel_logWakeGestureState_, v1);
}

- (void)logCall:(SEL)a3 withParameters:(id)a4 fromClient:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  BioLogLegacy *v15;
  SEL v16;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50__BioLogLegacy_logCall_withParameters_fromClient___block_invoke;
  v12[3] = &unk_251CA0908;
  v13 = v8;
  v14 = v9;
  v15 = self;
  v16 = a3;
  v10 = v9;
  v11 = v8;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v12, 1);

}

id __50__BioLogLegacy_logCall_withParameters_fromClient___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  v1 = *(_QWORD *)(a1 + 56);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5.receiver = *(id *)(a1 + 48);
  v5.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v5, sel_logCall_withParameters_fromClient_, v1, v2, v3);
}

- (void)logCall:(SEL)a3 withError:(int)a4
{
  _QWORD v4[6];
  int v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__BioLogLegacy_logCall_withError___block_invoke;
  v4[3] = &unk_251CA0930;
  v5 = a4;
  v4[4] = self;
  v4[5] = a3;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v4, 1);
}

id __34__BioLogLegacy_logCall_withError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(unsigned int *)(a1 + 48);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v4, sel_logCall_withError_, v1, v2);
}

- (void)logSensorStatus:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  BioLogLegacy *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __32__BioLogLegacy_logSensorStatus___block_invoke;
  v6[3] = &unk_251CA0818;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v6, 0);

}

id __32__BioLogLegacy_logSensorStatus___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v3, sel_logSensorStatus_, v1);
}

- (void)logHomeButtonState:(BOOL)a3 fromKernel:(BOOL)a4 withTimestamp:(unint64_t)a5
{
  _QWORD v5[6];
  BOOL v6;
  BOOL v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__BioLogLegacy_logHomeButtonState_fromKernel_withTimestamp___block_invoke;
  v5[3] = &unk_251CA0958;
  v6 = a3;
  v7 = a4;
  v5[4] = self;
  v5[5] = a5;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v5, 0);
}

id __60__BioLogLegacy_logHomeButtonState_fromKernel_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  v1 = *(unsigned __int8 *)(a1 + 48);
  v2 = *(unsigned __int8 *)(a1 + 49);
  v3 = *(_QWORD *)(a1 + 40);
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v5, sel_logHomeButtonState_fromKernel_withTimestamp_, v1, v2, v3);
}

- (void)logKernelMessage:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  BioLogLegacy *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __33__BioLogLegacy_logKernelMessage___block_invoke;
  v6[3] = &unk_251CA0818;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v6, 0);

}

id __33__BioLogLegacy_logKernelMessage___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v3, sel_logKernelMessage_, v1);
}

- (void)logSensorRecoveryReason:(unsigned int)a3 withTimestamp:(unint64_t)a4
{
  _QWORD v4[6];
  unsigned int v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__BioLogLegacy_logSensorRecoveryReason_withTimestamp___block_invoke;
  v4[3] = &unk_251CA0930;
  v5 = a3;
  v4[4] = self;
  v4[5] = a4;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v4, 0);
}

id __54__BioLogLegacy_logSensorRecoveryReason_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(unsigned int *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v4, sel_logSensorRecoveryReason_withTimestamp_, v1, v2);
}

- (void)logSKSLockState:(unsigned __int16)a3 forUser:(unsigned int)a4 withTimestamp:(unint64_t)a5
{
  _QWORD v5[6];
  unsigned int v6;
  unsigned __int16 v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __54__BioLogLegacy_logSKSLockState_forUser_withTimestamp___block_invoke;
  v5[3] = &unk_251CA0980;
  v7 = a3;
  v6 = a4;
  v5[4] = self;
  v5[5] = a5;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v5, 0);
}

id __54__BioLogLegacy_logSKSLockState_forUser_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  v1 = *(unsigned __int16 *)(a1 + 52);
  v2 = *(unsigned int *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 40);
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v5, sel_logSKSLockState_forUser_withTimestamp_, v1, v2, v3);
}

- (void)logDelegateRegistered:(BOOL)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BioLogLegacy *v10;
  BOOL v11;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__BioLogLegacy_logDelegateRegistered_fromClient___block_invoke;
  v8[3] = &unk_251CA09A8;
  v11 = a3;
  v9 = v6;
  v10 = self;
  v7 = v6;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v8, 1);

}

id __49__BioLogLegacy_logDelegateRegistered_fromClient___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(unsigned __int8 *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v4, sel_logDelegateRegistered_fromClient_, v1, v2);
}

- (void)logEnrollStartForUser:(unsigned int)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BioLogLegacy *v10;
  unsigned int v11;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__BioLogLegacy_logEnrollStartForUser_fromClient___block_invoke;
  v8[3] = &unk_251CA09D0;
  v11 = a3;
  v9 = v6;
  v10 = self;
  v7 = v6;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v8, 1);

}

id __49__BioLogLegacy_logEnrollStartForUser_fromClient___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(unsigned int *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v4, sel_logEnrollStartForUser_fromClient_, v1, v2);
}

- (void)logMatchStartFromClient:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  BioLogLegacy *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__BioLogLegacy_logMatchStartFromClient___block_invoke;
  v6[3] = &unk_251CA0818;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v6, 1);

}

id __40__BioLogLegacy_logMatchStartFromClient___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v3, sel_logMatchStartFromClient_, v1);
}

- (void)logMatchStart:(id)a3 withOptions:(id)a4 fromClient:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  BioLogLegacy *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __53__BioLogLegacy_logMatchStart_withOptions_fromClient___block_invoke;
  v14[3] = &unk_251CA09F8;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v18 = self;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v14, 1);

}

id __53__BioLogLegacy_logMatchStart_withOptions_fromClient___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v5.receiver = *(id *)(a1 + 56);
  v5.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v5, sel_logMatchStart_withOptions_fromClient_, v1, v2, v3);
}

- (void)logFingerDetectStartWithOptions:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  BioLogLegacy *v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__BioLogLegacy_logFingerDetectStartWithOptions_fromClient___block_invoke;
  v10[3] = &unk_251CA0868;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v10, 1);

}

id __59__BioLogLegacy_logFingerDetectStartWithOptions_fromClient___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 48);
  v4.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v4, sel_logFingerDetectStartWithOptions_fromClient_, v2, v1);
}

- (void)logCancelFromClient:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  BioLogLegacy *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__BioLogLegacy_logCancelFromClient___block_invoke;
  v6[3] = &unk_251CA0818;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v6, 1);

}

id __36__BioLogLegacy_logCancelFromClient___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v3, sel_logCancelFromClient_, v1);
}

- (void)logUpdateIdentity:(id)a3 withOptions:(id)a4 fromClient:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  BioLogLegacy *v18;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(a3, "copy");
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __57__BioLogLegacy_logUpdateIdentity_withOptions_fromClient___block_invoke;
  v14[3] = &unk_251CA09F8;
  v15 = v10;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v14, 1);

}

id __57__BioLogLegacy_logUpdateIdentity_withOptions_fromClient___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v5.receiver = *(id *)(a1 + 56);
  v5.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v5, sel_logUpdateIdentity_withOptions_fromClient_, v1, v2, v3);
}

- (void)logRemoveIdentity:(id)a3 withOptions:(id)a4 fromClient:(id)a5 withTimestamp:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  BioLogLegacy *v20;
  unint64_t v21;

  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_msgSend(a3, "copy");
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __71__BioLogLegacy_logRemoveIdentity_withOptions_fromClient_withTimestamp___block_invoke;
  v16[3] = &unk_251CA0A20;
  v17 = v12;
  v18 = v10;
  v20 = self;
  v21 = a6;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v12;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v16, a6 == 0);

}

id __71__BioLogLegacy_logRemoveIdentity_withOptions_fromClient_withTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 64);
  v6.receiver = *(id *)(a1 + 56);
  v6.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v6, sel_logRemoveIdentity_withOptions_fromClient_withTimestamp_, v1, v2, v3, v4);
}

- (void)logRemoveAllIdentitiesForUser:(unsigned int)a3 withOptions:(id)a4 fromClient:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  BioLogLegacy *v15;
  unsigned int v16;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __69__BioLogLegacy_logRemoveAllIdentitiesForUser_withOptions_fromClient___block_invoke;
  v12[3] = &unk_251CA0A48;
  v16 = a3;
  v13 = v8;
  v14 = v9;
  v15 = self;
  v10 = v9;
  v11 = v8;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v12, 1);

}

id __69__BioLogLegacy_logRemoveAllIdentitiesForUser_withOptions_fromClient___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(unsigned int *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 48);
  v5.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v5, sel_logRemoveAllIdentitiesForUser_withOptions_fromClient_, v2, v3, v1);
}

- (void)logGetIdentityFromUUID:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  BioLogLegacy *v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__BioLogLegacy_logGetIdentityFromUUID_fromClient___block_invoke;
  v10[3] = &unk_251CA0868;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v10, 1);

}

id __50__BioLogLegacy_logGetIdentityFromUUID_fromClient___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 48);
  v4.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v4, sel_logGetIdentityFromUUID_fromClient_, v2, v1);
}

- (void)logGetIdentities:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  BioLogLegacy *v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__BioLogLegacy_logGetIdentities_fromClient___block_invoke;
  v10[3] = &unk_251CA0868;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v10, 1);

}

id __44__BioLogLegacy_logGetIdentities_fromClient___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 48);
  v4.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v4, sel_logGetIdentities_fromClient_, v2, v1);
}

- (void)logGetMaxIdentityCount:(int)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BioLogLegacy *v10;
  int v11;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__BioLogLegacy_logGetMaxIdentityCount_fromClient___block_invoke;
  v8[3] = &unk_251CA09D0;
  v11 = a3;
  v9 = v6;
  v10 = self;
  v7 = v6;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v8, 1);

}

id __50__BioLogLegacy_logGetMaxIdentityCount_fromClient___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(unsigned int *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v4, sel_logGetMaxIdentityCount_fromClient_, v1, v2);
}

- (void)logProtectedConfiguration:(id)a3 forUser:(unsigned int)a4 fromClient:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  BioLogLegacy *v15;
  unsigned int v16;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__BioLogLegacy_logProtectedConfiguration_forUser_fromClient___block_invoke;
  v12[3] = &unk_251CA0A48;
  v16 = a4;
  v13 = v8;
  v14 = v9;
  v15 = self;
  v10 = v9;
  v11 = v8;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v12, 1);

}

id __61__BioLogLegacy_logProtectedConfiguration_forUser_fromClient___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(unsigned int *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 48);
  v5.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v5, sel_logProtectedConfiguration_forUser_fromClient_, v3, v2, v1);
}

- (void)logDisconnectingClient:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  BioLogLegacy *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__BioLogLegacy_logDisconnectingClient___block_invoke;
  v6[3] = &unk_251CA0818;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v6, 1);

}

id __39__BioLogLegacy_logDisconnectingClient___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v3, sel_logDisconnectingClient_, v1);
}

- (void)logEnrollStartError:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __36__BioLogLegacy_logEnrollStartError___block_invoke;
  v3[3] = &unk_251CA08E0;
  v4 = a3;
  v3[4] = self;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v3, 1);
}

id __36__BioLogLegacy_logEnrollStartError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v3, sel_logEnrollStartError_, v1);
}

- (void)logMatchStartError:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __35__BioLogLegacy_logMatchStartError___block_invoke;
  v3[3] = &unk_251CA08E0;
  v4 = a3;
  v3[4] = self;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v3, 1);
}

id __35__BioLogLegacy_logMatchStartError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v3, sel_logMatchStartError_, v1);
}

- (void)logFingerDetectStartError:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __42__BioLogLegacy_logFingerDetectStartError___block_invoke;
  v3[3] = &unk_251CA08E0;
  v4 = a3;
  v3[4] = self;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v3, 1);
}

id __42__BioLogLegacy_logFingerDetectStartError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v3, sel_logFingerDetectStartError_, v1);
}

- (void)logCancelError:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __31__BioLogLegacy_logCancelError___block_invoke;
  v3[3] = &unk_251CA08E0;
  v4 = a3;
  v3[4] = self;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v3, 1);
}

id __31__BioLogLegacy_logCancelError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v3, sel_logCancelError_, v1);
}

- (void)logUpdateIdentity:(id)a3 withError:(int)a4
{
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BioLogLegacy *v10;
  int v11;

  v6 = (void *)objc_msgSend(a3, "copy");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__BioLogLegacy_logUpdateIdentity_withError___block_invoke;
  v8[3] = &unk_251CA09D0;
  v11 = a4;
  v9 = v6;
  v10 = self;
  v7 = v6;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v8, 1);

}

id __44__BioLogLegacy_logUpdateIdentity_withError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned int *)(a1 + 48);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v4, sel_logUpdateIdentity_withError_, v1, v2);
}

- (void)logRemoveIdentity:(id)a3 withError:(int)a4
{
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BioLogLegacy *v10;
  int v11;

  v6 = (void *)objc_msgSend(a3, "copy");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__BioLogLegacy_logRemoveIdentity_withError___block_invoke;
  v8[3] = &unk_251CA09D0;
  v11 = a4;
  v9 = v6;
  v10 = self;
  v7 = v6;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v8, 1);

}

id __44__BioLogLegacy_logRemoveIdentity_withError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned int *)(a1 + 48);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v4, sel_logRemoveIdentity_withError_, v1, v2);
}

- (void)logProtectedConfigurationError:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47__BioLogLegacy_logProtectedConfigurationError___block_invoke;
  v3[3] = &unk_251CA08E0;
  v4 = a3;
  v3[4] = self;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v3, 1);
}

id __47__BioLogLegacy_logProtectedConfigurationError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v3, sel_logProtectedConfigurationError_, v1);
}

- (void)logEnrollResultIdentity:(id)a3 withTimestamp:(unint64_t)a4 forClients:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  BioLogLegacy *v15;
  unint64_t v16;

  v8 = a5;
  v9 = (void *)objc_msgSend(a3, "copy");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __65__BioLogLegacy_logEnrollResultIdentity_withTimestamp_forClients___block_invoke;
  v12[3] = &unk_251CA0908;
  v13 = v9;
  v14 = v8;
  v15 = self;
  v16 = a4;
  v10 = v8;
  v11 = v9;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v12, 0);

}

id __65__BioLogLegacy_logEnrollResultIdentity_withTimestamp_forClients___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  v1 = *(_QWORD *)(a1 + 56);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5.receiver = *(id *)(a1 + 48);
  v5.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v5, sel_logEnrollResultIdentity_withTimestamp_forClients_, v2, v1, v3);
}

- (void)logMatchResultIdentity:(id)a3 withDetails:(id)a4 timestamp:(unint64_t)a5 forClients:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  BioLogLegacy *v20;
  unint64_t v21;

  v10 = a4;
  v11 = a6;
  v12 = (void *)objc_msgSend(a3, "copy");
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __72__BioLogLegacy_logMatchResultIdentity_withDetails_timestamp_forClients___block_invoke;
  v16[3] = &unk_251CA0A20;
  v17 = v12;
  v18 = v10;
  v20 = self;
  v21 = a5;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v12;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v16, 0);

}

id __72__BioLogLegacy_logMatchResultIdentity_withDetails_timestamp_forClients___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 48);
  v6.receiver = *(id *)(a1 + 56);
  v6.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v6, sel_logMatchResultIdentity_withDetails_timestamp_forClients_, v1, v2, v3, v4);
}

- (id)details
{
  NSObject *logQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  logQueue = self->_logQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __23__BioLogLegacy_details__block_invoke;
  v5[3] = &unk_251CA0A70;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(logQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __23__BioLogLegacy_details__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)packCurrentLog
{
  NSObject *logQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  logQueue = self->_logQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__BioLogLegacy_packCurrentLog__block_invoke;
  v5[3] = &unk_251CA0A98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(logQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __30__BioLogLegacy_packCurrentLog__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BD27898]();
  objc_msgSend(*(id *)(a1 + 32), "setAbsoluteTimeOverride:", 0);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)BioLogLegacy;
  objc_msgSendSuper2(&v6, sel_packCurrentLog);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_autoreleasePoolPop(v2);
}

- (id)packAllLogs
{
  NSObject *logQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  logQueue = self->_logQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __27__BioLogLegacy_packAllLogs__block_invoke;
  v5[3] = &unk_251CA0A98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(logQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __27__BioLogLegacy_packAllLogs__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BD27898]();
  objc_msgSend(*(id *)(a1 + 32), "setAbsoluteTimeOverride:", 0);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)BioLogLegacy;
  objc_msgSendSuper2(&v6, sel_packAllLogs);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_autoreleasePoolPop(v2);
}

- (id)attachmentsFromCurrentLog
{
  NSObject *logQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  logQueue = self->_logQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__BioLogLegacy_attachmentsFromCurrentLog__block_invoke;
  v5[3] = &unk_251CA0A98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(logQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __41__BioLogLegacy_attachmentsFromCurrentLog__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BD27898]();
  objc_msgSend(*(id *)(a1 + 32), "setAbsoluteTimeOverride:", 0);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)BioLogLegacy;
  objc_msgSendSuper2(&v6, sel_attachmentsFromCurrentLog);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_autoreleasePoolPop(v2);
}

- (id)attachmentsFromAllLogs
{
  NSObject *logQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  logQueue = self->_logQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__BioLogLegacy_attachmentsFromAllLogs__block_invoke;
  v5[3] = &unk_251CA0A98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(logQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __38__BioLogLegacy_attachmentsFromAllLogs__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BD27898]();
  objc_msgSend(*(id *)(a1 + 32), "setAbsoluteTimeOverride:", 0);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)BioLogLegacy;
  objc_msgSendSuper2(&v6, sel_attachmentsFromAllLogs);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_autoreleasePoolPop(v2);
}

- (void)logAsync:(id)a3 withDetails:(id)a4 timestamp:(unint64_t)a5 endingWithToken:(char *)a6
{
  id v10;
  id v11;
  _BOOL8 v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  BioLogLegacy *v18;
  unint64_t v19;
  char *v20;

  v10 = a3;
  v11 = a4;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __63__BioLogLegacy_logAsync_withDetails_timestamp_endingWithToken___block_invoke;
  v15[3] = &unk_251CA0AC0;
  v16 = v10;
  v17 = v11;
  v19 = a5;
  v20 = a6;
  v18 = self;
  v12 = a5 == 0;
  v13 = v11;
  v14 = v10;
  -[BioLogLegacy dispatchLogEventAsync:withCurrentTimestamp:](self, "dispatchLogEventAsync:withCurrentTimestamp:", v15, v12);

}

id __63__BioLogLegacy_logAsync_withDetails_timestamp_endingWithToken___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v6.receiver = *(id *)(a1 + 48);
  v6.super_class = (Class)BioLogLegacy;
  return objc_msgSendSuper2(&v6, sel_log_withDetails_timestamp_fromClient_endingWithToken_osLogMsgType_, v1, v2, v3, 0, v4, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logQueue, 0);
}

@end
