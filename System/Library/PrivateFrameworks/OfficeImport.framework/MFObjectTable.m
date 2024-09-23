@implementation MFObjectTable

- (MFObjectTable)init
{
  MFObjectTable *v2;
  uint64_t v3;
  NSMutableArray *m_objects;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFObjectTable;
  v2 = -[MFObjectTable init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    m_objects = v2->m_objects;
    v2->m_objects = (NSMutableArray *)v3;

    v2->m_maximumSize = 0;
  }
  return v2;
}

- (unsigned)insertPos
{
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char isKindOfClass;

  v3 = -[NSMutableArray count](self->m_objects, "count");
  v4 = v3;
  if (v3)
  {
    v5 = 0;
    v6 = v3;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->m_objects, "objectAtIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        break;
      if (v6 == ++v5)
        return v4;
    }
    return v5;
  }
  return v4;
}

- (int)deleteObject:(unsigned int)a3
{
  uint64_t v4;
  void *v5;
  char isKindOfClass;
  NSMutableArray *m_objects;
  void *v8;

  v4 = a3;
  -[NSMutableArray objectAtIndex:](self->m_objects, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    m_objects = self->m_objects;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray replaceObjectAtIndex:withObject:](m_objects, "replaceObjectAtIndex:withObject:", v4, v8);

  }
  return 0;
}

- (void)clear
{
  -[NSMutableArray removeAllObjects](self->m_objects, "removeAllObjects");
}

- (int)size
{
  return -[NSMutableArray count](self->m_objects, "count");
}

- (int)selectInto:(int)a3 io_DC:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[NSMutableArray objectAtIndex:](self->m_objects, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(v7, "selectInto:", v6);

  return 0;
}

- (int)putObject:(id)a3 in_objectPos:(unsigned int)a4
{
  id v6;
  int v7;
  unsigned int v8;
  int v9;
  NSMutableArray *m_objects;
  void *v11;

  v6 = a3;
  if (self->m_maximumSize - 1 >= a4)
  {
    if (a4 == -1)
      a4 = -[MFObjectTable insertPos](self, "insertPos");
    v8 = -[NSMutableArray count](self->m_objects, "count");
    v9 = a4 - v8;
    if (a4 >= v8)
    {
      if (a4 > v8)
      {
        do
        {
          m_objects = self->m_objects;
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](m_objects, "addObject:", v11);

          --v9;
        }
        while (v9);
      }
      -[NSMutableArray addObject:](self->m_objects, "addObject:", v6);
    }
    else
    {
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->m_objects, "replaceObjectAtIndex:withObject:", a4, v6);
    }
    v7 = 0;
  }
  else
  {
    v7 = -7;
  }

  return v7;
}

- (id)getObject:(unsigned int)a3
{
  void *v3;
  id v5;

  -[NSMutableArray objectAtIndex:](self->m_objects, "objectAtIndex:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v5;
    v5 = 0;

  }
  return v5;
}

- (unsigned)maximumSize
{
  return self->m_maximumSize;
}

- (void)setMaximumSize:(unsigned int)a3
{
  self->m_maximumSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_objects, 0);
}

@end
