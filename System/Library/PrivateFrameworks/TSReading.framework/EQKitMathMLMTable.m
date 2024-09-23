@implementation EQKitMathMLMTable

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  void *v7;
  EQKitMathMLMTable *v8;
  EQKitMathMLMTable *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a4, "pushState:", 2);
  v7 = (void *)objc_msgSend(a4, "parseChildrenAsArrayFromXMLNode:", a3);
  v20.receiver = self;
  v20.super_class = (Class)EQKitMathMLMTable;
  v8 = -[EQKitMathMLMTable init](&v20, sel_init);
  v9 = v8;
  if (a4)
  {
    if (a3)
    {
      if (v8)
      {
        v10 = v7;
        v9->mChildren = v10;
        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v17;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v17 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14++), "setParent:", v9);
            }
            while (v12 != v14);
            v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
          }
          while (v12);
        }
      }
    }
  }
  objc_msgSend(a4, "popState");
  return v9;
}

- (const)mathMLAttributes
{
  unsigned __int8 v2;

  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMTable mathMLAttributes]::sAttributesSet, -[EQKitMathMLMTable mathMLAttributes]::sAttributesData, (int *)&-[EQKitMathMLMTr mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMTable mathMLAttributes]::sAttributesSet;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMTable;
  -[EQKitMathMLMTable dealloc](&v3, sel_dealloc);
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

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %@>"), NSStringFromClass(v4), self, self->mChildren);
}

- (id)schemataChildren
{
  return self->mChildren;
}

@end
