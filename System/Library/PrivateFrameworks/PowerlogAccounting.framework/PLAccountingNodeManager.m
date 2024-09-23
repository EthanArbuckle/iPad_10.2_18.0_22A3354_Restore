@implementation PLAccountingNodeManager

- (id)childNodeIDsFromChildNodeNames:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD block[5];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v6 = MEMORY[0x24BDAC760];
  if (v5)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__PLAccountingNodeManager_childNodeIDsFromChildNodeNames___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (childNodeIDsFromChildNodeNames__defaultOnce != -1)
      dispatch_once(&childNodeIDsFromChildNodeNames__defaultOnce, block);
    if (childNodeIDsFromChildNodeNames__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("childNodeNames=%@"), v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingNodeManager childNodeIDsFromChildNodeNames:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 142);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v14 = v4;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v14);
        -[PLAccountingNodeManager nodeIDForNodeName:isPermanent:](self, "nodeIDForNodeName:isPermanent:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i), 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v16);
  }

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v27 = v6;
    v28 = 3221225472;
    v29 = __58__PLAccountingNodeManager_childNodeIDsFromChildNodeNames___block_invoke_39;
    v30 = &__block_descriptor_40_e5_v8__0lu32l8;
    v31 = objc_opt_class();
    if (childNodeIDsFromChildNodeNames__defaultOnce_37 != -1)
      dispatch_once(&childNodeIDsFromChildNodeNames__defaultOnce_37, &v27);
    if (childNodeIDsFromChildNodeNames__classDebugEnabled_38)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("childNodeIDs=%@"), v13, v27, v28, v29, v30, v31, (_QWORD)v32);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastPathComponent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingNodeManager childNodeIDsFromChildNodeNames:]");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 152);

      PLLogCommon();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }

  return v13;
}

- (id)nodeIDForNodeName:(id)a3 isPermanent:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  os_unfair_lock_s *p_nodeMappingLock;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  PLAccountingNodeEntry *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v50;
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD block[6];

  v4 = a4;
  v6 = a3;
  p_nodeMappingLock = &self->_nodeMappingLock;
  os_unfair_lock_lock(&self->_nodeMappingLock);
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__PLAccountingNodeManager_nodeIDForNodeName_isPermanent___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (nodeIDForNodeName_isPermanent__defaultOnce != -1)
      dispatch_once(&nodeIDForNodeName_isPermanent__defaultOnce, block);
    if (nodeIDForNodeName_isPermanent__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("nodeName=%@, isPermanent=%i"), v6, v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingNodeManager nodeIDForNodeName:isPermanent:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 50);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v15 = objc_opt_class();
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __57__PLAccountingNodeManager_nodeIDForNodeName_isPermanent___block_invoke_15;
    v53[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v53[4] = v15;
    if (nodeIDForNodeName_isPermanent__defaultOnce_13 != -1)
      dispatch_once(&nodeIDForNodeName_isPermanent__defaultOnce_13, v53);
    if (nodeIDForNodeName_isPermanent__classDebugEnabled_14)
    {
      v16 = (void *)MEMORY[0x24BDD17C8];
      -[PLAccountingNodeManager nodeNameToNodeID](self, "nodeNameToNodeID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("nodeNameToNodeID=%@"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingNodeManager nodeIDForNodeName:isPermanent:]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 52);

      PLLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingNodeManager nodeNameToNodeID](self, "nodeNameToNodeID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[PLAccountingNodeManager nodeNameToNodeID](self, "nodeNameToNodeID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", v6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v27 = objc_opt_class();
      v52[0] = MEMORY[0x24BDAC760];
      v52[1] = 3221225472;
      v52[2] = __57__PLAccountingNodeManager_nodeIDForNodeName_isPermanent___block_invoke_20;
      v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v52[4] = v27;
      if (nodeIDForNodeName_isPermanent__defaultOnce_18 != -1)
        dispatch_once(&nodeIDForNodeName_isPermanent__defaultOnce_18, v52);
      if (nodeIDForNodeName_isPermanent__classDebugEnabled_19)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("nodeID=%@"), v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "lastPathComponent");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingNodeManager nodeIDForNodeName:isPermanent:]");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v31, v32, 73);

        PLLogCommon();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    if (v26)
    {
      os_unfair_lock_unlock(&self->_nodeMappingLock);
      v34 = v26;
    }
    else
    {
      v35 = -[PLAccountingNodeEntry initWithName:]([PLAccountingNodeEntry alloc], "initWithName:", v6);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLEntry setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v36, *MEMORY[0x24BE75100]);

      v37 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "storage");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "numberWithLongLong:", objc_msgSend(v39, "blockingWriteEntry:withCompletionBlock:", v35, &__block_literal_global_17));
      v34 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v40 = objc_opt_class();
        v51[0] = MEMORY[0x24BDAC760];
        v51[1] = 3221225472;
        v51[2] = __57__PLAccountingNodeManager_nodeIDForNodeName_isPermanent___block_invoke_2;
        v51[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v51[4] = v40;
        if (nodeIDForNodeName_isPermanent__defaultOnce_26 != -1)
          dispatch_once(&nodeIDForNodeName_isPermanent__defaultOnce_26, v51);
        if (nodeIDForNodeName_isPermanent__classDebugEnabled_27)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("added to DB node=%@"), v35);
          v41 = objc_claimAutoreleasedReturnValue();
          v50 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "lastPathComponent");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingNodeManager nodeIDForNodeName:isPermanent:]");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "logMessage:fromFile:fromFunction:fromLineNumber:", v41, v43, v44, 83);

          v45 = (void *)v41;
          PLLogCommon();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            -[PLAccountingDependency activate].cold.1();

        }
      }
      -[PLAccountingNodeManager nodeNameToNodeID](self, "nodeNameToNodeID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setObject:forKeyedSubscript:", v34, v6);

      -[PLAccountingNodeManager nodeIDToNodeName](self, "nodeIDToNodeName");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v6, v34);

      os_unfair_lock_unlock(p_nodeMappingLock);
    }

  }
  else
  {
    os_unfair_lock_unlock(&self->_nodeMappingLock);
    v34 = 0;
  }

  return v34;
}

- (NSMutableDictionary)nodeNameToNodeID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

+ (id)sharedInstance
{
  void *v3;
  void *v4;
  char v5;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "storageLocked");

  if ((v5 & 1) != 0)
    return 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__PLAccountingNodeManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, block);
  return (id)sharedInstance_sharedInstance_2;
}

- (NSMutableDictionary)nodeIDToNodeName
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (PLAccountingNodeManager)init
{
  PLAccountingNodeManager *v2;
  PLAccountingNodeManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLAccountingNodeManager;
  v2 = -[PLAccountingNodeManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_nodeMappingLock._os_unfair_lock_opaque = 0;
    -[PLAccountingNodeManager setupNodes](v2, "setupNodes");
  }
  return v3;
}

void __41__PLAccountingNodeManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sharedInstance_2;
  sharedInstance_sharedInstance_2 = (uint64_t)v0;

}

uint64_t __57__PLAccountingNodeManager_nodeIDForNodeName_isPermanent___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  nodeIDForNodeName_isPermanent__classDebugEnabled = result;
  return result;
}

uint64_t __57__PLAccountingNodeManager_nodeIDForNodeName_isPermanent___block_invoke_15(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  nodeIDForNodeName_isPermanent__classDebugEnabled_14 = result;
  return result;
}

uint64_t __57__PLAccountingNodeManager_nodeIDForNodeName_isPermanent___block_invoke_20(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  nodeIDForNodeName_isPermanent__classDebugEnabled_19 = result;
  return result;
}

uint64_t __57__PLAccountingNodeManager_nodeIDForNodeName_isPermanent___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  nodeIDForNodeName_isPermanent__classDebugEnabled_27 = result;
  return result;
}

- (id)nodeNameForNodeID:(id)a3
{
  os_unfair_lock_s *p_nodeMappingLock;
  id v5;
  void *v6;
  void *v7;

  p_nodeMappingLock = &self->_nodeMappingLock;
  v5 = a3;
  os_unfair_lock_lock(p_nodeMappingLock);
  -[PLAccountingNodeManager nodeIDToNodeName](self, "nodeIDToNodeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_nodeMappingLock);
  return v7;
}

- (void)removeNodeReferenceFromCache:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  os_unfair_lock_s *p_nodeMappingLock;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[4];
  id v36;

  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PLAccountingNodeManager removeNodeReferenceFromCache:].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);

  objc_msgSend(v4, "userInfo");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v4, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      PLLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[PLAccountingNodeManager removeNodeReferenceFromCache:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

      objc_msgSend(v4, "userInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "allKeys");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      p_nodeMappingLock = &self->_nodeMappingLock;
      os_unfair_lock_lock(&self->_nodeMappingLock);
      -[PLAccountingNodeManager nodeIDToNodeName](self, "nodeIDToNodeName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = MEMORY[0x24BDAC760];
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __56__PLAccountingNodeManager_removeNodeReferenceFromCache___block_invoke;
      v35[3] = &unk_24DCFA168;
      v36 = v26;
      v30 = v26;
      objc_msgSend(v28, "keysOfEntriesPassingTest:", v35);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v33[0] = v29;
      v33[1] = 3221225472;
      v33[2] = __56__PLAccountingNodeManager_removeNodeReferenceFromCache___block_invoke_2;
      v33[3] = &unk_24DCFA190;
      v33[4] = self;
      v34 = v4;
      objc_msgSend(v31, "enumerateObjectsUsingBlock:", v33);
      -[PLAccountingNodeManager nodeNameToNodeID](self, "nodeNameToNodeID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "removeObjectsForKeys:", v30);

      os_unfair_lock_unlock(p_nodeMappingLock);
    }
  }

}

uint64_t __56__PLAccountingNodeManager_removeNodeReferenceFromCache___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsString:");
}

void __56__PLAccountingNodeManager_removeNodeReferenceFromCache___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "nodeIDToNodeName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __56__PLAccountingNodeManager_removeNodeReferenceFromCache___block_invoke_2_cold_1((uint64_t)v5, a1, v6);

  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MaskedName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "nodeIDToNodeName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v3);

}

uint64_t __58__PLAccountingNodeManager_childNodeIDsFromChildNodeNames___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  childNodeIDsFromChildNodeNames__classDebugEnabled = result;
  return result;
}

uint64_t __58__PLAccountingNodeManager_childNodeIDsFromChildNodeNames___block_invoke_39(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  childNodeIDsFromChildNodeNames__classDebugEnabled_38 = result;
  return result;
}

- (void)setupNodes
{
  os_unfair_lock_s *p_nodeMappingLock;
  _QWORD block[5];

  p_nodeMappingLock = &self->_nodeMappingLock;
  os_unfair_lock_lock(&self->_nodeMappingLock);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__PLAccountingNodeManager_setupNodes__block_invoke;
  block[3] = &unk_24DCF9BD0;
  block[4] = self;
  if (setupNodes_onceToken != -1)
    dispatch_once(&setupNodes_onceToken, block);
  os_unfair_lock_unlock(p_nodeMappingLock);
}

void __37__PLAccountingNodeManager_setupNodes__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t i;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  NSObject *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  NSObject *v100;
  void *v101;
  void *v102;
  void *v103;
  id obj;
  uint64_t v105;
  uint64_t v106;
  _QWORD v107[5];
  _QWORD v108[5];
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _QWORD v113[5];
  _QWORD v114[5];
  _QWORD block[5];
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _QWORD v120[5];
  _QWORD v121[5];
  _BYTE v122[128];
  void *v123;
  uint8_t buf[4];
  void *v125;
  _BYTE v126[128];
  _QWORD v127[4];

  v127[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setNodeNameToNodeID:", v2);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setNodeIDToNodeName:", v3);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_removeNodeReferenceFromCache_, CFSTR("PLAppDeletionActivityStarted"), 0);

  v5 = objc_msgSend(objc_alloc(MEMORY[0x24BE75000]), "initWithKey:withValue:withComparisonOperation:", CFSTR("ID"), &unk_24DD01A68, 5);
  +[PLAccountingNodeEntry entryKey](PLAccountingNodeEntry, "entryKey");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = (void *)v5;
  v127[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v127, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = (void *)v6;
  objc_msgSend(v9, "entriesForKey:withComparisons:", v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0x24BE74000uLL;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v14 = objc_opt_class();
    v121[0] = MEMORY[0x24BDAC760];
    v121[1] = 3221225472;
    v121[2] = __37__PLAccountingNodeManager_setupNodes__block_invoke_54;
    v121[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v121[4] = v14;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_1 != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_1, v121);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_1)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("reservedNodesInDB=%@"), v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingNodeManager setupNodes]_block_invoke_2");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 176);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

      v13 = 0x24BE74000uLL;
    }
  }
  +[PLAccountingEngine deviceRootNodeIDs](PLAccountingEngine, "deviceRootNodeIDs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "mutableCopy");

  objc_msgSend(v22, "addObject:", &unk_24DD01A80);
  objc_msgSend(v22, "addObject:", &unk_24DD01A68);
  v23 = 0x24DCF9000;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v24 = objc_opt_class();
    v120[0] = MEMORY[0x24BDAC760];
    v120[1] = 3221225472;
    v120[2] = __37__PLAccountingNodeManager_setupNodes__block_invoke_61;
    v120[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v120[4] = v24;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_59 != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_59, v120);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_60)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("reservedNodeIDs=%@"), v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "lastPathComponent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingNodeManager setupNodes]_block_invoke_2");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v28, v29, 182);

      PLLogCommon();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

      v13 = 0x24BE74000uLL;
      v23 = 0x24DCF9000uLL;
    }
  }
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  obj = v22;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v126, 16);
  v103 = v12;
  if (v31)
  {
    v32 = v31;
    v105 = *MEMORY[0x24BE75100];
    v106 = *(_QWORD *)v117;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v117 != v106)
          objc_enumerationMutation(obj);
        v34 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * v33);
        v35 = (void *)objc_msgSend(objc_alloc(*(Class *)(v23 + 1288)), "initWithRootNodeID:", v34);
        objc_msgSend(v35, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v105);
        if (objc_msgSend(*(id *)(v13 + 4016), "debugEnabled"))
        {
          v36 = objc_opt_class();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __37__PLAccountingNodeManager_setupNodes__block_invoke_66;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v36;
          if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_64 != -1)
            dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_64, block);
          if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_65)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("reservedNode=%@"), v35);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "lastPathComponent");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingNodeManager setupNodes]_block_invoke_2");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "logMessage:fromFile:fromFunction:fromLineNumber:", v37, v40, v41, 187);

            PLLogCommon();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v125 = v37;
              _os_log_debug_impl(&dword_21A62B000, v42, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v12 = v103;
            v13 = 0x24BE74000uLL;
            v23 = 0x24DCF9000;
          }
        }
        if ((objc_msgSend(v12, "containsObject:", v35) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "storage");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "blockingWriteEntry:withCompletionBlock:", v35, &__block_literal_global_70_0);

          if (objc_msgSend(*(id *)(v13 + 4016), "debugEnabled"))
          {
            v45 = objc_opt_class();
            v114[0] = MEMORY[0x24BDAC760];
            v114[1] = 3221225472;
            v114[2] = __37__PLAccountingNodeManager_setupNodes__block_invoke_2;
            v114[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v114[4] = v45;
            if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_71 != -1)
              dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_71, v114);
            if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_72)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("added to DB reservedNode=%@"), v35);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = (void *)MEMORY[0x24BE74FA8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "lastPathComponent");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingNodeManager setupNodes]_block_invoke_3");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "logMessage:fromFile:fromFunction:fromLineNumber:", v46, v49, v50, 192);

              PLLogCommon();
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v125 = v46;
                _os_log_debug_impl(&dword_21A62B000, v51, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v12 = v103;
              v13 = 0x24BE74000;
              v23 = 0x24DCF9000;
            }
          }
        }
        objc_msgSend(*(id *)(a1 + 32), "nodeNameToNodeID");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "name");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setObject:forKeyedSubscript:", v34, v53);

        objc_msgSend(v35, "name");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "nodeIDToNodeName");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setObject:forKeyedSubscript:", v54, v34);

        ++v33;
      }
      while (v32 != v33);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v126, 16);
    }
    while (v32);
  }

  objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "storage");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "flushCachesWithReason:", v102);

  objc_msgSend(MEMORY[0x24BE74FE8], "sharedStorageCache");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "clearLastEntryCacheForEntryKey:", v102);

  v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE75000]), "initWithKey:withValue:withComparisonOperation:", CFSTR("ID"), &unk_24DD01A68, 2);
  v60 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "storage");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v59;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v123, 1);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "entriesForKey:withComparisons:", v102, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setWithArray:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v66 = objc_opt_class();
    v113[0] = MEMORY[0x24BDAC760];
    v113[1] = 3221225472;
    v113[2] = __37__PLAccountingNodeManager_setupNodes__block_invoke_79;
    v113[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v113[4] = v66;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_77 != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_77, v113);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_78)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("otherNodesInDB=%@"), v65);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "lastPathComponent");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingNodeManager setupNodes]_block_invoke_2");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "logMessage:fromFile:fromFunction:fromLineNumber:", v67, v70, v71, 210);

      PLLogCommon();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v73 = v65;
  v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
  if (v74)
  {
    v75 = v74;
    v76 = *(_QWORD *)v110;
    do
    {
      for (i = 0; i != v75; ++i)
      {
        if (*(_QWORD *)v110 != v76)
          objc_enumerationMutation(v73);
        v78 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v78, "entryID"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "name");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        if (v80)
        {
          objc_msgSend(*(id *)(a1 + 32), "nodeNameToNodeID");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "setObject:forKeyedSubscript:", v79, v80);

          objc_msgSend(*(id *)(a1 + 32), "nodeIDToNodeName");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "setObject:forKeyedSubscript:", v80, v79);

        }
      }
      v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
    }
    while (v75);
  }

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v83 = objc_opt_class();
    v108[0] = MEMORY[0x24BDAC760];
    v108[1] = 3221225472;
    v108[2] = __37__PLAccountingNodeManager_setupNodes__block_invoke_84;
    v108[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v108[4] = v83;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_82 != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_82, v108);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_83)
    {
      v84 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*(id *)(a1 + 32), "nodeNameToNodeID");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "stringWithFormat:", CFSTR("nodeNameToNodeID=%@"), v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      v87 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "lastPathComponent");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingNodeManager setupNodes]_block_invoke_2");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "logMessage:fromFile:fromFunction:fromLineNumber:", v86, v89, v90, 219);

      PLLogCommon();
      v91 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v92 = objc_opt_class();
    v107[0] = MEMORY[0x24BDAC760];
    v107[1] = 3221225472;
    v107[2] = __37__PLAccountingNodeManager_setupNodes__block_invoke_87;
    v107[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v107[4] = v92;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_85 != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_85, v107);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_86)
    {
      v93 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*(id *)(a1 + 32), "nodeIDToNodeName");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "stringWithFormat:", CFSTR("nodeIDToNodeName=%@"), v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();

      v96 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingNodeManager.m");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "lastPathComponent");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingNodeManager setupNodes]_block_invoke_2");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "logMessage:fromFile:fromFunction:fromLineNumber:", v95, v98, v99, 220);

      PLLogCommon();
      v100 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }

}

uint64_t __37__PLAccountingNodeManager_setupNodes__block_invoke_54(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_1 = result;
  return result;
}

uint64_t __37__PLAccountingNodeManager_setupNodes__block_invoke_61(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_60 = result;
  return result;
}

uint64_t __37__PLAccountingNodeManager_setupNodes__block_invoke_66(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_65 = result;
  return result;
}

uint64_t __37__PLAccountingNodeManager_setupNodes__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_72 = result;
  return result;
}

uint64_t __37__PLAccountingNodeManager_setupNodes__block_invoke_79(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_78 = result;
  return result;
}

uint64_t __37__PLAccountingNodeManager_setupNodes__block_invoke_84(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_83 = result;
  return result;
}

uint64_t __37__PLAccountingNodeManager_setupNodes__block_invoke_87(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_86 = result;
  return result;
}

- (void)setNodeNameToNodeID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setNodeIDToNodeName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodeIDToNodeName, 0);
  objc_storeStrong((id *)&self->_nodeNameToNodeID, 0);
}

- (void)removeNodeReferenceFromCache:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21A62B000, a1, a3, "Removing entries from the in memory cache", a5, a6, a7, a8, 0);
}

- (void)removeNodeReferenceFromCache:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21A62B000, a1, a3, "Received notification to update Accounting Cache", a5, a6, a7, a8, 0);
}

void __56__PLAccountingNodeManager_removeNodeReferenceFromCache___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a2 + 40), "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MaskedName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = a1;
  v10 = 2112;
  v11 = v7;
  _os_log_debug_impl(&dword_21A62B000, a3, OS_LOG_TYPE_DEBUG, "Obfuscating the node id cache for %@ with %@", (uint8_t *)&v8, 0x16u);

}

@end
