@implementation _UIDiffableDataSourceViewUpdater

- (void)_performViewUpdates:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  SEL v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  _UIDiffableDataSourceViewUpdater *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceViewUpdater.m"), 349, CFSTR("Error: Updates can only be committed on the main thread."));

  }
  -[_UIDiffableDataSourceViewUpdater collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDiffableDataSourceViewUpdater tableView](self, "tableView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v7 = v5;
  v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (!v8)
  {

    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v11 = 0;
    v10 = 0;
    v30 = v42;
    goto LABEL_63;
  }
  v9 = v7;
  v38 = a2;
  v39 = v6;
  v40 = 0;
  v41 = 0;
  v10 = 0;
  v11 = 0;
  v44 = 0;
  v45 = 0;
  v46 = 0;
  v12 = *(_QWORD *)v48;
  v43 = self;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v48 != v12)
        objc_enumerationMutation(v9);
      v14 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
      if (v14)
      {
        switch(*(_QWORD *)(v14 + 80))
        {
          case 0:
            if (*(_QWORD *)(v14 + 48) != 0x7FFFFFFFFFFFFFFFLL)
              break;
            v15 = (void *)v44;
            if (v44)
            {
              v16 = *(_QWORD *)(v14 + 24);
              goto LABEL_21;
            }
            v44 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndex:", *(_QWORD *)(v14 + 24));
            continue;
          case 1:
            if (*(_QWORD *)(v14 + 48) != 0x7FFFFFFFFFFFFFFFLL)
            {
              if (v10)
              {
                objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i), "indexPathBeforeUpdate");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = v10;
                goto LABEL_31;
              }
              v26 = objc_alloc(MEMORY[0x1E0C99DE8]);
              objc_msgSend((id)v14, "indexPathBeforeUpdate");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = (void *)objc_msgSend(v26, "initWithObjects:", v17, 0);
              goto LABEL_40;
            }
            v15 = (void *)v45;
            if (v45)
              goto LABEL_20;
            v45 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndex:", *(_QWORD *)(v14 + 8));
            continue;
          case 2:
            if (*(_QWORD *)(v14 + 48) == 0x7FFFFFFFFFFFFFFFLL)
            {
              if (*(_QWORD *)(v14 + 8) == 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", v38, self, CFSTR("_UIDiffableDataSourceViewUpdater.m"), 400, CFSTR("Cannot reload a section with NSNotFound index"));

              }
              v15 = (void *)v46;
              if (v46)
              {
LABEL_20:
                v16 = *(_QWORD *)(v14 + 8);
LABEL_21:
                objc_msgSend(v15, "addIndex:", v16);
              }
              else
              {
                v46 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndex:", *(_QWORD *)(v14 + 8));
              }
              continue;
            }
            v19 = v11;
            v20 = v10;
            if ((*(_BYTE *)(v14 + 56) & 2) != 0)
            {
              v21 = (void *)v40;
              if (!v40)
              {
                v27 = objc_alloc(MEMORY[0x1E0C99DE8]);
                objc_msgSend((id)v14, "indexPathBeforeUpdate");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = v27;
                v6 = v39;
                v40 = objc_msgSend(v28, "initWithObjects:", v23, 0);
                goto LABEL_42;
              }
            }
            else
            {
              v21 = (void *)v41;
              if (!v41)
              {
                v22 = objc_alloc(MEMORY[0x1E0C99DE8]);
                objc_msgSend((id)v14, "indexPathBeforeUpdate");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = v22;
                v6 = v39;
                v41 = objc_msgSend(v24, "initWithObjects:", v23, 0);
LABEL_42:

                v10 = v20;
                v11 = v19;
                self = v43;
                continue;
              }
            }
            objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i), "indexPathBeforeUpdate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v23);
            goto LABEL_42;
          case 3:
            if (v6)
            {
              -[_UIDiffableDataSourceViewUpdater _performMoveUpdate:onCollectionView:](self, "_performMoveUpdate:onCollectionView:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i), v6);
            }
            else if (v42)
            {
              -[_UIDiffableDataSourceViewUpdater _performMoveUpdate:onTableView:](self, "_performMoveUpdate:onTableView:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i));
            }
            continue;
          default:
            continue;
        }
      }
      if (v11)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i), "indexPathAfterUpdate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v11;
LABEL_31:
        objc_msgSend(v18, "addObject:", v17);
      }
      else
      {
        v25 = objc_alloc(MEMORY[0x1E0C99DE8]);
        objc_msgSend((id)v14, "indexPathAfterUpdate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v25, "initWithObjects:", v17, 0);
      }
LABEL_40:

    }
    v8 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  }
  while (v8);
  v7 = v9;

  if (v6)
  {
    if (v46)
      objc_msgSend(v6, "reloadSections:");
    if (v45)
      objc_msgSend(v6, "deleteSections:");
    if (v44)
      objc_msgSend(v6, "insertSections:");
    if (v40)
      objc_msgSend(v6, "reconfigureItemsAtIndexPaths:");
    if (v41)
      objc_msgSend(v6, "reloadItemsAtIndexPaths:");
    if (v10)
      objc_msgSend(v6, "deleteItemsAtIndexPaths:", v10);
    if (v11)
      objc_msgSend(v6, "insertItemsAtIndexPaths:", v11);
    goto LABEL_60;
  }
  v8 = (void *)v41;
  v30 = v42;
  v35 = v46;
  v34 = (void *)v40;
  if (v42)
  {
    if (v46)
    {
      -[_UIDiffableDataSourceViewUpdater _sectionIndexesToReloadForTableViewCompatibility:](v43, "_sectionIndexesToReloadForTableViewCompatibility:", v46);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "reloadSections:withRowAnimation:", v36, -[_UIDiffableDataSourceViewUpdater tableViewRowAnimation](v43, "tableViewRowAnimation"));

      v34 = (void *)v40;
      v8 = (void *)v41;
    }
    if (v45)
    {
      objc_msgSend(v42, "deleteSections:withRowAnimation:", v45, -[_UIDiffableDataSourceViewUpdater tableViewRowAnimation](v43, "tableViewRowAnimation", v35));
      v34 = (void *)v40;
      v8 = (void *)v41;
    }
    if (v44)
    {
      objc_msgSend(v42, "insertSections:withRowAnimation:", v44, -[_UIDiffableDataSourceViewUpdater tableViewRowAnimation](v43, "tableViewRowAnimation", v35));
      v34 = (void *)v40;
      v8 = (void *)v41;
    }
    if (v34)
    {
      objc_msgSend(v42, "reconfigureRowsAtIndexPaths:", v34);
      v8 = (void *)v41;
    }
    if (v8)
      objc_msgSend(v42, "reloadRowsAtIndexPaths:withRowAnimation:", v8, -[_UIDiffableDataSourceViewUpdater tableViewRowAnimation](v43, "tableViewRowAnimation", v35));
    if (v10)
      objc_msgSend(v42, "deleteRowsAtIndexPaths:withRowAnimation:", v10, -[_UIDiffableDataSourceViewUpdater tableViewRowAnimation](v43, "tableViewRowAnimation", v35));
    if (v11)
    {
      v30 = v42;
      objc_msgSend(v42, "insertRowsAtIndexPaths:withRowAnimation:", v11, -[_UIDiffableDataSourceViewUpdater tableViewRowAnimation](v43, "tableViewRowAnimation", v35));
    }
    else
    {
LABEL_60:
      v30 = v42;
    }
    v32 = (void *)v45;
    v31 = (void *)v46;
    v33 = (void *)v44;
    v34 = (void *)v40;
    v8 = (void *)v41;
  }
  else
  {
    v31 = (void *)v46;
    v33 = (void *)v44;
    v32 = (void *)v45;
  }
LABEL_63:

}

- (int64_t)_performUpdateWithCollectionViewUpdateItems:(id)a3 dataSourceSnapshot:(id)a4 updateHandler:(id)a5 completion:(id)a6 viewPropertyAnimator:(id)a7 customAnimationsProvider:(id)a8 animated:(BOOL)a9
{
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  BOOL v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  int64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  _UIDiffableDataSourceViewUpdater *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  uint64_t *v67;
  BOOL v68;
  BOOL v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[5];
  id v73;
  id v74;
  _QWORD v75[4];
  id v76;
  _UIDiffableDataSourceViewUpdater *v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  uint64_t *v85;
  BOOL v86;
  BOOL v87;
  _QWORD v88[4];
  id v89;
  _QWORD aBlock[5];
  id v91;
  id v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t v96;

  v16 = a3;
  v55 = a4;
  v17 = a5;
  v18 = a6;
  v19 = v17;
  v56 = v18;
  v58 = a7;
  v57 = a8;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceViewUpdater.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateHandler"));

  }
  v20 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceViewUpdater.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateItems"));

  }
  v21 = v55;
  if (!v55)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceViewUpdater.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSourceSnapshot"));

  }
  if (!v58 && v57)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceViewUpdater.m"), 108, CFSTR("An non-nil animator is required to use a custom animations provider"));

  }
  v22 = -[_UIDiffableDataSourceViewUpdater hasPerformedInitialUpdate](self, "hasPerformedInitialUpdate");
  -[_UIDiffableDataSourceViewUpdater setHasPerformedInitialUpdate:](self, "setHasPerformedInitialUpdate:", 1);
  -[_UIDiffableDataSourceViewUpdater setDataSourceSnapshot:](self, "setDataSourceSnapshot:", v55);
  v93 = 0;
  v94 = &v93;
  v95 = 0x2020000000;
  v96 = 1;
  -[_UIDiffableDataSourceViewUpdater collectionView](self, "collectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = !v22;
  if (v23)
  {
    v25 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke;
    aBlock[3] = &unk_1E16BB458;
    v52 = v19;
    v26 = v19;
    v92 = v26;
    aBlock[4] = self;
    v27 = v20;
    v91 = v27;
    v28 = _Block_copy(aBlock);
    v88[0] = v25;
    v88[1] = 3221225472;
    v88[2] = __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_2;
    v88[3] = &unk_1E16B1BA0;
    v29 = v56;
    v89 = v29;
    v30 = _Block_copy(v88);
    v75[0] = v25;
    v75[1] = 3221225472;
    v75[2] = __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_3;
    v75[3] = &unk_1E16BC268;
    v76 = v23;
    v80 = v26;
    v77 = self;
    v78 = v27;
    v85 = &v93;
    v81 = v29;
    v86 = a9;
    v79 = v58;
    v31 = v28;
    v82 = v31;
    v83 = v57;
    v32 = v30;
    v84 = v32;
    v87 = v24;
    objc_msgSend(v76, "_performDiffableUpdate:", v75);
    v33 = v94[3];

    v34 = v92;
    v21 = v55;
    v19 = v52;
  }
  else
  {
    -[_UIDiffableDataSourceViewUpdater tableView](self, "tableView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v35 = v20;
      v36 = MEMORY[0x1E0C809B0];
      v72[0] = MEMORY[0x1E0C809B0];
      v72[1] = 3221225472;
      v72[2] = __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_5;
      v72[3] = &unk_1E16BB458;
      v53 = v19;
      v37 = v19;
      v74 = v37;
      v72[4] = self;
      v54 = v35;
      v38 = v35;
      v73 = v38;
      v39 = _Block_copy(v72);
      v70[0] = v36;
      v70[1] = 3221225472;
      v70[2] = __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_6;
      v70[3] = &unk_1E16B1BA0;
      v40 = v56;
      v71 = v40;
      v41 = _Block_copy(v70);
      v59[0] = v36;
      v59[1] = 3221225472;
      v59[2] = __179___UIDiffableDataSourceViewUpdater__performUpdateWithCollectionViewUpdateItems_dataSourceSnapshot_updateHandler_completion_viewPropertyAnimator_customAnimationsProvider_animated___block_invoke_7;
      v59[3] = &unk_1E16BC290;
      v60 = v34;
      v63 = v37;
      v61 = self;
      v62 = v38;
      v67 = &v93;
      v64 = v40;
      v68 = a9;
      v42 = v39;
      v65 = v42;
      v43 = v41;
      v66 = v43;
      v69 = v24;
      objc_msgSend(v60, "_performDiffableUpdate:", v59);
      v33 = v94[3];

      v44 = v74;
      v20 = v54;
      v21 = v55;
      v23 = 0;
      v19 = v53;
    }
    else
    {
      -[_UIDiffableDataSourceViewUpdater updatesSink](self, "updatesSink");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
      {
        -[_UIDiffableDataSourceViewUpdater dataSourceSnapshot](self, "dataSourceSnapshot");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v51) = a9;
        objc_msgSend(v44, "_performUpdateWithCollectionViewUpdateItems:dataSourceSnapshot:updateHandler:completion:viewPropertyAnimator:customAnimationsProvider:animated:", v20, v45, v19, v56, v58, v57, v51);

      }
      v33 = v94[3];
    }

  }
  _Block_object_dispose(&v93, 8);

  return v33;
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (void)setHasPerformedInitialUpdate:(BOOL)a3
{
  self->_hasPerformedInitialUpdate = a3;
}

- (void)setDataSourceSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceSnapshot, a3);
}

- (BOOL)hasPerformedInitialUpdate
{
  return self->_hasPerformedInitialUpdate;
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setTableViewRowAnimation:(int64_t)a3
{
  self->_tableViewRowAnimation = a3;
}

- (_UIDiffableDataSourceViewUpdater)initWithUpdatesSink:(id)a3 collectionView:(id)a4 tableView:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UIDiffableDataSourceViewUpdater *v11;
  _UIDiffableDataSourceViewUpdater *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_UIDiffableDataSourceViewUpdater;
  v11 = -[_UIDiffableDataSourceViewUpdater init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    if (v8)
    {
      v13 = 0;
      v14 = 32;
      v15 = 24;
      v16 = v8;
LABEL_8:
      *(Class *)((char *)&v11->super.isa + v15) = (Class)v13;
      objc_storeWeak((id *)((char *)&v11->super.isa + v14), v16);
      goto LABEL_9;
    }
    if (v9)
    {
      v14 = 40;
      v13 = 1;
      v15 = 24;
      v16 = v9;
      goto LABEL_8;
    }
    if (v10)
    {
      v11->_sinkKind = 2;
      v14 = 56;
      v13 = 100;
      v15 = 16;
      v16 = v10;
      goto LABEL_8;
    }
  }
LABEL_9:

  return v12;
}

- (_UIDiffableDataSourceViewUpdater)initWithCollectionView:(id)a3
{
  return -[_UIDiffableDataSourceViewUpdater initWithUpdatesSink:collectionView:tableView:](self, "initWithUpdatesSink:collectionView:tableView:", 0, a3, 0);
}

- (_UIDiffableDataSourceViewUpdater)initWithTableView:(id)a3
{
  return -[_UIDiffableDataSourceViewUpdater initWithUpdatesSink:collectionView:tableView:](self, "initWithUpdatesSink:collectionView:tableView:", 0, 0, a3);
}

- (void)_reloadData
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  -[_UIDiffableDataSourceViewUpdater setHasPerformedInitialUpdate:](self, "setHasPerformedInitialUpdate:", 1);
  -[_UIDiffableDataSourceViewUpdater collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v3;
  if (v3)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47___UIDiffableDataSourceViewUpdater__reloadData__block_invoke;
    v15[3] = &unk_1E16B1B28;
    v4 = v3;
    v16 = v4;
    objc_msgSend(v4, "_performDiffableUpdate:", v15);
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v4, "layoutIfNeeded");
    v6 = v16;
  }
  else
  {
    -[_UIDiffableDataSourceViewUpdater tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7;
    if (v7)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __47___UIDiffableDataSourceViewUpdater__reloadData__block_invoke_2;
      v13[3] = &unk_1E16B1B28;
      v8 = v7;
      v14 = v8;
      objc_msgSend(v8, "_performDiffableUpdate:", v13);
      objc_msgSend(v8, "window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        objc_msgSend(v8, "layoutIfNeeded");
      v10 = v14;
    }
    else
    {
      -[_UIDiffableDataSourceViewUpdater updatesSink](self, "updatesSink");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v11;
      if (v11)
        objc_msgSend(v11, "_reloadData");
    }

  }
}

- (_UIDiffableDataSourceViewUpdater)initWithCollectionViewUpdatesSink:(id)a3
{
  return -[_UIDiffableDataSourceViewUpdater initWithUpdatesSink:collectionView:tableView:](self, "initWithUpdatesSink:collectionView:tableView:", a3, 0, 0);
}

- (BOOL)_doesExpectedUpdate:(id)a3 matchActualUpdates:(id)a4 allowingEmptyUpdates:(BOOL)a5
{
  id v7;
  id v8;
  _QWORD *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "count"))
  {
    if (objc_msgSend(v8, "count") == 1)
    {
      objc_msgSend(v8, "firstObject");
      v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v10 = -[UICollectionViewUpdateItem isEqualToUpdate:](v9, v7);

      if ((v10 & 1) != 0)
      {
LABEL_4:
        a5 = 1;
        goto LABEL_14;
      }
    }
    else if (objc_msgSend(v8, "count") == 2 && objc_msgSend(v7, "updateAction") == 3)
    {
      v11 = objc_msgSend(v8, "indexOfObjectPassingTest:", &__block_literal_global_106);
      v12 = objc_msgSend(v8, "indexOfObjectPassingTest:", &__block_literal_global_15);
      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = v12;
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v8, "objectAtIndexedSubscript:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectAtIndexedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[UICollectionViewUpdateItem _initialIndexPathEqualToUpdateItem:]((uint64_t)v14, v7)
            && (-[UICollectionViewUpdateItem _finalIndexPathEqualToUpdateItem:]((uint64_t)v15, v7) & 1) != 0)
          {

            goto LABEL_4;
          }

        }
      }
    }
    a5 = 0;
  }
LABEL_14:

  return a5;
}

- (void)_deleteAllItems
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  -[_UIDiffableDataSourceViewUpdater setHasPerformedInitialUpdate:](self, "setHasPerformedInitialUpdate:", 1);
  -[_UIDiffableDataSourceViewUpdater collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v3;
  if (v3)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51___UIDiffableDataSourceViewUpdater__deleteAllItems__block_invoke;
    v15[3] = &unk_1E16B1B28;
    v4 = v3;
    v16 = v4;
    objc_msgSend(v4, "_performDiffableUpdate:", v15);
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v4, "layoutIfNeeded");
    v6 = v16;
  }
  else
  {
    -[_UIDiffableDataSourceViewUpdater tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7;
    if (v7)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __51___UIDiffableDataSourceViewUpdater__deleteAllItems__block_invoke_2;
      v13[3] = &unk_1E16B1B28;
      v8 = v7;
      v14 = v8;
      objc_msgSend(v8, "_performDiffableUpdate:", v13);
      objc_msgSend(v8, "window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        objc_msgSend(v8, "layoutIfNeeded");
      v10 = v14;
    }
    else
    {
      -[_UIDiffableDataSourceViewUpdater updatesSink](self, "updatesSink");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v11;
      if (v11)
        objc_msgSend(v11, "_deleteAllItems");
    }

  }
}

- (id)targetView
{
  void *v3;

  if (-[_UIDiffableDataSourceViewUpdater sinkKind](self, "sinkKind") == 2)
  {
    -[_UIDiffableDataSourceViewUpdater tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[_UIDiffableDataSourceViewUpdater sinkKind](self, "sinkKind") == 1)
  {
    -[_UIDiffableDataSourceViewUpdater collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_performMoveUpdate:(id)a3 onCollectionView:(id)a4
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a4;
  v5 = a3;
  v6 = v5;
  if (v5 && v5[6] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v5[1];
    v8 = v5[3];

    objc_msgSend(v12, "moveSection:toSection:", v7, v8);
    v9 = v12;
  }
  else
  {
    objc_msgSend(v5, "indexPathBeforeUpdate");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathAfterUpdate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "moveItemAtIndexPath:toIndexPath:", v10, v11);
    v9 = (void *)v10;
  }

}

- (id)_sectionIndexesToReloadForTableViewCompatibility:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  v4 = a3;
  if ((dyld_program_sdk_at_least() & 1) != 0
    || (-[_UIDiffableDataSourceViewUpdater dataSourceSnapshot](self, "dataSourceSnapshot"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "numberOfSections"),
        v5,
        !v6))
  {
    v7 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void)_performMoveUpdate:(id)a3 onTableView:(id)a4
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a4;
  v5 = a3;
  v6 = v5;
  if (v5 && v5[6] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v5[1];
    v8 = v5[3];

    objc_msgSend(v12, "moveSection:toSection:", v7, v8);
    v9 = v12;
  }
  else
  {
    objc_msgSend(v5, "indexPathBeforeUpdate");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathAfterUpdate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "moveRowAtIndexPath:toIndexPath:", v10, v11);
    v9 = (void *)v10;
  }

}

- (int64_t)tableViewRowAnimation
{
  return self->_tableViewRowAnimation;
}

- (int64_t)sinkKind
{
  return self->_sinkKind;
}

- (void)setSinkKind:(int64_t)a3
{
  self->_sinkKind = a3;
}

- (_UICollectionViewUpdateItemApplying)updatesSink
{
  return (_UICollectionViewUpdateItemApplying *)objc_loadWeakRetained((id *)&self->_updatesSink);
}

- (void)setUpdatesSink:(id)a3
{
  objc_storeWeak((id *)&self->_updatesSink, a3);
}

- (void)setCollectionView:(id)a3
{
  objc_storeWeak((id *)&self->_collectionView, a3);
}

- (_UICollectionDataSourceSnapshotTranslating)dataSourceSnapshot
{
  return self->_dataSourceSnapshot;
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_dataSourceSnapshot, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_destroyWeak((id *)&self->_updatesSink);
}

@end
