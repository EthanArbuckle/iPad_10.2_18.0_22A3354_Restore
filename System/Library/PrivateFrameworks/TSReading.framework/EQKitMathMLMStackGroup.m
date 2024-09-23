@implementation EQKitMathMLMStackGroup

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  return -[EQKitMathMLMStackGroup initWithChildren:](self, "initWithChildren:", objc_msgSend(a4, "parseChildrenAsArrayFromXMLNode:", a3));
}

- (const)mathMLAttributes
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMStackGroup mathMLAttributes]::sAttributesSet, (int *)&-[EQKitMathMLMStackGroup mathMLAttributes]::sAttributesData, (int *)&-[EQKitMathMLMStackLine mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMStackGroup mathMLAttributes]::sAttributesSet;
}

- (EQKitMathMLMStackGroup)initWithChildren:(id)a3
{
  EQKitMathMLMStackGroup *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  EQKitMathMLMStackRow *v11;
  NSArray *mChildren;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)EQKitMathMLMStackGroup;
  v4 = -[EQKitMathMLMStackGroup init](&v22, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(a3, "count");
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      for (i = 0; i != v6; ++i)
      {
        v9 = objc_msgSend(a3, "objectAtIndex:", i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v7)
                {
                  v7 = (void *)objc_msgSend(a3, "mutableCopy");
                  a3 = v7;
                }
                v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v9, 0);
                v11 = -[EQKitMathMLMStackRow initWithChildren:]([EQKitMathMLMStackRow alloc], "initWithChildren:", v10);
                objc_msgSend(v7, "replaceObjectAtIndex:withObject:", i, v11);

              }
            }
          }
        }
      }
    }
    else
    {
      v7 = 0;
    }
    v4->mChildren = (NSArray *)a3;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    mChildren = v4->mChildren;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(mChildren);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "setParent:", v4);
        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v14);
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMStackGroup;
  -[EQKitMathMLMStackGroup dealloc](&v3, sel_dealloc);
}

- (BOOL)isBaseFontNameUsed
{
  NSArray *mChildren;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  mChildren = self->mChildren;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(mChildren);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "isBaseFontNameUsed") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return v3;
}

- (id)schemataChildren
{
  return self->mChildren;
}

@end
