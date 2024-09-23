@implementation UIStatusBarDisplayItemState

BOOL __54___UIStatusBarDisplayItemState_addPlacement_inRegion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "priority");
  return v3 <= objc_msgSend(*(id *)(a1 + 32), "priority");
}

void __86___UIStatusBarDisplayItemState_setupRelationsBetweenDisplayItemStates_visualProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  char v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t n;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id obj;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  objc_msgSend(v3, "placementStates");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
  if (v60)
  {
    v59 = *(_QWORD *)v89;
    v61 = v3;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v89 != v59)
          objc_enumerationMutation(obj);
        v62 = v4;
        v65 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v4);
        objc_msgSend(v65, "placement");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "excludedPlacements");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allObjects");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v8);

        v86 = 0u;
        v87 = 0u;
        v84 = 0u;
        v85 = 0u;
        objc_msgSend(v5, "excludedRegionIdentifiers");
        v63 = (id)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
        if (v66)
        {
          v64 = *(_QWORD *)v85;
          do
          {
            for (i = 0; i != v66; ++i)
            {
              if (*(_QWORD *)v85 != v64)
                objc_enumerationMutation(v63);
              objc_msgSend(*(id *)(a1 + 32), "orderedDisplayItemPlacementsInRegionWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * i));
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v80 = 0u;
              v81 = 0u;
              v82 = 0u;
              v83 = 0u;
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
              if (v11)
              {
                v12 = v11;
                v13 = *(_QWORD *)v81;
                do
                {
                  for (j = 0; j != v12; ++j)
                  {
                    if (*(_QWORD *)v81 != v13)
                      objc_enumerationMutation(v10);
                    v15 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * j);
                    objc_msgSend(v5, "includedPlacements");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    v17 = objc_msgSend(v16, "containsObject:", v15);

                    if ((v17 & 1) == 0)
                      objc_msgSend(v6, "addObject:", v15);
                  }
                  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
                }
                while (v12);
              }

            }
            v66 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
          }
          while (v66);
        }

        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        v18 = v6;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
        v3 = v61;
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v77;
          do
          {
            for (k = 0; k != v20; ++k)
            {
              if (*(_QWORD *)v77 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * k);
              v24 = objc_msgSend(v23, "priority");
              if (v24 >= objc_msgSend(v5, "priority"))
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), CFSTR("_UIStatusBarDisplayItemState.m"), 296, CFSTR("Item placement %@ can't exclude item placement with higher priority %@"), v5, v23);

              }
              +[_UIStatusBarDisplayItemRelation exclusionWithDisplayItemState:placement:](_UIStatusBarDisplayItemRelation, "exclusionWithDisplayItemState:placement:", v61, v5);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = *(void **)(a1 + 40);
              objc_msgSend(v23, "identifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "objectForKeyedSubscript:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v28, "placementStateForPlacement:", v23);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "relations");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "addObject:", v25);

            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
          }
          while (v20);
        }

        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        objc_msgSend(v5, "allRequiredPlacements");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v73;
          do
          {
            for (m = 0; m != v34; ++m)
            {
              if (*(_QWORD *)v73 != v35)
                objc_enumerationMutation(v32);
              v37 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * m);
              v38 = *(void **)(a1 + 40);
              objc_msgSend(v37, "identifier");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "objectForKeyedSubscript:", v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              +[_UIStatusBarDisplayItemRelation requirementWithDisplayItemState:placement:](_UIStatusBarDisplayItemRelation, "requirementWithDisplayItemState:placement:", v40, v37);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "relations");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "addObject:", v41);

            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
          }
          while (v34);
        }

        objc_msgSend(v5, "anyRequiredPlacements");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "count");

        if (v44)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = 0u;
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          objc_msgSend(v5, "anyRequiredPlacements");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v68, v92, 16);
          if (v47)
          {
            v48 = v47;
            v49 = *(_QWORD *)v69;
            do
            {
              for (n = 0; n != v48; ++n)
              {
                if (*(_QWORD *)v69 != v49)
                  objc_enumerationMutation(v46);
                v51 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * n);
                v52 = *(void **)(a1 + 40);
                objc_msgSend(v51, "identifier");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "objectForKeyedSubscript:", v53);
                v54 = (void *)objc_claimAutoreleasedReturnValue();

                +[_UIStatusBarDisplayItemRelation requirementWithDisplayItemState:placement:](_UIStatusBarDisplayItemRelation, "requirementWithDisplayItemState:placement:", v54, v51);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "addObject:", v55);

              }
              v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v68, v92, 16);
            }
            while (v48);
          }

          objc_msgSend(v65, "relations");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          +[_UIStatusBarDisplayItemRelation anyRelationWithRelations:](_UIStatusBarDisplayItemRelation, "anyRelationWithRelations:", v45);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "addObject:", v57);

          v3 = v61;
        }

        v4 = v62 + 1;
      }
      while (v62 + 1 != v60);
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
    }
    while (v60);
  }

}

uint64_t __47___UIStatusBarDisplayItemState_updatePlacement__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updatePlacement");
}

uint64_t __63___UIStatusBarDisplayItemState_updateWithData_styleAttributes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  v4 = objc_msgSend(v3, "dataUpdateStatus");
  if (v4 != 2)
  {
    if (v4)
    {
      v6 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v3, "updateWithData:styleAttributes:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v5);

  }
  v6 = 1;
LABEL_6:

  return v6;
}

void __105___UIStatusBarDisplayItemState__effectiveStyleAttributesFromStyleAttributes_data_styleAttributesChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    v10 = v3;
    if (v5)
    {
      objc_msgSend(v5, "styleAttributesWithOverrides:", v3);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;
    }
    else
    {
      v9 = v3;
      v8 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = v9;
    }

    v3 = v10;
  }

}

uint64_t __49___UIStatusBarDisplayItemState_prepareAnimation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAddingAnimation:", 0);
}

void __49___UIStatusBarDisplayItemState_prepareAnimation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  int v5;
  int v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  _OWORD v13[3];

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v5 = objc_msgSend(WeakRetained, "animationContextId");

  if (a2 != 1 || !v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRemovingAnimation:", 0);
    v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v8, "setFloating:", 0);

    goto LABEL_6;
  }
  v6 = *(_DWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "setRemovingAnimation:", 0);
  v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v7, "setFloating:", 0);

  if (v5 != v6)
  {
LABEL_6:
    v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v9, "setContainerView:", 0);

    v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v10, "setAlpha:", 1.0);

    v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v13[0] = *MEMORY[0x1E0C9BAA8];
    v13[1] = v12;
    v13[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v11, "setTransform:", v13);

  }
}

void __49___UIStatusBarDisplayItemState_prepareAnimation___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "animations");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "removeObject:", WeakRetained);

}

@end
