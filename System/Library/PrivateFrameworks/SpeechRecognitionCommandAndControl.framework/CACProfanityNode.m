@implementation CACProfanityNode

- (CACProfanityNode)init
{
  CACProfanityNode *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *childMap;
  NSMutableDictionary *v5;
  NSMutableDictionary *terminalMap;
  NSMutableDictionary *v7;
  NSMutableDictionary *originalWordMap;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CACProfanityNode;
  v2 = -[CACProfanityNode init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    childMap = v2->_childMap;
    v2->_childMap = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    terminalMap = v2->_terminalMap;
    v2->_terminalMap = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    originalWordMap = v2->_originalWordMap;
    v2->_originalWordMap = v7;

  }
  return v2;
}

- (void)createChildForKey:(id)a3
{
  void *v4;
  CACProfanityNode *v5;
  id v6;

  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_childMap, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc_init(CACProfanityNode);
    -[NSMutableDictionary setObject:forKey:](self->_childMap, "setObject:forKey:", v5, v6);

  }
}

- (void)setTerminal:(id)a3 originalWord:(id)a4 forKey:(id)a5
{
  NSMutableDictionary *terminalMap;
  id v9;
  id v10;

  terminalMap = self->_terminalMap;
  v9 = a5;
  v10 = a4;
  -[NSMutableDictionary setObject:forKey:](terminalMap, "setObject:forKey:", a3, v9);
  -[NSMutableDictionary setObject:forKey:](self->_originalWordMap, "setObject:forKey:", v10, v9);

}

- (id)childForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_childMap, "objectForKey:", a3);
}

- (id)terminalForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_terminalMap, "objectForKey:", a3);
}

- (id)originalWordForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_originalWordMap, "objectForKey:", a3);
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NSMutableDictionary allKeys](self->_childMap, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("child:%@"), self->_childMap);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_24F2ADCC8;
  }
  -[NSMutableDictionary allKeys](self->_terminalMap, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("terminal:%@"), self->_terminalMap);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@"), v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@"), v6, &stru_24F2ADCC8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v5)
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalWordMap, 0);
  objc_storeStrong((id *)&self->_terminalMap, 0);
  objc_storeStrong((id *)&self->_childMap, 0);
}

@end
