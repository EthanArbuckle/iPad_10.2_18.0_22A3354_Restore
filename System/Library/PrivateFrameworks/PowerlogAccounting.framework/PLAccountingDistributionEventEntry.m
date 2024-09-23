@implementation PLAccountingDistributionEventEntry

- (PLAccountingDistributionEventEntry)initWithDistributionID:(id)a3 withChildNodeIDToWeight:(id)a4 withRange:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  PLAccountingDistributionEventEntry *v13;
  PLAccountingDistributionEventEntry *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSDictionary *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  NSDictionary *childNodeIDToWeight;
  id v39;
  id v40;
  PLAccountingDistributionEventEntry *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((int)objc_msgSend(v8, "intValue") < 1)
  {
    v13 = 0;
    goto LABEL_23;
  }
  +[PLAccountingEngine allDistributionIDs](PLAccountingEngine, "allDistributionIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v8);

  v13 = 0;
  if (v9 && v12)
  {
    v46.receiver = self;
    v46.super_class = (Class)PLAccountingDistributionEventEntry;
    v14 = -[PLAccountingEventEntry initWithRange:](&v46, sel_initWithRange_, v10);
    self = v14;
    if (v14)
    {
      -[PLEntry setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE75138]);
      v15 = -[PLAccountingDistributionEventEntry instanceDirectionality](self, "instanceDirectionality");
      v41 = self;
      v16 = objc_msgSend((id)objc_opt_class(), "classDirectionality");
      if (v15 != v16 && v16 != 3)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: Directionality mismatch for distributionID=%@"), v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/Distribution/PLAccountingDistributionEventEntry.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionEventEntry initWithDistributionID:withChildNodeIDToWeight:withRange:]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 54);

        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDistributionEventEntry initWithDistributionID:withChildNodeIDToWeight:withRange:].cold.1((uint64_t)v17, v22);

        v13 = 0;
        goto LABEL_23;
      }
      v39 = v10;
      v23 = (NSDictionary *)objc_msgSend(v9, "mutableCopy");
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v40 = v9;
      v24 = v9;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v43;
        v28 = *MEMORY[0x24BE75130];
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v43 != v27)
              objc_enumerationMutation(v24);
            v30 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
            objc_msgSend(v24, "objectForKeyedSubscript:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "doubleValue");
            if (v32 >= 0.005)
            {
              v33 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v31, "doubleValue");
              objc_msgSend(v33, "numberWithLong:", llround(v34 * 100.0));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = v28;
              v48 = v30;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLEntry setObject:forKeyedSubscript:](v41, "setObject:forKeyedSubscript:", v35, v36);

            }
            else
            {
              -[NSDictionary removeObjectForKey:](v23, "removeObjectForKey:", v30);
            }

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
        }
        while (v26);
      }

      self = v41;
      childNodeIDToWeight = v41->_childNodeIDToWeight;
      v41->_childNodeIDToWeight = v23;

      v9 = v40;
      v10 = v39;
    }
    self = self;
    v13 = self;
  }
LABEL_23:

  return v13;
}

- (BOOL)distributeRangeWeightedTotal
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->__distributeRangeWeightedTotal)
    return 1;
  self->__distributeRangeWeightedTotal = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(&unk_24DD03010, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(&unk_24DD03010);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[PLAccountingDistributionEventEntry distributionID](self, "distributionID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v8) = objc_msgSend(v9, "isEqualToNumber:", v8);

        if ((_DWORD)v8)
          self->__distributeRangeWeightedTotal = 1;
      }
      v5 = objc_msgSend(&unk_24DD03010, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  return self->__distributeRangeWeightedTotal;
}

- (NSNumber)distributionID
{
  return (NSNumber *)-[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *MEMORY[0x24BE75138]);
}

- (id)subEntryKey
{
  return -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *MEMORY[0x24BE75138]);
}

- (int)instanceDirectionality
{
  void *v2;
  void *v3;
  int v4;

  -[PLAccountingDistributionEventEntry distributionID](self, "distributionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_24DD02FF8, "objectAtIndexedSubscript:", (int)objc_msgSend(v2, "intValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)canMergeWithEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[PLAccountingDistributionEventEntry mergingDenyList](PLAccountingDistributionEventEntry, "mergingDenyList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "distributionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "containsObject:", v5) ^ 1;
  return (char)v3;
}

+ (id)mergingDenyList
{
  if (mergingDenyList_onceToken != -1)
    dispatch_once(&mergingDenyList_onceToken, &__block_literal_global);
  return (id)mergingDenyList__mergingDenyList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childNodeIDToWeight, 0);
}

- (BOOL)isEqualContentsWithEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PLAccountingDistributionEventEntry childNodeIDToWeight](self, "childNodeIDToWeight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "childNodeIDToWeight");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToDictionary:", v6);
  return (char)v4;
}

- (NSDictionary)childNodeIDToWeight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  NSDictionary *childNodeIDToWeight;
  uint64_t v24;
  NSDictionary *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (!self->_childNodeIDToWeight && -[PLEntry existsInDB](self, "existsInDB"))
  {
    -[PLEntry loadDynamicKeys](self, "loadDynamicKeys");
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v25 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x24BDBCF20];
    v4 = (void *)MEMORY[0x24BE74FC0];
    -[PLEntry entryKey](self, "entryKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyConfigsForEntryKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[PLEntry keys](self, "keys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      v24 = *MEMORY[0x24BE75130];
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if ((objc_msgSend(v8, "containsObject:", v14) & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v14, "objectForKeyedSubscript:", v24);
              v15 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v15 = v14;
            }
            v16 = v15;
            -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              v18 = (void *)MEMORY[0x24BDD16E0];
              -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v14);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "doubleValue");
              objc_msgSend(v18, "numberWithDouble:", v20 / 100.0);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v21, v16);

            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v11);
    }

    childNodeIDToWeight = self->_childNodeIDToWeight;
    self->_childNodeIDToWeight = v25;

  }
  return self->_childNodeIDToWeight;
}

- (PLAccountingDistributionEventEntry)initWithDistributionID:(id)a3 withChildNodeNameToWeight:(id)a4 withRange:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PLAccountingDistributionEventEntry *v17;

  v8 = (void *)MEMORY[0x24BDBCE70];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v10, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLAccountingNodeManager sharedInstance](PLAccountingNodeManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "childNodeIDsFromChildNodeNames:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:", v12, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[PLAccountingDistributionEventEntry initWithDistributionID:withChildNodeIDToWeight:withRange:](self, "initWithDistributionID:withChildNodeIDToWeight:withRange:", v11, v16, v9);
  return v17;
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingDistributionEventEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

- (NSDictionary)childNodeNameToWeight
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[PLAccountingDistributionEventEntry childNodeIDToWeight](self, "childNodeIDToWeight", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        +[PLAccountingNodeManager sharedInstance](PLAccountingNodeManager, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "nodeNameForNodeID:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          -[PLAccountingDistributionEventEntry childNodeIDToWeight](self, "childNodeIDToWeight");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, v11);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

void __53__PLAccountingDistributionEventEntry_mergingDenyList__block_invoke()
{
  void *v0;

  v0 = (void *)mergingDenyList__mergingDenyList;
  mergingDenyList__mergingDenyList = (uint64_t)&unk_24DD03028;

}

- (BOOL)isEmptyEvent
{
  void *v2;
  BOOL v3;

  -[PLAccountingDistributionEventEntry childNodeIDToWeight](self, "childNodeIDToWeight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (BOOL)_distributeRangeWeightedTotal
{
  return self->__distributeRangeWeightedTotal;
}

- (void)set_distributeRangeWeightedTotal:(BOOL)a3
{
  self->__distributeRangeWeightedTotal = a3;
}

- (void)initWithDistributionID:(uint64_t)a1 withChildNodeIDToWeight:(NSObject *)a2 withRange:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_21A62B000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

@end
