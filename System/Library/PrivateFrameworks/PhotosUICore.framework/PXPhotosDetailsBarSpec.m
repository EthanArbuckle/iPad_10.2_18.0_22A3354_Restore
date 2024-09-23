@implementation PXPhotosDetailsBarSpec

- (PXPhotosDetailsBarSpec)initWithExtendedTraitCollection:(id)a3
{
  id v4;
  PXPhotosDetailsBarSpec *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSSet *v12;
  NSDictionary *v13;
  id v14;
  NSDictionary *sortPriorityByBarItemIdentifierByPlacement;
  NSDictionary *v16;
  NSSet *includedBarItemIdentifiers;
  NSSet *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  NSSet *v25;
  NSDictionary *v26;
  objc_super v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[8];
  _QWORD v31[13];

  v31[12] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PXPhotosDetailsBarSpec;
  v5 = -[PXBarSpec initWithExtendedTraitCollection:](&v27, sel_initWithExtendedTraitCollection_, v4);
  if (v5)
  {
    v31[0] = CFSTR("PXBarItemIdentifierActionMenu");
    v31[1] = CFSTR("PXBarItemIdentifierSelect");
    v31[2] = CFSTR("PXBarItemIdentifierShare");
    v31[3] = CFSTR("PXBarItemIdentifierFavorite");
    v31[4] = CFSTR("PXBarItemIdentifierAdd");
    v31[5] = CFSTR("PXBarItemIdentifierAddTo");
    v31[6] = CFSTR("PXBarItemIdentifierTrash");
    v31[7] = CFSTR("PXBarItemIdentifierEdit");
    v31[8] = CFSTR("PXBarItemIdentifierDone");
    v31[9] = CFSTR("PXBarItemIdentifierCancel");
    v31[10] = CFSTR("PXBarItemIdentifierFaceMode");
    v31[11] = CFSTR("PXBarItemIdentifierAssetMode");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = CFSTR("PXBarItemIdentifierShare");
    v30[1] = CFSTR("PXBarItemIdentifierFaceMode");
    v30[2] = CFSTR("PXBarItemIdentifierAssetMode");
    v30[3] = CFSTR("PXBarItemIdentifierSelectModeCaption");
    v30[4] = CFSTR("PXBarItemIdentifierTrash");
    v30[5] = CFSTR("PXBarItemIdentifierInterButtonSpacing");
    v30[6] = CFSTR("PXBarItemIdentifierSelectModeMenu");
    v30[7] = CFSTR("PXBarItemIdentifierFilterIndicatorButton");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = &unk_1E53EB100;
    v28[1] = &unk_1E53EB118;
    v29[0] = v6;
    v29[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __58__PXPhotosDetailsBarSpec_initWithExtendedTraitCollection___block_invoke;
    v23 = &unk_1E5148740;
    v24 = v8;
    v12 = v9;
    v25 = v12;
    v13 = v11;
    v26 = v13;
    v14 = v8;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v20);
    sortPriorityByBarItemIdentifierByPlacement = v5->_sortPriorityByBarItemIdentifierByPlacement;
    v5->_sortPriorityByBarItemIdentifierByPlacement = v13;
    v16 = v13;

    includedBarItemIdentifiers = v5->_includedBarItemIdentifiers;
    v5->_includedBarItemIdentifiers = v12;
    v18 = v12;

    v5->_shouldPlaceEditActionsInToolbar = objc_msgSend(v4, "layoutSizeClass", v20, v21, v22, v23) == 1;
  }

  return v5;
}

- (id)_sortPriorityForBarItem:(id)a3 placement:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_sortPriorityByBarItemIdentifierByPlacement, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_sortPriorityByBarItemIdentifierByPlacement, "objectForKeyedSubscript:", &unk_1E53EB100);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = &unk_1E53EB130;
    if (v11)
      v13 = (void *)v11;
    v9 = v13;

  }
  return v9;
}

- (id)_placementForBarItem:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierTrash")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierAddTo")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierShare")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierFaceMode")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierAssetMode")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierSelectModeMenu")))
  {
    if (self->_shouldPlaceEditActionsInToolbar)
      v5 = 4;
    else
      v5 = 2;
  }
  else
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierFavorite")) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierAdd")) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierSelect")) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierCancel")) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierActionMenu")) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierEdit")) & 1) != 0)
    {
      goto LABEL_20;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierDone")))
    {
      v5 = (-[PXPhotosDetailsBarSpec detailsOptions](self, "detailsOptions") >> 9) & 2;
      goto LABEL_10;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierFilterIndicatorButton")) & 1) != 0)
    {
LABEL_20:
      v5 = 3;
      goto LABEL_10;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierInterButtonSpacing")))
      v5 = 4;
    else
      v5 = 0;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_shouldIncludeItem:(id)a3
{
  NSSet *includedBarItemIdentifiers;
  void *v4;

  includedBarItemIdentifiers = self->_includedBarItemIdentifiers;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(includedBarItemIdentifiers) = -[NSSet containsObject:](includedBarItemIdentifiers, "containsObject:", v4);

  return (char)includedBarItemIdentifiers;
}

- (id)sortedBarItemsByPlacement:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  _QWORD v33[6];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v43 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        if (-[PXPhotosDetailsBarSpec _shouldIncludeItem:](self, "_shouldIncludeItem:", v11))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v8);
  }
  v32 = v6;

  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v39 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
        -[PXPhotosDetailsBarSpec _placementForBarItem:](self, "_placementForBarItem:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, v19);
        }
        objc_msgSend(v20, "addObject:", v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v15);
  }
  v31 = v13;

  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v22 = v12;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v35;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v35 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * k);
        objc_msgSend(v22, "objectForKeyedSubscript:", v27, v31, v32);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __52__PXPhotosDetailsBarSpec_sortedBarItemsByPlacement___block_invoke;
        v33[3] = &unk_1E5119048;
        v33[4] = self;
        v33[5] = v27;
        objc_msgSend(v28, "sortedArrayUsingComparator:", v33);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v29, v27);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v24);
  }

  return v21;
}

- (unint64_t)detailsOptions
{
  return self->_detailsOptions;
}

- (void)setDetailsOptions:(unint64_t)a3
{
  self->_detailsOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_includedBarItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_sortPriorityByBarItemIdentifierByPlacement, 0);
}

uint64_t __52__PXPhotosDetailsBarSpec_sortedBarItemsByPlacement___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  objc_msgSend(v5, "_sortPriorityForBarItem:placement:", a2, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_sortPriorityForBarItem:placement:", v7, *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "compare:", v9);
  return v10;
}

void __58__PXPhotosDetailsBarSpec_initWithExtendedTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKey:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__PXPhotosDetailsBarSpec_initWithExtendedTraitCollection___block_invoke_2;
  v8[3] = &unk_1E5129B08;
  v9 = v5;
  v10 = *(id *)(a1 + 40);
  v6 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v6, v4);

}

void __58__PXPhotosDetailsBarSpec_initWithExtendedTraitCollection___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
}

@end
