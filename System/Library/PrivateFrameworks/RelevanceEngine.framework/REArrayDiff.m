@implementation REArrayDiff

+ (id)diffFromElements:(id)a3 toElements:(id)a4
{
  return (id)objc_msgSend(a1, "diffFromElements:toElements:equalComparator:hashGenerator:changeComparator:", a3, a4, &__block_literal_global_71, &__block_literal_global_78, &__block_literal_global_79_1);
}

uint64_t __43__REArrayDiff_diffFromElements_toElements___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:");
}

uint64_t __43__REArrayDiff_diffFromElements_toElements___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hash");
}

uint64_t __43__REArrayDiff_diffFromElements_toElements___block_invoke_3()
{
  return 0;
}

+ (id)diffFromElements:(id)a3 toElements:(id)a4 equalComparator:(id)a5 hashGenerator:(id)a6 changeComparator:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  id v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  _QWORD *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  id v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  uint64_t (**v89)(id, void *, void *);
  id obj;
  _QWORD v91[4];
  id v92;
  id v93;
  _QWORD v94[4];
  id v95;
  id v96;
  _QWORD v97[4];
  id v98;
  id v99;
  _QWORD v100[4];
  id v101;
  id v102;
  _QWORD v103[4];
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  uint64_t v126;

  v126 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v89 = (uint64_t (**)(id, void *, void *))a7;
  v80 = (_QWORD *)objc_opt_new();
  v72 = v12;
  objc_msgSend(a1, "_createSetFromElementArray:equalComparator:hashGenerator:", v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = a1;
  v76 = v14;
  v78 = v13;
  v74 = v15;
  objc_msgSend(a1, "_createSetFromElementArray:equalComparator:hashGenerator:", v13, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v20 = v16;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v119, v125, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v120;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v120 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * i);
        if (objc_msgSend(v17, "containsObject:", v25))
          v26 = v19;
        else
          v26 = (void *)v18;
        objc_msgSend(v26, "addObject:", v25);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v119, v125, 16);
    }
    while (v22);
  }
  v82 = (void *)v18;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v27 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  obj = v17;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v124, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v116;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v116 != v31)
          objc_enumerationMutation(obj);
        v33 = *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * j);
        if (objc_msgSend(v20, "containsObject:", v33))
          v34 = v28;
        else
          v34 = (void *)v27;
        objc_msgSend(v34, "addObject:", v33);
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v124, 16);
    }
    while (v30);
  }
  v81 = (void *)v27;
  v79 = v20;

  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v35 = v19;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v111, v123, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v112;
    v83 = *MEMORY[0x24BDBCAB0];
    do
    {
      for (k = 0; k != v37; ++k)
      {
        if (*(_QWORD *)v112 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * k);
        objc_msgSend(obj, "member:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v41)
        {
          v42 = (void *)MEMORY[0x24BDBCE88];
          objc_msgSend(v40, "object");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "raise:format:", v83, CFSTR("Missing object %@ in toSet"), v43);

        }
        objc_msgSend(v40, "object");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "object");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v89[2](v89, v44, v45);

        v47 = objc_msgSend(v40, "index");
        if (v46)
        {
          objc_msgSend(v87, "addIndex:", v47);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v40, "index"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "setObject:forKeyedSubscript:", v41, v48);

        }
        else
        {
          objc_msgSend(v88, "addIndex:", v47);
        }

      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v111, v123, 16);
    }
    while (v37);
  }

  objc_msgSend(v70, "_indexSetFromSet:", v82);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "_indexSetFromSet:", v81);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend(v49, "mutableCopy");
  v52 = (void *)objc_msgSend(v69, "mutableCopy");
  v53 = MEMORY[0x24BDAC760];
  v103[0] = MEMORY[0x24BDAC760];
  v103[1] = 3221225472;
  v103[2] = __90__REArrayDiff_diffFromElements_toElements_equalComparator_hashGenerator_changeComparator___block_invoke;
  v103[3] = &unk_24CF903C0;
  v54 = v72;
  v109 = v76;
  v110 = v74;
  v104 = v54;
  v105 = v28;
  v106 = v51;
  v107 = v52;
  v108 = v50;
  v55 = v50;
  v84 = v52;
  v73 = v51;
  v71 = v28;
  v75 = v74;
  v77 = v76;
  v56 = (void *)MEMORY[0x2199B2434](v103);
  objc_msgSend(v87, "enumerateIndexesUsingBlock:", v56);
  objc_msgSend(v88, "enumerateIndexesUsingBlock:", v56);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v100[0] = v53;
  v100[1] = 3221225472;
  v100[2] = __90__REArrayDiff_diffFromElements_toElements_equalComparator_hashGenerator_changeComparator___block_invoke_2;
  v100[3] = &unk_24CF903E8;
  v101 = v85;
  v57 = (id)objc_claimAutoreleasedReturnValue();
  v102 = v57;
  v86 = v85;
  objc_msgSend(v87, "enumerateIndexesUsingBlock:", v100);
  v97[0] = v53;
  v97[1] = 3221225472;
  v97[2] = __90__REArrayDiff_diffFromElements_toElements_equalComparator_hashGenerator_changeComparator___block_invoke_3;
  v97[3] = &unk_24CF903E8;
  v98 = v54;
  v58 = v57;
  v99 = v58;
  v68 = v54;
  objc_msgSend(v49, "enumerateIndexesWithOptions:usingBlock:", 2, v97);
  objc_msgSend(v55, "allObjects");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "sortedArrayUsingComparator:", &__block_literal_global_92_0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v94[0] = v53;
  v94[1] = 3221225472;
  v94[2] = __90__REArrayDiff_diffFromElements_toElements_equalComparator_hashGenerator_changeComparator___block_invoke_5;
  v94[3] = &unk_24CF90450;
  v61 = v78;
  v95 = v61;
  v62 = v58;
  v96 = v62;
  objc_msgSend(v60, "enumerateObjectsUsingBlock:", v94);

  v91[0] = v53;
  v91[1] = 3221225472;
  v91[2] = __90__REArrayDiff_diffFromElements_toElements_equalComparator_hashGenerator_changeComparator___block_invoke_6;
  v91[3] = &unk_24CF903E8;
  v92 = v61;
  v63 = v62;
  v93 = v63;
  v64 = v61;
  objc_msgSend(v69, "enumerateIndexesUsingBlock:", v91);
  v65 = (void *)v80[1];
  v80[1] = v63;
  v66 = v63;

  return v80;
}

void __90__REArrayDiff_diffFromElements_toElements_equalComparator_hashGenerator_changeComparator___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_REDiffItem itemWithObject:index:comparator:hashGenerator:](_REDiffItem, "itemWithObject:index:comparator:hashGenerator:", v4, a2, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "member:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "index");
  v8 = v7 - objc_msgSend(*(id *)(a1 + 48), "countOfIndexesInRange:", 0, objc_msgSend(v5, "index"));
  v9 = objc_msgSend(v6, "index");
  if (v8 != v9 - objc_msgSend(*(id *)(a1 + 56), "countOfIndexesInRange:", 0, objc_msgSend(v6, "index")))
  {
    v10 = objc_msgSend(v5, "index");
    if (v10 != objc_msgSend(v6, "index"))
    {
      v11 = *(void **)(a1 + 64);
      v12 = (void *)MEMORY[0x24BDD15D8];
      v14[0] = objc_msgSend(v5, "index");
      v14[1] = objc_msgSend(v6, "index");
      objc_msgSend(v12, "indexPathWithIndexes:length:", v14, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v13);

      objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(v5, "index"));
      objc_msgSend(*(id *)(a1 + 56), "addIndex:", objc_msgSend(v6, "index"));
    }
  }

}

void __90__REArrayDiff_diffFromElements_toElements_equalComparator_hashGenerator_changeComparator___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 40);
  objc_msgSend(v9, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[REDiffOperation reloadWithItem:atIndex:](REDiffOperation, "reloadWithItem:atIndex:", v7, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v8);

}

void __90__REArrayDiff_diffFromElements_toElements_equalComparator_hashGenerator_changeComparator___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  +[REDiffOperation deleteWithItem:atIndex:](REDiffOperation, "deleteWithItem:atIndex:", v6, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

uint64_t __90__REArrayDiff_diffFromElements_toElements_equalComparator_hashGenerator_changeComparator___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __90__REArrayDiff_diffFromElements_toElements_equalComparator_hashGenerator_changeComparator___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = objc_msgSend(v3, "indexAtPosition:", 0);
  v5 = objc_msgSend(v3, "indexAtPosition:", 1);

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  +[REDiffOperation moveWithItem:fromIndex:toIndex:](REDiffOperation, "moveWithItem:fromIndex:toIndex:", v8, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

void __90__REArrayDiff_diffFromElements_toElements_equalComparator_hashGenerator_changeComparator___block_invoke_6(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  +[REDiffOperation insertWithItem:atIndex:](REDiffOperation, "insertWithItem:atIndex:", v6, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

- (void)enumerateOperationsUsingBlock:(id)a3
{
  id v4;
  NSArray *allOperations;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  allOperations = self->_allOperations;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__REArrayDiff_enumerateOperationsUsingBlock___block_invoke;
  v7[3] = &unk_24CF90478;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](allOperations, "enumerateObjectsUsingBlock:", v7);

}

void __45__REArrayDiff_enumerateOperationsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = objc_msgSend(v3, "type");
  objc_msgSend(v3, "item");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "toIndex");
  v6 = objc_msgSend(v3, "fromIndex");

  (*(void (**)(uint64_t, uint64_t, id, uint64_t, uint64_t))(v2 + 16))(v2, v4, v7, v5, v6);
}

+ (id)_indexSetFromSet:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "index", (_QWORD)v11));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)_createSetFromElementArray:(id)a3 equalComparator:(id)a4 hashGenerator:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __72__REArrayDiff__createSetFromElementArray_equalComparator_hashGenerator___block_invoke;
  v24[3] = &unk_24CF904A0;
  v26 = v8;
  v27 = v9;
  v11 = v10;
  v25 = v11;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v24);
  v14 = objc_msgSend(v11, "count");
  if (v14 != objc_msgSend(v7, "count"))
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("Items in array are not unique: %@"), v15, v16, v17, v18, v19, v20, (uint64_t)v7);
  v21 = v25;
  v22 = v11;

  return v22;
}

void __72__REArrayDiff__createSetFromElementArray_equalComparator_hashGenerator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  +[_REDiffItem itemWithObject:index:comparator:hashGenerator:](_REDiffItem, "itemWithObject:index:comparator:hashGenerator:", a2, a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (NSArray)allOperations
{
  return self->_allOperations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allOperations, 0);
}

@end
