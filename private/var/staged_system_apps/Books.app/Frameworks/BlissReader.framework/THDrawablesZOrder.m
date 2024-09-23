@implementation THDrawablesZOrder

- (THDrawablesZOrder)initWithContext:(id)a3
{
  THDrawablesZOrder *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THDrawablesZOrder;
  v3 = -[THDrawablesZOrder initWithContext:](&v5, "initWithContext:", a3);
  if (v3)
    v3->mDrawables = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THDrawablesZOrder;
  -[THDrawablesZOrder dealloc](&v3, "dealloc");
}

- (unint64_t)drawableCount
{
  return (unint64_t)-[NSMutableArray count](self->mDrawables, "count");
}

- (id)drawableAtZOrder:(unint64_t)a3
{
  if ((unint64_t)-[NSMutableArray count](self->mDrawables, "count") <= a3)
    return 0;
  else
    return -[NSMutableArray objectAtIndex:](self->mDrawables, "objectAtIndex:", a3);
}

- (unint64_t)zOrderOfDrawable:(id)a3
{
  if (a3)
    return (unint64_t)-[NSMutableArray indexOfObjectIdenticalTo:](self->mDrawables, "indexOfObjectIdenticalTo:");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)addDrawable:(id)a3
{
  return -[THDrawablesZOrder insertDrawable:atZOrder:](self, "insertDrawable:atZOrder:", a3, 0xFFFFFFFFLL);
}

- (unint64_t)insertDrawable:(id)a3 atZOrder:(unint64_t)a4
{
  unint64_t v4;
  id v8;

  v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3
    && -[NSMutableArray indexOfObjectIdenticalTo:](self->mDrawables, "indexOfObjectIdenticalTo:") == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = -[NSMutableArray count](self->mDrawables, "count");
    if ((unint64_t)v8 >= a4)
      v4 = a4;
    else
      v4 = (unint64_t)v8;
    -[NSMutableArray insertObject:atIndex:](self->mDrawables, "insertObject:atIndex:", a3, v4);
  }
  return v4;
}

- (void)removeDrawableAtZOrder:(unint64_t)a3
{
  if ((unint64_t)-[NSMutableArray count](self->mDrawables, "count") > a3)
    -[NSMutableArray removeObjectAtIndex:](self->mDrawables, "removeObjectAtIndex:", a3);
}

- (void)removeDrawable:(id)a3
{
  -[THDrawablesZOrder removeDrawableAtZOrder:](self, "removeDrawableAtZOrder:", -[THDrawablesZOrder zOrderOfDrawable:](self, "zOrderOfDrawable:", a3));
}

- (void)moveDrawableAtZOrder:(unint64_t)a3 toZOrder:(unint64_t)a4
{
  char *v7;
  id v8;
  id v9;
  id v10;

  if (a3 != a4 && a3 + 1 != a4)
  {
    v7 = (char *)-[NSMutableArray count](self->mDrawables, "count");
    if (a4 != 0xFFFFFFFF || v7 - 1 != (char *)a3)
    {
      v10 = -[NSMutableArray objectAtIndex:](self->mDrawables, "objectAtIndex:", a3);
      v8 = v10;
      -[NSMutableArray removeObjectAtIndex:](self->mDrawables, "removeObjectAtIndex:", a3);
      if (a4 == 0xFFFFFFFF)
        v9 = -[NSMutableArray count](self->mDrawables, "count");
      else
        v9 = (id)((__PAIR128__(a4, a3) - a4) >> 64);
      -[NSMutableArray insertObject:atIndex:](self->mDrawables, "insertObject:atIndex:", v10, v9);

    }
  }
}

- (void)moveDrawable:(id)a3 toZOrder:(unint64_t)a4
{
  -[THDrawablesZOrder moveDrawableAtZOrder:toZOrder:](self, "moveDrawableAtZOrder:toZOrder:", -[THDrawablesZOrder zOrderOfDrawable:](self, "zOrderOfDrawable:", a3), a4);
}

- (void)moveDrawables:(id)a3 toZOrder:(unint64_t)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(a3);
        -[THDrawablesZOrder moveDrawable:toZOrder:](self, "moveDrawable:toZOrder:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), a4);
        if (a4 != 0xFFFFFFFF)
          ++a4;
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (void)swapDrawableAtZOrder:(unint64_t)a3 withDrawableAtZOrder:(unint64_t)a4
{
  id v7;

  v7 = -[NSMutableArray count](self->mDrawables, "count");
  if (a3 != a4 && (unint64_t)v7 > a3 && (unint64_t)v7 > a4)
    -[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:](self->mDrawables, "exchangeObjectAtIndex:withObjectAtIndex:", a3, a4);
}

- (id)orderedDrawables:(id)a3
{
  NSMutableArray *v3;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  id v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char *v26;
  char *v27;
  uint64_t v28;
  _BYTE v29[128];

  v3 = (NSMutableArray *)a3;
  if (a3)
  {
    v26 = 0;
    v27 = 0;
    v28 = 0;
    if ((objc_opt_respondsToSelector(a3, "count") & 1) != 0)
      sub_36924((void **)&v26, (unint64_t)-[NSMutableArray count](v3, "count"));
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v9 = -[NSMutableArray indexOfObjectIdenticalTo:](self->mDrawables, "indexOfObjectIdenticalTo:", v8, v20, v21);
          if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v20 = v8;
            v21 = v9;
            v11 = v26;
            v10 = (uint64_t)v27;
            if (v27 != v26)
            {
              v12 = (v27 - v26) >> 4;
              do
              {
                v13 = v12 >> 1;
                v14 = &v11[16 * (v12 >> 1)];
                v15 = *((_QWORD *)v14 + 1);
                v16 = v14 + 16;
                v12 += ~(v12 >> 1);
                if (v15 < (unint64_t)v9)
                  v11 = v16;
                else
                  v12 = v13;
              }
              while (v12);
              v10 = (uint64_t)v11;
            }
            sub_369BC(&v26, v10, &v20);
          }
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
      }
      while (v5);
    }
    v17 = v27;
    if (v27 == v26)
    {
      v3 = 0;
      if (!v27)
        return v3;
      goto LABEL_25;
    }
    v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (v27 - v26) >> 4);
    v17 = v26;
    v18 = v27;
    if (v26 != v27)
    {
      do
      {
        -[NSMutableArray addObject:](v3, "addObject:", *(_QWORD *)v17, v20, v21);
        v17 += 16;
      }
      while (v17 != v18);
      v17 = v26;
    }
    if (v17)
    {
LABEL_25:
      v27 = v17;
      operator delete(v17);
    }
  }
  return v3;
}

- (void)removeAllDrawables
{
  NSMutableArray *i;

  for (i = self->mDrawables; -[NSMutableArray count](i, "count"); i = self->mDrawables)
    -[THDrawablesZOrder removeDrawableAtZOrder:](self, "removeDrawableAtZOrder:", 0);
}

@end
