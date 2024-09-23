@implementation EQKitMathMLMStackCarry

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  return -[EQKitMathMLMStackCarry initWithChildren:](self, "initWithChildren:", objc_msgSend(a4, "parseChildrenAsArrayFromXMLNode:", a3));
}

- (const)mathMLAttributes
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMStackCarry mathMLAttributes]::sAttributesSet, &-[EQKitMathMLMStackCarry mathMLAttributes]::sAttributesData, &dword_217C27734);
  }
  return &-[EQKitMathMLMStackCarry mathMLAttributes]::sAttributesSet;
}

- (EQKitMathMLMStackCarry)initWithChildren:(id)a3
{
  EQKitMathMLMStackCarry *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)EQKitMathMLMStackCarry;
  v4 = -[EQKitMathMLMStackCarry init](&v15, sel_init);
  if (v4)
  {
    v5 = (NSArray *)a3;
    v4->mChildren = v5;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "setParent:", v4);
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v7);
    }
  }
  return v4;
}

- (EQKitMathMLMStackCarry)initWithChild:(id)a3
{
  void *v4;
  EQKitMathMLMStackCarry *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", a3, 0);
  v5 = -[EQKitMathMLMStackCarry initWithChildren:](self, "initWithChildren:", v4);

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMStackCarry;
  -[EQKitMathMLMStackCarry dealloc](&v3, sel_dealloc);
}

- (id)schemataChildren
{
  return self->mChildren;
}

@end
