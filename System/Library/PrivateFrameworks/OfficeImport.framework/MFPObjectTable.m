@implementation MFPObjectTable

- (MFPObjectTable)init
{
  MFPObjectTable *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mObjects;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFPObjectTable;
  v2 = -[MFPObjectTable init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mObjects = v2->mObjects;
    v2->mObjects = v3;

  }
  return v2;
}

- (id)objectAtIndex:(int)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", *(_QWORD *)&a3);
  -[NSMutableDictionary objectForKey:](self->mObjects, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setObject:(id)a3 atIndex:(int)a4
{
  uint64_t v4;
  void *v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v7 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", v4);
  -[NSMutableDictionary setObject:forKey:](self->mObjects, "setObject:forKey:", v7, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mObjects, 0);
}

@end
