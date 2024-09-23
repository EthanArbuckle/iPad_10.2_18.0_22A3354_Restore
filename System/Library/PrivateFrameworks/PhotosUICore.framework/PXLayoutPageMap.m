@implementation PXLayoutPageMap

- (PXLayoutPageMap)initWithSources:(id)a3 contentRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  PXLayoutPageMap *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMapTable *pageMap;
  uint64_t v15;
  NSArray *sources;
  objc_super v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXLayoutPageMap;
  v10 = -[PXLayoutPageMap init](&v18, sel_init);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3870], "pointerFunctionsWithOptions:", 1282);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3870], "pointerFunctionsWithOptions:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyPointerFunctions:valuePointerFunctions:capacity:", v11, v12, 0);
    pageMap = v10->_pageMap;
    v10->_pageMap = (NSMapTable *)v13;

    v10->_contentRect.origin.x = x;
    v10->_contentRect.origin.y = y;
    v10->_contentRect.size.width = width;
    v10->_contentRect.size.height = height;
    v15 = objc_msgSend(v9, "copy");
    sources = v10->_sources;
    v10->_sources = (NSArray *)v15;

    -[PXLayoutPageMap _mapSources:](v10, "_mapSources:", v10->_sources);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXLayoutPageMap;
  -[PXLayoutPageMap description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("pageMap:%@"), self->_pageMap);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_screenPageForPoint:(CGPoint)a3
{
  uint64_t v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v9;
  CGRect v11;
  CGRect v12;

  v4 = PXPageKeyForCGPoint();
  x = self->_contentRect.origin.x;
  y = self->_contentRect.origin.y;
  width = self->_contentRect.size.width;
  height = self->_contentRect.size.height;
  PXPageAlignedRectForCGPoint();
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  if (CGRectIntersectsRect(v11, v12))
  {
    -[NSMapTable objectForKey:](self->_pageMap, "objectForKey:", v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      -[NSMapTable setObject:forKey:](self->_pageMap, "setObject:forKey:", v9, v4);
    }
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)sourcesFromRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  id v9;
  double i;
  double v11;
  void *v12;
  double MaxX;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsNull(a3))
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    for (i = y; ; i = i + 1024.0)
    {
      v11 = x;
      do
      {
        -[NSMapTable objectForKey:](self->_pageMap, "objectForKey:", PXPageKeyForCGPoint());
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addIndexes:", v12);
        v24.origin.x = x;
        v24.origin.y = y;
        v24.size.width = width;
        v24.size.height = height;
        MaxX = CGRectGetMaxX(v24);

        v14 = v11 <= MaxX;
        v11 = v11 + 1024.0;
      }
      while (v14);
      v25.origin.x = x;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      if (i > CGRectGetMaxY(v25))
        break;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v9, "firstIndex");
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = v15;
      do
      {
        -[NSArray objectAtIndexedSubscript:](self->_sources, "objectAtIndexedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          objc_msgSend(v17, "frame");
          v27.origin.x = v19;
          v27.origin.y = v20;
          v27.size.width = v21;
          v27.size.height = v22;
          v26.origin.x = x;
          v26.origin.y = y;
          v26.size.width = width;
          v26.size.height = height;
          if (CGRectIntersectsRect(v26, v27))
            objc_msgSend(v8, "addObject:", v18);
        }
        v16 = objc_msgSend(v9, "indexGreaterThanIndex:", v16);

      }
      while (v16 != 0x7FFFFFFFFFFFFFFFLL);
    }

  }
  return v8;
}

- (void)_mapSources:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__PXLayoutPageMap__mapSources___block_invoke;
  v3[3] = &unk_1E5125210;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_pageMap, 0);
}

void __31__PXLayoutPageMap__mapSources___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double i;
  double j;
  void *v11;
  void *v12;
  void *v13;
  CGFloat v14;
  void *v15;
  id v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v16 = a2;
  objc_msgSend(v16, "frame");
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  for (i = CGRectGetMinX(v17); ; i = i + 1024.0)
  {
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    CGRectGetMinY(v18);
    PXPageAlignedRectForCGPoint();
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    if (!CGRectIntersectsRect(v19, v26))
      break;
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    for (j = CGRectGetMinY(v20); ; j = j + 1024.0)
    {
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      CGRectGetMinX(v21);
      PXPageAlignedRectForCGPoint();
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      if (!CGRectIntersectsRect(v22, v27))
        break;
      objc_msgSend(*(id *)(a1 + 32), "_screenPageForPoint:", i, j);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addIndex:", a3);

    }
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    objc_msgSend(*(id *)(a1 + 32), "_screenPageForPoint:", i, CGRectGetMaxY(v23) + -1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addIndex:", a3);

  }
  v13 = *(void **)(a1 + 32);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v14 = CGRectGetMaxX(v24) + -1.0;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  objc_msgSend(v13, "_screenPageForPoint:", v14, CGRectGetMaxY(v25) + -1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addIndex:", a3);

}

@end
