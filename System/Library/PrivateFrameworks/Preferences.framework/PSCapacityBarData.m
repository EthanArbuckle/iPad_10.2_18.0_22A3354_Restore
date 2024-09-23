@implementation PSCapacityBarData

- (id)copyWithZone:(_NSZone *)a3
{
  PSCapacityBarData *v4;
  NSArray *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSArray *categories;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(PSCapacityBarData);
  v4->_categoryLimit = self->_categoryLimit;
  v4->_hideTinyCategories = self->_hideTinyCategories;
  v4->_sortStyle = self->_sortStyle;
  v4->_capacity = self->_capacity;
  v4->_bytesUsed = self->_bytesUsed;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_categories, "count"));
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_categories;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "copy", (_QWORD)v14);
        -[NSArray addObject:](v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  categories = v4->_categories;
  v4->_categories = v5;

  return v4;
}

- (NSArray)orderedCategories
{
  NSArray *orderedCategories;
  void *v4;
  NSArray *v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  unint64_t categoryLimit;
  NSArray *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  orderedCategories = self->_orderedCategories;
  if (!orderedCategories)
  {
    -[PSCapacityBarData categories](self, "categories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      if (self->_hideTinyCategories)
        v6 = llround((double)self->_capacity * 0.01);
      else
        v6 = 1;
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v7 = v4;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            if (objc_msgSend(v12, "bytes", (_QWORD)v17) >= v6)
            {
              v13 = (void *)objc_msgSend(v12, "copy");
              -[NSArray addObject:](v5, "addObject:", v13);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v9);
      }

      if (self->_sortStyle == 1)
        -[NSArray sortUsingComparator:](v5, "sortUsingComparator:", &__block_literal_global_37);
      categoryLimit = self->_categoryLimit;
      if (categoryLimit && categoryLimit < -[NSArray count](v5, "count"))
        -[NSArray removeObjectsInRange:](v5, "removeObjectsInRange:", self->_categoryLimit, -[NSArray count](v5, "count") - self->_categoryLimit);
    }
    v15 = self->_orderedCategories;
    self->_orderedCategories = v5;

    orderedCategories = self->_orderedCategories;
  }
  return orderedCategories;
}

uint64_t __38__PSCapacityBarData_orderedCategories__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "bytes");
  v6 = objc_msgSend(v4, "bytes");

  if (v5 < v6)
    return 1;
  else
    return -1;
}

- (NSArray)adjustedCategories
{
  NSArray *adjustedCategories;
  NSArray *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  PSCapacityBarData *v11;
  int64_t capacity;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  NSArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t m;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  NSArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  NSArray *v40;
  PSCapacityBarData *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  adjustedCategories = self->_adjustedCategories;
  if (!adjustedCategories)
  {
    -[PSCapacityBarData orderedCategories](self, "orderedCategories");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v43, "count"));
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v5 = self->_orderedCategories;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v57 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "copy");
          -[NSArray addObject:](v4, "addObject:", v10);

        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
      }
      while (v7);
    }

    v11 = self;
    if (-[PSCapacityBarData hideTinyCategories](self, "hideTinyCategories"))
      goto LABEL_43;
    v42 = self;
    capacity = self->_capacity;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v13 = v4;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = llround((double)capacity * 0.01);
      v21 = *(_QWORD *)v53;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v53 != v21)
            objc_enumerationMutation(v13);
          v23 = objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "bytes", v42);
          v17 += v23 - v20;
          v16 += v23;
          if (v23 <= v20)
            v24 = v20;
          else
            v24 = 0;
          v18 += v24;
          if (v23 <= v20)
            v25 = 0;
          else
            v25 = v23;
          v19 += v25;
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
      }
      while (v15);

      v11 = v42;
      if (!v18)
        goto LABEL_43;
      if (v17 < 1)
      {
        v46 = 0uLL;
        v47 = 0uLL;
        v44 = 0uLL;
        v45 = 0uLL;
        v35 = v13;
        v36 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v45;
          do
          {
            for (k = 0; k != v37; ++k)
            {
              if (*(_QWORD *)v45 != v38)
                objc_enumerationMutation(v35);
              objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * k), "setBytes:", v20);
            }
            v37 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
          }
          while (v37);
        }
      }
      else
      {
        v50 = 0uLL;
        v51 = 0uLL;
        v48 = 0uLL;
        v49 = 0uLL;
        v26 = v13;
        v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v49;
          v30 = (double)v19;
          do
          {
            for (m = 0; m != v28; ++m)
            {
              if (*(_QWORD *)v49 != v29)
                objc_enumerationMutation(v26);
              v32 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * m);
              v33 = objc_msgSend(v32, "bytes");
              v34 = v20;
              if (v33 > v20)
                v34 = llround((double)v33 / v30 * (double)(v16 - v18));
              objc_msgSend(v32, "setBytes:", v34);
            }
            v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
          }
          while (v28);
        }
      }
    }

    v11 = v42;
LABEL_43:
    v40 = v11->_adjustedCategories;
    v11->_adjustedCategories = v4;

    adjustedCategories = v11->_adjustedCategories;
  }
  return adjustedCategories;
}

- (void)setCategories:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSArray *categories;
  NSArray *v13;
  NSArray *orderedCategories;
  NSArray *adjustedCategories;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "copy", (_QWORD)v16);
        -[NSArray addObject:](v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  categories = self->_categories;
  self->_categories = v5;
  v13 = v5;

  orderedCategories = self->_orderedCategories;
  self->_orderedCategories = 0;

  adjustedCategories = self->_adjustedCategories;
  self->_adjustedCategories = 0;

}

- (int64_t)categoryLimit
{
  return self->_categoryLimit;
}

- (void)setCategoryLimit:(int64_t)a3
{
  self->_categoryLimit = a3;
}

- (BOOL)hideTinyCategories
{
  return self->_hideTinyCategories;
}

- (void)setHideTinyCategories:(BOOL)a3
{
  self->_hideTinyCategories = a3;
}

- (int)sortStyle
{
  return self->_sortStyle;
}

- (void)setSortStyle:(int)a3
{
  self->_sortStyle = a3;
}

- (int64_t)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(int64_t)a3
{
  self->_capacity = a3;
}

- (int64_t)bytesUsed
{
  return self->_bytesUsed;
}

- (void)setBytesUsed:(int64_t)a3
{
  self->_bytesUsed = a3;
}

- (NSArray)categories
{
  return self->_categories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_adjustedCategories, 0);
  objc_storeStrong((id *)&self->_orderedCategories, 0);
}

@end
