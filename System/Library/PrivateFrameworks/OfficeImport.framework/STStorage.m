@implementation STStorage

- (STStorage)init
{
  return -[STStorage initWithCStorage:](self, "initWithCStorage:", 0);
}

- (STStorage)initWithCStorage:(_Storage *)a3
{
  STStorage *v4;
  STStorage *v5;
  STStorage *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STStorage;
  v4 = -[STSStgObject init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->m_pCStorage = a3;
    v6 = v4;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[STStorage close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)STStorage;
  -[STStorage dealloc](&v3, sel_dealloc);
}

- (void)close
{
  _Storage **p_m_pCStorage;

  p_m_pCStorage = &self->m_pCStorage;
  if (*p_m_pCStorage)
    closeStorage((uint64_t)p_m_pCStorage);
}

- (id)openStream:(id)a3 withMode:(int)a4
{
  uint64_t v4;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  STStream *v10;
  STStream *v11;
  uint64_t v13;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v13 = 0;
  v7 = StgModeFromSTStgMode(v4);
  if (v7 == 1)
  {
    v8 = createStream((uint64_t)self->m_pCStorage, (unsigned __int16 *)objc_msgSend(v6, "cWideString"), &v13);
    goto LABEL_5;
  }
  if (!v7)
  {
    v8 = openStream((uint64_t)self->m_pCStorage, (const unsigned __int16 *)objc_msgSend(v6, "cWideString"), &v13);
LABEL_5:
    v9 = v8;
    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", v9);
  v10 = [STStream alloc];
  v11 = -[STStream initWithCStream:](v10, "initWithCStream:", v13);
  if (!v11)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB70], CFSTR("Structured Storage library memory failure"));

  return v11;
}

- (id)openStorage:(id)a3 withMode:(int)a4
{
  uint64_t v4;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  STStorage *v10;
  STStorage *v11;
  uint64_t v13;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v13 = 0;
  v7 = StgModeFromSTStgMode(v4);
  if (v7 == 1)
  {
    v8 = createStorage((uint64_t)self->m_pCStorage, (unsigned __int16 *)objc_msgSend(v6, "cWideString"), &v13);
    goto LABEL_5;
  }
  if (!v7)
  {
    v8 = openStorage((uint64_t)self->m_pCStorage, (const unsigned __int16 *)objc_msgSend(v6, "cWideString"), &v13);
LABEL_5:
    v9 = v8;
    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", v9);
  v10 = [STStorage alloc];
  v11 = -[STStorage initWithCStorage:](v10, "initWithCStorage:", v13);
  if (!v11)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB70], CFSTR("Structured Storage library memory failure"));

  return v11;
}

- (id)getInfo
{
  uint64_t v2;
  STStgInfo *v3;
  STStgInfo *v4;
  uint64_t v5;
  void *v7;

  v7 = 0;
  getStorageInfo((uint64_t)self->m_pCStorage, (uint64_t **)&v7);
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", v2);
  v3 = [STStgInfo alloc];
  v4 = -[STStgInfo initWithStgInfo:](v3, "initWithStgInfo:", v7);
  v5 = freeInfo((void **)v7, 1u);
  free(v7);
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", v5);
  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB70], CFSTR("Structured Storage library memory failure"));
  return v4;
}

- (id)getChildrenInfo
{
  void *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  STStgInfo *v7;
  STStgInfo *v8;
  int v10;
  void **v11;

  v11 = 0;
  v10 = 0;
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", getChildrenInfo((uint64_t)self->m_pCStorage, &v11, (unsigned int *)&v10));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (uint64_t *)MEMORY[0x24BDBCB70];
  if (!v2)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB70], CFSTR("Structured Storage library memory failure"));
  if (v10 >= 1)
  {
    v4 = 0;
    v5 = 0;
    v6 = *v3;
    do
    {
      v7 = [STStgInfo alloc];
      v8 = -[STStgInfo initWithStgInfo:](v7, "initWithStgInfo:", &v11[v4]);
      if (!v8)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", v6, CFSTR("Structured Storage library memory failure"));
      objc_msgSend(v2, "addObject:", v8);

      ++v5;
      v4 += 8;
    }
    while (v5 < v10);
  }
  return v2;
}

- (int)getChildType:(id)a3
{
  unsigned int ChildType;

  ChildType = getChildType((uint64_t)self->m_pCStorage, (const unsigned __int16 *)objc_msgSend(a3, "cWideString"));
  if (ChildType >= 3)
    return -1;
  else
    return ChildType - 1;
}

- (void)setClass:(id)a3
{
  $DF246ECBFA7C13B1931CDA33BA2B4196 v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", storageSetClass((uint64_t)self->m_pCStorage, &v3));
}

@end
