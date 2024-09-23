@implementation ESDObjectFactory

+ (id)threadLocalFactory
{
  void *v2;
  void *v3;
  ESDObjectFactory *v4;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("ESDObjectFactory"));
  v4 = (ESDObjectFactory *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(ESDObjectFactory);
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("ESDObjectFactory"));
  }

  return v4;
}

- (ESDObjectFactory)init
{
  ESDObjectFactory *v2;
  NSMutableArray *v3;
  NSMutableArray *eshObjectFactoryStack;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ESDObjectFactory;
  v2 = -[ESDObjectFactory init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    eshObjectFactoryStack = v2->eshObjectFactoryStack;
    v2->eshObjectFactoryStack = v3;

  }
  return v2;
}

- (void)dealloc
{
  EshObjectFactory *eshObjectFactory;
  objc_super v4;

  eshObjectFactory = self->eshObjectFactory;
  if (eshObjectFactory)
  {
    (*((void (**)(EshObjectFactory *, SEL))eshObjectFactory->var0 + 1))(eshObjectFactory, a2);
    self->eshObjectFactory = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ESDObjectFactory;
  -[ESDObjectFactory dealloc](&v4, sel_dealloc);
}

- (EshObject)createObjectWithType:(unsigned __int16)a3
{
  EshObject *result;
  uint64_t v5;
  uint64_t v6;

  result = (EshObject *)self->eshObjectFactory;
  if (result)
  {
    v5 = a3;
    if ((unsigned __int16)(a3 + 4096) >= 6u)
    {
      v6 = EshAtom::versionForAtomType((EshAtom *)a3);
      result = (EshObject *)self->eshObjectFactory;
    }
    else
    {
      v6 = 15;
    }
    return (EshObject *)(*((uint64_t (**)(EshObject *, uint64_t, uint64_t))result->var0 + 2))(result, v5, v6);
  }
  return result;
}

- (EshObject)createObjectWithType:(unsigned __int16)a3 version:(unsigned __int16)a4
{
  return (EshObject *)(*((uint64_t (**)(EshObjectFactory *, _QWORD, _QWORD))self->eshObjectFactory->var0 + 2))(self->eshObjectFactory, a3, a4);
}

- (void)replaceHostEshFactoryWith:(EshObjectFactory *)a3
{
  NSMutableArray *eshObjectFactoryStack;
  void *v6;

  eshObjectFactoryStack = self->eshObjectFactoryStack;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", self->eshObjectFactory);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](eshObjectFactoryStack, "addObject:", v6);

  self->eshObjectFactory = a3;
}

- (void)restoreHostEshFactory
{
  void *v3;

  -[NSMutableArray lastObject](self->eshObjectFactoryStack, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->eshObjectFactory = (EshObjectFactory *)objc_msgSend(v3, "pointerValue");

  -[NSMutableArray removeLastObject](self->eshObjectFactoryStack, "removeLastObject");
}

- (void)setEshFactory:(EshObjectFactory *)a3
{
  EshObjectFactory *eshObjectFactory;

  eshObjectFactory = self->eshObjectFactory;
  if (eshObjectFactory)
    (*((void (**)(EshObjectFactory *, SEL))eshObjectFactory->var0 + 1))(eshObjectFactory, a2);
  self->eshObjectFactory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->eshObjectFactoryStack, 0);
}

@end
