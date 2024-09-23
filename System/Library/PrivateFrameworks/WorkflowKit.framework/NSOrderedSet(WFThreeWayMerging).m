@implementation NSOrderedSet(WFThreeWayMerging)

+ (id)wf_orderedSetByMergingOrderedSet:()WFThreeWayMerging withOrderedSet:baseOrderedSet:elementComparator:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  WFThreeWayMergingObjectGraph *v15;
  void *v16;
  _QWORD *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD *v24;
  id v25;
  id *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void (**v55)(_QWORD);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  BOOL v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  id v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  void *v90;
  id v91;
  void (**v92)(void *, id, id);
  id v93;
  _QWORD *v94;
  id v95;
  id obj;
  id obja;
  _QWORD v98[4];
  id v99;
  id v100;
  id v101;
  id v102;
  _QWORD v103[4];
  id v104;
  id v105;
  id v106;
  id v107;
  _QWORD v108[4];
  id v109;
  _QWORD aBlock[4];
  id v111;
  id v112;
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  id v122;
  _QWORD *v123;
  _QWORD *v124;
  _QWORD v125[4];
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_58:
    v70 = v14;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSOrderedSet+WFThreeWayMerging.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("secondOrderedSet"));

    v14 = v70;
    if (v12)
      goto LABEL_4;
    goto LABEL_59;
  }
  v68 = v13;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSOrderedSet+WFThreeWayMerging.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firstOrderedSet"));

  v14 = v68;
  if (!v11)
    goto LABEL_58;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_59:
  v72 = v14;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSOrderedSet+WFThreeWayMerging.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("baseOrderedSet"));

  v14 = v72;
LABEL_4:
  v90 = v14;
  if (v14)
  {
    v15 = [WFThreeWayMergingObjectGraph alloc];
    v16 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSOrderedSet+WFThreeWayMerging.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("comparator"));

    v15 = [WFThreeWayMergingObjectGraph alloc];
    v16 = 0;
  }
  v17 = -[WFThreeWayMergingObjectGraph initWithVertexComparator:](v15, v16);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __116__NSOrderedSet_WFThreeWayMerging__wf_orderedSetByMergingOrderedSet_withOrderedSet_baseOrderedSet_elementComparator___block_invoke;
  aBlock[3] = &unk_1E7AF3FB8;
  v18 = v12;
  v111 = v18;
  v19 = v10;
  v112 = v19;
  v20 = v11;
  v113 = v20;
  v21 = _Block_copy(aBlock);
  v108[0] = MEMORY[0x1E0C809B0];
  v108[1] = 3221225472;
  v108[2] = __116__NSOrderedSet_WFThreeWayMerging__wf_orderedSetByMergingOrderedSet_withOrderedSet_baseOrderedSet_elementComparator___block_invoke_2;
  v108[3] = &unk_1E7AF3FE0;
  v22 = v21;
  v109 = v22;
  v23 = _Block_copy(v108);
  v103[0] = MEMORY[0x1E0C809B0];
  v103[1] = 3221225472;
  v103[2] = __116__NSOrderedSet_WFThreeWayMerging__wf_orderedSetByMergingOrderedSet_withOrderedSet_baseOrderedSet_elementComparator___block_invoke_3;
  v103[3] = &unk_1E7AF4008;
  v87 = v22;
  v106 = v87;
  v24 = v17;
  v104 = v24;
  v25 = v18;
  v105 = v25;
  v88 = v23;
  v107 = v88;
  v92 = (void (**)(void *, id, id))_Block_copy(v103);
  v92[2](v92, v19, v20);
  v92[2](v92, v20, v19);
  v26 = v24;
  v95 = v25;
  obj = v19;
  v27 = v20;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void WFAddEdgesForTransitiveRelationships(WFThreeWayMergingObjectGraph * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong)");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "handleFailureInFunction:file:lineNumber:description:", v76, CFSTR("NSOrderedSet+WFThreeWayMerging.m"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("graph"));

  }
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void WFAddEdgesForTransitiveRelationships(WFThreeWayMergingObjectGraph * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong)");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "handleFailureInFunction:file:lineNumber:description:", v78, CFSTR("NSOrderedSet+WFThreeWayMerging.m"), 194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("baseOrderedSet"));

  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void WFAddEdgesForTransitiveRelationships(WFThreeWayMergingObjectGraph * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong)");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "handleFailureInFunction:file:lineNumber:description:", v80, CFSTR("NSOrderedSet+WFThreeWayMerging.m"), 195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firstOrderedSet"));

  }
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void WFAddEdgesForTransitiveRelationships(WFThreeWayMergingObjectGraph * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong)");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "handleFailureInFunction:file:lineNumber:description:", v82, CFSTR("NSOrderedSet+WFThreeWayMerging.m"), 196, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("secondOrderedSet"));

  }
  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  if (v26)
    v28 = v26[2];
  else
    v28 = 0;
  v29 = v28;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v118, v126, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v119;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v119 != v31)
          objc_enumerationMutation(v29);
        v33 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * v32);
        v34 = (void *)MEMORY[0x1C3BB3598]();
        v35 = v33;
        v36 = v35;
        if (v26)
        {
          if (!v35)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", sel_directPredecessorsOfVertex_, v26, CFSTR("WFThreeWayMergingObjectGraph.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("vertex"));

          }
          objc_msgSend(v26[4], "objectForKey:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v37 = 0;
        }

        v38 = objc_msgSend(v37, "count") == 0;
        if (v38)
        {
          WFGetClosestCommonElementForObject(v36, v95, obj, v27, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (v39)
            -[WFThreeWayMergingObjectGraph addEdgeFromVertex:toVertex:]((uint64_t)v26, v39, v36);

        }
        v40 = v36;
        v41 = v40;
        if (v26)
        {
          if (!v40)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", sel_directSuccessorsOfVertex_, v26, CFSTR("WFThreeWayMergingObjectGraph.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("vertex"));

          }
          objc_msgSend(v26[3], "objectForKey:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v42 = 0;
        }

        v43 = objc_msgSend(v42, "count") == 0;
        if (v43)
        {
          WFGetClosestCommonElementForObject(v41, v95, obj, v27, 0);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v44)
            -[WFThreeWayMergingObjectGraph addEdgeFromVertex:toVertex:]((uint64_t)v26, v41, v44);

        }
        objc_autoreleasePoolPop(v34);
        ++v32;
      }
      while (v30 != v32);
      v47 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v118, v126, 16);
      v30 = v47;
    }
    while (v47);
  }

  v48 = (void *)objc_opt_new();
  v98[0] = MEMORY[0x1E0C809B0];
  v98[1] = 3221225472;
  v98[2] = __116__NSOrderedSet_WFThreeWayMerging__wf_orderedSetByMergingOrderedSet_withOrderedSet_baseOrderedSet_elementComparator___block_invoke_4;
  v98[3] = &unk_1E7AF4058;
  v99 = obj;
  v100 = v27;
  v101 = v48;
  v102 = v90;
  v93 = v48;
  v85 = v90;
  v84 = v27;
  v83 = obj;
  v94 = v98;
  if (v26)
  {
    v49 = (void *)objc_opt_new();
    v125[0] = 0;
    v125[1] = v125;
    v125[2] = 0x2020000000;
    v125[3] = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)objc_opt_new();
    *(_QWORD *)&v118 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v118 + 1) = 3221225472;
    *(_QWORD *)&v119 = __78__WFThreeWayMergingObjectGraph_enumerateStronglyConnectedComponentsWithBlock___block_invoke;
    *((_QWORD *)&v119 + 1) = &unk_1E7AF7198;
    v53 = v52;
    *(_QWORD *)&v120 = v53;
    *((_QWORD *)&v120 + 1) = v26;
    v54 = v50;
    *(_QWORD *)&v121 = v54;
    v124 = v125;
    v91 = v51;
    *((_QWORD *)&v121 + 1) = v91;
    v86 = v49;
    v122 = v86;
    v123 = v94;
    v55 = (void (**)(_QWORD))_Block_copy(&v118);
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    obja = v26[2];
    v56 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v114, v126, 16);
    if (v56)
    {
      v57 = *(_QWORD *)v115;
      do
      {
        v58 = 0;
        do
        {
          if (*(_QWORD *)v115 != v57)
            objc_enumerationMutation(obja);
          v59 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * v58);
          v60 = (void *)MEMORY[0x1C3BB3598]();
          objc_msgSend(v54, "objectForKey:", v59);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v61 == 0;

          if (v62)
          {
            +[WFThreeWayMergingObjectGraphComponentEnumerationStackItem initialItemWithVertex:]((uint64_t)WFThreeWayMergingObjectGraphComponentEnumerationStackItem, v59);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "addObject:", v63);

            while (objc_msgSend(v53, "count"))
            {
              v64 = (void *)MEMORY[0x1C3BB3598]();
              v55[2](v55);
              objc_autoreleasePoolPop(v64);
            }
          }
          objc_autoreleasePoolPop(v60);
          ++v58;
        }
        while (v58 != v56);
        v65 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v114, v126, 16);
        v56 = v65;
      }
      while (v65);
    }

    _Block_object_dispose(v125, 8);
  }

  objc_msgSend(a1, "orderedSetWithOrderedSet:", v93);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  return v66;
}

+ (uint64_t)wf_orderedSetByMergingOrderedSet:()WFThreeWayMerging withOrderedSet:baseOrderedSet:
{
  return objc_msgSend(a1, "wf_orderedSetByMergingOrderedSet:withOrderedSet:baseOrderedSet:elementComparator:", a3, a4, a5, &__block_literal_global_42510);
}

@end
