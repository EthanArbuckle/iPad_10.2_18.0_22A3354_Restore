@implementation PKConfigurablePassDetailSectionsController

- (PKConfigurablePassDetailSectionsController)init
{

  return 0;
}

- (PKConfigurablePassDetailSectionsController)initWithPaymentPass:(id)a3 clientReservedIdentifiers:(id)a4
{
  return (PKConfigurablePassDetailSectionsController *)-[PKConfigurablePassDetailSectionsController _initWithPaymentPass:visibleSectionIdentifiers:clientReservedIdentifiers:renderUnclaimedFields:](self, "_initWithPaymentPass:visibleSectionIdentifiers:clientReservedIdentifiers:renderUnclaimedFields:", a3, 0, a4, 1);
}

- (PKConfigurablePassDetailSectionsController)initWithPaymentPass:(id)a3 forSelectSections:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  PKConfigurablePassDetailSectionsController *v10;

  v6 = (objc_class *)MEMORY[0x1E0C99E60];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithArray:", v7);

  v10 = -[PKConfigurablePassDetailSectionsController _initWithPaymentPass:visibleSectionIdentifiers:clientReservedIdentifiers:renderUnclaimedFields:](self, "_initWithPaymentPass:visibleSectionIdentifiers:clientReservedIdentifiers:renderUnclaimedFields:", v8, v9, 0, 0);
  return v10;
}

- (id)_initWithPaymentPass:(id)a3 visibleSectionIdentifiers:(id)a4 clientReservedIdentifiers:(id)a5 renderUnclaimedFields:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t m;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSDictionary *sectionMap;
  uint64_t v56;
  NSDictionary *fieldMap;
  uint64_t v58;
  NSArray *allSectionIdentifiers;
  _BOOL4 v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  void (**v73)(void *, id, id);
  id v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  id obj;
  id obja;
  id objb;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  PKConfigurablePassDetailSectionsController *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _QWORD aBlock[4];
  id v102;
  id v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  objc_super v113;
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v6 = a6;
  v120 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v66 = a4;
  v11 = a5;
  v113.receiver = self;
  v113.super_class = (Class)PKConfigurablePassDetailSectionsController;
  v84 = -[PKPaymentPassDetailSectionController init](&v113, sel_init);
  if (v84)
  {
    v61 = v6;
    v74 = v11;
    objc_msgSend(v10, "passDetailSections");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v70 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v67 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    v112 = 0u;
    v65 = v10;
    objc_msgSend(v10, "backFieldBuckets");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v119, 16);
    if (v13)
    {
      v14 = v13;
      v81 = *(_QWORD *)v110;
      v15 = *MEMORY[0x1E0D69A38];
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v110 != v81)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
          v105 = 0u;
          v106 = 0u;
          v107 = 0u;
          v108 = 0u;
          v18 = v17;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v105, v118, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v106;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v106 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * j);
                objc_msgSend(v23, "key");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v24, "hasPrefix:", v15))
                  objc_msgSend(v12, "setObject:forKey:", v23, v24);

              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v105, v118, 16);
            }
            while (v20);
          }

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v119, 16);
      }
      while (v14);
    }

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __141__PKConfigurablePassDetailSectionsController__initWithPaymentPass_visibleSectionIdentifiers_clientReservedIdentifiers_renderUnclaimedFields___block_invoke;
    aBlock[3] = &unk_1E3E74928;
    v64 = v72;
    v102 = v64;
    v63 = v70;
    v103 = v63;
    v62 = v67;
    v104 = v62;
    v73 = (void (**)(void *, id, id))_Block_copy(aBlock);
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v25 = v75;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v97, v117, 16);
    v11 = v74;
    v71 = v25;
    if (v26)
    {
      v27 = v26;
      v28 = *(id *)v98;
      v68 = *(id *)v98;
      do
      {
        v29 = 0;
        v76 = v27;
        do
        {
          if (*(id *)v98 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v29);
          objc_msgSend(v30, "identifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v66)
          {
            if ((objc_msgSend(v66, "containsObject:", v31) & 1) == 0)
              goto LABEL_28;
          }
          else if ((objc_msgSend(v30, "isHidden") & 1) != 0)
          {
            goto LABEL_28;
          }
          if (objc_msgSend(v11, "containsObject:", v31))
          {
LABEL_28:
            objc_msgSend(v30, "rows");
            v32 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "removeObjectsForKeys:", v32);
            goto LABEL_40;
          }
          v82 = v31;
          v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v93 = 0u;
          v94 = 0u;
          v95 = 0u;
          v96 = 0u;
          obja = v30;
          objc_msgSend(v30, "rows");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v93, v116, 16);
          if (v34)
          {
            v35 = v34;
            v36 = *(_QWORD *)v94;
            do
            {
              for (k = 0; k != v35; ++k)
              {
                if (*(_QWORD *)v94 != v36)
                  objc_enumerationMutation(v33);
                v38 = *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * k);
                objc_msgSend(v12, "objectForKey:", v38);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                if (v39 && -[PKConfigurablePassDetailSectionsController _validateField:](v84, "_validateField:", v39))
                {
                  objc_msgSend(v12, "removeObjectForKey:", v38);
                  objc_msgSend(v32, "addObject:", v39);
                }

              }
              v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v93, v116, 16);
            }
            while (v35);
          }

          v73[2](v73, obja, v32);
          v11 = v74;
          v27 = v76;
          v28 = v68;
          v25 = v71;
          v31 = v82;
LABEL_40:

          ++v29;
        }
        while (v29 != v27);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v97, v117, 16);
      }
      while (v27);
    }

    objc_msgSend(v12, "allKeys");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    v10 = v65;
    if (v61 && objc_msgSend(v40, "count"))
    {
      v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v89 = 0u;
      v90 = 0u;
      v91 = 0u;
      v92 = 0u;
      objc_msgSend(v65, "backFieldBuckets");
      v69 = (id)objc_claimAutoreleasedReturnValue();
      objb = (id)objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v89, v115, 16);
      if (objb)
      {
        v77 = *(_QWORD *)v90;
        do
        {
          v44 = 0;
          do
          {
            if (*(_QWORD *)v90 != v77)
              objc_enumerationMutation(v69);
            v83 = v44;
            v45 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v44);
            v85 = 0u;
            v86 = 0u;
            v87 = 0u;
            v88 = 0u;
            v46 = v45;
            v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v85, v114, 16);
            if (v47)
            {
              v48 = v47;
              v49 = *(_QWORD *)v86;
              do
              {
                for (m = 0; m != v48; ++m)
                {
                  if (*(_QWORD *)v86 != v49)
                    objc_enumerationMutation(v46);
                  v51 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * m);
                  objc_msgSend(v51, "key");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v41, "containsObject:", v52))
                  {
                    objc_msgSend(v42, "addObject:", v51);
                    objc_msgSend(v43, "addObject:", v52);
                  }

                }
                v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v85, v114, 16);
              }
              while (v48);
            }

            v44 = v83 + 1;
          }
          while ((id)(v83 + 1) != objb);
          objb = (id)objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v89, v115, 16);
        }
        while (objb);
      }

      v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66EE0]), "initWithRows:", v43);
      objc_msgSend(v53, "setInsertAfterSection:", CFSTR("PassesInGroup"));
      v73[2](v73, v53, v42);

      v10 = v65;
      v11 = v74;
      v25 = v71;
    }
    v54 = objc_msgSend(v63, "copy");
    sectionMap = v84->_sectionMap;
    v84->_sectionMap = (NSDictionary *)v54;

    v56 = objc_msgSend(v62, "copy");
    fieldMap = v84->_fieldMap;
    v84->_fieldMap = (NSDictionary *)v56;

    v58 = objc_msgSend(v64, "copy");
    allSectionIdentifiers = v84->_allSectionIdentifiers;
    v84->_allSectionIdentifiers = (NSArray *)v58;

  }
  return v84;
}

void __141__PKConfigurablePassDetailSectionsController__initWithPaymentPass_visibleSectionIdentifiers_clientReservedIdentifiers_renderUnclaimedFields___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v9, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v9, v6);
    v7 = *(void **)(a1 + 48);
    v8 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v7, "setObject:forKey:", v8, v6);

  }
}

- (BOOL)hasArbitraryInfoField:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0D69A38];
  if (objc_msgSend(v4, "hasPrefix:", *MEMORY[0x1E0D69A38]))
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v5, "stringByAppendingString:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  -[NSDictionary allValues](self->_fieldMap, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__PKConfigurablePassDetailSectionsController_hasArbitraryInfoField___block_invoke;
  v12[3] = &unk_1E3E74978;
  v13 = v7;
  v9 = v7;
  v10 = objc_msgSend(v8, "pk_containsObjectPassingTest:", v12);

  return v10;
}

uint64_t __68__PKConfigurablePassDetailSectionsController_hasArbitraryInfoField___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__PKConfigurablePassDetailSectionsController_hasArbitraryInfoField___block_invoke_2;
  v5[3] = &unk_1E3E74950;
  v6 = *(id *)(a1 + 32);
  v3 = objc_msgSend(a2, "pk_containsObjectPassingTest:", v5);

  return v3;
}

uint64_t __68__PKConfigurablePassDetailSectionsController_hasArbitraryInfoField___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

- (id)sectionForIdentifier:(id)a3
{
  return -[NSDictionary objectForKey:](self->_sectionMap, "objectForKey:", a3);
}

- (NSArray)sectionIdentifiers
{
  NSArray *allSectionIdentifiers;

  if (-[PKPaymentPassDetailSectionController currentSegment](self, "currentSegment"))
    allSectionIdentifiers = (NSArray *)MEMORY[0x1E0C9AA60];
  else
    allSectionIdentifiers = self->_allSectionIdentifiers;
  return allSectionIdentifiers;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  void *v4;
  int64_t v5;

  -[NSDictionary objectForKeyedSubscript:](self->_fieldMap, "objectForKeyedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v8;
  id v9;
  NSDictionary *fieldMap;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  PKImageViewCell *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 useBridgeStyle;
  id v25;
  unsigned int v26;
  uint64_t v27;

  v8 = a3;
  v9 = a5;
  fieldMap = self->_fieldMap;
  v11 = a4;
  -[NSDictionary objectForKey:](fieldMap, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "row");

  objc_msgSend(v12, "objectAtIndex:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "valueImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)MEMORY[0x1E0DC3870];
      v17 = v8;
      objc_msgSend(v15, "image");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "imageWithPKImage:", v18);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "dequeueReusableCellWithIdentifier:", CFSTR("imageViewCell"));
      v20 = (PKImageViewCell *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        v20 = -[PKImageViewCell initWithReuseIdentifier:]([PKImageViewCell alloc], "initWithReuseIdentifier:", CFSTR("imageViewCell"));
        -[PKImageViewCell setUserInteractionEnabled:](v20, "setUserInteractionEnabled:", 0);
        -[PKImageViewCell setSelectedBackgroundView:](v20, "setSelectedBackgroundView:", 0);
      }
      v21 = (void *)MEMORY[0x1E0DC3658];
      objc_msgSend(v15, "backgroundColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "pkui_colorWithPKColor:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKImageViewCell setBackgroundColor:](v20, "setBackgroundColor:", v23);

      -[PKImageViewCell setImage:](v20, "setImage:", v19);
    }
    else
    {
      useBridgeStyle = self->_useBridgeStyle;
      v19 = v9;
      v25 = v14;
      objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", v19);
      v20 = (PKImageViewCell *)objc_claimAutoreleasedReturnValue();
      if (!v20)
        v20 = -[PKBackFieldTableCell initWithBridgeStyle:reuseIdentifier:]([PKBackFieldTableCell alloc], "initWithBridgeStyle:reuseIdentifier:", useBridgeStyle, v19);
      -[PKImageViewCell setShowLinks:](v20, "setShowLinks:", 1);
      -[PKImageViewCell setField:](v20, "setField:", v25);

    }
    v26 = objc_msgSend(v14, "isDrillInField");
    if (v26)
      v27 = 3;
    else
      v27 = 0;
    -[PKImageViewCell setAccessoryType:](v20, "setAccessoryType:", v26);
    -[PKImageViewCell setSelectionStyle:](v20, "setSelectionStyle:", v27);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)titleForHeaderInSectionIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_sectionMap, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "header");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)titleForFooterInSectionIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_sectionMap, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "footer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)shouldHighlightRowAtIndexPath:(id)a3 sectionIdentifier:(id)a4
{
  NSDictionary *fieldMap;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  fieldMap = self->_fieldMap;
  v6 = a3;
  -[NSDictionary objectForKey:](fieldMap, "objectForKey:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v9, "isDrillInField");
  return (char)v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id WeakRetained;
  uint64_t v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  -[NSDictionary objectForKey:](self->_fieldMap, "objectForKey:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v9, "row"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && objc_msgSend(v11, "isDrillInField"))
  {
    v12 = v11;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v14 = objc_msgSend(v12, "authRequirement");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __98__PKConfigurablePassDetailSectionsController_tableView_didSelectRowAtIndexPath_sectionIdentifier___block_invoke;
    v16[3] = &unk_1E3E6CA70;
    v16[4] = self;
    v17 = v12;
    v18 = v8;
    v19 = v9;
    v15 = v12;
    objc_msgSend(WeakRetained, "presentAuthRequestForPolicy:completion:", v14, v16);

  }
  else
  {
    objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v9, 1);
  }

}

void __98__PKConfigurablePassDetailSectionsController_tableView_didSelectRowAtIndexPath_sectionIdentifier___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
    objc_msgSend(WeakRetained, "presentPassDetailDrillInForField:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "deselectRowAtIndexPath:animated:", *(_QWORD *)(a1 + 56), 1);
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  NSDictionary *fieldMap;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;

  fieldMap = self->_fieldMap;
  v7 = a4;
  -[NSDictionary objectForKey:](fieldMap, "objectForKey:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "row");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "valueImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "image");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13)
    {
      v17 = 0.0;
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(v13, "size");
    if (v16 <= 184.0)
      v17 = v16;
    else
      v17 = 184.0;
    if (v15 != *MEMORY[0x1E0C9D820] || v16 != *(double *)(MEMORY[0x1E0C9D820] + 8))
      goto LABEL_14;

  }
  v17 = *MEMORY[0x1E0DC53D8];
LABEL_15:

  return v17;
}

- (BOOL)_validateField:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(a3, "valueImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)allSectionIdentifiers
{
  return self->_allSectionIdentifiers;
}

- (PKConfigurablePassDetailSectionsControllerDelegate)delegate
{
  return (PKConfigurablePassDetailSectionsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)useBridgeStyle
{
  return self->_useBridgeStyle;
}

- (void)setUseBridgeStyle:(BOOL)a3
{
  self->_useBridgeStyle = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_allSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_fieldMap, 0);
  objc_storeStrong((id *)&self->_sectionMap, 0);
}

@end
