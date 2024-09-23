@implementation PLAccountingQualificationEventEntry

- (id)subEntryKey
{
  return -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *MEMORY[0x24BE75180]);
}

- (PLAccountingQualificationEventEntry)initWithQualificationID:(id)a3 withChildNodeIDs:(id)a4 withRange:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  PLAccountingQualificationEventEntry *v13;
  PLAccountingQualificationEventEntry *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSSet *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((int)objc_msgSend(v8, "intValue") < 1)
  {
LABEL_10:
    v13 = 0;
    goto LABEL_20;
  }
  +[PLAccountingEngine allQualificationIDs](PLAccountingEngine, "allQualificationIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v8);

  v13 = 0;
  if (v9 && v12)
  {
    v37.receiver = self;
    v37.super_class = (Class)PLAccountingQualificationEventEntry;
    v14 = -[PLAccountingEventEntry initWithRange:](&v37, sel_initWithRange_, v10);
    self = v14;
    if (v14)
    {
      -[PLEntry setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE75180]);
      v15 = -[PLAccountingQualificationEventEntry instanceDirectionality](self, "instanceDirectionality");
      v16 = objc_msgSend((id)objc_opt_class(), "classDirectionality");
      if (v15 != v16 && v16 != 3)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: Directionality mismatch for qualificationID=%@"), v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/Qualification/PLAccountingQualificationEventEntry.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationEventEntry initWithQualificationID:withChildNodeIDs:withRange:]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 45);

        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDistributionEventEntry initWithDistributionID:withChildNodeIDToWeight:withRange:].cold.1((uint64_t)v17, v22);

        goto LABEL_10;
      }
      v32 = v9;
      objc_storeStrong((id *)&self->_childNodeIDs, a4);
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v23 = self->_childNodeIDs;
      v24 = -[NSSet countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v34;
        v27 = *MEMORY[0x24BE75170];
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v34 != v26)
              objc_enumerationMutation(v23);
            v29 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
            v38 = v27;
            v39 = v29;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLEntry setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", &unk_24DD01438, v30);

          }
          v25 = -[NSSet countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
        }
        while (v25);
      }

      v9 = v32;
    }
    self = self;
    v13 = self;
  }
LABEL_20:

  return v13;
}

- (int)instanceDirectionality
{
  void *v2;
  void *v3;
  int v4;

  -[PLAccountingQualificationEventEntry qualificationID](self, "qualificationID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_24DD03040, "objectAtIndexedSubscript:", (int)objc_msgSend(v2, "intValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childNodeIDs, 0);
}

- (PLAccountingQualificationEventEntry)initWithQualificationID:(id)a3 withChildNodeNames:(id)a4 withRange:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PLAccountingQualificationEventEntry *v16;

  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  +[PLAccountingNodeManager sharedInstance](PLAccountingNodeManager, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "childNodeIDsFromChildNodeNames:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[PLAccountingQualificationEventEntry initWithQualificationID:withChildNodeIDs:withRange:](self, "initWithQualificationID:withChildNodeIDs:withRange:", v11, v15, v9);
  return v16;
}

- (NSNumber)qualificationID
{
  return (NSNumber *)-[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *MEMORY[0x24BE75180]);
}

- (BOOL)isEqualContentsWithEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PLAccountingQualificationEventEntry childNodeIDs](self, "childNodeIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "childNodeIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToSet:", v6);
  return (char)v4;
}

- (NSSet)childNodeIDs
{
  NSSet *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  NSSet *childNodeIDs;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (!self->_childNodeIDs && -[PLEntry existsInDB](self, "existsInDB"))
  {
    -[PLEntry loadDynamicKeys](self, "loadDynamicKeys");
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x24BDBCF20];
    v5 = (void *)MEMORY[0x24BE74FC0];
    -[PLEntry entryKey](self, "entryKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyConfigsForEntryKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[PLEntry keys](self, "keys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      v14 = *MEMORY[0x24BE75170];
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((objc_msgSend(v9, "containsObject:", v16) & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v16, "objectForKeyedSubscript:", v14);
              v17 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v17 = v16;
            }
            v18 = v17;
            if (v17)
              -[NSSet addObject:](v3, "addObject:", v17);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v12);
    }

    childNodeIDs = self->_childNodeIDs;
    self->_childNodeIDs = v3;

  }
  return self->_childNodeIDs;
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingQualificationEventEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

- (NSSet)childNodeNames
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
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PLAccountingQualificationEventEntry childNodeIDs](self, "childNodeIDs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        +[PLAccountingNodeManager sharedInstance](PLAccountingNodeManager, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "nodeNameForNodeID:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (BOOL)isEmptyEvent
{
  void *v2;
  BOOL v3;

  -[PLAccountingQualificationEventEntry childNodeIDs](self, "childNodeIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

@end
