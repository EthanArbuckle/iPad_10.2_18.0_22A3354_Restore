@implementation _UIDiffableDataSourceSectionSnapshotRebaser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rebasedSectionSnapshots, 0);
  objc_storeStrong((id *)&self->_initialSectionSnapshots, 0);
  objc_storeStrong((id *)&self->_dataSourceDiffer, 0);
  objc_storeStrong((id *)&self->_finalSnapshot, 0);
  objc_storeStrong((id *)&self->_initialSnapshot, 0);
}

- (_UIDiffableDataSourceSectionSnapshotRebaser)initWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 initialSectionSnapshots:(id)a5 dataSourceDiffer:(id)a6
{
  return -[_UIDiffableDataSourceSectionSnapshotRebaser initWithInitialSnapshot:finalSnapshot:initialSectionSnapshots:dataSourceDiffer:shouldPerformChildSnapshotMoves:](self, "initWithInitialSnapshot:finalSnapshot:initialSectionSnapshots:dataSourceDiffer:shouldPerformChildSnapshotMoves:", a3, a4, a5, a6, 0);
}

- (_UIDiffableDataSourceSectionSnapshotRebaser)initWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 initialSectionSnapshots:(id)a5 dataSourceDiffer:(id)a6 shouldPerformChildSnapshotMoves:(BOOL)a7
{
  _BOOL8 v7;
  id v13;
  id v14;
  id v15;
  id v16;
  _UIDiffableDataSourceSectionSnapshotRebaser *v17;
  _UIDiffableDataSourceSectionSnapshotRebaser *v18;
  objc_super v20;

  v7 = a7;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_UIDiffableDataSourceSectionSnapshotRebaser;
  v17 = -[_UIDiffableDataSourceSectionSnapshotRebaser init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_initialSnapshot, a3);
    objc_storeStrong((id *)&v18->_finalSnapshot, a4);
    objc_storeStrong((id *)&v18->_initialSectionSnapshots, a5);
    objc_storeStrong((id *)&v18->_dataSourceDiffer, a6);
    -[_UIDiffableDataSourceSectionSnapshotRebaser _rebaseForInitialSnapshot:finalSnapshot:initialSectionSnapshots:dataSourceDiffer:shouldPerformChildSnapshotMoves:](v18, "_rebaseForInitialSnapshot:finalSnapshot:initialSectionSnapshots:dataSourceDiffer:shouldPerformChildSnapshotMoves:", v13, v14, v15, v16, v7);
  }

  return v18;
}

- (id)computeApplyTransactionIncludingSectionDifferences:(BOOL)a3
{
  return -[_UIDiffableDataSourceSectionSnapshotRebaser _transactionIncludingSectionDifferences:source:](self, "_transactionIncludingSectionDifferences:source:", a3, 0);
}

- (id)_transactionIncludingSectionDifferences:(BOOL)a3 source:(int64_t)a4
{
  void *v6;
  _UIDiffableDataSourceDiffer *dataSourceDiffer;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSDiffableDataSourceTransaction *v15;
  NSDiffableDataSourceTransaction *v16;
  NSDiffableDataSourceSnapshot *finalSnapshot;
  NSDiffableDataSourceSnapshot *initialSnapshot;
  NSDiffableDataSourceTransaction *v19;
  id v20;
  void *v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  -[_UIDiffableDataSourceSectionSnapshotRebaser _computeSectionTransactionsIncludingSectionDifferences:](self, "_computeSectionTransactionsIncludingSectionDifferences:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  dataSourceDiffer = self->_dataSourceDiffer;
  if (dataSourceDiffer)
    dataSourceDiffer = (_UIDiffableDataSourceDiffer *)dataSourceDiffer->_itemIdentifierDiffer;
  v8 = dataSourceDiffer;
  -[_UIIdentifierDiffer collectionDifference](v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C9AA60];
  if (a4 == 1 && v9 && objc_msgSend(v9, "hasChanges"))
  {
    objc_msgSend(v9, "insertions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "object");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v13)
      {
        v23[0] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = (void *)MEMORY[0x1E0C9AA60];
      }

    }
    else
    {
      v10 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  v15 = [NSDiffableDataSourceTransaction alloc];
  v16 = v15;
  initialSnapshot = self->_initialSnapshot;
  finalSnapshot = self->_finalSnapshot;
  if (v9)
  {
    v19 = -[NSDiffableDataSourceTransaction initWithInitialSnapshot:finalSnapshot:source:difference:reorderedItemIdentifiers:sectionTransactions:](v15, "initWithInitialSnapshot:finalSnapshot:source:difference:reorderedItemIdentifiers:sectionTransactions:", initialSnapshot, finalSnapshot, a4, v9, v10, v6);
  }
  else
  {
    v20 = objc_alloc(MEMORY[0x1E0CB3838]);
    v21 = (void *)objc_msgSend(v20, "initWithChanges:", MEMORY[0x1E0C9AA60]);
    v19 = -[NSDiffableDataSourceTransaction initWithInitialSnapshot:finalSnapshot:source:difference:reorderedItemIdentifiers:sectionTransactions:](v16, "initWithInitialSnapshot:finalSnapshot:source:difference:reorderedItemIdentifiers:sectionTransactions:", initialSnapshot, finalSnapshot, a4, v21, v10, v6);

  }
  return v19;
}

- (void)_rebaseForInitialSnapshot:(id)a3 finalSnapshot:(id)a4 initialSectionSnapshots:(id)a5 dataSourceDiffer:(id)a6 shouldPerformChildSnapshotMoves:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  id *v14;
  uint64_t v15;
  NSMapTable *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSMapTable *v42;
  _UIDiffableDataSourceSectionSnapshotRebaser *v43;
  id v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  NSMapTable *rebasedSectionSnapshots;
  NSMapTable *v88;
  id v89;
  id v90;
  id v91;
  void *v92;
  void *v93;
  id *v94;
  id v95;
  void *v96;
  _QWORD *v98;
  id v99;
  id obj;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  id v106;
  _UIDiffableDataSourceSectionSnapshotRebaser *v107;
  id v108;
  uint64_t v109;
  void *v110;
  void *v111;
  id v112;
  NSMapTable *v113;
  void *v114;
  id v115;
  _BOOL4 v116;
  void *v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _QWORD v126[5];
  id v127;
  id v128;
  id v129;
  id v130;
  uint64_t v131;
  SEL v132;
  _QWORD v133[5];
  id v134;
  id v135;
  id v136;
  uint64_t v137;
  SEL v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _QWORD aBlock[4];
  NSMapTable *v144;
  id v145;
  _BYTE v146[128];
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  _BYTE v151[128];
  _BYTE v152[128];
  uint64_t v153;

  v116 = a7;
  v153 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (id *)a6;
  v15 = objc_msgSend(v13, "count");
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v16 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v17 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __160___UIDiffableDataSourceSectionSnapshotRebaser__rebaseForInitialSnapshot_finalSnapshot_initialSectionSnapshots_dataSourceDiffer_shouldPerformChildSnapshotMoves___block_invoke;
    aBlock[3] = &unk_1E16B1998;
    v113 = v16;
    v144 = v113;
    v112 = v13;
    v145 = v112;
    v114 = _Block_copy(aBlock);
    if (v14)
      goto LABEL_4;
    objc_msgSend(v11, "state");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "state");
    v19 = v17;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDiffableDataSourceDiffer differWithBeforeDataSourceState:afterDataSourceState:]((uint64_t)_UIDiffableDataSourceDiffer, v18, v20);
    v14 = (id *)objc_claimAutoreleasedReturnValue();

    v17 = v19;
    objc_storeStrong((id *)&self->_dataSourceDiffer, v14);
    if (v14)
    {
LABEL_4:
      v98 = v14[4];
      v21 = 0;
      v22 = v14[2];
    }
    else
    {
      v98 = 0;
      v22 = 0;
      v21 = 1;
    }
    v23 = v22;
    objc_msgSend(v23, "identifiers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend(v24, "count");
    v99 = v11;
    v107 = self;
    v96 = v12;
    v94 = v14;
    if ((v21 & 1) != 0)
      v25 = 0;
    else
      v25 = v14[3];
    v108 = v25;
    objc_msgSend(v108, "identifiers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = objc_msgSend(v26, "count");
    -[_UIIdentifierDiffer deletedIndexes](v98);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIIdentifierDiffer insertedIndexes](v98);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIIdentifierDiffer movePairs](v98);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count");

    v95 = v13;
    v110 = v24;
    if (!v30 || v116)
    {
      v31 = v27;
    }
    else
    {
      v105 = v26;
      v31 = (void *)objc_msgSend(v27, "mutableCopy");
      v32 = (void *)objc_msgSend(v28, "mutableCopy");
      v139 = 0u;
      v140 = 0u;
      v141 = 0u;
      v142 = 0u;
      -[_UIIdentifierDiffer movePairs](v98);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v139, v152, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v140;
        do
        {
          v37 = 0;
          do
          {
            if (*(_QWORD *)v140 != v36)
              objc_enumerationMutation(v33);
            v38 = *(_QWORD *)(*((_QWORD *)&v139 + 1) + 8 * v37);
            if (v38)
            {
              v39 = *(_QWORD *)(v38 + 8);
              v40 = *(_QWORD *)(v38 + 16);
            }
            else
            {
              v39 = 0;
              v40 = 0;
            }
            objc_msgSend(v31, "addIndex:", v39);
            objc_msgSend(v32, "addIndex:", v40);
            ++v37;
          }
          while (v35 != v37);
          v41 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v139, v152, 16);
          v35 = v41;
        }
        while (v41);
      }

      v28 = v32;
      v17 = MEMORY[0x1E0C809B0];
      v26 = v105;
    }
    v133[0] = v17;
    v133[1] = 3221225472;
    v133[2] = __160___UIDiffableDataSourceSectionSnapshotRebaser__rebaseForInitialSnapshot_finalSnapshot_initialSectionSnapshots_dataSourceDiffer_shouldPerformChildSnapshotMoves___block_invoke_2;
    v133[3] = &unk_1E16B19E8;
    v137 = v104;
    v138 = a2;
    v43 = v107;
    v133[4] = v107;
    v91 = v23;
    v134 = v91;
    v44 = v114;
    v136 = v44;
    v106 = v110;
    v135 = v106;
    v93 = v31;
    objc_msgSend(v31, "enumerateRangesUsingBlock:", v133);
    v126[0] = v17;
    v126[1] = 3221225472;
    v126[2] = __160___UIDiffableDataSourceSectionSnapshotRebaser__rebaseForInitialSnapshot_finalSnapshot_initialSectionSnapshots_dataSourceDiffer_shouldPerformChildSnapshotMoves___block_invoke_4;
    v126[3] = &unk_1E16B1A38;
    v131 = v103;
    v132 = a2;
    v126[4] = v107;
    v90 = v108;
    v127 = v90;
    v45 = v44;
    v130 = v45;
    v89 = v26;
    v128 = v89;
    v115 = v96;
    v129 = v115;
    v92 = v28;
    objc_msgSend(v28, "enumerateRangesUsingBlock:", v126);
    v101 = v45;
    if (v116)
    {
      v124 = 0u;
      v125 = 0u;
      v122 = 0u;
      v123 = 0u;
      -[_UIIdentifierDiffer movePairs](v98);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v46 = v99;
      v109 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v151, 16);
      if (!v109)
        goto LABEL_77;
      v102 = *(_QWORD *)v123;
      while (1)
      {
        v47 = 0;
        do
        {
          if (*(_QWORD *)v123 != v102)
            objc_enumerationMutation(obj);
          v48 = *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * v47);
          if (v48)
          {
            v49 = *(_QWORD *)(v48 + 8);
            v50 = *(_QWORD *)(v48 + 16);
          }
          else
          {
            v49 = 0;
            v50 = 0;
          }
          if (v49 >= v104)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, v43, CFSTR("_UIDiffableDataSourceSectionSnapshotRebaser.m"), 243, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("moveFromIndex < beforeIdentifiersCount"));

            v45 = v101;
          }
          if (v50 >= v103)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", a2, v43, CFSTR("_UIDiffableDataSourceSectionSnapshotRebaser.m"), 244, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("moveToIndex < afterIdentifiersCount"));

            v45 = v101;
          }
          objc_msgSend(v106, "objectAtIndexedSubscript:", v49);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "sectionIdentifierForSectionContainingItemIdentifier:", v51);
          v52 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "sectionIdentifierForSectionContainingItemIdentifier:", v51);
          v53 = objc_claimAutoreleasedReturnValue();
          v54 = (void *)v53;
          if (v52)
          {
            if (v53)
              goto LABEL_37;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", a2, v43, CFSTR("_UIDiffableDataSourceSectionSnapshotRebaser.m"), 249, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromSectionIdentifier"));

            if (v54)
              goto LABEL_37;
          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", a2, v43, CFSTR("_UIDiffableDataSourceSectionSnapshotRebaser.m"), 250, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toSectionIdentifier"));

LABEL_37:
          (*((void (**)(id, uint64_t))v45 + 2))(v45, v52);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v55;
          v111 = (void *)v52;
          if (v55)
          {
            if (objc_msgSend(v55, "containsItem:", v51))
              v57 = objc_msgSend(v56, "levelOfItem:", v51);
            else
              v57 = 0x7FFFFFFFFFFFFFFFLL;
            objc_msgSend(v56, "childSnapshotOfParent:includingParent:", v51, 0);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "parentOfChild:", v51);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            v150 = v51;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v150, 1);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "deleteItems:", v59);

          }
          else
          {
            v58 = 0;
            v117 = 0;
            v57 = 0x7FFFFFFFFFFFFFFFLL;
          }
          (*((void (**)(id, void *))v45 + 2))(v45, v54);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v60)
            goto LABEL_69;
          objc_msgSend(v115, "_identifierAfterIdentifier:", v51);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v60, "containsItem:", v61) & 1) == 0)
          {

            v61 = 0;
          }
          objc_msgSend(v115, "_identifierBeforeIdentifier:", v51);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v60, "containsItem:", v62)
            || v117 && objc_msgSend(v62, "isEqual:"))
          {

            v62 = 0;
          }
          if (v57 != 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v61 && v62)
            {
              v63 = objc_msgSend(v60, "levelOfItem:", v62);
              v64 = objc_msgSend(v60, "levelOfItem:", v61);
              if (v63 == v64)
                goto LABEL_57;
              if (v64 != v57)
              {
                if (v63 == v57)
                {

                  v61 = 0;
                }
LABEL_57:
                v65 = objc_msgSend(v60, "isExpanded:", v62);
                v149 = v51;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v149, 1);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v60, "insertItems:afterItem:insertionMode:", v66, v62, v65);

                v46 = v99;
                goto LABEL_67;
              }

              v46 = v99;
              goto LABEL_66;
            }
            if (v62 && !v61)
            {
              v67 = objc_msgSend(v60, "levelOfItem:", v62);
              if (v57 || v67 < 1)
                goto LABEL_57;

              v46 = v99;
LABEL_63:
              v147 = v51;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v147, 1);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "appendItems:", v61);
              goto LABEL_67;
            }
          }
          if (v62)
            goto LABEL_57;
          if (!v61)
            goto LABEL_63;
LABEL_66:
          v148 = v51;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v148, 1);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "insertItems:beforeItem:", v68, v61);

LABEL_67:
          v45 = v101;

          if (v58)
            objc_msgSend(v60, "replaceChildrenOfParentItem:withSnapshot:", v51, v58);
LABEL_69:

          ++v47;
          v43 = v107;
        }
        while (v109 != v47);
        v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v151, 16);
        v109 = v73;
        if (!v73)
        {
LABEL_77:

          break;
        }
      }
    }
    v120 = 0u;
    v121 = 0u;
    v118 = 0u;
    v119 = 0u;
    -[NSMapTable keyEnumerator](v113, "keyEnumerator");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v118, v146, 16);
    if (!v75)
      goto LABEL_90;
    v76 = v75;
    v77 = *(_QWORD *)v119;
LABEL_80:
    v78 = 0;
    while (1)
    {
      if (*(_QWORD *)v119 != v77)
        objc_enumerationMutation(v74);
      v79 = *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * v78);
      objc_msgSend(v112, "objectForKey:", v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable objectForKey:](v113, "objectForKey:", v79);
      v81 = objc_claimAutoreleasedReturnValue();
      v82 = (void *)v81;
      if (v80)
      {
        if (!v81)
          goto LABEL_88;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "handleFailureInMethod:object:file:lineNumber:description:", a2, v107, CFSTR("_UIDiffableDataSourceSectionSnapshotRebaser.m"), 374, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initialSectionSnapshot"));

        if (!v82)
        {
LABEL_88:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "handleFailureInMethod:object:file:lineNumber:description:", a2, v107, CFSTR("_UIDiffableDataSourceSectionSnapshotRebaser.m"), 375, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rebasedSectionSnapshot"));

        }
      }
      objc_msgSend(v80, "expandedItems");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "expandItems:", v83);

      if (v76 == ++v78)
      {
        v86 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v118, v146, 16);
        v76 = v86;
        if (!v86)
        {
LABEL_90:

          rebasedSectionSnapshots = v107->_rebasedSectionSnapshots;
          v107->_rebasedSectionSnapshots = v113;
          v88 = v113;

          v11 = v99;
          v13 = v95;
          v12 = v96;
          v14 = v94;
          goto LABEL_91;
        }
        goto LABEL_80;
      }
    }
  }
  v42 = self->_rebasedSectionSnapshots;
  self->_rebasedSectionSnapshots = v16;

LABEL_91:
}

- (id)_computeSectionTransactionsIncludingSectionDifferences:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _BOOL8 v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSDiffableDataSourceSectionTransaction *v21;
  _UIDiffableDataSourceSectionSnapshotRebaser *v24;
  id obj;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v3 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[NSMapTable keyEnumerator](self->_rebasedSectionSnapshots, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v26)
  {
    v6 = *(_QWORD *)v28;
    v24 = self;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_initialSectionSnapshots, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable objectForKey:](self->_rebasedSectionSnapshots, "objectForKey:", v8);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v9)
        {
          if (v10)
            goto LABEL_8;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceSectionSnapshotRebaser.m"), 440, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionSnapshot"));

          if (v11)
          {
LABEL_8:
            if (v3)
              goto LABEL_9;
            goto LABEL_12;
          }
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSourceSectionSnapshotRebaser.m"), 441, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modifiedSectionSnapshot"));

        if (v3)
        {
LABEL_9:
          objc_msgSend(v11, "items");
          v12 = v6;
          v13 = v3;
          v14 = v5;
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "items");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "differenceFromArray:withOptions:", v16, 4);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v5 = v14;
          v3 = v13;
          v6 = v12;
          self = v24;
          goto LABEL_13;
        }
LABEL_12:
        v20 = objc_alloc(MEMORY[0x1E0CB3838]);
        v17 = (void *)objc_msgSend(v20, "initWithChanges:", MEMORY[0x1E0C9AA60]);
LABEL_13:
        v21 = -[NSDiffableDataSourceSectionTransaction initWithSectionIdentifier:initialSnapshot:finalSnapshot:difference:]([NSDiffableDataSourceSectionTransaction alloc], "initWithSectionIdentifier:initialSnapshot:finalSnapshot:difference:", v8, v9, v11, v17);
        objc_msgSend(v5, "addObject:", v21);

      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v26);
  }

  return v5;
}

- (_UIDiffableDataSourceSectionSnapshotRebaser)initWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 initialSectionSnapshots:(id)a5
{
  return -[_UIDiffableDataSourceSectionSnapshotRebaser initWithInitialSnapshot:finalSnapshot:initialSectionSnapshots:dataSourceDiffer:shouldPerformChildSnapshotMoves:](self, "initWithInitialSnapshot:finalSnapshot:initialSectionSnapshots:dataSourceDiffer:shouldPerformChildSnapshotMoves:", a3, a4, a5, 0, 0);
}

- (id)computeReorderingTransaction
{
  return -[_UIDiffableDataSourceSectionSnapshotRebaser _transactionIncludingSectionDifferences:source:](self, "_transactionIncludingSectionDifferences:source:", 1, 1);
}

- (NSMapTable)rebasedSectionSnapshots
{
  return self->_rebasedSectionSnapshots;
}

@end
