@implementation _UIDataSourceBatchUpdateMapHelper

- (id)initWithInitialSnapshot:(void *)a3 finalSnapshot:(void *)a4 updates:(int)a5 assertingForInvalidUpdates:
{
  id *v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  unint64_t v34;
  NSObject *v35;
  id *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  objc_super v55;
  id v56;
  void *v57[6];
  _QWORD v58[3];
  _QWORD v59[3];
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  _QWORD aBlock[4];
  id v69;
  uint8_t buf[16];
  __int128 v71;
  __int128 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v51 = a2;
  v52 = a3;
  v53 = a4;
  if (a1)
  {
    v55.receiver = a1;
    v55.super_class = (Class)_UIDataSourceBatchUpdateMapHelper;
    v9 = (id *)objc_msgSendSuper2(&v55, sel_init);
    a1 = v9;
    if (!v9)
      goto LABEL_26;
    objc_storeStrong(v9 + 1, a2);
    objc_storeStrong(a1 + 2, a3);
    objc_storeStrong(a1 + 3, a4);
    v10 = a1[1];
    v11 = objc_msgSend(v10, "numberOfSections");
    v12 = v11;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (!HIDWORD(v11))
      {
LABEL_6:
        v13 = objc_msgSend(v10, "numberOfItems");
        v14 = v13;
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (!HIDWORD(v13))
          {
LABEL_9:
            v15 = MEMORY[0x1E0C809B0];
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __83___UIDataSourceBatchUpdateMapHelper__generateUpdateMapsAssertingForInvalidUpdates___block_invoke;
            aBlock[3] = &unk_1E16BE1B8;
            v16 = v10;
            v69 = v16;
            v50 = _Block_copy(aBlock);
            v66[0] = v15;
            v66[1] = 3221225472;
            v66[2] = __83___UIDataSourceBatchUpdateMapHelper__generateUpdateMapsAssertingForInvalidUpdates___block_invoke_2;
            v66[3] = &unk_1E16BE1B8;
            v46 = v16;
            v67 = v46;
            v48 = _Block_copy(v66);
            v17 = a1[2];
            v18 = objc_msgSend(v17, "numberOfSections");
            v19 = v18;
            if (v18 != 0x7FFFFFFFFFFFFFFFLL)
            {
              if (!HIDWORD(v18))
              {
LABEL_12:
                v20 = objc_msgSend(v17, "numberOfItems");
                v21 = v20;
                if (v20 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  if (!HIDWORD(v20))
                  {
                    v22 = v20 << 32;
LABEL_16:
                    v64[0] = v15;
                    v64[1] = 3221225472;
                    v64[2] = __83___UIDataSourceBatchUpdateMapHelper__generateUpdateMapsAssertingForInvalidUpdates___block_invoke_3;
                    v64[3] = &unk_1E16BE1B8;
                    v23 = v17;
                    v65 = v23;
                    v49 = _Block_copy(v64);
                    v62[0] = v15;
                    v62[1] = 3221225472;
                    v62[2] = __83___UIDataSourceBatchUpdateMapHelper__generateUpdateMapsAssertingForInvalidUpdates___block_invoke_4;
                    v62[3] = &unk_1E16BE1B8;
                    v47 = v23;
                    v63 = v47;
                    v24 = _Block_copy(v62);
                    v25 = a1[3];
                    v60[0] = v15;
                    v60[1] = 3221225472;
                    v60[2] = __83___UIDataSourceBatchUpdateMapHelper__generateUpdateMapsAssertingForInvalidUpdates___block_invoke_5;
                    v60[3] = &unk_1E16BE1E0;
                    v26 = v25;
                    v61 = v26;
                    v27 = _Block_copy(v60);
                    v59[0] = v12 | (v14 << 32);
                    v59[1] = _Block_copy(v50);
                    v59[2] = _Block_copy(v48);
                    v58[0] = v22 | v19;
                    v58[1] = _Block_copy(v49);
                    v58[2] = _Block_copy(v24);
                    v28 = objc_msgSend(v26, "count");
                    __copy_constructor_8_8_sb0_sb8_sb16_sb24_sb32_sb40(v57, (const void **)&_UIDataSourceUpdateProcessingCallbacksNULL);
                    v56 = 0;
                    _UIDataSourceGenerateUpdateMaps((unsigned int *)v59, (unsigned int *)v58, v28, (uint64_t)v27, (uint64_t)v57, &v56, (uint64_t)buf);
                    v29 = v56;
                    v30 = v73;
                    v32 = v71;
                    v31 = v72;
                    *((_OWORD *)a1 + 2) = *(_OWORD *)buf;
                    *((_OWORD *)a1 + 3) = v32;
                    *((_OWORD *)a1 + 4) = v31;
                    a1[10] = v30;
                    if (*((_BYTE *)a1 + 80))
                    {
                      if (a5)
                      {
                        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                        v33 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", sel__generateUpdateMapsAssertingForInvalidUpdates_, a1, CFSTR("_UIDataSourceBatchUpdateMapHelper.m"), 82, CFSTR("%@"), v29);

                      }
                      else
                      {
                        v34 = _generateUpdateMapsAssertingForInvalidUpdates____s_category;
                        if (!_generateUpdateMapsAssertingForInvalidUpdates____s_category)
                        {
                          v34 = __UILogCategoryGetNode("UICollectionView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                          atomic_store(v34, (unint64_t *)&_generateUpdateMapsAssertingForInvalidUpdates____s_category);
                        }
                        v35 = *(NSObject **)(v34 + 8);
                        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412290;
                          *(_QWORD *)&buf[4] = v29;
                          _os_log_impl(&dword_185066000, v35, OS_LOG_TYPE_ERROR, "Failed to generate data source update maps: %@", buf, 0xCu);
                        }
                      }
                    }

                    if ((a5 & 1) == 0 && *((_BYTE *)a1 + 80))
                      goto LABEL_25;
LABEL_26:
                    a1 = a1;
                    v36 = a1;
                    goto LABEL_27;
                  }
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("_UIDataSourceBatchUpdateMap.h"), 28, CFSTR("NSInteger index is negative or too large: %ld"), v21);

                }
                v22 = 0xFFFFFFFF00000000;
                goto LABEL_16;
              }
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, CFSTR("_UIDataSourceBatchUpdateMap.h"), 28, CFSTR("NSInteger index is negative or too large: %ld"), v19, v46);

            }
            v19 = 0xFFFFFFFFLL;
            goto LABEL_12;
          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v41, CFSTR("_UIDataSourceBatchUpdateMap.h"), 28, CFSTR("NSInteger index is negative or too large: %ld"), v14);

        }
        v14 = 0xFFFFFFFFLL;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, CFSTR("_UIDataSourceBatchUpdateMap.h"), 28, CFSTR("NSInteger index is negative or too large: %ld"), v12);

    }
    v12 = 0xFFFFFFFFLL;
    goto LABEL_6;
  }
LABEL_25:
  v36 = 0;
LABEL_27:

  return v36;
}

- (uint64_t)initialGlobalIndexForFinalGlobalIndex:(uint64_t)result
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (result)
  {
    v3 = *(unsigned int *)(result + 44);
    v4 = *(_QWORD *)(result + 72);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _UIUpdateMapOldGlobalItemForNewGlobalItem(const _UIDataSourceUpdateMaps, const NSInteger)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_UIDataSourceBatchUpdateMap.h"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateMaps.newGlobalItemMap != NULL"));

    }
    if (a2 > 0x7FFFFFFFFFFFFFFELL)
      return 0x7FFFFFFFFFFFFFFFLL;
    if (v3 <= a2)
      return 0x7FFFFFFFFFFFFFFFLL;
    result = *(unsigned int *)(v4 + 4 * a2);
    if ((_DWORD)result == -1)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (uint64_t)finalGlobalIndexForInitialGlobalIndex:(uint64_t)result
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (result)
  {
    v3 = *(unsigned int *)(result + 40);
    v4 = *(_QWORD *)(result + 64);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _UIUpdateMapNewGlobalItemForOldGlobalItem(const _UIDataSourceUpdateMaps, const NSInteger)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_UIDataSourceBatchUpdateMap.h"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateMaps.oldGlobalItemMap != NULL"));

    }
    if (a2 > 0x7FFFFFFFFFFFFFFELL)
      return 0x7FFFFFFFFFFFFFFFLL;
    if (v3 <= a2)
      return 0x7FFFFFFFFFFFFFFFLL;
    result = *(unsigned int *)(v4 + 4 * a2);
    if ((_DWORD)result == -1)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (id)initialIndexPathForFinalIndexPath:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    if (objc_msgSend(v3, "section") == 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v4, "item") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = v4;
LABEL_9:
      v5 = v6;
      goto LABEL_10;
    }
    v7 = -[_UIDataSourceBatchUpdateMapHelper initialGlobalIndexForFinalGlobalIndex:](a1, objc_msgSend(*(id *)(a1 + 16), "globalIndexForIndexPath:", v4));
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 8), "indexPathForGlobalIndex:", v7);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v5 = 0;
  }
LABEL_10:

  return v5;
}

- (id)finalIndexPathForInitialIndexPath:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    if (objc_msgSend(v3, "section") == 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v4, "item") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = v4;
LABEL_9:
      v5 = v6;
      goto LABEL_10;
    }
    v7 = -[_UIDataSourceBatchUpdateMapHelper finalGlobalIndexForInitialGlobalIndex:](a1, objc_msgSend(*(id *)(a1 + 8), "globalIndexForIndexPath:", v4));
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 16), "indexPathForGlobalIndex:", v7);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v5 = 0;
  }
LABEL_10:

  return v5;
}

- (uint64_t)initialSectionIndexForFinalSectionIndex:(uint64_t)result
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (result)
  {
    v3 = *(unsigned int *)(result + 36);
    v4 = *(_QWORD *)(result + 56);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _UIUpdateMapOldSectionForNewSection(const _UIDataSourceUpdateMaps, const NSInteger)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_UIDataSourceBatchUpdateMap.h"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateMaps.newSectionMap != NULL"));

    }
    if (a2 > 0x7FFFFFFFFFFFFFFELL)
      return 0x7FFFFFFFFFFFFFFFLL;
    if (v3 <= a2)
      return 0x7FFFFFFFFFFFFFFFLL;
    result = *(unsigned int *)(v4 + 4 * a2);
    if ((_DWORD)result == -1)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (uint64_t)finalSectionIndexForInitialSectionIndex:(uint64_t)result
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (result)
  {
    v3 = *(unsigned int *)(result + 32);
    v4 = *(_QWORD *)(result + 48);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _UIUpdateMapNewSectionForOldSection(const _UIDataSourceUpdateMaps, const NSInteger)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_UIDataSourceBatchUpdateMap.h"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateMaps.oldSectionMap != NULL"));

    }
    if (a2 > 0x7FFFFFFFFFFFFFFELL)
      return 0x7FFFFFFFFFFFFFFFLL;
    if (v3 <= a2)
      return 0x7FFFFFFFFFFFFFFFLL;
    result = *(unsigned int *)(v4 + 4 * a2);
    if ((_DWORD)result == -1)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  _UIDataSourceDestroyUpdateMaps((uint64_t)&self->_updateMaps);
  v3.receiver = self;
  v3.super_class = (Class)_UIDataSourceBatchUpdateMapHelper;
  -[_UIDataSourceBatchUpdateMapHelper dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ - %p: initialSnapshot = %@;  finalSnapshot= %@; items = %@]"),
    v5,
    self,
    self->_initialSnapshot,
    self->_finalSnapshot,
    self->_updateItems);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateItems, 0);
  objc_storeStrong((id *)&self->_finalSnapshot, 0);
  objc_storeStrong((id *)&self->_initialSnapshot, 0);
}

@end
