@implementation PLEventForwardDisplayEntry

- (id)initEntryWithRawData:(id)a3
{
  id v4;
  void *v5;
  PLEventForwardDisplayEntry *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  +[PLEventForwardDisplayEntry entryKey](PLEventForwardDisplayEntry, "entryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)PLEventForwardDisplayEntry;
  v6 = -[PLEntry initWithEntryKey:withRawData:](&v16, sel_initWithEntryKey_withRawData_, v5, v4);

  if (v6 && !+[PLDisplayAgent shouldLogFromDCP](PLDisplayAgent, "shouldLogFromDCP"))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("brightness"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("value"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "longValue");

    objc_msgSend(v7, "objectForKey:", CFSTR("min"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "longValue");

    objc_msgSend(v7, "objectForKey:", CFSTR("max"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "longValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(v9 - v11) * 100.0 / (double)(v13 - v11));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLEntry setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v14, CFSTR("Brightness"));

  }
  return v6;
}

+ (id)entryKey
{
  return +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("Display"));
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLEventForwardDisplayEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

@end
