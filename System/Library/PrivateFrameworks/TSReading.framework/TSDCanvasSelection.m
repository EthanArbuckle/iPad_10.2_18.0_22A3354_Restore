@implementation TSDCanvasSelection

- (TSDCanvasSelection)initWithInfos:(id)a3 andContainer:(id)a4
{
  TSDCanvasSelection *v6;
  NSSet *v7;
  NSSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)TSDCanvasSelection;
  v6 = -[TSDCanvasSelection init](&v21, sel_init);
  if (v6)
  {
    v7 = (NSSet *)objc_msgSend(a3, "copy");
    v6->mInfos = v7;
    if (!a4)
    {
      v8 = v7;
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v9 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v9)
      {
        v10 = v9;
        a4 = 0;
        v11 = *(_QWORD *)v18;
LABEL_5:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
          if (!objc_msgSend(v13, "parentInfo", v16))
            break;
          v14 = (id)objc_msgSend(v13, "parentInfo");
          if (a4)
          {
            if (v14 != a4)
              break;
          }
          else
          {
            objc_opt_class();
            v16 = &unk_254F72128;
            a4 = (id)TSUClassAndProtocolCast();
          }
          if (v10 == ++v12)
          {
            v10 = -[NSSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
            if (v10)
              goto LABEL_5;
            goto LABEL_17;
          }
        }
      }
      a4 = 0;
    }
LABEL_17:
    v6->mContainer = (TSDContainerInfo *)a4;
  }
  return v6;
}

- (TSDCanvasSelection)initWithInfos:(id)a3
{
  return -[TSDCanvasSelection initWithInfos:andContainer:](self, "initWithInfos:andContainer:", a3, 0);
}

+ (id)emptySelection
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfos:", v3);

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDCanvasSelection;
  -[TSDCanvasSelection dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInfos:", self->mInfos);
}

- (NSSet)infos
{
  return self->mInfos;
}

- (unint64_t)infoCount
{
  unint64_t result;

  result = -[TSDCanvasSelection infos](self, "infos");
  if (result)
    return objc_msgSend((id)result, "count");
  return result;
}

- (BOOL)isEqual:(id)a3
{
  NSSet *v5;
  NSSet *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  char v12;

  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v5 = -[TSDCanvasSelection infos](self, "infos");
    v6 = v5;
    if (a3 || -[NSSet count](v5, "count") || self->mContainer)
    {
      objc_opt_class();
      v7 = TSUDynamicCast();
      if (v7)
      {
        v8 = (void *)v7;
        v9 = -[NSSet count](v6, "count");
        v10 = (void *)objc_msgSend(v8, "infos");
        if (v9)
          v11 = -[NSSet isEqual:](v6, "isEqual:", v10);
        else
          v11 = objc_msgSend(v10, "count") == 0;
        if (-[TSDCanvasSelection container](self, "container"))
          v12 = -[TSDContainerInfo isEqual:](-[TSDCanvasSelection container](self, "container"), "isEqual:", objc_msgSend(v8, "container"));
        else
          v12 = objc_msgSend(v8, "container") == 0;
        LOBYTE(v7) = v11 & v12;
      }
    }
    else
    {
      LOBYTE(v7) = 1;
    }
  }
  return v7;
}

- (BOOL)isEmpty
{
  return -[TSDCanvasSelection isEqual:](self, "isEqual:", objc_msgSend((id)objc_opt_class(), "emptySelection"));
}

- (id)infosOfClass:(Class)a3
{
  NSSet *v4;
  _QWORD v6[5];

  v4 = -[TSDCanvasSelection infos](self, "infos");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__TSDCanvasSelection_infosOfClass___block_invoke;
  v6[3] = &unk_24D82B460;
  v6[4] = a3;
  return -[NSSet objectsPassingTest:](v4, "objectsPassingTest:", v6);
}

uint64_t __35__TSDCanvasSelection_infosOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)containsKindOfClass:(Class)a3
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = -[TSDCanvasSelection infos](self, "infos", 0, 0);
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          LOBYTE(v4) = 1;
          return v4;
        }
        ++v7;
      }
      while (v5 != v7);
      v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v5 = v4;
      if (v4)
        continue;
      break;
    }
  }
  return v4;
}

- (NSSet)unlockedInfos
{
  uint64_t v3;
  NSSet *v4;
  _QWORD v6[5];

  v3 = objc_opt_class();
  v4 = -[TSDCanvasSelection infos](self, "infos");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__TSDCanvasSelection_unlockedInfos__block_invoke;
  v6[3] = &unk_24D82B460;
  v6[4] = v3;
  return -[NSSet objectsPassingTest:](v4, "objectsPassingTest:", v6);
}

uint64_t __35__TSDCanvasSelection_unlockedInfos__block_invoke(uint64_t a1, void *a2)
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(a2, "isLocked") ^ 1;
  else
    return 1;
}

- (unint64_t)unlockedInfoCount
{
  return -[NSSet count](-[TSDCanvasSelection unlockedInfos](self, "unlockedInfos"), "count");
}

- (BOOL)containsUnlockedKindOfClass:(Class)a3
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = -[TSDCanvasSelection infos](self, "infos", 0);
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v8, "isLocked"))
        {
          LOBYTE(v4) = 1;
          return v4;
        }
        ++v7;
      }
      while (v5 != v7);
      v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v5 = v4;
      if (v4)
        continue;
      break;
    }
  }
  return v4;
}

- (id)copyIncludingInfo:(id)a3
{
  id *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (id *)-[TSDCanvasSelection copy](self, "copy");
  v5 = v4[1];
  if (v5)
    v6 = (id)objc_msgSend(v5, "mutableCopy");
  else
    v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v7 = v6;
  objc_msgSend(v6, "addObject:", a3);

  v4[1] = (id)objc_msgSend(v7, "copy");
  return v4;
}

- (id)copyExcludingInfo:(id)a3
{
  id *v4;
  void *v5;

  v4 = (id *)-[TSDCanvasSelection copy](self, "copy");
  v5 = (void *)objc_msgSend(v4[1], "mutableCopy");
  objc_msgSend(v5, "removeObject:", a3);

  v4[1] = (id)objc_msgSend(v5, "copy");
  return v4;
}

- (TSDContainerInfo)container
{
  return self->mContainer;
}

@end
