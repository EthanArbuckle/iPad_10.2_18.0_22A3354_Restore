@implementation OITSUCache

- (OITSUCache)initWithName:(id)a3
{
  id v4;
  OITSUCache *v5;
  OITSUCache *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)OITSUCache;
  v5 = -[OITSUCache init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    -[OITSUCache setName:](v5, "setName:", v4);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BDF7538];
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel_p_didReceiveMemoryWarning_, v8, v9);

    v10 = *MEMORY[0x24BDF7528];
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel_p_didEnterBackground_, v10, v11);

  }
  return v6;
}

- (OITSUCache)init
{
  return -[OITSUCache initWithName:](self, "initWithName:", CFSTR("UnnamedCache"));
}

@end
