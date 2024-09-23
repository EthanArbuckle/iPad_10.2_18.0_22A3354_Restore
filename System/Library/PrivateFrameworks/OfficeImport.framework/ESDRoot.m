@implementation ESDRoot

- (ESDRoot)initWithPbState:(id)a3
{
  id v4;
  ESDRoot *v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[ESDRoot init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "reader");
    (*(void (**)(uint64_t, void *))(*(_QWORD *)v6 + 72))(v6, -[ESDRoot eshRoot](v5, "eshRoot"));
    +[ESDContainer pbReadChildrenOfObject:toArray:state:](ESDContainer, "pbReadChildrenOfObject:toArray:state:", v5->super.mEshObject, v5->mChildren, v4);
  }

  return v5;
}

- (ESDRoot)init
{
  return -[ESDObject initWithType:](self, "initWithType:", 1);
}

- (ESDRoot)initWithEshObject:(EshObject *)a3
{
  ESDRoot *v3;
  NSMutableArray *v4;
  NSMutableArray *mChildren;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ESDRoot;
  v3 = -[ESDObject initWithEshObject:](&v7, sel_initWithEshObject_, a3);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mChildren = v3->mChildren;
    v3->mChildren = v4;

  }
  return v3;
}

- (void)eshRoot
{
  void *result;

  result = self->super.mEshObject;
  if (result)
  return result;
}

- (id)pbReferenceWithID:(unsigned int)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  void *v10;
  void *v11;

  v5 = -[ESDRoot childCount](self, "childCount");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      -[ESDRoot childAt:](self, "childAt:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (const void *)objc_msgSend(v8, "eshObject");
      if (v9)
      {
        if (v10)
        {
          v11 = v10;
          if ((*(unsigned int (**)(void *))(*(_QWORD *)v10 + 16))(v10))
          {
            if ((*(unsigned int (**)(void *))(*(_QWORD *)v11 + 32))(v11) == a3)
              break;
          }
        }
      }

      if (v6 == ++v7)
        goto LABEL_8;
    }
  }
  else
  {
LABEL_8:
    v8 = 0;
  }
  return v8;
}

- (unint64_t)childCount
{
  return -[NSMutableArray count](self->mChildren, "count");
}

- (id)childAt:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mChildren, "objectAtIndex:", a3);
}

- (id)initFromReader:(OcReader *)a3
{
  ESDRoot *v4;
  ESDRoot *v5;

  v4 = -[ESDRoot init](self, "init");
  v5 = v4;
  if (v4)
  {
    (*((void (**)(OcReader *, void *))a3->var0 + 15))(a3, -[ESDRoot eshRoot](v4, "eshRoot"));
    +[ESDContainer readChildrenOfObject:reader:toArray:](ESDContainer, "readChildrenOfObject:reader:toArray:", v5->super.mEshObject, a3, v5->mChildren);
  }
  return v5;
}

- (void)addChild:(id)a3
{
  id v4;

  v4 = a3;
  -[NSMutableArray addObject:](self->mChildren, "addObject:");
  EshRoot::appendChild((EshRoot *)-[ESDRoot eshRoot](self, "eshRoot"), (EshObject *)objc_msgSend(v4, "eshObject"));

}

- (void)writeToWriter:(OcWriter *)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ESDRoot;
  -[ESDObject writeToWriter:](&v8, sel_writeToWriter_);
  -[NSMutableArray objectEnumerator](self->mChildren, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    objc_msgSend(v5, "nextObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
      break;
    objc_msgSend(v6, "writeToWriter:", a3);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mChildren, 0);
}

@end
