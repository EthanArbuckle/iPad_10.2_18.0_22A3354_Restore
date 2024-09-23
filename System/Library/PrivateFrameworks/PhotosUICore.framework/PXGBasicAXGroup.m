@implementation PXGBasicAXGroup

- (void)invalidateLeafs
{
  void *v2;
  void *v3;

  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGBasicAXGroup invalidateLeafs]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PXGAXGroup.m"), 130, CFSTR("invalidating %lu after it already has been updated"), 4);

    abort();
  }
  self->_updateFlags.needsUpdate |= 4uLL;
}

- (void)updateLeafsWithChangeDetails:(id)a3
{
  id v4;
  unsigned int v5;
  NSMutableDictionary *mutableSpritesToLeafs;
  _QWORD v7[4];
  unsigned int v8;

  if ((self->_updateFlags.needsUpdate & 1) == 0)
  {
    v4 = a3;
    v5 = -[PXGBasicAXGroup focusedLeafIndex](self, "focusedLeafIndex");
    mutableSpritesToLeafs = self->_mutableSpritesToLeafs;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__PXGBasicAXGroup_updateLeafsWithChangeDetails___block_invoke;
    v7[3] = &__block_descriptor_36_e30_v24__0Q8__PXGReusableAXInfo_16l;
    v8 = v5;
    objc_msgSend(v4, "applyToDictionary:removalHandler:moveHandler:", mutableSpritesToLeafs, v7, &__block_literal_global_74_88094);
    objc_msgSend(v4, "applyToIndexSet:", self->_requiredLeafIndexesToLoad);

  }
}

- (void)invalidateVersion
{
  void *v2;
  void *v3;

  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGBasicAXGroup invalidateVersion]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PXGAXGroup.m"), 122, CFSTR("invalidating %lu after it already has been updated"), 1);

    abort();
  }
  self->_updateFlags.needsUpdate |= 1uLL;
}

uint64_t __52__PXGBasicAXGroup_updateSubgroupsWithChangeDetails___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "setSubgroupIndex:");
}

void __39__PXGBasicAXGroup__updateLeafsIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "loadLeafAtSpriteIndexIfNeeded:usingOptions:", a2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "removeIndexes:", v3);

}

- (id)loadLeafAtSpriteIndexIfNeeded:(unsigned int)a3 usingOptions:(unint64_t)a4
{
  char v4;
  uint64_t v5;
  id v7;
  void *v8;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  if ((_DWORD)v5 != -1)
  {
    -[PXGBasicAXGroup _loadOrUpdateLeafAtSpriteIndex:](self, "_loadOrUpdateLeafAtSpriteIndex:", v5);
    objc_msgSend(v7, "addIndex:", v5);
    if ((v4 & 1) != 0)
      -[NSMutableIndexSet addIndex:](self->_requiredLeafIndexesToLoad, "addIndex:", v5);
    if ((v4 & 4) == 0)
    {
      -[PXGBasicAXGroup _loadNeighboringLeafsAtSpriteIndex:](self, "_loadNeighboringLeafsAtSpriteIndex:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addIndexes:", v8);

    }
  }
  return v7;
}

- (id)_loadNeighboringLeafsAtSpriteIndex:(unsigned int)a3
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[2];
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  PXGBasicAXGroup *v14;
  id v15;
  unsigned int v16;
  _OWORD v17[3];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v12 = __54__PXGBasicAXGroup__loadNeighboringLeafsAtSpriteIndex___block_invoke;
  v13 = &unk_1E51242A0;
  v14 = self;
  v16 = a3;
  v6 = v5;
  v7 = 0;
  v15 = v6;
  v17[0] = xmmword_1A7C0C480;
  v17[1] = xmmword_1A7BCC520;
  v17[2] = xmmword_1A7C0C490;
  do
  {
    v12((uint64_t)v11, *(_QWORD *)((char *)v17 + v7));
    v7 += 8;
  }
  while (v7 != 32);
  v8 = v15;
  v9 = v6;

  return v9;
}

uint64_t __54__PXGBasicAXGroup__loadNeighboringLeafsAtSpriteIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_loadClosestLeafAtSpriteIndex:inDirection:", *(unsigned int *)(a1 + 48), a2);
  if ((_DWORD)result != -1)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", result);
  return result;
}

- (BOOL)_loadOrUpdateLeafAtSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  BOOL v16;
  uint8_t buf[16];

  v3 = *(_QWORD *)&a3;
  -[PXGBasicAXGroup _leafAtSpriteIndex:](self, "_leafAtSpriteIndex:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGBasicAXGroup axInfoSource](self, "axInfoSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "axContentInfoAtSpriteIndex:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v10 = v6 != 0;
    if (!v6)
      goto LABEL_12;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXGroup.m"), 406, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[infoSource axContentInfoAtSpriteIndex:spriteIndex]"), v14, v15);

    if (v6)
      goto LABEL_4;
LABEL_11:
    -[PXGBasicAXGroup _setLeaf:forSpriteIndex:](self, "_setLeaf:forSpriteIndex:", v8, v3);
    v10 = 0;
    goto LABEL_12;
  }
  if (!v6)
    goto LABEL_11;
LABEL_4:
  objc_msgSend(v8, "applyToInfo:", v6);
  +[PXGReusableAXInfo sharedPool](PXGReusableAXInfo, "sharedPool");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "checkInReusableObject:", v8);

  v10 = 1;
LABEL_6:
  if (objc_msgSend(v6, "spriteIndex") != (_DWORD)v3)
  {
    PXAssertGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Sprite indexes don't match for non-nill info", buf, 2u);
    }

  }
LABEL_12:
  if (v8)
    v16 = 1;
  else
    v16 = v10;

  return v16;
}

- (void)_updateLeafsIfNeeded
{
  unint64_t needsUpdate;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSIndexSet *v9;
  NSIndexSet *previouslySelectedIndexes;
  unsigned int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  _QWORD v21[5];
  id v22;

  if (!self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGBasicAXGroup _updateLeafsIfNeeded]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXGAXGroup.m"), 173, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  needsUpdate = self->_updateFlags.needsUpdate;
  self->_updateFlags.updated |= 4uLL;
  if ((needsUpdate & 4) != 0)
  {
    self->_updateFlags.needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFBLL;
    -[PXGBasicAXGroup axInfoSource](self, "axInfoSource");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXGroup.m"), 178, CFSTR("Should not attempt to update sprites without an infoSource"));

    }
    v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    objc_msgSend(v19, "axSpriteIndexes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v5, "addIndex:", objc_msgSend(v6, "firstIndex"));
      objc_msgSend(v5, "addIndex:", objc_msgSend(v6, "lastIndex"));
    }
    objc_msgSend(v19, "axVisibleSpriteIndexes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v5, "addIndex:", objc_msgSend(v7, "firstIndex"));
      objc_msgSend(v5, "addIndex:", objc_msgSend(v7, "lastIndex"));
      if ((-[PXGBasicAXGroup leafFeatures](self, "leafFeatures") & 2) != 0)
        objc_msgSend(v5, "addIndexes:", v7);
    }
    objc_msgSend(v19, "axSelectedSpriteIndexes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v5, "addIndex:", objc_msgSend(v8, "firstIndex"));
      objc_msgSend(v5, "addIndex:", objc_msgSend(v8, "lastIndex"));
    }
    if ((objc_msgSend(v8, "isEqualToIndexSet:", self->_previouslySelectedIndexes) & 1) == 0)
    {
      v9 = (NSIndexSet *)objc_msgSend(v8, "copy");
      previouslySelectedIndexes = self->_previouslySelectedIndexes;
      self->_previouslySelectedIndexes = v9;

      -[PXGBasicAXGroup _selectedIndexesDidChange](self, "_selectedIndexesDidChange");
    }
    v11 = -[PXGBasicAXGroup focusedLeafIndex](self, "focusedLeafIndex");
    if (v11 != -1)
      objc_msgSend(v5, "addIndex:", v11);
    objc_msgSend(v5, "addIndexes:", self->_requiredLeafIndexesToLoad);
    -[PXGBasicAXGroup loadedLeafIndexes](self, "loadedLeafIndexes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    v14 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __39__PXGBasicAXGroup__updateLeafsIfNeeded__block_invoke;
    v21[3] = &unk_1E51460E8;
    v21[4] = self;
    v15 = v13;
    v22 = v15;
    objc_msgSend(v5, "enumerateIndexesUsingBlock:", v21);
    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __39__PXGBasicAXGroup__updateLeafsIfNeeded__block_invoke_2;
    v20[3] = &unk_1E5148928;
    v20[4] = self;
    objc_msgSend(v15, "enumerateIndexesUsingBlock:", v20);
    if ((objc_msgSend(v12, "isEqualToIndexSet:", v5) & 1) == 0)
      -[PXGBasicAXGroup invalidateLayout](self, "invalidateLayout");

  }
}

- (unsigned)_loadClosestLeafAtSpriteIndex:(unsigned int)a3 inDirection:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;

  v5 = *(_QWORD *)&a3;
  -[PXGBasicAXGroup axInfoSource](self, "axInfoSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "axSpriteIndexClosestToSpriteIndex:inDirection:", v5, a4);
  if ((_DWORD)v8 == -1)
  {
    v10 = -1;
  }
  else
  {
    v9 = v8;
    if (-[PXGBasicAXGroup _loadOrUpdateLeafAtSpriteIndex:](self, "_loadOrUpdateLeafAtSpriteIndex:", v8))
      v10 = v9;
    else
      v10 = -1;
  }

  return v10;
}

- (PXGAXInfoSource)axInfoSource
{
  void *v5;

  if ((self->_updateFlags.needsUpdate & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXGroup.m"), 257, CFSTR("Attempted to query group with an invalid version"));

  }
  return (PXGAXInfoSource *)objc_loadWeakRetained((id *)&self->_axInfoSource);
}

- (NSIndexSet)loadedLeafIndexes
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  -[NSMutableDictionary allKeys](self->_mutableSpritesToLeafs, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__PXGBasicAXGroup_loadedLeafIndexes__block_invoke;
  v7[3] = &unk_1E51348F0;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  return (NSIndexSet *)v5;
}

- (id)_leafAtSpriteIndex:(unsigned int)a3
{
  NSMutableDictionary *mutableSpritesToLeafs;
  void *v4;
  void *v5;

  mutableSpritesToLeafs = self->_mutableSpritesToLeafs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](mutableSpritesToLeafs, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setLeaf:(id)a3 forSpriteIndex:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  NSMutableDictionary *mutableSpritesToLeafs;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  id v17;

  v4 = *(_QWORD *)&a4;
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXGroup.m"), 422, CFSTR("Can not add a nil leaf"));

  }
  if ((_DWORD)v4 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXGroup.m"), 423, CFSTR("Can not add a leaf to PXGSpriteIndexNotFound"));

  }
  v17 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXGroup.m"), 424, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("leaf"), v14);
LABEL_10:

    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "px_descriptionForAssertionMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXGroup.m"), 424, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("leaf"), v14, v16);

    goto LABEL_10;
  }
LABEL_7:
  objc_msgSend(v17, "setAxContainingGroup:", self);
  objc_msgSend(v17, "setSpriteIndex:", v4);
  objc_msgSend(v17, "setAllowDecorations:", -[PXGBasicAXGroup leafFeatures](self, "leafFeatures") & 1);
  objc_msgSend(v17, "setAlternateUIVisibility:", (-[PXGBasicAXGroup leafFeatures](self, "leafFeatures") >> 3) & 1);
  mutableSpritesToLeafs = self->_mutableSpritesToLeafs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](mutableSpritesToLeafs, "setObject:forKeyedSubscript:", v17, v9);

}

- (unint64_t)leafFeatures
{
  return self->_leafFeatures;
}

- (void)loadSubgroup:(id)a3 atIndex:(int64_t)a4
{
  PXGBasicAXGroup *v7;
  NSMutableDictionary *mutableIndexesToSubgroups;
  void *v9;
  void *v10;
  void *v11;
  PXGBasicAXGroup *v12;

  v7 = (PXGBasicAXGroup *)a3;
  v12 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXGroup.m"), 308, CFSTR("Can not add a nil childGroup"));

    v7 = 0;
  }
  if (v7 == self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("PXGAXGroup.m"), 309, CFSTR("Can not add self as a childGroup"));

    v7 = v12;
  }
  -[PXGBasicAXGroup setAxParent:](v7, "setAxParent:", self);
  -[PXGBasicAXGroup setSubgroupIndex:](v12, "setSubgroupIndex:", a4);
  mutableIndexesToSubgroups = self->_mutableIndexesToSubgroups;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](mutableIndexesToSubgroups, "setObject:forKeyedSubscript:", v12, v9);

  -[PXGBasicAXGroup invalidateLayout](self, "invalidateLayout");
}

- (void)invalidateLayout
{
  void *v2;
  void *v3;

  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGBasicAXGroup invalidateLayout]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PXGAXGroup.m"), 134, CFSTR("invalidating %lu after it already has been updated"), 8);

    abort();
  }
  self->_updateFlags.needsUpdate |= 8uLL;
}

- (void)setSubgroupIndex:(int64_t)a3
{
  self->_subgroupIndex = a3;
}

- (void)setAxParent:(id)a3
{
  id v4;
  char v5;
  id obj;

  obj = a3;
  v4 = objc_loadWeakRetained((id *)&self->_axParent);
  if (v4 == obj)
  {

  }
  else
  {
    v5 = objc_msgSend(obj, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      -[PXGBasicAXGroup unloadFromParent](self, "unloadFromParent");
      objc_storeWeak((id *)&self->_axParent, obj);
    }
  }

}

- (void)unloadFromParent
{
  int64_t v3;
  id WeakRetained;
  PXGBasicAXGroup *v5;
  id v6;
  PXGBasicAXGroup *v7;

  v3 = -[PXGBasicAXGroup subgroupIndex](self, "subgroupIndex");
  WeakRetained = objc_loadWeakRetained((id *)&self->_axParent);
  objc_msgSend(WeakRetained, "loadedSubgroupAtIndex:", v3);
  v7 = (PXGBasicAXGroup *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v7 == self)
  {
    v6 = objc_loadWeakRetained((id *)&self->_axParent);
    objc_msgSend(v6, "_unloadSubgroupAtIndex:shouldNotify:", v3, 0);

    v5 = v7;
  }

}

- (int64_t)subgroupIndex
{
  return self->_subgroupIndex;
}

uint64_t __36__PXGBasicAXGroup_loadedLeafIndexes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(a2, "unsignedIntegerValue"));
}

- (void)updateIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  self->_updateFlags.willPerformUpdate = 0;
  if (self->_updateFlags.needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGBasicAXGroup updateIfNeeded]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXGAXGroup.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

    }
    self->_updateFlags.isPerformingUpdate = 1;
    self->_updateFlags.updated = 0;
    -[PXGBasicAXGroup _updateVersionIfNeeded](self, "_updateVersionIfNeeded");
    -[PXGBasicAXGroup _updateVisibilityIfNeeded](self, "_updateVisibilityIfNeeded");
    -[PXGBasicAXGroup _updateLeafsIfNeeded](self, "_updateLeafsIfNeeded");
    -[PXGBasicAXGroup _updateLayoutIfNeeded](self, "_updateLayoutIfNeeded");
    self->_updateFlags.isPerformingUpdate = 0;
    if (self->_updateFlags.needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGBasicAXGroup updateIfNeeded]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXGAXGroup.m"), 143, CFSTR("still needing to update %lu after update pass"), self->_updateFlags.needsUpdate);

    }
  }
}

- (void)_updateVisibilityIfNeeded
{
  unint64_t needsUpdate;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  id v13;

  if (!self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGBasicAXGroup _updateVisibilityIfNeeded]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXGAXGroup.m"), 154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  needsUpdate = self->_updateFlags.needsUpdate;
  self->_updateFlags.updated |= 2uLL;
  if ((needsUpdate & 2) != 0)
  {
    self->_updateFlags.needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFDLL;
    -[PXGBasicAXGroup axGroupSource](self, "axGroupSource");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "axFrame");
    v5 = v4;
    v7 = v6;
    -[PXGBasicAXGroup setAxFrame:](self, "setAxFrame:");
    objc_msgSend(v13, "axVisibleRect");
    v10 = v9 < v7 && v8 < v5;
    -[PXGBasicAXGroup setAxIsVisible:](self, "setAxIsVisible:", v10);

  }
}

- (void)_updateVersionIfNeeded
{
  unint64_t needsUpdate;
  void *v4;
  void *v5;

  if (!self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGBasicAXGroup _updateVersionIfNeeded]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXGAXGroup.m"), 147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  needsUpdate = self->_updateFlags.needsUpdate;
  self->_updateFlags.updated |= 1uLL;
  if ((needsUpdate & 1) != 0)
  {
    self->_updateFlags.needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
    ++self->_version;
  }
}

- (void)_updateLayoutIfNeeded
{
  unint64_t needsUpdate;
  void *v4;
  void *v5;
  id v6;

  if (!self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGBasicAXGroup _updateLayoutIfNeeded]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXGAXGroup.m"), 242, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  needsUpdate = self->_updateFlags.needsUpdate;
  self->_updateFlags.updated |= 8uLL;
  if ((needsUpdate & 8) != 0)
  {
    self->_updateFlags.needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFF7;
    -[PXGBasicAXGroup axNextResponder](self, "axNextResponder");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "axGroup:didChange:userInfo:", self, 8, 0);

  }
}

- (PXGAXResponder)axNextResponder
{
  return (PXGAXResponder *)objc_loadWeakRetained((id *)&self->_axNextResponder);
}

- (void)setAxIsVisible:(BOOL)a3
{
  self->_axIsVisible = a3;
}

- (void)setAxFrame:(CGRect)a3
{
  self->_axFrame = a3;
}

- (PXGAXGroupSource)axGroupSource
{
  return (PXGAXGroupSource *)objc_loadWeakRetained((id *)&self->_axGroupSource);
}

- (void)updateSubgroupsWithChangeDetails:(id)a3
{
  NSMutableDictionary *mutableIndexesToSubgroups;
  _QWORD v5[5];

  mutableIndexesToSubgroups = self->_mutableIndexesToSubgroups;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__PXGBasicAXGroup_updateSubgroupsWithChangeDetails___block_invoke;
  v5[3] = &unk_1E5124438;
  v5[4] = self;
  objc_msgSend(a3, "applyToDictionary:removalHandler:moveHandler:", mutableIndexesToSubgroups, v5, &__block_literal_global_71_88098);
}

- (PXGBasicAXGroup)initWithLayout:(id)a3
{
  id v4;
  PXGBasicAXGroup *v5;
  PXGBasicAXGroup *v6;

  v4 = a3;
  v5 = -[PXGBasicAXGroup init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[PXGBasicAXGroup setAxGroupSource:](v5, "setAxGroupSource:", v4);
    -[PXGBasicAXGroup setAxInfoSource:](v6, "setAxInfoSource:", v4);
    -[PXGBasicAXGroup setAxNextResponder:](v6, "setAxNextResponder:", v4);
  }

  return v6;
}

- (void)setAxNextResponder:(id)a3
{
  objc_storeWeak((id *)&self->_axNextResponder, a3);
}

- (void)setAxInfoSource:(id)a3
{
  objc_storeWeak((id *)&self->_axInfoSource, a3);
}

- (void)setAxGroupSource:(id)a3
{
  objc_storeWeak((id *)&self->_axGroupSource, a3);
}

- (PXGBasicAXGroup)init
{
  PXGBasicAXGroup *v2;
  PXGBasicAXGroup *v3;
  CGSize v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *mutableIndexesToSubgroups;
  NSMutableDictionary *v7;
  NSMutableDictionary *mutableSpritesToLeafs;
  NSMutableIndexSet *v9;
  NSMutableIndexSet *requiredLeafIndexesToLoad;
  NSIndexSet *v11;
  NSIndexSet *previouslySelectedIndexes;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXGBasicAXGroup;
  v2 = -[PXGBasicAXGroup init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v2->_axFrame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v2->_axFrame.size = v4;
    v2->_axRole = 0;
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mutableIndexesToSubgroups = v3->_mutableIndexesToSubgroups;
    v3->_mutableIndexesToSubgroups = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mutableSpritesToLeafs = v3->_mutableSpritesToLeafs;
    v3->_mutableSpritesToLeafs = v7;

    v9 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    requiredLeafIndexesToLoad = v3->_requiredLeafIndexesToLoad;
    v3->_requiredLeafIndexesToLoad = v9;

    v11 = (NSIndexSet *)objc_alloc_init(MEMORY[0x1E0CB36B8]);
    previouslySelectedIndexes = v3->_previouslySelectedIndexes;
    v3->_previouslySelectedIndexes = v11;

    v3->_subgroupIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v3;
}

- (void)invalidateVisibility
{
  void *v2;
  void *v3;

  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGBasicAXGroup invalidateVisibility]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PXGAXGroup.m"), 126, CFSTR("invalidating %lu after it already has been updated"), 2);

    abort();
  }
  self->_updateFlags.needsUpdate |= 2uLL;
}

- (void)setAxRole:(int64_t)a3
{
  id v4;

  if (self->_axRole != a3)
  {
    self->_axRole = a3;
    -[PXGBasicAXGroup axNextResponder](self, "axNextResponder");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "axGroup:didChange:userInfo:", self, 1, 0);

  }
}

- (BOOL)needsUpdate
{
  return self->_updateFlags.needsUpdate != 0;
}

- (void)_addFirstVisibleIndexes:(id)a3 toIndexesToLoad:(id)a4
{
  id v6;
  int64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = -[PXGBasicAXGroup nonScrollingAxisItemCount](self, "nonScrollingAxisItemCount");
  if (!objc_msgSend(v8, "firstIndex") && v7)
    objc_msgSend(v6, "addIndexesInRange:", objc_msgSend(v8, "firstIndex"), v7);

}

- (BOOL)versionNeedUpdate
{
  return self->_updateFlags.needsUpdate & 1;
}

- (PXGBasicAXGroup)axRootParent
{
  PXGBasicAXGroup *WeakRetained;
  PXGBasicAXGroup *v4;
  void *v5;
  PXGBasicAXGroup *v6;
  void *v7;

  WeakRetained = (PXGBasicAXGroup *)objc_loadWeakRetained((id *)&self->_axParent);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    -[PXGBasicAXGroup axParent](WeakRetained, "axParent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      do
      {
        -[PXGBasicAXGroup axParent](v4, "axParent");
        v6 = (PXGBasicAXGroup *)objc_claimAutoreleasedReturnValue();

        -[PXGBasicAXGroup axParent](v6, "axParent");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v4 = v6;
      }
      while (v7);
    }
    else
    {
      v6 = v4;
    }
  }
  else
  {
    v6 = self;
  }
  return v6;
}

- (PXGBasicAXGroup)axScrollParent
{
  PXGBasicAXGroup *v2;
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t v6;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&v2->_axParent);
  objc_msgSend(WeakRetained, "axGroupSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "axShouldBeConsideredAsSubgroup"))
  {
    v5 = objc_loadWeakRetained((id *)&v2->_axParent);
    objc_msgSend(v5, "axScrollParent");
    v6 = objc_claimAutoreleasedReturnValue();

    v2 = (PXGBasicAXGroup *)v6;
  }

  return v2;
}

- (NSIndexSet)loadedSubgroupIndexes
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  -[NSMutableDictionary allKeys](self->_mutableIndexesToSubgroups, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__PXGBasicAXGroup_loadedSubgroupIndexes__block_invoke;
  v7[3] = &unk_1E51348F0;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  return (NSIndexSet *)v5;
}

- (id)loadedSubgroupAtIndex:(int64_t)a3
{
  NSMutableDictionary *mutableIndexesToSubgroups;
  void *v4;
  void *v5;

  mutableIndexesToSubgroups = self->_mutableIndexesToSubgroups;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](mutableIndexesToSubgroups, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)unloadSubgroupAtIndex:(int64_t)a3
{
  -[PXGBasicAXGroup _unloadSubgroupAtIndex:shouldNotify:](self, "_unloadSubgroupAtIndex:shouldNotify:", a3, 1);
}

- (void)_unloadSubgroupAtIndex:(int64_t)a3 shouldNotify:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  NSMutableDictionary *mutableIndexesToSubgroups;
  void *v9;
  id v10;

  v4 = a4;
  -[PXGBasicAXGroup loadedSubgroupAtIndex:](self, "loadedSubgroupAtIndex:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    mutableIndexesToSubgroups = self->_mutableIndexesToSubgroups;
    v10 = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](mutableIndexesToSubgroups, "setObject:forKeyedSubscript:", 0, v9);

    -[PXGBasicAXGroup _cleanUpSubgroupAfterUnloading:](self, "_cleanUpSubgroupAfterUnloading:", v10);
    v7 = v10;
    if (v4)
    {
      -[PXGBasicAXGroup invalidateLayout](self, "invalidateLayout");
      v7 = v10;
    }
  }

}

- (void)_cleanUpSubgroupAfterUnloading:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setAxParent:", 0);
  objc_msgSend(v3, "setSubgroupIndex:", 0x7FFFFFFFFFFFFFFFLL);

}

- (void)unloadLeafAtSpriteIndex:(unsigned int)a3 usingOptions:(unint64_t)a4
{
  int v4;
  uint64_t v5;
  uint64_t v7;
  int v8;
  int v9;
  void *v10;
  id v11;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = a3;
  v8 = -[NSMutableIndexSet containsIndex:](self->_requiredLeafIndexesToLoad, "containsIndex:", a3);
  v9 = v8;
  if ((v4 & 1) != 0 && v8)
    -[NSMutableIndexSet removeIndex:](self->_requiredLeafIndexesToLoad, "removeIndex:", v7);
  if ((v4 & 2) == 0 && ((v4 | v9 ^ 1) & 1) != 0)
  {
    -[PXGBasicAXGroup _removeLeafAtSpriteIndex:](self, "_removeLeafAtSpriteIndex:", v5);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      +[PXGReusableAXInfo sharedPool](PXGReusableAXInfo, "sharedPool");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "checkInReusableObject:", v11);

    }
  }
}

- (void)unloadAllLeafs
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_mutableSpritesToLeafs, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_88113);
  -[NSMutableDictionary removeAllObjects](self->_mutableSpritesToLeafs, "removeAllObjects");
}

- (id)_removeLeafAtSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  NSMutableDictionary *mutableSpritesToLeafs;
  void *v8;
  void *v11;

  v3 = *(_QWORD *)&a3;
  if (a3 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXGroup.m"), 461, CFSTR("Can not remove a leaf at PXGSpriteIndexNotFound"));

  }
  -[PXGBasicAXGroup _leafAtSpriteIndex:](self, "_leafAtSpriteIndex:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "prepareForReuse");
    mutableSpritesToLeafs = self->_mutableSpritesToLeafs;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](mutableSpritesToLeafs, "setObject:forKeyedSubscript:", 0, v8);

  }
  return v6;
}

- (id)leafsInRect:(CGRect)a3 usingOptions:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXGBasicAXGroup _leafsInRect:usingOptions:intoMutableArray:](self, "_leafsInRect:usingOptions:intoMutableArray:", a4, v10, x, y, width, height);
  return v10;
}

- (void)_leafsInRect:(CGRect)a3 usingOptions:(unint64_t)a4 intoMutableArray:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  NSMutableDictionary *mutableSpritesToLeafs;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSMutableDictionary *mutableIndexesToSubgroups;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  if ((self->_updateFlags.needsUpdate & 1) == 0)
  {
    v21 = v11;
    -[PXGBasicAXGroup axInfoSource](self, "axInfoSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "axSpriteIndexesInRect:", x, y, width, height);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    mutableSpritesToLeafs = self->_mutableSpritesToLeafs;
    v15 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __62__PXGBasicAXGroup__leafsInRect_usingOptions_intoMutableArray___block_invoke;
    v30[3] = &unk_1E5124308;
    v16 = v13;
    v31 = v16;
    v17 = v21;
    v32 = v17;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mutableSpritesToLeafs, "enumerateKeysAndObjectsUsingBlock:", v30);
    -[PXGBasicAXGroup axGroupSource](self, "axGroupSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if ((a4 & 1) != 0 && objc_msgSend(v18, "axShouldSearchLeafsInSubgroups"))
    {
      mutableIndexesToSubgroups = self->_mutableIndexesToSubgroups;
      v22[0] = v15;
      v22[1] = 3221225472;
      v22[2] = __62__PXGBasicAXGroup__leafsInRect_usingOptions_intoMutableArray___block_invoke_2;
      v22[3] = &unk_1E5124330;
      v25 = x;
      v26 = y;
      v27 = width;
      v28 = height;
      v23 = v19;
      v29 = a4;
      v24 = v17;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mutableIndexesToSubgroups, "enumerateKeysAndObjectsUsingBlock:", v22);

    }
    v11 = v21;
  }

}

- (id)leafAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSMutableDictionary *mutableIndexesToSubgroups;
  id v17;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  y = a3.y;
  x = a3.x;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__88105;
  v30 = __Block_byref_object_dispose__88106;
  v31 = 0;
  -[PXGBasicAXGroup axInfoSource](self, "axInfoSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGBasicAXGroup axGroupSource](self, "axGroupSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "axSpriteIndexesInRect:", x, y, 5.0, 5.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "firstIndex");
  if ((_DWORD)v10 == -1)
  {
    mutableIndexesToSubgroups = self->_mutableIndexesToSubgroups;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __31__PXGBasicAXGroup_leafAtPoint___block_invoke_2;
    v20[3] = &unk_1E5124398;
    v24 = x;
    v25 = y;
    v21 = v8;
    v22 = &__block_literal_global_64;
    v23 = &v26;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mutableIndexesToSubgroups, "enumerateKeysAndObjectsUsingBlock:", v20);

    v13 = v21;
  }
  else
  {
    v11 = -[PXGBasicAXGroup loadLeafAtSpriteIndexIfNeeded:usingOptions:](self, "loadLeafAtSpriteIndexIfNeeded:usingOptions:", v10, 0);
    -[PXGBasicAXGroup loadedLeafAtSpriteIndex:](self, "loadedLeafAtSpriteIndex:", v10);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXGroup.m"), 523, CFSTR("Leaf should not be nil after loading."));

    }
    __31__PXGBasicAXGroup_leafAtPoint___block_invoke(v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v27[5];
    v27[5] = v14;

  }
  v17 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v17;
}

- (id)childrenPassingFilter:(unint64_t)a3 usingOptions:(unint64_t)a4
{
  id v7;

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXGBasicAXGroup _addChildrenPassingFilter:usingOptions:intoArray:](self, "_addChildrenPassingFilter:usingOptions:intoArray:", a3, a4, v7);
  return v7;
}

- (void)_addChildrenPassingFilter:(unint64_t)a3 usingOptions:(unint64_t)a4 intoArray:(id)a5
{
  NSMutableDictionary *mutableIndexesToSubgroups;
  id v9;
  _QWORD v10[4];
  id v11;
  unint64_t v12;
  unint64_t v13;

  v9 = a5;
  -[PXGBasicAXGroup _addSubgroupsPassingFilter:intoArray:](self, "_addSubgroupsPassingFilter:intoArray:", a3, v9);
  -[PXGBasicAXGroup _addLeafsPassingFilter:usingOptions:intoArray:](self, "_addLeafsPassingFilter:usingOptions:intoArray:", a3, a4, v9);
  if ((a4 & 1) != 0)
  {
    mutableIndexesToSubgroups = self->_mutableIndexesToSubgroups;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__PXGBasicAXGroup__addChildrenPassingFilter_usingOptions_intoArray___block_invoke;
    v10[3] = &unk_1E51243C0;
    v12 = a3;
    v13 = a4;
    v11 = v9;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mutableIndexesToSubgroups, "enumerateKeysAndObjectsUsingBlock:", v10);

  }
}

- (void)_addSubgroupsPassingFilter:(unint64_t)a3 intoArray:(id)a4
{
  id v6;
  NSMutableDictionary *mutableIndexesToSubgroups;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v6 = a4;
  mutableIndexesToSubgroups = self->_mutableIndexesToSubgroups;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__PXGBasicAXGroup__addSubgroupsPassingFilter_intoArray___block_invoke;
  v9[3] = &unk_1E51243E8;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mutableIndexesToSubgroups, "enumerateKeysAndObjectsUsingBlock:", v9);

}

- (void)_addLeafsPassingFilter:(unint64_t)a3 usingOptions:(unint64_t)a4 intoArray:(id)a5
{
  if ((a4 & 2) != 0)
    -[PXGBasicAXGroup _addAllLeafsPassingFilter:intoArray:](self, "_addAllLeafsPassingFilter:intoArray:", a3, a5);
  else
    -[PXGBasicAXGroup _addCurrentlyLoadedLeafsPassingFilter:intoArray:](self, "_addCurrentlyLoadedLeafsPassingFilter:intoArray:", a3, a5);
}

- (void)_addCurrentlyLoadedLeafsPassingFilter:(unint64_t)a3 intoArray:(id)a4
{
  id v6;
  NSMutableDictionary *mutableSpritesToLeafs;
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  mutableSpritesToLeafs = self->_mutableSpritesToLeafs;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__PXGBasicAXGroup__addCurrentlyLoadedLeafsPassingFilter_intoArray___block_invoke;
  v9[3] = &unk_1E5124410;
  v10 = v6;
  v11 = a3;
  v9[4] = self;
  v8 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mutableSpritesToLeafs, "enumerateKeysAndObjectsUsingBlock:", v9);

}

- (void)_addAllLeafsPassingFilter:(unint64_t)a3 intoArray:(id)a4
{
  int v4;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  SEL v15;

  v4 = a3;
  v7 = a4;
  -[PXGBasicAXGroup axInfoSource](self, "axInfoSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  if ((v4 & 2) != 0)
  {
    objc_msgSend(v8, "axSpriteIndexes", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if ((~v4 & 6) != 0)
  {
    if ((~v4 & 0xALL) != 0)
    {
      v10 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v8, "axSelectedSpriteIndexes", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "axVisibleSpriteIndexes", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_8:
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__PXGBasicAXGroup__addAllLeafsPassingFilter_intoArray___block_invoke;
  v13[3] = &unk_1E513F058;
  v14 = v7;
  v15 = a2;
  v13[4] = self;
  v11 = v7;
  objc_msgSend(v10, "enumerateIndexesUsingBlock:", v13);

}

- (BOOL)_passesFilter:(unint64_t)a3
{
  char v3;
  _BOOL4 v5;
  _BOOL4 v6;
  BOOL v7;

  v3 = a3;
  v5 = (a3 & 1) == 0 || -[PXGBasicAXGroup axRole](self, "axRole") == 1 || -[PXGBasicAXGroup axRole](self, "axRole") == 4;
  v6 = (v3 & 4) == 0 && v5;
  if ((v3 & 4) != 0 && v5)
    v6 = -[PXGBasicAXGroup axIsVisible](self, "axIsVisible");
  v7 = (v3 & 8) == 0 && v6;
  if ((v3 & 8) != 0 && v6)
    v7 = -[PXGBasicAXGroup axIsSelected](self, "axIsSelected");
  return (v3 & 2) == 0 && v7;
}

- (BOOL)_leafAtSpriteIndex:(unsigned int)a3 passesFilter:(unint64_t)a4
{
  char v4;
  uint64_t v5;
  _BOOL4 v7;
  _BOOL4 v8;
  BOOL v9;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = (a4 & 2) == 0
    || -[PXGBasicAXGroup _leafAtSpriteIndexIsAccessible:](self, "_leafAtSpriteIndexIsAccessible:", *(_QWORD *)&a3);
  v8 = (v4 & 4) == 0 && v7;
  if ((v4 & 4) != 0 && v7)
    v8 = -[PXGBasicAXGroup _leafAtSpriteIndexIsVisible:](self, "_leafAtSpriteIndexIsVisible:", v5);
  v9 = (v4 & 8) == 0 && v8;
  if ((v4 & 8) != 0 && v8)
    v9 = -[PXGBasicAXGroup _leafAtSpriteIndexIsSelected:](self, "_leafAtSpriteIndexIsSelected:", v5);
  return (v4 & 1) == 0 && v9;
}

- (BOOL)_leafAtSpriteIndexIsAccessible:(unsigned int)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[PXGBasicAXGroup axInfoSource](self, "axInfoSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "axSpriteIndexes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsIndex:", a3);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_leafAtSpriteIndexIsSelected:(unsigned int)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[PXGBasicAXGroup axInfoSource](self, "axInfoSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "axSelectedSpriteIndexes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsIndex:", a3);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_leafAtSpriteIndexIsVisible:(unsigned int)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[PXGBasicAXGroup axInfoSource](self, "axInfoSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "axVisibleSpriteIndexes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsIndex:", a3);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_updateLeafAtSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  -[PXGBasicAXGroup _leafAtSpriteIndex:](self, "_leafAtSpriteIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v8 = v5;
    -[PXGBasicAXGroup axInfoSource](self, "axInfoSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "axContentInfoAtSpriteIndex:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[PXGBasicAXGroup _setLeaf:forSpriteIndex:](self, "_setLeaf:forSpriteIndex:", v7, v3);

    v5 = v8;
  }

}

- (BOOL)updateWithSelectedChildren:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  PXGBasicAXGroup *v12;
  char isKindOfClass;
  char v14;
  PXGBasicAXGroup *v15;
  PXGBasicAXGroup *v16;
  id v17;
  void *v18;
  BOOL v19;
  NSMutableDictionary *mutableIndexesToSubgroups;
  void *v22;
  SEL v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((self->_updateFlags.needsUpdate & 1) == 0)
  {
    -[PXGBasicAXGroup axNextResponder](self, "axNextResponder");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v7)
    {
      v8 = v7;
      v23 = a2;
      v24 = v5;
      v9 = 0;
      v10 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v6);
          v12 = *(PXGBasicAXGroup **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          objc_opt_class();
          v14 = objc_opt_isKindOfClass();
          if ((isKindOfClass & 1) != 0 || (v14 & 1) != 0)
          {
            if ((isKindOfClass & 1) != 0)
            {
              v9 |= v12 == self;
            }
            else
            {
              if ((v14 & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", v23, self, CFSTR("PXGAXGroup.m"), 768, CFSTR("Code which should be unreachable has been reached"));

                abort();
              }
              v15 = v12;
              -[PXGBasicAXGroup axContainingGroup](v15, "axContainingGroup");
              v16 = (PXGBasicAXGroup *)objc_claimAutoreleasedReturnValue();

              if (v16 == self)
              {
                v17 = -[PXGBasicAXGroup _loadNeighboringLeafsAtSpriteIndex:](self, "_loadNeighboringLeafsAtSpriteIndex:", -[PXGBasicAXGroup spriteIndex](v15, "spriteIndex"));
                PXGAXCreateSelectionChangeUserInfo(v15);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "axGroup:didChange:userInfo:", self, 4, v18);

                v9 = 1;
              }

            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v8);

      v5 = v24;
      if ((v9 & 1) != 0)
      {
        v19 = 1;
LABEL_22:

        goto LABEL_23;
      }
    }
    else
    {

    }
    mutableIndexesToSubgroups = self->_mutableIndexesToSubgroups;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __46__PXGBasicAXGroup_updateWithSelectedChildren___block_invoke;
    v26[3] = &unk_1E5124500;
    v27 = v6;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mutableIndexesToSubgroups, "enumerateKeysAndObjectsUsingBlock:", v26);

    v19 = 0;
    goto LABEL_22;
  }
  v19 = 0;
LABEL_23:

  return v19;
}

- (BOOL)axIsSelected
{
  void *v3;
  BOOL v4;

  if (-[PXGBasicAXGroup axRole](self, "axRole") == 1)
  {
    -[PXGBasicAXGroup childrenPassingFilter:usingOptions:](self, "childrenPassingFilter:usingOptions:", 10, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (NSArray)axLeafs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allValues](self->_mutableSpritesToLeafs, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("spriteIndex"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingDescriptors:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSArray)axSubgroups
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allValues](self->_mutableIndexesToSubgroups, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("subgroupIndex"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingDescriptors:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (PXGBasicAXGroup)axParent
{
  return (PXGBasicAXGroup *)objc_loadWeakRetained((id *)&self->_axParent);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  NSStringFromCGRect(self->_axFrame);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSMutableDictionary count](self->_mutableIndexesToSubgroups, "count");
  v7 = -[NSMutableDictionary count](self->_mutableSpritesToLeafs, "count");
  WeakRetained = objc_loadWeakRetained((id *)&self->_axInfoSource);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; frame = %@; numberOfSubgroups = %lu; numberOfLeafs = %lu; infoSource = %@; >"),
    v4,
    self,
    v5,
    v6,
    v7,
    WeakRetained);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSString)recursiveDescription
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[PXGBasicAXGroup _appendDescription:atLevel:](self, "_appendDescription:atLevel:", v3, 0);
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (NSString)recursiveLeafDescription
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[PXGBasicAXGroup _appendLeafDescription:atLevel:](self, "_appendLeafDescription:atLevel:", v3, 0);
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (id)_paddingForLevel:(int64_t)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (a3 >= 1)
  {
    do
    {
      objc_msgSend(v4, "appendString:", CFSTR("   | "));
      --a3;
    }
    while (a3);
  }
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (void)_appendDescription:(id)a3 atLevel:(int64_t)a4
{
  id v6;
  int64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  objc_class *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int64_t v21;
  void *v22;
  __CFString *v23;
  NSMutableDictionary *mutableIndexesToSubgroups;
  id v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  int64_t v32;

  v6 = a3;
  v7 = a4 + 1;
  -[PXGBasicAXGroup _paddingForLevel:](self, "_paddingForLevel:", a4 + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NSMutableDictionary count](self->_mutableIndexesToSubgroups, "count");
  v12 = -[NSMutableDictionary count](self->_mutableSpritesToLeafs, "count");
  v13 = objc_loadWeakRetained((id *)&self->_axInfoSource);
  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "axSpriteIndexes");
    v26 = v10;
    v27 = v6;
    v17 = v11;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "axVisibleSpriteIndexes");
    v19 = v12;
    v20 = v8;
    v21 = v7;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p; axSpriteIndexes = %@; axVisibleSpriteIndexes = %@>"),
      v16,
      v13,
      v18,
      v22);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v7 = v21;
    v8 = v20;
    v12 = v19;

    v11 = v17;
    v10 = v26;
    v6 = v27;

  }
  else
  {
    v23 = CFSTR("<nil>");
  }

  objc_msgSend(v6, "appendFormat:", CFSTR("<%@: %p; numberOfLoadedChildren = %lu; numberOfLeafs = %lu; infoSource = %@; > \n"),
    v10,
    self,
    v11,
    v12,
    v23);

  mutableIndexesToSubgroups = self->_mutableIndexesToSubgroups;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __46__PXGBasicAXGroup__appendDescription_atLevel___block_invoke;
  v29[3] = &unk_1E5124528;
  v30 = v6;
  v31 = v8;
  v32 = v7;
  v25 = v8;
  v28 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mutableIndexesToSubgroups, "enumerateKeysAndObjectsUsingBlock:", v29);

}

- (void)_appendLeafDescription:(id)a3 atLevel:(int64_t)a4
{
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSMutableDictionary *mutableIndexesToSubgroups;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  int64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v6 = a3;
  v7 = a4 + 1;
  -[PXGBasicAXGroup _paddingForLevel:](self, "_paddingForLevel:", a4 + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGBasicAXGroup _paddingForLevel:](self, "_paddingForLevel:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("<%@: %p; numberOfLeafs = %lu; >\n"),
    v11,
    self,
    -[NSMutableDictionary count](self->_mutableSpritesToLeafs, "count"));

  -[NSMutableDictionary allValues](self->_mutableSpritesToLeafs, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __50__PXGBasicAXGroup__appendLeafDescription_atLevel___block_invoke;
  v23[3] = &unk_1E5124550;
  v14 = v6;
  v24 = v14;
  v25 = v9;
  v18 = v9;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v23);

  mutableIndexesToSubgroups = self->_mutableIndexesToSubgroups;
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __50__PXGBasicAXGroup__appendLeafDescription_atLevel___block_invoke_2;
  v19[3] = &unk_1E5124528;
  v20 = v14;
  v21 = v8;
  v22 = v7;
  v16 = v8;
  v17 = v14;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mutableIndexesToSubgroups, "enumerateKeysAndObjectsUsingBlock:", v19);

}

- (int64_t)axRole
{
  return self->_axRole;
}

- (int64_t)nonScrollingAxisItemCount
{
  return self->_nonScrollingAxisItemCount;
}

- (void)setNonScrollingAxisItemCount:(int64_t)a3
{
  self->_nonScrollingAxisItemCount = a3;
}

- (void)setLeafFeatures:(unint64_t)a3
{
  self->_leafFeatures = a3;
}

- (CGRect)axFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_axFrame.origin.x;
  y = self->_axFrame.origin.y;
  width = self->_axFrame.size.width;
  height = self->_axFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)axIsVisible
{
  return self->_axIsVisible;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_axNextResponder);
  objc_destroyWeak((id *)&self->_axInfoSource);
  objc_destroyWeak((id *)&self->_axGroupSource);
  objc_destroyWeak((id *)&self->_axParent);
  objc_storeStrong((id *)&self->_previouslySelectedIndexes, 0);
  objc_storeStrong((id *)&self->_requiredLeafIndexesToLoad, 0);
  objc_storeStrong((id *)&self->_mutableSpritesToLeafs, 0);
  objc_storeStrong((id *)&self->_mutableIndexesToSubgroups, 0);
}

void __50__PXGBasicAXGroup__appendLeafDescription_atLevel___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "appendFormat:", CFSTR("%@  "), v4);
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@\n"), v5);

}

void __50__PXGBasicAXGroup__appendLeafDescription_atLevel___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a3;
  objc_msgSend(v4, "appendFormat:", CFSTR("%@   "), v5);
  objc_msgSend(v6, "_appendLeafDescription:atLevel:", a1[4], a1[6] + 1);

}

void __46__PXGBasicAXGroup__appendDescription_atLevel___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a3;
  objc_msgSend(v4, "appendFormat:", CFSTR("%@   "), v5);
  objc_msgSend(v6, "_appendDescription:atLevel:", a1[4], a1[6] + 1);

}

uint64_t __46__PXGBasicAXGroup_updateWithSelectedChildren___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "updateWithSelectedChildren:", *(_QWORD *)(a1 + 32));
  *a4 = result;
  return result;
}

void __48__PXGBasicAXGroup_updateLeafsWithChangeDetails___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;

  if (*(_DWORD *)(a1 + 32) != a2)
  {
    v3 = a3;
    +[PXGReusableAXInfo sharedPool](PXGReusableAXInfo, "sharedPool");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "checkInReusableObject:", v3);

  }
}

uint64_t __48__PXGBasicAXGroup_updateLeafsWithChangeDetails___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "setSpriteIndex:");
}

uint64_t __52__PXGBasicAXGroup_updateSubgroupsWithChangeDetails___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanUpSubgroupAfterUnloading:");
}

void __55__PXGBasicAXGroup__addAllLeafsPassingFilter_intoArray___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "loadLeafAtSpriteIndexIfNeeded:usingOptions:", a2, 4);
  objc_msgSend(*(id *)(a1 + 32), "loadedLeafAtSpriteIndex:", a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("PXGAXGroup.m"), 624, CFSTR("nil leaf found after loading"));

    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

void __67__PXGBasicAXGroup__addCurrentlyLoadedLeafsPassingFilter_intoArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "_leafAtSpriteIndex:passesFilter:", objc_msgSend(a2, "unsignedIntegerValue"), *(_QWORD *)(a1 + 48)))objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

void __56__PXGBasicAXGroup__addSubgroupsPassingFilter_intoArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "_passesFilter:", *(_QWORD *)(a1 + 40)))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

uint64_t __68__PXGBasicAXGroup__addChildrenPassingFilter_usingOptions_intoArray___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_addChildrenPassingFilter:usingOptions:intoArray:", a1[5], a1[6], a1[4]);
}

id __31__PXGBasicAXGroup_leafAtPoint___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "spriteStyle");
    if (*(float *)&v6 > 0.0)
      goto LABEL_6;
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
  }
  if (!objc_msgSend(v3, "axAccessibleWhenTransparent", v6, v7, v8, v9, v10, v11, v12, v13, v14, v15))
  {
    v4 = 0;
    goto LABEL_8;
  }
LABEL_6:
  v4 = v3;
LABEL_8:

  return v4;
}

void __31__PXGBasicAXGroup_leafAtPoint___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id *v9;
  void *v10;
  uint64_t v11;
  id *v12;
  void *v13;
  __int128 v14;
  CGRect v15;

  v4 = a3;
  objc_msgSend(v4, "axFrame");
  if (CGRectContainsPoint(v15, *(CGPoint *)(a1 + 56)))
  {
    objc_msgSend(*(id *)(a1 + 32), "axConvertPoint:toDescendantGroup:", v4, *(double *)(a1 + 56), *(double *)(a1 + 64));
    objc_msgSend(v4, "leafAtPoint:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
LABEL_12:

      goto LABEL_13;
    }
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v7 + 40);
    v9 = (id *)(v7 + 40);
    v8 = v10;
    if (!v10)
    {
      v12 = v9;
      v13 = v5;
LABEL_11:
      objc_storeStrong(v12, v13);
      goto LABEL_12;
    }
    if (v5)
    {
      objc_msgSend(v5, "spriteGeometry");
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v8 = *(void **)(v11 + 40);
      v14 = 0u;
      if (!v8)
        goto LABEL_10;
    }
    else
    {
      v14 = 0uLL;
    }
    objc_msgSend(v8, "spriteGeometry", v14);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
LABEL_10:
    v13 = *(void **)(v11 + 40);
    v12 = (id *)(v11 + 40);
    goto LABEL_11;
  }
LABEL_13:

}

void __62__PXGBasicAXGroup__leafsInRect_usingOptions_intoMutableArray___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "axContentKind") != 5
    && objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(v4, "spriteIndex")))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }

}

void __62__PXGBasicAXGroup__leafsInRect_usingOptions_intoMutableArray___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  id v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v14 = a3;
  objc_msgSend(v14, "axGroupSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "axFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 48), v16)
    && objc_msgSend(v4, "axShouldBeConsideredAsSubgroup"))
  {
    v13 = *(void **)(a1 + 32);
    v17.origin.x = v6;
    v17.origin.y = v8;
    v17.size.width = v10;
    v17.size.height = v12;
    v15 = CGRectIntersection(*(CGRect *)(a1 + 48), v17);
    objc_msgSend(v13, "axConvertRect:toDescendantGroup:", v14, v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
    objc_msgSend(v14, "_leafsInRect:usingOptions:intoMutableArray:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40));
  }

}

uint64_t __33__PXGBasicAXGroup_unloadAllLeafs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "prepareForReuse");
}

uint64_t __40__PXGBasicAXGroup_loadedSubgroupIndexes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(a2, "unsignedIntegerValue"));
}

uint64_t __39__PXGBasicAXGroup__updateLeafsIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "unloadLeafAtSpriteIndex:usingOptions:", a2, 0);
}

- (unsigned)focusedLeafIndex
{
  void *v3;
  void *v4;
  id v5;
  PXGBasicAXGroup *v6;
  unsigned int v7;

  objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusedItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "axContainingGroup");
    v6 = (PXGBasicAXGroup *)objc_claimAutoreleasedReturnValue();

    if (v6 == self)
      v7 = objc_msgSend(v5, "spriteIndex");
    else
      v7 = -1;

  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (id)focusItemsForScrollViewController:(id)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  int v10;
  void *v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(off_1E50B5CD0, "sharedInstance", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "enableTungstenFocusEnvironmentSupport");

  if (v10)
  {
    -[PXGBasicAXGroup leafsInRect:usingOptions:](self, "leafsInRect:usingOptions:", 1, x, y, width, height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v11;
}

- (NSArray)preferredFocusEnvironments
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXGBasicAXGroup axInfoSource](self, "axInfoSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGBasicAXGroup loadedLeafIndexes](self, "loadedLeafIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v5, "axVisibleSpriteIndexes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "containsIndex:", objc_msgSend(v7, "firstIndex")))
    {
      -[PXGBasicAXGroup loadedLeafAtSpriteIndex:](self, "loadedLeafAtSpriteIndex:", objc_msgSend(v7, "firstIndex"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAXGroup+iOS.m"), 71, CFSTR("A loaded leaf must not be nil"));

      }
      objc_msgSend(v4, "addObject:", v8);

    }
  }

  return (NSArray *)v4;
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  void *v3;
  void *v4;
  void *v5;

  -[PXGBasicAXGroup axParent](self, "axParent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PXGBasicAXGroup axNextResponder](self, "axNextResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "axContainingScrollViewForAXGroup:", self);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  return (UIFocusEnvironment *)v3;
}

- (UIFocusItemContainer)focusItemContainer
{
  void *v3;
  void *v4;

  -[PXGBasicAXGroup axNextResponder](self, "axNextResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axContainingScrollViewForAXGroup:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFocusItemContainer *)v4;
}

- (void)setNeedsFocusUpdate
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", self);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestFocusUpdateToEnvironment:", self);

}

- (void)updateFocusIfNeeded
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", self);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateFocusIfNeeded");

}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(void *, void *);
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD aBlock[5];

  v5 = a3;
  -[PXGBasicAXGroup axInfoSource](self, "axInfoSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "axDidUpdateFocusInContext:", v5);

  objc_msgSend(v5, "previouslyFocusedItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextFocusedItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__PXGBasicAXGroup_PlatformSpecific__didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
  aBlock[3] = &unk_1E51366B8;
  aBlock[4] = self;
  v9 = (void (**)(void *, void *))_Block_copy(aBlock);
  v9[2](v9, v7);
  v10 = objc_claimAutoreleasedReturnValue();
  v9[2](v9, v8);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v10 | v11)
  {
    PXGAXCreateFocusChangeUserInfo((void *)v10, (void *)v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGBasicAXGroup axNextResponder](self, "axNextResponder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "axGroup:didChange:userInfo:", self, 2, v12);

  }
}

id __86__PXGBasicAXGroup_PlatformSpecific__didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v12;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = objc_msgSend(v4, "spriteIndex");
    objc_msgSend(v4, "axContainingGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v6, "loadedLeafIndexes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsIndex:", v5);

    if (v9)
      v10 = v4;
    else
      v10 = 0;
    if (v5 == -1 || v6 != v7)
      v10 = 0;
    v12 = v10;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (PXGLayout)containingLayout
{
  void *v4;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  -[PXGBasicAXGroup axGroupSource](self, "axGroupSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "px_descriptionForAssertionMessage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGLayout+AX.m"), 349, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.axGroupSource"), v8, v9);

    }
  }
  return (PXGLayout *)v4;
}

@end
