@implementation _UIDiffableDataSourceDiffer

- (id)initWithBeforeDataSource:(void *)a3 afterDataSource:(void *)a4 itemIdentifierDiffer:
{
  id *v8;
  id *v9;
  _UIIdentifierDiffer *v10;
  id v11;
  void *v12;
  void *v13;
  _UIDiffableSectionBoundaryMoveDetector *v14;
  id v15;
  id v16;
  _UIDiffableSectionBoundaryMoveDetector *v17;
  _UIIdentifierDiffer *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  uint64_t v42;
  BOOL v43;
  void *v44;
  void *v45;
  uint64_t v46;
  UICollectionViewUpdateItem *v47;
  UICollectionViewUpdateItem *v48;
  void *v49;
  id v50;
  id *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  id *v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  int v79;
  int v80;
  UICollectionViewUpdateItem *v81;
  UICollectionViewUpdateItem *v82;
  UICollectionViewUpdateItem *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  int v87;
  void *v88;
  void *v89;
  uint64_t v90;
  char v91;
  UICollectionViewUpdateItem *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  id v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  id *v108;
  id v109;
  id v110;
  id *v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id *v117;
  void *v118;
  id v119;
  id *v120;
  id *v121;
  id *obj;
  id obja;
  id *v124;
  id *v125;
  id *v126;
  id v127;
  id *v128;
  id v129;
  id v130;
  id v131;
  objc_super v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  uint64_t v137;
  uint64_t v138;
  void (*v139)(uint64_t, uint64_t);
  void *v140;
  id v141;
  id *v142;
  id v143;
  id v144;
  char *v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  char *v150;
  _BYTE v151[128];
  uint64_t v152;

  v152 = *MEMORY[0x1E0C80C00];
  v113 = a2;
  v114 = a3;
  v115 = a4;
  if (a1
    && (v132.receiver = a1,
        v132.super_class = (Class)_UIDiffableDataSourceDiffer,
        v8 = (id *)objc_msgSendSuper2(&v132, sel_init),
        (v121 = v8) != 0))
  {
    v126 = v8 + 2;
    objc_storeStrong(v8 + 2, a2);
    obj = v121 + 3;
    objc_storeStrong(v121 + 3, a3);
    objc_storeStrong(v121 + 4, a4);
    v9 = (id *)v121[4];
    if (!v9)
    {
      v10 = [_UIIdentifierDiffer alloc];
      v11 = *v126;
      objc_msgSend(v11, "identifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*obj, "identifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_UIIdentifierDiffer initWithBeforeIdentifiers:afterIdentifiers:]((id *)&v10->super.isa, v12, v13);

      if (v9)
        -[_UIIdentifierDiffer _performDiffWithOptions:]((uint64_t)v9, 4);
    }
    v112 = v9;
    v124 = v9;
    v14 = [_UIDiffableSectionBoundaryMoveDetector alloc];
    v15 = *obj;
    v16 = *v126;
    v17 = -[_UIDiffableSectionBoundaryMoveDetector initWithItemDiffer:beforeDataSourceState:afterDataSourceState:](v14, "initWithItemDiffer:beforeDataSourceState:afterDataSourceState:", v124, v16, v15);

    -[_UIDiffableSectionBoundaryMoveDetector movePairs](v17, "movePairs");
    v118 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = [_UIIdentifierDiffer alloc];
    v19 = *v126;
    objc_msgSend(v19, "sections");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*obj, "sections");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = -[_UIIdentifierDiffer initWithBeforeIdentifiers:afterIdentifiers:]((id *)&v18->super.isa, v20, v21);

    if (v117)
      -[_UIIdentifierDiffer _performDiffWithOptions:]((uint64_t)v117, 4);
    v22 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v23 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v24 = v117;
    v25 = v22;
    v26 = v23;
    v120 = v24;
    -[_UIIdentifierDiffer insertedIndexes](v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");
    -[_UIIdentifierDiffer deletedIndexes](v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count");
    -[_UIIdentifierDiffer movePairs](v24);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");

    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v30 + v28 + v32);
    -[_UIIdentifierDiffer insertedIndexes](v24);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = MEMORY[0x1E0C809B0];
    v138 = 3221225472;
    v139 = __94___UIDiffableDataSourceDiffer__sectionUpdatesForDiffResults_deletedSections_insertedSections___block_invoke;
    v140 = &unk_1E16B2978;
    v35 = v33;
    v141 = v35;
    v128 = (id *)v26;
    v142 = v128;
    objc_msgSend(v34, "enumerateIndexesUsingBlock:", &v137);

    -[_UIIdentifierDiffer deletedIndexes](v24);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v133 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v133 + 1) = 3221225472;
    *(_QWORD *)&v134 = __94___UIDiffableDataSourceDiffer__sectionUpdatesForDiffResults_deletedSections_insertedSections___block_invoke_2;
    *((_QWORD *)&v134 + 1) = &unk_1E16B2978;
    v37 = v35;
    *(_QWORD *)&v135 = v37;
    v130 = v25;
    *((_QWORD *)&v135 + 1) = v130;
    objc_msgSend(v36, "enumerateIndexesUsingBlock:", &v133);

    v148 = 0u;
    v149 = 0u;
    v146 = 0u;
    v147 = 0u;
    -[_UIIdentifierDiffer movePairs](v24);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v146, v151, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v147;
      do
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v147 != v40)
            objc_enumerationMutation(v38);
          v42 = *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * i);
          if (v42)
            v43 = *(_QWORD *)(v42 + 8) == *(_QWORD *)(v42 + 16);
          else
            v43 = 1;
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0x7FFFFFFFFFFFFFFFLL, v112);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0x7FFFFFFFFFFFFFFFLL, *(_QWORD *)(v42 + 16));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (v43)
            {
              objc_msgSend(v130, "addIndex:", *(_QWORD *)(v42 + 8));
              v46 = *(_QWORD *)(v42 + 16);
LABEL_18:
              objc_msgSend(v128, "addIndex:", v46);
              v47 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:]([UICollectionViewUpdateItem alloc], "initWithInitialIndexPath:finalIndexPath:updateAction:", v44, 0, 1);
              objc_msgSend(v37, "addObject:", v47);
              v48 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:]([UICollectionViewUpdateItem alloc], "initWithInitialIndexPath:finalIndexPath:updateAction:", 0, v45, 0);
              objc_msgSend(v37, "addObject:", v48);

              goto LABEL_23;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0x7FFFFFFFFFFFFFFFLL, 0);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (v43)
            {
              objc_msgSend(v130, "addIndex:", 0);
              v46 = 0;
              goto LABEL_18;
            }
          }
          v47 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:]([UICollectionViewUpdateItem alloc], "initWithInitialIndexPath:finalIndexPath:updateAction:", v44, v45, 3);
          objc_msgSend(v37, "addObject:", v47);
LABEL_23:

        }
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v146, v151, 16);
      }
      while (v39);
    }

    v49 = (void *)*((_QWORD *)&v135 + 1);
    v116 = v37;

    v125 = v124;
    v119 = v118;
    v50 = v130;
    v51 = v128;
    v52 = *v126;
    objc_msgSend(v52, "dataSourceSnapshot");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = *obj;
    objc_msgSend(v54, "dataSourceSnapshot");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v54) = objc_msgSend(v119, "count") == 0;
    -[_UIIdentifierDiffer movePairs](v125);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    if ((v54 & 1) == 0)
    {
      objc_msgSend(v56, "setByAddingObjectsFromSet:", v119);
      v58 = objc_claimAutoreleasedReturnValue();

      v57 = (void *)v58;
    }
    -[_UIIdentifierDiffer insertedIndexes](v125);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "count");
    -[_UIIdentifierDiffer deletedIndexes](v125);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "count");
    v63 = objc_msgSend(v57, "count");

    v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v62 + v60 + v63);
    -[_UIIdentifierDiffer insertedIndexes](v125);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v146 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v146 + 1) = 3221225472;
    *(_QWORD *)&v147 = __112___UIDiffableDataSourceDiffer__itemUpdatesForDiffResults_sectionBoundaryMoves_deletedSections_insertedSections___block_invoke;
    *((_QWORD *)&v147 + 1) = &unk_1E16BAED0;
    v66 = v55;
    v150 = sel__itemUpdatesForDiffResults_sectionBoundaryMoves_deletedSections_insertedSections_;
    v129 = v66;
    *(_QWORD *)&v148 = v66;
    *((_QWORD *)&v148 + 1) = v121;
    v67 = v51;
    *(_QWORD *)&v149 = v67;
    v68 = v64;
    *((_QWORD *)&v149 + 1) = v68;
    objc_msgSend(v65, "enumerateIndexesUsingBlock:", &v146);

    -[_UIIdentifierDiffer deletedIndexes](v125);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = MEMORY[0x1E0C809B0];
    v138 = 3221225472;
    v139 = __112___UIDiffableDataSourceDiffer__itemUpdatesForDiffResults_sectionBoundaryMoves_deletedSections_insertedSections___block_invoke_2;
    v140 = &unk_1E16BAED0;
    v70 = v53;
    v145 = sel__itemUpdatesForDiffResults_sectionBoundaryMoves_deletedSections_insertedSections_;
    v131 = v70;
    v141 = v70;
    v142 = v121;
    v71 = v50;
    v143 = v71;
    v127 = v68;
    v144 = v127;
    objc_msgSend(v69, "enumerateIndexesUsingBlock:", &v137);

    v135 = 0u;
    v136 = 0u;
    v133 = 0u;
    v134 = 0u;
    obja = v57;
    v72 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v133, v151, 16);
    if (v72)
    {
      v73 = *(_QWORD *)v134;
      do
      {
        v74 = 0;
        do
        {
          if (*(_QWORD *)v134 != v73)
            objc_enumerationMutation(obja);
          v75 = *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * v74);
          if (v75)
          {
            objc_msgSend(v131, "indexPathForGlobalIndex:", *(_QWORD *)(v75 + 8));
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = *(_QWORD *)(v75 + 16);
          }
          else
          {
            objc_msgSend(v131, "indexPathForGlobalIndex:", 0);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = 0;
          }
          objc_msgSend(v129, "indexPathForGlobalIndex:", v77, v112);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v76)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "handleFailureInMethod:object:file:lineNumber:description:", sel__itemUpdatesForDiffResults_sectionBoundaryMoves_deletedSections_insertedSections_, v121, CFSTR("_UIDiffableDataSourceDiffer.m"), 202, CFSTR("Failed to convert global index to indexPath."));

          }
          if (!v78)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "handleFailureInMethod:object:file:lineNumber:description:", sel__itemUpdatesForDiffResults_sectionBoundaryMoves_deletedSections_insertedSections_, v121, CFSTR("_UIDiffableDataSourceDiffer.m"), 203, CFSTR("Failed to convert global index to indexPath."));

          }
          v79 = objc_msgSend(v71, "containsIndex:", objc_msgSend(v76, "section"));
          v80 = objc_msgSend(v67, "containsIndex:", objc_msgSend(v78, "section"));
          if ((dyld_program_sdk_at_least() & 1) != 0 || !objc_msgSend(v76, "isEqual:", v78))
          {
            if (((v79 | v80) & 1) != 0)
            {
              if ((v79 & 1) == 0)
              {
                v83 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:]([UICollectionViewUpdateItem alloc], "initWithInitialIndexPath:finalIndexPath:updateAction:", v76, 0, 1);
                objc_msgSend(v127, "addObject:", v83);

              }
              if ((v80 & 1) == 0)
              {
LABEL_43:
                v82 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:]([UICollectionViewUpdateItem alloc], "initWithInitialIndexPath:finalIndexPath:updateAction:", 0, v78, 0);
LABEL_57:
                v92 = v82;
                objc_msgSend(v127, "addObject:", v82);

              }
            }
            else
            {
              -[_UIIdentifierDiffer insertedIndexes](v125);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v85 = v84;
              if (v75)
                v86 = *(_QWORD *)(v75 + 16);
              else
                v86 = 0;
              v87 = objc_msgSend(v84, "containsIndex:", v86);

              if (!v87)
              {
                v82 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:]([UICollectionViewUpdateItem alloc], "initWithInitialIndexPath:finalIndexPath:updateAction:", v76, v78, 3);
                goto LABEL_57;
              }
              -[_UIIdentifierDiffer deletedIndexes](v125);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              v89 = v88;
              if (v75)
                v90 = *(_QWORD *)(v75 + 8);
              else
                v90 = 0;
              v91 = objc_msgSend(v88, "containsIndex:", v90);

              if ((v91 & 1) == 0)
              {
                v82 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:]([UICollectionViewUpdateItem alloc], "initWithInitialIndexPath:finalIndexPath:updateAction:", v76, 0, 1);
                goto LABEL_57;
              }
            }
          }
          else
          {
            if ((v79 & 1) == 0)
            {
              v81 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:]([UICollectionViewUpdateItem alloc], "initWithInitialIndexPath:finalIndexPath:updateAction:", v76, 0, 1);
              objc_msgSend(v127, "addObject:", v81);

            }
            if ((v80 & 1) == 0)
              goto LABEL_43;
          }

          ++v74;
        }
        while (v72 != v74);
        v95 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v133, v151, 16);
        v72 = v95;
      }
      while (v95);
    }

    v96 = v144;
    v97 = v127;

    objc_msgSend(v97, "arrayByAddingObjectsFromArray:", v116);
    v98 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v121 + 4, v112);
    objc_storeStrong(v121 + 5, v117);
    v148 = 0u;
    v149 = 0u;
    v146 = 0u;
    v147 = 0u;
    -[_UIIdentifierDiffer movePairs](v120);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v146, v151, 16);
    if (v100)
    {
      v101 = *(_QWORD *)v147;
      do
      {
        v102 = 0;
        do
        {
          if (*(_QWORD *)v147 != v101)
            objc_enumerationMutation(v99);
          v103 = *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * v102);
          if (v103)
          {
            v104 = *(_QWORD *)(v103 + 8);
            v105 = *(_QWORD *)(v103 + 16);
          }
          else
          {
            v104 = 0;
            v105 = 0;
          }
          objc_msgSend(v71, "removeIndex:", v104, v112);
          objc_msgSend(v67, "removeIndex:", v105);
          ++v102;
        }
        while (v100 != v102);
        v106 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v146, v151, 16);
        v100 = v106;
      }
      while (v106);
    }

    v107 = v121[8];
    v121[8] = v67;
    v108 = v67;

    v109 = v121[7];
    v121[7] = v71;

    v110 = v121[1];
    v121[1] = (id)v98;

  }
  else
  {
    v121 = 0;
  }

  return v121;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertedSections, 0);
  objc_storeStrong((id *)&self->_deletedSections, 0);
  objc_storeStrong((id *)&self->_affectedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_sectionIdentifierDiffer, 0);
  objc_storeStrong((id *)&self->_itemIdentifierDiffer, 0);
  objc_storeStrong((id *)&self->_afterDataSourceState, 0);
  objc_storeStrong((id *)&self->_beforeDataSourceState, 0);
  objc_storeStrong((id *)&self->_updates, 0);
}

+ (id)differWithBeforeDataSourceState:(void *)a3 afterDataSourceState:
{
  id v4;
  id v5;
  id *v6;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v6 = -[_UIDiffableDataSourceDiffer initWithBeforeDataSource:afterDataSource:itemIdentifierDiffer:]([_UIDiffableDataSourceDiffer alloc], v5, v4, 0);

  return v6;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  _UIDiffableDataSourceState *beforeDataSourceState;
  _UIDiffableDataSourceState *v8;
  void *v9;
  void *v10;
  _UIDiffableDataSourceState *v11;
  void *v12;
  uint64_t v13;
  _UIDiffableDataSourceState *v14;
  void *v15;
  void *v16;
  _UIDiffableDataSourceState *v17;
  void *v18;
  void *v19;
  _UIDiffableDataSourceState *afterDataSourceState;
  void *v21;
  uint64_t v22;
  _UIDiffableDataSourceState *v23;
  void *v24;
  void *v25;
  _UIDiffableDataSourceState *v26;
  void *v27;
  void *v28;
  void *v30;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p: "), v5, self);

  if (self)
    beforeDataSourceState = self->_beforeDataSourceState;
  else
    beforeDataSourceState = 0;
  v8 = beforeDataSourceState;
  -[_UIDiffableDataSourceState dataSourceSnapshot](v8, "dataSourceSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    -[_UIDiffableDataSourceState dataSourceSnapshot](self->_afterDataSourceState, "dataSourceSnapshot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("before: %@; after:%@;"), v9, v10);

    objc_msgSend(v6, "appendString:", CFSTR("\n\nBefore:\n"));
    v11 = self->_beforeDataSourceState;
  }
  else
  {
    objc_msgSend(0, "dataSourceSnapshot");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("before: %@; after:%@;"), v9, v30);

    objc_msgSend(v6, "appendString:", CFSTR("\n\nBefore:\n"));
    v11 = 0;
  }
  -[_UIDiffableDataSourceState dataSourceSnapshot](v11, "dataSourceSnapshot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "numberOfSections") >= 1)
  {
    v13 = 0;
    do
    {
      if (self)
        v14 = self->_beforeDataSourceState;
      else
        v14 = 0;
      -[_UIDiffableDataSourceState sections](v14, "sections");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (self)
        v17 = self->_beforeDataSourceState;
      else
        v17 = 0;
      -[_UIDiffableDataSourceState identifiers](v17, "identifiers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      __42___UIDiffableDataSourceDiffer_description__block_invoke(v12, v18, v13, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "appendString:", v19);
      ++v13;
    }
    while (v13 < objc_msgSend(v12, "numberOfSections"));
  }
  objc_msgSend(v6, "appendString:", CFSTR("\n\nAfter:\n"));
  if (self)
    afterDataSourceState = self->_afterDataSourceState;
  else
    afterDataSourceState = 0;
  -[_UIDiffableDataSourceState dataSourceSnapshot](afterDataSourceState, "dataSourceSnapshot");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "numberOfSections") >= 1)
  {
    v22 = 0;
    do
    {
      if (self)
        v23 = self->_afterDataSourceState;
      else
        v23 = 0;
      -[_UIDiffableDataSourceState sections](v23, "sections");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (self)
        v26 = self->_afterDataSourceState;
      else
        v26 = 0;
      -[_UIDiffableDataSourceState identifiers](v26, "identifiers");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      __42___UIDiffableDataSourceDiffer_description__block_invoke(v21, v27, v22, v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "appendString:", v28);
      ++v22;
    }
    while (v22 < objc_msgSend(v21, "numberOfSections"));
  }
  objc_msgSend(v6, "appendFormat:", CFSTR("\nidentifierDiffer: %@"), self->_itemIdentifierDiffer);
  objc_msgSend(v6, "appendFormat:", CFSTR("\nUpdates: %@>"), self->_updates);

  return v6;
}

+ (id)differWithBeforeDataSourceState:(void *)a3 afterDataSourceState:(void *)a4 itemIdentifierDiffer:
{
  id v6;
  id v7;
  id v8;
  id *v9;

  v6 = a4;
  v7 = a3;
  v8 = a2;
  objc_opt_self();
  v9 = -[_UIDiffableDataSourceDiffer initWithBeforeDataSource:afterDataSource:itemIdentifierDiffer:]([_UIDiffableDataSourceDiffer alloc], v8, v7, v6);

  return v9;
}

- (BOOL)_verifyForUpdates:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  UICollectionViewUpdateItem *v22;
  UICollectionViewUpdateItem *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *beforeDataSourceState;
  id v38;
  void *v39;
  void *v40;
  _UIDiffableDataSourceState *afterDataSourceState;
  _UIDiffableDataSourceState *v42;
  void *v43;
  void *v44;
  id v46;
  void *v48;
  id v50;
  id v51;
  _QWORD v52[6];
  _QWORD v53[5];
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD aBlock[6];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v50 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v51 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v74 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i);
        if (v8 && *(_QWORD *)(v8 + 48) == 0x7FFFFFFFFFFFFFFFLL)
        {
          v9 = *(_QWORD *)(v8 + 80);
          if (v9 == 1)
          {
            v10 = 8;
            v11 = v50;
          }
          else
          {
            if (v9)
              continue;
            v10 = 24;
            v11 = v51;
          }
          objc_msgSend(v11, "addIndex:", *(_QWORD *)(v8 + v10));
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
    }
    while (v5);
  }

  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
  if (!v14)
    goto LABEL_42;
  v15 = *(_QWORD *)v70;
  do
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v70 != v15)
        objc_enumerationMutation(v13);
      v17 = *(_QWORD **)(*((_QWORD *)&v69 + 1) + 8 * v16);
      if (!v17)
      {
        objc_msgSend(0, "indexPathAfterUpdate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }
      v18 = v17[10];
      if (!v18)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * v16), "indexPathAfterUpdate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17[6] != 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_30:
          if ((objc_msgSend(v51, "containsIndex:", objc_msgSend(v19, "section")) & 1) != 0)
            goto LABEL_37;
        }
LABEL_28:
        objc_msgSend(v12, "addObject:", v17);
        goto LABEL_37;
      }
      if (v18 == 1)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * v16), "indexPathBeforeUpdate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v21;
        if (v17[6] != 0x7FFFFFFFFFFFFFFFLL
          && (objc_msgSend(v50, "containsIndex:", objc_msgSend(v21, "section")) & 1) != 0)
        {
          goto LABEL_37;
        }
        goto LABEL_28;
      }
      if (v18 != 3)
        goto LABEL_38;
      objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * v16), "indexPathBeforeUpdate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "indexPathAfterUpdate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17[6] == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v12, "addObject:", v17);
      }
      else
      {
        if ((objc_msgSend(v50, "containsIndex:", objc_msgSend(v19, "section")) & 1) == 0)
        {
          v22 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:]([UICollectionViewUpdateItem alloc], "initWithInitialIndexPath:finalIndexPath:updateAction:", v19, 0, 1);
          objc_msgSend(v12, "addObject:", v22);

        }
        if ((objc_msgSend(v51, "containsIndex:", objc_msgSend(v20, "section")) & 1) == 0)
        {
          v23 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:]([UICollectionViewUpdateItem alloc], "initWithInitialIndexPath:finalIndexPath:updateAction:", 0, v20, 0);
          objc_msgSend(v12, "addObject:", v23);

        }
      }

LABEL_37:
LABEL_38:
      ++v16;
    }
    while (v14 != v16);
    v24 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
    v14 = v24;
  }
  while (v24);
LABEL_42:

  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v27 = v12;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
  if (!v28)
    goto LABEL_54;
  v29 = *(_QWORD *)v66;
  while (2)
  {
    v30 = 0;
    while (2)
    {
      if (*(_QWORD *)v66 != v29)
        objc_enumerationMutation(v27);
      v31 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * v30);
      v32 = v26;
      if (v31 && (v33 = *(_QWORD *)(v31 + 80), v32 = v26, v33))
      {
        if (v33 == 1)
        {
          v32 = v25;
          goto LABEL_51;
        }
      }
      else
      {
LABEL_51:
        objc_msgSend(v32, "addObject:");
      }
      if (v28 != ++v30)
        continue;
      break;
    }
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
    if (v28)
      continue;
    break;
  }
LABEL_54:

  v34 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49___UIDiffableDataSourceDiffer__verifyForUpdates___block_invoke;
  aBlock[3] = &unk_1E16BAEF8;
  aBlock[4] = self;
  aBlock[5] = a2;
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __49___UIDiffableDataSourceDiffer__verifyForUpdates___block_invoke_2;
  v62[3] = &unk_1E16BAF20;
  v35 = _Block_copy(aBlock);
  v63 = v35;
  v48 = _Block_copy(v62);
  v60[0] = v34;
  v60[1] = 3221225472;
  v60[2] = __49___UIDiffableDataSourceDiffer__verifyForUpdates___block_invoke_3;
  v60[3] = &unk_1E16BAF20;
  v46 = v35;
  v61 = v46;
  v36 = _Block_copy(v60);
  objc_msgSend(v25, "sortUsingComparator:", v48);
  objc_msgSend(v26, "sortUsingComparator:", v36);
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__36;
  v58 = __Block_byref_object_dispose__36;
  beforeDataSourceState = self;
  if (self)
    beforeDataSourceState = self->_beforeDataSourceState;
  v38 = beforeDataSourceState;
  objc_msgSend(v38, "dataSourceSnapshot");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167C258, "snapshotterForSnapshot:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = v40;
  v53[0] = v34;
  v53[1] = 3221225472;
  v53[2] = __49___UIDiffableDataSourceDiffer__verifyForUpdates___block_invoke_40;
  v53[3] = &unk_1E16B8C90;
  v53[4] = &v54;
  objc_msgSend(v25, "enumerateObjectsUsingBlock:", v53);
  v52[0] = v34;
  v52[1] = 3221225472;
  v52[2] = __49___UIDiffableDataSourceDiffer__verifyForUpdates___block_invoke_2_42;
  v52[3] = &unk_1E16BAF48;
  v52[4] = self;
  v52[5] = &v54;
  objc_msgSend(v26, "enumerateObjectsUsingBlock:", v52);
  if (self)
    afterDataSourceState = self->_afterDataSourceState;
  else
    afterDataSourceState = 0;
  v42 = afterDataSourceState;
  -[_UIDiffableDataSourceState dataSourceSnapshot](v42, "dataSourceSnapshot");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167C258, "snapshotterForSnapshot:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v42) = objc_msgSend((id)v55[5], "isEqual:", v44);
  _Block_object_dispose(&v54, 8);

  return (char)v42;
}

@end
