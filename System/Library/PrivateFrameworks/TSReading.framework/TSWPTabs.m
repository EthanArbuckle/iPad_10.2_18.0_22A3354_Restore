@implementation TSWPTabs

- (unint64_t)count
{
  return -[NSMutableArray count](self->_tabs, "count");
}

+ (id)tabs
{
  return objc_alloc_init(TSWPTabs);
}

- (TSWPTabs)init
{
  TSWPTabs *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSWPTabs;
  v2 = -[TSWPTabs init](&v4, sel_init);
  if (v2)
    v2->_tabs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  return v2;
}

- (TSWPTabs)initWithTabs:(id)a3
{
  TSWPTabs *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSWPTabs;
  v4 = -[TSWPTabs init](&v6, sel_init);
  if (v4)
    v4->_tabs = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:copyItems:", *((_QWORD *)a3 + 1), 1);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPTabs;
  -[TSWPTabs dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTabs:", self);
}

- (id)tabAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_tabs, "objectAtIndexedSubscript:", a3);
}

- (id)tabAtPosition:(double)a3
{
  NSMutableArray *tabs;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  tabs = self->_tabs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tabs, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v13;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v7)
      objc_enumerationMutation(tabs);
    v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
    objc_msgSend(v9, "position");
    if (vabdd_f64(a3, v10) <= 0.0000999999975)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tabs, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)tabAfterPosition:(double)a3
{
  NSMutableArray *tabs;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  tabs = self->_tabs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tabs, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v13;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v7)
      objc_enumerationMutation(tabs);
    v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
    objc_msgSend(v9, "position");
    if (v10 > a3)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tabs, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)insertTab:(id)a3
{
  double v5;
  double v6;
  NSMutableArray *tabs;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    objc_msgSend(a3, "position");
    v6 = v5;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    tabs = self->_tabs;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tabs, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v16;
      while (2)
      {
        v12 = 0;
        v13 = v10 + v9;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(tabs);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "position");
          if (v6 < v14)
          {
            v13 = v10 + v12;
            goto LABEL_13;
          }
          ++v12;
        }
        while (v9 != v12);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tabs, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v10 = v13;
        if (v9)
          continue;
        break;
      }
    }
    else
    {
      v13 = 0;
    }
LABEL_13:
    -[NSMutableArray insertObject:atIndex:](self->_tabs, "insertObject:atIndex:", a3, v13);
  }
}

- (void)removeTabAtIndex:(unint64_t)a3
{
  -[NSMutableArray removeObjectAtIndex:](self->_tabs, "removeObjectAtIndex:", a3);
}

- (void)setPosition:(double)a3 forTab:(id)a4
{
  double v6;
  id v7;

  objc_msgSend(a4, "position");
  if (v6 != a3)
  {
    if (-[TSWPTabs tabAtPosition:](self, "tabAtPosition:", a3))
    {
      objc_msgSend(a4, "setPosition:", a3);
    }
    else
    {
      v7 = a4;
      -[NSMutableArray removeObjectIdenticalTo:](self->_tabs, "removeObjectIdenticalTo:", a4);
      objc_msgSend(a4, "setPosition:", a3);
      -[TSWPTabs insertTab:](self, "insertTab:", a4);

    }
  }
}

- (unint64_t)indexForTabWithPosition:(double)a3 alignment:(int)a4 leader:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  double v13;
  const __CFString *v14;
  __CFString *v15;

  v9 = -[NSMutableArray count](self->_tabs, "count");
  if (!v9)
    return 0x7FFFFFFFFFFFFFFFLL;
  v10 = v9;
  v11 = 0;
  if (!a5)
    a5 = CFSTR(" ");
  while (1)
  {
    v12 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_tabs, "objectAtIndexedSubscript:", v11);
    if (objc_msgSend(v12, "alignment") == a4)
    {
      objc_msgSend(v12, "position");
      if (vabdd_f64(a3, v13) <= 0.0000999999975)
      {
        v14 = (const __CFString *)objc_msgSend(v12, "leader");
        v15 = v14 ? (__CFString *)v14 : CFSTR(" ");
        if ((objc_msgSend(a5, "isEqualToString:", v15) & 1) != 0)
          break;
      }
    }
    if (v10 == ++v11)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  NSMutableArray *tabs;
  NSMutableArray *v6;

  objc_opt_class();
  v4 = TSUDynamicCast();
  if (v4)
  {
    tabs = self->_tabs;
    v6 = *(NSMutableArray **)(v4 + 8);
    if (tabs == v6)
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = 0;
      if (tabs && v6)
        LOBYTE(v4) = -[NSMutableArray isEqualToArray:](self->_tabs, "isEqualToArray:");
    }
  }
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: tabs=%@>"), NSStringFromClass(v4), self->_tabs);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSMutableArray countByEnumeratingWithState:objects:count:](self->_tabs, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

@end
