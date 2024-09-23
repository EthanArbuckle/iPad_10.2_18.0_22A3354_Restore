@implementation PKSectionTableViewController

- (PKSectionTableViewController)initWithCoder:(id)a3
{

  return 0;
}

- (PKSectionTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (PKSectionTableViewController)initWithStyle:(int64_t)a3
{

  return 0;
}

- (PKSectionTableViewController)initWithStyle:(int64_t)a3 numberOfSections:(unint64_t)a4
{
  PKSectionTableViewController *v5;
  $6F2B8B26837F253BF5B851010109DEAE *p_currentMap;
  unint64_t *sectionToIndex;
  unint64_t **p_sectionToIndex;
  unint64_t *indexToSection;
  BOOL v10;
  size_t numberOfSections;
  unint64_t *v13;
  objc_super v14;

  if (a4)
  {
    v14.receiver = self;
    v14.super_class = (Class)PKSectionTableViewController;
    self = -[PKSectionTableViewController initWithStyle:](&v14, sel_initWithStyle_, a3);
    v5 = self;
    if (self)
    {
      self->_numberOfSections = a4;
      if (a4 - 0x2000000000000000 >= 0xE000000000000001)
      {
        p_currentMap = &self->_currentMap;
        self->_currentMap.indexToSection = (unint64_t *)malloc_type_malloc(8 * a4, 0xD379425CuLL);
        sectionToIndex = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0xFA4E25ECuLL);
        v5->_currentMap.sectionToIndex = sectionToIndex;
        p_sectionToIndex = &v5->_currentMap.sectionToIndex;
        indexToSection = v5->_currentMap.indexToSection;
        if (indexToSection)
          v10 = sectionToIndex == 0;
        else
          v10 = 1;
        if (v10)
        {
          if (indexToSection)
          {
            free(p_currentMap->indexToSection);
            v5->_currentMap.indexToSection = 0;
            sectionToIndex = v5->_currentMap.sectionToIndex;
          }
        }
        else
        {
          memset(v5->_currentMap.indexToSection, 255, 8 * a4);
          numberOfSections = v5->_numberOfSections;
          if (numberOfSections - 0x2000000000000000 < 0xE000000000000001)
            goto LABEL_15;
          v5->_bufferedMap.indexToSection = (unint64_t *)malloc_type_malloc(8 * numberOfSections, 0xD379425CuLL);
          sectionToIndex = (unint64_t *)malloc_type_calloc(numberOfSections, 8uLL, 0xFA4E25ECuLL);
          v5->_bufferedMap.sectionToIndex = sectionToIndex;
          p_sectionToIndex = &v5->_bufferedMap.sectionToIndex;
          v13 = v5->_bufferedMap.indexToSection;
          if (v13 && sectionToIndex)
          {
            memset(v5->_bufferedMap.indexToSection, 255, 8 * numberOfSections);
            goto LABEL_16;
          }
          if (v13)
          {
            free(v5->_bufferedMap.indexToSection);
            v5->_bufferedMap.indexToSection = 0;
            sectionToIndex = v5->_bufferedMap.sectionToIndex;
          }
        }
        if (sectionToIndex)
        {
          free(sectionToIndex);
          *p_sectionToIndex = 0;
        }
      }
LABEL_15:

      v5 = 0;
LABEL_16:
      self = v5;
      v5 = self;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  $6F2B8B26837F253BF5B851010109DEAE *p_currentMap;
  unint64_t *indexToSection;
  unint64_t *sectionToIndex;
  unint64_t *v6;
  unint64_t *v7;
  objc_super v8;

  p_currentMap = &self->_currentMap;
  indexToSection = self->_currentMap.indexToSection;
  if (indexToSection)
  {
    free(indexToSection);
    p_currentMap->indexToSection = 0;
  }
  sectionToIndex = p_currentMap->sectionToIndex;
  if (sectionToIndex)
  {
    free(sectionToIndex);
    p_currentMap->sectionToIndex = 0;
  }
  v6 = self->_bufferedMap.indexToSection;
  if (v6)
  {
    free(v6);
    self->_bufferedMap.indexToSection = 0;
  }
  v7 = self->_bufferedMap.sectionToIndex;
  if (v7)
  {
    free(v7);
    self->_bufferedMap.sectionToIndex = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)PKSectionTableViewController;
  -[PKSectionTableViewController dealloc](&v8, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKSectionTableViewController;
  -[PKSectionTableViewController viewDidLoad](&v4, sel_viewDidLoad);
  if (!self->_skipSetupForReadableContentGuide)
  {
    -[PKSectionTableViewController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pkui_setupForReadableContentGuide");

  }
  -[PKSectionTableViewController _recomputeMappedSections](self, "_recomputeMappedSections");
  -[PKSectionTableViewController _swapBuffers](self, "_swapBuffers");
}

- (BOOL)recomputeMappedSectionsAndReloadSections:(id)a3
{
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  unint64_t v11;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *context;
  BOOL v20;
  id v21;

  v21 = a3;
  if (-[PKSectionTableViewController isViewLoaded](self, "isViewLoaded"))
  {
    v20 = -[PKSectionTableViewController _recomputeMappedSections](self, "_recomputeMappedSections");
    -[PKSectionTableViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    context = (void *)MEMORY[0x1A1AE621C](objc_msgSend(v4, "beginUpdates"));
    if (self->_numberOfSections)
    {
      v5 = 0;
      v6 = 0;
      v7 = 0;
      do
      {
        v8 = self->_currentMap.sectionToIndex[v5];
        v9 = self->_currentMap.indexToSection[v8];
        v10 = v5 != v9;
        v11 = self->_bufferedMap.indexToSection[self->_bufferedMap.sectionToIndex[v5]];
        if (v5 != v9 || v5 == v11)
        {
          if (v5 != v9 && v5 == v11)
          {
            objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v7 - v6 + v8);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "insertSections:withRowAnimation:", v16, -[PKSectionTableViewController rowAnimationForInsertingSection:](self, "rowAnimationForInsertingSection:", v5));

            ++v7;
          }
          else
          {
            if (v5 != v11)
              v10 = 1;
            if (!v10 && objc_msgSend(v21, "containsIndex:", v5))
            {
              objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", self->_currentMap.sectionToIndex[v5]);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "reloadSections:withRowAnimation:", v14, -[PKSectionTableViewController rowAnimationForReloadingSection:](self, "rowAnimationForReloadingSection:", v5));

            }
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "deleteSections:withRowAnimation:", v15, -[PKSectionTableViewController rowAnimationForDeletingSection:](self, "rowAnimationForDeletingSection:", v5));

          ++v6;
        }
        ++v5;
      }
      while (v5 < self->_numberOfSections);
    }
    objc_autoreleasePoolPop(context);
    -[PKSectionTableViewController _swapBuffers](self, "_swapBuffers");
    objc_msgSend(v4, "endUpdates");

    v17 = v20;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)reloadData
{
  int v3;
  BOOL v4;
  void *v5;

  v3 = -[PKSectionTableViewController isViewLoaded](self, "isViewLoaded");
  if (v3)
  {
    v4 = -[PKSectionTableViewController _recomputeMappedSections](self, "_recomputeMappedSections");
    -[PKSectionTableViewController _swapBuffers](self, "_swapBuffers");
    -[PKSectionTableViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEditing:animated:", 0, 0);
    objc_msgSend(v5, "reloadData");

    LOBYTE(v3) = v4;
  }
  return v3;
}

- (void)reloadSections:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PKSectionTableViewController *v10;
  id v11;
  uint64_t v12;

  v7 = a3;
  if (objc_msgSend(v7, "count") && -[PKSectionTableViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PKSectionTableViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "numberOfSections");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__PKSectionTableViewController_reloadSections___block_invoke;
    v8[3] = &unk_1E3E664B0;
    v9 = v7;
    v10 = self;
    v11 = v4;
    v12 = v5;
    v6 = v4;
    objc_msgSend(v6, "performBatchUpdates:completion:", v8, 0);

  }
}

void __47__PKSectionTableViewController_reloadSections___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  unint64_t v21;
  __int16 v22;
  unint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v17;
    *(_QWORD *)&v4 = 134218240;
    v15 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v2);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v7), "unsignedIntegerValue", v15, (_QWORD)v16);
        v9 = *(_QWORD **)(a1 + 40);
        v10 = *(_QWORD *)(v9[130] + 8 * v8);
        if (*(_QWORD *)(v9[129] + 8 * v10) == v8)
        {
          v11 = *(_QWORD *)(a1 + 56);
          if (v10 >= v11)
          {
            PKLogFacilityTypeGetObject();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v15;
              v21 = v10;
              v22 = 2048;
              v23 = v11;
              _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Asked to reload a sectionIndex (%lu) greater than the table views current number of sections (%li).", buf, 0x16u);
            }
          }
          else
          {
            v12 = objc_msgSend(v9, "rowAnimationForReloadingSection:");
            v13 = *(void **)(a1 + 48);
            objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v10);
            v14 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "reloadSections:withRowAnimation:", v14, v12);
          }

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v5);
  }

}

- (void)reloadSection:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  int v11;
  unint64_t v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[PKSectionTableViewController isViewLoaded](self, "isViewLoaded")
    && self->_currentMap.indexToSection[self->_currentMap.sectionToIndex[a3]] == a3)
  {
    -[PKSectionTableViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = self->_currentMap.sectionToIndex[a3];
    v7 = objc_msgSend(v5, "numberOfSections");
    if (v6 >= v7)
    {
      v9 = v7;
      PKLogFacilityTypeGetObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 134218240;
        v12 = v6;
        v13 = 2048;
        v14 = v9;
        _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Asked to reload a sectionIndex (%lu) greater than the table views current number of sections (%li).", (uint8_t *)&v11, 0x16u);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reloadSections:withRowAnimation:", v8, -[PKSectionTableViewController rowAnimationForReloadingSection:](self, "rowAnimationForReloadingSection:", a3));

    }
  }
}

- (void)reloadRow:(int64_t)a3 inSection:(unint64_t)a4
{
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSectionTableViewController reloadRows:inSection:](self, "reloadRows:inSection:", v7, a4);

}

- (void)reloadRows:(id)a3 inSection:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  unint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  unint64_t v24;
  __int16 v25;
  unint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[PKSectionTableViewController isViewLoaded](self, "isViewLoaded")
    && self->_currentMap.indexToSection[self->_currentMap.sectionToIndex[a4]] == a4)
  {
    -[PKSectionTableViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_currentMap.sectionToIndex[a4];
    v9 = objc_msgSend(v7, "numberOfSections");
    if (v8 >= v9)
    {
      v17 = v9;
      PKLogFacilityTypeGetObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v24 = v8;
        v25 = 2048;
        v26 = v17;
        _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Asked to reload rows in a section with a sectionIndex (%lu) greater than the table views current number of sections (%li).", buf, 0x16u);
      }
    }
    else
    {
      v18 = v7;
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v11 = v6;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v20 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "integerValue", v18), v8);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addObject:](v10, "addObject:", v16);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        }
        while (v13);
      }

      v7 = v18;
      objc_msgSend(v18, "reloadRowsAtIndexPaths:withRowAnimation:", v10, -[PKSectionTableViewController rowAnimationForReloadingSection:](self, "rowAnimationForReloadingSection:", a4));
    }

  }
}

- (void)updateSectionVisibilityAndReloadIfNecessaryForSection:(unint64_t)a3
{
  unint64_t v5;

  v5 = self->_currentMap.indexToSection[self->_currentMap.sectionToIndex[a3]];
  if ((v5 == a3) == -[PKSectionTableViewController shouldMapSection:](self, "shouldMapSection:"))
  {
    if (v5 == a3)
      -[PKSectionTableViewController reloadSection:](self, "reloadSection:", a3);
  }
  else
  {
    -[PKSectionTableViewController recomputeMappedSectionsAndReloadSections:](self, "recomputeMappedSectionsAndReloadSections:", 0);
  }
}

- (void)updateSectionVisibilityAndReloadIfNecessaryForSections:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PKSectionTableViewController *v9;

  v4 = a3;
  -[PKSectionTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__PKSectionTableViewController_updateSectionVisibilityAndReloadIfNecessaryForSections___block_invoke;
  v7[3] = &unk_1E3E61388;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "performBatchUpdates:completion:", v7, 0);

}

void __87__PKSectionTableViewController_updateSectionVisibilityAndReloadIfNecessaryForSections___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  int v14;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v22 = a1;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = v2;
    v7 = 0;
    v8 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "unsignedIntegerValue");
        v12 = *(_QWORD **)(v22 + 40);
        v13 = *(_QWORD *)(v12[129] + 8 * *(_QWORD *)(v12[130] + 8 * v11));
        v14 = objc_msgSend(v12, "shouldMapSection:", v11);
        if (v13 != v11 || v14 == 0)
          v7 |= (v13 == v11) ^ v14;
        else
          objc_msgSend(v6, "addObject:", v10);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v5);

    v2 = v6;
    if ((v7 & 1) != 0)
    {
      v16 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v17 = v2;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v24;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v24 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(v16, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "unsignedIntegerValue"));
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        }
        while (v19);
      }

      objc_msgSend(*(id *)(v22 + 40), "recomputeMappedSectionsAndReloadSections:", v16);
      goto LABEL_26;
    }
  }
  else
  {

  }
  if (objc_msgSend(v2, "count"))
    objc_msgSend(*(id *)(v22 + 40), "reloadSections:", v2);
LABEL_26:

}

- (void)updateSectionVisibilityAndReloadIfNecessaryForAllSections
{
  unint64_t v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self->_numberOfSections)
  {
    v3 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v4);

      ++v3;
    }
    while (v3 < self->_numberOfSections);
  }
  -[PKSectionTableViewController updateSectionVisibilityAndReloadIfNecessaryForSections:](self, "updateSectionVisibilityAndReloadIfNecessaryForSections:", v5);

}

- (BOOL)isSectionMapped:(unint64_t)a3
{
  return self->_currentMap.indexToSection[self->_currentMap.sectionToIndex[a3]] == a3;
}

- (unint64_t)indexForSection:(unint64_t)a3
{
  return self->_currentMap.sectionToIndex[a3];
}

- (unint64_t)sectionForIndex:(unint64_t)a3
{
  return self->_currentMap.indexToSection[a3];
}

- (unint64_t)numberOfMappedSections
{
  return self->_currentMap.numberOfSections;
}

- (BOOL)isMappingValid
{
  unint64_t numberOfSections;
  unint64_t *indexToSection;
  unint64_t *sectionToIndex;
  unint64_t v6;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v13;

  numberOfSections = self->_numberOfSections;
  if (!numberOfSections)
    return 1;
  indexToSection = self->_currentMap.indexToSection;
  if (*indexToSection >= numberOfSections && *indexToSection != -1)
    return 0;
  sectionToIndex = self->_currentMap.sectionToIndex;
  v6 = self->_currentMap.numberOfSections;
  if (*sectionToIndex >= numberOfSections || *sectionToIndex > v6)
    return 0;
  v9 = 1;
  do
  {
    v10 = v9;
    if (numberOfSections == v9)
      break;
    v11 = indexToSection[v9];
    if (v11 >= numberOfSections && v11 != -1)
      break;
    v13 = sectionToIndex[v10];
    v9 = v10 + 1;
  }
  while (v13 < numberOfSections && v13 <= v6);
  return v10 >= numberOfSections;
}

- (void)_swapBuffers
{
  unint64_t *sectionToIndex;
  __int128 v3;
  unint64_t *v4;

  sectionToIndex = self->_currentMap.sectionToIndex;
  v3 = *(_OWORD *)&self->_currentMap.numberOfSections;
  v4 = self->_bufferedMap.sectionToIndex;
  *(_OWORD *)&self->_currentMap.numberOfSections = *(_OWORD *)&self->_bufferedMap.numberOfSections;
  self->_currentMap.sectionToIndex = v4;
  *(_OWORD *)&self->_bufferedMap.numberOfSections = v3;
  self->_bufferedMap.sectionToIndex = sectionToIndex;
}

- (BOOL)_recomputeMappedSections
{
  unint64_t v3;
  unint64_t v4;
  _BOOL4 v5;
  unint64_t numberOfSections;
  unint64_t *i;

  if (self->_numberOfSections)
  {
    v3 = 0;
    v4 = 0;
    do
    {
      v5 = -[PKSectionTableViewController shouldMapSection:](self, "shouldMapSection:", v4);
      self->_bufferedMap.sectionToIndex[v4] = v3;
      if (v5)
        self->_bufferedMap.indexToSection[v3++] = v4;
      ++v4;
    }
    while (v4 < self->_numberOfSections);
  }
  else
  {
    v3 = 0;
  }
  self->_bufferedMap.numberOfSections = v3;
  numberOfSections = self->_numberOfSections;
  for (i = self->_bufferedMap.indexToSection; v3 < numberOfSections; numberOfSections = self->_numberOfSections)
    i[v3++] = -1;
  return memcmp(self->_currentMap.indexToSection, i, 8 * numberOfSections) != 0;
}

- (int64_t)rowAnimationForInsertingSection:(unint64_t)a3
{
  return 0;
}

- (int64_t)rowAnimationForReloadingSection:(unint64_t)a3
{
  return 0;
}

- (int64_t)rowAnimationForDeletingSection:(unint64_t)a3
{
  return 0;
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return self->_currentMap.numberOfSections;
}

- (BOOL)skipSetupForReadableContentGuide
{
  return self->_skipSetupForReadableContentGuide;
}

- (void)setSkipSetupForReadableContentGuide:(BOOL)a3
{
  self->_skipSetupForReadableContentGuide = a3;
}

@end
