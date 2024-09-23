@implementation EQKitMathMLMRow

- (EQKitMathMLMRow)init
{
  return -[EQKitMathMLMRow initWithChildren:](self, "initWithChildren:", objc_msgSend(MEMORY[0x24BDBCE30], "array"));
}

- (EQKitMathMLMRow)initWithChildren:(id)a3
{
  return -[EQKitMathMLMRow initWithChildren:node:](self, "initWithChildren:node:", a3, 0);
}

- (EQKitMathMLMRow)initWithChildren:(id)a3 node:(_xmlNode *)a4
{
  EQKitMathMLMRow *v6;
  NSArray *mChildren;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)EQKitMathMLMRow;
  v6 = -[EQKitMathMLMRow init](&v17, sel_init);
  if (v6)
  {
    v6->mChildren = (NSArray *)a3;
    v6->mFlags.mImplied = a4 == 0;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    mChildren = v6->mChildren;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(mChildren);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "setParent:", v6);
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v9);
    }
  }
  return v6;
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  return -[EQKitMathMLMRow initWithChildren:node:](self, "initWithChildren:node:", objc_msgSend(a4, "parseChildrenAsArrayFromXMLNode:"), a3);
}

- (const)mathMLAttributes
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMRow;
  -[EQKitMathMLMRow dealloc](&v3, sel_dealloc);
}

- (Schemata)layoutSchemata
{
  return (Schemata *)EQKit::Layout::Schemata::row((EQKit::Layout::Schemata *)self->mChildren, (uint64_t)retstr);
}

- (BOOL)isEmbellishedOperator
{
  NSArray *v2;

  v2 = EQKitLayoutFilterOutSpaceLike(self->mChildren);
  if (-[NSArray count](v2, "count") == 1)
    return objc_msgSend(-[NSArray objectAtIndex:](v2, "objectAtIndex:", 0), "isEmbellishedOperator");
  else
    return 0;
}

- (id)operatorCore
{
  NSArray *v2;

  v2 = EQKitLayoutFilterOutSpaceLike(self->mChildren);
  if (-[NSArray count](v2, "count") == 1)
    return (id)objc_msgSend(-[NSArray objectAtIndex:](v2, "objectAtIndex:", 0), "operatorCore");
  else
    return 0;
}

- (int)isOperatorPaddingRequired
{
  return 2;
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
  NSString *v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self->mFlags.mImplied)
    v6 = CFSTR("implied ");
  else
    v6 = &stru_24D82FEB0;
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %@%@>"), v5, self, v6, self->mChildren);
}

- (id)schemataChildren
{
  return self->mChildren;
}

@end
