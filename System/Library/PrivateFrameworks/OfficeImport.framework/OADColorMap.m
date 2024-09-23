@implementation OADColorMap

- (OADColorMap)init
{
  OADColorMap *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mMappings;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OADColorMap;
  v2 = -[OADColorMap init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mMappings = v2->mMappings;
    v2->mMappings = v3;

  }
  return v2;
}

- (void)addDefaultMappings:(BOOL)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;

  v4 = !a3;
  if (a3)
    v5 = 3;
  else
    v5 = 2;
  if (a3)
    v6 = 2;
  else
    v6 = 3;
  -[OADColorMap addMapping:index:](self, "addMapping:index:");
  -[OADColorMap addMapping:index:](self, "addMapping:index:", v4, 1);
  -[OADColorMap addMapping:index:](self, "addMapping:index:", v5, 2);
  -[OADColorMap addMapping:index:](self, "addMapping:index:", v6, 3);
  -[OADColorMap addMapping:index:](self, "addMapping:index:", 4, 4);
  -[OADColorMap addMapping:index:](self, "addMapping:index:", 5, 5);
  -[OADColorMap addMapping:index:](self, "addMapping:index:", 6, 6);
  -[OADColorMap addMapping:index:](self, "addMapping:index:", 7, 7);
  -[OADColorMap addMapping:index:](self, "addMapping:index:", 8, 8);
  -[OADColorMap addMapping:index:](self, "addMapping:index:", 9, 9);
  -[OADColorMap addMapping:index:](self, "addMapping:index:", 10, 10);
  -[OADColorMap addMapping:index:](self, "addMapping:index:", 11, 11);
}

- (void)addMapping:(int)a3 index:(int)a4
{
  uint64_t v4;
  NSMutableDictionary *mMappings;
  void *v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  mMappings = self->mMappings;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](mMappings, "setObject:forKey:", v7, v6);

}

- (int)mappingForIndex:(int)a3
{
  NSMutableDictionary *mMappings;
  void *v4;
  void *v5;

  mMappings = self->mMappings;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mMappings, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v5, "intValue");
  return (int)v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
    v5 = -[NSMutableDictionary isEqualToDictionary:](self->mMappings, "isEqualToDictionary:", v4[1]);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  objc_super v5;

  v3 = -[NSMutableDictionary count](self->mMappings, "count");
  v5.receiver = self;
  v5.super_class = (Class)OADColorMap;
  return -[OADColorMap hash](&v5, sel_hash) ^ v3;
}

- (BOOL)isEmpty
{
  return -[NSMutableDictionary count](self->mMappings, "count") == 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADColorMap;
  -[OADColorMap description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMappings, 0);
}

@end
