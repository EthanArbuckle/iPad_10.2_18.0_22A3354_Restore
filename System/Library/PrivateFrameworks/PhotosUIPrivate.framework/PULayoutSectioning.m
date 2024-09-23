@implementation PULayoutSectioning

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PULayoutSectioning;
  -[PULayoutSectioning dealloc](&v4, sel_dealloc);
}

- (void)_baseSectioningDidInvalidateSampling:(id)a3
{
  if (!self->_invalidatingSampling)
    -[PULayoutSectioning invalidateSampling](self, "invalidateSampling", a3);
}

- (void)invalidateSampling
{
  PULayoutSectioning *baseSectioning;
  void *v4;

  if (!self->_invalidatingSampling)
  {
    baseSectioning = self->_baseSectioning;
    if (baseSectioning)
    {
      self->_invalidatingSampling = 1;
      -[PULayoutSectioning invalidateSampling](baseSectioning, "invalidateSampling");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "postNotificationName:object:", CFSTR("_PULayoutSectioningDidInvalidateSamplingNotification"), self);

      self->_invalidatingSampling = 0;
    }
  }
}

- (BOOL)hasSomeSampling
{
  return 0;
}

- (void)_baseSectioningDidInvalidateSections:(id)a3
{
  if (!self->_invalidatingSections)
    -[PULayoutSectioning invalidateSections](self, "invalidateSections", a3);
}

- (void)invalidateSections
{
  PULayoutSectioning *baseSectioning;
  void *v4;

  -[PULayoutSectioning invalidateSampling](self, "invalidateSampling");
  if (!self->_invalidatingSections)
  {
    baseSectioning = self->_baseSectioning;
    if (baseSectioning)
    {
      self->_invalidatingSections = 1;
      -[PULayoutSectioning invalidateSections](baseSectioning, "invalidateSections");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "postNotificationName:object:", CFSTR("_PULayoutSectioningDidInvalidateSectionsNotification"), self);

      self->_invalidatingSections = 0;
    }
  }
}

- (void)setBaseSectioning:(id)a3
{
  PULayoutSectioning *v5;
  PULayoutSectioning *baseSectioning;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PULayoutSectioning *v11;

  v5 = (PULayoutSectioning *)a3;
  baseSectioning = self->_baseSectioning;
  v11 = v5;
  if (baseSectioning != v5)
  {
    if (baseSectioning)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("_PULayoutSectioningDidInvalidateSamplingNotification"), self->_baseSectioning);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("_PULayoutSectioningDidInvalidateSectionsNotification"), self->_baseSectioning);

    }
    objc_storeStrong((id *)&self->_baseSectioning, a3);
    if (self->_baseSectioning)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__baseSectioningDidInvalidateSampling_, CFSTR("_PULayoutSectioningDidInvalidateSamplingNotification"), self->_baseSectioning);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__baseSectioningDidInvalidateSections_, CFSTR("_PULayoutSectioningDidInvalidateSectionsNotification"), self->_baseSectioning);

    }
  }

}

- (int64_t)numberOfVisualItemsInVisualSection:(int64_t)a3
{
  void *v5;
  int64_t v6;

  -[PULayoutSectioning delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfItemsInRealSection:forSectioning:", a3, self);

  return v6;
}

- (PUSimpleIndexPath)mainRealItemIndexPathForVisualIndexPath:(PUSimpleIndexPath)a3
{
  int64_t var1;
  int64_t var0;
  PUSimpleIndexPath result;

  var1 = a3.var1;
  var0 = a3.var0;
  result.var1 = var1;
  result.var0 = var0;
  return result;
}

- (PUSimpleIndexPath)visualIndexPathForRealIndexPath:(PUSimpleIndexPath)a3 isMainItem:(BOOL *)a4
{
  int64_t var1;
  int64_t var0;
  PUSimpleIndexPath result;

  var1 = a3.var1;
  var0 = a3.var0;
  if (a4)
    *a4 = 1;
  result.var1 = var1;
  result.var0 = var0;
  return result;
}

- (int64_t)mainRealSectionForVisualSection:(int64_t)a3
{
  return a3;
}

- (int64_t)visualSectionForRealSection:(int64_t)a3
{
  return a3;
}

- (void)enumerateRealSectionsForVisualSection:(int64_t)a3 usingBlock:(id)a4
{
  char v4;

  v4 = 0;
  (*((void (**)(id, int64_t, char *))a4 + 2))(a4, a3, &v4);
}

- (void)enumerateRealMainItemIndexPathsForVisualSection:(int64_t)a3 inVisualItemRange:(_NSRange)a4 usingBlock:(id)a5
{
  NSUInteger location;
  NSUInteger v8;
  BOOL v9;
  char v10;

  v10 = 0;
  if ((uint64_t)a4.location < (int64_t)(a4.location + a4.length))
  {
    location = a4.location;
    v8 = a4.length - 1;
    do
    {
      (*((void (**)(id, NSUInteger, int64_t, NSUInteger, char *))a5 + 2))(a5, location, a3, location, &v10);
      ++location;
      if (v10)
        v9 = 1;
      else
        v9 = v8 == 0;
      --v8;
    }
    while (!v9);
  }
}

- (id)visibleUnsampledIndexesForCombinedRealSections:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("%@ has no sampling and shouldn't be used to provide sub-sampling"), self);
  return 0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PULayoutSectioning delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p for %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)__debugUnsampledIndexForRealIndexPath:(PUSimpleIndexPath)a3
{
  return a3.var1;
}

- (id)_sectioningDescriptionShowInvisibleItemsInBaseSectioning:(BOOL)a3 hasIncorrectSampling:(BOOL *)a4 hasInvisibleItemsInBaseSectioning:(BOOL *)a5
{
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  BOOL *v20;
  BOOL *v21;
  void *v22;
  id v23;
  char v25;
  char v26;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  _QWORD aBlock[4];
  id v34;
  PULayoutSectioning *v35;
  id v36;
  _QWORD *v37;
  uint64_t v38;
  BOOL *v39;
  BOOL *v40;
  char v41;
  BOOL v42;
  _QWORD v43[5];

  -[PULayoutSectioning delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_opt_respondsToSelector();
  v9 = objc_opt_respondsToSelector();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v8, "numberOfVisualSectionsForSectioning:", self);
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  if (v28 >= 1)
  {
    v11 = 0;
    v25 = v9 & 1;
    do
    {
      objc_msgSend(v8, "realSectionsForVisualSection:forSectioning:", v11, self);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");
      v14 = -[PULayoutSectioning numberOfVisualItemsInVisualSection:](self, "numberOfVisualItemsInVisualSection:", v11);
      v30 = v12;
      if ((v26 & 1) != 0
        && (objc_msgSend(v8, "debugDescriptionOfVisualSection:forSectioning:", v11, self),
            (v15 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v29 = (void *)v15;
        objc_msgSend(v10, "appendFormat:", CFSTR("[%@ (%lu real sections - %ld displayed items)]\n"), v15, v13, v14);
      }
      else
      {
        objc_msgSend(v10, "appendFormat:", CFSTR("[Visual Section #%ld (%lu real sections - %ld displayed items)]\n"), v11, v13, v14);
        v29 = 0;
      }
      v43[0] = 0;
      v43[1] = v43;
      v43[2] = 0x2020000000;
      v43[3] = 0x7FFFFFFFFFFFFFFFLL;
      v16 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __134__PULayoutSectioning__sectioningDescriptionShowInvisibleItemsInBaseSectioning_hasIncorrectSampling_hasInvisibleItemsInBaseSectioning___block_invoke;
      aBlock[3] = &unk_1E58A1E80;
      v37 = v43;
      v41 = v25;
      v17 = v8;
      v34 = v8;
      v35 = self;
      v18 = v10;
      v19 = v10;
      v36 = v19;
      v38 = v11;
      v39 = a4;
      v20 = a4;
      v21 = a5;
      v40 = a5;
      v42 = a3;
      v22 = _Block_copy(aBlock);
      v31[0] = v16;
      v31[1] = 3221225472;
      v31[2] = __134__PULayoutSectioning__sectioningDescriptionShowInvisibleItemsInBaseSectioning_hasIncorrectSampling_hasInvisibleItemsInBaseSectioning___block_invoke_2;
      v31[3] = &unk_1E58A1EA8;
      v23 = v22;
      v32 = v23;
      -[PULayoutSectioning enumerateRealMainItemIndexPathsForVisualSection:inVisualItemRange:usingBlock:](self, "enumerateRealMainItemIndexPathsForVisualSection:inVisualItemRange:usingBlock:", v11, 0, v14, v31);
      objc_msgSend(v19, "appendString:", CFSTR("\n\n"));

      _Block_object_dispose(v43, 8);
      ++v11;
      a5 = v21;
      a4 = v20;
      v10 = v18;
      v8 = v17;
    }
    while (v28 != v11);
  }

  return v10;
}

- (id)sectioningDescription
{
  return -[PULayoutSectioning _sectioningDescriptionShowInvisibleItemsInBaseSectioning:hasIncorrectSampling:hasInvisibleItemsInBaseSectioning:](self, "_sectioningDescriptionShowInvisibleItemsInBaseSectioning:hasIncorrectSampling:hasInvisibleItemsInBaseSectioning:", 1, 0, 0);
}

- (id)sectioningHashHasIncorrectSampling:(BOOL *)a3 hasInvisibleItemsInBaseSectioning:(BOOL *)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  -[PULayoutSectioning _sectioningDescriptionShowInvisibleItemsInBaseSectioning:hasIncorrectSampling:hasInvisibleItemsInBaseSectioning:](self, "_sectioningDescriptionShowInvisibleItemsInBaseSectioning:hasIncorrectSampling:hasInvisibleItemsInBaseSectioning:", 0, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%llx"), objc_msgSend(v5, "pu_platformAgnosticHash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sectioningHash
{
  return -[PULayoutSectioning sectioningHashHasIncorrectSampling:hasInvisibleItemsInBaseSectioning:](self, "sectioningHashHasIncorrectSampling:hasInvisibleItemsInBaseSectioning:", 0, 0);
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  unint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  id *v33;
  uint64_t v34;
  id v35;
  id v36;
  char v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  const __CFString *v41;
  void *v42;
  _QWORD v43[2];
  _QWORD v44[4];

  v33 = a4;
  v44[2] = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v36 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PULayoutSectioning delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfRealSectionsForSectioning:", self);
  v7 = objc_opt_respondsToSelector();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6);
  v9 = 0x1E0CB3000uLL;
  if (v6 >= 1)
  {
    for (i = 0; i != v6; ++i)
    {
      if ((v7 & 1) != 0
        && (objc_msgSend(v5, "debugDescriptionOfRealSection:forSectioning:", i, self),
            (v11 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v12 = (void *)v11;
        v43[1] = CFSTR("count");
        v44[0] = v11;
        v43[0] = CFSTR("name");
        objc_msgSend(*(id *)(v9 + 2024), "numberWithInteger:", objc_msgSend(v5, "numberOfItemsInRealSection:forSectioning:", i, self));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v44[1] = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        v9 = 0x1E0CB3000;
      }
      else
      {
        v41 = CFSTR("count");
        objc_msgSend(*(id *)(v9 + 2024), "numberWithInteger:", objc_msgSend(v5, "numberOfItemsInRealSection:forSectioning:", i, self, v33));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v13);
      }

    }
  }
  objc_msgSend(v36, "setObject:forKey:", v8, CFSTR("realSections"), v33);

  v15 = objc_msgSend(v5, "numberOfVisualSectionsForSectioning:", self);
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v15);
  v37 = objc_opt_respondsToSelector();
  v16 = objc_opt_respondsToSelector();
  v17 = 0x1E0C99000uLL;
  if (v15 >= 1)
  {
    v18 = v16;
    v19 = v15;
    for (j = 0; j != v19; ++j)
    {
      objc_msgSend(v5, "realSectionsForVisualSection:forSectioning:", j, self);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v21, "count"));
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __39__PULayoutSectioning_writeToURL_error___block_invoke;
      v39[3] = &unk_1E58A85F8;
      v23 = v22;
      v40 = v23;
      objc_msgSend(v21, "enumerateIndexesUsingBlock:", v39);
      if ((v37 & 1) != 0)
      {
        objc_msgSend(v5, "debugDescriptionOfVisualSection:forSectioning:", j, self);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = 0;
      }
      v25 = objc_alloc_init(*(Class *)(v17 + 3592));
      objc_msgSend(v25, "setObject:forKey:", v23, CFSTR("realSections"));
      if (v24)
        objc_msgSend(v25, "setObject:forKey:", v24, CFSTR("name"));
      if ((v18 & 1) != 0)
      {
        v26 = objc_msgSend(v5, "maximumNumberOfItemsInVisualSection:withNumberOfRealItems:forSectioning:", j, -[PULayoutSectioning numberOfRealItemsInVisualSection:](self, "numberOfRealItemsInVisualSection:", j), self);
        if (v26 >= 1)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKey:", v27, CFSTR("max"));

          v17 = 0x1E0C99000;
        }
      }
      objc_msgSend(v38, "addObject:", v25);

    }
  }
  objc_msgSend(v36, "setObject:forKey:", v38, CFSTR("visualSections"));

  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v36, 200, 0, v34);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    v30 = v35;
    v31 = objc_msgSend(v28, "writeToURL:options:error:", v35, 0, v34);
  }
  else
  {
    v31 = 0;
    v30 = v35;
  }

  return v31;
}

- (PULayoutSectioningDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (PULayoutSectioningDelegate *)a3;
}

- (PULayoutSectioning)baseSectioning
{
  return self->_baseSectioning;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseSectioning, 0);
}

void __39__PULayoutSectioning_writeToURL_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __134__PULayoutSectioning__sectioningDescriptionShowInvisibleItemsInBaseSectioning_hasIncorrectSampling_hasInvisibleItemsInBaseSectioning___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  _BYTE *v13;
  void *v14;
  _BYTE *v15;
  int v16;
  BOOL v17;
  char v18;
  void *v19;
  uint64_t v21;
  unsigned __int8 v22;
  char v23;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) != a3)
  {
    if (*(_BYTE *)(a1 + 88)
      && (objc_msgSend(*(id *)(a1 + 32), "debugDescriptionOfRealSection:forSectioning:", a3, *(_QWORD *)(a1 + 40)),
          (v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v9 = (void *)v8;
      objc_msgSend(*(id *)(a1 + 48), "appendFormat:", CFSTR("(%@)"), v8);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "appendFormat:", CFSTR("(#%ld)"), a3);
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;
  }
  v23 = 0;
  v11 = 0;
  if (objc_msgSend(*(id *)(a1 + 40), "visualIndexPathForRealIndexPath:isMainItem:", a3, a4, &v23) == *(_QWORD *)(a1 + 64)
    && v10 == a2)
  {
    v11 = v23 != 0;
  }
  if (!v11)
  {
    v13 = *(_BYTE **)(a1 + 72);
    if (v13)
      *v13 = 1;
  }
  v22 = 1;
  if ((*(_QWORD *)(a1 + 80) || *(_BYTE *)(a1 + 89)) && (v14 = *(void **)(*(_QWORD *)(a1 + 40) + 16)) != 0)
  {
    objc_msgSend(v14, "visualIndexPathForRealIndexPath:isMainItem:", a3, a4, &v22);
    v15 = *(_BYTE **)(a1 + 80);
    v16 = v22;
    if (v15 && !v22)
    {
      *v15 = 1;
      v16 = v22;
    }
  }
  else
  {
    v16 = 1;
  }
  if (*(_BYTE *)(a1 + 89))
    v17 = v16 == 0;
  else
    v17 = 0;
  v18 = v17;
  v19 = *(void **)(a1 + 48);
  if (v11)
  {
    if ((v18 & 1) != 0)
      return objc_msgSend(v19, "appendFormat:", CFSTR("{%ld/%ld}"), a4, objc_msgSend(*(id *)(a1 + 40), "__debugUnsampledIndexForRealIndexPath:", a3, a4));
    else
      return objc_msgSend(v19, "appendFormat:", CFSTR("<%ld>"), a4, v21);
  }
  else if ((v18 & 1) != 0)
  {
    return objc_msgSend(v19, "appendFormat:", CFSTR("{*%ld/%ld*}"), a4, objc_msgSend(*(id *)(a1 + 40), "__debugUnsampledIndexForRealIndexPath:", a3, a4));
  }
  else
  {
    return objc_msgSend(v19, "appendFormat:", CFSTR("<*%ld*>"), a4, v21);
  }
}

uint64_t __134__PULayoutSectioning__sectioningDescriptionShowInvisibleItemsInBaseSectioning_hasIncorrectSampling_hasInvisibleItemsInBaseSectioning___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
