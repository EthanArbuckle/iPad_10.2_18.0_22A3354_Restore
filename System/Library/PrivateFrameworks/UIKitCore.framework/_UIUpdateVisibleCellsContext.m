@implementation _UIUpdateVisibleCellsContext

- (void)addPreferredAttributes:(uint64_t)a1
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel_addPreferredAttributes_, a1, CFSTR("UICollectionViewLayout.m"), 3053, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("attributes"));

    }
    objc_msgSend(a2, "size");
    v5 = v4;
    v7 = v6;
    objc_msgSend(a2, "indexPath");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (a2)
        goto LABEL_6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel_addPreferredAttributes_, a1, CFSTR("UICollectionViewLayout.m"), 3057, CFSTR("Received preferred attributes without an index path. Attributes: %@"), a2);

      if (a2)
      {
LABEL_6:
        if ((a2[144] & 1) != 0)
        {
          v8 = *(void **)(a1 + 8);
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v5, v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v9);

          objc_msgSend(*(id *)(a1 + 24), "addObject:", v12);
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(v12, "section"));
    objc_msgSend(*(id *)(a1 + 16), "addObject:", a2);

  }
}

- (_UIUpdateVisibleCellsContext)init
{
  _UIUpdateVisibleCellsContext *v2;
  NSMutableArray *v3;
  NSMutableArray *sizes;
  NSMutableArray *v5;
  NSMutableArray *indexPaths;
  NSMutableIndexSet *v7;
  NSMutableIndexSet *sectionIndexes;
  NSMutableArray *v9;
  NSMutableArray *attributes;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIUpdateVisibleCellsContext;
  v2 = -[_UIUpdateVisibleCellsContext init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sizes = v2->_sizes;
    v2->_sizes = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    indexPaths = v2->_indexPaths;
    v2->_indexPaths = v5;

    v7 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    sectionIndexes = v2->_sectionIndexes;
    v2->_sectionIndexes = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    attributes = v2->_attributes;
    v2->_attributes = v9;

    v2->_visibleCellsRefCount = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIndexes, 0);
  objc_storeStrong((id *)&self->_indexPaths, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_sizes, 0);
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CGSize v17;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@:%p "), v5, self);

  if (-[NSMutableArray count](self->_sizes, "count"))
  {
    v6 = 0;
    do
    {
      if (v6)
        objc_msgSend(v3, "appendString:", CFSTR("; "));
      -[NSMutableArray objectAtIndexedSubscript:](self->_sizes, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "CGSizeValue");
      v9 = v8;
      v11 = v10;

      -[NSMutableArray objectAtIndexedSubscript:](self->_indexPaths, "objectAtIndexedSubscript:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "section"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "item"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17.width = v9;
      v17.height = v11;
      NSStringFromCGSize(v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("(%@,%@) -> %@"), v13, v14, v15);

      ++v6;
    }
    while (v6 < -[NSMutableArray count](self->_sizes, "count"));
  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

@end
