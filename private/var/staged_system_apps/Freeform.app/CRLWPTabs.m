@implementation CRLWPTabs

+ (id)tabs
{
  return objc_alloc_init(CRLWPTabs);
}

- (CRLWPTabs)init
{
  CRLWPTabs *v2;
  NSMutableArray *v3;
  NSMutableArray *tabs;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLWPTabs;
  v2 = -[CRLWPTabs init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    tabs = v2->_tabs;
    v2->_tabs = v3;

  }
  return v2;
}

- (CRLWPTabs)initWithTabs:(id)a3
{
  _QWORD *v4;
  CRLWPTabs *v5;
  NSMutableArray *v6;
  NSMutableArray *tabs;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLWPTabs;
  v5 = -[CRLWPTabs init](&v9, "init");
  if (v5)
  {
    v6 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:copyItems:", v4[1], 1);
    tabs = v5->_tabs;
    v5->_tabs = v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5;
  id v6;

  *(_QWORD *)&v5 = objc_opt_class(self, a2).n128_u64[0];
  return _objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "initWithTabs:", self);
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableArray count](self->_tabs, "count");
}

- (id)tabAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndexedSubscript:](self->_tabs, "objectAtIndexedSubscript:", a3);
}

- (id)tabAtPosition:(double)a3
{
  NSMutableArray *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  double v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_tabs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "position", (_QWORD)v12);
        if (v9 == a3 || vabdd_f64(a3, v9) < fabs(v9 * 0.000000999999997))
        {
          v10 = v8;
          goto LABEL_13;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v10 = 0;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_13:

  return v10;
}

- (id)tabAfterPosition:(double)a3
{
  NSMutableArray *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  double v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_tabs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "position", (_QWORD)v12);
        v10 = v9 <= a3 || v9 == a3;
        if (!v10 && vabdd_f64(a3, v9) >= 0.00999999978)
        {
          v5 = v8;
          goto LABEL_15;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_15:

  return v5;
}

- (void)insertTab:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  NSMutableArray *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "position");
    v7 = v6;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = self->_tabs;
    v9 = (char *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = 0;
      v11 = *(_QWORD *)v16;
      while (2)
      {
        v12 = 0;
        v13 = &v9[(_QWORD)v10];
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12), "position", (_QWORD)v15);
          if (v7 < v14)
          {
            v13 = &v12[(_QWORD)v10];
            goto LABEL_13;
          }
          ++v12;
        }
        while (v9 != v12);
        v9 = (char *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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

    -[NSMutableArray insertObject:atIndex:](self->_tabs, "insertObject:atIndex:", v5, v13);
  }

}

- (void)removeTabAtIndex:(unint64_t)a3
{
  -[NSMutableArray removeObjectAtIndex:](self->_tabs, "removeObjectAtIndex:", a3);
}

- (void)setPosition:(double)a3 forTab:(id)a4
{
  double v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(v8, "position");
  if (v6 != a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTabs tabAtPosition:](self, "tabAtPosition:", a3));

    if (v7)
    {
      objc_msgSend(v8, "setPosition:", a3);
    }
    else
    {
      -[NSMutableArray removeObjectIdenticalTo:](self->_tabs, "removeObjectIdenticalTo:", v8);
      objc_msgSend(v8, "setPosition:", a3);
      -[CRLWPTabs insertTab:](self, "insertTab:", v8);
    }
  }

}

- (unint64_t)indexForTabWithPosition:(double)a3 alignment:(int)a4 leader:(id)a5
{
  __CFString *v8;
  id v9;
  unint64_t v10;
  __CFString *v11;
  void *v12;
  double v13;
  void *v14;
  __CFString *v15;
  const __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  unsigned int v19;

  v8 = (__CFString *)a5;
  v9 = -[NSMutableArray count](self->_tabs, "count");
  if (v9)
  {
    v10 = 0;
    if (v8)
      v11 = v8;
    else
      v11 = CFSTR(" ");
    while (1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_tabs, "objectAtIndexedSubscript:", v10));
      if (objc_msgSend(v12, "alignment") == a4)
      {
        objc_msgSend(v12, "position");
        if (v13 == a3 || vabdd_f64(a3, v13) < fabs(v13 * 0.000000999999997))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leader"));
          v15 = v8;
          v16 = v14;
          v17 = (__CFString *)v16;
          v18 = v16 ? (__CFString *)v16 : CFSTR(" ");
          v19 = -[__CFString isEqualToString:](v11, "isEqualToString:", v18);

          if (v19)
            break;
        }
      }

      if (v9 == (id)++v10)
        goto LABEL_13;
    }

  }
  else
  {
LABEL_13:
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  NSMutableArray *tabs;
  NSMutableArray *v10;
  unsigned __int8 v11;

  v4 = a3;
  objc_opt_class(self, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    tabs = self->_tabs;
    v10 = (NSMutableArray *)v8[1];
    if (tabs == v10)
    {
      v11 = 1;
    }
    else
    {
      v11 = 0;
      if (tabs && v10)
        v11 = -[NSMutableArray isEqualToArray:](tabs, "isEqualToArray:");
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSMutableArray count](self->_tabs, "count");
}

- (id)description
{
  Class v3;
  NSString *v4;
  void *v5;
  void *v6;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: tabs=%@>"), v5, self->_tabs));

  return v6;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return (unint64_t)-[NSMutableArray countByEnumeratingWithState:objects:count:](self->_tabs, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabs, 0);
}

@end
