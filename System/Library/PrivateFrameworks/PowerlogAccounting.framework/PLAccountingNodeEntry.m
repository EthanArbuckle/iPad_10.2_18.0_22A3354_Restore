@implementation PLAccountingNodeEntry

- (PLAccountingNodeEntry)initWithName:(id)a3
{
  id v4;
  void *v5;
  PLAccountingNodeEntry *v6;
  PLAccountingNodeEntry *v7;
  objc_super v9;

  v4 = a3;
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "entryKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9.receiver = self;
    v9.super_class = (Class)PLAccountingNodeEntry;
    v6 = -[PLEntry initWithEntryKey:](&v9, sel_initWithEntryKey_, v5);

    if (v6)
      -[PLEntry setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BE75108]);
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)entryKey
{
  if (entryKey_onceToken != -1)
    dispatch_once(&entryKey_onceToken, &__block_literal_global_0);
  return (id)entryKey_entryKey;
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingNodeEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

void __33__PLAccountingNodeEntry_entryKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE74F88], "entryKeyForType:andName:", *MEMORY[0x24BE75228], *MEMORY[0x24BE750F8]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryKey_entryKey;
  entryKey_entryKey = v0;

}

- (PLAccountingNodeEntry)initWithRootNodeID:(id)a3
{
  unsigned int v4;
  unsigned int v5;
  __CFString *v6;
  PLAccountingNodeEntry *v7;
  PLAccountingNodeEntry *v8;

  v4 = objc_msgSend(a3, "intValue");
  v5 = v4;
  if (v4 == 1)
  {
    v6 = CFSTR("__GLOBAL__");
  }
  else if (v4 - 1 > 0x3D)
  {
    if (v4 != 10000)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v6 = CFSTR("RootNodeMaxCount");
  }
  else
  {
    objc_msgSend(&unk_24DD030A0, "objectAtIndexedSubscript:", v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = -[PLAccountingNodeEntry initWithName:](self, "initWithName:", v6);
  -[PLEntry setEntryID:](v7, "setEntryID:", v5);
  self = v7;

  v8 = self;
LABEL_8:

  return v8;
}

- (id)initEntryWithRawData:(id)a3
{
  id v4;
  void *v5;
  PLAccountingNodeEntry *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "entryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PLAccountingNodeEntry;
  v6 = -[PLEntry initWithEntryKey:withRawData:](&v8, sel_initWithEntryKey_withRawData_, v5, v4);

  return v6;
}

- (NSString)name
{
  return (NSString *)-[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *MEMORY[0x24BE75108]);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t block;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  uint64_t v22;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __33__PLAccountingNodeEntry_isEqual___block_invoke;
    v21 = &__block_descriptor_40_e5_v8__0lu32l8;
    v22 = v5;
    if (isEqual__defaultOnce != -1)
      dispatch_once(&isEqual__defaultOnce, &block);
    if (isEqual__classDebugEnabled)
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      v7 = objc_msgSend(v4, "entryID");
      v8 = -[PLEntry entryID](self, "entryID");
      objc_msgSend(v6, "stringWithFormat:", CFSTR("self=%@, other=%@, result=%i"), self, v4, v7 == v8, block, v19, v20, v21, v22);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/PLAccountingNodeEntry.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingNodeEntry isEqual:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 77);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDistributionEventEntry initWithDistributionID:withChildNodeIDToWeight:withRange:].cold.1((uint64_t)v9, v14);

    }
  }
  v15 = objc_msgSend(v4, "entryID");
  v16 = v15 == -[PLEntry entryID](self, "entryID");

  return v16;
}

uint64_t __33__PLAccountingNodeEntry_isEqual___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  isEqual__classDebugEnabled = result;
  return result;
}

@end
