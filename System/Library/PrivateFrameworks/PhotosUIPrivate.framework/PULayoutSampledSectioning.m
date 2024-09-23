@implementation PULayoutSampledSectioning

- (PULayoutSampledSectioning)init
{
  PULayoutSampledSectioning *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PULayoutSampledSectioning;
  result = -[PULayoutSampledSectioning init](&v3, sel_init);
  if (result)
    result->_supportsSamplingAndSectionGrouping = 1;
  return result;
}

- (void)setSupportsSamplingAndSectionGrouping:(BOOL)a3
{
  if (self->_supportsSamplingAndSectionGrouping != a3)
  {
    self->_supportsSamplingAndSectionGrouping = a3;
    if (!a3)
      self->_hasSomeSampling = 0;
    -[PULayoutSampledSectioning invalidateSections](self, "invalidateSections");
  }
}

- (void)_discardSamplingCache
{
  int64_t *maximumNumberOfVisibleItemsForVisualSection;
  id *sectionSamplers;
  int64_t v5;
  id *v6;
  id v7;

  maximumNumberOfVisibleItemsForVisualSection = self->_maximumNumberOfVisibleItemsForVisualSection;
  if (maximumNumberOfVisibleItemsForVisualSection)
  {
    free(maximumNumberOfVisibleItemsForVisualSection);
    self->_maximumNumberOfVisibleItemsForVisualSection = 0;
  }
  sectionSamplers = self->_sectionSamplers;
  if (sectionSamplers)
  {
    if (self->_numberOfVisualSections >= 1)
    {
      v5 = 0;
      do
      {
        v6 = self->_sectionSamplers;
        v7 = v6[v5];
        v6[v5] = 0;

        ++v5;
      }
      while (v5 < self->_numberOfVisualSections);
      sectionSamplers = self->_sectionSamplers;
    }
    free(sectionSamplers);
    self->_sectionSamplers = 0;
  }
}

- (void)_discardSectioningCache
{
  int64_t *numberOfItemsForRealSection;
  int64_t *startIndexInVisualSectionForRealSection;
  int64_t *visualSectionForRealSection;
  int64_t *numberOfRealItemsForVisualSection;
  NSArray *realSectionIndexesForVisualSection;

  numberOfItemsForRealSection = self->_numberOfItemsForRealSection;
  if (numberOfItemsForRealSection)
  {
    free(numberOfItemsForRealSection);
    self->_numberOfItemsForRealSection = 0;
  }
  startIndexInVisualSectionForRealSection = self->_startIndexInVisualSectionForRealSection;
  if (startIndexInVisualSectionForRealSection)
  {
    free(startIndexInVisualSectionForRealSection);
    self->_startIndexInVisualSectionForRealSection = 0;
  }
  visualSectionForRealSection = self->_visualSectionForRealSection;
  if (visualSectionForRealSection)
  {
    free(visualSectionForRealSection);
    self->_visualSectionForRealSection = 0;
  }
  numberOfRealItemsForVisualSection = self->_numberOfRealItemsForVisualSection;
  if (numberOfRealItemsForVisualSection)
  {
    free(numberOfRealItemsForVisualSection);
    self->_numberOfRealItemsForVisualSection = 0;
  }
  realSectionIndexesForVisualSection = self->_realSectionIndexesForVisualSection;
  self->_realSectionIndexesForVisualSection = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[PULayoutSampledSectioning _discardSamplingCache](self, "_discardSamplingCache");
  -[PULayoutSampledSectioning _discardSectioningCache](self, "_discardSectioningCache");
  v3.receiver = self;
  v3.super_class = (Class)PULayoutSampledSectioning;
  -[PULayoutSectioning dealloc](&v3, sel_dealloc);
}

- (void)invalidateSampling
{
  objc_super v3;

  -[PULayoutSampledSectioning _discardSamplingCache](self, "_discardSamplingCache");
  self->_samplingIsValid = 0;
  v3.receiver = self;
  v3.super_class = (Class)PULayoutSampledSectioning;
  -[PULayoutSectioning invalidateSampling](&v3, sel_invalidateSampling);
}

- (BOOL)hasSomeSampling
{
  if (!self->_supportsSamplingAndSectionGrouping)
    return 0;
  -[PULayoutSampledSectioning _cacheSectioningIfNeeded](self, "_cacheSectioningIfNeeded");
  return self->_hasSomeSampling;
}

- (void)invalidateSections
{
  objc_super v3;

  -[PULayoutSampledSectioning _discardSectioningCache](self, "_discardSectioningCache");
  self->_sectioningIsValid = 0;
  v3.receiver = self;
  v3.super_class = (Class)PULayoutSampledSectioning;
  -[PULayoutSectioning invalidateSections](&v3, sel_invalidateSections);
}

- (void)_cacheSectioningIfNeeded
{
  int64_t v3;
  uint64_t v4;
  PULayoutSectioning *baseSectioning;
  int64_t numberOfRealSections;
  void *v7;
  int64_t v8;
  int64_t v9;
  int64_t i;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int64_t v28;
  void *v29;
  PULayoutSectioning *v30;
  int64_t v31;
  uint64_t v32;
  int64_t v33;
  id v34;
  id obj;
  id obja;
  _QWORD v37[5];
  _QWORD v38[4];
  id v39;
  id v40;
  PULayoutSampledSectioning *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;

  if (self->_sectioningIsValid)
  {
    if (!self->_samplingIsValid)
    {
      self->_hasSomeSampling = 0;
      self->_maximumNumberOfVisibleItemsForVisualSection = (int64_t *)malloc_type_malloc(8 * self->_numberOfVisualSections, 0x100004000313F17uLL);
      -[PULayoutSectioning delegate](self, "delegate");
      obj = (id)objc_claimAutoreleasedReturnValue();
      if (self->_numberOfVisualSections >= 1)
      {
        v3 = 0;
        do
        {
          v4 = objc_msgSend(obj, "maximumNumberOfItemsInVisualSection:withNumberOfRealItems:forSectioning:", v3, self->_numberOfRealItemsForVisualSection[v3], self);
          self->_maximumNumberOfVisibleItemsForVisualSection[v3] = v4;
          if (v4 >= 1 && self->_numberOfRealItemsForVisualSection[v3] > v4)
            self->_hasSomeSampling = 1;
          ++v3;
        }
        while (v3 < self->_numberOfVisualSections);
      }
      baseSectioning = self->super._baseSectioning;
      if (baseSectioning && -[PULayoutSectioning hasSomeSampling](baseSectioning, "hasSomeSampling"))
      {
        numberOfRealSections = self->_numberOfRealSections;
        if (numberOfRealSections >= 1)
          self->_sectionSamplers = (id *)malloc_type_calloc(numberOfRealSections, 8uLL, 0x80040B8603338uLL);
      }
      self->_samplingIsValid = 1;
      self->_lastHitRealSectionIndex = 0x7FFFFFFFFFFFFFFFLL;
      self->_lastHitVisualSectionIndex = 0x7FFFFFFFFFFFFFFFLL;
      self->_lastHitRangeIndex = 0x7FFFFFFFFFFFFFFFLL;

    }
  }
  else
  {
    -[PULayoutSectioning delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfRealSectionsForSectioning:", self);
    self->_numberOfRealSections = v8;
    self->_numberOfItemsForRealSection = (int64_t *)malloc_type_malloc(8 * v8, 0x100004000313F17uLL);
    v9 = self->_numberOfRealSections;
    if (v9 >= 1)
    {
      for (i = 0; i < v9; ++i)
      {
        self->_numberOfItemsForRealSection[i] = objc_msgSend(v7, "numberOfItemsInRealSection:forSectioning:", i, self);
        v9 = self->_numberOfRealSections;
      }
    }
    self->_startIndexInVisualSectionForRealSection = (int64_t *)malloc_type_malloc(8 * v9, 0x100004000313F17uLL);
    self->_visualSectionForRealSection = (int64_t *)malloc_type_calloc(self->_numberOfRealSections, 8uLL, 0x100004000313F17uLL);
    v11 = objc_msgSend(v7, "numberOfVisualSectionsForSectioning:", self);
    obja = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v11);
    self->_hasSomeSampling = 0;
    self->_numberOfRealItemsForVisualSection = (int64_t *)malloc_type_malloc(8 * v11, 0x100004000313F17uLL);
    self->_maximumNumberOfVisibleItemsForVisualSection = (int64_t *)malloc_type_malloc(8 * v11, 0x100004000313F17uLL);
    v56 = 0;
    v57 = &v56;
    v58 = 0x3032000000;
    v59 = __Block_byref_object_copy__45269;
    v60 = __Block_byref_object_dispose__45270;
    v61 = 0;
    v12 = self->_numberOfRealSections;
    v34 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    if (v11 < 1)
    {
      v32 = 0;
    }
    else
    {
      v32 = 0;
      v13 = 0;
      v33 = v11;
      do
      {
        objc_msgSend(v7, "realSectionsForVisualSection:forSectioning:", v13, self);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "count")
          && (unint64_t)objc_msgSend(v14, "lastIndex") >= self->_numberOfRealSections)
        {
          v15 = (void *)objc_msgSend(v14, "mutableCopy");
          objc_msgSend(v15, "removeIndexesInRange:", self->_numberOfRealSections, objc_msgSend(v14, "lastIndex") - self->_numberOfRealSections + 1);
          ++v32;

          v11 = v33;
        }
        else
        {
          v15 = v14;
        }
        v50 = 0;
        v51 = &v50;
        v52 = 0x3032000000;
        v53 = __Block_byref_object_copy__45269;
        v54 = __Block_byref_object_dispose__45270;
        v55 = 0;
        v46 = 0;
        v47 = &v46;
        v48 = 0x2020000000;
        v49 = 0;
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __53__PULayoutSampledSectioning__cacheSectioningIfNeeded__block_invoke;
        v38[3] = &unk_1E58A1ED0;
        v16 = v34;
        v39 = v16;
        v42 = &v50;
        v17 = v15;
        v40 = v17;
        v41 = self;
        v44 = &v46;
        v45 = v13;
        v43 = &v56;
        objc_msgSend(v17, "enumerateIndexesUsingBlock:", v38);
        v18 = (void *)v51[5];
        if (v18)
        {
          v19 = v18;

          v17 = v19;
          v11 = v33;
        }
        objc_msgSend(obja, "addObject:", v17);
        objc_msgSend(v16, "addIndexes:", v17);
        self->_numberOfRealItemsForVisualSection[v13] = v47[3];
        v20 = objc_msgSend(v7, "maximumNumberOfItemsInVisualSection:withNumberOfRealItems:forSectioning:", v13);
        self->_maximumNumberOfVisibleItemsForVisualSection[v13] = v20;
        if (v20 >= 1 && self->_numberOfRealItemsForVisualSection[v13] > v20)
          self->_hasSomeSampling = 1;
        v12 -= objc_msgSend(v17, "count");

        _Block_object_dispose(&v46, 8);
        _Block_object_dispose(&v50, 8);

        ++v13;
      }
      while (v11 != v13);
    }
    if (v57[5] || v12 || v32)
    {
      v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld real section(s) in no visual sections"), v12);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v22);

      }
      v23 = (void *)v57[5];
      if (v23)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld real section(s) in several visual sections"), objc_msgSend(v23, "count"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v24);

      }
      if (v32)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld visual section(s) with unknown real sections"), v32);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v25);

      }
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", "));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Found (hopefully transient) model inconsistencies: %@"), v26);

    }
    objc_storeStrong((id *)&self->_realSectionIndexesForVisualSection, obja);
    self->_numberOfVisualSections = v11;
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", 0, self->_numberOfRealSections);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_numberOfVisualSections >= 1)
      {
        v28 = 0;
        do
        {
          -[NSArray objectAtIndexedSubscript:](self->_realSectionIndexesForVisualSection, "objectAtIndexedSubscript:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "removeIndexes:", v29);

          ++v28;
        }
        while (v28 < self->_numberOfVisualSections);
      }
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __53__PULayoutSampledSectioning__cacheSectioningIfNeeded__block_invoke_2;
      v37[3] = &unk_1E58A85F8;
      v37[4] = self;
      objc_msgSend(v27, "enumerateIndexesUsingBlock:", v37);

    }
    v30 = self->super._baseSectioning;
    if (v30)
    {
      if (-[PULayoutSectioning hasSomeSampling](v30, "hasSomeSampling"))
      {
        v31 = self->_numberOfRealSections;
        if (v31 >= 1)
          self->_sectionSamplers = (id *)malloc_type_calloc(v31, 8uLL, 0x80040B8603338uLL);
      }
    }
    self->_samplingIsValid = 1;
    self->_sectioningIsValid = 1;
    self->_lastHitRealSectionIndex = 0x7FFFFFFFFFFFFFFFLL;
    self->_lastHitVisualSectionIndex = 0x7FFFFFFFFFFFFFFFLL;
    self->_lastHitRangeIndex = 0x7FFFFFFFFFFFFFFFLL;

    _Block_object_dispose(&v56, 8);
  }
}

- (int64_t)numberOfVisualItemsInVisualSection:(int64_t)a3
{
  int64_t result;
  int64_t v7;
  void *v9;
  int64_t v10;
  void *v11;

  if (self->_supportsSamplingAndSectionGrouping)
  {
    -[PULayoutSampledSectioning _cacheSectioningIfNeeded](self, "_cacheSectioningIfNeeded");
    if (a3 < 0 || self->_numberOfVisualSections <= a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PULayoutSectioning.m"), 1088, CFSTR("Invalid visual section %ld for %ld visual sections"), a3, self->_numberOfVisualSections);

    }
    result = self->_numberOfRealItemsForVisualSection[a3];
    if (self->_hasSomeSampling)
    {
      v7 = self->_maximumNumberOfVisibleItemsForVisualSection[a3];
      if (result > v7 && v7 != 0)
        return self->_maximumNumberOfVisibleItemsForVisualSection[a3];
    }
  }
  else
  {
    -[PULayoutSectioning delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "numberOfItemsInRealSection:forSectioning:", a3, self);

    return v10;
  }
  return result;
}

- (int64_t)numberOfRealItemsInVisualSection:(int64_t)a3
{
  void *v7;

  if (!self->_supportsSamplingAndSectionGrouping)
    return -[PULayoutSampledSectioning numberOfVisualItemsInVisualSection:](self, "numberOfVisualItemsInVisualSection:", a3);
  -[PULayoutSampledSectioning _cacheSectioningIfNeeded](self, "_cacheSectioningIfNeeded");
  if (a3 < 0 || self->_numberOfVisualSections <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PULayoutSectioning.m"), 1110, CFSTR("Invalid visual section %ld for %ld visual sections"), a3, self->_numberOfVisualSections);

  }
  return self->_numberOfRealItemsForVisualSection[a3];
}

- (id)_sectionSamplerForVisualSection:(int64_t)a3
{
  PULayoutSectionSimpleSampler *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t *v15;
  int v16;
  uint64_t v17;
  char v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  int v30;
  void *v31;
  void *v32;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  _QWORD *v42;
  uint64_t *v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD v46[4];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;

  v5 = (PULayoutSectionSimpleSampler *)self->_sectionSamplers[a3];
  if (!v5)
  {
    v6 = self->_maximumNumberOfVisibleItemsForVisualSection[a3];
    v7 = self->_numberOfRealItemsForVisualSection[a3];
    -[NSArray objectAtIndexedSubscript:](self->_realSectionIndexesForVisualSection, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PULayoutSectioning visibleUnsampledIndexesForCombinedRealSections:](self->super._baseSectioning, "visibleUnsampledIndexesForCombinedRealSections:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    if (v10 == v7 || v10 == 0)
    {
      v5 = -[PULayoutSectionSimpleSampler initWithNumberOfVisibleItems:numberOfRealItems:]([PULayoutSectionSimpleSampler alloc], "initWithNumberOfVisibleItems:numberOfRealItems:", v6, v7);
LABEL_40:
      objc_storeStrong(&self->_sectionSamplers[a3], v5);

      return v5;
    }
    v5 = -[PULayoutSectionListSampler initWithNumberOfVisibleItems:numberOfRealItems:]([PULayoutSectionListSampler alloc], "initWithNumberOfVisibleItems:numberOfRealItems:", v6, v7);
    v37 = (_QWORD *)-[PULayoutSectionSimpleSampler visibleItemIndexes](v5, "visibleItemIndexes");
    v12 = v9;
    v13 = v12;
    if (v6 >= v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _spreadIndexesInBuffer(NSInteger *, NSInteger, NSInteger, NSIndexSet *__strong)");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("PULayoutSectioning.m"), 409, CFSTR("Invalid count for visible indexes buffer (%ld) compared to maximum index (%ld)"), v6, v7);

    }
    v14 = objc_msgSend(v13, "count");
    if (v14 <= 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _spreadIndexesInBuffer(NSInteger *, NSInteger, NSInteger, NSIndexSet *__strong)");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("PULayoutSectioning.m"), 412, CFSTR("Invalid empty hinting from base sectioning"));

    }
    if (objc_msgSend(v13, "lastIndex") >= (unint64_t)v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _spreadIndexesInBuffer(NSInteger *, NSInteger, NSInteger, NSIndexSet *__strong)");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("PULayoutSectioning.m"), 413, CFSTR("Invalid last index for visible indexes hint (%ld) compared to maximum index (%ld)"), objc_msgSend(v13, "lastIndex"), v7);

    }
    if (v6 == v14)
    {
      objc_msgSend(v13, "getIndexes:maxCount:inIndexRange:", v37, v6, 0);
LABEL_39:

      goto LABEL_40;
    }
    if (v6 < v14)
    {
      v15 = (uint64_t *)malloc_type_malloc(8 * v14, 0x100004000313F17uLL);
      objc_msgSend(v13, "getIndexes:maxCount:inIndexRange:", v15, v14, 0);
      v38 = MEMORY[0x1E0C809B0];
      v39 = 3221225472;
      v40 = ___spreadIndexesInBuffer_block_invoke;
      v41 = &__block_descriptor_48_e11_v24__0q8q16l;
      v42 = v37;
      v43 = v15;
      _iterateBySpreadingIndexes(v6, v14, &v38);
      free(v15);
      goto LABEL_39;
    }
    v47 = 0;
    v48 = &v47;
    v49 = 0x2020000000;
    v50 = v6 - v14;
    v16 = objc_msgSend(v13, "containsIndex:", 0);
    v17 = v48[3];
    v30 = v16;
    if ((v16 & 1) == 0)
      v48[3] = --v17;
    v29 = v7 - 1;
    if (v17 < 1 || (v18 = objc_msgSend(v13, "containsIndex:"), v17 = v48[3], (v18 & 1) != 0))
    {
      v33 = 0;
      if (v17)
      {
LABEL_24:
        v28 = v8;
        v27 = v14 + (v30 ^ 1u);
        v19 = malloc_type_malloc(8 * (v27 + v33), 0x100004000313F17uLL);
        v20 = v19;
        if ((v30 & 1) != 0)
        {
          objc_msgSend(v13, "getIndexes:maxCount:inIndexRange:", v19, v14, 0);
        }
        else
        {
          *v19 = 0;
          objc_msgSend(v13, "getIndexes:maxCount:inIndexRange:", v19 + 1, v14, 0);
        }
        v21 = v20;
        v8 = v28;
        if (v33)
          v21[v27] = v29;
        v46[0] = 0;
        v46[1] = v46;
        v46[2] = 0x2020000000;
        v46[3] = 0;
        v38 = MEMORY[0x1E0C809B0];
        v39 = 3221225472;
        v40 = ___spreadIndexesInBuffer_block_invoke_2;
        v41 = &unk_1E58A1F90;
        v42 = v46;
        v43 = &v47;
        v44 = v21;
        v45 = v37;
        _iterateBySpreadingIndexes(v6, v7, &v38);
        free(v21);
        if (v48[3])
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _spreadIndexesInBuffer(NSInteger *, NSInteger, NSInteger, NSIndexSet *__strong)");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("PULayoutSectioning.m"), 485, CFSTR("Did not properly fill up buffer. We still need %ld indexes"), v48[3]);

        }
        _Block_object_dispose(v46, 8);
LABEL_38:
        _Block_object_dispose(&v47, 8);
        goto LABEL_39;
      }
    }
    else
    {
      v22 = v17 - 1;
      v48[3] = v22;
      v33 = 1;
      if (v22)
        goto LABEL_24;
    }
    if ((v30 & 1) != 0)
    {
      objc_msgSend(v13, "getIndexes:maxCount:inIndexRange:", v37, v14, 0);
    }
    else
    {
      *v37 = 0;
      objc_msgSend(v13, "getIndexes:maxCount:inIndexRange:", v37 + 1, v14, 0);
    }
    if (v33)
      v37[v6 - 1] = v29;
    goto LABEL_38;
  }
  return v5;
}

- (int64_t)_visualItemIndexForUnsampledItemIndex:(int64_t)a3 visualSection:(int64_t)a4 isMainItem:(BOOL *)a5
{
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  int64_t v11;
  int64_t result;
  int64_t v13;

  if (a5)
    *a5 = 1;
  if (!self->_hasSomeSampling)
    return a3;
  v7 = self->_maximumNumberOfVisibleItemsForVisualSection[a4];
  v8 = v7 - 1;
  if (v7 < 1)
    return a3;
  v9 = self->_numberOfRealItemsForVisualSection[a4];
  if (v9 <= v7)
    return a3;
  if (self->_sectionSamplers)
  {
    -[PULayoutSampledSectioning _sectionSamplerForVisualSection:](self, "_sectionSamplerForVisualSection:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "indexForUnsampledIndex:isMainItem:", a3, a5);

    return v11;
  }
  else
  {
    result = v7 * a3 / v9;
    if (a5)
    {
      if (v8 <= result)
        v13 = v9 - 1;
      else
        v13 = (v8 + result * v9) / v7;
      *a5 = v13 == a3;
    }
  }
  return result;
}

- (int64_t)_unsampledItemIndexForVisualItemIndex:(int64_t)a3 visualSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;

  v4 = a3;
  if (self->_hasSomeSampling)
  {
    v5 = self->_maximumNumberOfVisibleItemsForVisualSection[a4];
    v6 = v5 - 1;
    if (v5 >= 1)
    {
      v7 = self->_numberOfRealItemsForVisualSection[a4];
      if (v7 > v5)
      {
        if (self->_sectionSamplers)
        {
          -[PULayoutSampledSectioning _sectionSamplerForVisualSection:](self, "_sectionSamplerForVisualSection:", a4);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = objc_msgSend(v8, "unsampledIndexForIndex:", v4);

        }
        else if (v6 <= a3)
        {
          return v7 - 1;
        }
        else
        {
          return (v6 + v7 * a3) / v5;
        }
      }
    }
  }
  return v4;
}

- (PUSimpleIndexPath)_mainRealItemIndexPathForVisualSection:(int64_t)a3 andUnsampledItemIndex:(int64_t)a4
{
  int64_t v7;
  int64_t lastHitRangeIndex;
  int64_t lastHitRealSectionIndex;
  int64_t v10;
  int64_t v11;
  void *v12;
  int64_t v13;
  int64_t v14;
  _QWORD v15[10];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int64_t v23;
  PUSimpleIndexPath result;

  v7 = 0;
  lastHitRangeIndex = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0x7FFFFFFFFFFFFFFFLL;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if (self->_lastHitVisualSectionIndex != a3)
    goto LABEL_9;
  lastHitRealSectionIndex = self->_lastHitRealSectionIndex;
  v10 = self->_startIndexInVisualSectionForRealSection[lastHitRealSectionIndex];
  v11 = a4 - v10;
  if (a4 >= v10 && self->_numberOfItemsForRealSection[lastHitRealSectionIndex] + v10 > a4)
  {
    v23 = self->_lastHitRealSectionIndex;
    v19 = a4 - v10;
    if (lastHitRealSectionIndex != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_10;
    goto LABEL_8;
  }
  if (a4 <= v10)
  {
LABEL_8:
    v7 = 0;
    lastHitRangeIndex = 0;
    goto LABEL_9;
  }
  v7 = lastHitRealSectionIndex + 1;
  lastHitRangeIndex = self->_lastHitRangeIndex;
LABEL_9:
  -[NSArray objectAtIndex:](self->_realSectionIndexesForVisualSection, "objectAtIndex:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self->_lastHitRangeIndex = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__PULayoutSampledSectioning__mainRealItemIndexPathForVisualSection_andUnsampledItemIndex___block_invoke;
  v15[3] = &unk_1E58A1EF8;
  v15[8] = v7;
  v15[9] = a4;
  v15[4] = self;
  v15[5] = &v20;
  v15[6] = &v16;
  v15[7] = lastHitRangeIndex;
  objc_msgSend(v12, "enumerateRangesWithOptions:usingBlock:", 0, v15);
  self->_lastHitRealSectionIndex = v21[3];
  self->_lastHitVisualSectionIndex = a3;

  v11 = v17[3];
  lastHitRealSectionIndex = v21[3];
LABEL_10:
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  v13 = lastHitRealSectionIndex;
  v14 = v11;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (PUSimpleIndexPath)mainRealItemIndexPathForVisualIndexPath:(PUSimpleIndexPath)a3
{
  int64_t var1;
  int64_t var0;
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  PUSimpleIndexPath result;

  var1 = a3.var1;
  var0 = a3.var0;
  if (!self->_supportsSamplingAndSectionGrouping)
    goto LABEL_9;
  -[PULayoutSampledSectioning _cacheSectioningIfNeeded](self, "_cacheSectioningIfNeeded");
  if (var0 < 0 || var0 >= self->_numberOfVisualSections)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PULayoutSectioning.m"), 1327, CFSTR("Invalid visual section %ld for %ld visual sections"), var0, self->_numberOfVisualSections);

    if ((var1 & 0x8000000000000000) == 0)
    {
LABEL_5:
      if (var1 < -[PULayoutSampledSectioning numberOfVisualItemsInVisualSection:](self, "numberOfVisualItemsInVisualSection:", var0))goto LABEL_6;
    }
  }
  else if ((var1 & 0x8000000000000000) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PULayoutSectioning.m"), 1328, CFSTR("Invalid visual item %ld for %ld visual items in visual section #%ld"), var1, -[PULayoutSampledSectioning numberOfVisualItemsInVisualSection:](self, "numberOfVisualItemsInVisualSection:", var0), var0);

LABEL_6:
  if (!self->_numberOfRealItemsForVisualSection[var0])
  {
    var0 = 0x7FFFFFFFFFFFFFFFLL;
    var1 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_9:
    v7 = var0;
    v8 = var1;
    goto LABEL_12;
  }
  v7 = -[PULayoutSampledSectioning _mainRealItemIndexPathForVisualSection:andUnsampledItemIndex:](self, "_mainRealItemIndexPathForVisualSection:andUnsampledItemIndex:", var0, -[PULayoutSampledSectioning _unsampledItemIndexForVisualItemIndex:visualSection:](self, "_unsampledItemIndexForVisualItemIndex:visualSection:", var1, var0));
LABEL_12:
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (PUSimpleIndexPath)visualIndexPathForRealIndexPath:(PUSimpleIndexPath)a3 isMainItem:(BOOL *)a4
{
  int64_t var1;
  int64_t var0;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  PUSimpleIndexPath result;

  var1 = a3.var1;
  var0 = a3.var0;
  if (self->_supportsSamplingAndSectionGrouping)
  {
    -[PULayoutSampledSectioning _cacheSectioningIfNeeded](self, "_cacheSectioningIfNeeded");
    if (var0 < 0 || var0 >= self->_numberOfRealSections)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PULayoutSectioning.m"), 1350, CFSTR("Invalid real section index %ld for %ld real sections"), var0, self->_numberOfRealSections);

    }
    if (var1 < 0 || var1 >= self->_numberOfItemsForRealSection[var0])
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PULayoutSectioning.m"), 1351, CFSTR("Invalid real item index %ld for real section %ld containing %ld items"), var1, var0, self->_numberOfItemsForRealSection[var0]);

    }
    v9 = self->_visualSectionForRealSection[var0];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      var0 = 0x7FFFFFFFFFFFFFFFLL;
      var1 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      var1 = -[PULayoutSampledSectioning _visualItemIndexForUnsampledItemIndex:visualSection:isMainItem:](self, "_visualItemIndexForUnsampledItemIndex:visualSection:isMainItem:", self->_startIndexInVisualSectionForRealSection[var0] + var1, self->_visualSectionForRealSection[var0], a4);
      var0 = v9;
    }
  }
  else if (a4)
  {
    *a4 = 1;
  }
  v10 = var0;
  v11 = var1;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (int64_t)mainRealSectionForVisualSection:(int64_t)a3
{
  void *v6;
  int64_t v7;
  void *v9;

  if (!self->_supportsSamplingAndSectionGrouping)
    return a3;
  -[PULayoutSampledSectioning _cacheSectioningIfNeeded](self, "_cacheSectioningIfNeeded");
  if (a3 < 0 || self->_numberOfVisualSections <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PULayoutSectioning.m"), 1380, CFSTR("Invalid visual section %ld for %ld visual sections"), a3, self->_numberOfVisualSections);

  }
  -[NSArray objectAtIndex:](self->_realSectionIndexesForVisualSection, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "firstIndex");

  return v7;
}

- (int64_t)visualSectionForRealSection:(int64_t)a3
{
  void *v7;

  if (self->_supportsSamplingAndSectionGrouping)
  {
    -[PULayoutSampledSectioning _cacheSectioningIfNeeded](self, "_cacheSectioningIfNeeded");
    if (a3 < 0 || self->_numberOfRealSections <= a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PULayoutSectioning.m"), 1394, CFSTR("Invalid real section %ld for %ld real sections"), a3, self->_numberOfRealSections);

    }
    return self->_visualSectionForRealSection[a3];
  }
  return a3;
}

- (void)enumerateRealSectionsForVisualSection:(int64_t)a3 usingBlock:(id)a4
{
  id v7;
  void (*v8)(void);
  id v9;
  void *v10;
  id v11;

  if (self->_supportsSamplingAndSectionGrouping)
  {
    v7 = a4;
    -[PULayoutSampledSectioning _cacheSectioningIfNeeded](self, "_cacheSectioningIfNeeded");
    if (a3 < 0 || self->_numberOfVisualSections <= a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PULayoutSectioning.m"), 1408, CFSTR("Invalid visual section %ld for %ld visual sections"), a3, self->_numberOfVisualSections);

    }
    -[NSArray objectAtIndex:](self->_realSectionIndexesForVisualSection, "objectAtIndex:", a3);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "enumerateIndexesUsingBlock:", v7);

  }
  else
  {
    v8 = (void (*)(void))*((_QWORD *)a4 + 2);
    v9 = a4;
    v8();

  }
}

- (void)enumerateRealMainItemIndexPathsForVisualSection:(int64_t)a3 inVisualItemRange:(_NSRange)a4 usingBlock:(id)a5
{
  NSUInteger length;
  int64_t location;
  void (**v10)(id, int64_t, uint64_t, uint64_t, char *);
  int64_t v11;
  uint64_t v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char v18;
  NSUInteger v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  int64_t lastHitRealSectionIndex;
  id v28;
  void (**v29)(void *, int64_t, int64_t, _BYTE *);
  uint64_t v30;
  uint64_t v31;
  NSUInteger v32;
  NSUInteger v33;
  uint64_t v34;
  int64_t v35;
  NSUInteger v36;
  BOOL v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  _QWORD aBlock[5];
  id v44;
  void (**v45)(id, int64_t, uint64_t, uint64_t, char *);
  _QWORD *v46;
  _QWORD *v47;
  _QWORD *v48;
  _QWORD *v49;
  _QWORD v50[6];
  _QWORD v51[3];
  int64_t v52;
  _QWORD v53[3];
  int64_t v54;
  _QWORD v55[4];
  char v56[9];
  NSRange v57;

  length = a4.length;
  location = a4.location;
  v10 = (void (**)(id, int64_t, uint64_t, uint64_t, char *))a5;
  v11 = location + length;
  if (self->_supportsSamplingAndSectionGrouping)
  {
    if (self->_numberOfVisualSections <= a3
      || v11 > (unint64_t)-[PULayoutSampledSectioning numberOfVisualItemsInVisualSection:](self, "numberOfVisualItemsInVisualSection:", a3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v57.location = location;
      v57.length = length;
      NSStringFromRange(v57);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PULayoutSectioning.m"), 1428, CFSTR("Invalid visual item range %@ for visual section %ld containing %ld visual items"), v39, a3, -[PULayoutSampledSectioning numberOfVisualItemsInVisualSection:](self, "numberOfVisualItemsInVisualSection:", a3));

      if (!length)
        goto LABEL_49;
    }
    else if (!length)
    {
      goto LABEL_49;
    }
    if (self->_hasSomeSampling)
    {
      v12 = self->_maximumNumberOfVisibleItemsForVisualSection[a3];
      v13 = v12 - 1;
      if (v12 >= 1)
      {
        v14 = self->_numberOfRealItemsForVisualSection[a3];
        if (v14 > v12)
        {
          if (self->_sectionSamplers
            && (-[PULayoutSampledSectioning _sectionSamplerForVisualSection:](self, "_sectionSamplerForVisualSection:", a3), (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            v16 = v15;
            v17 = objc_msgSend(v15, "unsampledIndexForIndex:", location);
            v18 = 0;
          }
          else
          {
            v16 = 0;
            if (v13 <= location)
            {
              v17 = v14 - 1;
              v18 = 1;
            }
            else
            {
              v35 = v13 + v14 * location;
              v18 = 1;
              v17 = v35 / v12;
            }
          }
          goto LABEL_23;
        }
        v12 = 0;
LABEL_22:
        v16 = 0;
        v18 = 1;
        v17 = location;
LABEL_23:
        v21 = -[PULayoutSampledSectioning _mainRealItemIndexPathForVisualSection:andUnsampledItemIndex:](self, "_mainRealItemIndexPathForVisualSection:andUnsampledItemIndex:", a3, v17);
        v56[0] = 0;
        v10[2](v10, location, v21, v22, v56);
        if (length != 1 && !v56[0])
        {
          v23 = location + 1;
          -[NSArray objectAtIndex:](self->_realSectionIndexesForVisualSection, "objectAtIndex:", a3);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "rangeAtIndex:", self->_lastHitRangeIndex);
          v55[0] = 0;
          v55[1] = v55;
          v55[2] = 0x2020000000;
          v55[3] = v25 + v26;
          v53[0] = 0;
          v53[1] = v53;
          v53[2] = 0x2020000000;
          v54 = 0;
          lastHitRealSectionIndex = self->_lastHitRealSectionIndex;
          v54 = self->_startIndexInVisualSectionForRealSection[lastHitRealSectionIndex];
          v51[0] = 0;
          v51[1] = v51;
          v51[2] = 0x2020000000;
          v52 = 0;
          v52 = self->_numberOfItemsForRealSection[lastHitRealSectionIndex] + v54;
          v50[0] = 0;
          v50[1] = v50;
          v50[2] = 0x3010000000;
          v50[3] = &unk_1AB197D4B;
          v50[4] = lastHitRealSectionIndex;
          v50[5] = 0;
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __106__PULayoutSampledSectioning_enumerateRealMainItemIndexPathsForVisualSection_inVisualItemRange_usingBlock___block_invoke;
          aBlock[3] = &unk_1E58A1F20;
          v46 = v51;
          v47 = v55;
          aBlock[4] = self;
          v28 = v24;
          v44 = v28;
          v48 = v53;
          v49 = v50;
          v45 = v10;
          v29 = (void (**)(void *, int64_t, int64_t, _BYTE *))_Block_copy(aBlock);
          if ((v18 & 1) != 0)
          {
            v30 = v12 - 1;
            if (v12 < 1)
            {
              v42 = 0;
              if (v23 < v11)
              {
                v36 = length - 2;
                do
                {
                  v29[2](v29, v23, v23, &v42);
                  ++v23;
                  if (v42)
                    v37 = 1;
                  else
                    v37 = v36 == 0;
                  --v36;
                }
                while (!v37);
              }
            }
            else
            {
              v42 = 0;
              if (v23 < v11)
              {
                v31 = v30 + v14 * v23;
                v32 = length - 2;
                do
                {
                  v33 = v32;
                  if (v14 <= v12)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _unsampledIndexForIndex(NSInteger, NSInteger, NSInteger)");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("PULayoutSectioning.m"), 374, CFSTR("Invalid use"));

                  }
                  v34 = v14 - 1;
                  if (v30 > v23)
                    v34 = v31 / v12;
                  v29[2](v29, v23, v34, &v42);
                  if (v42)
                    break;
                  ++v23;
                  v31 += v14;
                  v32 = v33 - 1;
                }
                while (v33);
              }
            }
          }
          else
          {
            objc_msgSend(v16, "enumerateUnsampledIndexesForSampledIndexInRange:usingBlock:", v23, length - 1, v29);
          }

          _Block_object_dispose(v50, 8);
          _Block_object_dispose(v51, 8);
          _Block_object_dispose(v53, 8);
          _Block_object_dispose(v55, 8);

        }
        goto LABEL_49;
      }
    }
    else
    {
      v12 = 0;
    }
    v14 = 0;
    goto LABEL_22;
  }
  LOBYTE(v50[0]) = 0;
  if (location < v11)
  {
    v19 = length - 1;
    do
    {
      v10[2](v10, location, a3, location, (char *)v50);
      ++location;
      if (LOBYTE(v50[0]))
        v20 = 1;
      else
        v20 = v19 == 0;
      --v19;
    }
    while (!v20);
  }
LABEL_49:

}

- (id)visibleUnsampledIndexesForCombinedRealSections:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[3];
  char v20;
  _QWORD v21[4];
  _QWORD v22[4];

  v4 = a3;
  if (self->_hasSomeSampling)
  {
    -[PULayoutSampledSectioning _cacheSectioningIfNeeded](self, "_cacheSectioningIfNeeded");
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v22[3] = 0x7FFFFFFFFFFFFFFFLL;
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v21[3] = 0x7FFFFFFFFFFFFFFFLL;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v20 = 1;
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v18[3] = 0x7FFFFFFFFFFFFFFFLL;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v17[3] = 0;
    v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __76__PULayoutSampledSectioning_visibleUnsampledIndexesForCombinedRealSections___block_invoke;
    v10[3] = &unk_1E58A1F48;
    v10[4] = self;
    v12 = v22;
    v13 = v21;
    v14 = v19;
    v15 = v18;
    v6 = v5;
    v11 = v6;
    v16 = v17;
    objc_msgSend(v4, "enumerateIndexesUsingBlock:", v10);
    v7 = v11;
    v8 = v6;

    _Block_object_dispose(v17, 8);
    _Block_object_dispose(v18, 8);
    _Block_object_dispose(v19, 8);
    _Block_object_dispose(v21, 8);
    _Block_object_dispose(v22, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("%@ has no sampling and shouldn't be used to provide sub-sampling"), self);
    v8 = 0;
  }

  return v8;
}

- (int64_t)__debugUnsampledIndexForRealIndexPath:(PUSimpleIndexPath)a3
{
  if (self->_supportsSamplingAndSectionGrouping)
    a3.var1 += self->_startIndexInVisualSectionForRealSection[a3.var0];
  return a3.var1;
}

- (BOOL)supportsSamplingAndSectionGrouping
{
  return self->_supportsSamplingAndSectionGrouping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_realSectionIndexesForVisualSection, 0);
}

_QWORD *__76__PULayoutSampledSectioning_visibleUnsampledIndexesForCombinedRealSections___block_invoke(_QWORD *result, unint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;

  v2 = (_QWORD *)result[4];
  v3 = *(_QWORD *)(v2[8] + 8 * a2);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = result;
    v6 = *(_QWORD *)(v2[9] + 8 * a2);
    if (v3 != *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24))
    {
      *(_QWORD *)(*(_QWORD *)(result[7] + 8) + 24) = *(_QWORD *)(v2[10] + 8 * v3);
      result = (_QWORD *)result[4];
      v7 = *(_QWORD *)(result[13] + 8 * v3);
      if (v7 >= 1 && *(_QWORD *)(*(_QWORD *)(v5[7] + 8) + 24) <= v7)
      {
        v8 = 1;
      }
      else
      {
        result = (_QWORD *)objc_msgSend(result, "visualIndexPathForRealIndexPath:isMainItem:", a2, 0, 0);
        v8 = 0;
        *(_QWORD *)(*(_QWORD *)(v5[9] + 8) + 24) = v9;
        *(_QWORD *)(*(_QWORD *)(v5[7] + 8) + 24) = v7;
      }
      *(_BYTE *)(*(_QWORD *)(v5[8] + 8) + 24) = v8;
      *(_QWORD *)(*(_QWORD *)(v5[6] + 8) + 24) = v3;
    }
    if (*(_BYTE *)(*(_QWORD *)(v5[8] + 8) + 24))
    {
      result = (_QWORD *)objc_msgSend((id)v5[5], "addIndexesInRange:", *(_QWORD *)(*(_QWORD *)(v5[10] + 8) + 24), v6);
    }
    else
    {
      while (*(_QWORD *)(*(_QWORD *)(v5[9] + 8) + 24) < *(_QWORD *)(*(_QWORD *)(v5[7] + 8) + 24))
      {
        result = (_QWORD *)objc_msgSend((id)v5[4], "mainRealItemIndexPathForVisualIndexPath:", *(_QWORD *)(*(_QWORD *)(v5[6] + 8) + 24));
        if ((unint64_t)result > a2)
          break;
        if (result == (_QWORD *)a2)
          result = (_QWORD *)objc_msgSend((id)v5[5], "addIndex:", *(_QWORD *)(*(_QWORD *)(v5[10] + 8) + 24) + v10);
        ++*(_QWORD *)(*(_QWORD *)(v5[9] + 8) + 24);
      }
    }
    *(_QWORD *)(*(_QWORD *)(v5[10] + 8) + 24) += v6;
  }
  return result;
}

uint64_t __106__PULayoutSampledSectioning_enumerateRealMainItemIndexPathsForVisualSection_inVisualItemRange_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) <= a3)
  {
    do
    {
      ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
      v5 = *(_QWORD **)(a1 + 32);
      v6 = v5[15];
      if (v6 >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      {
        do
        {
          while (1)
          {
            ++v5[17];
            v7 = objc_msgSend(*(id *)(a1 + 40), "rangeAtIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
            if (v8)
              break;
            v5 = *(_QWORD **)(a1 + 32);
          }
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v7 + v8;
          v5 = *(_QWORD **)(a1 + 32);
          v9 = 8 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) - 8;
        }
        while (*(_QWORD *)(v5[9] + v9) + *(_QWORD *)(v5[11] + v9) <= a3);
        v5[15] = v7;
        v5 = *(_QWORD **)(a1 + 32);
        v6 = v5[15];
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(_QWORD *)(v5[11] + 8 * v6);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72)
                                                                              + 8
                                                                              * *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120))
                                                                  + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                              + 24);
    }
    while (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) <= a3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) = a3
                                                              - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                          + 24);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

_QWORD *__90__PULayoutSampledSectioning__mainRealItemIndexPathForVisualSection_andUnsampledItemIndex___block_invoke(_QWORD *result, unint64_t a2, uint64_t a3, _BYTE *a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = (_QWORD *)result[4];
  v5 = v4[17];
  if (v5 < result[7]
    || (v6 = a2 + a3, v7 = result[8], (uint64_t)(a2 + a3) <= (uint64_t)v7)
    || (v8 = v4[11], v9 = v4[9], v10 = result[9], v10 >= *(_QWORD *)(v9 + 8 * v6 - 8) + *(_QWORD *)(v8 + 8 * v6 - 8)))
  {
    if (!*a4)
      v4[17] = v5 + 1;
  }
  else
  {
    if (v7 <= a2)
      v11 = a2;
    else
      v11 = result[8];
    if (v11 < v6)
    {
      while (1)
      {
        v12 = *(_QWORD *)(v8 + 8 * v11);
        if (v10 < *(_QWORD *)(v9 + 8 * v11) + v12)
          break;
        if (v6 == ++v11)
          goto LABEL_14;
      }
      *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = v11;
      *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) = result[9] - v12;
    }
LABEL_14:
    *a4 = 1;
  }
  return result;
}

uint64_t __53__PULayoutSampledSectioning__cacheSectioningIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;

  result = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2);
  if ((_DWORD)result)
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (!v5)
    {
      v6 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    }
    objc_msgSend(v5, "removeIndex:", a2);
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    if (!v9)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    }
    return objc_msgSend(v9, "addIndex:", a2);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 64) + 8 * a2) = *(_QWORD *)(a1 + 80);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 88) + 8 * a2) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                               + 24);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) += *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 72)
                                                                             + 8 * a2);
  }
  return result;
}

uint64_t __53__PULayoutSampledSectioning__cacheSectioningIfNeeded__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 64) + 8 * a2) = 0x7FFFFFFFFFFFFFFFLL;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 88) + 8 * a2) = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

@end
