@implementation PXGadgetDataSource

- (PXGadgetDataSource)initWithGadgetSections:(id)a3
{
  id v5;
  PXGadgetDataSource *v6;
  PXGadgetDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXGadgetDataSource;
  v6 = -[PXGadgetDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_gadgetSections, a3);

  return v7;
}

- (PXGadgetDataSource)init
{
  return -[PXGadgetDataSource initWithGadgetSections:](self, "initWithGadgetSections:", MEMORY[0x1E0C9AA60]);
}

- (int64_t)numberOfSections
{
  return -[NSArray count](self->_gadgetSections, "count");
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[NSArray objectAtIndexedSubscript:](self->_gadgetSections, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gadgets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;
  _OWORD v5[2];

  v3 = *(_OWORD *)&a3->item;
  v5[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v5[1] = v3;
  -[PXGadgetDataSource gadgetAtIndexPath:](self, "gadgetAtIndexPath:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)gadgetSectionAtIndexPath:(PXSimpleIndexPath *)a3
{
  void *v9;
  void *v10;

  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98
    || a3->section == 0x7FFFFFFFFFFFFFFFLL
    || a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetDataSource.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsSection(indexPath)"));

  }
  if (-[PXGadgetDataSource identifier](self, "identifier") != a3->dataSourceIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetDataSource.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.identifier == indexPath.dataSourceIdentifier"));

  }
  return -[NSArray objectAtIndexedSubscript:](self->_gadgetSections, "objectAtIndexedSubscript:", a3->section);
}

- (id)gadgetSectionWithIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v8;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetDataSource.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v10 = 0u;
  v11 = 0u;
  -[PXGadgetDataSource indexPathForGadgetSectionWithIdentifier:](self, "indexPathForGadgetSectionWithIdentifier:", v5);
  if (*(_QWORD *)off_1E50B7E98)
  {
    v9[0] = v10;
    v9[1] = v11;
    -[PXGadgetDataSource gadgetSectionAtIndexPath:](self, "gadgetSectionAtIndexPath:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PXSimpleIndexPath)indexPathForGadgetSectionWithIdentifier:(SEL)a3
{
  id v7;
  __int128 v8;
  NSArray *gadgetSections;
  id v10;
  __int128 v11;
  PXSimpleIndexPath *result;
  void *v13;
  _QWORD v14[4];
  id v15;
  PXGadgetDataSource *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXGadgetDataSource.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x4010000000;
  v21 = &unk_1A7E74EE7;
  v8 = *((_OWORD *)off_1E50B8778 + 1);
  v22 = *(_OWORD *)off_1E50B8778;
  v23 = v8;
  gadgetSections = self->_gadgetSections;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__PXGadgetDataSource_indexPathForGadgetSectionWithIdentifier___block_invoke;
  v14[3] = &unk_1E5130450;
  v10 = v7;
  v16 = self;
  v17 = &v18;
  v15 = v10;
  -[NSArray enumerateObjectsUsingBlock:](gadgetSections, "enumerateObjectsUsingBlock:", v14);
  v11 = *((_OWORD *)v19 + 3);
  *(_OWORD *)&retstr->dataSourceIdentifier = *((_OWORD *)v19 + 2);
  *(_OWORD *)&retstr->item = v11;

  _Block_object_dispose(&v18, 8);
  return result;
}

- (id)gadgetAtIndexPath:(PXSimpleIndexPath *)a3
{
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98
    || a3->item == 0x7FFFFFFFFFFFFFFFLL
    || a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetDataSource.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsItem(indexPath)"));

  }
  if (-[PXGadgetDataSource identifier](self, "identifier") != a3->dataSourceIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetDataSource.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.identifier == indexPath.dataSourceIdentifier"));

  }
  -[NSArray objectAtIndexedSubscript:](self->_gadgetSections, "objectAtIndexedSubscript:", a3->section);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gadgets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3->item);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (PXSimpleIndexPath)indexPathForGadget:(SEL)a3
{
  id v7;
  __int128 v8;
  id v9;
  __int128 v10;
  PXSimpleIndexPath *result;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXGadgetDataSource.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gadget"));

  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x4010000000;
  v19 = &unk_1A7E74EE7;
  v8 = *((_OWORD *)off_1E50B8778 + 1);
  v20 = *(_OWORD *)off_1E50B8778;
  v21 = v8;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __41__PXGadgetDataSource_indexPathForGadget___block_invoke;
  v13[3] = &unk_1E5130450;
  v13[4] = self;
  v9 = v7;
  v14 = v9;
  v15 = &v16;
  -[PXGadgetDataSource _enumerateGadgetSectionsUsingBlock:](self, "_enumerateGadgetSectionsUsingBlock:", v13);
  v10 = *((_OWORD *)v17 + 3);
  *(_OWORD *)&retstr->dataSourceIdentifier = *((_OWORD *)v17 + 2);
  *(_OWORD *)&retstr->item = v10;

  _Block_object_dispose(&v16, 8);
  return result;
}

- (id)_gadgetsMatchingPredicate:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__PXGadgetDataSource__gadgetsMatchingPredicate___block_invoke;
  v11[3] = &unk_1E5130478;
  v12 = v4;
  v6 = v5;
  v13 = v6;
  v7 = v4;
  -[PXGadgetDataSource enumerateGadgetSectionsUsingBlock:](self, "enumerateGadgetSectionsUsingBlock:", v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

- (id)gadgetsOfType:(unint64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("gadgetType == %d"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetDataSource _gadgetsMatchingPredicate:](self, "_gadgetsMatchingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)gadgetsOfClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v9;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetDataSource.m"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gadgetClass"));

  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self isKindOfClass: %@"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetDataSource _gadgetsMatchingPredicate:](self, "_gadgetsMatchingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)gadgetWithId:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetDataSource.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gadgetId"));

  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__162325;
  v17 = __Block_byref_object_dispose__162326;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __35__PXGadgetDataSource_gadgetWithId___block_invoke;
  v10[3] = &unk_1E51304A0;
  v6 = v5;
  v11 = v6;
  v12 = &v13;
  -[PXGadgetDataSource enumerateGadgetsUsingBlock:](self, "enumerateGadgetsUsingBlock:", v10);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (BOOL)hasNoContentGadget
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[NSArray firstObject](self->_gadgetSections, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gadgets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "gadgetType") == 0;
  else
    v5 = 0;

  return v5;
}

- (void)enumerateGadgetSectionsUsingBlock:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetDataSource.m"), 147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__PXGadgetDataSource_enumerateGadgetSectionsUsingBlock___block_invoke;
  v8[3] = &unk_1E51304C8;
  v9 = v5;
  v7 = v5;
  -[PXGadgetDataSource _enumerateGadgetSectionsUsingBlock:](self, "_enumerateGadgetSectionsUsingBlock:", v8);

}

- (void)enumerateGadgetsUsingBlock:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetDataSource.m"), 154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__PXGadgetDataSource_enumerateGadgetsUsingBlock___block_invoke;
  v8[3] = &unk_1E5130518;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[PXGadgetDataSource _enumerateGadgetSectionsUsingBlock:](self, "_enumerateGadgetSectionsUsingBlock:", v8);

}

- (NSString)publiclySafeDescription
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[PXGadgetDataSource identifier](self, "identifier");
  v5 = -[PXGadgetDataSource numberOfSections](self, "numberOfSections");
  v6 = -[PXGadgetDataSource totalNumberOfItems](self, "totalNumberOfItems");
  -[PXGadgetDataSource allSectionIndexPaths](self, "allSectionIndexPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetDataSource allItemIndexPaths](self, "allItemIndexPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("identifier: %ld, numberOfSections: %ld, totalNumberOfItems: %ld, allSectionIndexPaths: %@, allItemIndexPaths: %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)_enumerateGadgetSectionsUsingBlock:(id)a3
{
  id v4;
  NSArray *gadgetSections;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  gadgetSections = self->_gadgetSections;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PXGadgetDataSource__enumerateGadgetSectionsUsingBlock___block_invoke;
  v7[3] = &unk_1E51304C8;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](gadgetSections, "enumerateObjectsUsingBlock:", v7);

}

- (void)_enumerateGadgetsInSection:(id)a3 atSectionIndex:(unint64_t)a4 usingBlock:(id)a5
{
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  unint64_t v12;

  v7 = a5;
  objc_msgSend(a3, "gadgets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__PXGadgetDataSource__enumerateGadgetsInSection_atSectionIndex_usingBlock___block_invoke;
  v10[3] = &unk_1E5130540;
  v11 = v7;
  v12 = a4;
  v9 = v7;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

}

- (NSArray)gadgetSections
{
  return self->_gadgetSections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gadgetSections, 0);
}

uint64_t __75__PXGadgetDataSource__enumerateGadgetsInSection_atSectionIndex_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  char v6;

  v6 = 0;
  result = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t, char *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40), a3, &v6);
  if (v6)
    *a4 = 1;
  return result;
}

uint64_t __57__PXGadgetDataSource__enumerateGadgetSectionsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  char v6;

  v6 = 0;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v6)
    *a4 = 1;
  return result;
}

void __49__PXGadgetDataSource_enumerateGadgetsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__PXGadgetDataSource_enumerateGadgetsUsingBlock___block_invoke_2;
  v8[3] = &unk_1E51304F0;
  v7 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = a4;
  objc_msgSend(v7, "_enumerateGadgetsInSection:atSectionIndex:usingBlock:", a2, a3, v8);

}

uint64_t __49__PXGadgetDataSource_enumerateGadgetsUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;
  char v8;

  v8 = 0;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v8)
  {
    *a5 = 1;
    **(_BYTE **)(a1 + 40) = 1;
  }
  return result;
}

uint64_t __56__PXGadgetDataSource_enumerateGadgetSectionsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __35__PXGadgetDataSource_gadgetWithId___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "uniqueGadgetIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v7)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a3 = 1;
    }
  }

}

void __48__PXGadgetDataSource__gadgetsMatchingPredicate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "gadgets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v4);
}

void __41__PXGadgetDataSource_indexPathForGadget___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__PXGadgetDataSource_indexPathForGadget___block_invoke_2;
  v10[3] = &unk_1E5130428;
  v6 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  v11 = v7;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v6, "_enumerateGadgetsInSection:atSectionIndex:usingBlock:", a2, a3, v10);

}

uint64_t __41__PXGadgetDataSource_indexPathForGadget___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v8;
  _QWORD *v9;

  if (*(_QWORD *)(result + 32) == a2)
  {
    v8 = result;
    result = objc_msgSend(*(id *)(result + 40), "identifier");
    v9 = *(_QWORD **)(*(_QWORD *)(v8 + 48) + 8);
    v9[4] = result;
    v9[5] = a3;
    v9[6] = a4;
    v9[7] = 0x7FFFFFFFFFFFFFFFLL;
    *a5 = 1;
  }
  return result;
}

int64x2_t __62__PXGadgetDataSource_indexPathForGadgetSectionWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  int64x2_t result;
  uint64_t v10;
  int64x2_t *v11;

  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    v10 = objc_msgSend(*(id *)(a1 + 40), "identifier");
    v11 = *(int64x2_t **)(*(_QWORD *)(a1 + 48) + 8);
    v11[2].i64[0] = v10;
    v11[2].i64[1] = a3;
    result = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v11[3] = result;
    *a4 = 1;
  }
  return result;
}

@end
